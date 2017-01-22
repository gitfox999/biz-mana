package me.imvc.app.models.mana;

import java.io.IOException;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.log4j.chainsaw.Main;

import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;
import me.imvc.app.entities.Ssc;
import me.imvc.core.BaseModel;
import me.imvc.until.ExcelUtils;

public class SscModel extends BaseModel {
	private Ssc ssc;
 
    private List<Object[]> list=new ArrayList<Object[]>();
    private List<Object[]> hh;
    private List<String[]> li;
	


	public List<String[]> getLi() {
		return li;
	}

	public void setLi(List<String[]> li) {
		this.li = li;
	}

	public List<Object[]> getHh() {
		return hh;
	}

	public void setHh(List<Object[]> hh) {
		this.hh = hh;
	}

	public List<Object[]> getList() {
		return list;
	}

	public void setList(List<Object[]> list) {
		this.list = list;
	}

	

	public Ssc getSsc() {
		return ssc;
	}

	public void setSsc(Ssc ssc) {
		this.ssc = ssc;
	}

	public Ssc get(Long id) {
		setSsc((Ssc) get(Ssc.class, (Serializable) id));
		return getSsc();
	}

	public void save() {
		save(getSsc());
	}

	public void update(Long id) {
		save(getSsc());
	};

	
	public void delete(Long id) {
		if (id == 0) {
			for (Long nid : getIds()) {
				delete(get(nid));
			}
		}else{
			delete(get(id));
		}
	}
   public List<Object[]> dayLine(){
	   String sql = "";
	   String sqlWhere = "";
	   String start = "";
	   String end = "";
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	   if(getSearchParams() != null){
		   start = ((String[])getSearchParams().get("and_time_ge"))[0].toString();
		   end = ((String[])getSearchParams().get("and_time_le"))[0].toString();
		   sqlWhere = " and time >= '"+start+ "'and time <='"+end+" 23:59:59'";
	   }
	   sql="SELECT DATE_FORMAT(time,'%Y-%m-%d') AS DAY,SUM(income),SUM(allwin) from ssc"
			   + " where income<>0 and allwin<>0 "+sqlWhere+" GROUP BY DAY";
	   hh = (List<Object[]>)getHibernateTemplate().getSession().createSQLQuery(sql).list();
	   
	   if(getSearchParams()!=null){
		   Date dBegin=null;
		   Date dEnd=null;
		   try {
			   dBegin = sdf.parse(start);  
			   dEnd = sdf.parse(end);
		   } catch (ParseException e) {
			   e.printStackTrace();
		   }  
	       List<Date> lDate = findDates(dBegin, dEnd);  
	       for (Date date:lDate) {
	    	   Date te =date;
	    	   boolean ishave = false;
	    	   Object[] obj = new Object[3];
	    	   Object[] objTmp = new Object[3];
	    	   for(Object[] ojec:hh){
	    		   Date da=null;
	    		   try {
	    			   String a=ojec[0].toString();
	    			   da = sdf.parse(a);
	    		   } catch (ParseException e) {
	    			   e.printStackTrace();
	    		   }
	    		   int i=te.compareTo(da);
	    		   if(i==0){   
	    			   ishave=true;
	    			   objTmp = ojec;
	    		   }
	    	   }
	    	   obj[0] = sdf.format(te);
	    	   obj[1] = ishave ? objTmp[1] :0;
	    	   obj[2] = ishave ? objTmp[2] :0;//外循环循环一次内部循环循环一遍
	    	   list.add(obj);
        	}
	       return list;
	   }
	   return hh;
   }
   
   public static List<Date> findDates(Date dBegin, Date dEnd) {  
       List lDate = new ArrayList();  
       //lDate.add(dBegin);  
       Calendar calBegin = Calendar.getInstance();  
       // 使用给定的 Date 设置此 Calendar 的时间    
       calBegin.setTime(dBegin);  
       Calendar calEnd = Calendar.getInstance();  
       // 使用给定的 Date 设置此 Calendar 的时间    
       calEnd.setTime(dEnd);  
       // 测试此日期是否在指定日期之后    
        lDate.add(dBegin);
       while (dEnd.after(calBegin.getTime())) { 
       	calBegin.add(Calendar.DAY_OF_MONTH, 1);
       	lDate.add(calBegin.getTime());
       	
       }
       return lDate;
	}
  public List<Object[]> dayPie(){
	 String start="";
	 String end="";
	 String sqlWhere="";
	 String sql="";
	 if(getSearchParams()!=null){
		 start=((String[])getSearchParams().get("and_time_ge"))[0].toString();
		 end=((String[])getSearchParams().get("and_time_le"))[0].toString();
		 sqlWhere="AND time>='"+start+"' AND time <='"+end+" 23:59:59'";
	 }
	 sql="SELECT DATE_FORMAT(time,'%y-%m-%d') AS DAY,SUM(income),SUM(allwin) FROM ssc WHERE income<>0 AND allwin<>0 "+sqlWhere+" GROUP BY DAY";
	 
	 return (List<Object[]>) getHibernateTemplate().
	                         getSession().
	                         createSQLQuery(sql).list();
  }
 public List<Object[]> dayColumn(){
	 String sql="";
	 String start="";
	 String end="";
	 String sqlWhere="";
	 SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
	 if(getSearchParams()!=null){
		 start=((String[])getSearchParams().get("and_time_ge"))[0].toString();
		 end=((String[])getSearchParams().get("and_time_le"))[0].toString();
		 sqlWhere="and time >='"+start+"' and time<='"+end+" 23:59:59'";
	 }
	 sql="SELECT DATE_FORMAT(time,'%Y-%m-%d') AS DAY,SUM(income),SUM(allwin) from ssc"
			   + " where income<>0 and allwin<>0 "+sqlWhere+" GROUP BY DAY";
	   hh = (List<Object[]>)getHibernateTemplate().getSession().createSQLQuery(sql).list();
	 if(getSearchParams()!=null){
		 Date dbegin=null;
		 Date dend=null;
		 try {
			 dbegin=format.parse(start);
			 dend=format.parse(end);
		 } catch (ParseException e) {
			 // TODO Auto-generated catch block
			 e.printStackTrace();
		 }
		 List<Date> lDate=findDates(dbegin,dend);
		 for(Date date:lDate){
			 Date te=date;
			 boolean ishave=false;
			 Object[] obje = new Object[3];
			 Object[] objtmp = new Object[3];
			 for(Object[] obj:hh){
				 Date da=null;
				 try {
					 String a = obj[0].toString();
					 da=format.parse(a);
				 } catch (ParseException e) {
					 // TODO Auto-generated catch block
					 e.printStackTrace();
				 }
				 int i=te.compareTo(da);
				 if(i==0){
					 ishave=true;
					 objtmp=obj;
				 }
			 }
			 	obje[0]=format.format(te);
			 	obje[1]=ishave?objtmp[1]:0;
			 	obje[2]=ishave?objtmp[2]:0;
			 	list.add(obje);
		 }
		 return list;
	 	}
	 return hh;
 	}
 public List<Object[]> orderList(){
	 String sql="";
	 String start="";
	 String end="";
	 String sqlWhere="";
	
	 if(getSearchParams()!=null){
		 start=((String[])getSearchParams().get("and_time_ge"))[0].toString();
		 end=((String[])getSearchParams().get("and_time_le"))[0].toString();
		 if(start=="" && end==""){
			 sqlWhere="";
		 }else{
			 sqlWhere="and time >='"+start+" 00:00:00' and time <='"+end+" 23:59:59'";
		 }
	 }
	 sql="SELECT DATE_FORMAT(time,'%Y-%m-%d') AS DAY,SUM(income) FROM ssc WHERE income<>0 "+sqlWhere+" GROUP BY DAY ORDER BY DAY DESC";
	 list = (List<Object[]>)getHibernateTemplate().getSession().createSQLQuery(sql).list();
	 return list;
 }
 public void updateExportOrder(){
	 String start="";
	 String end="";
	 String sql="";
	 String sqlWhere="";
	 start=((String[])getSearchParams().get("and_time_ge"))[0].toString();
	 end=((String[])getSearchParams().get("and_time_le"))[0].toString();
	 sqlWhere="and time>='"+start+"' and time <='"+end+"'";
	 sql = "SELECT DATE_FORMAT(time,'%Y-%m-%d') AS DAY,SUM(income) FROM ssc WHERE income<>0 "+sqlWhere+" GROUP BY DAY ORDER BY DAY DESC";
	 list=(List<Object[]>)getHibernateTemplate().getSession().createSQLQuery(sql).list();
	 java.text.DecimalFormat df =new java.text.DecimalFormat("#.00");
	 String[] headline={"日期","金额"};
	 String[][]contents=new String[headline.length][list.size()]; 
	 for(int i=0;i<list.size();i++){
		 Object[] obj=list.get(i);
		 contents[0][i]=(String)obj[0];
		 contents[1][i]=String.valueOf(obj[1]);
	 }
	 try {
		 ExcelUtils.createExcel(headline,contents,"订单信息");
		} catch (Exception e) {
			// TODO: handle exception
		}
 }
}
package me.imvc.app.models.mana;

import java.io.Serializable;
import me.imvc.app.entities.Member;
import me.imvc.core.BaseModel;

public class MemberModel extends BaseModel {
	private Member member;

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Member get(Long id) {
		setMember((Member) get(Member.class, (Serializable) id));
		return getMember();
	}

	public void save() {
		save(getMember());
	}

	public void update(Long id) {
		save(getMember());
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

}

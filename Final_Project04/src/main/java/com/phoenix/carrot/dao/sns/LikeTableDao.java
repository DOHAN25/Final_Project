package com.phoenix.carrot.dao.sns;

import com.phoenix.carrot.dto.sns.EntireBoardDto;
import com.phoenix.carrot.dto.sns.LikeTableDto;

public interface LikeTableDao {
	
	String NAMESPACE = "liketable.";
	
	public EntireBoardDto pictureSaveHeart (LikeTableDto dto);
	
	public EntireBoardDto pictureRemoveHeart(LikeTableDto dto);

}

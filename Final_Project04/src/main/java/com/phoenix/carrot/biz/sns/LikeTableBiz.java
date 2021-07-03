package com.phoenix.carrot.biz.sns;

import com.phoenix.carrot.dto.sns.EntireBoardDto;
import com.phoenix.carrot.dto.sns.LikeTableDto;

public interface LikeTableBiz {
	
	public EntireBoardDto pictureSaveHeart (LikeTableDto dto);
	
	public EntireBoardDto pictureRemoveHeart(LikeTableDto dto);

}

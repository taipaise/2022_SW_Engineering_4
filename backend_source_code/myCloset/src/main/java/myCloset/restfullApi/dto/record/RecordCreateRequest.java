package myCloset.restfullApi.dto.record;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import myCloset.restfullApi.entity.cloth.Cloth;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@ApiModel(value = "레코드 생성")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecordCreateRequest {

    @ApiModelProperty(value = "상의", notes = "상의를 입력해주세요", example = "상의 사진")
    private Cloth clothTop;

    @ApiModelProperty(value = "하의", notes = "하의를 입력해주세요", example = "하의 사진")
    private Cloth clothBottom;

    @ApiModelProperty(value = "아우터", notes = "아우터를 입력해주세요", example = "아우터 사진")
    private Cloth clothOuter;

    @ApiModelProperty(value = "신발", notes = "신발을 입력해주세요", example = "신발 사진")
    private Cloth clothShoes;

    @ApiModelProperty(value = "점수", notes = "점수를 입력해주세요", example = "3")
    private int rating;

    @ApiModelProperty(value = "코멘트", notes = "코멘트를 입력해주세요", example = "화창한 날에 잘 어울리는 옷이다.")
    private String comment;
    
}

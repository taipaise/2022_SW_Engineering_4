package myCloset.restfullApi.dto.cloth;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@ApiModel(value = "옷 데이터 수정")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClothDeleteRequest {

    @ApiModelProperty(value = "닉네임", notes = "수정할 닉네임을 입력해주세요(수정 사항 없으면 기존 값 입력)", required = true, example = "애용하는 옷")
    private Long id;

}

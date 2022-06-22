package myCloset.restfullApi.dto.cloth;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

@ApiModel(value = "옷 데이터 수정")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClothUpdateRequest {

    @ApiModelProperty(value = "닉네임", notes = "수정할 닉네임을 입력해주세요(수정 사항 없으면 기존 값 입력)", required = true, example = "애용하는 옷")
    @NotBlank(message = "{ClothUpdateRequest.originName.NotBlank}")
    private String originName;

    @ApiModelProperty(value = "옷 종류", notes = "수정할 옷 종류를 입력해주세요(수정 사항 없으면 기존 값 입력)", required = true, example = "상의")
    @NotBlank(message = "{ClothUpdateRequest.featureCategory.NotBlank}")
    private String featureCategory;

    @ApiModelProperty(value = "옷을 입는 계절", notes = "수정할 옷을 입는 계절을 입력해주세요(수정 사항 없으면 기존 값 입력)", required = true, example = "겨울")
    @NotBlank(message = "{ClothUpdateRequest.seasonCategory.NotBlank}")
    private String seasonCategory;
}

package myCloset.restfullApi.dto.record;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@ApiModel(value = "레코드 삭제")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecordDeleteRequest {
    @ApiModelProperty(value = "레코드 pk", notes = "삭제할 레코드의 pk를 입력해주세요", example = "1")
    private Long id;
}

package myCloset.restfullApi.entity.cloth;


import lombok.*;

import javax.persistence.*;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Cloth {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String uniqueName;

    @Column(nullable = false)
    private String originName;

    @Column(nullable = false)
    private String featureCategory;

    @Column(nullable = false)
    private String seasonCategory;

    @Column(nullable = false)
    private String filePath;

    public Cloth(String originName, String uniqueName, String featureCategory, String seasonCategory, String filePath) {
        this.originName = originName;
        this.uniqueName = uniqueName;
        this.featureCategory = featureCategory;
        this.seasonCategory = seasonCategory;
        this.filePath = filePath;
    }
}

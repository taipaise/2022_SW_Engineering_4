package myCloset.restfullApi.entity.record;

import myCloset.restfullApi.entity.cloth.Cloth;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
//@RequiredArgsConstructor(access = AccessLevel.PROTECTED)
@EntityListeners(AuditingEntityListener.class)
public class Record {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "clothes")
    private List<Cloth> clothes;

    @Column
    private int rating;

    @Column
    private String comment;

    @Column
    private LocalDate localDate;

    public Record(Cloth clothTop, Cloth clothBottom, Cloth clothOuter, Cloth clothShoes, int rating, String comment) {
        clothes.add(clothTop);
        clothes.add(clothBottom);
        clothes.add(clothOuter);
        clothes.add(clothShoes);
        this.rating = rating;
        this.comment = comment;
    }
}

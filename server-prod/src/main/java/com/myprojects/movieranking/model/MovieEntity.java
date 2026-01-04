package com.myprojects.movieranking.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;


@Table(name = "movies")
@Entity(name = "Movie")
@Getter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
public class MovieEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    @Column(name = "abis_review", columnDefinition = "TEXT")
    private String abisReview;
    @Column(name = "abis_rating")
    private Integer abisRating;
    @Column(name = "year_abi_reviewed")
    private Integer yearAbiReviewed;
    private String sequel;
    @Column (name = "poster_url", length = 2048)
    private String posterUrl;

    public void setPosterUrl(PosterUrlData posterUrl) {
        this.posterUrl = posterUrl.poster();
    }
}
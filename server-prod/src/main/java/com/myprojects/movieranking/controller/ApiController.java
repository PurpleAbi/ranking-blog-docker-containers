package com.myprojects.movieranking.controller;


import com.myprojects.movieranking.model.CombinedMovieSeriesList;
import com.myprojects.movieranking.model.SeriesDTO;
import com.myprojects.movieranking.model.MovieDTO;
import com.myprojects.movieranking.service.MovieService;
import com.myprojects.movieranking.service.SeriesService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class ApiController {

    private final SeriesService seriesService;
    private final MovieService movieService;

    public ApiController(SeriesService seriesService, MovieService movieService) {
        this.seriesService = seriesService;
        this.movieService = movieService;
    }

    // Combined endpoint: returns both lists in one JSON object
    @GetMapping("/topRated")
    public CombinedMovieSeriesList getTop3Both() {
        return new CombinedMovieSeriesList(movieService.getTop3Movies(), seriesService.getTop3Series());
    }

    // Only match 4-digit year paths to avoid catching static resource requests
    @GetMapping("/{year:\\d{4}}")
    public CombinedMovieSeriesList getByYearBoth(@PathVariable Integer year) {
        List<MovieDTO> movies = movieService.getMoviesByYear(year);
        List<SeriesDTO> series = seriesService.getSeriesByYear(year);
        return new CombinedMovieSeriesList(movies, series);
    }


}


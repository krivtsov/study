module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        total = array.each_with_object({ sum_rating_kinopoisk: 0, films_count: 0 }) do |film, memo|
          count_country = film['country'] ? film['country'].split(',').length : 0
          rating_kinopoisk = film['rating_kinopoisk'].to_f
          if count_country > 1 && rating_kinopoisk.positive?
            memo[:sum_rating_kinopoisk] += rating_kinopoisk
            memo[:films_count] += 1
          end
          memo
        end
        total[:sum_rating_kinopoisk] / total[:films_count]
      end

      def chars_count(films, threshold)
        total = films.reduce(0) do |memo, film|
          rating_kinopoisk = film['rating_kinopoisk'].to_f
          if rating_kinopoisk >= threshold
            count_letter = film['name'].count('и')
            memo += count_letter
          end
          memo
        end
        total
      end
    end
  end
end

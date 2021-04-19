module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_films =
          array
          .select { |film| film['rating_kinopoisk'].to_f.positive? }
          .select { |film| film['country'] }
          .select { |film| film['country'].split(',').length > 1 }

        films_count = filtered_films.length

        total_rating = filtered_films.reduce(0) do |memo, film|
          memo += film['rating_kinopoisk'].to_f
          memo
        end

        avg_rating = total_rating / films_count
        avg_rating
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

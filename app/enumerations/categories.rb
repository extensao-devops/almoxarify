class Categories < EnumerateIt::Base
    associate_values(
        :tool,
        :material,
        :non_perishable
    )
end
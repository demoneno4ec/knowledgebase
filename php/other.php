<?php
/**
 * Склонения слова в зависмости от числа перед ним
 *
 * @param  int  $nubmer
 * @param  array  $words  - (число, числа, чисел)
 *
 * @return mixed
 */
function declension_words(int $nubmer, array $words)
{
    $index = getIndexWordByNumber($nubmer);
    return $words[$index];

    function getIndexWordByNumber($nubmer)
    {
        if (checkIndexOne($nubmer)) {
            return checkIndexZero($nubmer) ? 0 : 1;
        }

        return checkIndexZero($nubmer) ? 0 : 2;
    }

    function checkIndexOne($nubmer)
    {
        return $nubmer > 1 && $nubmer <= 4;
    }

    function checkIndexZero($nubmer)
    {
        return ($nubmer = ($nubmer %= 100) > 19 ? ($nubmer % 10) : $nubmer) === 1;
    }
}

?>
<?php
if (!function_exists('get_config')):
    function get_config($option = ''){
        $row = \DB::table('website_configs')->select('value')->where('name', $option)->first();
        if (is_null($row)) {
            return null;
        } else {
            return $row->value;
        }
        return null;
    }
endif;

if (!function_exists('set_config')):
    function set_config($name = '', $value = ''){
        $row = \DB::table('website_configs')->select('value')->where('name', $name)->first();
        if (is_null($row) OR $row == false) {
            \DB::table('website_configs')->insert(['name' => $name, 'value' => $value]);
        } else {
            \DB::table('website_configs')->where('name', $name)->update(['value' => $value]);
        }
    }
endif;

if (!function_exists('convert_string')):
    function convert_string($string = ''){
        $convert = strtr($string, [
            '{{ WEBSITE_TITLE }}' => get_config('title')
        ]);
        return $convert;
    }
endif;

if (!function_exists('currency')) {
    function currency($value = null){
      $currency = number_format($value, 0, ".", ".");
      return $currency;
    }
}

if (!function_exists('sum_date')):
    function sum_date($date = '', $parameter = null) {
        return date("Y-m-d H:i:s", strtotime(date("Y-m-d H:i:s", strtotime($date)).$parameter));
    }
endif;

if (!function_exists('diff_date')):
    function diff_date($date_a = '', $date_b = '') {
        $date_a = \Carbon\Carbon::parse(date_create($date_a));
        $date_b = \Carbon\Carbon::parse(date_create($date_b));
        $diff = date_diff($date_a, $date_b);
        return $diff->format("%R%a");
    }
endif;

if (!function_exists('list_date_range')):
    function list_date_range($start = '', $end = '', $format = 'Y-m-d') {
        $start = \Carbon\Carbon::parse($start);
        $end = \Carbon\Carbon::parse($end);
        $end = new DateTime($end);
        $end = $end->add(new DateInterval('P1D'))->format('Y-m-d');

        $period = new DatePeriod(
            new DateTime($start),
            new DateInterval('P1D'),
            new DateTime($end)
        );
        $date_list = [];
        foreach ($period as $key => $value) {
            $date_list[] = $value->format($format);
        }
        return $date_list;
    }
endif;

if (!function_exists('format_datetime')):
    function format_datetime($a) {
        $a = \Carbon\Carbon::parse($a);
        $month = [
            '01' => 'Januari',
            '02' => 'Februari',
            '03' => 'Maret',
            '04' => 'April',
            '05' => 'Mei',
            '06' => 'Juni',
            '07' => 'Juli',
            '08' => 'Agustus',
            '09' => 'September',
            '10' => 'Oktober',
            '11' => 'November',
            '12' => 'Desember',
        ];
        $split = explode(" ", $a);
        $date = explode("-", $split[0]);
        $format_date = $date[2].' '.$month[$date[1]].' '.$date[0];
        return $format_date.', '.$split[1];
    }
endif;

if (!function_exists('format_date')):
    function format_date($a) {
        $a = \Carbon\Carbon::parse($a);
        $month = [
            '01' => 'Januari',
            '02' => 'Februari',
            '03' => 'Maret',
            '04' => 'April',
            '05' => 'Mei',
            '06' => 'Juni',
            '07' => 'Juli',
            '08' => 'Agustus',
            '09' => 'September',
            '10' => 'Oktober',
            '11' => 'November',
            '12' => 'Desember',
        ];
        $split = explode(" ", $a);
        $date = explode("-", $split[0]);
        $format_date = $date[2].' '.$month[$date[1]].' '.$date[0];
        return $format_date;
    }
endif;

if (!function_exists('makeValidator')):
    function makeValidator(array $data, array $rules, array $messages = [], array $customAttributes = []) {
        return \Illuminate\Support\Facades\Validator::make($data, $rules, $messages, $customAttributes);
    }
endif;
if (!function_exists('makeSlug')):
    function makeSlug($title, $separator = '-', $language = 'en'){
        return Illuminate\Support\Str::slug(strtolower($title), $separator, $language);
    }
endif;
if (!function_exists('parseCarbon')):
    function parseCarbon($date = ''){
        return \Carbon\Carbon::parse($date);
    }
endif;

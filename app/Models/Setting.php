<?php

namespace App\Models;

use App\Models\Base as Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
// use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * @SWG\Definition(
 *      definition="Setting",
 *      required={"name", "value"},
 *      @SWG\Property(
 *          property="id",
 *          description="id",
 *          type="integer",
 *          format="int32"
 *      ),
 *      @SWG\Property(
 *          property="serial_number",
 *          description="serial_number",
 *          type="string"
 *      ),
 *      @SWG\Property(
 *          property="additional_info",
 *          description="additional_info",
 *          type="string"
 *      ),
 *      @SWG\Property(
 *          property="attlog_stamp",
 *          description="attlog_stamp",
 *          type="integer",
 *          format="int32"
 *      ),
 *      @SWG\Property(
 *          property="operlog_stamp",
 *          description="operlog_stamp",
 *          type="integer",
 *          format="int32"
 *      ),
 *      @SWG\Property(
 *          property="attphotolog_stamp",
 *          description="attphotolog_stamp",
 *          type="integer",
 *          format="int32"
 *      ),
 *      @SWG\Property(
 *          property="error_delay",
 *          description="error_delay",
 *          type="integer",
 *          format="int32"
 *      ),
 *      @SWG\Property(
 *          property="delay",
 *          description="delay",
 *          type="integer",
 *          format="int32"
 *      ),
 *      @SWG\Property(
 *          property="trans_times",
 *          description="trans_times",
 *          type="string"
 *      ),
 *      @SWG\Property(
 *          property="trans_interval",
 *          description="trans_interval",
 *          type="integer",
 *          format="int32"
 *      ),
 *      @SWG\Property(
 *          property="trans_flag",
 *          description="trans_flag",
 *          type="string"
 *      ),
 *      @SWG\Property(
 *          property="timezone",
 *          description="timezone",
 *          type="integer",
 *          format="int32"
 *      ),
 *      @SWG\Property(
 *          property="realtime",
 *          description="realtime",
 *          type="boolean"
 *      ),
 *      @SWG\Property(
 *          property="encrypt",
 *          description="encrypt",
 *          type="boolean"
 *      ),
 *      @SWG\Property(
 *          property="server_version",
 *          description="server_version",
 *          type="string"
 *      ),
 *      @SWG\Property(
 *          property="table_name_stamp",
 *          description="table_name_stamp",
 *          type="string"
 *      )
 * )
 */
class Setting extends Model
{
    use HasFactory;
    //     use SoftDeletes;

    public $table = 'settings';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];



    public $fillable = [
        'name',
        'value'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'name' => 'string',
        'value' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required|string|max:255',
        'value' => 'required|string|max:255'
    ];

    
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laraveldaily\Quickadmin\Observers\UserActionsObserver;


use Illuminate\Database\Eloquent\SoftDeletes;

class Students extends Model {

    use SoftDeletes;

    /**
    * The attributes that should be mutated to dates.
    *
    * @var array
    */
    protected $dates = ['deleted_at'];

    protected $table    = 'students';
    
    protected $fillable = [
          'studentgroups_id',
          'name'
    ];
    

    public static function boot()
    {
        parent::boot();

        Students::observe(new UserActionsObserver);
    }
    
    public function studentgroups()
    {
        return $this->hasOne('App\StudentGroups', 'id', 'studentgroups_id');
    }


    
    
    
}
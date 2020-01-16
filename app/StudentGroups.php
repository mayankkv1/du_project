<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laraveldaily\Quickadmin\Observers\UserActionsObserver;


use Illuminate\Database\Eloquent\SoftDeletes;

class StudentGroups extends Model {

    use SoftDeletes;

    /**
    * The attributes that should be mutated to dates.
    *
    * @var array
    */
    protected $dates = ['deleted_at'];

    protected $table    = 'studentgroups';
    
    protected $fillable = [
          'maingroups_id',
          'name'
    ];
    

    public static function boot()
    {
        parent::boot();

        StudentGroups::observe(new UserActionsObserver);
    }
    
    public function maingroups()
    {
        return $this->hasOne('App\MainGroups', 'id', 'maingroups_id');
    }

    public function students()
    {
        return $this->belongsTo('App\Students', 'studentgroups_id', 'id');
    }



    
    
    
}
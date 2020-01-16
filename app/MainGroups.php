<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laraveldaily\Quickadmin\Observers\UserActionsObserver;


use Illuminate\Database\Eloquent\SoftDeletes;

class MainGroups extends Model {

    use SoftDeletes;

    /**
    * The attributes that should be mutated to dates.
    *
    * @var array
    */
    protected $dates = ['deleted_at'];

    protected $table    = 'maingroups';
    
    protected $fillable = ['name'];
    

    public static function boot()
    {
        parent::boot();

        MainGroups::observe(new UserActionsObserver);
    }
    
    
    
    
}
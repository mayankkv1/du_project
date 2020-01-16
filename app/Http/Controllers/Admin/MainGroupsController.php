<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Redirect;
use Schema;
use App\MainGroups;
use App\Http\Requests\CreateMainGroupsRequest;
use App\Http\Requests\UpdateMainGroupsRequest;
use Illuminate\Http\Request;



class MainGroupsController extends Controller {

	/**
	 * Display a listing of maingroups
	 *
     * @param Request $request
     *
     * @return \Illuminate\View\View
	 */
	public function index(Request $request)
    {
        $maingroups = MainGroups::all();

		return view('admin.maingroups.index', compact('maingroups'));
	}

	/**
	 * Show the form for creating a new maingroups
	 *
     * @return \Illuminate\View\View
	 */
	public function create()
	{
	    
	    
	    return view('admin.maingroups.create');
	}

	/**
	 * Store a newly created maingroups in storage.
	 *
     * @param CreateMainGroupsRequest|Request $request
	 */
	public function store(CreateMainGroupsRequest $request)
	{
	    
		MainGroups::create($request->all());

		return redirect()->route(config('quickadmin.route').'.maingroups.index');
	}

	/**
	 * Show the form for editing the specified maingroups.
	 *
	 * @param  int  $id
     * @return \Illuminate\View\View
	 */
	public function edit($id)
	{
		$maingroups = MainGroups::find($id);
	    
	    
		return view('admin.maingroups.edit', compact('maingroups'));
	}

	/**
	 * Update the specified maingroups in storage.
     * @param UpdateMainGroupsRequest|Request $request
     *
	 * @param  int  $id
	 */
	public function update($id, UpdateMainGroupsRequest $request)
	{
		$maingroups = MainGroups::findOrFail($id);

        

		$maingroups->update($request->all());

		return redirect()->route(config('quickadmin.route').'.maingroups.index');
	}

	/**
	 * Remove the specified maingroups from storage.
	 *
	 * @param  int  $id
	 */
	public function destroy($id)
	{
		MainGroups::destroy($id);

		return redirect()->route(config('quickadmin.route').'.maingroups.index');
	}

    /**
     * Mass delete function from index page
     * @param Request $request
     *
     * @return mixed
     */
    public function massDelete(Request $request)
    {
        if ($request->get('toDelete') != 'mass') {
            $toDelete = json_decode($request->get('toDelete'));
            MainGroups::destroy($toDelete);
        } else {
            MainGroups::whereNotNull('id')->delete();
        }

        return redirect()->route(config('quickadmin.route').'.maingroups.index');
    }

}

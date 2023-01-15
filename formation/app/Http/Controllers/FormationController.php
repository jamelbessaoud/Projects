<?php

namespace App\Http\Controllers;
use App\Models\Formation;

use Illuminate\Http\Request;

class FormationController extends Controller
{
    //

    //work with the method GET
    public function index(){
        //use get() or all() they do give the same result
        $test = Formation::GET();

        return response($test,200);
    }

    //works with the method POST
    public function store(Request $request){
        $data = $request->validate([
            'id_formation'=>'required',
            'nom_formation'=>'required',
            'description_formation'=>'required',
            'id_categorie'=>'required',
            'photo_formation'=>'required'
        ]);

        $formation =Formation::create($data);
        return response($formation,200);
    }

    //it work with PUT  but use  POST
    public function update(Request $request,$id){
        $data=$request->validate([
            'id_formation'=>'required',
            'nom_formation'=>'required',
            'description_formation'=>'required',
            'id_categorie'=>'required',
            'photo_formation'=>'required'


        ]);
        $formation=Formation::where('id_formation',$id)->update($data,$id);
        return response($formation,200);

    }

    //it works with the method DELETE
    public function destroy($id){
        //first method
        // $formation =Formation::find($id);
        // $formation->delete();

        //or this second method
        $formation=Formation::where('id_formation' , $id)->delete();

        return response('the formation is deleted ',200);
    }


    //it works with the method GET
    public function get_formation_by_nom($nom){

        $formation=Formation::where('nom_formation' , $nom)->get();

        return response($formation,200);
    }
    // search for a course by id
    public function get_formation_by_id($id){

        $formation=Formation::where('id_formation' , $id)->get();

        return response($formation,200);
    }

}

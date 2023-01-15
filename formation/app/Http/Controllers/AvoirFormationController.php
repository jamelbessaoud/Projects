<?php

namespace App\Http\Controllers;

use App\Models\Avoir_formation;
use App\Models\Formation;
use Illuminate\Http\Request;

class AvoirFormationController extends Controller //,Formation
{

    //work with the method GET
    public function index(){
        //use get() or all() they do give the same result
        $test = Avoir_formation::GET();

        return response($test,200);
    }

    //works with the method POST
    public function store(Request $request){
        $data = $request->validate([
            'id_avoir_formation'=>'required',
            'id_utilisateur'=>'required',
            'id_formation'=>'required']);
            // $ob = new Formation();
            // $ob->setFillabel();

        $avoir_formation =Avoir_formation::create($data);
        return response($avoir_formation,200);
    }

    //it work with PUT  but use  POST
    public function update(Request $request,$id){
        $data=$request->validate([
            'id_avoir_formation'=>'required',
            'id_utilisateur'=>'required',
            'id_formation'=>'required'

        ]);

        $avoir_formation=Avoir_formation::where('id_avoir_formation',$id)->update($data,$id);
        return response($avoir_formation,200);

    }

    //it works with the method DELETE
    public function destroy($id){
        //first method
        // $formation =Formation::find($id);
        // $formation->delete();

        //or this second method
        $avoir_formation=Avoir_formation::
        where('id_avoir_formation' , $id)->delete();

        return response('the formation is deleted ',200);
    }


    //it works with the method GET
    public function get_avoir_formation_by_id($id){
        //$avoir_formation=Avoir_formation::where('id_formation' , $id_formation)::where('id_utilisateur' , $id_utilisateur)->get();
        $avoir_formation=Avoir_formation::where('id_avoir_formation' , $id)->get();

        return response($avoir_formation,200);
    }
}

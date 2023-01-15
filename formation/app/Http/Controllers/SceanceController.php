<?php

namespace App\Http\Controllers;

use App\Models\Sceance;
use Illuminate\Http\Request;

class SceanceController extends Controller
{

    //work with the method GET
    public function index(){
        //use get() or all() they do give the same result
        $test = Sceance::GET();

        return response($test,200);
    }

    //works with the method POST
    public function store(Request $request){
        $data = $request->validate([
            'id_sceance'=>'required',
            'nom_sceance'=>'required',
            'description_sceance'=>'required',
            'id_formation'=>'required',
            'video_sceance'=>'required']);

        $sceance =Sceance::create($data);
        return response($sceance,200);
    }

    //it work with PUT  but use  POST
    public function update(Request $request,$id){
        $data=$request->validate([
            'id_sceance'=>'required',
            'nom_sceance'=>'required',
            'description_sceance'=>'required',
            'id_formation'=>'required',
            'video_sceance'=>'required'


        ]);
        $sceance=Sceance::where('id_sceance',$id)->update($data,$id);
        return response($sceance,200);

    }

    //it works with the method DELETE
    public function destroy($id){
        //first method
        // $sceance =sceance::find($id);
        // $sceance->delete();

        //or this second method
        $sceance=Sceance::where('id_sceance' , $id)->delete();

        return response('the sceance is deleted ',200);
    }


    //it works with the method GET
    public function get_sceance_by_nom($nom){

        $sceance=Sceance::where('nom_sceance' , $nom)->get();

        return response($sceance,200);
    }

    //get sceance by id formation
        public function get_sceance_by_id_formation($id){

        $sceance=Sceance::where('id_formation' , $id)->get();

        return response($sceance,200);
    }
    //get sceance by id sceance
        public function get_sceance_by_id_sceance($id){

        $sceance=Sceance::where('id_sceance' , $id)->get();

        return response($sceance,200);
    }
}

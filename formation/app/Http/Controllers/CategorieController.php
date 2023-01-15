<?php

namespace App\Http\Controllers;

use App\Models\Categorie;
use Illuminate\Http\Request;

class CategorieController extends Controller
{
    //

    //work with the method GET
    public function index(){
        //use get() or all() they do give the same result
        $test = Categorie::GET();

        return response($test,200);
    }

    //works with the method POST
    public function store(Request $request){
        $data = $request->validate([
            'id_categorie'=>'required',
            'nom_categorie'=>'required',
            'description_categorie'=>'required']);

        $categorie =Categorie::create($data);
        return response($categorie,200);
    }

    //it work with PUT  but use  POST
    public function update(Request $request,$id){
        $data=$request->validate([
            'id_categorie'=>'required',
            'nom_categorie'=>'required',
            'description_categorie'=>'required'

        ]);
        $categorie=Categorie::where('id_categorie',$id)->update($data,$id);
        return response($categorie,200);

    }

    //it works with the method DELETE
    public function destroy($id){
        //first method
        // $categorie =categorie::find($id);
        // $categorie->delete();

        //or this second method
        $categorie=Categorie::where('id_categorie' , $id)->delete();

        return response('the categorie is deleted ',200);
    }


    //it works with the method GET
    public function get_categorie_by_nom($nom){

        $categorie=Categorie::where('nom_categorie' , $nom)->get();

        return response($categorie,200);
    }
}

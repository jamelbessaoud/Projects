<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Validation\Rules\Unique;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('utilisateurs', function (Blueprint $table) {
            // we need to change the primary key to id (increment automatcly)

            $table->increments('id_utilisateur');
            // $table->primary('id_utilisateur');
            $table->string('nom_utilisateur',20);
            $table->string('prenom_utilisateur',20);
            $table->string('age_utilisateur',3);
            $table->string('email_utilisateur',30)->unique();
            $table->string('pwd_utilisateur',20);
            $table->string('telephone_utilisateur',20);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('utilisateurs');
    }
};

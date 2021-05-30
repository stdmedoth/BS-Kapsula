<?php 

/*
|--------------------------------------------------------------------------
| Disable direct access
|--------------------------------------------------------------------------
|
*/

# Make sure admin is logged in
authenticate_admin();

# Make sure table does not exist before creating the table
if (!db_table_exist('app_kapsula_infos')) {
    DB::schema()->create('app_kapsula_infos', function ($table) {
        $table->increments('id');
        $table->string('nome_loja')->nullable();
        $table->text('token')->nullable();
        $table->timestamps();
    });
}

# Make sure table does not exist before creating the table
if (!db_table_exist('app_kapsula_produtos')) {
    DB::schema()->create('app_kapsula_produtos', function ($table) {
        $table->increments('id');
        $table->string('id_kapsula')->nullable();
        $table->string('id_pacote')->nullable();
        $table->string('nome_pacote')->nullable();
        $table->timestamps();
    });
}

# Make sure table does not exist before creating the table
if (!db_table_exist('app_kapsula_clientes')) {
    DB::schema()->create('app_kapsula_clientes', function ($table) {
        $table->increments('id');
        $table->string('id_kapsula')->nullable();
        $table->string('id_cliente')->nullable();
        $table->string('nome_cliente')->nullable();
        $table->timestamps();
    });
}

# Make sure table does not exist before creating the table
if (!db_table_exist('app_kapsula_pedidos')) {
    DB::schema()->create('app_kapsula_pedidos', function ($table) {
        $table->increments('id');
        $table->string('id_kapsula')->nullable();
        $table->string('id_pedido')->nullable();
        $table->string('nome_cliente')->nullable();
        $table->timestamps();
    });
}
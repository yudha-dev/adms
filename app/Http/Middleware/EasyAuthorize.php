<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Contracts\Auth\Access\Gate;

class EasyAuthorize
{
    /**
     * The gate instance.
     *
     * @var \Illuminate\Contracts\Auth\Access\Gate
     */
    protected $gate;

    /**
     * Create a new middleware instance.
     *
     * @param  \Illuminate\Contracts\Auth\Access\Gate  $gate
     * @return void
     */
    public function __construct(Gate $gate)
    {
        $this->gate = $gate;
    }

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string  $ability
     * @param  array|null  ...$models
     * @return mixed
     *
     * @throws \Illuminate\Auth\AuthenticationException
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function handle($request, Closure $next)
    {   
        $mapPermission = [
            'index' => 'index',
            'store' => 'create',
            'create' => 'create',
            'show' => 'index',
            'destroy' => 'delete',
            'update' => 'update',
            'edit' => 'update',
        ];
        $route = $request->route()->getName();
        $tmp = explode('.', $route);
        $arrLength = count($tmp);
        $ability = \Str::snake($tmp[$arrLength-2]).'-'.$mapPermission[$tmp[$arrLength-1]] ?? $tmp[$arrLength-1];        
        $this->gate->authorize($ability);

        return $next($request);
    }
}

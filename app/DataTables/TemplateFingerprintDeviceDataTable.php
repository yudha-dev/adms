<?php

namespace App\DataTables;

use App\Models\TemplateFingerprintDevice;
use App\DataTables\BaseDataTable as DataTable;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Html\Column;

class TemplateFingerprintDeviceDataTable extends DataTable
{
    private $baseRoute;
    private $baseView;
    /**
    * example mapping filter column to search by keyword, default use %keyword%
    */
    private $columnFilterOperator = [
        //'name' => \App\DataTables\FilterClass\MatchKeyword::class,        
    ];
    
    private $mapColumnSearch = [
        //'entity.name' => 'entity_id',
    ];

    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
     */
    public function dataTable($query)
    {
        $dataTable = new EloquentDataTable($query);
        if (!empty($this->columnFilterOperator)) {
            foreach ($this->columnFilterOperator as $column => $operator) {
                $columnSearch = $this->mapColumnSearch[$column] ?? $column;
                $dataTable->filterColumn($column, new $operator($columnSearch));                
            }
        }
        return $dataTable->addColumn('action', function($item){
            return view($this->baseView.'.datatables_actions', array_merge($item->toArray(), ['baseRoute' => $this->getBaseRoute()]));
        });        
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Models\TemplateFingerprintDevice $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(TemplateFingerprintDevice $model)
    {
        return $model->select([$model->getTable().'.*'])->newQuery();
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        $buttons = [
                    [
                       'extend' => 'create',
                       'className' => 'btn btn-default btn-sm no-corner',
                       'text' => '<i class="fa fa-plus"></i> ' .__('auth.app.create').''
                    ],
                    [
                       'extend' => 'export',
                       'className' => 'btn btn-default btn-sm no-corner',
                       'text' => '<i class="fa fa-download"></i> ' .__('auth.app.export').''
                    ],
                    [
                       'extend' => 'import',
                       'className' => 'btn btn-default btn-sm no-corner',
                       'text' => '<i class="fa fa-upload"></i> ' .__('auth.app.import').''
                    ],
                    [
                       'extend' => 'print',
                       'className' => 'btn btn-default btn-sm no-corner',
                       'text' => '<i class="fa fa-print"></i> ' .__('auth.app.print').''
                    ],
                    [
                       'extend' => 'reset',
                       'className' => 'btn btn-default btn-sm no-corner',
                       'text' => '<i class="fa fa-undo"></i> ' .__('auth.app.reset').''
                    ],
                    [
                       'extend' => 'reload',
                       'className' => 'btn btn-default btn-sm no-corner',
                       'text' => '<i class="fa fa-refresh"></i> ' .__('auth.app.reload').''
                    ],
                ];
                
        return $this->builder()
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->addAction(['width' => '120px', 'printable' => false, 'title' => __('crud.action')])
            ->parameters([
                'dom'       => '<"row" <"col-md-6"B><"col-md-6 text-end"l>>rtip',
                'stateSave' => true,
                'order'     => [[0, 'desc']],
                'buttons'   => $buttons,
                 'language' => [
                   'url' => url('vendor/datatables/i18n/en-gb.json'),
                 ],
                 'responsive' => true,
                 'fixedHeader' => true,
                 'orderCellsTop' => true     
            ]);
    }

    /**
     * Get columns.
     *
     * @return array
     */
    protected function getColumns()
    {
        return [
            'device_id' => new Column(['title' => __('models/templateFingerprintDevices.fields.device_id'),'name' => 'device_id', 'data' => 'device_id', 'searchable' => true, 'elmsearch' => 'text']),
            'pin' => new Column(['title' => __('models/templateFingerprintDevices.fields.pin'),'name' => 'pin', 'data' => 'pin', 'searchable' => true, 'elmsearch' => 'text']),
            'fid' => new Column(['title' => __('models/templateFingerprintDevices.fields.fid'),'name' => 'fid', 'data' => 'fid', 'searchable' => true, 'elmsearch' => 'text']),
            'size' => new Column(['title' => __('models/templateFingerprintDevices.fields.size'),'name' => 'size', 'data' => 'size', 'searchable' => true, 'elmsearch' => 'text']),
            'valid' => new Column(['title' => __('models/templateFingerprintDevices.fields.valid'),'name' => 'valid', 'data' => 'valid', 'searchable' => true, 'elmsearch' => 'text']),
            // 'tmp' => new Column(['title' => __('models/templateFingerprintDevices.fields.tmp'),'name' => 'tmp', 'data' => 'tmp', 'searchable' => true, 'elmsearch' => 'text'])
        ];
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'template_fingerprint_devices_datatable_' . time();
    }

    /**
     * Get the value of baseRoute
     */ 
    public function getBaseRoute()
    {
        return $this->baseRoute;
    }

    /**
     * Set the value of baseRoute
     *
     * @return  self
     */ 
    public function setBaseRoute($baseRoute)
    {
        $this->baseRoute = $baseRoute;

        return $this;
    }

    /**
     * Get the value of baseView
     */ 
    public function getBaseView()
    {
        return $this->baseView;
    }

    /**
     * Set the value of baseView
     *
     * @return  self
     */ 
    public function setBaseView($baseView)
    {
        $this->baseView = $baseView;

        return $this;
    }
}
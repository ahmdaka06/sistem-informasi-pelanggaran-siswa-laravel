<?php

namespace App\Http\Livewire\Admin\Inbox;

use Livewire\Component;
use Webklex\IMAP\Facades\Client;
use Livewire\WithPagination;
use Illuminate\Http\Request;

class Index extends Component
{
    use WithPagination;

    public $inboxUid, $inboxSubject, $inboxHtmlContent, $inboxFrom;

    public $paginate = 5;
    public $page = 1;
    protected $paginationTheme = 'bootstrap';
    protected $pageName = 'page';

    public $openModalInbox = false;

    public function render(Request $request)
    {
        $client = Client::account('default');
        $client->connect();
        $folder = $client->getFolders()[0];
        $messages = $folder->messages()->all()->paginate($this->paginate, $this->page, 'page');
        return view('livewire.admin.inbox.index', compact('messages'));
    }

    public function readInbox($uid = '')
    {
        $this->emit('openModalInbox');

        $client = Client::account('default');
        $client->connect();
        $folder = $client->getFolders()[0];
        $singleMessage = $folder->query()->getMessageByUid($uid);

        $this->inboxUid = $uid;
        $this->inboxFrom = $singleMessage->getFrom()[0]->mail;
        $this->inboxSubject = $singleMessage->getSubject()[0];
        $this->inboxHtmlContent = $singleMessage->getHTMLBody();
        return view('livewire.admin.inbox.read');

    }

    public function closeModal()
    {
        $this->openModalInbox = false;
    }
}

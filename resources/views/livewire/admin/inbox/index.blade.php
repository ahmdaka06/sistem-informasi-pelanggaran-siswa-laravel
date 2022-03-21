<div>
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title"><i class="mdi mdi-format-list-bulleted-square"></i> Inbox Email</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive mt-2">
                        <table class="table table-bordered mb-0" readonly>
                            <thead  class="table-light">
                                <tr>
                                    <th>UID</th>
                                    <th>Subject</th>
                                    <th>From</th>
                                    <th>Attachments</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($messages as $message)
                                <tr wire:click="readInbox({{ $message->getUid() }})" style="cursor: pointer">
                                    <td>{{ $message->getUid() }}</td>
                                    <td>{{ $message->getSubject() }}</td>
                                    <td>{{ $message->getFrom()[0]->mail }}</td>
                                    <td>{{ $message->getAttachments()->count() > 0 ? 'yes' : 'no' }}</td>
                                </tr>
                                @empty
                                <tr>
                                    <td colspan="4">No messages found</td>
                                </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                    <br>
                    {{ $messages->links() }}
                </div>
            </div>
        </div>
    </div>
    <!-- end row -->
    <!--  Extra Large modal example -->
    <div wire:ignore.self class="modal fade bs-example-modal-xl" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myExtraLargeModalLabel"><i class="fa fa-envelope fa-fw"></i> {{ $inboxUid }}</h5>
                    <button type="button" wire:click.prevent="closeModal()" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">
                    @include('livewire.admin.inbox.read')
                </div>
                <div class="modal-footer">
                    <button wire:click.prevent="closeModal()" type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <script>
        window.livewire.on('openModalInbox', () => {
            $('.bs-example-modal-xl').modal('show');
        });
    </script>
</div>

Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B067E3
	for <llvm@lists.linux.dev>; Sun, 14 May 2023 12:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684066109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MCZfx9X7P7tpf8mxE/U3NE7zIvdxGn9Zn4/1w/9bpuY=;
	b=erfndP3SHGUP7JK2Vui2w569wmWyeDyFva7v3Lyg+sOS5p1evWID+y1FrkbFd0nWanUKAG
	ulSQX2P/ctQ8pAK56i+eaWkrFHB/2UUkUz0pZOtmL/YQcQ5SIwFuq5uSG6bO5eEFIr5IVL
	0nidyT4JvNY0hs/QY08te3Ekl+O3obo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-zdL3nPBHNnCjM4ydlblBFQ-1; Sun, 14 May 2023 08:08:23 -0400
X-MC-Unique: zdL3nPBHNnCjM4ydlblBFQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22E2385A588;
	Sun, 14 May 2023 12:08:23 +0000 (UTC)
Received: from ovpn-8-17.pek2.redhat.com (ovpn-8-17.pek2.redhat.com [10.72.8.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24EBE2166B26;
	Sun, 14 May 2023 12:08:17 +0000 (UTC)
Date: Sun, 14 May 2023 20:08:12 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Tian Lan <tilan7663@gmail.com>
Cc: lkp@intel.com, axboe@kernel.dk, linux-block@vger.kernel.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	tian.lan@twosigma.com, ming.lei@redhat.com
Subject: Re: [PATCH 1/1] blk-mq: fix blk_mq_hw_ctx active request accounting
Message-ID: <ZGDPLEtUiDeIrCyl@ovpn-8-17.pek2.redhat.com>
References: <202305140021.WvuGBjaZ-lkp@intel.com>
 <20230513190534.331274-1-tilan7663@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230513190534.331274-1-tilan7663@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

Hello Tian,

On Sat, May 13, 2023 at 03:05:34PM -0400, Tian Lan wrote:
> From: Tian Lan <tian.lan@twosigma.com>
> 
> The nr_active counter continues to increase over time which causes the
> blk_mq_get_tag to hang until the thread is rescheduled to a different
> core despite there are still tags available.
> 
> kernel-stack
> 
>   INFO: task inboundIOReacto:3014879 blocked for more than 2 seconds
>   Not tainted 6.1.15-amd64 #1 Debian 6.1.15~debian11
>   "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>   task:inboundIOReacto state:D stack:0  pid:3014879 ppid:4557 flags:0x00000000
>     Call Trace:
>     <TASK>
>     __schedule+0x351/0xa20
>     scheduler+0x5d/0xe0
>     io_schedule+0x42/0x70
>     blk_mq_get_tag+0x11a/0x2a0
>     ? dequeue_task_stop+0x70/0x70
>     __blk_mq_alloc_requests+0x191/0x2e0
> 
> kprobe output showing RQF_MQ_INFLIGHT bit is not cleared before
> __blk_mq_free_request being called.

RQF_MQ_INFLIGHT won't be cleared when the request is freed normally
from blk_mq_free_request().

> 
>   320    320  kworker/29:1H __blk_mq_free_request rq_flags 0x220c0 in-flight 1

RQF_MQ_INFLIGHT/RQF_DONTPREP/RQF_IO_STAT/RQF_STATS is set, and it isn't
a FLUSH request.

>          b'__blk_mq_free_request+0x1 [kernel]'
>          b'bt_iter+0x50 [kernel]'
>          b'blk_mq_queue_tag_busy_iter+0x318 [kernel]'
>          b'blk_mq_timeout_work+0x7c [kernel]'
>          b'process_one_work+0x1c4 [kernel]'
>          b'worker_thread+0x4d [kernel]'
>          b'kthread+0xe6 [kernel]'
>          b'ret_from_fork+0x1f [kernel]'

If __blk_mq_free_request() is called from timeout, that means this
request has been freed by blk_mq_free_request() already, so __blk_mq_dec_active_requests
should have been run.

However, one case is that __blk_mq_dec_active_requests isn't called in
blk_mq_end_request_batch, so maybe your driver is nvme with multiple
NSs, so can you try the following patch?

diff --git a/block/blk-mq.c b/block/blk-mq.c
index f6dad0886a2f..9c5dd5aa289c 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -1062,6 +1062,9 @@ void blk_mq_end_request_batch(struct io_comp_batch *iob)
 		if (iob->need_ts)
 			__blk_mq_end_request_acct(rq, now);
 
+		if (rq->rq_flags & RQF_MQ_INFLIGHT)
+			__blk_mq_dec_active_requests(rq->mq_hctx);
+
 		rq_qos_done(rq->q, rq);
 
 		/*

Thanks, 
Ming


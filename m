Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FFE1C33;
	Sun, 14 May 2023 14:53:36 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-61a80fcc4c9so53139716d6.2;
        Sun, 14 May 2023 07:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684076015; x=1686668015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h46vxHf4kELW0lXrxfBssKM2sOaDdYbPgfarEetmSxA=;
        b=PrOhYG7lVBO4bBKRhxrwsBUJkU0RNbBW3uMOK6+vJRKKOWFIQymz/XNtAjO3XirGHR
         Hr0WDbJPap30NaG80WjQhZ845/dFKYetXy1WlIX/F0vQFpPT2EIIe8dK+YqVyMpUmTHR
         rxWuPCi5iqhlThyyCBbGaaqKyh1iF8kgyY2tFfvBl6AqqTtx/CtPsadvumGmjrGbCjJB
         wG02M4v8A1ZHwauQ9YFvve84nDf/jaH7jI3+JSmgjzjOyPtCUrvI0jWUH70gk7OfUCUl
         ZVWtZ2qGbMdSw82DD/yVPJS0EA+DajzLJTclu1n5mu/yI0vLK9cdjb8fYoW52q7EjgoL
         UMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684076015; x=1686668015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h46vxHf4kELW0lXrxfBssKM2sOaDdYbPgfarEetmSxA=;
        b=FS3PIzIVY5/24cyhZ7Wjx0QlqrvEGaR9kioYm/sYwLdkSS0B7OMxNi3F8QQrlQ9kpD
         r1h7EBfmwZ9ayaAtzMmfcz+8lIV2i869N5i9c/muq1vYVmOZ/HWhaBm1I23A2keySEJ+
         c5+uXJqEqvPt1lbGzmEGAdBxai4lYdkCRRTgZfgNgryhoB/QGglHcud0SpQyBHayENLf
         rLFdqY7uDxBTgigLGZ9lqNkeYH+DM1ucXQ5gLkiD83CQDujjONHDpNDHVA2MXvSBXHmL
         8+HXcyOZSe8SBBN246AWMWUWE3oxadluf6JmzcwUkURlSDJ6CN/vr1p064fNdLux/BeP
         UMMg==
X-Gm-Message-State: AC+VfDwr54aDcdb+hi5INP+54tBLbY700LkkUBTCRYFwH7XlC8VxT5S0
	VQX6LgFzP5BFP9eZ3dGo884C09AdPzZkfw==
X-Google-Smtp-Source: ACHHUZ7llXP12sKSzjFNYo+VrzzDm1jHdfj1TpnveoEdCEJVfKrI2ekaODnhNtYJyfrRcMfRRjMTDg==
X-Received: by 2002:a05:6214:1242:b0:5ef:56e4:f630 with SMTP id r2-20020a056214124200b005ef56e4f630mr51133242qvv.41.1684076015253;
        Sun, 14 May 2023 07:53:35 -0700 (PDT)
Received: from tian-Alienware-15-R4.fios-router.home (pool-173-77-254-84.nycmny.fios.verizon.net. [173.77.254.84])
        by smtp.gmail.com with ESMTPSA id h18-20020a0cb4d2000000b0061b7bbb7624sm4319510qvf.130.2023.05.14.07.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 07:53:34 -0700 (PDT)
From: Tian Lan <tilan7663@gmail.com>
To: ming.lei@redhat.com
Cc: axboe@kernel.dk,
	horms@kernel.org,
	linux-block@vger.kernel.org,
	lkp@intel.com,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	tian.lan@twosigma.com,
	tilan7663@gmail.com
Subject: [PATCH] blk-mq: fix blk_mq_hw_ctx active request accounting
Date: Sun, 14 May 2023 10:53:28 -0400
Message-Id: <20230514145328.595743-1-tilan7663@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZGDur5+koRgNh5Ih@ovpn-8-17.pek2.redhat.com>
References: <ZGDur5+koRgNh5Ih@ovpn-8-17.pek2.redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tian Lan <tian.lan@twosigma.com>

The nr_active counter continues to increase over time which causes the
blk_mq_get_tag to hang until the thread is rescheduled to a different
core despite there are still tags available.

kernel-stack

  INFO: task inboundIOReacto:3014879 blocked for more than 2 seconds
  Not tainted 6.1.15-amd64 #1 Debian 6.1.15~debian11
  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  task:inboundIORe state:D stack:0  pid:3014879 ppid:4557 flags:0x00000000
    Call Trace:
    <TASK>
    __schedule+0x351/0xa20
    scheduler+0x5d/0xe0
    io_schedule+0x42/0x70
    blk_mq_get_tag+0x11a/0x2a0
    ? dequeue_task_stop+0x70/0x70
    __blk_mq_alloc_requests+0x191/0x2e0

kprobe output showing RQF_MQ_INFLIGHT bit is not cleared before
__blk_mq_free_request being called.

  320    320  kworker/29:1H __blk_mq_free_request rq_flags 0x220c0
         b'__blk_mq_free_request+0x1 [kernel]'
         b'bt_iter+0x50 [kernel]'
         b'blk_mq_queue_tag_busy_iter+0x318 [kernel]'
         b'blk_mq_timeout_work+0x7c [kernel]'
         b'process_one_work+0x1c4 [kernel]'
         b'worker_thread+0x4d [kernel]'
         b'kthread+0xe6 [kernel]'
         b'ret_from_fork+0x1f [kernel]'

The issue is caused by the difference between blk_mq_free_request() and
blk_mq_end_request_batch() wrt. when to call __blk_mq_dec_active_requests().
The former does it before calling req_ref_put_and_test(), and the latter
decreases the active request after req_ref_put_and_test().

- Fixes: f794f3351f26 ("block: add support for blk_mq_end_request_batch()")

Signed-off-by: Tian Lan <tian.lan@twosigma.com>
Reviewed-by: Ming Lei <ming.lei@redhat.com>
---
 block/blk-mq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index f6dad0886a2f..850bfb844ed2 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -683,6 +683,10 @@ static void __blk_mq_free_request(struct request *rq)
 	blk_crypto_free_request(rq);
 	blk_pm_mark_last_busy(rq);
 	rq->mq_hctx = NULL;
+
+	if (rq->rq_flags & RQF_MQ_INFLIGHT)
+		__blk_mq_dec_active_requests(hctx);
+
 	if (rq->tag != BLK_MQ_NO_TAG)
 		blk_mq_put_tag(hctx->tags, ctx, rq->tag);
 	if (sched_tag != BLK_MQ_NO_TAG)
@@ -694,15 +698,11 @@ static void __blk_mq_free_request(struct request *rq)
 void blk_mq_free_request(struct request *rq)
 {
 	struct request_queue *q = rq->q;
-	struct blk_mq_hw_ctx *hctx = rq->mq_hctx;
 
 	if ((rq->rq_flags & RQF_ELVPRIV) &&
 	    q->elevator->type->ops.finish_request)
 		q->elevator->type->ops.finish_request(rq);
 
-	if (rq->rq_flags & RQF_MQ_INFLIGHT)
-		__blk_mq_dec_active_requests(hctx);
-
 	if (unlikely(laptop_mode && !blk_rq_is_passthrough(rq)))
 		laptop_io_completion(q->disk->bdi);
 
-- 
2.25.1


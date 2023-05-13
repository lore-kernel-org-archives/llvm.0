Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6855B2583;
	Sat, 13 May 2023 19:05:53 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-3f4fdf564d1so7878891cf.1;
        Sat, 13 May 2023 12:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684004752; x=1686596752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVdNZZzDPqfzZ78pjeGRBegBtv5JdL4w9GcVn6+SXs0=;
        b=pgTL6cr72iY4APlVnHiCVeKtMhUuz3jtTepnPQeVovCq61Wuiw2sKVItwl9eR8CdNX
         abTSgrJsa/s81NZLEcjMw+IfuO2Uv//ZZsLzN4ohUwGCzcrUCh0SJnrLzlAL1w/5+v5l
         tifYjqwDbyKmsGVRFjVvV+e1pH8uE5syM4rD+7KLG/3B1sjQ70/lVbnPbj/8BIuiuM6y
         LhuMVyb/1VD2Zrp9wDAQzwQ7fn7OoaVoUlPs2yH0OXUhexTHZEMPMVqR2clp/mTLDGnE
         1eH3UFXe5az2XGqncKWF6Vm5nKop+YH1pCwdK10uGn59BcLFe3HxGC+lxKekVIPZRlEd
         FBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684004752; x=1686596752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVdNZZzDPqfzZ78pjeGRBegBtv5JdL4w9GcVn6+SXs0=;
        b=isQzJarrJGLzwhRXgFE17B7+4oTymdjPBdOqRwCtCRUV7cEuxNFoGyFsJsxA+BLFwT
         rIIRXNK5yHqTNmk632kfOsVj5JVVRRsweWQMhsYN3yF12FFj96GDeuJVu6Fsw8Je7XGN
         S4Gi4duCQbkP5kRrwOt2mAbF7CWkCe3Gj1kKtqGG6cOOvX+kyYdHuQcCzZSQAzTAUXUj
         UpcE7DVIV4hRxBiqs7hvKHh9vjSXKNSjVp6B0Cf0dNGc7CqHKQDcReaR/MT0Lk/vc+g2
         BmxdvYhwOZYVIEq12w1D4SWoEadQvtyWMibW3rufljoBn+8uy6zzxMvfRUWYmW7iaZfR
         s4Nw==
X-Gm-Message-State: AC+VfDzBWNGR8x/39cUKo97AOuUoVbBLG/I+28e0r5Fkk70g9SJ2GyMw
	v43RAJaIbWdEYqvrVZLu2tY=
X-Google-Smtp-Source: ACHHUZ7CjtIXgDMsQFZajMxUgDSAuFH9dQsDuRSv9xi9U5L7apcATLmSqkm1PZ+bdTCWaPnfN5ssbg==
X-Received: by 2002:a05:622a:15c7:b0:3f3:7869:d2e1 with SMTP id d7-20020a05622a15c700b003f37869d2e1mr49699089qty.17.1684004752192;
        Sat, 13 May 2023 12:05:52 -0700 (PDT)
Received: from tian-Alienware-15-R4.fios-router.home (pool-173-77-254-84.nycmny.fios.verizon.net. [173.77.254.84])
        by smtp.gmail.com with ESMTPSA id c23-20020ac81e97000000b003f38b4167e5sm4103033qtm.2.2023.05.13.12.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 12:05:51 -0700 (PDT)
From: Tian Lan <tilan7663@gmail.com>
To: lkp@intel.com
Cc: axboe@kernel.dk,
	linux-block@vger.kernel.org,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	tian.lan@twosigma.com,
	tilan7663@gmail.com
Subject: [PATCH 1/1] blk-mq: fix blk_mq_hw_ctx active request accounting
Date: Sat, 13 May 2023 15:05:34 -0400
Message-Id: <20230513190534.331274-1-tilan7663@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202305140021.WvuGBjaZ-lkp@intel.com>
References: <202305140021.WvuGBjaZ-lkp@intel.com>
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
  task:inboundIOReacto state:D stack:0  pid:3014879 ppid:4557 flags:0x00000000
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

  320    320  kworker/29:1H __blk_mq_free_request rq_flags 0x220c0 in-flight 1
         b'__blk_mq_free_request+0x1 [kernel]'
         b'bt_iter+0x50 [kernel]'
         b'blk_mq_queue_tag_busy_iter+0x318 [kernel]'
         b'blk_mq_timeout_work+0x7c [kernel]'
         b'process_one_work+0x1c4 [kernel]'
         b'worker_thread+0x4d [kernel]'
         b'kthread+0xe6 [kernel]'
         b'ret_from_fork+0x1f [kernel]'

Signed-off-by: Tian Lan <tian.lan@twosigma.com>
---
 block/blk-mq.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 9c8dc70020bc..732a39d88cd6 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -716,6 +716,10 @@ static void __blk_mq_free_request(struct request *rq)
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
@@ -733,9 +737,6 @@ void blk_mq_free_request(struct request *rq)
 	    q->elevator->type->ops.finish_request)
 		q->elevator->type->ops.finish_request(rq);
 
-	if (rq->rq_flags & RQF_MQ_INFLIGHT)
-		__blk_mq_dec_active_requests(hctx);
-
 	if (unlikely(laptop_mode && !blk_rq_is_passthrough(rq)))
 		laptop_io_completion(q->disk->bdi);
 
-- 
2.34.1


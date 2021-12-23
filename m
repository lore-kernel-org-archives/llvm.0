Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872122C80
	for <llvm@lists.linux.dev>; Thu, 23 Dec 2021 12:53:13 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id z29so21033402edl.7
        for <llvm@lists.linux.dev>; Thu, 23 Dec 2021 04:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=5IhcIiQyVUKu9L30Vg5+RpyU7OW/xb9Dw8MgAKsUEjk=;
        b=mwUBnMelq83wCnTnDoClQVq2L2qe26xnPznhGvDGH11V5/RF9FSrS9ipjHARyx4gZs
         wHQrtZCdlCxwg6ULpTBy/ovF/aVcLInz6axTCu48yprWzoMjISczJ7lA2EkAoMTUNEgI
         vmMsf/Yr9lvNFeTyhJya5x/7hmS8y5gm1IoTu0Eajz1lyDKj1y9GHgE67Ck2ilTivwoH
         nEmdPr/Ny3XSAM7JZ50b06Cg9iLgW5typ9TErvhY5GX/GzwxSTYFQeuU3z0cdhNsReyy
         xju5qQ5Qo9zzBSwA+VsvEvU4X8Kq5TgKHm47qZAPk7b76pWwuonTCTqooTcjqMl6078p
         9Z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5IhcIiQyVUKu9L30Vg5+RpyU7OW/xb9Dw8MgAKsUEjk=;
        b=L0U+DnNRX1EPOoFteUb5qzieYMP7dMZGhkJ5bFsJd9XULhWpAxGd9O6wR+2dT8mgWR
         Myfpk6Jy45FjIv7vQV9ZVScoP7lg6e47VjrBJzagDSHHVQHBNzyfUMLK3NGm/dHItea1
         TBLDG1Ov7AG8iY4jeYMGWtZ9y4uNO0ZIr2jSts5lXq4t3ZBwSCfPBIMqMm0diRo1TMfA
         U7lppUnES30JpZtnlnr2CoouZOcsEIQi+KAhKyc8Ty4PBYfLlhEindtppugvzDI8qi7o
         dgg1L4dRoMM6Z0VWSWMlB018uAikublK6zQHehVazXLr07Akou2Tr2LQIP8eerMxFnfA
         bI7w==
X-Gm-Message-State: AOAM532CPBwxaubp6vOBQzStcDmZls6+aykNXvPH+BBfSY6ey8ONopfr
	HeOo9hwDclbCYB5QlLEC2E43FUR9xiM=
X-Google-Smtp-Source: ABdhPJxTMr/s3T6yhgpP4siJZageNjtMVxnC1LixKDvJXv7VwSEQjKmQCpp0A6bcOp/C6pG/gceXOg==
X-Received: by 2002:a17:906:af19:: with SMTP id lx25mr1832627ejb.338.1640263991848;
        Thu, 23 Dec 2021 04:53:11 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2606:5e00:3112:93fc:fc68:4d9e])
        by smtp.gmail.com with ESMTPSA id ho14sm1728852ejc.73.2021.12.23.04.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 04:53:11 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Jan Kara <jack@suse.cz>,
	linux-block@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2] block: drop needless assignment in set_task_ioprio()
Date: Thu, 23 Dec 2021 13:53:00 +0100
Message-Id: <20211223125300.20691-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Commit 5fc11eebb4a9 ("block: open code create_task_io_context in
set_task_ioprio") introduces a needless assignment
'ioc = task->io_context', as the local variable ioc is not further
used before returning.

Even after the further fix, commit a957b61254a7 ("block: fix error in
handling dead task for ioprio setting"), the assignment still remains
needless.

Drop this needless assignment in set_task_ioprio().

This code smell was identified with 'make clang-analyzer'.

Fixes: 5fc11eebb4a9 ("block: open code create_task_io_context in set_task_ioprio")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 block/blk-ioc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/block/blk-ioc.c b/block/blk-ioc.c
index 71c3a933cf16..11f49f78db32 100644
--- a/block/blk-ioc.c
+++ b/block/blk-ioc.c
@@ -284,12 +284,10 @@ int set_task_ioprio(struct task_struct *task, int ioprio)
 			kmem_cache_free(iocontext_cachep, ioc);
 			goto out;
 		}
-		if (task->io_context) {
+		if (task->io_context)
 			kmem_cache_free(iocontext_cachep, ioc);
-			ioc = task->io_context;
-		} else {
+		else
 			task->io_context = ioc;
-		}
 	}
 	task->io_context->ioprio = ioprio;
 out:
-- 
2.17.1


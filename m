Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7402C80
	for <llvm@lists.linux.dev>; Thu, 23 Dec 2021 12:30:20 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id bm14so20806962edb.5
        for <llvm@lists.linux.dev>; Thu, 23 Dec 2021 04:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=fNaPNTcQ9+5saoF57Y7rdpQmhsZMZ3umVXTUa4EFrBI=;
        b=TxFI65WVU5ATfdfV6agT/ZhhwNnAFbfMpGRv9XmXTnIFXSc9rJ1pepLPlR/1RJMjov
         SZpxgciBz+wq+7ivloAmDwkEuwv7WAc2F4Kwk0sgzI3sYSMe+vd3DE3jdXikyae2MB27
         BQd26KIuEcjXplZweyjLS4UgYh3xueNdaopPlN4WoLyCzrS8GuauVLIXNf/q4zZxqhFz
         XLuF5m8gR8Rg6IdC9FfYKWXpc0t8GhVLkle+KWWEC0JIoNPASf35YtD9fmnjjwFuc15I
         Nvg+VAp/IZYyO6K/6jDS6E2JKH4F7tf65q1guqQniRwV/dlJt3liNUwS9lCUz2OtDLri
         4tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=fNaPNTcQ9+5saoF57Y7rdpQmhsZMZ3umVXTUa4EFrBI=;
        b=zpgGCwC+DrEuPhmf+IlFYNnsPa+vRZ+byzj5x2lzmLKbSwQlj/1qx5/vALHbIstKmV
         Fu6anTiSv79ig/4/c5KWlpKt7ubvGTTBXkix4S7WLniFlYkxALUx7289NNk0Y0v4W593
         up3c2iwJh0lq08st8PA/W8LXHkqc9BgqxP4s8j8HvhGAp5oF94+aszVfpWc6EdXrmUAC
         I5MnwBzRmycjb1w7FYHlEqZ6jVXbLybXF0mRsOBTvT9ofSl7TlM7Hdtmmst5UQ3GEtiG
         OFHvO4G7GUkQqepsRUCjeqHAU6gzKG6UwzlVEF4qvXnzsDz+ZK+rnexD7bWSojTDAemP
         5RWQ==
X-Gm-Message-State: AOAM533vL63oCeqHjwAdjjwuhfCsCdN1T05p3qqiLAMbEyWcJkphA6Mt
	t6JiOXHACmLPJEAuFG3lpls=
X-Google-Smtp-Source: ABdhPJydmPm6zJII+gat7VsvRjkt3D0JC59Ka+WRBkeZPYAgcZ1UzML+8KUmdBuuKTsN5AdPm6dCVA==
X-Received: by 2002:a17:906:c214:: with SMTP id d20mr1779645ejz.630.1640262618575;
        Thu, 23 Dec 2021 04:30:18 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2606:5e00:3112:93fc:fc68:4d9e])
        by smtp.gmail.com with ESMTPSA id d1sm1728878ejo.176.2021.12.23.04.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 04:30:18 -0800 (PST)
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
Subject: [PATCH] block: drop needless assignment in set_task_ioprio()
Date: Thu, 23 Dec 2021 13:30:03 +0100
Message-Id: <20211223123003.6947-1-lukas.bulwahn@gmail.com>
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
 block/blk-ioc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/blk-ioc.c b/block/blk-ioc.c
index 71c3a933cf16..8c99e1771c9c 100644
--- a/block/blk-ioc.c
+++ b/block/blk-ioc.c
@@ -286,7 +286,6 @@ int set_task_ioprio(struct task_struct *task, int ioprio)
 		}
 		if (task->io_context) {
 			kmem_cache_free(iocontext_cachep, ioc);
-			ioc = task->io_context;
 		} else {
 			task->io_context = ioc;
 		}
-- 
2.17.1


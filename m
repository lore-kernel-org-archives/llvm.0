Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CBE4ABB
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 23:46:49 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id u10so9573413wra.9
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 16:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=44jSVu9ViGX65V2KV4sJoKN91g8S2sbZ550L2N5DUJ4=;
        b=l/0VWzdsq+0tapKmp9GM2+I2R4GUGVKdkGWYWuAwvHzKLPI3p5TshglsScGVDa6NFW
         DaUSL0XENlAwNhjU9nCyUGZAAKbuLTE5fPZkTuqREBsP1ImFELxbCE3lmp3Tj4nI/jZy
         9MwmBjSZpXSmwI4DVJZDYjtVulXynQRqIUs3I7K0QsW9YAidOZSK0Tv9Ac8x3k42NYBa
         rI6tO6VGSjlkuhdZoQ0C6BU3ba7i/97qKi1VIMAusTrJVubzZfr5sUa8Dru53eP9ebuz
         wQGxh7PiQr4lqSAjy9LGqm91YM5rAGN3LoMMnC2WtFXix6zXjBdx0Wr+n4qempHJNmVk
         hZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=44jSVu9ViGX65V2KV4sJoKN91g8S2sbZ550L2N5DUJ4=;
        b=hnOBtH/QC0c3KpgCKQSSiKOZYceSKTL7Bvtq02LFJMCqC2gNHq3y7+M7vFSxrVv1kk
         /3WLhWmmfcILX4FuUDVCmADZF1PBaD+rnjFpBlFh1iR2AThqoYNwo8b5QpggWLFEHdvI
         5CSOsyvt5LNymfS/5dtDTUPgyS685gb1YcR5YbUZNPBQfcasszeeo+OQcL/xNPJPtafh
         kpjFJX5n+mzOQun6JW4KXm86gbJOEy3SZziXUB/03F/3y7LJ7vx2TU8QjtMGyBa7eoKa
         TY/gT1RbIkkScEMzSjhJ175DxIPEgu7RgmU3K4FpbP3yoQ7h+BP7fUSbYIEUS2xfR8OS
         fRJw==
X-Gm-Message-State: AOAM533JEW9GszJQ/uvshTCJkNBUk1V7MdUfwTKDoZg7TY6ZJu2+fUgA
	UFoyMn3/R7UEtw2Bg9y/xgg=
X-Google-Smtp-Source: ABdhPJxdH/WN2xf224PSCmdD+V5oRw0iLxFKpaeNeTNgCZ9Kx3jYO0+gAPl3kcA/9A7EbQbNAzpyng==
X-Received: by 2002:adf:efd2:0:b0:203:db42:c56c with SMTP id i18-20020adfefd2000000b00203db42c56cmr5842974wrp.698.1647560808002;
        Thu, 17 Mar 2022 16:46:48 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id v5-20020adfe4c5000000b001edc1e5053esm4860565wrm.82.2022.03.17.16.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 16:46:47 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] xen-blkback: remove redundant assignment to variable i
Date: Thu, 17 Mar 2022 23:46:46 +0000
Message-Id: <20220317234646.78158-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable i is being assigned a value that is never read, it is being
re-assigned later in a for-loop. The assignment is redundant and can
be removed.

Cleans up clang scan build warning:
drivers/block/xen-blkback/blkback.c:934:14: warning: Although the value
stored to 'i' is used in the enclosing expression, the value is never
actually read from 'i' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/block/xen-blkback/blkback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index d1e26461a64e..de42458195bc 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -931,7 +931,7 @@ static int xen_blkbk_parse_indirect(struct blkif_request *req,
 	if (rc)
 		goto unmap;
 
-	for (n = 0, i = 0; n < nseg; n++) {
+	for (n = 0; n < nseg; n++) {
 		uint8_t first_sect, last_sect;
 
 		if ((n % SEGS_PER_INDIRECT_FRAME) == 0) {
-- 
2.35.1


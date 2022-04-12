Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAC21FD1
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 17:17:10 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id x33so26910867lfu.1
        for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 10:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=URuYojkxV6WW5KduaZwbvyQpA/mj+9RW5XKOSq85tII=;
        b=QYt1UC5IFgQjZ6sZdp7YECBm2g6b2CPrjGdVmz2lkTrU0xl+cv2UsXHIc8lKFFLGYw
         HC3krv4I4D5hfLgh31O11/Twa1I0DudLbkuwGieLgQqy6Nxd2QUu5rf0IYT7jFQFI/Lr
         zcSSIYsp5S5ugQ+NBSFDYs8MSvBiWTrjlNc8SqLTX8Mkt3jl6Ng/YNoD8s/IwpNynQvZ
         FNWjwHR1dMq9TB5qXfhqZUdH3dKjiAgTyU5aMeEevKKJdO7mKA4Uh+cYeZjX3jdy5rc6
         gg1vlpQ4+dnjx+tQRnf2UAtUiN+VFowZ64IlZknWiBDsRmBJndnf24Zjr5PCgVjJIWp/
         7TbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=URuYojkxV6WW5KduaZwbvyQpA/mj+9RW5XKOSq85tII=;
        b=IdSY6+xxd/wrkLoJwwJpHL+vMvKjlEYssEBTVT+xoxAXJxCjw7vPeqGBa5Bu53O7gw
         IlnWs4qO8C9QhFO6vIAC2Yx6jCt5wEPb+zjP/5wQq1gD/TgprkmFHXh03qnxeEvZjcvJ
         +7Bf8VdPka2l3q0ytisDtA+r8m+EZ9cQSuylNKDgbFJcQCAr3q4dcYEZY3hDLJkw21o8
         MbeFHn/iVqz4U8LhynCN0oxSuHqw6k/KNSEOo0Ny0zmFo2AU8R4Vxo+i0xJyRjoG+Fce
         nqFMf2GeS9Gq98tC7x+jECBvDGc4XBo0tWre6RTp7uJM0rX4aMLpKnPV8k9y+oz+4sl3
         iu2w==
X-Gm-Message-State: AOAM532Yiq+6/IfN+dmBeXWUM5piauqUXzHc17NQnOlDHwO38Bj+9+rz
	biKGRGvKxHbtqVnXPymhGwg=
X-Google-Smtp-Source: ABdhPJwh5oXNeEM8ojAPGe+8gV/lp2WDXe5fQBude/NLBc3HOVhukRH79ibF7/MEJpGMZ5ajzRsqrw==
X-Received: by 2002:a05:6512:2214:b0:44a:348a:d6d with SMTP id h20-20020a056512221400b0044a348a0d6dmr25654107lfu.506.1649783829102;
        Tue, 12 Apr 2022 10:17:09 -0700 (PDT)
Received: from morzel-asus.lan (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id m2-20020a05651202e200b0046ba665cd6dsm723928lfq.141.2022.04.12.10.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 10:17:08 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Michal Orzel <michalorzel.eng@gmail.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 2/5] block/blk-map: Remove redundant assignment
Date: Tue, 12 Apr 2022 19:16:48 +0200
Message-Id: <20220412171651.19812-2-michalorzel.eng@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412171651.19812-1-michalorzel.eng@gmail.com>
References: <20220412171651.19812-1-michalorzel.eng@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of redundant assignment to a variable ret from function
bio_map_user_iov as it is being assigned a value that is never read.
It is being re-assigned in the first instruction after the while loop

Reported by clang-tidy [deadcode.DeadStores]

Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
---
Changes since v1:
-move the change into a separate patch
-add analysis
---
 block/blk-map.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/block/blk-map.c b/block/blk-map.c
index c7f71d83eff1..fa72e63e18c2 100644
--- a/block/blk-map.c
+++ b/block/blk-map.c
@@ -260,10 +260,9 @@ static int bio_map_user_iov(struct request *rq, struct iov_iter *iter,
 
 		npages = DIV_ROUND_UP(offs + bytes, PAGE_SIZE);
 
-		if (unlikely(offs & queue_dma_alignment(rq->q))) {
-			ret = -EINVAL;
+		if (unlikely(offs & queue_dma_alignment(rq->q)))
 			j = 0;
-		} else {
+		else {
 			for (j = 0; j < npages; j++) {
 				struct page *page = pages[j];
 				unsigned int n = PAGE_SIZE - offs;
-- 
2.25.1


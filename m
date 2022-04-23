Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B731B7A
	for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 11:38:36 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id x33so18504281lfu.1
        for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 04:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xCiolmgN3BM/9hqURVQm8Fqd8GzWBSSZv9txkhzdRc4=;
        b=kx8deysmbzOe6OBlcsMIejoPkxCsCvoTcg6r8W64zbqEoHAe/Mvx1oRuO/la7HWA3M
         qOMXRMVv6coinGmI+AkdjC2z0ezlI4FZcWDGoEg1kiLbfxTnGgRtya9CMYa5fOvaFsoT
         uCcWYO4eoNLt9T2/HiOOUa2Xx97NzuiSV65kru4NkhxYtO8k47kbeK66X86y2kBVO/9I
         bkrAlEIMeTgHjFkpYiMRU6AL4WqSH064226SwlK3jRURfar1n3hX7uMpX2NnDCO/xedh
         qT/O1rMHt82mAh4AjacfQlGZAodiTHUPcK/i4LTkCFoMusJv3ZOucTGaCU+LTnywWzQZ
         KFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xCiolmgN3BM/9hqURVQm8Fqd8GzWBSSZv9txkhzdRc4=;
        b=BWtGDCtfMbxqapfNlFaP4/yApeERK+v3bEpi7Sx4vd+F1poazeKqmmwpKj/z5ENjmZ
         rFEXn13EtCxcUyuwVjwe2ymMuSpJ14wl/ec9qEJZetsDGKdR5hs295AuQt0h7TSOKebS
         vxDl/huZ+N7RMaJmMksH+FbdIBEB0YAf+WQuR0mcVp0MBFF8AtREC5vD2WBnF43D83FY
         Ka7gCA28bpau9mwgo6QLtfY2xJyGmT9dvTFixqX1h2ZtuuvNQlqlwRKk1EwEG3WXBWWV
         zrEzVYbJx865XLXrhQV4yVfQuwdG4vumr9OxxrqwPSp/41xKkzi7uQ7jaFN0fGQC5RwK
         Oc6Q==
X-Gm-Message-State: AOAM531ZUiVIeVMS6s9u807OIOl0086MzzpBW9DJSjf/4wOGbIUHYiRX
	iQjo/GJtM92lkW/+mZPags8=
X-Google-Smtp-Source: ABdhPJyRKbtRxftsMtdsT/P9kh3negEMeQhkrHNU5CWAZELcGfNHS8JQO7Edg7UKKSf+M9FvASw0lw==
X-Received: by 2002:a05:6512:4017:b0:471:b3c3:481d with SMTP id br23-20020a056512401700b00471b3c3481dmr6234569lfb.541.1650713914723;
        Sat, 23 Apr 2022 04:38:34 -0700 (PDT)
Received: from morzel-asus.lan (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id g17-20020a2e9cd1000000b0024db538c2absm526411ljj.7.2022.04.23.04.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 04:38:34 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Michal Orzel <michalorzel.eng@gmail.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH RESEND v2 2/5] block/blk-map: Remove redundant assignment
Date: Sat, 23 Apr 2022 13:38:08 +0200
Message-Id: <20220423113811.13335-2-michalorzel.eng@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220423113811.13335-1-michalorzel.eng@gmail.com>
References: <20220423113811.13335-1-michalorzel.eng@gmail.com>
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


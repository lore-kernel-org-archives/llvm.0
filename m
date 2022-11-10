Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908C228F3
	for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 14:34:38 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so4816360pjk.2
        for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 06:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4naR2xBcDe88j8RrDO7aS/st7Z9xD3TqZu4x6dohykE=;
        b=F0UMYn5USPzsikDqy/bJvgjGt7aKcJjJ2LtVWwGGQCzs4g1wcqpVTvDf/UJs3CernC
         dK4b+fU7C/FenkqEvXqNiKo+CQ5C4gXBLc0jSlCKj97DhN0O+Xj0WK4ZfLlbV3CONKhl
         c5hnJ6RQ0FutnInUqXLYQBN0ANb4cEMbFVkus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4naR2xBcDe88j8RrDO7aS/st7Z9xD3TqZu4x6dohykE=;
        b=MQcy85jzPb/jt0uzlxwvNEawix3/bL1c8d1QRff/fAMkQNQcVmkJS+35h0EgELDBrp
         X2fuXves+5YgVPE1idyuSnI5KEOSjRTzNjkfacy8ucNeJRQYLRqEpn8TwwyKBfTKv0bc
         z2myS2oR2jIu36s20uOzd9kRgrtdaQlQv+33LWUm9J0Q411xPxmXQlW9piOrCWY6VKqV
         YKIj0v5i71FhIA00HE5fOXXD57j21XUsnpqoZAuvNJELRu/nRgez7NdEg4Yex0lK9f72
         PURpTZVIavIOX1YRQnvyIwJ3oKrbNnFfTHDnGb5iih0xdW/yORL5LmARSz6UtBpYbtfF
         a4EA==
X-Gm-Message-State: ACrzQf2TMU6oaRLFjlqgzMoWiqvjGzdBmS1UOdLY7Jwc95vanjOG5HWS
	MMmO2P29DzO5B3+uEYHNx/N04Q==
X-Google-Smtp-Source: AMsMyM4q3FQariaZiCL4NdNu4LaNek6ASbXwbHj0w2pktetZMHoN12rDx3FnR1VA3Mu6E6NsSjdBkQ==
X-Received: by 2002:a17:90a:c984:b0:20a:ac88:d39d with SMTP id w4-20020a17090ac98400b0020aac88d39dmr81779176pjt.13.1668090878111;
        Thu, 10 Nov 2022 06:34:38 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:6ff1:37e4:b5b3:487e])
        by smtp.gmail.com with ESMTPSA id iw17-20020a170903045100b00186a6b63525sm11234655plb.120.2022.11.10.06.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 06:34:37 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	Nitin Gupta <ngupta@vflare.org>,
	Suleiman Souhlal <suleiman@google.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] zram: we should always zero out err variable in recompress loop
Date: Thu, 10 Nov 2022 23:34:23 +0900
Message-Id: <20221110143423.3250790-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221109115047.2921851-5-senozhatsky@chromium.org>
References: <20221109115047.2921851-5-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 171eccc2249d..9d33801e8ba8 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1891,7 +1891,7 @@ static ssize_t recompress_store(struct device *dev,
 
 	ret = len;
 	for (index = 0; index < nr_pages; index++) {
-		int err;
+		int err = 0;
 
 		zram_slot_lock(zram, index);
 
-- 
2.38.1.431.g37b22c650d-goog


Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5ED2C82
	for <llvm@lists.linux.dev>; Thu, 30 Dec 2021 16:06:29 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id t26so51281464wrb.4
        for <llvm@lists.linux.dev>; Thu, 30 Dec 2021 08:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x0Z4VfhJECgT1/vs4niZzj7+Z6gvqhAPOkKcI0mAqoc=;
        b=ipzs2Z2aIE/u3K6VQ0AbCXqJ8wzmf1CopsYvKY+Qnn/ypMJrQW++LKWeEAwsV267tf
         t/OWBLVKSyFw0wHISAQYQ/sekslWFw+GrVzFpI2MXI+UUgXxYiJnRgyfaUcgYLs5Nbc5
         OU4JWJ+vwyVDzJbMgAD/7iEZaV+serEDsV9EO6Q+mLPRybz+otJsAr9upP8DSB9ux1y7
         C3ZIYUS+20ZWs3XKnn++HN1OxbYZrd/hWqjy0MeN+9OO5294IDMdhtAUM/m7bOuNEj09
         R2c0HsgYjT3+g57nvb2HtHm56oclfA62XnLRfylNZNz+mv1MqDvvyoM3JLoj+slwMRF2
         HwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x0Z4VfhJECgT1/vs4niZzj7+Z6gvqhAPOkKcI0mAqoc=;
        b=UK5xUfijt5CaKvyFl0M9ztNr9VbVCDZEEE75gC3Hcxyg5patgDkxZGOaVgLkm7fFu5
         x7+3hm0T2xg2M0AteWYd918667aw/XbK7tBgkSwZb7gqJ8ECd7Jd6vnfflLb9DgWFb/D
         brUa3haPICmrsH9qNmJtf6NIwsoghkuyuISINAX0GJ+4S3oJgyMKORQZopArO04ua7jZ
         IuJfEKauQsl9Mikp5gFO3lR+xo8odb+gpJZJ0MD0MQeEHAHNl66V4X8Mwjbk/BSu7n8n
         nzJJHTD6lMV+5me494MSd5M34iCvXGnhDAnQfNTzyyb1wtSo+U9oJHkHDIlglJqiWkV2
         kMJw==
X-Gm-Message-State: AOAM530N76h48XHVi2kRmyi8DAvxpKsX/JauLKPxGMEwv4l0pQPSA9/X
	yQdwYECRg8DKgN6SDkeL+pw=
X-Google-Smtp-Source: ABdhPJwh/LJEO882P8Cm7xI3bzxI9mqZ37vTY5joIviEvK7W3BI5qy21cL58BLPI6V+WVVtkmMpCMA==
X-Received: by 2002:a05:6000:1241:: with SMTP id j1mr27249409wrx.601.1640880387487;
        Thu, 30 Dec 2021 08:06:27 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id r7sm23477675wrt.77.2021.12.30.08.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 08:06:27 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] video: fbdev: s3c-fb: remove redundant initialization of pointer bufs
Date: Thu, 30 Dec 2021 16:06:26 +0000
Message-Id: <20211230160626.404072-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Pointer bufs is being initialized with a value that is never read, it
is being re-assigned with a different value later on. The assignment
is redundant and can be removed. Cleans up clang-scan warning:

drivers/video/fbdev/s3c-fb.c:492:16: warning: Value stored to 'buf'
during its initialization is never read [deadcode.DeadStores]
        void __iomem *buf = regs;

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/video/fbdev/s3c-fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/s3c-fb.c b/drivers/video/fbdev/s3c-fb.c
index 3b134e1bbc38..68408c499627 100644
--- a/drivers/video/fbdev/s3c-fb.c
+++ b/drivers/video/fbdev/s3c-fb.c
@@ -489,7 +489,7 @@ static int s3c_fb_set_par(struct fb_info *info)
 	struct s3c_fb_win *win = info->par;
 	struct s3c_fb *sfb = win->parent;
 	void __iomem *regs = sfb->regs;
-	void __iomem *buf = regs;
+	void __iomem *buf;
 	int win_no = win->index;
 	u32 alpha = 0;
 	u32 data;
-- 
2.33.1


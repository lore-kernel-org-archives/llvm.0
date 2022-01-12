Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990B32C9D
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 23:20:38 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id q8so6912784wra.12
        for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 15:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BZetsEggcZdDtvIjPQfbsaoX1aAbsURqAycl8u60wPc=;
        b=QiPlOCYzz/Afi5jyqbpliTey9a1ba0Gw+PfX7Gz9I5jPJfchYzAEMdwuSs5fwgiyla
         Nma1aLjBfrZ4L1MA91ynUGNmJLvtdwN04Mmm8jmLrEEkMIl5OvyEq67/8lRKVKgztmTe
         TRsMDFyWM/K4HrHcE8v4VwSg21tXdYXEq+WH4lRrWPN6wF0HiJ2lABoGZbDpmE8Xr+ep
         rHA8kp6G+LZPhAgiPeADqbJ1gW12d0a59/pVlW4iek9Q9s6/ZBAiPqpAM3Rndi/sALTi
         NmcfQu/xi0NgeIznj/AkpwQzOrWwyBUeviNF22XlqgKy2pOkqfqIICm7sOvKAqMASpBL
         hxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BZetsEggcZdDtvIjPQfbsaoX1aAbsURqAycl8u60wPc=;
        b=4HIQjRDP+z+vEeePKD+p2fe7G7tiKdWOL7c/vdtllToV91yoXZv25zrharF4c10TVn
         YyNnTA+QcElZLtxcGxD6eg73Bj+rK3jdRtuqWkquBLyCK6vVp+PjDGK2XYeL0mHC/W2c
         BElpxKwXuB9YjH9vbKxdxhisN/zjXVvdJH8eKSkDABKwCGm0F6lqOfVjJRTm/E6JyJY6
         /IdgsrrzeNbViyDciRvXdJzxopCT5VHLW9KVhgCa9HKVEyEF1enFI9AGHCFCh+Kiz0xm
         jt2T+LVE8VLZcaS+okH+Zu1diOLDM5gCCd5pozK06+kK4g3OwkJFJxXJRnjI/4IbtL0y
         yyxg==
X-Gm-Message-State: AOAM533LrJox4ULn54lswL81q2qeVIBAut4/UuF8FWZJUa1RiTLO/155
	xQXY4/s//vJ0m8Hf0k0lAKg=
X-Google-Smtp-Source: ABdhPJxqVabMtVcZhWSJ9raCaLAxk4HaOSfwpuc8+h9zSIMyHVxyFvF0t1vLFmXru6xvw/3inQWmVw==
X-Received: by 2002:a05:6000:1a89:: with SMTP id f9mr1577287wry.41.1642029637059;
        Wed, 12 Jan 2022 15:20:37 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id k10sm992328wrz.113.2022.01.12.15.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 15:20:36 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Emma Anholt <emma@anholt.net>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] drm/vc4: remove redundant assignment of variable size
Date: Wed, 12 Jan 2022 23:20:36 +0000
Message-Id: <20220112232036.1182846-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable 'size' is being assigned a value that is never read,
the assignment is redundant and can be removed. Cleans up clang-scan
warning:

drivers/gpu/drm/vc4/vc4_bo.c:358:2: warning: Value stored to 'size'
is never read [deadcode.DeadStores]
        size = roundup(size, PAGE_SIZE);

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_bo.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 6d1281a343e9..e451cc5bcfac 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -355,8 +355,6 @@ static struct vc4_bo *vc4_bo_get_from_cache(struct drm_device *dev,
 	uint32_t page_index = bo_page_index(size);
 	struct vc4_bo *bo = NULL;
 
-	size = roundup(size, PAGE_SIZE);
-
 	mutex_lock(&vc4->bo_lock);
 	if (page_index >= vc4->bo_cache.size_list_size)
 		goto out;
-- 
2.33.1


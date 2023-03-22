Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199092566
	for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 11:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679486331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B1IhaCFxKJpjAg+q0LEfIaM0Q2vc1KJxe/aPBLF+J8s=;
	b=ic6/vKTPjLiOx3h6rzWjcb8HZoN185TMiL8DjNBrDzzudFYX4bO9nnaHVw1Qw4PnTr9DHn
	7HCAR6mmiwtkP4ntUQBFq0natkygyKD7Q2tyx9oudEjElk01YpbTK/IH1z9uGDda0Bqg5L
	0WAkdFYoxPPsIZKID2g3xnqxZNGTyb8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-lC2a0j19MN6UZKz1wx8_lQ-1; Wed, 22 Mar 2023 07:58:50 -0400
X-MC-Unique: lC2a0j19MN6UZKz1wx8_lQ-1
Received: by mail-qt1-f197.google.com with SMTP id x5-20020a05622a000500b003e259c363f9so5040694qtw.22
        for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 04:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679486330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1IhaCFxKJpjAg+q0LEfIaM0Q2vc1KJxe/aPBLF+J8s=;
        b=GBzM1kHAQV7kQlG9VGw3yLlzjVdjervEOvtAPF1TWv/cPCIM0ItxrDZz4TlLuBC5gg
         DNAt69JNwdY/DoTeeCwmDtR1wlviRkQqRST2unfOP5EoJOFl8xG9HabcEK8MXXdL9Exf
         i3+vwpGEO2LiOcAGdEzS2JIhJ/r3vozcLkXovQhSNgigR/H1Vkjmc7q01aLCvNiGLgkd
         SgzaK5mrpddUaZyB8MKeRNi3w4pFPE/jCJ6orHOFZIRz2/uoHF2pPURTAxdaURzmxGwO
         NO9LTbise4kRRwOpDESblc3oBrWHAX1GbNNKaFMmHy01SzYRJw22YDFvrGsCs+VPB0eW
         i+uw==
X-Gm-Message-State: AO0yUKUZqmPCNm6GCMNOd0+wPkbRc2zWSnKwLGqv8wYJwvVbhJbd86NI
	qHQHvpOcqjm5ZSxkrnNBDgwnuQGmCUkDJfFkOPgHwnXuoRM9oOXd+vO2VqSA/rtZMKDOqskDLa3
	R8ernIO4pK0MSMg==
X-Received: by 2002:a05:622a:103:b0:3d7:3cf4:33f9 with SMTP id u3-20020a05622a010300b003d73cf433f9mr4956979qtw.68.1679486330208;
        Wed, 22 Mar 2023 04:58:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set8+LElrkvdjPI0dbh2Q4k8yW/bECWQ3fu0cFt9+TXxvztfQIZdsEIppTbtwkLz4UzzOc60T9Q==
X-Received: by 2002:a05:622a:103:b0:3d7:3cf4:33f9 with SMTP id u3-20020a05622a010300b003d73cf433f9mr4956958qtw.68.1679486329994;
        Wed, 22 Mar 2023 04:58:49 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id t10-20020a37aa0a000000b0074683c45f6csm6337273qke.1.2023.03.22.04.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 04:58:49 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: tony@atomide.com,
	lee@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] mfd: twl-core: remove unused add_child and add_numbered_child functions
Date: Wed, 22 Mar 2023 07:58:38 -0400
Message-Id: <20230322115838.2569414-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang with W=1 reports
drivers/mfd/twl-core.c:654:30: error: unused function 'add_child' [-Werror,-Wunused-function]
static inline struct device *add_child(unsigned mod_no, const char *name,
                             ^
add_numbered_child and its only caller add_child are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/mfd/twl-core.c | 65 ------------------------------------------
 1 file changed, 65 deletions(-)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index e2d9a93be43b..e801b7ce010f 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -594,71 +594,6 @@ int twl_get_hfclk_rate(void)
 }
 EXPORT_SYMBOL_GPL(twl_get_hfclk_rate);
 
-static struct device *
-add_numbered_child(unsigned mod_no, const char *name, int num,
-		void *pdata, unsigned pdata_len,
-		bool can_wakeup, int irq0, int irq1)
-{
-	struct platform_device	*pdev;
-	struct twl_client	*twl;
-	int			status, sid;
-
-	if (unlikely(mod_no >= twl_get_last_module())) {
-		pr_err("%s: invalid module number %d\n", DRIVER_NAME, mod_no);
-		return ERR_PTR(-EPERM);
-	}
-	sid = twl_priv->twl_map[mod_no].sid;
-	twl = &twl_priv->twl_modules[sid];
-
-	pdev = platform_device_alloc(name, num);
-	if (!pdev)
-		return ERR_PTR(-ENOMEM);
-
-	pdev->dev.parent = &twl->client->dev;
-
-	if (pdata) {
-		status = platform_device_add_data(pdev, pdata, pdata_len);
-		if (status < 0) {
-			dev_dbg(&pdev->dev, "can't add platform_data\n");
-			goto put_device;
-		}
-	}
-
-	if (irq0) {
-		struct resource r[2] = {
-			{ .start = irq0, .flags = IORESOURCE_IRQ, },
-			{ .start = irq1, .flags = IORESOURCE_IRQ, },
-		};
-
-		status = platform_device_add_resources(pdev, r, irq1 ? 2 : 1);
-		if (status < 0) {
-			dev_dbg(&pdev->dev, "can't add irqs\n");
-			goto put_device;
-		}
-	}
-
-	status = platform_device_add(pdev);
-	if (status)
-		goto put_device;
-
-	device_init_wakeup(&pdev->dev, can_wakeup);
-
-	return &pdev->dev;
-
-put_device:
-	platform_device_put(pdev);
-	dev_err(&twl->client->dev, "failed to add device %s\n", name);
-	return ERR_PTR(status);
-}
-
-static inline struct device *add_child(unsigned mod_no, const char *name,
-		void *pdata, unsigned pdata_len,
-		bool can_wakeup, int irq0, int irq1)
-{
-	return add_numbered_child(mod_no, name, -1, pdata, pdata_len,
-		can_wakeup, irq0, irq1);
-}
-
 /*----------------------------------------------------------------------*/
 
 /*
-- 
2.27.0


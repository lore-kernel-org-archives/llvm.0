Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709CB1846
	for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 15:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679241555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kCgICu0KJAkXhiDRi5y/cM8U5p1k5bVMfl4yuYsdSQw=;
	b=cBQOV33r6m2p7NOk8mouN+hDJjFpe8Ar8pZu0XmxI8QQClO0X8zCh4oon4cuBCZPLFzKkf
	rnBlqMPWrjBrjlvs8JYyZ4Ilm+/SRCzdyV+aTt4ieIIskM+cIsH6DQq13Q9CeQR6DELWwP
	eIylrl02Xz2YbhMqAIgQjsugohjiedU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-rLBHgrpbMqm3WoZlrUNLTQ-1; Sun, 19 Mar 2023 11:59:13 -0400
X-MC-Unique: rLBHgrpbMqm3WoZlrUNLTQ-1
Received: by mail-qv1-f69.google.com with SMTP id m4-20020a0cbf04000000b005befcfb7d82so2911254qvi.7
        for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 08:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679241553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCgICu0KJAkXhiDRi5y/cM8U5p1k5bVMfl4yuYsdSQw=;
        b=axUo+UJdk6iloWW4VSmele5Fc9rRMDPvuSEATe1IRcY+tHVJZsltMfDHJVPh6ujLNl
         gGTiPpLVewXJeBjHNuKG5i9Z/NgmX2F1/u1hHoLOXJ1mB+4yx0LeFT/b1uah4FmZLPlT
         6u5lNv3kInOUdLaeRKKFA6TL3+T24fNT8/QdPXW6mjdoMtS2R6zazRKs9Q3QZZUkJ93y
         B4Br/TGCT276vDMZFNStzM5B1Zo+AZGzvuX3A7Wi6d+P1LzaawfqFL625yF4u3lVWrzf
         hg2QoYPqGJFvh6up2z8x8lWXOm2FpqMi6f17ATy9VIW6XaOfc/T4fnusi0FlLrdfaZGf
         ksWA==
X-Gm-Message-State: AO0yUKX08qYa7wvLICEyvsre44FYzzMfGHrg/kKDxIACC3mQE0FbKRp1
	tZzQBhDtYu0MJWTyNYLAcF+eYxvaWz1gfuiex81aPzAwH2rTRKegt6peu3xCrZn0RXXCrmI8wdV
	xHMJNapa/aXw1JA==
X-Received: by 2002:a05:622a:188c:b0:3bf:e2ff:4c2f with SMTP id v12-20020a05622a188c00b003bfe2ff4c2fmr21989744qtc.51.1679241553401;
        Sun, 19 Mar 2023 08:59:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set9RY95IxUSoePkpXXO3x85piRzikUJ7diUt5Iu32z8WZrgmDSs16y56U1ABCRU7Dph61q/nLw==
X-Received: by 2002:a05:622a:188c:b0:3bf:e2ff:4c2f with SMTP id v12-20020a05622a188c00b003bfe2ff4c2fmr21989732qtc.51.1679241553187;
        Sun, 19 Mar 2023 08:59:13 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 139-20020a370591000000b00745a78b0b3asm1710434qkf.130.2023.03.19.08.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 08:59:12 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: herve.codina@bootlin.com,
	gregkh@linuxfoundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: gadget: udc: remove unused usbf_ep_dma_reg_clrset function
Date: Sun, 19 Mar 2023 11:59:10 -0400
Message-Id: <20230319155910.1706294-1-trix@redhat.com>
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
drivers/usb/gadget/udc/renesas_usbf.c:548:20: error: unused function
  'usbf_ep_dma_reg_clrset' [-Werror,-Wunused-function]
static inline void usbf_ep_dma_reg_clrset(struct usbf_ep *ep, uint offset,
                   ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/gadget/udc/renesas_usbf.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usbf.c b/drivers/usb/gadget/udc/renesas_usbf.c
index cb23e62e8a87..84ac9fe4ce7f 100644
--- a/drivers/usb/gadget/udc/renesas_usbf.c
+++ b/drivers/usb/gadget/udc/renesas_usbf.c
@@ -545,17 +545,6 @@ static inline void usbf_ep_dma_reg_bitclr(struct usbf_ep *ep, uint offset,
 	usbf_ep_dma_reg_writel(ep, offset, tmp);
 }
 
-static inline void usbf_ep_dma_reg_clrset(struct usbf_ep *ep, uint offset,
-					  u32 clr, u32 set)
-{
-	u32 tmp;
-
-	tmp = usbf_ep_dma_reg_readl(ep, offset);
-	tmp &= ~clr;
-	tmp |= set;
-	usbf_ep_dma_reg_writel(ep, offset, tmp);
-}
-
 static void usbf_ep0_send_null(struct usbf_ep *ep0, bool is_data1)
 {
 	u32 set;
-- 
2.27.0


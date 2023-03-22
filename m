Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C867C28FC
	for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 12:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679489897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TIlkqLegAeBC+m6CULqCYBtfGXGiuVBtfnZhQsPJi1c=;
	b=SuMISo12SX8QsCQ0Tk20n6SGBbSu6dKxKtKtUAMcesqNoun0dtA+JXpRC/U87Ta7x2wlBs
	I3zNh0a22L2KAtc5HuEGQ9xNC4U0sYSNUwiGSddYI+4in0qMzqQHwtKOk5LcIMVL6dUB//
	SkjB99f+FayFA/W1iqsqBUUJX864g2o=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-RbEByEr6N9yhyN1tK-peSA-1; Wed, 22 Mar 2023 08:58:09 -0400
X-MC-Unique: RbEByEr6N9yhyN1tK-peSA-1
Received: by mail-qv1-f71.google.com with SMTP id a15-20020a0562140c2f00b005ad28a23cffso9128354qvd.6
        for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 05:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679489888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIlkqLegAeBC+m6CULqCYBtfGXGiuVBtfnZhQsPJi1c=;
        b=VFoQfRob/WYAuFyZzDUFcCwq4wGgLAPpi+GkkXu+2XdaL0TS0Ea5HhAgqlFNJZnFxy
         KuTtsRMt5iXjfva61KAoufaXGPSXcmyBsRACfoVXXYgm0e2dqx6KGBKrLYsFV6LR+A0U
         pc8Le5wHi775vInLl0usK8gyxAYAD7Pu/+Hu4WodI5sjFzXJolJM7AfMaeBpKTSZ+/MU
         4uYFfgP7Xqpf/q6E6/D9WR3DytLSHdYXZcZuMp/tMS+hodekJ60Dm9+9YEy52Gz64VkS
         JUU7cDACwQRXRfmJni+WYTg7rLmOt9jq9oq6gVt+sfiaOUjVKe0HjPzuljZhyREEUUOP
         8EHg==
X-Gm-Message-State: AO0yUKWFDvquHi+MldbcFvBBgQTNXgdqBtmI0mzFLX0OT3PKkv7flrMO
	osBiWgf2L3V3y7N/iZwXL1+2VdqL8gdtJPKpGFA5nnlIr4Emi7U7Mzxza3iacm45cTsaLadgqBQ
	ilJeD6CDdLKtyrw==
X-Received: by 2002:ac8:4e8f:0:b0:3e0:61d0:f7f7 with SMTP id 15-20020ac84e8f000000b003e061d0f7f7mr3644647qtp.14.1679489888596;
        Wed, 22 Mar 2023 05:58:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set+ZXo2BL1krc+p+oXQftVChy1UR6ByYgMLDN+KiLPI5b2ZE0C/8zB2LdH0plZsW39kzr5AVQQ==
X-Received: by 2002:ac8:4e8f:0:b0:3e0:61d0:f7f7 with SMTP id 15-20020ac84e8f000000b003e061d0f7f7mr3644621qtp.14.1679489888366;
        Wed, 22 Mar 2023 05:58:08 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id j9-20020ac874c9000000b003dffd3d3df5sm6394388qtr.2.2023.03.22.05.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 05:58:08 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: tony@atomide.com,
	lee@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] mfd: omap-usb-tll: remove unused usbtll_readb function
Date: Wed, 22 Mar 2023 08:58:03 -0400
Message-Id: <20230322125803.2570968-1-trix@redhat.com>
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
drivers/mfd/omap-usb-tll.c:128:18: error: unused function
  'usbtll_readb' [-Werror,-Wunused-function]
static inline u8 usbtll_readb(void __iomem *base, u32 reg)
                 ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/mfd/omap-usb-tll.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
index 8ca4067da6cd..69cbc2097911 100644
--- a/drivers/mfd/omap-usb-tll.c
+++ b/drivers/mfd/omap-usb-tll.c
@@ -125,11 +125,6 @@ static inline void usbtll_writeb(void __iomem *base, u32 reg, u8 val)
 	writeb_relaxed(val, base + reg);
 }
 
-static inline u8 usbtll_readb(void __iomem *base, u32 reg)
-{
-	return readb_relaxed(base + reg);
-}
-
 /*-------------------------------------------------------------------------*/
 
 static bool is_ohci_port(enum usbhs_omap_port_mode pmode)
-- 
2.27.0


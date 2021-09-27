Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BDF3FCB
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 12:38:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E18A60FF2;
	Mon, 27 Sep 2021 12:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632746314;
	bh=e+bNLTCuq7rd5GH4BwuiLOjI8vpmkyfEg4ZBAUITB4k=;
	h=From:To:Cc:Subject:Date:From;
	b=OKrYssl09h3Pv6UhJfR5x+oAeOwNOTHdwJLafsN/xxC9MyBlraGZMJrDuBCsOmjrw
	 WwfOgbvBy/WAvs6bSqFP/8o3e3hKm1ED8SpYSB0EKYkqelrvINKXIqEiX4F8UXI00z
	 ro9rZRfIGcrJxro4iABlc+13sXCM8m2q+waYrZwauksbInTmtnmzD0qJ48cXZb+hk0
	 Is5FE7ETemZMvq4rrYHVC1EZ9pUDkgUbcFum+l1TvjUud+McuHesPhp7FDXP0nlUcr
	 weVHvENc0q53WERk/A2TLH8aatlAPUfSJiI1BVBCX/agB763oe0puwUjKftqAMXb0E
	 2DhZ0O6ColWyg==
From: Arnd Bergmann <arnd@kernel.org>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Felipe Balbi <balbi@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Rikard Falkeborn <rikard.falkeborn@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] [RFC] usb: gadget: avoid unusual inline assembly
Date: Mon, 27 Sep 2021 14:38:20 +0200
Message-Id: <20210927123830.1278953-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

clang does not understand the "mrc%?" syntax:

drivers/usb/gadget/udc/pxa25x_udc.c:2330:11: error: invalid % escape in inline assembly string

I don't understand it either, but removing the %? here gets it to build.
This is probably wrong and someone else should do a proper patch.

Any suggestions?

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/gadget/udc/pxa25x_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
index a09ec1d826b2..52cdfd8212d6 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.c
+++ b/drivers/usb/gadget/udc/pxa25x_udc.c
@@ -2325,7 +2325,7 @@ static int pxa25x_udc_probe(struct platform_device *pdev)
 	pr_info("%s: version %s\n", driver_name, DRIVER_VERSION);
 
 	/* insist on Intel/ARM/XScale */
-	asm("mrc%? p15, 0, %0, c0, c0" : "=r" (chiprev));
+	asm("mrc p15, 0, %0, c0, c0" : "=r" (chiprev));
 	if ((chiprev & CP15R0_VENDOR_MASK) != CP15R0_XSCALE_VALUE) {
 		pr_err("%s: not XScale!\n", driver_name);
 		return -ENODEV;
-- 
2.29.2


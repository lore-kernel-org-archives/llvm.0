Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C2C43AB7
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:51:34 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6907e44665bso2250177b3a.1
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405094; x=1696009894; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zImIKIqhOC0JjIYPrD3YIO1bPD4ZjWOlSN8lcYpsf6s=;
        b=OJzEWiiRDrSJBu5SOCQTlyK5ZXN/p/vn4kRRM75BTgtE0/6AQ2qpUHVf8c1/RaO6fY
         M0YP456lhW2BNTiyZKVfUUBPwDpvcfv7zMJHJ6g4iXeph/kAfEPgCfkTfGE4y1ueRZzr
         Iz6CVY3aCrK6xbFCEZuLFMPp9JS0tR+mGMVQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405094; x=1696009894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zImIKIqhOC0JjIYPrD3YIO1bPD4ZjWOlSN8lcYpsf6s=;
        b=Kcc2eUjQ56oL9yByouUsrh23Fn20h9Ib2NScpspvsZ3+SDoY5QRo4eeaS1nqjfOaTs
         ttiR4PuwrPljDjwbDNaK4qvBH1TXeEFIsxPhkyQV5ZKxUDFBldKevOFJSs31oBj8Ughx
         MrG6YJbaRuQfTl+RIakGnYJ03FtFU+kUwhB/rvysJZjfu5ntMXk2nMJ4bZqUeA48tcIn
         px1GGUkjUTrEnP3SP/tsRHlkuRrh5xf8ZBTKkLaJAhFQD0HETTLs/kq0DmRrbzGNPSeV
         h7yzTe0D8jDkAh6pXJqyaJVFLv05bVsiURleJ3B9Z0eWYpX0vGzG0s7p7DgSIDweEvy9
         uz7g==
X-Gm-Message-State: AOJu0YydsM0HVwTaihtj2mqqDj22LL3racTcKgvVQgdTgJc+Hv9fyiMh
	1cqlTDzYJ3rz5tXDIDOGbuY9Yg==
X-Google-Smtp-Source: AGHT+IEYYptw0+9UxsBkFMm+xCNLTAlvlc4VwNyOSgculGB2Hj2uBhFKvrLo2zEAv9fjQs4NAvIGMQ==
X-Received: by 2002:a05:6a00:14c2:b0:690:28d0:b7b3 with SMTP id w2-20020a056a0014c200b0069028d0b7b3mr153527pfu.13.1695405093734;
        Fri, 22 Sep 2023 10:51:33 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b00690dcba0e17sm3585690pfa.19.2023.09.22.10.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:51:33 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Kees Cook <keescook@chromium.org>,
	Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] irqchip/imx-intmux: Annotate struct intmux_data with __counted_by
Date: Fri, 22 Sep 2023 10:51:32 -0700
Message-Id: <20230922175131.work.718-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1459; i=keescook@chromium.org;
 h=from:subject:message-id; bh=mvFgO9v5w2MsRDjwkJuQ6DC2ihWdFPibyg0TMHS5b5Y=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdQj18/exFGglEhzz/3o7XP1T9eIIjqKTUULZ
 ltYTkOtcfmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UIwAKCRCJcvTf3G3A
 Jlj6D/9BqGkE2W574Xw05XGeAb3CJxzSEdnLhcmqWJNeogYU+KV88H3NybOUiCfp9zf+KC1yjg8
 OarGW7ESXkT0amr5GFqz6fzX3V1SXLO/V51G6kJDDj5BbJLWNJK8IJZPQ1nMnyb+wIvjCmCsnzq
 w62V7vklfDGTF92LSXY5cwv5m2x2pObAZUng1ykQLgilxTo15p2ZXgLjk7QpIAt6ghoKcNZ/iqZ
 xt+XzolLJnXDkrl9g1uwT2WKJIBe863fabXwcpvxtcW63AP/Waut3igfrvAxc7ECcFEImfIGK0b
 71Kj/aEfV6BIQazzTszq/xAcbsITzg2MQUGtrLMdynneIk7l11BifL/CelQNZ7H4Qeh6l+kPVId
 u8AoVMPYH8YR/QXiaOnaHdho2a2l+XT1oLJeFfstRokrOwbLx90eDHpnbIzPeEqWPDmFpQ1NaxY
 CE0iop56AlfvXQwTVQMMLTBn7g6DvEi1+ZbV4qE/Bjyl/NEMpH7pAaw+lrqcGVCcMGXbeq/sh6Z
 qY6i3svt2Red91t7+Is8XG01LbBqfqVzDbx2m9DZg6xxqHTCM/Z0w0UFqXo7B8l/QNCM950hpoZ
 jyyr/mgHUXhjPOFxM4zZfKxP0KqE7PAwo6lN9rYqPM43vpXiBhML88yfSw9Ffe0DMO+aV5qxFFe
 AqWpvZf SE+5Plyw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct intmux_data.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/irqchip/irq-imx-intmux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index 6d9a08238c9d..aa041e4dfee0 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -73,7 +73,7 @@ struct intmux_data {
 	void __iomem			*regs;
 	struct clk			*ipg_clk;
 	int				channum;
-	struct intmux_irqchip_data	irqchip_data[];
+	struct intmux_irqchip_data	irqchip_data[] __counted_by(channum);
 };
 
 static void imx_intmux_irq_mask(struct irq_data *d)
-- 
2.34.1


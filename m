Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CFA2C82
	for <llvm@lists.linux.dev>; Thu, 30 Dec 2021 15:03:24 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id e5so50937229wrc.5
        for <llvm@lists.linux.dev>; Thu, 30 Dec 2021 07:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=38/yrVuWSAfCYSbaKGGrfM8L6s+RDj4K4yPYyiKvNiI=;
        b=GWLNgiwUblJV0XxdpM0BHtrR0T9SWGhFZtuJgSIJR00tliSRguVOWwfqB8AofC4QZJ
         IeiQLrtSxAuIEB7fZqlWNnYHWW9qXaeUCTIdoAo3VjDs4EZGEKNsVKyT3dF5q+gX1jGN
         Yg1l1FjIXh0lfthfcQKf0fqnb7QXWUK+c0plhJ6tFzq8w78GUfVf6mohUfCKKh7LW9dV
         TF/SRfhTA0IbZnGeB55ogvoN16amdo+ZGS4UDevb7KW5FmP8UY8pAeWjxXA+taDm0XXw
         Vgdj7wNDWkC8sQPZxA9O+3Q5P32s4e/+lLmZwd9egvY39GeCZ5LQSR7ydeCe1V4VtRdC
         7KNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=38/yrVuWSAfCYSbaKGGrfM8L6s+RDj4K4yPYyiKvNiI=;
        b=LrB5Uey0c+NeBnELe9TZW7PuotBM0FkkPCo5MG32bjdjPKxOO6zilGKjFksDgH4FmE
         3o2kYsSZemvKjyG1DKgpIoHCC7ZoEDNqvKCoL/tXD7YOzRvv16ZMD4bbO4kyV0n79SgC
         sPxhyvqeqtXaurpBWYzwm2I3dpAdoNbAC56/RQyi7tGaI5A9LGB3wiyfNVS98ZvpTFXU
         iLc14e1H6Uf7Be9bAOlywiU+Qv4e3VNa/+k3k46Xn1l3/jXDRFA0QIJ0GjY94yr/u6OY
         YSUs7WYXu1/A+KykoJlidIXWqdBaUhSQ4yptjFmoQaIEudBI5XcJKZ/n5FZuCHdiCtxb
         ZXJw==
X-Gm-Message-State: AOAM531PYv2mqOteN+zdfm2iu9kYhgjyTWaGtCEWONeoPq6qWhQ51L93
	TZ5sSqUAMVBWtoGH/TENdLM=
X-Google-Smtp-Source: ABdhPJzJFblslRqe6k6soT6bYdtvRM6FNykV+vZhVFF5Q6xgwEU2Lbu9NgObdfMxP3WnVFj4GCN+YQ==
X-Received: by 2002:adf:aa93:: with SMTP id h19mr25146605wrc.293.1640876602739;
        Thu, 30 Dec 2021 07:03:22 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id bg12sm30555171wmb.5.2021.12.30.07.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 07:03:22 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: socfpga: remove redundant assignment after a mask operation
Date: Thu, 30 Dec 2021 15:03:21 +0000
Message-Id: <20211230150321.167576-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The assignment operation after a & mask operation is redundant, the
variables being assigned are not used afterwards. Replace the &=
operator with just & operator.

Cleans up two clang-scan warnings:
drivers/clk/socfpga/clk-gate.c:37:10: warning: Although the value stored
to 'l4_src' is used in the enclosing expression, the value is never
actually read from 'l4_src' [deadcode.DeadStores]
                return l4_src &= 0x1;
                       ^         ~~~
drivers/clk/socfpga/clk-gate.c:46:10: warning: Although the value stored
to 'perpll_src' is used in the enclosing expression, the value is never
actually read from 'perpll_src' [deadcode.DeadStores]
                return perpll_src &= 0x3;

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/clk/socfpga/clk-gate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
index 1ec9678d8cd3..53d6e3ec4309 100644
--- a/drivers/clk/socfpga/clk-gate.c
+++ b/drivers/clk/socfpga/clk-gate.c
@@ -34,7 +34,7 @@ static u8 socfpga_clk_get_parent(struct clk_hw *hwclk)
 
 	if (streq(name, SOCFPGA_L4_MP_CLK)) {
 		l4_src = readl(clk_mgr_base_addr + CLKMGR_L4SRC);
-		return l4_src &= 0x1;
+		return l4_src & 0x1;
 	}
 	if (streq(name, SOCFPGA_L4_SP_CLK)) {
 		l4_src = readl(clk_mgr_base_addr + CLKMGR_L4SRC);
@@ -43,7 +43,7 @@ static u8 socfpga_clk_get_parent(struct clk_hw *hwclk)
 
 	perpll_src = readl(clk_mgr_base_addr + CLKMGR_PERPLL_SRC);
 	if (streq(name, SOCFPGA_MMC_CLK))
-		return perpll_src &= 0x3;
+		return perpll_src & 0x3;
 	if (streq(name, SOCFPGA_NAND_CLK) ||
 	    streq(name, SOCFPGA_NAND_X_CLK))
 		return (perpll_src >> 2) & 3;
-- 
2.33.1


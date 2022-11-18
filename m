Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A086AEBE0
	for <llvm@lists.linux.dev>; Fri, 18 Nov 2022 23:31:05 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 136so6291829pga.1
        for <llvm@lists.linux.dev>; Fri, 18 Nov 2022 15:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=33uTqF7+W9KqoilqutefSDNFwFq6HUhByT2ijkZ5G9U=;
        b=W7BD5tRI2ij3JGhvPX7uO8vqAdAyVOqI9DLZKtEoNRzDBDtdyxCMAXG4j1tyxVCRUJ
         vovMvBOZBrVZi/mehG9tAFdBnkNYl/5uVOONDWEVQbnKxaAnud8exlwTl0qnL+ACLAYb
         CAp+d12k8Q3YC0kSv41zBn2Y5Sh/wxJWEbiuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33uTqF7+W9KqoilqutefSDNFwFq6HUhByT2ijkZ5G9U=;
        b=uogH678RgNvkStFjRL32+7qTMm7Ag6dF+Rm2vQcNA2nl7oOI7GQ5qvnSjl+yWWPvFT
         fSwwq/zj/Bx/KyyVA6BqI4mXuc3X8H9mRFiMojq6kViYgr/RofvYwE4blDGa9XWVAdxC
         kM5kYdynfAJhVNP2Y7a4Ivk3g0+yZgWKCkQfnXexLjsSSpb46TT7ogpbjbsx0A5K3Gv6
         IcHxp3kMTHwYzowZJNyGJpHEHqEZmBsbp7G+uGJ7b2qC/ML0t5AFtOlDLfz+T7QaIHlK
         Ob1yjSTiys2g2YRL7veQe0xcrvv5IYIfQ5wixWMI8bzoI+b72IGFmpezVDcc2jqGJyWf
         sF7Q==
X-Gm-Message-State: ANoB5pksIJQGdXdDNY5F4x122E1Pkb/oIsvtQrQWwClwiwNDU34+ky6P
	s2SArP7v9vzndtDmkMNk3lYgiQ==
X-Google-Smtp-Source: AA0mqf6wi59hZOm6qV685//732ZaWyFw539tCrYb7S5osK83avH6C4bX0DQYRJw1N6Xnew1vP6XUiQ==
X-Received: by 2002:a62:ab18:0:b0:56b:9ae8:ca05 with SMTP id p24-20020a62ab18000000b0056b9ae8ca05mr9949345pff.59.1668814265054;
        Fri, 18 Nov 2022 15:31:05 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902f60100b00186ac4b21cfsm4261573plg.230.2022.11.18.15.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 15:31:04 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Daniel Palmer <daniel@thingy.jp>
Cc: Kees Cook <keescook@chromium.org>,
	kernel test robot <lkp@intel.com>,
	Romain Perier <romain.perier@gmail.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] rtc: msc313: Fix function prototype mismatch in msc313_rtc_probe()
Date: Fri, 18 Nov 2022 15:31:02 -0800
Message-Id: <20221118233101.never.215-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2135; h=from:subject:message-id; bh=2uMBrJl4p11kK9eP2yD/st+7tL8825ju2BfNzfsIAFA=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjeBW2pC2rpMYTXJkLShGmag664z+K5tiPE3dQug6d 6k7LWyyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY3gVtgAKCRCJcvTf3G3AJqmjD/ 9x/r5mwDVIWZVDGrRBJNY7gBhWQVZs9Z/nqdCrOe6qOkAmhPjIchn1IB6cV1GmDz8UW59kGEtnLdS7 jC1s1/P6gDmZxDY0YrSjBwBrCYTjgk5SEdiG7UleuvQHMDj4ivlWWYw1Yqt2M3qa6wWcjVLZVrBwiW xRgtgPDq8FVLfcjzIztHR/cnfpj5bIFbB4IgjY6l3OgpNY7mssysn2+ggS9aSPfJ5gkG3pPvGtWIi6 EEtLfAjNUNWlED/tP+Tkmmp1PTPTQy6PgDvNCMJrygx0Fv75AsxP7RlPthymvYAGFF+43FCQgQSmLR Yj7JsKW/WC/nTnrsPgyoJME7NdMR3xSOQPspj3DlCxT1EwEn3CEnDdQm/A9amOcCGkiWLUF0Ad0ML7 Qbw+Hf8rGp4VNDDvh54agrBrF29dyoWZj0Dc3fYNZmv/eBV0zjd9IoTkeC1viSK1Bjb1xVrQixTci5 kvaylDZn64g0v7V2S6i8HppnbUtYlHLV973KUmaqypRQP9FNfwo959Bw+LcTa/SCVjNB75LTr7PxaQ cLrhF9jVvisMmnMX44nc/0YGD+rAGhjVRAZkNiyaJycNQd4UJRIMsuTYjBuNUuIZCoL40Nc5IQo+4k qDdrX+pjyAvguJBTMEt2wCJMJIn6QqaLdnvI6LevBtHnBsoy8iGJbeGEZ5JA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
indirect call targets are validated against the expected function
pointer prototype to make sure the call target is valid to help mitigate
ROP attacks. If they are not identical, there is a failure at run time,
which manifests as either a kernel panic or thread getting killed.

msc313_rtc_probe() was passing clk_disable_unprepare() directly, which
did not have matching prototypes for devm_add_action_or_reset()'s callback
argument. Add a wrapper and remove the cast.

This was found as a result of Clang's new -Wcast-function-type-strict
flag, which is more sensitive than the simpler -Wcast-function-type,
which only checks for type width mismatches.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/lkml/202211041527.HD8TLSE1-lkp@intel.com
Cc: Daniel Palmer <daniel@thingy.jp>
Cc: Romain Perier <romain.perier@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rtc@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/rtc/rtc-msc313.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-msc313.c b/drivers/rtc/rtc-msc313.c
index f3fde013c4b8..36e3e77f303e 100644
--- a/drivers/rtc/rtc-msc313.c
+++ b/drivers/rtc/rtc-msc313.c
@@ -177,6 +177,13 @@ static irqreturn_t msc313_rtc_interrupt(s32 irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void msc313_clk_disable_unprepare(void *data)
+{
+	struct clk *clk = data;
+
+	clk_disable_unprepare(clk);
+}
+
 static int msc313_rtc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -224,7 +231,7 @@ static int msc313_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare, clk);
+	ret = devm_add_action_or_reset(dev, msc313_clk_disable_unprepare, clk);
 	if (ret)
 		return ret;
 
-- 
2.34.1


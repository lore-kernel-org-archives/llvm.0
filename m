Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0F83EDE78
	for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 23:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784072555; cv=none; b=N1WOCgwdN8pfNKUCrS6KK4kIlLRy7Of1z5n0sWSp0MtRycCbRs2w8poPHfBnYM6qP98MSA3a12IjikRifvYTQJLD8I96DUqZNzHCzpO1aqzWSG3YfpVV9INH1U1JjBpWDSnLDBqXZSPvCaLfq50wwbKOyqA0nrnwKRt3zZAtmxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784072555; c=relaxed/simple;
	bh=DIgognXgae4/GVNIoSHQv4tSnIRy6YAm2SspBfvmHtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iwqKy8c1vdSl9/uZrfvJ06hf36GzJB8jXvLc8qNqWle4Y7rs0/Aj0aHEXjQ4GRiZXwdXt3P2wCwiQYWw1fz+dBLFkxO+tuVuVFTnyKQM0soyj6OaewVVaS6MGxE9ObdKq2V5DozTQZKiGCYK6Ky9GmcK9JIOONLE2un4fFelCzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wvap4JuT; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wvap4JuT"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38759bcd877so4217647a91.2
        for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 16:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784072554; x=1784677354; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hLFUs5RlkL8vn6uwW0uOp3ziZXbVN3pyew+ndI5sC2g=;
        b=Wvap4JuTrUe/Vu9vioISH1g56UQI+NZOdZq6ZvHPzhSgwqdvWI8nxUaUat3HMcRjLy
         19dwONVu5R0tkAwxau31U0eaFse67xmSlJPzuSqoWWUcLDKGFCc5iPsvkWwBIVaEIxe/
         zloQYNWuFGdter7w4pgOEiAabn9lcIKEKbErLE3zoJOGDEn3wKBp60nAI7idEKWcnPvF
         90QxatL8/W0hSvhkHMiwWouOhxBDqOPpIK8xfzfTqtcfDDX1CpE96NCWp2EO3ReNZS6k
         8xJ4jbgv0bKlDqmHtjeIyGAC/mlel5yHWdRxry0UkUOS26i6NtcbQmporJiuT4duC6tg
         X/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784072554; x=1784677354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLFUs5RlkL8vn6uwW0uOp3ziZXbVN3pyew+ndI5sC2g=;
        b=HAkYMaym+9dAsVlW9YiBKPpnQUmN3/J18njIWiVWwRNja+2eDmSn3nMehebuIfy7FI
         aXlvLhsmQyEXFxT090ibMusFrgOei/LPMne7u69X4kre+uOoE/xSjYXqXIOSOuzjWpBW
         QxuX+otV5UYQkpMP0A2MlZR8HFStm6aOxpm/dkM9yg72vwrRBAq1RcZ6667XcTP9LBus
         wl/mSoHyBpUFS2JH7crTkHUJfkZKmx23gnaNySEYuTwdKXg/bXhHEQxVsePRBO1+0c3y
         3AVRzxMiaWdP37q9F3auUT2LJRhSxMCq1eMedjDe3tVgJblKv2PDnBNcgNTAeNhJbHBS
         kEBw==
X-Forwarded-Encrypted: i=1; AHgh+Rpz17tVapMfkcjqP4tGNGBXNEoocv5h8Fnce2O2TD3VVqBN78uxJ7qARkJT+qjTtcxraCqU@lists.linux.dev
X-Gm-Message-State: AOJu0YyDVbDY5kOKutus86nQA9oueFQLsX5UX0UNciX30Er3CnwLe8Pm
	haRsrpk8uRWCpnj1V68pZm4RiQzQZm54yzh5FResv82ALhu7MCQpRTpO
X-Gm-Gg: AfdE7cn0V+FmEF091q5Xz6Uk3paFuYQifp7z/Zk/yh0b7K1scZ0I++b3eUjNGgdwjos
	MJmnTOcKBr1nCNmvYiwmPvmt755M8vu5FshjP7q7Sn2fxjr5oG5r85ADmH1yl4bogfFNS3hNRu0
	Jsvn5R5AmR9QHlrKWHMO7ESIdynBFYR+ZU2T2nLacMNGzqmcCl6NQe7fyWPCOHP7BlmiJbbz2sV
	8rI8dyuuMs6FCTe6+BbdjofdyYOMUKiVtN5M8qXXrGa+U7c95Mm9cznP1RHxkH/nrmHNLhqfpY1
	tX85nyjaA0q0HAj4YjHgx5s/eZ5SeZ85JlwPYDloa1c/5+plSBO2yKe4xPaIy5iP0VpysYq+7XE
	TwboqWrlg+IahqR1MZOq9cW3C4zZ25Ek3ByCe9C1VlZ+ygHRq4tzYYNSiqhGynZyFQYKGzTCUHo
	m86AsOuSSPyUrVYMN0j/7B7ga+wrJ4WNHjrmwZVuIHxhcg5zbyGTCAlzU6U+Q00xMRqVpkR/sLY
	FmOEXBvQH4ZQgDmfU2HFIGHUtCg3oglPd56/yyFhObZZNj/vO3sebdTNBxtV2uHHw==
X-Received: by 2002:a17:90b:4c02:b0:36a:c4b:76cf with SMTP id 98e67ed59e1d1-38e2a0c346bmr532833a91.23.1784072553829;
        Tue, 14 Jul 2026 16:42:33 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e279sm124751785ad.45.2026.07.14.16.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 16:42:32 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] gpio: logicvc: use devm_platform_get_and_ioremap_resource()
Date: Tue, 14 Jul 2026 16:42:30 -0700
Message-ID: <20260714234230.886636-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the regmap fallback path, replace of_address_to_resource() plus
devm_ioremap_resource() with devm_platform_get_and_ioremap_resource(),
which looks up the resource and maps it in one call. The helper returns a
pointer to the resource, so update resource_size() to dereference it.

Drop the now-unused linux/of_address.h include; of_node is still used by
syscon_node_to_regmap() and platform_get_resource() resolves the same MEM
resource that of_address_to_resource(of_node, 0) did.

Built for ARM (multi_v7_defconfig + CONFIG_GPIO_LOGICVC) with LLVM=1;
drivers/gpio/gpio-logicvc.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-logicvc.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-logicvc.c b/drivers/gpio/gpio-logicvc.c
index cb9dbcc290ad..54a7598c7384 100644
--- a/drivers/gpio/gpio-logicvc.c
+++ b/drivers/gpio/gpio-logicvc.c
@@ -8,7 +8,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
@@ -102,20 +101,14 @@ static int logicvc_gpio_probe(struct platform_device *pdev)
 
 	/* Grab our own regmap if that fails. */
 	if (IS_ERR(logicvc->regmap)) {
-		struct resource res;
+		struct resource *res;
 		void __iomem *base;
 
-		ret = of_address_to_resource(of_node, 0, &res);
-		if (ret) {
-			dev_err(dev, "Failed to get resource from address\n");
-			return ret;
-		}
-
-		base = devm_ioremap_resource(dev, &res);
+		base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 		if (IS_ERR(base))
 			return PTR_ERR(base);
 
-		logicvc_gpio_regmap_config.max_register = resource_size(&res) -
+		logicvc_gpio_regmap_config.max_register = resource_size(res) -
 			logicvc_gpio_regmap_config.reg_stride;
 
 		logicvc->regmap =
-- 
2.55.0


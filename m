Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D3628642B
	for <llvm@lists.linux.dev>; Sat,  9 May 2026 02:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778293956; cv=none; b=p9+/fiDsIsb6S0VjDJGCSD8jKh1Gh9abf2dy/6W42p+xP8dEKF2hml73mBaGo7GU4DULpVbSm+NUaJMyCNxUJJmKxUp8BNU2fm5j/FmDNbnKR5uuSAUWPrdhuPbelpl2XIqfYOxJ5EZ2RWLWTieOQP1JQvlacxl+A/O6lurO1CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778293956; c=relaxed/simple;
	bh=fA7oaoZxqVEjq0kZcVJxdmy40Yl8hXJB64+PRpREUNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dl6qu8A+3ANBBtPSAqwrmUQ+B7ym14xvO2qGPMmu7zR5ZYP3JBDxzbipHFu+KD4jDbLCucPlBqAGZRXCv1q90Jx+PuXVaC/ha9dG+8NkVPlUjktuzxuaxwPslbKCci15ErwCjSDp6nmoP1GI6IRk5iKt/xU01uWyGYX9ZD5QRaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwOM4/yB; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwOM4/yB"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36535998b71so1361011a91.0
        for <llvm@lists.linux.dev>; Fri, 08 May 2026 19:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778293954; x=1778898754; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZPdHm0q9SvrzYQMg8Dbr5jBrgv/q7vwdsG9Ut+oYhE=;
        b=EwOM4/yBU74WbsFFnBwshvFERj7PhNi4RU0tzoaqVBhzuFdKUTkyNIykgTzzBxXHir
         g6P6QAT9K2By44LqseJAWkX9E1nA+eNprVJ9mp0yWrZpUb73YXHqErTuwsSomMIK/b89
         rKzKvT8viykDh/ZOCOaVP0ZGT1EY/YdbowbOwG0HcAqOZSKB4sVIBos0hdbRLyJUT97y
         44Hc2LVbIeaPPUiIUjaYDjm6Ydhb6qKXZpacEfiytKnCXjJsvncfba6ExNmIp4UecQsO
         +x0a8BmFg6FjfPp9V8YAqJVavnvjAU7s75Fvh4KeFJ01E/er2P46Acq06vJz5MaOrmL3
         erwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778293954; x=1778898754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZPdHm0q9SvrzYQMg8Dbr5jBrgv/q7vwdsG9Ut+oYhE=;
        b=CujIQAR1t5U8+kz5Kuq9AWzDRCO604cpqOgwX57GX9oFK4ciH4fqgyC37j9Bkt2gVh
         RTjOYxs7W6B/RO6jvGFx3sLlfCOCThQgcy8wIxG+PR8GPwQkBEahyYBoQYeAyXGDKfFE
         /onREz3cwSPdBrs7j9hUm1HT1i3Z/FZz7fIyOktyF6ySIDAy8MuzBtLqhJBPnHfXsnbl
         TQBG8O+qIZ6+rAW2Ia2c6noDb5P0/AzP702RqX8y8/Qw+IeIJNVMIYzOXQ3QJg5Ht1HA
         VFz+BLQHHDTri9F7Chez2b06J0GZNwJxFtoc/2KtVc2A9mzOxYPsHE/k1Fg3SW1SXWsL
         BknA==
X-Forwarded-Encrypted: i=1; AFNElJ+GK/Tb045PhNM1ptNXi+t1LZaWiI9eBh/vs5ZeZDJeCDNQS+q+lsYGzmMgtO2igU35x1kY@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4EmIh13fkYKZi698kRwk+3THodr5To751lXv30sQdNuJ1jO3W
	6ZeQymtxSvAnu+ftWsP2Hlx7dqA2cx4M97IiqRPQ4QvPXPKnTrGpaF8g
X-Gm-Gg: Acq92OHe9bsFAAvv9qeuCCLkMX8/wc/pRhk6LliEYi79wjZhdesm+AsQF06hcny/PI7
	0rOGxiYkYI8wubHUKrNbKLyz4gturDxcV5p4pWfWKxNr3ah/8F/MyxNUuv/WAq5XO6bV1Lry2Mn
	tZs4INO+y+Dkw7+d4gmOxWYM8IlpVDbunPMql5c2QB9OokQvwR+V9rLmeYUI+c1/KHufNGnRT4F
	8snGGHS9O6h379DOU2Sv9b3/NnqtEWf4Hz4QKfbsdxJUIuyaBy2HR/HEgaETKeaUA+NqMBox4aG
	N3hGLw0Hcm8afSHL2Uc0czFzYB+P6l/bk1lzeJdPXhrjnGc868owwZClFKny37O+BL114UQlmCK
	zIVObWAT6J58XiFbgBQOe96+sgVB+mBoI3xzjCnMl8cm6/x5COJtWtxgYkXsBsSKTN9pPoGbwAJ
	IONvm4atnJQ3chZxRrymyuJb2uFOnQANZysMKnlgtZU94NEiIlVXXXN8Xd7MOrOPc8xzikoHdwu
	TYeNILo8VTbMgVbd0H7329jEassh322S4UFOFfEmcf/Eg==
X-Received: by 2002:a17:90b:5486:b0:35f:b230:5889 with SMTP id 98e67ed59e1d1-366053e90a9mr8708315a91.6.1778293954445;
        Fri, 08 May 2026 19:32:34 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d623fcfasm565406a91.2.2026.05.08.19.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 19:32:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] irqchip/keystone: allow COMPILE_TEST builds
Date: Fri,  8 May 2026 19:32:16 -0700
Message-ID: <20260509023216.1007175-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Keystone IRQ controller driver uses generic platform, irqdomain,
regmap, and syscon interfaces.  Allow building it with COMPILE_TEST so it
can get build coverage on non-Keystone platforms.

Tested with:
make LLVM=1 ARCH=loongarch drivers/irqchip/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/irqchip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 5b379415a817..1dd3f2aeac97 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -404,7 +404,7 @@ config IRQ_CROSSBAR
 
 config KEYSTONE_IRQ
 	tristate "Keystone 2 IRQ controller IP"
-	depends on ARCH_KEYSTONE
+	depends on ARCH_KEYSTONE || COMPILE_TEST
 	help
 		Support for Texas Instruments Keystone 2 IRQ controller IP which
 		is part of the Keystone 2 IPC mechanism
-- 
2.54.0


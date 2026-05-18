Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5783A1CF3
	for <llvm@lists.linux.dev>; Mon, 18 May 2026 22:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142371; cv=none; b=JLmcdvBc0ViTROJiWFhxgaLWEWxLfCYReZzSxl8z/mZCm0NdM2pTsBV/I8iOV4FdgiZKmGptSYeIHIJuo2q0rxbe3FOaeIr29UF7psyvdTYJ/HpwRAcZF1MNtezhisFnOUCGVdxxwDYAQRZE44Sft++FswCN6tRX3zch0BBIr6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142371; c=relaxed/simple;
	bh=J+tgaVmppo6bMeaWb9ihVDpwoliaqsB7qyiETjGZhaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CrHSX76A99g8TFm8/bgtmY9Od1TJUUDLG8nlDTBcfcZeOfaN6Lw7tytUYtDB1OEqZX6LOGUhwkxDv39cdhQBr071SKL6t0K7OyYjh4kL1i72Fo4v2NL43XUQX+dtqixCqmYEzgsdGoAJOP9iN8lKqsCxTeV8Wg6sW1jJRXyASsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HA8iiLp5; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HA8iiLp5"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82748257f5fso2410730b3a.1
        for <llvm@lists.linux.dev>; Mon, 18 May 2026 15:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779142369; x=1779747169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kpz3rbq9P9pH8i5JgQAH9XRkEkwWKb9Pq31/YwXsa/0=;
        b=HA8iiLp57MWZcG4e0lm9gKymlxVPYBUDqeNBGSpXaXYd7NGOS3E3IB8c0GnySTux+f
         FyaWPqNY0a0MdUQ8hPIAPvZedy8m+s9OKU0a02Ua4OoIdj57FEijJpv/9xVaX/fiKJI3
         uvd5xbEvd/1rSYYPM3Qg8G1tkjetaZ8aIAj+EtiMjgMiSE4Zz53I++MRDfy2kztNPCoL
         1dOy7Dn0PfXSru6T8JT+2r7hey8u8RAJe3vFg/oN+HCGK99lfR9XZ3wkuZFYRi7Agsay
         BwumOi9ozMvRUPmf4EehnM67P8NVoZtG5iqOtdaV4lmBqQr/cgAgPey8tBInbo6gTAK/
         azVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779142369; x=1779747169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpz3rbq9P9pH8i5JgQAH9XRkEkwWKb9Pq31/YwXsa/0=;
        b=cNkvCSbuDZQ9Aeoo0BpqUJH48mXnx4Xo76DCW6O9DmlMkwFcvVPl8ENAMd6SzV5Luw
         gCgLw274SJamLVIUI3JSVb6Qj4BWx9vSJEoCUo2B2864f27Gm/SLIajrz9NfjSS+JnHz
         8MxbRxdHKqZHA9JfGZD59IBHKLSXSUPabke8yHZI6mRh4gixUfA3XQOZvRP5QBL2QC99
         HbGvNrEbw5qOIGJL7PqO+1ysC+pEtw6JH2AtGyuB2eKTnQyiMZN8rhrgmzvOsZostyfy
         PZC5yBVtvlpiv605hezKYCu7/N4Nap3jITGbjyyGDcLQS0XPt22tWoADD1yw5zox2M6f
         OYPg==
X-Forwarded-Encrypted: i=1; AFNElJ9FbVOYvfPKIDm18DQsjQQMsXmg/KjJO8a4GE8xTAiIAuDe4O/H/3ifb+d2fObR0eTgd8hR@lists.linux.dev
X-Gm-Message-State: AOJu0Yzku6VTJeu4fyK/RpSwKDY8mYpf1wF9jGVsaH+TXrEFDLS7aW8q
	7IZ0ivcD8QryePSvPifXoZurv5QHVAJifroWWNxAFHWWTqYTc15oGxyO
X-Gm-Gg: Acq92OGss9lK3TDWnF6oUlu8au+1F1NMAXi6xSwhE0xYpXjC0US+s5wV8lB2UbsZTrL
	UCLlhf1RklNzHylzh1BmQHXvTNFBr/Xd60SnFtGwpD4wlEN4EtDm/s9C7Tg6UkQ0HdHMj2aYtpG
	3thciX3JS89EXUcI+5vw4A/oAhWTk8zEm91aHXa3gHt1Y7cW0hu47QM2I7S36jR81iBVzzpiic2
	zPzX17OrPK4otRC45vAY3P7EsARAwIZHDQ2K5LvyHlJ15Xq+i5YUnXJXhX+hzX5Qk4503Z/xXue
	DSBIPjpoWYbGyixbPI0M7MDJPAfg1Mk/a5jvRqo6ro5pRuxH1zJAkmPI6UrdbkIz5K+Y01hM1jb
	5jKXFdtcFZf8vXVWQhsiNXR1rXic647OSqtxRdg1/tlEdEAsOgoq6tEb++Bwnm2szuFSj8RHl2O
	UFdvrzs/MIWKFEZXjRJupHV8a18ljXNj4X+09obKJeQRFAjxuaTnehDoDBuCR5gH3u6MN75h0JG
	8B5tWNcZZ+KipcZmSn33fUaO4B+mo+W8A0=
X-Received: by 2002:a05:6a00:12c2:b0:82f:9a88:9092 with SMTP id d2e1a72fcca58-83f18ee3862mr17241901b3a.33.1779142369233;
        Mon, 18 May 2026 15:12:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cca8sm15870899b3a.56.2026.05.18.15.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:12:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] clk: stm32: allow STM32MP COMPILE_TEST builds
Date: Mon, 18 May 2026 15:12:30 -0700
Message-ID: <20260518221230.19879-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

COMMON_CLK_STM32MP already allows COMPILE_TEST, but the parent clock
Makefile only descends into drivers/clk/stm32 for ARCH_STM32.  Use the
STM32MP clock symbol for that directory gate instead.

Building the STM32MP21 and STM32MP25 clock drivers then requires direct
linux/bitfield.h includes for FIELD_GET(), so add them as part of exposing
that compile-test coverage.

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/stm32/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Makefile              | 2 +-
 drivers/clk/stm32/clk-stm32mp21.c | 1 +
 drivers/clk/stm32/clk-stm32mp25.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 9c3a9703ad92..0cd2223de3ca 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -150,7 +150,7 @@ obj-y					+= spacemit/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
 obj-$(CONFIG_ARCH_STI)			+= st/
-obj-$(CONFIG_ARCH_STM32)		+= stm32/
+obj-$(CONFIG_COMMON_CLK_STM32MP)	+= stm32/
 obj-y					+= starfive/
 obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
index c8a37b716bd5..3c143371c77e 100644
--- a/drivers/clk/stm32/clk-stm32mp21.c
+++ b/drivers/clk/stm32/clk-stm32mp21.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/bus/stm32_firewall_device.h>
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index 52f0e8a12926..cc95fac66449 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/bus/stm32_firewall_device.h>
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
-- 
2.54.0


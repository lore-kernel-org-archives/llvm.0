Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA571311C32
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 21:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784497848; cv=none; b=slcuG7mhMH8xLSs+HOwloh/YrxObgugnjCzOYJDNrz8YG+HRYvX1ikbbY2it9RlAwErfcVkuVVmHxNB5IzwUJvvSlNIj0H8dUnVVUVpgOffnNtgdo0ZTHNLszoevOFhxorMBwJn82usOSY0T78JnHbaitzCwBGKipgam1R/5IW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784497848; c=relaxed/simple;
	bh=z2jvO4b7tvtzk/zUy5qdlg4JlkqUFIt42V4sDGTZLWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gYVALd89agobEGgYCM2nYhQFgyPJNHtsm87d3PytkVxWyzv5Z1vbga23O3wlUFpDD/4fW//LCuW+pR6dWXD/AXJLwstWYYzIl+O7hqKfuUjJNiF6X+K8XUFVt2gFUqPXJFS3k9fNDC/iMdjuDbc/0+58vqiq8o47hOU220lMYU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTtkxfcR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTtkxfcR"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso66154575ad.2
        for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 14:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784497846; x=1785102646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhJl3YkYSOoC4SqmTcp6WH/00PPU77CFhgqYr4GFFyQ=;
        b=MTtkxfcRZTXet3J+rk8Rnd7Z1drQqG2iwKUMyiytahdflP6GRobVJkkcoFUTofq5Es
         Vy4Tn2+OGiYGPXhynoVTBDPOkp3EnsZPefXKFF7P5XqNOtyk+areLQvXa2+A6NKujKpE
         yM5VMsn1ylZax6J5ViYb3Duh6oYH/L23CA5YqSf0db75jAuH7G9v572mt3epSdAjX8lM
         60/tLziatbK5IrXEXQ0itGzcMoUFKGpiIHe5n/gGtYf6WpGNea8auMG/KxTyyHq6+tFR
         9xq/UBtznPylumllYKQNp56st27h2SjvkfKr2biNag2oSEi1rlji3NzUSXbolMKNA0EI
         a8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784497846; x=1785102646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VhJl3YkYSOoC4SqmTcp6WH/00PPU77CFhgqYr4GFFyQ=;
        b=p+bfPNxwMtsiPo7dHSTnm2AGm5TWBtCJZ+CLhrTtlTdx+NRQQx67E3kKsFG5YcSPTi
         Va/F3BtxN3OHutBWkSZ/i60ZwJAWV85ug138SjW72hHiKAnJiIxvmjDTJsL/o2q36Ngz
         2kDDOJcnK1iS2LwGILON1dQiugjHLmUTeGuP0az7dZskntsZGj9KjrUx3h8X4v+6uwAq
         Cr8dZGN1QlYpiLwXygeY6kbqa7GqnPaBoaHW3Oi/jxz3ERhncebi9ULwLYni4ZK3pHpT
         Lb9W4MH5kPWzfwtf89BFPBbdL4upsFnrnsyEXfFmxAf8eBD9iqtotif5Cg2av83yCtfZ
         VMmw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+Kb6T9fe67r86/0PlMlX1ZuIPpOYkYBdNyDX1unlVEe0EXRV5+640Ge/a7A1MlnD1bgsG@lists.linux.dev
X-Gm-Message-State: AOJu0YyA+uCpUQoVwMomUaa/FkZyV6X7TtYKLH7LRtmZY2Tw+frgSaUe
	0ibJV1jTly5ujx2XnX9z3t48u68WNCRrIJFaE0E+yeDy2Znnw0u67BN+
X-Gm-Gg: AfdE7clnaKevutNbuLeH0Gr3prPDmjOl+oMC12xszqRWuYhsoWzIAasBAjsQrScoLsR
	XuZ9oObqpTUX0iJZBEqbWAgMiEuvUBUYuHZtrtafSkCrE8H7oU4r/iZXEo/LjUFeKIXvldwyYyO
	dsa6iaeqMUdLboxBtB40A99Va2FEoU5iBBhmr/whXm6PXAf5dNvyy4O39HrhLdr5hBMXt3UZj8t
	dIok8CZtbdwjC1o2BfeDQZEhwKFsLbFjdzGbFSNSoilFN2YjOOKTau54tWKFuKIDwZbGIH01h3d
	qd95GS1WDmzhe7HDSzNYCmjbI8Jze+8fhEkOsyJV/pnIlFIPPISjvxIZF0dt4wtIRJ2HpaqW2c8
	gZA5iCqzJf5JJuKPZnZlP/G1RRN7tZ8/kplMqFxZt3DqtOabrmiHqwqhGdCPbeUvxyDxJiYKcDw
	xI1zqNbc/ZWIX1+w2LKlNXKnVmcBiVLu9+KD34+1QEY8O7LKTTfYPCCdMkZT4yrf1kSFxE7xjFw
	xmQkFkUZ9NalKDf8HZE4jV5oDGsvLEdq3lM04MWzf1Vu5vgz9yJ8h8=
X-Received: by 2002:a17:903:a8f:b0:2ce:a600:6022 with SMTP id d9443c01a7336-2cf34850c21mr126436495ad.7.1784497845982;
        Sun, 19 Jul 2026 14:50:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b78e2sm44745845ad.24.2026.07.19.14.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:50:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2 1/2] clk: stm32: add missing bitfield.h header
Date: Sun, 19 Jul 2026 14:50:39 -0700
Message-ID: <20260719215040.767232-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260719215040.767232-1-rosenp@gmail.com>
References: <20260719215040.767232-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It seems some ARM header includes this and the build passes there, but
nowhere else. Note that the driver has COMPILE_TEST in depends.

Fixes: 37ae8501cdb0 ("clk: stm32: introduce clocks for STM32MP21 platfor")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/stm32/clk-stm32mp21.c | 1 +
 drivers/clk/stm32/clk-stm32mp25.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
index c8a37b716bd5..bdb17419908c 100644
--- a/drivers/clk/stm32/clk-stm32mp21.c
+++ b/drivers/clk/stm32/clk-stm32mp21.c
@@ -4,6 +4,7 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index 52f0e8a12926..eb0bc918ecee 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -4,6 +4,7 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
-- 
2.55.0


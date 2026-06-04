Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4043C4B9F
	for <llvm@lists.linux.dev>; Thu,  4 Jun 2026 05:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780551661; cv=none; b=A43wp5cYrTZHwNzXoP9HCQV0dDkjQ1/w6RRBheuM1thxCK9NAkIcXJ79io+5MrbAXk/bC41FpKIRE4JJeLTMxaFBq/GW/3mMOiNOcYPl4pttTvcH+1zOSnwwl2w0ss/4nG3TMTR4ZHdPuSKefn4WzyZ8jGrT1fYiAuFosxRSHM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780551661; c=relaxed/simple;
	bh=904hfk+1/sPDYqEKZWi/BogqSgfzWSRNP+4wfvbsumg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GFtHSFusNl7dKYsD5rjTlaEfkkUn2qySzUoa5sWToYLzhUTaDa75c5SCzztHWKDN4gRxVFaMOvZxae7b2f8QhVet2WS2kmontOd9HE590bnHTHe+sMsOOfUXYMr2H3yoxG44N9J5VQf4ygflVboI4lm3pTG3PFw8rVfAsuKXrFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAA4JALx; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAA4JALx"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7dd5a8dc8a2so2358717b3.0
        for <llvm@lists.linux.dev>; Wed, 03 Jun 2026 22:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780551657; x=1781156457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LREGCnvB9r3+rbw8NbYyQSnfAuuxbV3j4ZuR6PAmnmM=;
        b=EAA4JALxJmiswSg2BN9kNPiZeMM4/TO0g5fkeFQwCy/QCprAIO7EOCxrTUCuZiF9HX
         lCPHJrgUlsSy6d56sEidmpOVG31wDB9K3ZYaBtN366Z5MtCGhAWDn1X0eDoGeZ0eJBPm
         nolD3G76O9VrMJfyZDRZ4BF0A8zX9hnq4dRIDbChMcqb6gjww24/Q2HLz3y0HL8T8dmG
         cvS7/m7lnQULdrIl+pD1dBQPyTzzYDfyQSoAKhuBIr8ljKf/baXClT9Wj3WWoY8XSb81
         csGjNWTNfnfgLDUGIXPS/ypv5QioH77bmIfqPHBG9wShXTO9JOkUsSnWrjG65Vgti11a
         hppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780551657; x=1781156457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LREGCnvB9r3+rbw8NbYyQSnfAuuxbV3j4ZuR6PAmnmM=;
        b=K2asw9jQsfjOnAsmpJXxL4CNGJK3v2P+R+RLgCDfNXvSK2ymvf7jF3PE3fKueDHGgG
         GIp+ngBTvVaqVpqF248o34Niyje6kfzualRhQCW7cW5uDL1G5Tn9qD4rL0lase7bCvzt
         /mFNApUPeR/XqqIwy86xfhKpVXMx3vNfLzK4XGsg+ruYSRrnaQGh9qX9mpNDCbuoXgd6
         ft8U7WspY5/NBWmFMmio+7W3+OwhfujXQkov54u3h4GfMPOJ5ISJt7vvMoIsiRbId5OQ
         3cLKfGXWnDi19z0ZtIQqmRRgHDeBLJ1r0iWsRYEKTT9r/lA4f55dPH82VsAB6xSRduMg
         UKMA==
X-Forwarded-Encrypted: i=1; AFNElJ97Oqp4rSS42F3JKg+1EQ7yx5wyirAqgVU4cM9Vi9TqBKgz8PjEvV1nn6kpF05/qSRLw7tu@lists.linux.dev
X-Gm-Message-State: AOJu0YwmzW4DVlqOi9C4mHLjppjowVYcD97mv0lhbRZRzJ5VjZ07168Q
	B6+RsCcrEe5bKAG79n6GfuOa7FdpmJBboGNiP/Wpb98E3258A+22zVJd
X-Gm-Gg: Acq92OEeElO+WmWJ2Lfe2d0JB5Th/QMAnZ0t2+BPEmtNCCfQdBoizV7wAF67Q/0rDJt
	WfYaPtS6sqW5grywO1c4sKK39735E/Vh06n5D6mwdeyzAJ63JzAw/bEwtvyJzKxShtK4lEesiX3
	7k0eTjIdiT85OtoSUFhf+UvxcPXvUGiTjJrSAkN7oUTPy7ZA6k7bRo79dnOCjZpbo9R4dyw09eb
	a1fd+lnLNSwcgLgUAgIrSnIvzfEBdLJbcKtGF2v9ArPyNYVBHP4jT5abrDEU1BOEBe6/oS7JXVj
	y6ViZKid4BiwI8Lkv0VBKOZ+DWyoNOkUMHepvIVU4rzGEx6E1NxnnZo+0CCQby/1gQSH+NAlIoM
	pha/CjtbXcpW9XhlS8geFwEvD5TdM2UZnkpUB9K2Mo8NC+2AsB8sS/J8qxuUhY38W83FXcLhpmY
	xneYi1EOkgqnD6nB7nistD4cyJfDKZBvPDdAqE8weBuIXGDiRogH0w5J1a9eIqVnTUwhBwXoZoF
	usfNuR5GecEt9OBgo6jCvd2H3MMjRGbXou7BcWuPrx+6oKZkud/5JD2TDNvu0xNE7bdXA==
X-Received: by 2002:a05:690c:6d04:b0:7b3:3a49:752 with SMTP id 00721157ae682-7ea4d2715cemr58826857b3.41.1780551657199;
        Wed, 03 Jun 2026 22:40:57 -0700 (PDT)
Received: from localhost.localdomain (99-61-165-33.lightspeed.sntcca.sbcglobal.net. [99.61.165.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea23592beasm29137517b3.32.2026.06.03.22.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:40:55 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mithil Bavishi <bavishimithil@gmail.com>
Subject: [PATCH v3] ARM: OMAP2+: Add CFI type for omap4_finish_suspend
Date: Wed,  3 Jun 2026 22:40:48 -0700
Message-ID: <20260604054048.18980-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_CFI enabled, OMAP4 can trap in omap4_enter_lowpower()
because omap_pm_ops.finish_suspend points directly to the assembly
routine omap4_finish_suspend, which lacks the expected KCFI type
metadata.

Annotate omap4_finish_suspend with SYM_TYPED_FUNC_START so the assembly
routine carries the KCFI type metadata.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/mach-omap2/sleep44xx.S | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/sleep44xx.S b/arch/arm/mach-omap2/sleep44xx.S
index f09c91978..8b515f300 100644
--- a/arch/arm/mach-omap2/sleep44xx.S
+++ b/arch/arm/mach-omap2/sleep44xx.S
@@ -6,6 +6,7 @@
  * 	Santosh Shilimkar <santosh.shilimkar@ti.com>
  */
 
+#include <linux/cfi_types.h>
 #include <linux/linkage.h>
 #include <asm/assembler.h>
 #include <asm/smp_scu.h>
@@ -58,7 +59,7 @@
  * stack frame and it expects the caller to take care of it. Hence the entire
  * stack frame is saved to avoid possible stack corruption.
  */
-ENTRY(omap4_finish_suspend)
+SYM_TYPED_FUNC_START(omap4_finish_suspend)
 	stmfd	sp!, {r4-r12, lr}
 	cmp	r0, #0x0
 	beq	do_WFI				@ No lowpower state, jump to WFI
@@ -223,7 +224,7 @@ skip_scu_gp_clear:
 	isb
 	dsb
 	ldmfd	sp!, {r4-r12, pc}
-ENDPROC(omap4_finish_suspend)
+SYM_FUNC_END(omap4_finish_suspend)
 
 /*
  * ============================
-- 
2.43.0


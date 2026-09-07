Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF0219644B
	for <llvm@lists.linux.dev>; Mon,  7 Sep 2026 00:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788742674; cv=none; b=dWF9ZBaA7C78/tB/9ScQKpTFiEdlt+TcfOLS9ojGVamsoxJlrLjdJ558VJ8+R5CfwF2zi6IQT1jUkqszeTg9zFEIuejKAbJm8BVbnhL6PwfX4tvv0ApqnxIZJ+eHe6lNB5BmlI//kaUTP0HasXUbqIWnliuT7ZMniaV0LrCLn4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788742674; c=relaxed/simple;
	bh=AZjom2PB7UknyQo7QhwjHMw2wFDh4BjnRhyJ255BnGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rLFnrD+V56M7lgwDuKEhRLIrWuSG6UWeWtgVtMtGkKSLBGD2RYBU+vUR0EYKPzdGCwxtWSrbrE1Ybkt/jwdm+YtfwF6nyzdtd5Cd1Dp1YX4E6Fg8beKPv9mkyFknlAqACKywEHY1VbSEqSCPRwnARJsSbnHEvj54ky9ZAfaizmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EoP9GBii; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoP9GBii"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e041ea211so2207069a91.0
        for <llvm@lists.linux.dev>; Sun, 06 Sep 2026 17:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788742672; x=1789347472; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9KBRkywu7hyFM0XGKbQfON7bqnqwREZTWQJYpAcPCSE=;
        b=EoP9GBiiJBDgDE69BJXJRUhEzl1x9dwfFdd91XQQU8q2e4ai4EYetVfHaMQOXJ66lL
         fJooVnURE+huzN+VvksNyZuzr36RAqQwTDlbfmHJnd+HzMAk9icDmTyRY7PsJ1KqC+Y1
         vwVWSWr6kqttUxQbzshEdEXak01Lw7/YHVuHeOIjsaUOPrD7jx2YWXrcUgjKwk4G3Jfe
         RpYt9DRWo0OQCCQjEvpWVQFaGI8ZWCVeWwgp1h+q9J9dU6uzrTVxv33Ub5voib9eB2Yz
         ZqmvZyMCiyPCEcZiFj1jctlzoOKCEZJmzEGaUkFniQgHT5C+YLGbXI7pApKE+kVz5dtU
         VAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788742672; x=1789347472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9KBRkywu7hyFM0XGKbQfON7bqnqwREZTWQJYpAcPCSE=;
        b=pOpMRkj3+aqz3U96MSaIXKMmaiiQ+X3GZdWonNdM0jbOz972tvEqAvoG/gCLeRn4MP
         Up1tH6A+LdKAn8611Oe0QsvvLytxjYeltOOMyR9w0dHqUkZwOyVeFn9/5pffJWI9wfMT
         y2rteuh2pxD63mhN9PkW22JRBgyoI1iS7yNS80EVVIiHYoNwukyV3bQQtg89xr1nexdE
         1GP4GzMc0TBwQhF096px2aQcrm5TKwIJ5FZTMFK0cUGijUIN9Y/JTgdgX7KN1CmHkIDs
         2Cn7Fj7HGtvQ2VlR7hkOWjYI+0nxifCew0C/1qOEtQVrBTeurwxXSwFNESDMes/9Sb/0
         bKfQ==
X-Forwarded-Encrypted: i=1; AKwUvBybGZ4JGh/zcoiVgLCwopeUY07TVrvV0/19fcHS//Sc7u0+3v+6ea6KgU+vZCcmXQBsJC0f@lists.linux.dev
X-Gm-Message-State: AFuF++mfkRVBh+p1css8ZJNdrqRbUEp/yZ5wi0TMRfWyobkb9YsjMsRM
	kUXB2IWcW7b9bbHardaWrUxLd6T6dUERwI9S7wCZkzGaup1RCU5kyaRz
X-Gm-Gg: AYBFou3yx20ZrOyN3IQLMIJKuLB9uYJObtdM+RSGCTO1rppMeDaty7z3kWyIRu1S0j3
	TCmQnwjIFOQh+HbJQh6nPBBaSdWwGnotWOh92MEQF9ZpY4R5o/Gs2uFTHvm4qI2AwRh8BkdpOya
	bL43g85iMa4dsQekeDKHiZZdf+6iVrdEjNTJc30TLttylLxQkMJPQlue17aFnuP4xDmBTtVmwsw
	/8b2kV2gJ19SmjUprX8/eVxHeBgkJEbTMeV0ntkptpNr9jIHiNMSpJMYWrQrsMVJJV2GrpiaU5g
	3m2rTLOpdrvjGkjMCtkSayao2kl8DMM5oMuo/yesgglap1gF/I9xMaWp+58zoK5Y9hFvlQxsqrh
	uRHqyMxuyOrzvrlIytDQML3kORgdJexD+c8prvA60RnWkBZzoeXk8tjbMb9JfdRoSTkQ7SaGG+5
	4Mrm78NIcWK7f+oR2iZHjz8pyQGiIT/7sN03gKutaLQxkTFpd1kq/97MfdAY0/d+TRAbas+4BL6
	EVPEQRCeIT2L7KljUyQPWDwmkKTGtueJSwTXi5/f3H7XrCesk08Drs+LIGrNbhNuAh2WrLzHKs2
	DObLNQAyWYqrWpKOjXJFU18Bv84ELGg5bTzgcA==
X-Received: by 2002:a17:90a:149:b0:39b:2b10:d05c with SMTP id 98e67ed59e1d1-39b2b115ba1mr20193005a91.5.1788742672057;
        Sun, 06 Sep 2026 17:57:52 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612ba2bsm16853496a91.14.2026.09.06.17.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 17:57:51 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] spi: orion: yield to scheduler in transfer wait loop
Date: Sun,  6 Sep 2026 17:57:50 -0700
Message-ID: <20260907005750.230103-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

orion_spi_wait_till_ready() busy-waits in a tight udelay(1) loop, up to
2000 iterations, and is called per byte from the polled, byte-at-a-time
transfer path. On SoCs such as the Armada 388 (e.g. SolidRun Helios4),
which also run SATA over the shared internal MBus fabric, this stalls
the CPU for the whole transfer and delays servicing of SATA interrupts.
Under sustained activity this can cause SATA timeouts and link resets
(sometimes renegotiating down to SATA II, 3 Gbps).

Add cond_resched() to the wait loop so the scheduler can run pending
IRQs between polls. This is a no-op at runtime unless the kernel is
built with CONFIG_PREEMPT enabled, where it lets other peripheral
interrupts be serviced during SPI transfers.

Built with LLVM=1 ARCH=powerpc; passes checkpatch --strict.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/spi/spi-orion.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
index 26a9f268b2d3..b8882229c054 100644
--- a/drivers/spi/spi-orion.c
+++ b/drivers/spi/spi-orion.c
@@ -370,7 +370,16 @@ static inline int orion_spi_wait_till_ready(struct orion_spi *orion_spi)
 		if (readl(spi_reg(orion_spi, ORION_SPI_INT_CAUSE_REG)))
 			return 1;
 
+		/*
+		 * This is a polled, byte-at-a-time transfer loop. Each
+		 * iteration busy-waits in a tight udelay() loop, which can
+		 * starve other time-sensitive peripherals (e.g. SATA) of CPU
+		 * time and interfere with them if they run on this SoC.
+		 * Yield to the scheduler between polls so pending IRQs can
+		 * be serviced.
+		 */
 		udelay(1);
+		cond_resched();
 	}
 
 	return -1;
-- 
2.55.0


Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623942749CF
	for <llvm@lists.linux.dev>; Sat,  9 May 2026 02:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778294130; cv=none; b=JFTTydMgKtJGKmIyyy+UKjI9/cYtIBPJT1sV4PNiOkvyZDdbb2faHRrE3BnQ1zPPUI3e52ZfO5OUVCjc+KgxoLoFZxPTkmezqkjdpVkI8AEdWZsiKY8ystj0kKY//thP9snTqx4ztvx2FYOw0O7I9yU7zoE7X1wM6MJ6x4AVLaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778294130; c=relaxed/simple;
	bh=HknV/e2HsCNnnSrsthMy0nUB6YGffUvN9uWGBS/Tz+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wu4csDScjpclK651p4+9kF0ZTvnEbMPrXCtjp5/1CMDFG2w4qwn2Ef3KsNFX96Es85j2sRpL1uxllR72IJ7s5ymbGZW1bo9z6iEqqjUgWkpO3pcM1THtQtQl1pQynVvcalTufyP9U4yBqks3qieUPoSH3Xp+QjqIDNNEy2qx+II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOGjMHNv; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOGjMHNv"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8353ca0f1f1so1344948b3a.1
        for <llvm@lists.linux.dev>; Fri, 08 May 2026 19:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778294129; x=1778898929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qElcWGVBZb4wbebRZ4xq/fdpNN+CqLINj0J3D5PSn7U=;
        b=eOGjMHNvZ8wzGW7lBTQeNSSqrb7jHlGIsKfQkG7VlmizXupzBWhEXq9n/LXi8BUlP1
         g2bQ66BP2U7ZynW1R2HX4m9MYUszwpyeKPSl4ZCh2mfcmR3kqUvQ5MRTcw77nSb3ahdQ
         bLyVCsPdPr7EwGsOoawI0gTZQ8a2oPkShqHx6UTZBYBd1YoBcU+RYc8pOQpocupmHuzM
         o/pgciGe63QOokHIncofIfF5IegLYpATqKayrvR4Ql1N7UeFQjzKeiyoz55sDVCCgygU
         7Z+DHnV6uNNNZoYu5HEnFHpmloKTM7RVQd7jCNRr9Wdrw+FGefv/ySFJvssdPct6GSqd
         ocfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778294129; x=1778898929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qElcWGVBZb4wbebRZ4xq/fdpNN+CqLINj0J3D5PSn7U=;
        b=BqP8zn2oSQfcH9rES/AHAKk196xOVhSSLYLWQlvYJM2RzedpElEjkrWBOwFwoW7jhq
         jgDADGjCUvFE1XFaqOKR7UIIlI1NuOfenzbtvTBaxoSwT1jf1krj+7Ec80m/7M4MSRs8
         SM5YBq0sV9KaZiHN6ml0VGCDnWKQnmn7vZb49bv9ZJeRdXuKQRnmJeVvYaEftxg7m9Ke
         80XGEbTh6UVMX0d+hzPKwuXjxLV2JfOvQXorvFCzX2ZL3FdevEaS1fUCyqbTd4nlktn0
         rMdPNClrLD4rEjrNR8i0y8o8i+8N6/dpE2qVPgGtDDuR6hpeZwkAQdg43xFaQV07s200
         gTcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9U2iIGoMFWA/yFCNuQbItu8EsPyd+28LkXLh0j+rHq1IqySTFXGsZDluOG36f3gbQiNMq0@lists.linux.dev
X-Gm-Message-State: AOJu0YzgZmIsMQPuvuRrO1m+V/vMWkTzJ6PxijRqSzGbIWzc0qlvKYMi
	+qGQy1LkozuSY5ey7jX5oScDySUuwbK8VzKAPRblpiqdL2zY3Nre0GK1
X-Gm-Gg: Acq92OFBLU2FsJWtcOKHH+DrbwaWb23k5jL1UOfJ+oLeUUeweJLl82ad3z8OInewgAu
	8FtwpKmXIXT7P5W/0268ys4xLNmvNHxPpV2GK2wjQp5eWbHk2rBRsgniZDh3SOxRHjMV8mBRn7t
	tP0a2dy/U2lprcnnhkLLh9zt2vGxDyPS8vc8zmBDAk/A6K3UK6MqSBWGkE/g9svptGsDv1z6c/A
	2eXos7YL3Rt4XVf9hcfMrHTubWW6ocJCDBahKWRGwfZaEAJzP6wvps6T6IDQz+1brPCYn6LGG+k
	7hp9VsDQ6RTJg0X2cfbQnwfBdTwwjWIgmgyvCWlFyyDDNfeCn29vO1oESRl6wzAKXi8XXJzSLy1
	hDG1YrxAgD3qfB2spRtIF+YVQk2q/pKhgbzNmIgVPCOyMhOEsbbQe4J1q9xPCMhEOwWMyGojyiW
	MRgzoxgtAT5X1yfESXoi1Fih66axKE18ZSnSE3/atYizTpwpdg6CcVjfM4g/VN+ELLVkO4X8cEL
	CsUfBIXfOjVuObzJXQ6UprwZsquTW6CO/U=
X-Received: by 2002:a05:6a00:a214:b0:838:1f6b:dcbc with SMTP id d2e1a72fcca58-83bb65f3f6dmr8241774b3a.6.1778294128532;
        Fri, 08 May 2026 19:35:28 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563ac51sm13797942b3a.2.2026.05.08.19.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 19:35:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] irqchip/ls-extirq: allow COMPILE_TEST builds
Date: Fri,  8 May 2026 19:35:10 -0700
Message-ID: <20260509023510.1007532-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Layerscape external IRQ driver uses generic OF, platform, and irqdomain
interfaces.  Make the symbol visible under COMPILE_TEST while preserving
the existing Layerscape defaults.

Tested with:
make LLVM=1 ARCH=loongarch drivers/irqchip/irq-ls-extirq.o

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/irqchip/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index d7dbfbc1035b..81b93b9dda2f 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -468,7 +468,9 @@ config MVEBU_SEI
         bool
 
 config LS_EXTIRQ
-	def_bool y if SOC_LS1021A || ARCH_LAYERSCAPE
+	bool "Freescale Layerscape external IRQ support" if COMPILE_TEST
+	default y if SOC_LS1021A || ARCH_LAYERSCAPE
+	depends on SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
 	select MFD_SYSCON
 
 config LS_SCFG_MSI
-- 
2.54.0


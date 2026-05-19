Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565FA258CE7
	for <llvm@lists.linux.dev>; Tue, 19 May 2026 01:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779152418; cv=none; b=WLwmVFt1kymBZmWex4UUw0FWkZ+mvWlVdFkux9yL9qB3dNry3SgKqNunnFb2TQt4J2VulmZMAixyJ+oBlVNn1TvQT3wIUxsGWeTcW6iC0ED1zzdqIo9Uc4QFrjMFwrBtz5Wa26aNepSm0pbs/JP5Yp5mN7JA3yHGoOhYZ7Lg3ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779152418; c=relaxed/simple;
	bh=9/4QdOoYt5GXCxv767gp0C8p+Gqp7DJJXOLTLhCLH2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bs0pLTGeCzP57z0FXlEpHxgEvRTtHQKToFAWvDLQbRk3ta/hBynjwjv5hbUItK0BxRvkEnlzZsGyOn4frGryCpjk4HCgK+xZEVz5mc5PnUsKun617MXFjLbYk8sFnYt9NZtymliJ8puU0uyXvjwztH3Po1Zf8VFmLHY/2wNFpBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfP3rhb9; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfP3rhb9"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-835399c11e0so1276367b3a.0
        for <llvm@lists.linux.dev>; Mon, 18 May 2026 18:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779152416; x=1779757216; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VbNWklWh6Fsmc4pps8xgmKimSXfnh3n3C2bAnfYPLH8=;
        b=LfP3rhb9PvyjHLBhVIxBy8/SHDREGNl+2gxACB4AC6WYU7lFceVcEe9R4yv8EgLWrH
         U/lwiBv9nM0X7QTEqIDQTDdqN1YeMQ1/gRwICzoCkmZY5TrSlvZa4F79KVEk0BGHR6CB
         BB8QiHc5+Q3+tolT1+V9oNuUCxibcMK7sey/yKApal8VDYHP8gAi+dp3bse3P/vPGkpZ
         u1pv5kn8Xl/3Q5pP9iBZEUe3OqW2P4hvkT25xCUogDT0vnernaclDmTgmcuB8jjycpkD
         /o6ejmO2xyXZi6RbWheNxusgYp4TLdUq0kfXb4diafCcSQDRy8bp6iI2p37gBxwouj2h
         Wbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779152416; x=1779757216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbNWklWh6Fsmc4pps8xgmKimSXfnh3n3C2bAnfYPLH8=;
        b=kB9tTYwVsbPGlKujWn6lz8H2beqV0BTjJYp2qlKmbENADAERvWf59Gzk9LOS7n1YhR
         eG8N9EKXzgKUnoqWP+K+RmVopsDLpXqVLb0dN90U04IDVBFZft+ZjbDxMb0qtSYdkTqT
         Br36BJekIV33D2FcMpbYYJ2zA8lGdf4umgnoCPSeKknL2VSj4cGdM/LntzRDDAdzcRBa
         63uBZkXeM6Zhv/JkbGif9ks72H5gpd/4FMLkIBtnjiVbSmS38ErlDSINsiHDLyG21s0T
         42snZK4x6/y/YRWrd9knYbr0s8DEaWzwtEc2DaC9kKIA2CYUaQRXDNRs1ld4gmItO/tF
         vXJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+p91Dbdb5Flp4RE8u1pOcn7NfKpyoJVciZtM8GTu/XNKXdANqRU9FmEXFYRbVjDp/7ml1i@lists.linux.dev
X-Gm-Message-State: AOJu0YyIfvih+xHARwksQv8IvI3FNx/DL9B2DarkPu0Q2uvuBneh+onb
	AqkPNXEwCN81UaFb8ZrQzL4U/IajAZbfayWr9sYq7hXlR8JtmETzhLEn
X-Gm-Gg: Acq92OE8PCybMog14tcnXe/QFfZgrnK7Sl6k9kv0/TFJAza4I7YA36NRJUu4DAjvinj
	M6V/3j62vSxOhbQeg0FwCAi44XpjaEPkdUr8JFrf7YjJKStlVC50xIxUKm9fnem0tiC9Z+7v6ho
	WzMbELr5CxoQnNslGIAz1nRHVa2hvOo7OQvU13ujvlwR5CHhohpteLxTJ0Qv7U4EN9A6E8mSuoK
	JT20tv4CsOyifbVJ5E137uP/0yvVcHgL+7uM2LiLShAl4dCbbpeGSdPNxKpsNkGGl80adnVZ4rY
	yWK59CUlBA+NGQWmCfKFxDDgm1j+UBlHWDgGduGDPRUijSk0/UFAcNLFRWgces0QO08JpuRcAmN
	alm5W3tacNHHPYDOmTlUfD4VOi1VEWp66lujlidwUGHxle01IGnQJRWR+PFSFw3vTQdDtRrISZh
	7wZ4/9oAAIMXnyUFfGwoGjA5Fy+BqUeDfUQfBqUadIEYP24bWFzb3J9U4ojuke8nRzgegwFlWpB
	CTTf/0OVOLd4C5CDO7HrGtwtjtHO5nPvwk=
X-Received: by 2002:a05:6a00:2293:b0:82c:d7c4:4c57 with SMTP id d2e1a72fcca58-83f33cc684emr18154151b3a.19.1779152416542;
        Mon, 18 May 2026 18:00:16 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196660easm15638026b3a.11.2026.05.18.18.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:00:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] gpio: xgene: allow COMPILE_TEST builds
Date: Mon, 18 May 2026 17:59:58 -0700
Message-ID: <20260519005958.628783-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The APM X-Gene GPIO driver uses generic platform, ACPI, MMIO, and gpiolib
interfaces.  Allow it to build with COMPILE_TEST, matching the existing
coverage for the X-Gene standby GPIO driver.

Tested with:
make LLVM=1 ARCH=loongarch drivers/gpio/gpio-xgene.o

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ba2e8c802093..9ea5c2523fd4 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -825,7 +825,7 @@ config GPIO_WCD934X
 
 config GPIO_XGENE
 	bool "APM X-Gene GPIO controller support"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	help
 	  This driver is to support the GPIO block within the APM X-Gene SoC
 	  platform's generic flash controller. The GPIO pins are muxed with
-- 
2.54.0


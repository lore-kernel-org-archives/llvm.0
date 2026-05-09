Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47B41A6807
	for <llvm@lists.linux.dev>; Sat,  9 May 2026 00:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286826; cv=none; b=QwSPHL5Rx6ILf9mG8SOu+wVeadZAXVrPOiYlRD4e4c3xDDwrAIyHpi8IwWjiObn9KuPqgk46uPTs0EgSJX6GuuEyzlaeEb5mFf7siOij3qZA/FtvJQwgL6zKO0ASxWO2kipClXecDJEpgdUT4GSTyS0tVqxjuzxojNKrfm0Dujs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286826; c=relaxed/simple;
	bh=w4nfqVFZGrK1NCIJntiRJ5nGBcZBg6USWQRdZN0VlQY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H75xhoY8OzXq/+JWCzrjEnWVndJ40mEaN9zudxYDdseXYrXZKJJTpEpJM3evq7smjCwXHKVotAV12fcp+jK8zCiz87Vk18kZ8fH6JqKJi/6FW6XygvB18A6lIdM+NPzpOMER01fJwGNNdZJeIRaOHGXDNk2caDb0mjHJgMzl7SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1LlBqaL; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1LlBqaL"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-835386ff122so2234279b3a.3
        for <llvm@lists.linux.dev>; Fri, 08 May 2026 17:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778286825; x=1778891625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xLJ9gLG7pbZKIRQypRSLrX+188/WO/6+lZX979t4oqk=;
        b=X1LlBqaLXY/hlgoGZzh6pHZC0e+bTq8CpAIZyXocv2oZHuvctvDgEkVWN4HEidDteN
         KChtpPOkXlwUIjzNKbD0t3D5ADxZGGiibKAznJsmqWJEDkqwWxMRaA2+rrhNn8byBm0U
         L7w5m3ZlJHslG/PhZfiec+EmUxFAyThLe68Qe6nRpxY0rnrpyZ7b2wj2zrF5OtvHoKTc
         Q7AV1mLVu68bR7QDGcsAGibR1t2g3kzgTY4AGqq5LmnEfb2nWA+bh9a4jeOaIr9O1WKJ
         k00eqQaKd/oC/Zu5os6Dg/ZrOtqKoZw5cvxxTNfiBOc4Z14xpasLj0KyxAw3edApxRrM
         m2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778286825; x=1778891625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLJ9gLG7pbZKIRQypRSLrX+188/WO/6+lZX979t4oqk=;
        b=gvdrborsi+I8D7/QfiymB1N+ANDMKMNA+8x6L7Tbsy3ckGIV/x6aOsF5L1qk1UXgmW
         U8WWaEL0WkUB9OcwfIYT7FVgBezJFwszlge06o+p3grO0pIXzhbUjZRl8cww7Si96kFA
         DFCcRm04mRYWEADTbM25VAmfRa7cy7DEd8wpBEmyWpkQQu2tpq3mOUzPGlXuzOd7xgJf
         wCgKNKQRHpfDj3sKziu5PyCbGE9hT9eEGASo18PUhGgastZQt2w1Ta+epNt79rNc2H7H
         MQ9RbgqIrWSMXPyvIwdPP30QoucWWD5dGBHkE7K8Ifvtxh6NyFZFKSvxCOEyLssoxu+d
         MjNw==
X-Forwarded-Encrypted: i=1; AFNElJ+guuRNTnJxuZ858iVJ0xfdrs940YerMUqXedTNEepuu8DiLVW0hqIbhb7JIMUCMGqj7cWe@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb+O4068ovH3a1e2Wu6Yf8CCxnITRtDNXifb7XMPbhCSSnJLew
	6y6mpSOcQChqy72Q/gqm3ffHZF9jtOkaloZO+0jsD353T4KsAVy7jKtM
X-Gm-Gg: Acq92OGuW2F7R+pJAcMY/ZE5ZDsNqgjGIMvlfMA1lyeRrYJPbWvJ0W+wqimYV0hGHN7
	I90aqq/RdvtuvuWwh+LFsDuofetmbMy6Fcp2/s+PuOUP79RZzrkWb6F8c8I5I+WQ6VdKztr7DIy
	3Tc0PRRszwajHQ4CZCZsyKlzvVMJnul81m4KDNWLcLHNBklbXCmZ02QJsc7k9cZYXiCRlxyT8yU
	29XhvGxJkDdZ1DnMjG0XVGOKF/jBfRJNpJSgkFx5sI1iNNeywJ72kGZJCKpDbvhr9vHO5i9q+mc
	MFGlxNJHjdTgC4ltyMW4RFVXxgvUcdq8A2cKYk3OgJK48nDVyVN5GIG8PjG5C47k88MdYIk6wCZ
	zg9mHhBwktyEHSFz+NEBVecS8o+azVc2kxaGVhzYwoAJSebQpZ3BnewYWdVfmAGbDtZbR2w+hs9
	fCxy1240T4WySWW4oAX6jNHOzKXd6lBYVLbGPcU57UgSOeouLYz+Qgu+yZFs17+/rZBhCumNpGo
	0AI04dllCPUxChsdvUjM0r3oOUzIX69l60=
X-Received: by 2002:a05:6a00:6c90:b0:82f:4f63:31e1 with SMTP id d2e1a72fcca58-83a5badbcf7mr13179463b3a.8.1778286825102;
        Fri, 08 May 2026 17:33:45 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8c00sm12593925b3a.32.2026.05.08.17.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 17:33:44 -0700 (PDT)
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
Subject: [PATCH] gpio: sodaville: allow COMPILE_TEST builds
Date: Fri,  8 May 2026 17:33:27 -0700
Message-ID: <20260509003327.955942-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Intel Sodaville GPIO driver uses PCI/MMIO and generic GPIO helpers, and
builds outside X86.  Move its Kconfig entry out of the X86-only port-I/O
menu and allow it to be selected with COMPILE_TEST.

Tested with:
make LLVM=1 ARCH=loongarch drivers/gpio/gpio-sodaville.o

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f8e34b16fd99..9e1ed0f451b9 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1908,16 +1908,16 @@ config GPIO_RDC321X
 	  Support for the RDC R321x SoC GPIOs over southbridge
 	  PCI configuration space.
 
+endmenu
+
 config GPIO_SODAVILLE
 	bool "Intel Sodaville GPIO support"
-	depends on X86 && OF
+	depends on (X86 || COMPILE_TEST) && OF
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 	help
 	  Say Y here to support Intel Sodaville GPIO.
 
-endmenu
-
 menu "SPI GPIO expanders"
 	depends on SPI_MASTER
 
-- 
2.54.0


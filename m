Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E463D64
	for <llvm@lists.linux.dev>; Mon, 15 May 2023 05:49:51 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1aaea43def7so84277555ad.2
        for <llvm@lists.linux.dev>; Sun, 14 May 2023 22:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129791; x=1686721791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iGXLwFtJb/ikFg1cYTajKxo15m1ntUjHJP3AtJxPHQ=;
        b=dzjo8FojeRcnufXLfXC0KBxuYEA22LD3hfHOwXg4ZDuLKLv0BrqZuH8SGOB++jp5uO
         wzKiYKHcGFS22nfktsiZ/0soliO+6KwkV1F/CT4cSacQXjZNHJvQslYLfkfOySySRtSC
         8UjaZJDHoN+NS64WsDBJKuPA3FJoVOmbNNpbeSntaVz+MYmRbJtjWSbb0awzzHpNTzQM
         iMrORsenLXTKP1MfGL3i50980w+juwmbTsihGPxC1TFAomikj8sy7z3tZ5zOxuVobKLf
         PO/dJlkFK4Nme80wJtwvZuMrtkTbpTOttq+0KOfxO/f5tg65WVxizgRj349mCeC4zcqw
         YAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129791; x=1686721791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iGXLwFtJb/ikFg1cYTajKxo15m1ntUjHJP3AtJxPHQ=;
        b=XA/YRfeyA3goluT27TBvE0AFH9Y5sDHCsxNbCHPJDypm0JAjivV4xtRQq6uc64VD51
         lvqNLMe9nSIz7t5q1hjj+23fiQe4lsptAxbfCk66E2WVVIY2BOfUpmOvlUfL1GtM1RA1
         manW72sAt7S6U2CQHHQTcBc32kiLJMfO91stKi9+htfLwo6xH0o9mfUNN5GDVz1lLLHh
         Bt7EyUCmEusQcb6WhpzS07U7u6SzO9KOb9D7vessMPLOJu/zAhq7FQZUcOjCWgoL3SmZ
         0fIHYB/Cu559OSMQgJCi9ksDKxrA/uf+lCIVNI/hkmvnv05I4H80Y+6C96BT5Z52CWq3
         dDZg==
X-Gm-Message-State: AC+VfDyyOCUpuTdtxql/jgKFHHRVBJswee6VZryieSlHpRBy8Gnk4ULE
	5WeNuz8QM5J6zkeyu5JiTxxomQ==
X-Google-Smtp-Source: ACHHUZ5Z2n4/ARSq3kgTidyaSTNrk+RwN40D33bxOlnfkr8ZPEoD5Bs6K7sM3BLGphGdcRXft9Eprw==
X-Received: by 2002:a17:902:e5cf:b0:1ad:e3a8:3bf with SMTP id u15-20020a170902e5cf00b001ade3a803bfmr12750021plf.21.1684129790858;
        Sun, 14 May 2023 22:49:50 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:49:50 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Weili Qian <qianweili@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Marc Zyngier <maz@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: [PATCH V6 02/21] platform/surface: Disable for RISC-V
Date: Mon, 15 May 2023 11:19:09 +0530
Message-Id: <20230515054928.2079268-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_ACPI enabled for RISC-V, this driver gets enabled
in allmodconfig build. However, RISC-V doesn't support sub-word
atomics which is used by this driver and hence allmodconfig
build will fail.

There is currently no plan to support this driver for RISC-V. So,
disable this driver for RISC-V even when ACPI is enabled.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 drivers/platform/surface/aggregator/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/aggregator/Kconfig b/drivers/platform/surface/aggregator/Kconfig
index c114f9dd5fe1..88afc38ffdc5 100644
--- a/drivers/platform/surface/aggregator/Kconfig
+++ b/drivers/platform/surface/aggregator/Kconfig
@@ -4,7 +4,7 @@
 menuconfig SURFACE_AGGREGATOR
 	tristate "Microsoft Surface System Aggregator Module Subsystem and Drivers"
 	depends on SERIAL_DEV_BUS
-	depends on ACPI
+	depends on ACPI && !RISCV
 	select CRC_CCITT
 	help
 	  The Surface System Aggregator Module (Surface SAM or SSAM) is an
-- 
2.34.1


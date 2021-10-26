Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B83C2CA8
	for <llvm@lists.linux.dev>; Tue, 26 Oct 2021 07:12:18 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id l203so8683360pfd.2
        for <llvm@lists.linux.dev>; Tue, 26 Oct 2021 00:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hyF/RzFfBJTTS6Hbd70K8OAEr7g1NX6pk1CZXFYtYhs=;
        b=VVov/2BwFUxXgkuL8PLdXYwgIkBNhT+m++EFtwBx3Cp56Rhr2Pa2YSS3wTgaV5xyQ5
         NoW7OZfzxfDljOA8BcxtniYArWKBBwHqxl8tOufRSaqLZKn2iBK8MKyfTqe58lBnHW3b
         Cr/QuyjAFU7xaf6V7/RbSMFPyhjG/yDpLdzioG9UbES4/5b6XcroOVwp2GyfSUO2Kkt4
         G/mIf8VpCqkBgBFgnkKlRmXYeWVTB9gaVQeg4DgXAldUKQPfhmpRzaiDTFsuTMBL5y6w
         oDO4gdyiy7uFqDFyqR4ZZLBWapCqRKJrjkUtIj1/naJhHwteLmIAiwL60z+iZZhEylj8
         /Obw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hyF/RzFfBJTTS6Hbd70K8OAEr7g1NX6pk1CZXFYtYhs=;
        b=Zrvq9/+7c/X5kYBGZHRgknTcXcbMwlOXRjRJPW3ErwR76Yp51NnyityS+oLXblJJXT
         DqMcGjL3UQ6CpG7PyeW2MExJLzcbE5TH/QCFtjuP1ufoDcnWDHNWyLVlhUu+9xh3aE1R
         h11j40RUnqVbmQAKXoIXJ8+RHSiBClm+or6g52Z0lOJ2dh+ZPl6RFP9qyemzm18gFhej
         jv7dOam4CKz/srBy1pJQdWuZ6fpy7UiAUYpcUuDtNfcFMiY8tvSZ3kQ6OKbE8nEchRtE
         dACe0XWlpeHkXn0kYOXJLvLKfkaDh/Ytul2H5uQmY9AWLHXypO8bI59vmvc9gG+wEeRT
         JVdg==
X-Gm-Message-State: AOAM532WaNq1Z8MsVPyPTFm6HI8R4lf6PiCbFxueP90Mpli3myQYGziN
	I4HtZZJAukRUDCodErP5zCA=
X-Google-Smtp-Source: ABdhPJyEHC/nlLvU5vCXzuZSwXcLN+6ocgwaSNzynt9R+H1K1jgbauv8ZO4rWDxKl1lYHH9jya+UZQ==
X-Received: by 2002:a63:2d46:: with SMTP id t67mr17382780pgt.15.1635232338173;
        Tue, 26 Oct 2021 00:12:18 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.12.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:12:17 -0700 (PDT)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org,
	mchehab+huawei@kernel.org,
	hverkuil-cisco@xs4all.nl,
	ezequiel@collabora.com,
	gnurou@gmail.com,
	pihsun@chromium.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	gabriel.fernandez@st.com,
	gabriel.fernandez@foss.st.com
Cc: patrice.chotard@foss.st.com,
	hugues.fruchet@foss.st.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	lkp@intel.com,
	kbuild-all@lists.01.org,
	llvm@lists.linux.dev
Subject: [PATCH v7 09/10] clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after system enter shell
Date: Tue, 26 Oct 2021 15:11:21 +0800
Message-Id: <1635232282-3992-10-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

stm32's clk driver register two ltdc gate clk to clk core by
clk_hw_register_gate() and clk_hw_register_composite()

first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver

both of them point to the same offset of stm32's RCC register. after
kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.

stm32f469/746/769 have the same issue, fix it.

Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
Link: https://lore.kernel.org/lkml/CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com/
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Acked-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
v7: 
- collect acked-by, reviewed-by from Gabriel, Patrice.

 drivers/clk/clk-stm32f4.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index af46176ad053..473dfe632cc5 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -129,7 +129,6 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 };
 
 static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
@@ -211,7 +210,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 };
 
 static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
@@ -286,7 +284,6 @@ static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 23,	"sai2",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 };
 
 static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
@@ -364,7 +361,6 @@ static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 23,	"sai2",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 30,	"mdio",		"apb2_div" },
 };
 
-- 
2.7.4


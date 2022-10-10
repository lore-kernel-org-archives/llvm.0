Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CDA1FB2
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 04:11:12 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id p3-20020a17090a284300b0020a85fa3ffcso12030152pjf.2
        for <llvm@lists.linux.dev>; Sun, 09 Oct 2022 21:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRNiX2YBGFaGbEOW9EW2m4IMgeIOR/vpdS0qnuva6kA=;
        b=XWjcevQXwJ689afJUD94+6DLRPa301SxsBfqSn9+7DNTRD49nXgJJdFOUu8xZK9Pf1
         DU/KiC0GiL5EylVYuQPsH4Wi/no9QwcRROwZABJJLZPg5pydzhJZBUkuAX3t/H+sI6Fk
         2pV1a1mhRymiCLqfk6Vh0SbCqG8L0KK8dpxAx8iZCzU7GjHB1DL1R8WfpZwoti/bgrzN
         JOAUa/LUXLUVy3E02VOmz3YA/ct2YEbCnmuyOPO++eEwc8uu/3Di7EOUTw0xM9ExbRTQ
         eiFcqr7nMaSGAs5HxMN0MIE/R8vlAAWXKBnscgYa7n4xyzaSsN2BqNUTTsHjOQbozb/Z
         mrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRNiX2YBGFaGbEOW9EW2m4IMgeIOR/vpdS0qnuva6kA=;
        b=uef2zi1fC5QqqPFZSXYc7P2ZplswZncpGoA7Cd1dnVIUH7sVc24ZBZPlF712eI5t1T
         OxyuwaVlI0cGfPJ4xCtHKNgEj4/MeQEvF4jwlm81vYyYNeuO+GxX5gxULUtwlm5cagMt
         NsDA6Uu32fd1eTPSe6DM95AmUfeEBh2TBN4VskfMt87k163c3LGaoJgokKxMrOmvJ6ck
         Kpq79+vZuYH/XPikFJBZ8a8FVg4NHs+8H+1Jw0UyD3NG1zM0uv14l7V28tOLgLzHjUoy
         VxiLU4IRomNeecLg7eHFZ/wuMZhi+UE51oNYR4iqaIFYlTHg+14x5EKqr1rMZQmid8eZ
         sxtA==
X-Gm-Message-State: ACrzQf0pResyPZLxq9SJeMlOFzkb19e2KS0On5U4aS4pizALi19XV0+u
	7wrcfI7JvtCChEq4ju71VO6P1A==
X-Google-Smtp-Source: AMsMyM4jJikAaITTAHASRrm9j75yPxdyU/MK6wS0mYulFpYaLBuEsRB9ClYyW3qkQiQDYoluqnSsbQ==
X-Received: by 2002:a17:90a:e7ce:b0:20a:c658:c183 with SMTP id kb14-20020a17090ae7ce00b0020ac658c183mr18818066pjb.5.1665375071917;
        Sun, 09 Oct 2022 21:11:11 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id z18-20020a170903019200b00176c6738d13sm1863104plg.169.2022.10.09.21.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 21:11:11 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	kernel test robot <lkp@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] ARM: spear6xx: Staticize few definitions
Date: Mon, 10 Oct 2022 09:41:07 +0530
Message-Id: <bd3872ce5125477ea80b1131ad9a34c98aa1a796.1665375018.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix warnings with clang like:

arch/arm/mach-spear/spear6xx.c:365:13: warning: no previous prototype for function 'spear6xx_map_io' [-Wmissing-prototypes]

by making few definitions static.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
Rebased on v6.0.

 arch/arm/mach-spear/spear6xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-spear/spear6xx.c b/arch/arm/mach-spear/spear6xx.c
index 58183493e06d..7a5fff134872 100644
--- a/arch/arm/mach-spear/spear6xx.c
+++ b/arch/arm/mach-spear/spear6xx.c
@@ -339,7 +339,7 @@ static struct pl08x_platform_data spear6xx_pl080_plat_data = {
  * 0xD0000000		0xFD000000
  * 0xFC000000		0xFC000000
  */
-struct map_desc spear6xx_io_desc[] __initdata = {
+static struct map_desc spear6xx_io_desc[] __initdata = {
 	{
 		.virtual	= (unsigned long)VA_SPEAR6XX_ML_CPU_BASE,
 		.pfn		= __phys_to_pfn(SPEAR_ICM3_ML1_2_BASE),
@@ -359,12 +359,12 @@ struct map_desc spear6xx_io_desc[] __initdata = {
 };
 
 /* This will create static memory mapping for selected devices */
-void __init spear6xx_map_io(void)
+static void __init spear6xx_map_io(void)
 {
 	iotable_init(spear6xx_io_desc, ARRAY_SIZE(spear6xx_io_desc));
 }
 
-void __init spear6xx_timer_init(void)
+static void __init spear6xx_timer_init(void)
 {
 	char pclk_name[] = "pll3_clk";
 	struct clk *gpt_clk, *pclk;
@@ -394,7 +394,7 @@ void __init spear6xx_timer_init(void)
 }
 
 /* Add auxdata to pass platform data */
-struct of_dev_auxdata spear6xx_auxdata_lookup[] __initdata = {
+static struct of_dev_auxdata spear6xx_auxdata_lookup[] __initdata = {
 	OF_DEV_AUXDATA("arm,pl080", SPEAR_ICM3_DMA_BASE, NULL,
 			&spear6xx_pl080_plat_data),
 	{}
-- 
2.31.1.272.g89b43f80a514


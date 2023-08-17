Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7871C284
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 23:59:13 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68890d565b5so304287b3a.2
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 16:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692316753; x=1692921553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXeYLQ2GewHlFPJZC58ZRexUVly60i4L9KNCW0nx6Zk=;
        b=E4MvOk7kozY7pHeqkqrSE6Fx+b5wPjyeaDrCH6cnZYBce235iu8L1ggSupORngM/8A
         l9Kk472IVYyHtUHSiQfr/qQxVCPz6cZa2dg6Po2U7LJdTM0a9vhPIc9OjPFnWaVjufYH
         eZ+T3G7d6GgLHEUVUwZwmsqNG0lsBG9OxXjaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692316753; x=1692921553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXeYLQ2GewHlFPJZC58ZRexUVly60i4L9KNCW0nx6Zk=;
        b=EJw9WF5GXPlBUvmfbt7MonspR6DS1oDkbEiTyby73crt2Gce4d0LmrjxLhqPlhoq88
         PHTIEN5NdFZ8ThdG9ll9r3Gf5E3a7P5Kn65W+unkoxJ5lCr2q1H8XQuAbuHXjA7BXOVa
         le0V45ogarwNWK01ycx6NSb07oTelcGhQDxPfokQ+TiokEJZ1APp9AJly9xHvDXq/G8o
         irdBFXLoO0myVQSwNVF6gmux4yoX31b3EGT8Y609aeegumDiiRMLVh9weAEFgyv+hc7O
         Odaz49oxBzCSCswoAUr6H90nIytMS5viYegtMLzUBc+t2dxGnFkuv2XH4ain8LIihgI5
         DFhg==
X-Gm-Message-State: AOJu0Yxqqj+QEOKpxrU46V5UIasfy5qpkRogpd/490uqIjIVmyfCAKwp
	wRZm5b+eYYbvu+bl6qwK1otBbg==
X-Google-Smtp-Source: AGHT+IH7ceqgTswqXpviM1ijV38NbJuVRRwA3pV9NT6hwNEYJSniFiTqu2wXcbZdz+XyqunOp8AoPg==
X-Received: by 2002:a05:6a00:22d4:b0:687:60bf:aed9 with SMTP id f20-20020a056a0022d400b0068760bfaed9mr1146482pfj.24.1692316753316;
        Thu, 17 Aug 2023 16:59:13 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p18-20020aa78612000000b00682b299b6besm313473pfn.70.2023.08.17.16.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 16:59:09 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Jie Hai <haijie1@huawei.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Green Wan <green.wan@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jordy Zomer <jordy@pwning.systems>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 16/21] dmaengine: tegra210-adma: Annotate struct tegra_adma with __counted_by
Date: Thu, 17 Aug 2023 16:58:53 -0700
Message-Id: <20230817235859.49846-16-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=keescook@chromium.org;
 h=from:subject; bh=7gJaGyTVYHakfTQ8Pwi03jgdcg+IqGAMLg/jFJNW6ns=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRBFwQjEveal+Z/8kFZsr8NHcKbhAWN9xXW2
 2bm6PiyF6eJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QQAKCRCJcvTf3G3A
 JhWBEAChmToUXNsq2WvY5LWUYGOYXucQ4BBFAeyV8EU/Ph5YetkT1Ejxps0eeDDEL+L9UUpivSe
 +C9l1acyX7jUmoO7g3LI7ofXC9DYH/FlJ+tFAV7eWeP7LLjdgrBYyHMmSddzaCznsZ9os4v1ub7
 Rdl+oRzDK//T++/1p19ABdLdwYob+S6o0ePH/GR338wixR2TmmypIBYnp6yrrw4YlLjUE/NlJ2b
 Yu7U19kEiykr6dGefEteYvSZk1Hp62ql7B+hmLY3EeychRlJcdqcOrMofQLZ1VIESaMlC5XU0X1
 hEYiKuEB22Uj0FPrF8P8q3U2w5qzFfQ4MPVi2rL6KIOiZUN8KJyoJGJlT4eyDcWMSmy5M7Ya1NE
 tXCXuIFbd3kJu/chRYDvGHx1SOCiLUMveo8wvJDL3FzaSOmFqMMx5CyDWMHhMVPGsod/y5u0csZ
 ehv9PysR1Vi53+riCsyVXtqI/GGdCI8SHEeRUiHyxGQ6h3aZsOGerZtfL93rwVJLxHApgWWC4Mb
 8TiDejq/mug5sOGQ+2vL1ae8SqkF+00KLgem2JFhPfET/9dbSOlo81vYhJnS94VtB5wYwz4cMNA
 Hd4PZfscGp4gmCe3nDVghWnCrDMnx+SIX37w7Hj63aAOU3ZzYj4Gh7cfWGp40ESzjtcx4c4tRKH Fw8k579f9tNlntw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct tegra_adma.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/tegra210-adma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index e557bada1510..cea33912a4c9 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -162,7 +162,7 @@ struct tegra_adma {
 	const struct tegra_adma_chip_data *cdata;
 
 	/* Last member of the structure */
-	struct tegra_adma_chan		channels[];
+	struct tegra_adma_chan		channels[] __counted_by(nr_channels);
 };
 
 static inline void tdma_write(struct tegra_adma *tdma, u32 reg, u32 val)
-- 
2.34.1


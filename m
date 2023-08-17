Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C14A1C292
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 23:59:13 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1bdaeb0f29aso2832695ad.2
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 16:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692316753; x=1692921553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mk1SCmr54SByakeWUh6yowv1wkxM4Sng/sHbcFaXDNY=;
        b=Li42VoXYxopvcAosNllETb31bGBNqG1eav+/PT2XDAsWeF5EQR1O1xIIavffuSqGx6
         NWMBk8BWHGBLra/nts8yKC0wrGWaj+ndVUkZOUp9IJz+HuHHCeUiM9weglzL3JUMtFNM
         e7LgNLfxXWTcCqxa7v3GQXhsxXl9sO2ZXMCpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692316753; x=1692921553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mk1SCmr54SByakeWUh6yowv1wkxM4Sng/sHbcFaXDNY=;
        b=Q64KVkru6Vo02ncAp21VtEc01Km25KW4qGfTsPnSmGU4ASwS+FJbSbV+DOiLhK0kwY
         yDYgwKcn/h/UNIlfodrKKdwfTA7rhSIPrsqNUk6QRUDHd/52rb+dfB/daGkFiKvnGi+6
         CTnAHoOch0gMKvP4EGneJF54+TxVYGFaOfpgdyB1YThovCzFHqMjOlVSu64nmpYedkmK
         KEk6bzAa0PkcEwRvO6G81qqXe7+VbrB9b0qzVca3V6RU+RnzGd33/B0zz3W+1/gH+VJj
         5C3NquXOEbrwbcssUS8fmpvBmPInuxN2wfB2uDxytDswwcb5rmR6KxWQ8N98L0Uy0465
         LO8g==
X-Gm-Message-State: AOJu0YzLjIpcsxILgRNZnG51KsyVDn41GYNaLRvIKrT4coIGH1MlqXIm
	gfmX7ZWmSEj9j3Q4djSw+1VtSg==
X-Google-Smtp-Source: AGHT+IHuGCe3rbXfUgNLJKkSPXe8KKaQtbAMaaVfphgPjZsWlcb4US0F/FZRapuXz2PkIwNaTWVG8A==
X-Received: by 2002:a17:902:8503:b0:1bb:1523:b311 with SMTP id bj3-20020a170902850300b001bb1523b311mr808869plb.41.1692316752793;
        Thu, 17 Aug 2023 16:59:12 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d12-20020a170902cecc00b001b7f40a8959sm343232plg.76.2023.08.17.16.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 16:59:08 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
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
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
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
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 14/21] dmaengine: stm32-mdma: Annotate struct stm32_mdma_device with __counted_by
Date: Thu, 17 Aug 2023 16:58:51 -0700
Message-Id: <20230817235859.49846-14-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2025; i=keescook@chromium.org;
 h=from:subject; bh=pKTclpaZruv+pWk34ERm2W6zAMi5KXhuaV3hDpciGTg=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRB0Kp6SezIcvelRc5vIjA6L87F3Jxd807ZE
 TawptODXHaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QQAKCRCJcvTf3G3A
 JkowD/0bdDsHfBNlgVJ6IMXnkrBtd8nyV9tr34/9GAsGIx6iKvbcxPRfiAZB5usq35bGE6r9shD
 jsCa/mEq3Ml6mYiEWgLVgUaeVpGJk26dgwgXaWB0tgAj950FICdaGqIKKZfqwZGQXKuULpY4fof
 zFKMLeD63ek6gqBDfGWGy+4SWdU4R0Dn4JrysDFrucIju/vvHhFNhLbUR4oNUC9QXZaFrrG4xW9
 Sn6OJTAFSqdYijRTfeMWXlACRcDVj/co8MnpctKLLcy6UlFT3x4GRQ2pS3jeOTS7T0BCvUnDNc1
 L5ImfV0Z4r+BCfs6ZArg/5dtLt49JhzrT9YDVLnjZOSj21QxOMe6RY07KOnX2TQfalz/Y0MHVP7
 9H5IXWPUdz45Df8wVJzaiYN860p90QvySYHNUARWv0yJ+kxOMjZccNG2dlSvXtJqHshg6NmusH+
 Leote/t+f+LKtsRIXglKvDe9uZVG5tWlf8eJdxeOnS6x0LcYGSBUdNLH5nJdKcHBMADld97pyBU
 P1NLDFAuLqbJ+caaX0mVhjDLuic01Wl3YdnvLkF/D/tfsgNKsnb8NQuvzAsGtpmyq8jKWq7DyQ+
 6LXmQjlUQfooWKoKlL2KIyjRUmQxUq9xg9MmVYdTiK19xN3TKrTx8prWlmvSZ8bZVKZYIHGqhns kEJejcVzr2sYgJQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct stm32_mdma_device.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/stm32-mdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index 926d6ecf1274..0c7d2295856e 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -256,7 +256,7 @@ struct stm32_mdma_device {
 	u32 nr_ahb_addr_masks;
 	u32 chan_reserved;
 	struct stm32_mdma_chan chan[STM32_MDMA_MAX_CHANNELS];
-	u32 ahb_addr_masks[];
+	u32 ahb_addr_masks[] __counted_by(nr_ahb_addr_masks);
 };
 
 static struct stm32_mdma_device *stm32_mdma_get_dev(
@@ -1611,13 +1611,13 @@ static int stm32_mdma_probe(struct platform_device *pdev)
 			      GFP_KERNEL);
 	if (!dmadev)
 		return -ENOMEM;
+	dmadev->nr_ahb_addr_masks = count;
 
 	dmadev->nr_channels = nr_channels;
 	dmadev->nr_requests = nr_requests;
 	device_property_read_u32_array(&pdev->dev, "st,ahb-addr-masks",
 				       dmadev->ahb_addr_masks,
 				       count);
-	dmadev->nr_ahb_addr_masks = count;
 
 	dmadev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dmadev->base))
-- 
2.34.1


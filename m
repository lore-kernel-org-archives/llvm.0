Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288201BB58
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 23:59:08 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1bee82fad0fso2847695ad.2
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 16:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692316747; x=1692921547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBig4ojju35UeR5nYJdcskzCIyszltPP8aM7eZxhMAc=;
        b=CX+q3KLcZFLRq0HGaHxCoLa5L4myxQlB3+uLkExLgTIU/M13dAR+tuImGaMRsXlnIX
         5EiwzNERqO941u1ZgpeILGDAjF+aAXTGTWftiTYrIx49flrdRuPcBwQo92heAoso26aV
         L2seXLXD2MlKm/ksaN6j4O9A14UF3zqIGgNCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692316747; x=1692921547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBig4ojju35UeR5nYJdcskzCIyszltPP8aM7eZxhMAc=;
        b=OObve2RflT+79TG+8aveKQ/kmO5shQEjYCStTPU16emzrIRtwMsreQ1tWyv3FEHFXR
         /prK5eiIGEPWQ6Fz7ArQa2Rydp0pROtFcKwgjVLLoJHyz6mpZGkvIJcDVKd3AJ7XfK2q
         cEgdlLobxmRQaXCMyCrmzF7COAwY7UjH9KPP+St3u2l+QSNMHDq0G2+YJlK9PDBqrxKa
         YUxxAR2eX+qGJbJmnaP5drIvhaV1IOy9ihBdfypkZeo5Ma3mtxK9caFFMr71d4BbELUM
         spVW3aDle+/y/t+bLiYR6Z7iNF9DyorGNFl3QTdVvcUstmwjN/Er8tE0MQoOXWFDx6Bk
         yuQA==
X-Gm-Message-State: AOJu0Yy9/b4isT+QwxsGfPhHaOmxswGpGxMXNeaEIUzfNZNHfyVMAR2u
	XtKi/51HDhP3hmd798YZDX1uhw==
X-Google-Smtp-Source: AGHT+IFtTiKmPIDtGWpZKY6Src1ZWuKVRaDR2AR8ZYsjCDrDdceH4jjvLBuUX2egDZo9GWTtP8NFrw==
X-Received: by 2002:a17:902:dacd:b0:1b8:adea:76d0 with SMTP id q13-20020a170902dacd00b001b8adea76d0mr1012481plx.31.1692316747494;
        Thu, 17 Aug 2023 16:59:07 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u7-20020a170902e80700b001b9e9f191f2sm342824plg.15.2023.08.17.16.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 16:59:03 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	dmaengine@vger.kernel.org,
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
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 08/21] dmaengine: sa11x0: Annotate struct sa11x0_dma_desc with __counted_by
Date: Thu, 17 Aug 2023 16:58:45 -0700
Message-Id: <20230817235859.49846-8-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2230; i=keescook@chromium.org;
 h=from:subject; bh=xRJQQKdAwogb4vqWXbK3omVk8LQ2U1Kgbhap9AYkMvo=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRAxAkVjLsoroU7aJkr1WgWWzRBzbsR+tdxD
 lgeTVdiQveJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QAAKCRCJcvTf3G3A
 JspMD/9uCbBEkWVx4Whm0SjF91ZUEjFm+uw5va5kJYSQaUggli1PUAzEbtIfkqE0tHxpXylvHV6
 MZAMbsTTMc4sB4m4xnYRc0EoTzuMdduuaXj7l/sncv7/LmFSoowcBNgOyqPORRYUM775TWDHeXO
 KeoIqOfRBA1pU2p6SABeK4PvYr9w3rZRX+aZiNFriijmZlDDlbGfeq8v9uQ2Im17NvWmo78uSnB
 OkH0/Si61oGt8YkSxwx3WwhmqB2o702deHwP3SlOa/ZeqfTijE2YZhDmMuKHYx7QeBfC/eMcUiR
 Z5Ir99EHJYfiOQtN+yLXwoR+0SaqDwlthzf36cY91M4+RIxRUpoV7xLXmq2q4GCAdnuZf61znzs
 M6Bidmh9xg6pqyHEGPynCNRRpn/UsrhseCWdJGYMQZLkXP2bP0VJzaHIlfivSURYMQVXc4KQwBd
 DRji9b/iiSnnLi3fSIhaQxYXT5+Ps4Au0oZl5ksmYDaMky5nRGOgwaH8K/PsnaL2g5HvZnClItG
 bdITH1ZZpfW22BCSxjF6WLtrNaQQQACl25/pjzcUllaIN1ntJsfEnFtqBBzeDv+cMihyO6Z99a5
 Kmn4lAvlEhqg16rC1j3EkD7ZrTt+gPUQteXqDvYw1UUclntbSMql5Tik8DK4sYfnwMmbaR4qWIx Q6tm80uQco8mfqw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct sa11x0_dma_desc.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/sa11x0-dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sa11x0-dma.c b/drivers/dma/sa11x0-dma.c
index a29c13cae716..e5849622f198 100644
--- a/drivers/dma/sa11x0-dma.c
+++ b/drivers/dma/sa11x0-dma.c
@@ -78,7 +78,7 @@ struct sa11x0_dma_desc {
 	bool			cyclic;
 
 	unsigned		sglen;
-	struct sa11x0_dma_sg	sg[];
+	struct sa11x0_dma_sg	sg[] __counted_by(sglen);
 };
 
 struct sa11x0_dma_phy;
@@ -558,6 +558,7 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_slave_sg(
 		dev_dbg(chan->device->dev, "vchan %p: kzalloc failed\n", &c->vc);
 		return NULL;
 	}
+	txd->sglen = j;
 
 	j = 0;
 	for_each_sg(sg, sgent, sglen, i) {
@@ -593,7 +594,6 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_slave_sg(
 
 	txd->ddar = c->ddar;
 	txd->size = size;
-	txd->sglen = j;
 
 	dev_dbg(chan->device->dev, "vchan %p: txd %p: size %zu nr %u\n",
 		&c->vc, &txd->vd, txd->size, txd->sglen);
@@ -628,6 +628,7 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_dma_cyclic(
 		dev_dbg(chan->device->dev, "vchan %p: kzalloc failed\n", &c->vc);
 		return NULL;
 	}
+	txd->sglen = sglen;
 
 	for (i = k = 0; i < size / period; i++) {
 		size_t tlen, len = period;
@@ -653,7 +654,6 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_dma_cyclic(
 
 	txd->ddar = c->ddar;
 	txd->size = size;
-	txd->sglen = sglen;
 	txd->cyclic = 1;
 	txd->period = sgperiod;
 
-- 
2.34.1


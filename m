Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854E22566
	for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 12:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679487007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hZCSBOFZs4bkOWaMU96a/OIFoJth3tDCdyrQdmx4OyE=;
	b=SJItPklMH/h5LVqMHCtawSejbjUbqGUcdp7WoNygdxpXXXJ4h+nPBHK69BiOJxYQ5frF5J
	VAfQUlKMtESlrbRAof7ZMDN97it2q2Q46ply5tNw6Gzrrapk+aAjnO9JuVe5mjNM929hA7
	AoWpXEx3SWSlJWwDvMHwxUbX4X965/Y=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-HkQXA-LzMXyd1qa_jhy1wQ-1; Wed, 22 Mar 2023 08:10:06 -0400
X-MC-Unique: HkQXA-LzMXyd1qa_jhy1wQ-1
Received: by mail-qv1-f71.google.com with SMTP id qf24-20020a0562144b9800b005bd49d98a78so7430942qvb.14
        for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 05:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679487006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZCSBOFZs4bkOWaMU96a/OIFoJth3tDCdyrQdmx4OyE=;
        b=632QSy49WGDuu7oXeoxtXVTHxvC+YZJ+MweQBxSf4ZnliYVa61yHFaaskpeEdX8MWM
         lhTRDQT5u4/rlk5WD/fszIv/itF+jljpMvZFNFUGZQ9QneqhSdpbzjLVlCpB8BxUd5Jx
         1wbTkYY9B1fBj8Oe2NPBtLF5DifWr9KnAd4P8Dy8H7wGhEcSTBrH/eMAq2DIQTBS01/I
         SK/NuaSYExszDHk74nqvPQVBzPeh4UocQQ931g/dzKkKBdvgi/qAn0mul+YKE3n29Q8P
         wnG+KzJ1IogEEngoCzTgA8PHtfv1QK/NA1fiLLpJY36GCGD3eDOrJQc48o0NkK7anxOE
         Tn+A==
X-Gm-Message-State: AO0yUKV+ODJfAhL1QjJLhPeAxp1h2C10YaoUUJ1NE5MUoACHjtYEp15E
	yP1ovibVg6vafxsnx63zX7dgDxXXvBGTUx9+JNUD4+/tP2saQXF1EsmMQYRPN4jsnA31SYlyKpX
	JHOMtNVI4WBpP/A==
X-Received: by 2002:a05:622a:1354:b0:3bf:dc7d:2221 with SMTP id w20-20020a05622a135400b003bfdc7d2221mr5538832qtk.47.1679487006006;
        Wed, 22 Mar 2023 05:10:06 -0700 (PDT)
X-Google-Smtp-Source: AK7set9kJIiglNnHWmwnAgvPqP7BHrdzvpjmZvpPWl/1axq5Z7bYHV045R+cDjo20tgQiJGFKa42Xw==
X-Received: by 2002:a05:622a:1354:b0:3bf:dc7d:2221 with SMTP id w20-20020a05622a135400b003bfdc7d2221mr5538790qtk.47.1679487005680;
        Wed, 22 Mar 2023 05:10:05 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id b17-20020ac86791000000b003b9bb59543fsm9757855qtp.61.2023.03.22.05.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 05:10:05 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: ldewangan@nvidia.com,
	jonathanh@nvidia.com,
	vkoul@kernel.org,
	thierry.reding@gmail.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: dmaengine@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] dmaengine: tegra-apb: remove unused tdma_read function
Date: Wed, 22 Mar 2023 08:10:01 -0400
Message-Id: <20230322121001.2569909-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang with W=1 reports
drivers/dma/tegra20-apb-dma.c:236:19: error: unused function
  'tdma_read' [-Werror,-Wunused-function]
static inline u32 tdma_read(struct tegra_dma *tdma, u32 reg)
                  ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/dma/tegra20-apb-dma.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index eaafcbe4ca94..cc6b91f48979 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -233,11 +233,6 @@ static inline void tdma_write(struct tegra_dma *tdma, u32 reg, u32 val)
 	writel(val, tdma->base_addr + reg);
 }
 
-static inline u32 tdma_read(struct tegra_dma *tdma, u32 reg)
-{
-	return readl(tdma->base_addr + reg);
-}
-
 static inline void tdc_write(struct tegra_dma_channel *tdc,
 			     u32 reg, u32 val)
 {
-- 
2.27.0


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7458882D
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 23:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679356153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dzrLAVGbWNN8AGVBKViLJqvzv9bGR8wwpK1Vk6d6ayk=;
	b=dbPURiwvi2QHK6TAI2qIa2UOpINHzA78tfBBdAzm3i8vbtKrdmfsQ67abka05EvN9Fy3fH
	JON4HEizds94AMLNFFbQRojOyKLpP0fyMbfpYus8MAPfRJ66geJG5vlrzm76YBJ0wn3ebH
	mhokscQFOlFIrPXluw89B24/XRrru8Q=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-oFcMNRA4Nr2kser_oo7MtA-1; Mon, 20 Mar 2023 19:49:10 -0400
X-MC-Unique: oFcMNRA4Nr2kser_oo7MtA-1
Received: by mail-qk1-f199.google.com with SMTP id 66-20020a370345000000b00746886b1593so1834877qkd.14
        for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 16:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679356150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzrLAVGbWNN8AGVBKViLJqvzv9bGR8wwpK1Vk6d6ayk=;
        b=oVmcOZ0XN249pO3CWqbOrsk3+thU6jTT2Fw7rSStOUxsqFzO9+rS8vakmRhKEBz8m1
         zYSYxuBJkzAj41munycsZzJnQWE3EIytwWKEYis3hzjzdjZ4lGmUMCmaSrxS8H0e0Mx4
         ZFV0r56J+Cxth8K4aUP4Fg5+l3Wl5RJ0TbBxZY5L37annAMJ8UxGLkX2GAR3MiGiueXN
         Of7awVEmaWeL+w4HetPwMEPYLt95EdSkUp21aCb+dlEbVuf1/Fb/znOHg4FxULyX5C1m
         RBZI1ON+yfwADiPG6uKshLMPgHbhTreDtsxFDf4feBkY+SUoWTMyDf3NnIoYlYJdXgh+
         6TBA==
X-Gm-Message-State: AO0yUKVWc9G/htVxmhN1TAc2HGF1g+29hwlLpKidm2MKNt8ILUcgHaR1
	EvEbXPvy85NKG+I6tH+mvX+2mqAxhAw5bWvZgkvTymtRpPMi1H+/XWVl7Ub6IEADNIS6jbPIRiK
	gsxqvhZdlvaF5cA==
X-Received: by 2002:a05:6214:20c1:b0:5c7:d03c:f2b2 with SMTP id 1-20020a05621420c100b005c7d03cf2b2mr1237651qve.28.1679356149796;
        Mon, 20 Mar 2023 16:49:09 -0700 (PDT)
X-Google-Smtp-Source: AK7set+HWnOT0a3RXFRf6pXRq8qqZoMF+FEMmcYh3Ut0IOG4Mn7s6l8sswr2ELFJPesX7ToFbhnqcA==
X-Received: by 2002:a05:6214:20c1:b0:5c7:d03c:f2b2 with SMTP id 1-20020a05621420c100b005c7d03cf2b2mr1237632qve.28.1679356149549;
        Mon, 20 Mar 2023 16:49:09 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id g2-20020a37b602000000b0071aacb2c76asm8104474qkf.132.2023.03.20.16.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 16:49:09 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: gustavo.pimentel@synopsys.com,
	vkoul@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] dmaengine: dw-edma: remove unused readq_ch and writeq_ch functions
Date: Mon, 20 Mar 2023 19:49:06 -0400
Message-Id: <20230320234906.1730308-1-trix@redhat.com>
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
drivers/dma/dw-edma/dw-edma-v0-core.c:162:20: error:
  unused function 'writeq_ch' [-Werror,-Wunused-function]
static inline void writeq_ch(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch,
                   ^
drivers/dma/dw-edma/dw-edma-v0-core.c:185:19: error:
  unused function 'readq_ch' [-Werror,-Wunused-function]
static inline u64 readq_ch(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch,
                  ^
These functions and their wrapping macros are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/dma/dw-edma/dw-edma-v0-core.c | 56 ---------------------------
 1 file changed, 56 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 72e79a0c0a4e..32f834a3848a 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -159,62 +159,6 @@ static inline u32 readl_ch(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch,
 #define GET_CH_32(dw, dir, ch, name) \
 	readl_ch(dw, dir, ch, &(__dw_ch_regs(dw, dir, ch)->name))
 
-static inline void writeq_ch(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch,
-			     u64 value, void __iomem *addr)
-{
-	if (dw->chip->mf == EDMA_MF_EDMA_LEGACY) {
-		u32 viewport_sel;
-		unsigned long flags;
-
-		raw_spin_lock_irqsave(&dw->lock, flags);
-
-		viewport_sel = FIELD_PREP(EDMA_V0_VIEWPORT_MASK, ch);
-		if (dir == EDMA_DIR_READ)
-			viewport_sel |= BIT(31);
-
-		writel(viewport_sel,
-		       &(__dw_regs(dw)->type.legacy.viewport_sel));
-		writeq(value, addr);
-
-		raw_spin_unlock_irqrestore(&dw->lock, flags);
-	} else {
-		writeq(value, addr);
-	}
-}
-
-static inline u64 readq_ch(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch,
-			   const void __iomem *addr)
-{
-	u64 value;
-
-	if (dw->chip->mf == EDMA_MF_EDMA_LEGACY) {
-		u32 viewport_sel;
-		unsigned long flags;
-
-		raw_spin_lock_irqsave(&dw->lock, flags);
-
-		viewport_sel = FIELD_PREP(EDMA_V0_VIEWPORT_MASK, ch);
-		if (dir == EDMA_DIR_READ)
-			viewport_sel |= BIT(31);
-
-		writel(viewport_sel,
-		       &(__dw_regs(dw)->type.legacy.viewport_sel));
-		value = readq(addr);
-
-		raw_spin_unlock_irqrestore(&dw->lock, flags);
-	} else {
-		value = readq(addr);
-	}
-
-	return value;
-}
-
-#define SET_CH_64(dw, dir, ch, name, value) \
-	writeq_ch(dw, dir, ch, value, &(__dw_ch_regs(dw, dir, ch)->name))
-
-#define GET_CH_64(dw, dir, ch, name) \
-	readq_ch(dw, dir, ch, &(__dw_ch_regs(dw, dir, ch)->name))
-
 /* eDMA management callbacks */
 void dw_edma_v0_core_off(struct dw_edma *dw)
 {
-- 
2.27.0


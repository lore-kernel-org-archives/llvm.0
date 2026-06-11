Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7E8190473
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 03:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781150009; cv=none; b=JgnXXtYi7YP6nGvU5qWBc+DW1drdmnxYHewBkNFSStwFqx6bBSfujcnvL2FRPYaesaQXMOVpSqSf98NpwnHUhPsD493UKiD+AU2mXXwncE7phBkOBQiitwFKB8zNWicR9yIAJ9mi4xdgZsTZ9nGU7jwLrq11JIkZtSopFDglzNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781150009; c=relaxed/simple;
	bh=Yy/+xRHJiX/hDJ5xQsjisJqg3r4yly3VHd3NS0SNXAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhTDVILh955sXpox0fB9RlR/6EFAAAi/z+MqIhZCGryZicfaMsN3LEelXLMWqRtThABhR6Kt5YwXmuoz/c9RnR4dpL+6R88IMsf+grLfLVobZQG2s/MTTvXHmmeqq38NyL0he6oC5xAydirZE371y8LDm5XzVwKWRA4m0pTts48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAvOWPHv; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAvOWPHv"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so5036303a91.1
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 20:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781150006; x=1781754806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9N+wW4hckA7+pUN5DQbu3VTnKoKBAMqPRZDxheSBFcw=;
        b=IAvOWPHvFOFtyXNTThgvN0BnDQClB+nwiXoZ/EA2fNC6AlRIiRkwY2tkFj/F0z4DTc
         lTQFZu6WOyyqcNYJn4CFOmGeldpCN8GjmjR4QiHBLib5UJqXUCAtvfRSQoSXOPbZdoab
         REoxcE2gx901tUNJhhqaawUog9+d6WzfxQjOZgj7lb73FDHxgUyvAUfcA5r/vtFMwQyy
         8kyabsYROKw3i0PUlBLOzNLO6Bt86rht8k9VZkl7FrJdlT4k703oI4/fhc2g3DpLkG3Q
         EM9+a4AtmPXv0U4WcU5NT2M01dFWraQil0AVhcepjkbP/6EY3eK7HJaaqlt36H1LnWhN
         ed5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781150006; x=1781754806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9N+wW4hckA7+pUN5DQbu3VTnKoKBAMqPRZDxheSBFcw=;
        b=aTEY3y0kyMHWMSatqIRLSiI6zvAK+IdvchrcqXq3jTU7+kNDi9QNFYDQGaC4E/LC7+
         E6o8WBDVresmvdQtx4nNGzQPu5trTzB0UFzQX9CI0WqPQUR+83bMxj2nTnxTOkCjhVaS
         zjqABLiVC7bVkivseB8cgdtl2aCocpHbIcdjvPcxQ7rbI3MZrR9V9WVZfCxDzVVyDYM6
         BvPEzCHqibOAAnvaM5+xxQCg1jHxSS3cYmifcbiXgPMplCNAnckA2jtkY4sQYuCexfFA
         lvV8gY8XrGaUxgHL65VQfnnHh0xc8Ks3dKjE0ANX1zO7pWB+SbaL6Kd3qiq2tkUz0TiM
         snrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OQJw/s0Skm5K2dE32j6UIj/ABp8jy9FN/0WdOh5m4zudLU/ZOtrnBxo0K06/YuMlB+Mt/@lists.linux.dev
X-Gm-Message-State: AOJu0YxmTnBhfA+urs4gVQAF12mP0T/V+TJMTKGNcaW0KC1HlPaxOlVd
	/zhJYX6WBmxTbDru1zv+v/z1eneeL6WMN7DD3beYipZwlZdUW5z4iDZM
X-Gm-Gg: Acq92OGOZsHwz+IEs+ABRHIDmPeJRUvH3AUnUZOsgIZN3CyoCcAWm9pnUmkTd3PaFUf
	zDcql51to53FIaF0V1b7cUxvRZOHX6PdKtxauts1x1rpkhOj/S9y5EndeJJzFqksghtGQKjz+KB
	fl5YoUauGR1B+ZvDGn7/juIno1Nb9AxNuQj2BXUrMRFS/tZ4n7JHMF8E8rHz0ug7hRwTmrcTUmh
	vDWiWFRPVbumMk8arrs5ZDmGAboLIW9Npvbvhsp1uFQ2Lj2R8m+O8TvE6fMuwt7oSIlPlu5IC/i
	bJWanfaAP7AjlbFcqPEBCl5BEsvEH3lMA5oHg4sLW0TDa39vt+Wey0fBSzAUk/dcyLSbFXMzHug
	RmN/s2Y3edq6a536C/4y5vmZhJim7oYb1RMKcRtCTX6I94KvnpA+9AZzzqa+819r8c05ppLEYKu
	ehJWmWcnJGHUNqzQzPvOsBTLcXrfgx5tCToIeGZCmTRxdSZmGnuoDRr4zEWbf0dqRLnNrhRRePa
	1l2nxNKyDhBaCjHfbhz6ITjLt/3adBo2gliMotvhPOwSw==
X-Received: by 2002:a17:90b:1a84:b0:369:f48a:f24b with SMTP id 98e67ed59e1d1-3778ebecbeemr1357925a91.0.1781150005805;
        Wed, 10 Jun 2026 20:53:25 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Zhang Wei <zw@zh-kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv4 15/15] dmaengine: fsldma: fix kernel-doc param names to match function signatures
Date: Wed, 10 Jun 2026 20:52:45 -0700
Message-ID: <20260611035245.13439-16-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611035245.13439-1-rosenp@gmail.com>
References: <20260611035245.13439-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix kernel-doc warnings where the documented parameter names
(@chan) no longer match the actual function signatures (@dchan),
and add the missing @cookie and @txstate parameters to
fsl_tx_status.

These are pre-existing mismatches that predate the recent
devm conversion series.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 157db416eaaf..694c1b12bf2b 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -685,7 +685,7 @@ static void fsldma_cleanup_descriptors(struct fsldma_chan *chan)
 
 /**
  * fsl_dma_alloc_chan_resources - Allocate resources for DMA channel.
- * @chan : Freescale DMA channel
+ * @dchan : Freescale DMA channel
  *
  * This function will create a dma pool for descriptor allocation.
  *
@@ -742,7 +742,7 @@ static void fsldma_free_desc_list_reverse(struct fsldma_chan *chan,
 
 /**
  * fsl_dma_free_chan_resources - Free all resources of the channel.
- * @chan : Freescale DMA channel
+ * @dchan : Freescale DMA channel
  */
 static void fsl_dma_free_chan_resources(struct dma_chan *dchan)
 {
@@ -878,7 +878,7 @@ static int fsl_dma_device_config(struct dma_chan *dchan,
 
 /**
  * fsl_dma_memcpy_issue_pending - Issue the DMA start command
- * @chan : Freescale DMA channel
+ * @dchan : Freescale DMA channel
  */
 static void fsl_dma_memcpy_issue_pending(struct dma_chan *dchan)
 {
@@ -891,7 +891,9 @@ static void fsl_dma_memcpy_issue_pending(struct dma_chan *dchan)
 
 /**
  * fsl_tx_status - Determine the DMA status
- * @chan : Freescale DMA channel
+ * @dchan : Freescale DMA channel
+ * @cookie : DMA transaction identifier
+ * @txstate : DMA transaction state
  */
 static enum dma_status fsl_tx_status(struct dma_chan *dchan,
 					dma_cookie_t cookie,
-- 
2.54.0


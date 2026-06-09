Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682774D8D98
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043616; cv=none; b=nKiJZFbH6godo8H1NdpSdR9JyzaWUuRBL6CbdVmFq7MCQnw1BXKycySuk4zsEq7JyevCQj7dKer9QR1DLNG/izNcWq6OOTiazeU0xQmugNTn/LihEmhS3axyBUc914d5LNW8UQ+OW+IEhRGvd/SckkCIqQX5Z7BU7CJEf/918sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043616; c=relaxed/simple;
	bh=9Yea6xTnMAtPCPNuS9VV3xysMhmXAvdi4sueisMN3io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HAqasddKHdcPLkrTC6zQYNUB9GpvWWYmOhqOuFA2pFiqfpWNQLLVo++6AYLUUSQbt5HHE0GPql+gQZZXvtmoH7Ri/jOyrp1rKYHAKErRhTIzaqJkSYu7bBa+mqlMcakTv/UG4jVC+UJbfqpnIB/15T9nv/36okho084+exL3Bik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgJPvFk6; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgJPvFk6"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b903567fdso6132730a91.1
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043614; x=1781648414; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7abx5gUeKQ1VRxaWBSzbzTorD8zfPoqeElZR6g6xg44=;
        b=pgJPvFk6KPx7BvVO0UOT5M+SUuZUQLJwltyuN9aM+8b3/YDVkiCUtvV6Yd0H21qagC
         NY4ezSSl6kGpuhqQflQzvfg/6pfG7TfxNpFUYQNd1Sc38xmVh+f9Vjc0UWYLqthP0qZK
         kF0uLFNQ6vjCC77eSV+oT1mU+nPYhcopvaQnbqw21R7axtr3ZMnM9s7SGjgrHjJheSI/
         vbAwTROZ+Ux1XPHwQWJ99COiaz2eZ0D/+gBa0D9ghq3Y8IE8n6sA64AeWoIgjwQKuzLz
         cTaYdfush+Jpnb+63pVHnDsUuL/kxpR0d1YC92Ch+d+fijON3qrZkkZ3kSS1iYeEiFMa
         RlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043614; x=1781648414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7abx5gUeKQ1VRxaWBSzbzTorD8zfPoqeElZR6g6xg44=;
        b=ZpsDJXlKXvsV3kPW6/01JjPvioMue5KRvk1K2/kf6J9hTumj32RyTHMkHV+uJpD1Fi
         yBeflkLsKwLs3yOkdXV1dBoYSRHfGiRudFj6BtMQ20YtOsLXUP3c7mIe8UzVp3qY4Uoe
         gIxR62/vL4mcQMx6Hqg4JEnraKpgpfiGrEuNorRWAhMXWK0UP44q1Y8GgDwlWUnHLzL9
         28xu+s2Ezj1zvLgQ7M4VD7pXrhpK/KQT1hIZkQfEst+OEiJqi7SfNK51Qme+iEJDPCIW
         GeUECAAPmX/RaHR9ThnPg1JanWu7mNGsXyL/2P6ixztJLKcEMQVIJPFyFT1eSTVht65D
         3GYg==
X-Forwarded-Encrypted: i=1; AFNElJ8BqicrNE/+XjT+G+dRJrVPtw0CwVLZF0/cKNrU+vsO9/dt1f+v3SVatH8e6Mobj9IKsp7D@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5oZy6IUEj4Hv8+IxJsv4tgByt2ssOj9WO0G0x7Iay5OzyfuXa
	v3c3R5t+28Gei8JB2zjVx/r4A0x/uJIduAbMdTrEmMWVq/2z4sMm5yhZ50uglWtI
X-Gm-Gg: Acq92OHjeEXx99H1Ef0C1EIhaxNaHChxnlaWZCM8fMVOSxcpJXBWDRsB7r0kwK0DKY+
	JI3l2HI76h2MipxnxDHPa508GNcyLuW3mrxwn6yB6hAQBSmhORbOkgz1ag/ZgsGQRffL7Jp7OGH
	VpQkYwag2ar9/eiZRwAbuhYWktY3zGY9ybgGOQ8An9rag476Bz8JaSpsBtxiJiYOIS0FENB5eug
	OPuo2XgF2z3zB6ouCw5fCHMSDhP+cCozwPS0ERJ1MoJnkAj+8c6BokTfdPp4aS7dwLlcdnlzn5k
	RyV0csPCvOolvQkycuWxSWDB2aUtLSa/MXPNj5UuhzdKKIlpWXzNb7x9q/zuwNHoFr5c75ThYnJ
	NXKLYVcKGtT0VW+zQOXSnarkMtB8g2osMyYpvMsRVg2m2kyLwC0OZMoK8WXFTUKIrwgYSnf+eUA
	kT68AXaeFm4MmacwHZTDJUgpdajPNIWWeikPBIO6t+IDcC+f2YA1OQ6dAd/3HI7n+3ZRuQ36/y4
	1D7wRmPm4CdiYy3TbquiLpKl8jYTvU4TnAvPZknkLVOi3Lu781VNQas
X-Received: by 2002:a17:90b:5204:b0:36d:df4f:ab2 with SMTP id 98e67ed59e1d1-370f0772dd1mr26545593a91.13.1781043614688;
        Tue, 09 Jun 2026 15:20:14 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:20:14 -0700 (PDT)
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
Subject: [PATCHv3 15/15] dmaengine: fsldma: fix kernel-doc param names to match function signatures
Date: Tue,  9 Jun 2026 15:19:26 -0700
Message-ID: <20260609221926.35538-16-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609221926.35538-1-rosenp@gmail.com>
References: <20260609221926.35538-1-rosenp@gmail.com>
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
index d4c9b81ade0d..c0dbcd09999e 100644
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


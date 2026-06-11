Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FE233A70A
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 03:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149989; cv=none; b=LM617xPkceqYQhv6oJNaaYEN3hXEMIrLRkCehygMDJTdgAytFwVfkid1DGEDjy7zJx8sPg75DxZNG6z6LRjoebPn1l1QmQ8Do0zb7FvHZHHgcB/yqL46dLqx2kRqxO0Q61CNm9dKMvkb8bbDw/bstQkU7aXz47YdCR1pReY+o1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149989; c=relaxed/simple;
	bh=RWGgQ+fIx5zEE7hIr/SdyaUnQQt8wM2jyEcHAPXGR1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L1aL/cFlAVrSlrdIxq2Zz2vye8hmX4YIDhU4qGy/m7zgS4Rk7eLx+Vr+keb2WtkC0PMzAGPNF6GlztbuLaZhiFC8SxU9ur91ZJt5mIwBfcbicBY7GIfrNprdi/tS0ggyYtOBJqFpXEnBEmW1NYDtmeoHwbPihWfSdI0wR8HbDVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrun6CK3; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrun6CK3"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36da151a152so5229945a91.1
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 20:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149987; x=1781754787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twBxGuT7Vyeqc2tSt+1Cu5dVnnD709Tu79Udll0+igY=;
        b=nrun6CK3ri5q+F6xg9LBUFmR9zrMxe6HqJxojS9wMYvOZDi9uhHl154LphTH8nkV6j
         if4uVaSfFDDAZGljcpL6L4jZ5NgblFOoVgIAHiVkpd2KSUuxNfxut7+BbcC8iu4LhNSx
         /5aPKD0IW+jzeiRgOLHXf6lgEqFuc2le/A8lK9AWBRdkW/NMHNWhJ9XBJKl6rNpAEpc2
         QYrQkssDEiAmeqQXqQyf7wNkbxLxHQaofdB8+2PDbox2El3mBuZ2C6jXRfbPxQyCwmjW
         k1Rc4nbMLu9hahoQrc79aeGxO2BLGS5XoXVhTHmKcoBfYMKclBrD5HCWU8YE2JH9ZAbA
         fa1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149987; x=1781754787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=twBxGuT7Vyeqc2tSt+1Cu5dVnnD709Tu79Udll0+igY=;
        b=Oq0tiT+dz/F/6QIP3qFrQZlW1DTwY3B2wj0qB+Gk+Iqx6AioXaFyRRBEyFUfXpjDAW
         XCE1VQkFCduT1TXLS7Sj88YMLEQEaWde55SNcG8zBkUzJRLfI7378CX/lB7PbQk/oyXU
         07LUWcLAFxpzZyd2YmNoCgbBHDHh+wh+ObeuFU2OrA1KcDifvxvhGveS78loExOFigcC
         u+aGjYf/q+N7xCWgQM2rJuSsuW+vBj/nVXk2szs6BHpMTETrSLvnZs++yjOkfWjfE5nU
         DgJqWsVGH8//d92KReUMqLNnrIxc/iOGSKZ2ZEyVJPkRgwdGpL1u8sx1fXU4gS5QK7Vf
         pssQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cMCSkz6o7yvHOMHyk/OspiBYAjE9v41xGcWhPgeDe9nRuTCuibfzhBOCAJC2g8NrTEsEI@lists.linux.dev
X-Gm-Message-State: AOJu0YykO+i90MhCm5mZ8qDtb+kMYRNAEEtpQSO29x5003T90bBQRsev
	VINnhT0elZoQ0nsLft1abh5brZ/uyyinR3Mo8ARghf2hZLPVGec8P2ykmwyPYg==
X-Gm-Gg: Acq92OHd0k6O0J3l0cEnx9ocTmGcPLfY1AOhvyDq0SroNVK+wQ5cSzwlsVN6SlduAd/
	tBmXo6oFr7R8aTYh955CLesilFEljLsu3Jw805ZkawMzoN4KRzrKS++zNE0G5UqgYB/77K1P2uY
	DcEwqBjZmlY/ssBfJjrtndrwF5wYwmJPnmUFaSqtvaK4zqy4Kpn7y66OuLV/mrqB9hGbUA18QrA
	6PaoH2oeIKXZm7ni5oH5him2zVFKiKPD4kj/nEY1HoVRIBbCke+6f9hUYBOSBPm56EH0rkqjxDy
	y7R5/6fw2d9XQwclik7bfEGc+X9oOfubCYheBtkQ6cDe/rVnT1sHhAHQYqI7MPRgZfGCllh1Ite
	Tii6JPgyIyXTEmdgk+bsEgDQ/nKQLV7gjg4TLWYEhqbPfsOde1HAEerm5ZscySKutjzuUK+mL/f
	chpbqJZM1O6s9w3v081x7sN5nn++Zo+dXbpBkVeROTqT5GbhH4IzZ9qNxjZGdax/XfELotA3yjl
	aUg13JDT5SvAUO0zQ7ZWqdSB3agjdKpzIoj5UzgNgyQeQ==
X-Received: by 2002:a17:90b:4984:b0:36c:e254:4d5 with SMTP id 98e67ed59e1d1-3779c569455mr1233425a91.4.1781149987152;
        Wed, 10 Jun 2026 20:53:07 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:06 -0700 (PDT)
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
Subject: [PATCHv4 02/15] dmaengine: fsldma: drop desc_lock before invoking client callback
Date: Wed, 10 Jun 2026 20:52:32 -0700
Message-ID: <20260611035245.13439-3-rosenp@gmail.com>
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

fsldma_run_tx_complete_actions() calls dmaengine_desc_get_callback_invoke()
while still holding chan->desc_lock.  If the client submits a new
transaction from their completion callback, fsl_dma_tx_submit()
tries to acquire the same non-recursive spinlock, causing a
self-deadlock.

Fix by extracting the callback info under the lock, removing the
descriptor from ld_running, dropping the lock, then invoking the
callback and running dependencies outside the lock.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 108 ++++++++++++++++++++++---------------------
 1 file changed, 55 insertions(+), 53 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 0e2f84862261..455d21d738de 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -496,16 +496,19 @@ static void fsldma_clean_completed_descriptor(struct fsldma_chan *chan)
 }
 
 /**
- * fsldma_run_tx_complete_actions - cleanup a single link descriptor
+ * fsldma_run_tx_complete_actions - unmap and extract callback from a descriptor
  * @chan: Freescale DMA channel
- * @desc: descriptor to cleanup and free
+ * @desc: descriptor to process
  * @cookie: Freescale DMA transaction identifier
+ * @cb: returned callback information
  *
- * This function is used on a descriptor which has been executed by the DMA
- * controller. It will run any callbacks, submit any dependencies.
+ * Unmap the descriptor if it has been submitted and extract its callback
+ * into @cb.  The caller must invoke the callback and run dependencies
+ * after releasing chan->desc_lock.
  */
 static dma_cookie_t fsldma_run_tx_complete_actions(struct fsldma_chan *chan,
-		struct fsl_desc_sw *desc, dma_cookie_t cookie)
+		struct fsl_desc_sw *desc, dma_cookie_t cookie,
+		struct dmaengine_desc_callback *cb)
 {
 	struct dma_async_tx_descriptor *txd = &desc->async_tx;
 	dma_cookie_t ret = cookie;
@@ -514,49 +517,14 @@ static dma_cookie_t fsldma_run_tx_complete_actions(struct fsldma_chan *chan,
 
 	if (txd->cookie > 0) {
 		ret = txd->cookie;
-
 		dma_descriptor_unmap(txd);
-		/* Run the link descriptor callback function */
-		dmaengine_desc_get_callback_invoke(txd, NULL);
 	}
 
-	/* Run any dependencies */
-	dma_run_dependencies(txd);
+	dmaengine_desc_get_callback(txd, cb);
 
 	return ret;
 }
 
-/**
- * fsldma_clean_running_descriptor - move the completed descriptor from
- * ld_running to ld_completed
- * @chan: Freescale DMA channel
- * @desc: the descriptor which is completed
- *
- * Free the descriptor directly if acked by async_tx api, or move it to
- * queue ld_completed.
- */
-static void fsldma_clean_running_descriptor(struct fsldma_chan *chan,
-		struct fsl_desc_sw *desc)
-{
-	/* Remove from the list of transactions */
-	list_del(&desc->node);
-
-	/*
-	 * the client is allowed to attach dependent operations
-	 * until 'ack' is set
-	 */
-	if (!async_tx_test_ack(&desc->async_tx)) {
-		/*
-		 * Move this descriptor to the list of descriptors which is
-		 * completed, but still awaiting the 'ack' bit to be set.
-		 */
-		list_add_tail(&desc->node, &chan->ld_completed);
-		return;
-	}
-
-	dma_pool_free(chan->desc_pool, desc, desc->async_tx.phys);
-}
-
 /**
  * fsl_chan_xfer_ld_queue - transfer any pending transactions
  * @chan : Freescale DMA channel
@@ -635,22 +603,23 @@ static void fsl_chan_xfer_ld_queue(struct fsldma_chan *chan)
  */
 static void fsldma_cleanup_descriptors(struct fsldma_chan *chan)
 {
-	struct fsl_desc_sw *desc, *_desc;
+	struct fsl_desc_sw *desc;
 	dma_cookie_t cookie = 0;
 	dma_addr_t curr_phys = get_cdar(chan);
 	int seen_current = 0;
 
 	fsldma_clean_completed_descriptor(chan);
 
-	/* Run the callback for each descriptor, in order */
-	list_for_each_entry_safe(desc, _desc, &chan->ld_running, node) {
-		/*
-		 * do not advance past the current descriptor loaded into the
-		 * hardware channel, subsequent descriptors are either in
-		 * process or have not been submitted
-		 */
-		if (seen_current)
-			break;
+	/*
+	 * Take descriptors one at a time from the front of the running
+	 * queue.  We re-read the list each iteration so that we don't
+	 * chase a stale next pointer across the lock-drop below.
+	 */
+	while (!seen_current && !list_empty(&chan->ld_running)) {
+		struct dmaengine_desc_callback cb;
+
+		desc = list_first_entry(&chan->ld_running,
+					struct fsl_desc_sw, node);
 
 		/*
 		 * stop the search if we reach the current descriptor and the
@@ -662,9 +631,42 @@ static void fsldma_cleanup_descriptors(struct fsldma_chan *chan)
 				break;
 		}
 
-		cookie = fsldma_run_tx_complete_actions(chan, desc, cookie);
+		cookie = fsldma_run_tx_complete_actions(chan, desc, cookie, &cb);
 
-		fsldma_clean_running_descriptor(chan, desc);
+		/*
+		 * Remove from the running list before dropping the lock so
+		 * that terminate_all cannot free this descriptor while we
+		 * call into the client below.
+		 */
+		list_del(&desc->node);
+
+		/*
+		 * Prevent dma_run_dependencies() from calling
+		 * fsl_chan_xfer_ld_queue() while we are not holding the
+		 * lock.  That would splice pending descriptors into
+		 * ld_running before they have been completed by hardware.
+		 * fsl_chan_xfer_ld_queue at the end of this function will
+		 * re-evaluate the situation.
+		 */
+		chan->idle = false;
+
+		/*
+		 * Drop the lock before invoking the client callback, since
+		 * the DMAengine API explicitly allows clients to submit new
+		 * transactions from their completion callback.  Otherwise
+		 * we self-deadlock on chan->desc_lock.
+		 */
+		spin_unlock(&chan->desc_lock);
+		dmaengine_desc_callback_invoke(&cb, NULL);
+		dma_run_dependencies(&desc->async_tx);
+		spin_lock(&chan->desc_lock);
+
+		chan->idle = true;
+
+		if (!async_tx_test_ack(&desc->async_tx))
+			list_add_tail(&desc->node, &chan->ld_completed);
+		else
+			dma_pool_free(chan->desc_pool, desc, desc->async_tx.phys);
 	}
 
 	/*
-- 
2.54.0


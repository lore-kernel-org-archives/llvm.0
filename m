Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F873B5E01
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043592; cv=none; b=po/nGgYxFsPgcG3b8dtOl7iKNE4XpYABc0i8DjV45OU5uvfFFMnknZ9gHhKSHzUHy/mz7HziT3nqsd4qmA/nLUMwIbx+bFiiVEPehzQjOegw/ngo3WzpOb4gb3M8ru66y1e5oI6KCVDL7u7c3j8LOtBGrcWkyT9yPMj/eMprZQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043592; c=relaxed/simple;
	bh=RWGgQ+fIx5zEE7hIr/SdyaUnQQt8wM2jyEcHAPXGR1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=naHViGyXKnk1IqU1iSpsHQSj0fkrXD1OrRzuHnPAYlvhV4px9AY5dQrN64IxsFkPLkpFqIPrU5N0pAavAzd2HMUJXQdKFezvgeIq5lZ+QA0B1By3aTQvU2ztkyInVRaWVTuuXHECvkeh7NaghtbSvBTo9D5SEELVZJggOwsXgrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwinqtx3; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwinqtx3"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c85d8615b09so3551274a12.3
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043590; x=1781648390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twBxGuT7Vyeqc2tSt+1Cu5dVnnD709Tu79Udll0+igY=;
        b=cwinqtx3d540ZjdHvDe/uMX+HeH5xzHntQ2AvkQm2dFbbuRQdHwHuM67JFGZzrab/8
         gG7M6GUOgqXraO+9HnGgzLEMViRic6EVnA64TJO0HRpuVQR7KzKsWH+jE6rqVNaO3qCY
         z6NEVzoHpdc8hZ5z4lImDMI2jw0kpqobEjeLpA9x5SeQsNPwvFnviDZdBb9zwZbuZHC5
         4fHHNN/12CWVB40DU/CetUykYK87rIEiWPoMKf0IVgaDD1Yq4LJx/8kByNCmYY/LjUo1
         haPDsur8tCpWtZ2l6NtIE7zKmV8bB7eUOoBjLyMZ+bsu34jZoFJeHNT1kvTZBDwB42LC
         mX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043590; x=1781648390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=twBxGuT7Vyeqc2tSt+1Cu5dVnnD709Tu79Udll0+igY=;
        b=BHZm7Z1BDLnMn/0R3hXN43EmHnO0VRPi6zvI8RYiUh3PbAX1jYUerXnuLRk65rLc70
         KDEOVjvrgQ7M1wo3BIcu5AtXO8VtNd/qJRcxs9eBBSWA+oRUhdljTOg+182137hbsUW8
         8CWd4xNgfimI8CLAFU6CBU7PtRS2mvfZY3sV4ndAJz8210GqF1PKZK1wBQH/I9X9D7nQ
         0UsvS7d7IWEApbZV5nO5ToHM7sFx9Auu38bIaQB5u1r9IVc/QtYXaqzDkfLfQzffSSRl
         jropLYfPQbEy3HKc+l2B1ECAKTc5PMmm1kD1gCVetU7+uLoP6A/wM5zvIe3PYGad1HWf
         YJQg==
X-Forwarded-Encrypted: i=1; AFNElJ8VuPfaT6sulT/HTYGH6/UfC6cSh+HZvbwYasowxwCwda8MbGVVR+Z/7RNq1HIGSwkGRQCY@lists.linux.dev
X-Gm-Message-State: AOJu0Yyffjf0EbP/aCBGSw3n9Wej3NAxPGwimKmU35O5ef8h7J6BwMNC
	9G/fNUh7hqUkzwFrSFsBM0isOrvymv0V4D7Evb/Yqt30YVIrGSrokgzn
X-Gm-Gg: Acq92OHIm8wbd44+vyRLt5aw6RH+FJB+2e8JBsKpPW3xVskPLo1ziJzOMqSOOr550qJ
	tySoqvrOlIbhDPzd+Z0+k7Q4A45SxjrCHMYU6F/91oI24tcgFv0rrp/4l1N0pZb+iIxnYZBz2XO
	d9DKAFU1RS5kb8C9dZ9B2C7Yq4gatvkQXTLV3f+5YzEnpqNhj9Flq8NER8O95s8oc/q9Ygyxh4x
	i74N/Vcjw5lmwx5bpqiU7OOIeVzaQuOEa1fF4QsO2tPOKgnDgbxQlf8suGz9uXkUnh4nD6XFOH+
	6I4F0iW0S3rlejcFYlWZ8eh5ypoIQiyoRZQqXmku5qd5OAQ9xRz8/2z16gJuaH7QiU57KnwUwAy
	5aFzkGfqeG1qBRxxtHEVzjMWuHnhiWL3e8snyOcrlic5yQQP8o0GoY5kGMyFiIflfexOgZDuWCw
	eRHwwEN9LjMVzDEMY7qAa3wKsfYWFjMyNIaRPuJBM3MUzA5b3whX5+qq56kXonqtV+hnTIAkBQk
	UgzhxOcJYqEUZPjZNpUP3WxbGs4LhWEOntPAXeuqfMFXg==
X-Received: by 2002:a05:6a20:1609:b0:39f:3ca8:a33b with SMTP id adf61e73a8af0-3b4ccd764e8mr27610402637.17.1781043590415;
        Tue, 09 Jun 2026 15:19:50 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:19:49 -0700 (PDT)
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
Subject: [PATCHv3 02/15] dmaengine: fsldma: drop desc_lock before invoking client callback
Date: Tue,  9 Jun 2026 15:19:13 -0700
Message-ID: <20260609221926.35538-3-rosenp@gmail.com>
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


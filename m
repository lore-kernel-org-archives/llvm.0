Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7261C175C
	for <llvm@lists.linux.dev>; Tue, 19 Nov 2024 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732013034; cv=none; b=LetAtShM6nabIpSBouTBwLZ1gbAqoLRp6jKThY6vuoDfDvrfcaZ4BWDyuG3CFudd5cyru8lq46dAn4uENRC6K76Kak90U8AImljPuAFLoDd7DYu7MSdwgXVqllHcz/hhiwQnREQB3o68sgZ5hKje/oLKuGyvf3bcvVeOH0GoXmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732013034; c=relaxed/simple;
	bh=mJwS8pQ4YuI0VuBo4dFVcQzoGWIcpPuIXP3lsqZsb/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I+1j7q8hMLRo4xMFirvNUN2WOZNdjiqrfrbckjBARW+XrfaiPpCz0gvHe/KRwjqWJV4Q0fP4jfJnCMxhxS2BfxZdCdVoCq8K9PCWppjTWCpg2kOIF3ph1PLnmssRD/A4Wa6IiWIkbBqXLz43mAorsk6hWrfTxHvjeGmT1pxIG8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghzokQDh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghzokQDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732013033; x=1763549033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mJwS8pQ4YuI0VuBo4dFVcQzoGWIcpPuIXP3lsqZsb/U=;
  b=ghzokQDht83d2PtjUcxoZB/epxGLRpzrKgHCIkDBtKQgj0+gvqnyUy3g
   N5Jm35ytFFsslX7leZ2pa5KTn/cm7iT6dK53kLS08Q2UtYKzLLnZPgzLW
   mC/lTXyiLTCLAx9afcanCQDpLuAabzxgs6kzK8emQCgMs7iOVCYXiGLva
   q1YTvIbus44vG/DoK0H8Zl8AyV0BNj1EGTUpOQNegkI44uzIqqzAqN75P
   xXXKakhj0Hi2Vc8ErwYnYXrSlreiJZKH7Khe/shgKSHh4bgB4tqg691o5
   6RTPvI3a1FFSE3XKMo9XT6KhCtpvbaqOlmJucmo6tjbU3iyiU1maMT9z2
   Q==;
X-CSE-ConnectionGUID: h38jNYq1ThW4HTHa5J6nLw==
X-CSE-MsgGUID: F/vLep2KTkeEGus97jGDSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35913989"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="35913989"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 02:43:51 -0800
X-CSE-ConnectionGUID: 2wwF5anTTl6UQ5mrapDsqw==
X-CSE-MsgGUID: n4s7kc4yRgmTT8sJr2Ll9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89925597"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 19 Nov 2024 02:43:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6E6EA18B; Tue, 19 Nov 2024 12:43:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] genirq: Move irq_forced_thread_fn() further in the code
Date: Tue, 19 Nov 2024 12:42:34 +0200
Message-ID: <20241119104339.2112455-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241119104339.2112455-1-andriy.shevchenko@linux.intel.com>
References: <20241119104339.2112455-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a preparation of the refactoring, move irq_forced_thread_fn()
further in the code. No functional changes intented.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 kernel/irq/manage.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index f0803d6bd296..310fbeed4d7a 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1181,6 +1181,24 @@ static void irq_finalize_oneshot(struct irq_desc *desc,
 	chip_bus_sync_unlock(desc);
 }
 
+/*
+ * Interrupts explicitly requested as threaded interrupts want to be
+ * preemptible - many of them need to sleep and wait for slow busses to
+ * complete.
+ */
+static irqreturn_t irq_thread_fn(struct irq_desc *desc,
+		struct irqaction *action)
+{
+	irqreturn_t ret;
+
+	ret = action->thread_fn(action->irq, action->dev_id);
+	if (ret == IRQ_HANDLED)
+		atomic_inc(&desc->threads_handled);
+
+	irq_finalize_oneshot(desc, action);
+	return ret;
+}
+
 /*
  * Interrupts which are not explicitly requested as threaded
  * interrupts rely on the implicit bh/preempt disable of the hard irq
@@ -1206,24 +1224,6 @@ irq_forced_thread_fn(struct irq_desc *desc, struct irqaction *action)
 	return ret;
 }
 
-/*
- * Interrupts explicitly requested as threaded interrupts want to be
- * preemptible - many of them need to sleep and wait for slow busses to
- * complete.
- */
-static irqreturn_t irq_thread_fn(struct irq_desc *desc,
-		struct irqaction *action)
-{
-	irqreturn_t ret;
-
-	ret = action->thread_fn(action->irq, action->dev_id);
-	if (ret == IRQ_HANDLED)
-		atomic_inc(&desc->threads_handled);
-
-	irq_finalize_oneshot(desc, action);
-	return ret;
-}
-
 void wake_threads_waitq(struct irq_desc *desc)
 {
 	if (atomic_dec_and_test(&desc->threads_active))
-- 
2.43.0.rc1.1336.g36b5255a03ac


Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4761BCA0A
	for <llvm@lists.linux.dev>; Tue, 19 Nov 2024 10:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732013032; cv=none; b=pVGRkBeyHEOlowi+jdg838U0iHwHO3W+iRRde6lVdkoTgMAF6QLBp4VZCF+1JgSyxMjAOkWDxyqxMdWFoiduLpQHNOIZrg1t7Hz0yY34tf95B3VUXzf5SntPhmT60OTyCSL5PR1ZwLn6WLWAgS/ktUDWetQhxO4YCVUQR2Qeqow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732013032; c=relaxed/simple;
	bh=0eB57OXktMTVfWwJ2tKKtqLAr1e19V1PNE8AWBCJze4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z0SBoYAxzMVQtLJqgMCPEDZ9tMJmJaPuZ20ORfQfrXvOT6Za4lkCjc+KC2bid23txuKVO61SwOXvTyczzN6R3ypjralLNwAphVbyNLhwnQmlNK6jDHUgVEP+b00uKIXffRifYqq1Sl3Ppb+6IM5+jOUvLabsJJq82Mto1ebGPAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFObdHqI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFObdHqI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732013031; x=1763549031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0eB57OXktMTVfWwJ2tKKtqLAr1e19V1PNE8AWBCJze4=;
  b=iFObdHqIaXxLOpWTdINGn0rIvL8tUfUUBTuvWiObnI0U6MOxwB9Uxla6
   dOG2J/3sG6IYTjLOQqY01lcwV8B6Uhy0WY1pDmFdBXprQtScZkY+vwJRr
   RbzsL7r28OrMG429z5M27w4YBIYUwgmCIvfYRh3KXSe3JqL/2BSHA+32i
   VcmmsbGZPfCCqR058B8k5nQNNVPo35hpG6Af8S7bB5ysXqRQEVdcWbqvP
   4/TmGvf1TO3b0cVgxSI0bpvIS52fguuuLwEJWkeKTWooAZDkzxkzFluGN
   b1dBEZc2LAArejkCSRnYXtoKTo2/zZFuLhJgYqMmYuddDgKttgZ05K7dD
   w==;
X-CSE-ConnectionGUID: eSgmgW7BT7uBfNLxHnlr2A==
X-CSE-MsgGUID: J2kgJvTNQGucFZ7kiQh+8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35913984"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="35913984"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 02:43:50 -0800
X-CSE-ConnectionGUID: pTISQvk0Q8ihZRtZvFmJQw==
X-CSE-MsgGUID: TmFPKcjcS26r4iwzou9Z1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89925596"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 19 Nov 2024 02:43:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 78915251; Tue, 19 Nov 2024 12:43:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] genirq: Reuse irq_thread_fn() for forced thread case
Date: Tue, 19 Nov 2024 12:42:35 +0200
Message-ID: <20241119104339.2112455-3-andriy.shevchenko@linux.intel.com>
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

The irq_forced_thread_fn() uses the same action callback
as the non-forced variant but with different locking decorations.
Reuse irq_thread_fn() here to make that clear.

bloat-o-meter statistics on x86_64 (GCC-13, clang-18 shows no difference):

  Function                          old     new   delta
  irq_forced_thread_fn              118      55     -63
  Total: Before=13845, After=13782, chg -0.46%

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 kernel/irq/manage.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 310fbeed4d7a..2d9993f86fde 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1213,11 +1213,7 @@ irq_forced_thread_fn(struct irq_desc *desc, struct irqaction *action)
 	local_bh_disable();
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 		local_irq_disable();
-	ret = action->thread_fn(action->irq, action->dev_id);
-	if (ret == IRQ_HANDLED)
-		atomic_inc(&desc->threads_handled);
-
-	irq_finalize_oneshot(desc, action);
+	ret = irq_thread_fn(desc, action);
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 		local_irq_enable();
 	local_bh_enable();
-- 
2.43.0.rc1.1336.g36b5255a03ac


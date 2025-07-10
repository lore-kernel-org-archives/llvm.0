Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A47628C5D5
	for <llvm@lists.linux.dev>; Thu, 10 Jul 2025 08:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752135787; cv=none; b=FSHRh0NNtTnBXRTU47i87SQlRHr4XSahFFRFnqun9m6Zjl7mDlvC0Rl2FtSszYfpGO4QGWbQ1U6dG7XXicrSCT0KQTBXrC21D37w5MprWEHxP2M/GhhRE2GZOXRbNGKPKC0pllLHhKOZLYlmza4oCzzLDFUw6QF2SOg2BH9ufJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752135787; c=relaxed/simple;
	bh=BrBI68KFgcdqMo9RpMgabneyAtFTdn7ZRHsyJTBtP9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GgvYTI9XRuTz8MIQtIDoSrvABn3I8bw/0kA/xKC/g+RiaY01ZqziXd2D+B12viVEtOFm2s+I1doFE2E0Lu7kPtJ8ckkQk0dOl5SDy/qrKdyWBr+XNXHbW53jh5lSXBaHlYQSyFNPWryERbjCrnZMAceiX8oJmVdVaCbw+ZheirE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CE/7Afy+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CE/7Afy+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752135786; x=1783671786;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BrBI68KFgcdqMo9RpMgabneyAtFTdn7ZRHsyJTBtP9M=;
  b=CE/7Afy+tZDUhc1HbGpstn8PCSAl440zY/zz5JYC5RzVCeQ2qhDlLA99
   rtiXjLBqBXeEBvbFRlm4H8p7QuQgG0l4MPuQAR48bG8VbcQNmPTO7UGip
   1usihxob19+OmgQeUDfEfsy9l2gW1cBbzqeaS7gZnggPVwmDusk9xsflC
   3M2cj94GS1hb75emZ6U0zSqhzLLXkGbQI18sLYi6BKQoJ5+8zQT/phIcs
   92uEZULZnuzAQfiCkv9q6Jmdh27AbzNALTqroW40hKx+CWk6Z8S3silhh
   qlDpbpHAUXC49fvD6ylavXylLn+q8k3Sv1LImrdEE/H0sscdRAn17Tuw4
   w==;
X-CSE-ConnectionGUID: wcZdq63rQpSwIA3nhbAI2A==
X-CSE-MsgGUID: a+2tRyxhSjiiASBuoiCBKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="42036950"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="42036950"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 01:23:05 -0700
X-CSE-ConnectionGUID: tCWSlxrLRK2BF40910RQAw==
X-CSE-MsgGUID: W4qf19BJRIywLHi2soXl1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="161671672"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 10 Jul 2025 01:23:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DE1951B7; Thu, 10 Jul 2025 11:23:00 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Leon Romanovsky <leon@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] locking/lockdep: Move pmd_to_hmm_pfn_flags() to the respective #ifdeffery
Date: Thu, 10 Jul 2025 11:22:57 +0300
Message-ID: <20250710082257.663850-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When pmd_to_hmm_pfn_flags() is unused, it prevents kernel builds with clang,
`make W=1` and CONFIG_TRANSPARENT_HUGEPAGE=n:

  mm/hmm.c:186:29: warning: unused function 'pmd_to_hmm_pfn_flags' [-Wunused-function]

Fix this by moving the function to the respective existing ifdeffery
for its the only user.

See also:

  6863f5643dd7 ("kbuild: allow Clang to find unused static inline functions for W=1 build")

Fixes: 9d3973d60f0a ("mm/hmm: cleanup the hmm_vma_handle_pmd stub")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 mm/hmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index e8b26aa838b9..015ab243f081 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -183,6 +183,7 @@ static inline unsigned long hmm_pfn_flags_order(unsigned long order)
 	return order << HMM_PFN_ORDER_SHIFT;
 }
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static inline unsigned long pmd_to_hmm_pfn_flags(struct hmm_range *range,
 						 pmd_t pmd)
 {
@@ -193,7 +194,6 @@ static inline unsigned long pmd_to_hmm_pfn_flags(struct hmm_range *range,
 	       hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT);
 }
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 			      unsigned long end, unsigned long hmm_pfns[],
 			      pmd_t pmd)
-- 
2.47.2


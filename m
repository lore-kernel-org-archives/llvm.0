Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D21C21A95D
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 12:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758027111; cv=none; b=TaYf2iim2p3YYKCv2lIjTNCrFMa5ATBjW8ITQb9tXhLWZqVGuRgihCmzArCXePjbOq2NfDyG7TazmP0tlT+jgJkSNTsIvtJ/78HNqRkZBPDS3AEqh/Zzy21ZiVLPAb5gdWxEhbmi+yUFPoXmmno0TAKRuml203eT+8zJsgrazGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758027111; c=relaxed/simple;
	bh=67qe2cHRWzRfMUP3ME91QmZPRdAfH2+ZYKLVwC5M8ik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Foe6L7cDT1fO8dYp/sMQ3unU93IaJ8oEAl3zyTW+Gif4gz5rLjMp9YbX6Gtv04lNZMOnryKBzw4VNzyKRynyAXCwuJB9KGov6FEDIFPZlA5Own+AWfWWxTdhAJGA8xqvVGmHu/JbdmIkdf6qE+nwdBtG7JvzJuFV/PVFkhS+PYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0s43wq2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0s43wq2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758027110; x=1789563110;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=67qe2cHRWzRfMUP3ME91QmZPRdAfH2+ZYKLVwC5M8ik=;
  b=G0s43wq2fx5vBJQPO/izvFo5LfT0tnPFlnYkPue58oQRDs2RKgBK4b4c
   +4am4AokCeqADDBrG24x3vD/IYvC0pT2Y0SoIsmvUDdVN+BVArFsepGDj
   89fQAn5RHMv1D1PHjP741V4dmp0QLFt0aLsXUCHX3TFEujeW1F6uEQkgn
   VwCVPqmhGDDuP77yaQGc5w9Zh+Of5kL9w4iBjcufQVFJRSBW2i0E++NN4
   erxTTcFBw0zcUjDrJinpLLvMGQp5uGL9gHH/3X1neYBuIaLAzDuuhFfw3
   q2gbZcjlKZHErFkqQYTJIj63XaHT/0kxxKlE7PLyWqICaqKsE1QZ8cBZ4
   Q==;
X-CSE-ConnectionGUID: K1PTlqzwSwqWrUrEjQDZow==
X-CSE-MsgGUID: XJaklR1pSACx5JMX1p21+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60364098"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60364098"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 05:51:50 -0700
X-CSE-ConnectionGUID: h8Lkt1NbTRqMIpPbxHGW6Q==
X-CSE-MsgGUID: 7PQfZTs0R2W/sucx0zx+gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="174537453"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 16 Sep 2025 05:51:46 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 83F2895; Tue, 16 Sep 2025 14:51:45 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [resend, PATCH v2 1/1] kexec: Remove unused code in kimage_load_cma_segment()
Date: Tue, 16 Sep 2025 14:51:09 +0200
Message-ID: <20250916125124.3094021-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang is not happy about set but unused variable:

kernel/kexec_core.c:745:16: error: variable 'maddr' set but not used [-Werror,-Wunused-but-set-variable]
  745 |         unsigned long maddr;
      |                       ^
1 error generated.

Fix the compilation breakage (`make W=1` build) by removing unused variable.

As Nathan noted, GCC 16 produces the similar warning;

Fixes: f4fecb50d6e1 ("kexec_core: remove superfluous page offset handling in segment loading")
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: fixed Fixes (Nathan), added a note about GCC (Nathan), added tag (Nathan)

 kernel/kexec_core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index 5357ed39e9d1..32722926bc7e 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -742,7 +742,6 @@ static int kimage_load_cma_segment(struct kimage *image, int idx)
 	struct kexec_segment *segment = &image->segment[idx];
 	struct page *cma = image->segment_cma[idx];
 	char *ptr = page_address(cma);
-	unsigned long maddr;
 	size_t ubytes, mbytes;
 	int result = 0;
 	unsigned char __user *buf = NULL;
@@ -754,7 +753,6 @@ static int kimage_load_cma_segment(struct kimage *image, int idx)
 		buf = segment->buf;
 	ubytes = segment->bufsz;
 	mbytes = segment->memsz;
-	maddr = segment->mem;
 
 	/* Then copy from source buffer to the CMA one */
 	while (mbytes) {
@@ -782,7 +780,6 @@ static int kimage_load_cma_segment(struct kimage *image, int idx)
 		}
 
 		ptr    += mchunk;
-		maddr  += mchunk;
 		mbytes -= mchunk;
 
 		cond_resched();
-- 
2.50.1


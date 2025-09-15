Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154512DC786
	for <llvm@lists.linux.dev>; Mon, 15 Sep 2025 15:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757951749; cv=none; b=M28JNwnAlyol+yqvnq/j8oWtukVJgVQtsQiynrsM8jq1uHa+ydXSyIGMO2uqnrsHxP/LWBO+WbrM8gQoGBYQ8Ysnodynz7yjTPnkY1RGqCTU4HVr6Q8O9Y1gMX+Dq5grZBYfpKrb3pmO3z90VW0PgqhKipuDIhdnYQvZLU5sNdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757951749; c=relaxed/simple;
	bh=XSaTVE69Y82izKbCX7lEZ0n9v5yXDvhPB5ubZ5Z3Ya8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DdjL6Do+ZMF9ijrx2umqLJK6gZH3GBV6JdqwJSQ/HkURqSAQjOuOL0y6tWY6OS3guPtydw7L3IQtSD0VjqEFv2QQbGPJZqivxVr56kvXxFHm5uCLzhuytS0yadvngJqvZkYarQcAix2cpDkX7/eFTlMO7lWKghn69qFQhLtlldM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIZjdQMX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIZjdQMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757951748; x=1789487748;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XSaTVE69Y82izKbCX7lEZ0n9v5yXDvhPB5ubZ5Z3Ya8=;
  b=VIZjdQMXW1ou0vnoAw5I4aXDB9SGBH+EvWH43vbpYF57Kuf6zCQ3m4ut
   g4NjgUenDt6Ge/hLmmm7jdBJyYoYPkgqTR/fK1PwzeLiY79H87Mxruamk
   DGiE+SMv2liMCPI3uOyOuf9SPMdURnoyTeuBM3jEygnY6UzvV+KAV9zCe
   0gPnbjR+/6ZATzb6byMbzfhAC80BU9AZ45LD8YUWBbVuiT7Cl5MmRFZRg
   yDi+ShrwU+nSuXLL2ixAF0WqQXETDZ5ncpKuKfzsg8UHncYlPCZOEuXML
   N6uJ2X+mOnUTa8XsZdd7JE+7jFJARvVkN/it53dT6NHsprPK68/Gw/9rt
   g==;
X-CSE-ConnectionGUID: ZK1up8DdR0iYOlbsp8ShzA==
X-CSE-MsgGUID: VjZT+JY3SqCoK8gKkc//uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="62846010"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="62846010"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 08:55:47 -0700
X-CSE-ConnectionGUID: aDkoebD3TCmck7IT51wYUg==
X-CSE-MsgGUID: Xf2A40I4R7K9ggmEzCL6WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="175095835"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 15 Sep 2025 08:55:45 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5E6C694; Mon, 15 Sep 2025 17:55:44 +0200 (CEST)
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
Subject: [PATCH v1 1/1] kexec: Remove unused code in kimage_load_cma_segment()
Date: Mon, 15 Sep 2025 17:55:43 +0200
Message-ID: <20250915155543.2912469-1-andriy.shevchenko@linux.intel.com>
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

Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
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


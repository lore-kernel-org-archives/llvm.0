Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E5E82C69;
	Mon, 25 Mar 2024 12:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711371474; cv=none; b=qMlml1ZVKBTNJ9SsH8qb/flG1ETJAPJy1c4y/IvgqeiigCKQvGPnVNitLNP6olcLQ7fjExpItxzaPXX/q/CkVP6cfq5JLPLmw5ZhswchpX6DGq07x2qEnE36u4flMvzMa6Ie8M3EjgxDH7XiIcOyDz58LkCYDpHR6Gl8bVBswH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711371474; c=relaxed/simple;
	bh=CzBs56JhrKv4N4DRxQV2Un6CkUEhsdMILwao7XU7lB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKRhAU/J33intyCmZccU0w2PF2QHpp5+GQxYCHyEe+pIK6+LuP5lLu7D2UPm+5cjLVdrWQYrTiQSQ6fClZAxsMf0PsIJOIrCBx2L3iG3ay4a5TLekduVzVrGFqMxQq0eea18LDiDvSQJbMPHB6o/YFggfEiFSDPpgtBqdmW2YDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeLkD19W; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeLkD19W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711371471; x=1742907471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CzBs56JhrKv4N4DRxQV2Un6CkUEhsdMILwao7XU7lB0=;
  b=jeLkD19W6dTzCRPsMlU8BOvGMlMBgeaonKURH4elqhj1H/zb7tuvFN0s
   UNjUOZtxkr0H5Hr4QAdzXeQsJ+Y684pH0xRNsiskf+xbnFwFFGjqPMQ1A
   QhRD71v4Y57+n0xSQYIrkC49tAznezBpygq2ZEZ8jjnFDRr1ZhD0oN8hn
   0lhSnQPyVvUYWI3YtnVbs7wfGznZmaSajw5J4ASJtHUvqxP9afkNGDCqe
   3hHIH3GwfWVCkHBmLCgDgFQTETXlE0QEykSaAIISgw21WKb9KJabAmrrZ
   M+QRmT9pPFlF5H1gyGW2DKVyBw7I2+7VuCeuNf+ZY6L1o3c80AZgLQlld
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6553026"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6553026"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 05:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="937070391"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="937070391"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2024 05:57:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 795E513F; Mon, 25 Mar 2024 14:57:48 +0200 (EET)
Date: Mon, 25 Mar 2024 14:57:48 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: "Jason A. Donenfeld" <zx2c4@kernel.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Elena Reshetova <elena.reshetova@intel.com>, 
	Theodore Ts'o <tytso@mit.edu>
Subject: Re: [crng-random:master 2/2] arch/x86/coco/core.c:189:2: error: call
 to undeclared function 'memzero_explicit'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <wh7cqsco5vgkzixis7qfbvvsb6c2t7ms6ox2wiepo5rrk3y3c2@akvtfgu3dpgi>
References: <202403240934.Nf4UUK5L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202403240934.Nf4UUK5L-lkp@intel.com>

On Sun, Mar 24, 2024 at 09:15:17AM +0800, kernel test robot wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git master
> head:   6fba9af4a847c5ee67715bc6f7959e9ab6394275
> commit: 6fba9af4a847c5ee67715bc6f7959e9ab6394275 [2/2] x86/coco: Require seeding RNG with RDRAND on CoCo systems
> config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240324/202403240934.Nf4UUK5L-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403240934.Nf4UUK5L-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403240934.Nf4UUK5L-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/x86/coco/core.c:189:2: error: call to undeclared function 'memzero_explicit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      189 |         memzero_explicit(rng_seed, sizeof(rng_seed));
>          |         ^
>    1 error generated.

There's also issue with WARN_ON() in archrandom.h.

Fixup for these two issues:

diff --git a/arch/x86/coco/core.c b/arch/x86/coco/core.c
index 95e27dca9328..67edebb235e1 100644
--- a/arch/x86/coco/core.c
+++ b/arch/x86/coco/core.c
@@ -11,6 +11,7 @@
 #include <linux/export.h>
 #include <linux/cc_platform.h>
 #include <linux/random.h>
+#include <linux/string.h>
 
 #include <asm/archrandom.h>
 #include <asm/coco.h>
diff --git a/arch/x86/include/asm/archrandom.h b/arch/x86/include/asm/archrandom.h
index 1cc01ecd5e75..3066b339d4ce 100644
--- a/arch/x86/include/asm/archrandom.h
+++ b/arch/x86/include/asm/archrandom.h
@@ -12,6 +12,7 @@
 
 #include <asm/processor.h>
 #include <asm/cpufeature.h>
+#include <asm/bug.h>
 
 /* Unconditional execution of RDRAND and RDSEED */
 
-- 
  Kiryl Shutsemau / Kirill A. Shutemov

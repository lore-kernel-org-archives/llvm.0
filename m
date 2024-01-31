Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EAC367;
	Wed, 31 Jan 2024 00:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706660388; cv=none; b=oXI9DSHrv46d67n491W7FxbQAO2wmO7KYATJOKFOEv+aP5QScIcqySYckHQgmtA6RnrVJldPU3T6d1/vvRB8AE2+4XXTFLirSsNW1gagL+Z7SMl2j80yeGFHfRw6fsf40txU0tmq0FPP7pGhiRojb+4tYL+DNb+qx7VmnXPN/Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706660388; c=relaxed/simple;
	bh=pCSiFFktmNDuxYaiTeF/tFNNXNQXYVQVvjJ5PKZnNGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSCmpq3SH2AGnyFwJzzzq0r2OspiQ5T4wyj/YOxqt8RcW1MmR9CxNI7ZSGN3XGp+JBSl35IknWtwM2fb9Iu7jkLLBYPaAK/LQR0ZKVGiocCPcr3UpGIIf2A7nZkVvafNfYgO1tx96KFRtNHuZ4r2LVRQFPj3MhwUCBOGDYsZ8Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLb10bWr; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLb10bWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706660386; x=1738196386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pCSiFFktmNDuxYaiTeF/tFNNXNQXYVQVvjJ5PKZnNGA=;
  b=KLb10bWr6/ijhBJE1wCiNPLRXH1EoI06yzDlfu/uLKERVYLrTMLrwKXJ
   pLtXir5ARslzVxjv+GRC0f/u4DjQ7nLVcbqMsYP9oYC/7aJouJBHEcnzw
   J3BW+PkMUtWQjG5nFHaqT+pvX6j7LWH19S0RMxLr9V7o8e7YfuzgghU8Z
   T9JPpwklG8DuHPyDEgN43im73Kf3qia0/Di4qIDeE58HBzdA0wjSkhcu1
   3/SS0XfhTuXGdBtMw6H0xTaDEZXiIcBgLB24ywOKG6pEj/ZAzg+kuluFM
   UGGNJJTDnh7Qo9Y0hk7GtCFZs7UEL9PR229XaM79LLxsdqsejN3fhIzl2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2381070"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="2381070"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 16:19:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="878621129"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="878621129"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Jan 2024 16:19:42 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUyKK-0000yO-0r;
	Wed, 31 Jan 2024 00:19:40 +0000
Date: Wed, 31 Jan 2024 08:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/3] riscv: optimized memcpy
Message-ID: <202401310851.6mjEraHQ-lkp@intel.com>
References: <20240128111013.2450-2-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240128111013.2450-2-jszhang@kernel.org>

Hi Jisheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.8-rc2 next-20240130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/riscv-optimized-memcpy/20240128-232523
base:   linus/master
patch link:    https://lore.kernel.org/r/20240128111013.2450-2-jszhang%40kernel.org
patch subject: [PATCH 1/3] riscv: optimized memcpy
config: riscv-randconfig-001-20240131 (https://download.01.org/0day-ci/archive/20240131/202401310851.6mjEraHQ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fdac7d0b6f74f919d319b31a0680c77f66732586)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310851.6mjEraHQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310851.6mjEraHQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/lib/string.c:118:57: warning: attribute declaration must precede definition [-Wignored-attributes]
     118 | void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);
         |                                                         ^
   include/linux/compiler_attributes.h:391:56: note: expanded from macro '__weak'
     391 | #define __weak                          __attribute__((__weak__))
         |                                                        ^
   arch/riscv/lib/string.c:55:7: note: previous definition is here
      55 | void *__memcpy(void *dest, const void *src, size_t count)
         |       ^
   arch/riscv/lib/string.c:118:7: error: redefinition of '__memcpy'
     118 | void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);
         |       ^
   arch/riscv/include/asm/string.h:35:31: note: expanded from macro 'memcpy'
      35 | #define memcpy(dst, src, len) __memcpy(dst, src, len)
         |                               ^
   arch/riscv/lib/string.c:55:7: note: previous definition is here
      55 | void *__memcpy(void *dest, const void *src, size_t count)
         |       ^
   1 warning and 1 error generated.


vim +118 arch/riscv/lib/string.c

   117	
 > 118	void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

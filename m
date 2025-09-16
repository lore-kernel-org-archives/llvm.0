Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC422773F4;
	Tue, 16 Sep 2025 19:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758052672; cv=none; b=hVmaJ+IQOVGRdYrV4Ep0qC6O7fXkvfXS3xyyV/3rbrcOvv1ZjEqEUhXbmaN+GTSxzsL1+4tBAlQxDevNQ1WGSqZY9k68ygJyum2SU1DeiSGSn680evKS+9Ezv/YZ7VJAGWlraVFmfHnHPesvrwdANRCY2mN326U0kkukNw9txLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758052672; c=relaxed/simple;
	bh=V1Z1PLCRtD6I4oNcKRH8YTS6Yv66dTHYRIfgdtzwL88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPXeA4xjW+/Ha3V63F6NEPhwQ+yyylP8NAPLKxZ7giXFcdYOUZiYHRtaj9ZXEfY7zIaEwjw+k/htC/zEwd4nQEJ9WOU7iLXij3h4jTvyt3x3w2KhQ1e2b2JbJI89sEnwLedKwwnBJJE3p0zsYpDl4b8RegRbSeOyoDW+w57F7Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X78ge4eZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X78ge4eZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758052671; x=1789588671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V1Z1PLCRtD6I4oNcKRH8YTS6Yv66dTHYRIfgdtzwL88=;
  b=X78ge4eZRe593LR+w2KiGqSzsY9fnQhmUO1jqY4JiR67Ziz7WGJA7g9C
   NeTHAR3Fj9yWCmRWegPPtPzTd/BJt8Z3azw2kfg9ZpCQ9FW9Qz8SNaCc3
   1wXyv0JEovPZ56c5TFglxIX4ctHywndiQRtO1g2nL5Bghy/LoVl9ETbmc
   szY3KQCRdl7R85jHRY8vDlnhvNcE0Sg9kUEoclr9Yfc7xFhMia0lz8+BY
   ceL/Qtu+kw97EWaEbLTPBffZYissnv9+AHbAg5QcwlfzWjoY4RApF5Uz7
   NoliWGe4iUXXxvM8swtj4dECuzdlGZSPNC09kU2eAUY5ySmsxYRd5i164
   A==;
X-CSE-ConnectionGUID: r9WgaJRqSIW19WuUo5oEWA==
X-CSE-MsgGUID: 1vuUFvutTlqp+3WqWpUf/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71028912"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="71028912"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 12:57:49 -0700
X-CSE-ConnectionGUID: MjBeqBL6QS6kxxX+iHlFdg==
X-CSE-MsgGUID: c9ds/YMzT3CeA/aLWjzcgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="205822477"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Sep 2025 12:57:48 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uybo9-0000h9-1U;
	Tue, 16 Sep 2025 19:57:45 +0000
Date: Wed, 17 Sep 2025 03:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: Frank van der Linden <fvdl@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 04/12] mm/cma: keep a global sorted list of CMA ranges
Message-ID: <202509170355.O6CTWu7T-lkp@intel.com>
References: <20250915195153.462039-5-fvdl@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915195153.462039-5-fvdl@google.com>

Hi Frank,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes powerpc/topic/ppc-kvm s390/features linus/master v6.17-rc6 next-20250916]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-van-der-Linden/mm-cma-add-tunable-for-CMA-fallback-limit/20250916-035514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250915195153.462039-5-fvdl%40google.com
patch subject: [RFC PATCH 04/12] mm/cma: keep a global sorted list of CMA ranges
config: i386-buildonly-randconfig-006-20250917 (https://download.01.org/0day-ci/archive/20250917/202509170355.O6CTWu7T-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170355.O6CTWu7T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170355.O6CTWu7T-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/cma_debug.c:58:40: error: too many arguments to function call, expected single argument 'cmr', have 2 arguments
      58 |                 bitmap_maxno = cma_bitmap_maxno(cma, cmr);
         |                                ~~~~~~~~~~~~~~~~      ^~~
   mm/cma.h:71:29: note: 'cma_bitmap_maxno' declared here
      71 | static inline unsigned long cma_bitmap_maxno(struct cma_memrange *cmr)
         |                             ^                ~~~~~~~~~~~~~~~~~~~~~~~~
   mm/cma_debug.c:187:39: error: too many arguments to function call, expected single argument 'cmr', have 2 arguments
     187 |                         DIV_ROUND_UP(cma_bitmap_maxno(cma, cmr),
         |                                      ~~~~~~~~~~~~~~~~      ^~~
   include/linux/math.h:49:22: note: expanded from macro 'DIV_ROUND_UP'
      49 | #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
         |                      ^
   include/uapi/linux/const.h:51:40: note: expanded from macro '__KERNEL_DIV_ROUND_UP'
      51 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                        ^
   mm/cma.h:71:29: note: 'cma_bitmap_maxno' declared here
      71 | static inline unsigned long cma_bitmap_maxno(struct cma_memrange *cmr)
         |                             ^                ~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/cmr +58 mm/cma_debug.c

2e32b947606daa Dmitry Safonov       2015-04-15  45  
2e32b947606daa Dmitry Safonov       2015-04-15  46  static int cma_maxchunk_get(void *data, u64 *val)
2e32b947606daa Dmitry Safonov       2015-04-15  47  {
2e32b947606daa Dmitry Safonov       2015-04-15  48  	struct cma *cma = data;
c009da4258f988 Frank van der Linden 2025-02-28  49  	struct cma_memrange *cmr;
2e32b947606daa Dmitry Safonov       2015-04-15  50  	unsigned long maxchunk = 0;
c009da4258f988 Frank van der Linden 2025-02-28  51  	unsigned long start, end;
c009da4258f988 Frank van der Linden 2025-02-28  52  	unsigned long bitmap_maxno;
c009da4258f988 Frank van der Linden 2025-02-28  53  	int r;
2e32b947606daa Dmitry Safonov       2015-04-15  54  
0ef7dcac998fef Mike Kravetz         2021-05-04  55  	spin_lock_irq(&cma->lock);
c009da4258f988 Frank van der Linden 2025-02-28  56  	for (r = 0; r < cma->nranges; r++) {
c009da4258f988 Frank van der Linden 2025-02-28  57  		cmr = &cma->ranges[r];
c009da4258f988 Frank van der Linden 2025-02-28 @58  		bitmap_maxno = cma_bitmap_maxno(cma, cmr);
c79147e4b02fa3 Yury Norov (NVIDIA   2025-07-19  59) 		for_each_clear_bitrange(start, end, cmr->bitmap, bitmap_maxno)
2e32b947606daa Dmitry Safonov       2015-04-15  60  			maxchunk = max(end - start, maxchunk);
2e32b947606daa Dmitry Safonov       2015-04-15  61  	}
0ef7dcac998fef Mike Kravetz         2021-05-04  62  	spin_unlock_irq(&cma->lock);
2e32b947606daa Dmitry Safonov       2015-04-15  63  	*val = (u64)maxchunk << cma->order_per_bit;
2e32b947606daa Dmitry Safonov       2015-04-15  64  
2e32b947606daa Dmitry Safonov       2015-04-15  65  	return 0;
2e32b947606daa Dmitry Safonov       2015-04-15  66  }
a9ea242a063c62 zhong jiang          2019-11-30  67  DEFINE_DEBUGFS_ATTRIBUTE(cma_maxchunk_fops, cma_maxchunk_get, NULL, "%llu\n");
2e32b947606daa Dmitry Safonov       2015-04-15  68  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

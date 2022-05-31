Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CC53D63
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 19:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654026865; x=1685562865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OJhpRbxBOMs4glA066gvOFcYtJZ2Eh/VWIaGZ2EgiQk=;
  b=VrrLEzYJlaUWgXtC/gP/AtkAAgqBmCWEllAQu2kXj98nWWpRgLbGLYXH
   VhT4Ne5sklRR41HZ6ocREQ61RrCtPyxPw73VZjaNbTO7Hsrv/4T43CdO7
   m1QMXiU7RZl1xJj2yyQP8h7f4muezYWqFzU6JM2+bXCEQGdDvX6BUAApG
   Pfmsme9NUCtzpuS4PmLB66cAwvMZw8MGunbKB4K5isad4AvdSDTD78EoA
   84/enoiCUNkiAcSCCcsSNAZKw4wkraChmidU5YyANP+gGKZdnMj5MmoSh
   hk668q2KorxbBvQOVuhYoO3G2FwfwnQRM38s5cDNnL2+jsaOQ8T0HLIcn
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="338412509"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="338412509"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 12:54:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="667072348"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 May 2022 12:54:23 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nw7wc-00031I-QL;
	Tue, 31 May 2022 19:54:22 +0000
Date: Wed, 1 Jun 2022 03:53:29 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Lin <chen45464546@163.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, 0day robot <lkp@intel.com>
Subject: mm/page_alloc.c:5662:16: error: use of undeclared identifier
 'fragz'; did you mean 'fragsz'?
Message-ID: <202206010311.t1nGkYl6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20220531-224555/Chen-Lin/mm-page_frag-Warn_on-when-frag_alloc-size-is-bigger-than-PAGE_SIZE/20220528-234129
head:   21e940b5a66de64088e93248c21bce241c28a556
commit: 21e940b5a66de64088e93248c21bce241c28a556 mm: page_frag: Warn_on when frag_alloc size is bigger than PAGE_SIZE
date:   5 hours ago
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220601/202206010311.t1nGkYl6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/21e940b5a66de64088e93248c21bce241c28a556
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review UPDATE-20220531-224555/Chen-Lin/mm-page_frag-Warn_on-when-frag_alloc-size-is-bigger-than-PAGE_SIZE/20220528-234129
        git checkout 21e940b5a66de64088e93248c21bce241c28a556
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/page_alloc.c:5662:16: error: use of undeclared identifier 'fragz'; did you mean 'fragsz'?
           if (WARN_ONCE(fragz > PAGE_SIZE,
                         ^~~~~
                         fragsz
   include/asm-generic/bug.h:151:18: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
                           ^
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE_IF'
                   bool __ret_do_once = !!(condition);                     \
                                           ^
   mm/page_alloc.c:5651:22: note: 'fragsz' declared here
                         unsigned int fragsz, gfp_t gfp_mask,
                                      ^
   1 error generated.


vim +5662 mm/page_alloc.c

  5649	
  5650	void *page_frag_alloc_align(struct page_frag_cache *nc,
  5651			      unsigned int fragsz, gfp_t gfp_mask,
  5652			      unsigned int align_mask)
  5653	{
  5654		unsigned int size = PAGE_SIZE;
  5655		struct page *page;
  5656		int offset;
  5657	
  5658		/*
  5659		 * frag_alloc is not suitable for memory alloc which fragsz
  5660		 * is bigger than PAGE_SIZE, use kmalloc or alloc_pages instead.
  5661		 */
> 5662		if (WARN_ONCE(fragz > PAGE_SIZE,
  5663			      "alloc fragsz(%d) > PAGE_SIZE(%ld) not supported, alloc fail\n",
  5664			      fragsz, PAGE_SIZE))
  5665			return NULL;
  5666	
  5667		if (unlikely(!nc->va)) {
  5668	refill:
  5669			page = __page_frag_cache_refill(nc, gfp_mask);
  5670			if (!page)
  5671				return NULL;
  5672	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

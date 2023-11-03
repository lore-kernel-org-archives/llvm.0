Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E392010FB;
	Fri,  3 Nov 2023 01:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sy7pKn90"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698974834; x=1730510834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rAVRVGoSW1gaNLa3HGP7wGv0TFn7bvX3kinNnymKM0c=;
  b=Sy7pKn90KzCcTumD30kaNf5ErEbh3uvZm70GTPvitiqt+9V+gPET7dCI
   BBbYMtnY7/rcA4aFr8WyuwaDYFpX8Le1QwQ99gRbotkLw8qWtfsuENq/u
   h8TigbudSxj7btoKP9vSLb92drLcOPdJK6Ykf2PC1dZpivJwIw9gByoQN
   vkFh1zfp86Q52CprulzHCe2nl2L9/qC4BATUzoJfU5S1kVyTCC3mZFeJE
   +iiZri9VpW4UKCNuuFuWt3yF0OA2PbBpeWVEphsHyg8JWtypeGE6cCB2R
   hC2HpcULlQ0WsUbtR9EOMRP/xvU3EzXKsPPHGUK84/W1b7terIplmrPKb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="391726692"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="391726692"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 18:27:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="905180659"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="905180659"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2023 18:27:01 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyixf-00025j-1S;
	Fri, 03 Nov 2023 01:26:59 +0000
Date: Fri, 3 Nov 2023 09:26:46 +0800
From: kernel test robot <lkp@intel.com>
To: Edward Adam Davis <eadavis@qq.com>, riel@surriel.com
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	eadavis@qq.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, mike.kravetz@oracle.com,
	muchun.song@linux.dev, nathan@kernel.org, ndesaulniers@google.com,
	syzbot+6ada951e7c0f7bc8a71e@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Subject: Re: [PATCH] mm/hugetlb: fix null ptr defer in hugetlb_vma_lock_write
Message-ID: <202311030935.4AHgxdxU-lkp@intel.com>
References: <tencent_164A247533766D667C3D873798968236C409@qq.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_164A247533766D667C3D873798968236C409@qq.com>

Hi Edward,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Edward-Adam-Davis/mm-hugetlb-fix-null-ptr-defer-in-hugetlb_vma_lock_write/20231103-003152
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/tencent_164A247533766D667C3D873798968236C409%40qq.com
patch subject: [PATCH] mm/hugetlb: fix null ptr defer in hugetlb_vma_lock_write
config: loongarch-randconfig-002-20231103 (https://download.01.org/0day-ci/archive/20231103/202311030935.4AHgxdxU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030935.4AHgxdxU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030935.4AHgxdxU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/migrate.h:8,
                    from include/linux/balloon_compaction.h:41,
                    from drivers/virtio/virtio_balloon.c:16:
>> include/linux/hugetlb.h:182:12: warning: 'is_vma_resv_set' used but never defined
     182 | static int is_vma_resv_set(struct vm_area_struct *vma, unsigned long flag);
         |            ^~~~~~~~~~~~~~~


vim +/is_vma_resv_set +182 include/linux/hugetlb.h

   179	
   180	extern int sysctl_hugetlb_shm_group;
   181	extern struct list_head huge_boot_pages;
 > 182	static int is_vma_resv_set(struct vm_area_struct *vma, unsigned long flag);
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

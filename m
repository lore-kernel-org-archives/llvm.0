Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A37C62D;
	Mon, 25 Dec 2023 01:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbUf86QC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703466894; x=1735002894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lDNW0rLRN2xXxjiYiBG3VTaBZqLLrMYkClGya7nmbwE=;
  b=AbUf86QCGmM6RZ/D7OBdSGJg7HupTd5XdPljLgJcjZQ8kQoIZ0sIOo43
   Op2AKqnkUTN6bV8D83HAtHB1xZnvEmWxUU9MjoaLSf80Ox62PoharSm3D
   xhS+U7H7Pcco1zcxK5uoKDpYDXvT+CbfS1Z/zr5IxDYFYas1Z0HLdGIKW
   l8S/8Vu+ylazaO8qjz11bYvvjGJSwy4lRjzUl+tmac6+duD5pp3490HBD
   6oDDCE1zNfB1btaQPYDoLWqw8dt0oK8hHEexXJHsf5Pmg/goY5MYrbnZK
   1gdlcr2GOrZQXl5gVHWupjoF/eO5hllKye9Q/ORf/VmAlxbke+F7SLXma
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="3092494"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="3092494"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 17:14:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="848097816"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="848097816"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 24 Dec 2023 17:14:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHZXf-000Cnp-1R;
	Mon, 25 Dec 2023 01:14:42 +0000
Date: Mon, 25 Dec 2023 09:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:dev-test 6/16] fs/f2fs/checkpoint.c:173:6: warning: no
 previous prototype for function '__f2fs_is_valid_blkaddr'
Message-ID: <202312250938.sErzCfou-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
head:   2a6668b0457fcbe4a1e8ebf9dac039dff7ff6c0d
commit: 2e82ba5e00b8108be52fd5f213558e362a77f56d [6/16] f2fs: introduce FAULT_INCONSISTENCE
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20231225/202312250938.sErzCfou-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231225/202312250938.sErzCfou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312250938.sErzCfou-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/checkpoint.c:173:6: warning: no previous prototype for function '__f2fs_is_valid_blkaddr' [-Wmissing-prototypes]
   bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
        ^
   fs/f2fs/checkpoint.c:173:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
   ^
   static 
   1 warning generated.


vim +/__f2fs_is_valid_blkaddr +173 fs/f2fs/checkpoint.c

   172	
 > 173	bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
   174						block_t blkaddr, int type)
   175	{
   176		switch (type) {
   177		case META_NAT:
   178			break;
   179		case META_SIT:
   180			if (unlikely(blkaddr >= SIT_BLK_CNT(sbi)))
   181				return false;
   182			break;
   183		case META_SSA:
   184			if (unlikely(blkaddr >= MAIN_BLKADDR(sbi) ||
   185				blkaddr < SM_I(sbi)->ssa_blkaddr))
   186				return false;
   187			break;
   188		case META_CP:
   189			if (unlikely(blkaddr >= SIT_I(sbi)->sit_base_addr ||
   190				blkaddr < __start_cp_addr(sbi)))
   191				return false;
   192			break;
   193		case META_POR:
   194			if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
   195				blkaddr < MAIN_BLKADDR(sbi)))
   196				return false;
   197			break;
   198		case DATA_GENERIC:
   199		case DATA_GENERIC_ENHANCE:
   200		case DATA_GENERIC_ENHANCE_READ:
   201		case DATA_GENERIC_ENHANCE_UPDATE:
   202			if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
   203					blkaddr < MAIN_BLKADDR(sbi))) {
   204	
   205				/* Skip to emit an error message. */
   206				if (unlikely(f2fs_cp_error(sbi)))
   207					return false;
   208	
   209				f2fs_warn(sbi, "access invalid blkaddr:%u",
   210					  blkaddr);
   211				set_sbi_flag(sbi, SBI_NEED_FSCK);
   212				dump_stack();
   213				return false;
   214			} else {
   215				return __is_bitmap_valid(sbi, blkaddr, type);
   216			}
   217			break;
   218		case META_GENERIC:
   219			if (unlikely(blkaddr < SEG0_BLKADDR(sbi) ||
   220				blkaddr >= MAIN_BLKADDR(sbi)))
   221				return false;
   222			break;
   223		default:
   224			BUG();
   225		}
   226	
   227		return true;
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

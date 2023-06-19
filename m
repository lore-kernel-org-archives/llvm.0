Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA571BA2C;
	Mon, 19 Jun 2023 08:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687164201; x=1718700201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V3WB2n/kedw2l5Jen6Ta1lvwWdygT4WlDZU4n53anXQ=;
  b=Yxl18nJJeHGpl6wStpZNuzsDFuslo67GZGLAhCpavMSBZWEXdizZrsdV
   pUAz7zWRDXPOW/sPwXPqBFCGoY5mgAb8SRc4cTVhI7jHoK1Wjz5DdwS93
   IoGthpYT9EaSugYFf2ksHAOKiEedhVUKXnByO29fBOHsf1xTZO9Y5FPy6
   3ceItL4c3DpjgR9M/NKmNsHxVVc2Z2CkcLgz9Q3OmI6l+hCooEstBzWHi
   ZeopznH2A1KquaQzjKMQzXsSQHm8uslwg+ymaXw9/gfumGTm9243IPFkh
   CuhSZ0ZSdvElXkRedZqUrsmLMVDWmUn4Vgytx+KW7ut3qwzgOBkf7aJxC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="339915811"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="339915811"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 01:43:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="858150606"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="858150606"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2023 01:43:18 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBATl-0004Ya-2x;
	Mon, 19 Jun 2023 08:43:17 +0000
Date: Mon, 19 Jun 2023 16:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup@brainfault.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10734/10788] arch/riscv/kvm/aia_imsic.c:237:9:
 error: call to undeclared function 'arch_atomic_long_fetch_or'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202306191640.NE97q8G3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47045630bc409ce6606d97b790895210dd1d517d
commit: 45d0f6cbccb6e26047d42baa32de1df7bbc25f97 [10734/10788] Merge branch 'riscv_kvm_next' of https://github.com/kvm-riscv/linux.git
config: riscv-randconfig-r042-20230619 (https://download.01.org/0day-ci/archive/20230619/202306191640.NE97q8G3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306191640.NE97q8G3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306191640.NE97q8G3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/aia_imsic.c:237:9: error: call to undeclared function 'arch_atomic_long_fetch_or'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     237 |         return arch_atomic_long_fetch_or(val, (atomic_long_t *)ptr);
         |                ^
   arch/riscv/kvm/aia_imsic.c:237:9: note: did you mean 'raw_atomic_long_fetch_or'?
   include/linux/atomic/atomic-long.h:1087:1: note: 'raw_atomic_long_fetch_or' declared here
    1087 | raw_atomic_long_fetch_or(long i, atomic_long_t *v)
         | ^
   1 error generated.


vim +/arch_atomic_long_fetch_or +237 arch/riscv/kvm/aia_imsic.c

2f68d542041204 Anup Patel 2023-06-15  232  
2f68d542041204 Anup Patel 2023-06-15  233  static unsigned long imsic_mrif_atomic_or(struct imsic_mrif *mrif,
2f68d542041204 Anup Patel 2023-06-15  234  					  unsigned long *ptr,
2f68d542041204 Anup Patel 2023-06-15  235  					  unsigned long val)
2f68d542041204 Anup Patel 2023-06-15  236  {
2f68d542041204 Anup Patel 2023-06-15 @237  	return arch_atomic_long_fetch_or(val, (atomic_long_t *)ptr);
2f68d542041204 Anup Patel 2023-06-15  238  }
2f68d542041204 Anup Patel 2023-06-15  239  

:::::: The code at line 237 was first introduced by commit
:::::: 2f68d5420412040ec974557198d6a886708479c0 RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

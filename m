Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3419D79EA;
	Wed,  5 Jul 2023 14:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688566382; x=1720102382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fj2Yh7ChLOQ0z+WhiFwksjSPXLA8Q1m8zoreRNE5y5M=;
  b=CjiC0XCYVSRERG7NvUwQpCc0GN2Ii/2s1LzMmYG2fTFXRtzQn0/kW2UM
   NgOVikt+mPBQsxdn6tBteFG7OE5laKjS4j0oZj1NmHpJjs2gdlhg5C80/
   5gkWQnT2icR+0b5JRa457eBdT+XChOpFZkSU5t9NQHX1GIDAjzPbQl+Wf
   xGYO4LxskKNJuNEbOYAKfKOPdCxDIL75aYCs+EJudVvqdSMHdaLyDfKOR
   WFlZiXutfGeBSI9Bx+gqAFG3ykZz3zmgT6pkRAfca3UCljJ9VYqEwuUbm
   NF3YZE1VnVfiIbVHmGDFJFizwbXY1BVT2ubEwxNJcfr7IoqhgtBqp5T7H
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="427033363"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="427033363"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 07:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="713214651"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="713214651"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Jul 2023 07:12:59 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qH3Fa-0000f8-1s;
	Wed, 05 Jul 2023 14:12:58 +0000
Date: Wed, 5 Jul 2023 22:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/020-dart 15/20]
 drivers/iommu/io-pgtable-dart.c:531:14: warning: variable 'ptep' set but not
 used
Message-ID: <202307052255.gNZaUpY1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/020-dart
head:   065150da3fe99a14a1f2acb00d2a326767179f22
commit: dcf43a427ffcbc79686412189e790ae5f406b748 [15/20] iommu: io-pgtable: Add 4-level page table support
config: arm64-randconfig-r024-20230705 (https://download.01.org/0day-ci/archive/20230705/202307052255.gNZaUpY1-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307052255.gNZaUpY1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307052255.gNZaUpY1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/io-pgtable-dart.c:531:14: warning: variable 'ptep' set but not used [-Wunused-but-set-variable]
     531 |         dart_iopte *ptep;
         |                     ^
   1 warning generated.


vim +/ptep +531 drivers/iommu/io-pgtable-dart.c

   526	
   527	static void apple_dart_free_pgtable(struct io_pgtable *iop)
   528	{
   529		struct io_pgtable_cfg *cfg = &iop->cfg;
   530		struct dart_io_pgtable *data = io_pgtable_to_data(iop);
 > 531		dart_iopte *ptep;
   532		int i;
   533	
   534	        if (cfg->quirks & IO_PGTABLE_QUIRK_APPLE_LOCKED) {
   535			kfree(data);
   536			return;
   537		}
   538	
   539		for (i = 0; i < (1 << data->tbl_bits) && data->pgd[i]; ++i) {
   540			ptep = data->pgd[i];
   541			apple_dart_free_pgtables(data, data->pgd[i], data->levels - 1);
   542		}
   543	
   544		kfree(data);
   545	}
   546	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAE923C0;
	Mon, 11 Sep 2023 05:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694411858; x=1725947858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SQxEif+V9tOruTWUuJxjnaqQkDrZNklixMsFBQblnWU=;
  b=HqqYD8Ea2v24VAOA4W4ir+Krvc59wIytxeDwXVA/yCKR+JrgIRigeseH
   W8fjROWWBQ8eajOF76QDqtSVx+ZZB7Ovm5xh74fTnw8VnCdfHaWZvNLx8
   QKUepDyN9BPPWvjq2fzCDoSBEonJfoFzQvku63LIFnLvGFyee9HhAqFnk
   8rHzGdmAyyr5lO7/ix3ZuwqL9IZ0JCzUU/xeERtseV/biAtACCRc1NhtQ
   /UmN9er7BEcUAOnFQx3iM3irVvYlihcU98hqTqGxADFoKXQwS/sHzVVp9
   ioaKvCLIv2Yhh5HsXn0xp9qvaX5hRfV0tNvkTOXmRDg3r6TN+EfoNNwMB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="375355581"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="375355581"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 22:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="858190353"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="858190353"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Sep 2023 22:57:35 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfZvR-0005rI-30;
	Mon, 11 Sep 2023 05:57:33 +0000
Date: Mon, 11 Sep 2023 13:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: ld.lld: error: relocation R_RISCV_LO12_I cannot be used against
 symbol 'riscv_cbom_block_size'; recompile with -fPIC
Message-ID: <202309111311.8tcq3KVc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
commit: e021ae7f5145d46ab64cb058cbffda31059f37e5 riscv: errata: Add Andes alternative ports
date:   10 days ago
config: riscv-randconfig-r022-20230911 (https://download.01.org/0day-ci/archive/20230911/202309111311.8tcq3KVc-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111311.8tcq3KVc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111311.8tcq3KVc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol 'riscv_cbom_block_size'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/mm/cacheflush.o)
   >>> referenced by errata.c
   >>>               arch/riscv/errata/andes/errata.o:(andes_errata_patch_func) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

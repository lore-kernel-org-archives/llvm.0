Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6B0C2DE;
	Wed, 21 Jun 2023 09:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687338785; x=1718874785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=79kA+sOgMQsTImS0HgJYpy/ecHv21tR8XYFCb5wjiQo=;
  b=jqrFRuIjWpCyZIqOL0TDbTS2kvkj5Exqg8G+JMoFjmyW0EbvXBpiAnpP
   rpEFTiyvDvhR7tTzGRu1v2Z5FMOOLftQ9ti06QrUVDOipofL4gF/pHwko
   qqiGnfaw63eUGGEdsyjVnmgMgYp/vR7HAAgZOOI7BX1zqX10Y0CuXPS7I
   yMTfsvluid50hdZ4q3hz2RUqSSUXd9FQg3u8RNCRyHXzoubgzUBecf09O
   2278oG4CN/WqGoD3K+r7qcTH0S/ecTJTA/m/xG9h88TNMUyFM9/mvxyeA
   EtxXsTqWBDPPvmQmSfnMtjA5xveDGg5EqqdxQupZ2h6bGUecLWILWaopU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="423781231"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="423781231"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 02:13:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="804290115"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="804290115"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jun 2023 02:13:02 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBttd-0006hF-2j;
	Wed, 21 Jun 2023 09:13:01 +0000
Date: Wed, 21 Jun 2023 17:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v2.2 10/12] arch/riscv/mm/init.c:1377:4: error: field
 designator 'text' does not refer to any field in type 'struct execmem_range'
Message-ID: <202306211704.0qHZKXAQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git jitalloc/v2.2
head:   4d3b7e33eca22e1fe243f586c13c875d248d29f6
commit: 5f24f0d18c8afbea8c6adc7274c588f256197685 [10/12] arch: make execmem setup available regardless of CONFIG_MODULES
config: riscv-randconfig-r034-20230620 (https://download.01.org/0day-ci/archive/20230621/202306211704.0qHZKXAQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211704.0qHZKXAQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211704.0qHZKXAQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/mm/init.c:1377:4: error: field designator 'text' does not refer to any field in type 'struct execmem_range'
    1377 |                 .text = {
         |                 ~^~~~~~~~
    1378 |                         .pgprot = PAGE_KERNEL_READ_EXEC,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1379 |                         .alignment = 1,
         |                         ~~~~~~~~~~~~~~~
    1380 |                 },
         |                 ~
>> arch/riscv/mm/init.c:1394:21: error: no member named 'text' in 'struct execmem_range'
    1394 |         execmem_params.jit.text.start = VMALLOC_START;
         |         ~~~~~~~~~~~~~~~~~~ ^
   arch/riscv/mm/init.c:1395:21: error: no member named 'text' in 'struct execmem_range'
    1395 |         execmem_params.jit.text.end = VMALLOC_END;
         |         ~~~~~~~~~~~~~~~~~~ ^
   3 errors generated.


vim +1377 arch/riscv/mm/init.c

  1367	
  1368	#if defined(CONFIG_MMU) && defined(CONFIG_EXECMEM)
  1369	static struct execmem_params execmem_params __ro_after_init = {
  1370		.modules = {
  1371			.text = {
  1372				.pgprot = PAGE_KERNEL,
  1373				.alignment = 1,
  1374			},
  1375		},
  1376		.jit = {
> 1377			.text = {
  1378				.pgprot = PAGE_KERNEL_READ_EXEC,
  1379				.alignment = 1,
  1380			},
  1381		},
  1382	};
  1383	
  1384	struct execmem_params __init *execmem_arch_params(void)
  1385	{
  1386	#ifdef CONFIG_64BIT
  1387		execmem_params.modules.text.start = MODULES_VADDR;
  1388		execmem_params.modules.text.end = MODULES_END;
  1389	#else
  1390		execmem_params.modules.text.start = VMALLOC_START;
  1391		execmem_params.modules.text.end = VMALLOC_END;
  1392	#endif
  1393	
> 1394		execmem_params.jit.text.start = VMALLOC_START;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

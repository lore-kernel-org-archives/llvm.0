Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5A018E;
	Fri, 28 Jul 2023 00:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690503673; x=1722039673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FAuv0pDn2H0zv1wZBMJd21ovigXv1s8NcGwjaAVYISE=;
  b=EHRwAy/eDB+LoMZLiOETPZgaD7MZBw8Aqzp1hYGwSKKtkpstwW704W+Y
   lBOdIZN6MAVbxf57Dl6d7Pq152DUBtzlyfDCj5gTLa+ForMRGMZbFcNyO
   kg1A7KRuCeQkmd29WAmnQxjYjVYu+nKzVzK1vDUUQvp/mXC9o26Piuz6x
   2NgiPAaY7ZNvpj/7qJFAehkHhgqo83q28xOLoCHs6C0Y42x9t+ZYgXrDf
   /qDFr5a/bQApCx+04PqDGiIHHZE5QhMxfCtNbYqtVI4WxmR0Ypn1/NVZb
   Sf6mD3BNXhA2k2qUVNmW3CNeJgNuFHm19zYlrjWbvnJMrx0Fr6es9GYVP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="371168500"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="371168500"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 17:21:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="850971342"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="850971342"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 27 Jul 2023 17:21:11 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPBDl-0002il-2U;
	Fri, 28 Jul 2023 00:20:56 +0000
Date: Fri, 28 Jul 2023 08:20:20 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [esmil:visionfive 25/75] arch/riscv/errata/andes/errata.c:46:14:
 warning: result of comparison of constant 9223372036854811205 with
 expression of type 'unsigned long' is always true
Message-ID: <202307280827.AVHAaaoU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   4370487fce31acaedcc03e8bd2e64f3a9c591821
commit: fde37b6e790a93e8af8ec92d08f0ef9b48654876 [25/75] riscv: errata: Add Andes alternative ports
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230728/202307280827.AVHAaaoU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280827.AVHAaaoU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307280827.AVHAaaoU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/errata/andes/errata.c:46:14: warning: result of comparison of constant 9223372036854811205 with expression of type 'unsigned long' is always true [-Wtautological-constant-out-of-range-compare]
      46 |         if (arch_id != ANDESTECH_AX45MP_MARCHID || impid != ANDESTECH_AX45MP_MIMPID)
         |             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +46 arch/riscv/errata/andes/errata.c

    40	
    41	static bool errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigned long impid)
    42	{
    43		if (!IS_ENABLED(CONFIG_ERRATA_ANDES_CMO))
    44			return false;
    45	
  > 46		if (arch_id != ANDESTECH_AX45MP_MARCHID || impid != ANDESTECH_AX45MP_MIMPID)
    47			return false;
    48	
    49		if (!ax45mp_iocp_sw_workaround())
    50			return false;
    51	
    52		/* Set this just to make core cbo code happy */
    53		riscv_cbom_block_size = 1;
    54		riscv_noncoherent_supported();
    55	
    56		return true;
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

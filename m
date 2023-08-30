Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233E910EF;
	Wed, 30 Aug 2023 03:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693364597; x=1724900597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SRHCwjTaSqEU/usDy/NzFZLG3qbu+NJMpo56nlHHzTU=;
  b=Vf9usAvEkdofQwiFQhKMO3l1h4IB3AS0cVrFNurY0bLpDe41W0zUbeiC
   PCtKnrAZK5vtPGlEXcD0rLyFCFicH6oRArrItGB2s5gzWa1yLBm+oHrfV
   qYNwi2RtQxktMNYTOWqeaAegtleKXVXXMfkiCR/lDa2kQwk8Dnwy/3i7v
   3V90XaPGf3zRVtg5w0zEJAua2dLhzN609I6oKA9sU78XlfnqQdb71vTM7
   prL7ysfjz4MvR88XQFbkK+zR15N1AgoQfaHohcES7k277VcWHDFo6X3Eo
   j4/qScMXv+y4b6nHz4wG4i31GsTR2qVPqDBwq5udiY23SDJmx5VTrudkf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="355853181"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="355853181"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 20:03:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="773955939"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="773955939"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Aug 2023 20:03:16 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbBUB-0009L9-1C;
	Wed, 30 Aug 2023 03:03:15 +0000
Date: Wed, 30 Aug 2023 11:02:36 +0800
From: kernel test robot <lkp@intel.com>
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: drivers/mmc/host/atmel-mci.c:238: warning: Function parameter or
 member 'dma_filter' not described in 'mci_platform_data'
Message-ID: <202308301033.QNkvRXYc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d68b4b6f307d155475cce541f2aee938032ed22e
commit: d2c6d518c21d73d96616e08a19eccd4642f4bafa mmc: atmel-mci: move atmel MCI header file
date:   5 days ago
config: arm-multi_v5_defconfig (https://download.01.org/0day-ci/archive/20230830/202308301033.QNkvRXYc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301033.QNkvRXYc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301033.QNkvRXYc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/atmel-mci.c:238: warning: Function parameter or member 'dma_filter' not described in 'mci_platform_data'


vim +238 drivers/mmc/host/atmel-mci.c

   228	
   229	/**
   230	 * struct mci_platform_data - board-specific MMC/SDcard configuration
   231	 * @dma_slave: DMA slave interface to use in data transfers.
   232	 * @slot: Per-slot configuration data.
   233	 */
   234	struct mci_platform_data {
   235		void			*dma_slave;
   236		dma_filter_fn		dma_filter;
   237		struct mci_slot_pdata	slot[ATMCI_MAX_NR_SLOTS];
 > 238	};
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

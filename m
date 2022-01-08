Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396C82C9C
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 19:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641671830; x=1673207830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EvxMIDZwd9JMT4RvUztgG+8HU51+F6UhPMy7buEltN4=;
  b=heh2bylhWuZ1nYkZr7VsO3kzadH/ZxJ8NP3EcLEmEkuKqGzepuH+BLog
   H20ztJO5HbZKqIEKow5AbcNVxjN20AwFpB/RwTd9V8Ujae+1i4HZZPRbG
   LeHowSUncg6C6qWe8dE6aWJ7MmvHorL+Nbb6YTrJU8ctEVXT7S/ruGk+p
   GTwyWC9WWAUHEDBEMw0USitqfGk6+GeVorfIufHgqipFLfgwd/mX1Lawz
   iN7cbh5qA4pjMyw8itEoQSZMDvoNN3Fae8XL2nMbPdI7T8HalVEhSF4N3
   tsMp9ccnKfyBeXNP120CYTvqasm0sld9EgOxMiRkmkOlWD9v6pEvOOl+d
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10221"; a="242986869"
X-IronPort-AV: E=Sophos;i="5.88,273,1635231600"; 
   d="scan'208";a="242986869"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2022 11:57:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,273,1635231600"; 
   d="scan'208";a="557594494"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Jan 2022 11:57:08 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n6Hpr-0000zu-HG; Sat, 08 Jan 2022 19:57:07 +0000
Date: Sun, 9 Jan 2022 03:56:25 +0800
From: kernel test robot <lkp@intel.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hannes Reinecke <hare@suse.de>
Subject: [linux-next:master 10923/11475] ld.lld: error: undefined symbol:
 ata_timing_compute
Message-ID: <202201090318.1AtgpfBK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b8170452cd5121b11a5726e3ea8dbdfc2d74e771
commit: 7c44c1248c36342bf1ccc0fab4a4ed9c62286604 [10923/11475] ata: pata_legacy: add compile test support
config: hexagon-randconfig-r001-20220108 (https://download.01.org/0day-ci/archive/20220109/202201090318.1AtgpfBK-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7c44c1248c36342bf1ccc0fab4a4ed9c62286604
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7c44c1248c36342bf1ccc0fab4a4ed9c62286604
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ata_timing_compute
   >>> referenced by pata_legacy.c
   >>> ata/pata_legacy.o:(ht6560a_set_piomode) in archive drivers/built-in.a
   >>> referenced by pata_legacy.c
   >>> ata/pata_legacy.o:(ht6560a_set_piomode) in archive drivers/built-in.a
   >>> referenced by pata_legacy.c
   >>> ata/pata_legacy.o:(ht6560b_set_piomode) in archive drivers/built-in.a
   >>> referenced 13 more times
--
>> ld.lld: error: undefined symbol: ata_timing_merge
   >>> referenced by pata_legacy.c
   >>> ata/pata_legacy.o:(opti82c611a_set_piomode) in archive drivers/built-in.a
   >>> referenced by pata_legacy.c
   >>> ata/pata_legacy.o:(opti82c611a_set_piomode) in archive drivers/built-in.a
   >>> referenced by pata_legacy.c
   >>> ata/pata_legacy.o:(opti82c46x_set_piomode) in archive drivers/built-in.a
   >>> referenced 1 more times

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PATA_LEGACY
   Depends on ATA && ATA_SFF && (ISA || PCI
   Selected by
   - PATA_QDI && ATA && ATA_SFF && (ISA || COMPILE_TEST

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

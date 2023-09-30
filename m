Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26538F57;
	Sat, 30 Sep 2023 11:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696072604; x=1727608604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l7PjfMJoYJzE+D/bXejo4URZzrLVUgC+MVlPs8ITxPE=;
  b=T+4QVBaAx+AZimuoyW0o6Tq+RwcgapHBKW8gRECC8u/YQgDdtzgQ6im+
   xRQm/cNMUvlokbeNTRXO6jPepLSBdJwFnQc9fctapIiDQ2Nxr2iDnewL8
   eeNxlenjClC7YMMWjKOZJ6qd9GlwWfdfU+DZ1Oz88YUAJMTK6KP022jPp
   IxYQLxxPikhfP0tk+STIUGcIs567kDNY8Kf2f4zF2LYTNcJN6her4+EEI
   3VeEo+XnKtcchmkKVePkONXzxx7Ym+l3bjDR76fHS+ER07u3fZIyzQfL6
   m41ccEQmWi7xVJh8o+RRASSVTqUX+Vq8cN01+TZNR+Wrhrx1hvBxwGyvn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="446598220"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="446598220"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 04:16:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="815834169"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="815834169"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Sep 2023 04:16:42 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmXxg-00044T-1r;
	Sat, 30 Sep 2023 11:16:40 +0000
Date: Sat, 30 Sep 2023 19:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"jingyang.wang" <wjy7717@126.com>
Subject: [nbd168-wireless:pr/4 1/1] include/linux/pci_ids.h:3134:9: error:
 'PCI_VENDOR_ID_ITTIM' macro redefined
Message-ID: <202309301923.5VWZCfxQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless pr/4
head:   ca4db2945103cfd433731260f3d6fbf582913e68
commit: ca4db2945103cfd433731260f3d6fbf582913e68 [1/1] Merge branch 'mt76' into mt76
config: powerpc-mpc8315_rdb_defconfig (https://download.01.org/0day-ci/archive/20230930/202309301923.5VWZCfxQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309301923.5VWZCfxQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301923.5VWZCfxQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/prom_init.c:24:
   In file included from include/linux/pci.h:44:
>> include/linux/pci_ids.h:3134:9: error: 'PCI_VENDOR_ID_ITTIM' macro redefined [-Werror,-Wmacro-redefined]
    3134 | #define PCI_VENDOR_ID_ITTIM             0x0B48
         |         ^
   include/linux/pci_ids.h:183:9: note: previous definition is here
     183 | #define PCI_VENDOR_ID_ITTIM             0x0b48
         |         ^
   1 error generated.


vim +/PCI_VENDOR_ID_ITTIM +3134 include/linux/pci_ids.h

9fd0e09a4e8649 Anthony Wong  2018-08-31  3133  
db0b72509eef7f Jingyang Wang 2023-09-06 @3134  #define PCI_VENDOR_ID_ITTIM		0x0B48
db0b72509eef7f Jingyang Wang 2023-09-06  3135  

:::::: The code at line 3134 was first introduced by commit
:::::: db0b72509eef7fdb59313890e42c225279247770 wifi: mt76: mt7922: Add support ITTIM PE50-M75C

:::::: TO: Jingyang Wang <wjy7717@126.com>
:::::: CC: Jingyang Wang <wjy7717@126.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34E7C139;
	Wed, 23 Aug 2023 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692811336; x=1724347336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FKvBtthuXYaj3IWi4n2Sn/NWtRzF1WQtm2BQ9YKF2rw=;
  b=YiqBAtHvq04YgZlNr3FA4/rh6sBjZvrmL8bNvKfs5BPszq/1HhltMvde
   884fKCtHk4hQP/gsPR8UsWqt5bRNPS8d+nPOLIF7Tojs7A/zNAGrUKV0L
   G/c6KgCfwvacTr5HJiV9LDw7MXkWIoWjOSRcH7klJtugA6jN8RB7tviLO
   yFhogzuhNwWjS2Plkm76UYdbJDrDc00gPzHkDjUUWW5FiTkjLaoQxS9e0
   l2iWFLYrwS+con+Jpf7J2+JZnDkC3/ol6y89m45qW5MP3IvA/rGFqbgji
   ct4fsjCIy3OWDLhgFG2ZKBn/v8fD2D1FhJioPreFSzaAitC+7YPDKbUxX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="377976888"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="377976888"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 10:22:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="730284637"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="730284637"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Aug 2023 10:22:11 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYrYY-0001NB-3A;
	Wed, 23 Aug 2023 17:22:10 +0000
Date: Thu, 24 Aug 2023 01:21:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Huang Rui <ray.huang@amd.com>
Subject: [rui:upstream-for-xen-v2 2/9] arch/x86/xen/enlighten_pvh.c:95:5:
 warning: no previous prototype for function 'xen_pvh_passthrough_gsi'
Message-ID: <202308240131.eGDMnxii-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rui/linux.git upstream-for-xen-v2
head:   de602e087e62187c807c072c3249651aa4c3441c
commit: b6f1a467514766f7cdb4baf372a878eece68cc71 [2/9] xen/pvh: Map pirq for passthrough device on PVH dom0
config: x86_64-randconfig-075-20230823 (https://download.01.org/0day-ci/archive/20230824/202308240131.eGDMnxii-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240131.eGDMnxii-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240131.eGDMnxii-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/xen/enlighten_pvh.c:95:5: warning: no previous prototype for function 'xen_pvh_passthrough_gsi' [-Wmissing-prototypes]
   int xen_pvh_passthrough_gsi(struct pci_dev *dev)
       ^
   arch/x86/xen/enlighten_pvh.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xen_pvh_passthrough_gsi(struct pci_dev *dev)
   ^
   static 
   1 warning generated.


vim +/xen_pvh_passthrough_gsi +95 arch/x86/xen/enlighten_pvh.c

    94	
  > 95	int xen_pvh_passthrough_gsi(struct pci_dev *dev)
    96	{
    97		int ret;
    98		gsi_info_t gsi_info;
    99	
   100		if (!dev) {
   101			return -EINVAL;
   102		}
   103	
   104		ret = xen_pvh_get_gsi_info(dev, &gsi_info);
   105		if (ret) {
   106			xen_raw_printk("Fail to get gsi info!\n");
   107			return ret;
   108		}
   109	
   110		ret = xen_pvh_map_pirq(&gsi_info);
   111		if (ret)
   112			xen_raw_printk("Fail to map pirq for gsi (%d)!\n", gsi_info.gsi);
   113	
   114		return ret;
   115	}
   116	EXPORT_SYMBOL_GPL(xen_pvh_passthrough_gsi);
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

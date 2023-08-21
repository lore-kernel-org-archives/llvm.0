Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F05C11720;
	Mon, 21 Aug 2023 20:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692649217; x=1724185217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1djs2ufS3xJ9yAR3HSSR1eAkEu57kZ0QU8WiLNxCtYU=;
  b=fZPBWbF354E1U5qbNqWhD/eed9OWv7AjO24X4AkYRW9VxjSnNs7sztqK
   veoBB07C0O69D6cG5MFPoCmtW2BWPdcjl3JFeVc7KZrC3x1HAPFCKyLiB
   1PFsp32iPqQdy1SCzklFG7iViT3MuTvJ4BNe/P9EpKanY4fCYDxOkPjNb
   4w8msWF26Gn22VK5yO07PewRtMWcDgOAIC/nu74qF0eqSRc33iXtnoBVO
   eBL8DoMocOtE4eoBwf2ZxXCmm7iNj6mqpojaNQ+ajQk+MHZhRbAMKFx9F
   tgE6c+XfwnitcApNsDLNla6zh/CoMuaX0TxtTjJIaHrzjxoQDVcQVZnqP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="372592238"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="372592238"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 13:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="771085018"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="771085018"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Aug 2023 13:19:47 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYBNL-0000tF-0L;
	Mon, 21 Aug 2023 20:19:47 +0000
Date: Tue, 22 Aug 2023 04:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Huang Rui <ray.huang@amd.com>
Subject: [rui:upstream-fox-pvh 1/8] include/xen/pci.h:12:5: warning: no
 previous prototype for function 'xen_reset_device'
Message-ID: <202308220446.iSeWu2tV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rui/linux.git upstream-fox-pvh
head:   d8772168691b2c723955f566a1211fba9afd19e5
commit: e6b6dcbe4274449d4468c8a1aa3e355d4e5dc5f5 [1/8] xen/pci: Add xen_reset_device function
config: x86_64-randconfig-072-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220446.iSeWu2tV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220446.iSeWu2tV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220446.iSeWu2tV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/xen/xen-pciback/xenbus.c:17:
>> include/xen/pci.h:12:5: warning: no previous prototype for function 'xen_reset_device' [-Wmissing-prototypes]
   int xen_reset_device(struct device *dev)
       ^
   include/xen/pci.h:12:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xen_reset_device(struct device *dev)
   ^
   static 
   1 warning generated.


vim +/xen_reset_device +12 include/xen/pci.h

     5	
     6	#if defined(CONFIG_XEN_DOM0)
     7	int xen_reset_device(struct device *dev);
     8	int xen_find_device_domain_owner(struct pci_dev *dev);
     9	int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
    10	int xen_unregister_device_domain_owner(struct pci_dev *dev);
    11	#else
  > 12	int xen_reset_device(struct device *dev)
    13	{
    14		return -1;
    15	}
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

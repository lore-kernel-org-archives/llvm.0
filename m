Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E555B5DF2B;
	Tue, 12 Dec 2023 13:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNXDxuNt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702386720; x=1733922720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gF19MbGDXGGNHcmV2NK0kziFxOoRLBJw/it5Ud1ou6k=;
  b=PNXDxuNtwfLd5BEueJPWQikwCsGjU1DZadesKIyNlKPxd6mBJ0DUTjGM
   nNFhs/obZFI7V7S1P4s3qUzYS9OPySrmUCyo+khL+pNwoaWGntAMA9uXt
   VZ2rAnPFDwRRODEmTf2RJQL+rSpfQhYI/aQehdYF2DciZAJ+VobNgdJ50
   I88dRj0jkO4Ro1VeMMwHWzU8n6AxZGCBL2cg9Szk7q6tsWaN71jwc/0hK
   GQZs56LregPZn4h0sS8x5xFugtEX30WP0AvFTFK5JP5VfHsoPZy6xx/c7
   3V/94fflryBXgTVyKi6qRRW0rpjk1AtSGNOSmFL3hNQS8ddkzgDcp6VbG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="391974836"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="391974836"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 05:12:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="807761644"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="807761644"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Dec 2023 05:11:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rD2YG-000JC3-10;
	Tue, 12 Dec 2023 13:11:56 +0000
Date: Tue, 12 Dec 2023 21:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC KERNEL PATCH v3 2/3] xen/pvh: Setup gsi and map pirq for
 passthrough device
Message-ID: <202312122002.7spZXyWU-lkp@intel.com>
References: <20231210161519.1550860-3-Jiqian.Chen@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231210161519.1550860-3-Jiqian.Chen@amd.com>

Hi Jiqian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on xen-tip/linux-next]
[also build test WARNING on pci/next pci/for-linus tip/x86/core rafael-pm/linux-next rafael-pm/acpi-bus rafael-pm/devprop linus/master v6.7-rc5 next-20231212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiqian-Chen/xen-pci-Add-xen_reset_device_state-function/20231211-001811
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/20231210161519.1550860-3-Jiqian.Chen%40amd.com
patch subject: [RFC KERNEL PATCH v3 2/3] xen/pvh: Setup gsi and map pirq for passthrough device
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231212/202312122002.7spZXyWU-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312122002.7spZXyWU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312122002.7spZXyWU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/xen/enlighten_pvh.c:113:5: warning: no previous prototype for function 'xen_pvh_passthrough_gsi' [-Wmissing-prototypes]
   int xen_pvh_passthrough_gsi(struct pci_dev *dev)
       ^
   arch/x86/xen/enlighten_pvh.c:113:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xen_pvh_passthrough_gsi(struct pci_dev *dev)
   ^
   static 
   1 warning generated.


vim +/xen_pvh_passthrough_gsi +113 arch/x86/xen/enlighten_pvh.c

   112	
 > 113	int xen_pvh_passthrough_gsi(struct pci_dev *dev)
   114	{
   115		int ret;
   116		gsi_info_t gsi_info;
   117	
   118		if (!dev)
   119			return -EINVAL;
   120	
   121		ret = xen_pvh_get_gsi_info(dev, &gsi_info);
   122		if (ret) {
   123			xen_raw_printk("Fail to get gsi info!\n");
   124			return ret;
   125		}
   126	
   127		ret = xen_pvh_setup_gsi(&gsi_info);
   128		if (ret == -EEXIST) {
   129			ret = 0;
   130			xen_raw_printk("Already setup the GSI :%u\n", gsi_info.gsi);
   131		} else if (ret) {
   132			xen_raw_printk("Fail to setup gsi (%d)!\n", gsi_info.gsi);
   133			return ret;
   134		}
   135	
   136		ret = xen_pvh_map_pirq(&gsi_info);
   137		if (ret)
   138			xen_raw_printk("Fail to map pirq for gsi (%d)!\n", gsi_info.gsi);
   139	
   140		return ret;
   141	}
   142	EXPORT_SYMBOL_GPL(xen_pvh_passthrough_gsi);
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

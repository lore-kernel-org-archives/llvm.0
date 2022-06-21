Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AC67490
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 19:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655840716; x=1687376716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vsbfVpxfgyqj2cCX1DPFNEi5ehN4eJRrw639yIQfgqk=;
  b=aujmbj25dbJY7vLxrgMvHMaJCudcL+TLa6YWeX1haCWNhjmFq2wHZwHq
   RaGbxCzp/F/mam4KmlsQW2Km4RiKaH0m5Gx42w36A09lM/7uMAVn7FP0I
   AEdOfQBz7JGCq9wq6ppfW0s1QBgb2d1aBc86sl0w80rZCISt5WTxgq/Ow
   H9dYc4p3fsRi4Ouy0ycEnw9GR4oOVWfqZxGFEBzcHYgbSQx5L+x5/r1JX
   BvDOYv1W5VkUMyhh4nsIjiMWjgl8OtiVnh9B79RV5NMTqPk5ivdiOs1x6
   RBSiM7OkVO89nXKGMguS7kSxJwaE5dS3I4ZUejzg9t1PbblkkChups9tf
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="260651562"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="260651562"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 12:45:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="586075571"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Jun 2022 12:45:11 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3joF-0000LD-7Q;
	Tue, 21 Jun 2022 19:45:11 +0000
Date: Wed, 22 Jun 2022 03:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: Tilak Tangudu <tilak.tangudu@intel.com>,
	intel-gfx@lists.freedesktop.org, jon.ewins@intel.com,
	rodrigo.vivi@intel.com, vinay.belgaumkar@intel.com,
	chris.p.wilson@intel.com, ashutosh.dixit@intel.com,
	badal.nilawar@intel.com, anshuman.gupta@intel.com,
	matthew.d.roper@intel.com, saurabhg.gupta@intel.com,
	Aravind.Iddamsetty@intel.com, Sujaritha.Sundaresan@intel.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [PATCH 09/11] drm/i915: Add i915_save/load_pci_state
 helpers
Message-ID: <202206220303.UvbFJUZD-lkp@intel.com>
References: <20220621123516.370479-10-tilak.tangudu@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621123516.370479-10-tilak.tangudu@intel.com>

Hi Tilak,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Tilak-Tangudu/drm-i915-Add-D3Cold-Off-support-for-runtime-pm/20220621-202453
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220622/202206220303.UvbFJUZD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ad0aa2eb6293edc066466ecf3b82ce2e4e0a9636
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tilak-Tangudu/drm-i915-Add-D3Cold-Off-support-for-runtime-pm/20220621-202453
        git checkout ad0aa2eb6293edc066466ecf3b82ce2e4e0a9636
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_driver.c:108:6: warning: no previous prototype for function 'i915_save_pci_state' [-Wmissing-prototypes]
   bool i915_save_pci_state(struct pci_dev *pdev)
        ^
   drivers/gpu/drm/i915/i915_driver.c:108:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool i915_save_pci_state(struct pci_dev *pdev)
   ^
   static 
>> drivers/gpu/drm/i915/i915_driver.c:127:6: warning: no previous prototype for function 'i915_load_pci_state' [-Wmissing-prototypes]
   void i915_load_pci_state(struct pci_dev *pdev)
        ^
   drivers/gpu/drm/i915/i915_driver.c:127:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void i915_load_pci_state(struct pci_dev *pdev)
   ^
   static 
   2 warnings generated.


vim +/i915_save_pci_state +108 drivers/gpu/drm/i915/i915_driver.c

   107	
 > 108	bool i915_save_pci_state(struct pci_dev *pdev)
   109	{
   110		struct drm_i915_private *i915 = pci_get_drvdata(pdev);
   111	
   112		if (pci_save_state(pdev))
   113			return false;
   114	
   115		kfree(i915->pci_state);
   116	
   117		i915->pci_state = pci_store_saved_state(pdev);
   118	
   119		if (!i915->pci_state) {
   120			drm_err(&i915->drm, "Failed to store PCI saved state\n");
   121			return false;
   122		}
   123	
   124		return true;
   125	}
   126	
 > 127	void i915_load_pci_state(struct pci_dev *pdev)
   128	{
   129		struct drm_i915_private *i915 = pci_get_drvdata(pdev);
   130		int ret;
   131	
   132		if (!i915->pci_state)
   133			return;
   134	
   135		ret = pci_load_saved_state(pdev, i915->pci_state);
   136		if (!ret) {
   137			pci_restore_state(pdev);
   138		} else {
   139			drm_warn(&i915->drm, "Failed to load PCI state, err:%d\n", ret);
   140		}
   141	}
   142	static int i915_get_bridge_dev(struct drm_i915_private *dev_priv)
   143	{
   144		int domain = pci_domain_nr(to_pci_dev(dev_priv->drm.dev)->bus);
   145	
   146		dev_priv->bridge_dev =
   147			pci_get_domain_bus_and_slot(domain, 0, PCI_DEVFN(0, 0));
   148		if (!dev_priv->bridge_dev) {
   149			drm_err(&dev_priv->drm, "bridge device not found\n");
   150			return -EIO;
   151		}
   152		return 0;
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

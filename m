Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CED6035
	for <llvm@lists.linux.dev>; Tue,  5 Jul 2022 23:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657064583; x=1688600583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GoIqJr7GLh3ah3aEPK38HUfQSdmxZNJB4LlBECvGKRk=;
  b=Y86dLOTT/RbQ2qfLaZWVsIXdu49BOMoTLp34kfth5jdu3v3+GkgzufC6
   I8Dbc1Obegz5AG/u6i/sJbAO1Qtezdy1dBDlgefdV2k74lkEanmxjCiEY
   ADqcw6C/xboNjfjDqW7lmWMTrNUXmAQ1Ig5BZP2ZjQeqdQ7T/oMUqU33T
   syVVVwJGQy66BOo8wOS7kEBWIf5eLI6J4JRX17WSdUIaOyXG03lyb025Y
   qZn1XIknYNZDqDZhTt6HFPM3CGDPPrOaaGmQb4Wog0wAi8C7AOOhDdhvh
   vTB5168XFJNwR5pq/T1BVZUxDHPJdRhz2tPpIohIBvG/Nvm4Xknjmva+j
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="283602367"
X-IronPort-AV: E=Sophos;i="5.92,248,1650956400"; 
   d="scan'208";a="283602367"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 16:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,248,1650956400"; 
   d="scan'208";a="695849330"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Jul 2022 16:43:01 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o8sC5-000JiH-8X;
	Tue, 05 Jul 2022 23:43:01 +0000
Date: Wed, 6 Jul 2022 07:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v6 2/5] iommu: Implement of_iommu_get_resv_regions()
Message-ID: <202207060758.u1lk0Hhl-lkp@intel.com>
References: <20220705125834.431711-3-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220705125834.431711-3-thierry.reding@gmail.com>

Hi Thierry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on joro-iommu/next tegra/for-next linus/master v5.19-rc5 next-20220705]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Reding/iommu-Support-mappings-reservations-in-reserved-memory-regions/20220705-213902
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220706/202207060758.u1lk0Hhl-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 142aca7741d5b06207e87bf4880fbe308c8d6823)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/db596b2e55b6ffe12d06373455981deaf8093b4c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thierry-Reding/iommu-Support-mappings-reservations-in-reserved-memory-regions/20220705-213902
        git checkout db596b2e55b6ffe12d06373455981deaf8093b4c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/iommu/of_iommu.c:225:24: warning: variable 'end' set but not used [-Wunused-but-set-variable]
                                   phys_addr_t start, end;
                                                      ^
>> drivers/iommu/of_iommu.c:220:17: warning: variable 'index' set but not used [-Wunused-but-set-variable]
                           unsigned int index = 0;
                                        ^
   2 warnings generated.


vim +/end +225 drivers/iommu/of_iommu.c

   176	
   177	/**
   178	 * of_iommu_get_resv_regions - reserved region driver helper for device tree
   179	 * @dev: device for which to get reserved regions
   180	 * @list: reserved region list
   181	 *
   182	 * IOMMU drivers can use this to implement their .get_resv_regions() callback
   183	 * for memory regions attached to a device tree node. See the reserved-memory
   184	 * device tree bindings on how to use these:
   185	 *
   186	 *   Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
   187	 */
   188	void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
   189	{
   190	#if IS_ENABLED(CONFIG_OF_ADDRESS)
   191		struct of_phandle_iterator it;
   192		int err;
   193	
   194		of_for_each_phandle(&it, err, dev->of_node, "memory-region", NULL, 0) {
   195			struct iommu_resv_region *region;
   196			struct resource res;
   197			const __be32 *maps;
   198			int size;
   199	
   200			memset(&res, 0, sizeof(res));
   201	
   202			/*
   203			 * The "reg" property is optional and can be omitted by reserved-memory regions
   204			 * that represent reservations in the IOVA space, which are regions that should
   205			 * not be mapped.
   206			 */
   207			if (of_find_property(it.node, "reg", NULL)) {
   208				err = of_address_to_resource(it.node, 0, &res);
   209				if (err < 0) {
   210					dev_err(dev, "failed to parse memory region %pOF: %d\n",
   211						it.node, err);
   212					continue;
   213				}
   214			}
   215	
   216			maps = of_get_property(it.node, "iommu-addresses", &size);
   217			if (maps) {
   218				const __be32 *end = maps + size / sizeof(__be32);
   219				struct device_node *np;
 > 220				unsigned int index = 0;
   221				u32 phandle;
   222				int na, ns;
   223	
   224				while (maps < end) {
 > 225					phys_addr_t start, end;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

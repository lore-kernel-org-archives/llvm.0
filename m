Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD0220F3
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 06:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652422444; x=1683958444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=45YJOBY7Vi1/I2JdSSPHS+Eh+rKNsCr4VkPQyvy5uuY=;
  b=TqGIIIuWmu7WOcc8Fnn4u2lIoudd9GgaWV0QKpvayLzHRRkHURlm7MIL
   rx/Z1klok0Ic9jjvlgKr48W3jrlWNzF0y7VbNzfhwx4QURzBt92LiOmdf
   PfANRFuHV/QXTWrJt9wVLDQBiDDVlC4dbvcHNU6Z3uaSiz1UZJJoC2J50
   rrWqgGsLAj6lVy053T/iaxgueW1iPPjP/xArHXwSSXkNCX1bTqVqg8EYy
   iffEUD/x8jGIrPFyxqbfXkvk6ulbUhJliE7cLAAW5pOt7AvRXVlmYwucB
   1WT8bB3v2qxkibwxeaV5D/Vzw0iK43xMSfKAfK1fJLxtK5+MHxX4aiw/+
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="252274075"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="252274075"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 23:14:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="698367493"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 May 2022 23:14:02 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npOYs-000LP7-2s;
	Fri, 13 May 2022 06:14:02 +0000
Date: Fri, 13 May 2022 14:13:40 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v5 2/5] iommu: Implement of_iommu_get_resv_regions()
Message-ID: <202205131453.m2ppmXaC-lkp@intel.com>
References: <20220512190052.1152377-3-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512190052.1152377-3-thierry.reding@gmail.com>

Hi Thierry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on joro-iommu/next tegra/for-next v5.18-rc6 next-20220512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Reding/iommu-Support-mappings-reservations-in-reserved-memory-regions/20220513-030401
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220513/202205131453.m2ppmXaC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9519dacab7b8afd537811fc2abaceb4d14f4e16a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/83d368d6d657148eb06adbc568592fcf38fd98d8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thierry-Reding/iommu-Support-mappings-reservations-in-reserved-memory-regions/20220513-030401
        git checkout 83d368d6d657148eb06adbc568592fcf38fd98d8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/iommu/ kernel/trace/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/iommu/of_iommu.c:227:24: warning: variable 'end' set but not used [-Wunused-but-set-variable]
                                   phys_addr_t start, end;
                                                      ^
>> drivers/iommu/of_iommu.c:222:17: warning: variable 'index' set but not used [-Wunused-but-set-variable]
                           unsigned int index = 0;
                                        ^
   2 warnings generated.


vim +/end +227 drivers/iommu/of_iommu.c

   178	
   179	/**
   180	 * of_iommu_get_resv_regions - reserved region driver helper for device tree
   181	 * @dev: device for which to get reserved regions
   182	 * @list: reserved region list
   183	 *
   184	 * IOMMU drivers can use this to implement their .get_resv_regions() callback
   185	 * for memory regions attached to a device tree node. See the reserved-memory
   186	 * device tree bindings on how to use these:
   187	 *
   188	 *   Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
   189	 */
   190	void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
   191	{
   192	#if IS_ENABLED(CONFIG_OF_ADDRESS)
   193		struct of_phandle_iterator it;
   194		int err;
   195	
   196		of_for_each_phandle(&it, err, dev->of_node, "memory-region", NULL, 0) {
   197			struct iommu_resv_region *region;
   198			struct resource res;
   199			const __be32 *maps;
   200			int size;
   201	
   202			memset(&res, 0, sizeof(res));
   203	
   204			/*
   205			 * The "reg" property is optional and can be omitted by reserved-memory regions
   206			 * that represent reservations in the IOVA space, which are regions that should
   207			 * not be mapped.
   208			 */
   209			if (of_find_property(it.node, "reg", NULL)) {
   210				err = of_address_to_resource(it.node, 0, &res);
   211				if (err < 0) {
   212					dev_err(dev, "failed to parse memory region %pOF: %d\n",
   213						it.node, err);
   214					continue;
   215				}
   216			}
   217	
   218			maps = of_get_property(it.node, "iommu-addresses", &size);
   219			if (maps) {
   220				const __be32 *end = maps + size / sizeof(__be32);
   221				struct device_node *np;
 > 222				unsigned int index = 0;
   223				u32 phandle;
   224				int na, ns;
   225	
   226				while (maps < end) {
 > 227					phys_addr_t start, end;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

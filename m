Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F25621
	for <llvm@lists.linux.dev>; Wed, 27 Apr 2022 01:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651021398; x=1682557398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LF1JHLf5LO3j4aSZiAdPAy35lsnxG8xaGxyQwONusG0=;
  b=nIG4P3bOkFHuwTYQmFmAZlZ0Mp4cluYG9lXE3DISDtGjCuZqwlUzy2DI
   PuCPV8KeH8SL6bjlsScVQcgy5Y+TTB5EW0hTUXMP6EKmlhurb1/de4Rqz
   XkDxgdj974/SDfZ9euZvMyP1igyvvQ6311QtwRkoLMwjfZ7kuivatEQ5k
   LcHgQDlY6S/8X1Deiy+C60Ig+MdiNmhgfsJwHVHWczeSVV1qdf1rPoxeY
   +TbMQbjj5ptGRM10a7o0LNo/MP/WiLcpPMYSCdFPpz6LVA07Sx3vUpg2T
   H/2LWDav42O41KZGorq6Y4yysxO8KVQyaj6+jSn/OYoBu+cfTTGwyL9GP
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="328714162"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="328714162"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 18:03:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="730533754"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Apr 2022 18:03:15 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1njW5K-00048q-Ka;
	Wed, 27 Apr 2022 01:03:14 +0000
Date: Wed, 27 Apr 2022 09:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [thierryreding:for-5.19/work 141/141]
 drivers/iommu/of_iommu.c:227:24: warning: variable 'end' set but not used
Message-ID: <202204270946.XYoXuYbi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thierryreding/linux for-5.19/work
head:   a39ec325554470289e8384e30d06a22960d1dd7b
commit: a39ec325554470289e8384e30d06a22960d1dd7b [141/141] WIP
config: i386-randconfig-a003-20220425 (https://download.01.org/0day-ci/archive/20220427/202204270946.XYoXuYbi-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/thierryreding/linux/commit/a39ec325554470289e8384e30d06a22960d1dd7b
        git remote add thierryreding https://github.com/thierryreding/linux
        git fetch --no-tags thierryreding for-5.19/work
        git checkout a39ec325554470289e8384e30d06a22960d1dd7b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/iommu/

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

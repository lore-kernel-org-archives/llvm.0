Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F5423B9;
	Sun,  9 Apr 2023 14:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681049014; x=1712585014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=txhxn78ljVZDamKIYfpkA5LeERggflK5oFWKUBXh4Yw=;
  b=GGAs9r+1LYDvgi0Jiiivu1dWaZkYDHMKeOZvCsy5UOkpleF5zxiBNCWO
   OyNHHbkDd28UI8aSH6utTZLAl+YtC7Mcjq1TVOm2UXtleHN2FUN2X79WD
   jvjNfFvAaSGOBDUFK9VobT09CXegHRDbJLbNVOhB3HfdSbZ7Zui99L8AU
   mvxsIBC2AAhOSLIWkRH5S9qV6KnAhTJpzNpvAIyW2KuhtCx8GworyqNxi
   7TYj+sKTFU9Z92bHaj0uk5CSHShsOlTVhg+SoswFbNoDEBWSxd9MehQwu
   9+wQx7xwectBpODfovc5Ml3J6QF1TDpJlXtJdhVAyAEouzuaKhDHcYcTt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="406049242"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="406049242"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 07:03:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="777320189"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="777320189"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Apr 2023 07:03:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plVdi-000UXi-2m;
	Sun, 09 Apr 2023 14:03:30 +0000
Date: Sun, 9 Apr 2023 22:02:45 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [cxl:for-6.5/dcd-preview 10/15] drivers/cxl/core/port.c:316:6:
 error: use of undeclared identifier 'dev_attr_create_dc_region'
Message-ID: <202304092230.dloBfRE5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.5/dcd-preview
head:   f425bc34c600e2a3721d6560202962ec41622815
commit: 5d722120a10d7263de3f874708cf795ca34c9c0c [10/15] cxl/region: Add dynamic capacity cxl region support.
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20230409/202304092230.dloBfRE5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commit/?id=5d722120a10d7263de3f874708cf795ca34c9c0c
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
        git fetch --no-tags cxl for-6.5/dcd-preview
        git checkout 5d722120a10d7263de3f874708cf795ca34c9c0c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304092230.dloBfRE5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/core/port.c:316:6: error: use of undeclared identifier 'dev_attr_create_dc_region'
                                   &dev_attr_create_dc_region.attr, NULL)) {
                                    ^
   1 error generated.


vim +/dev_attr_create_dc_region +316 drivers/cxl/core/port.c

   305	
   306	int add_dc_region_attribute(struct device *dev, void *data)
   307	{
   308		struct cxl_root_decoder *cxlrd;
   309	
   310		if (!is_root_decoder(dev))
   311			return 0;
   312	
   313		cxlrd = to_cxl_root_decoder(dev);
   314		if (!cxlrd->dc_sysfs_initialized) {
   315			if (sysfs_add_file_to_group(&dev->kobj,
 > 316					&dev_attr_create_dc_region.attr, NULL)) {
   317				dev_err(dev, "Failed to create_dc_region file\n");
   318				cxlrd->dc_sysfs_initialized = true;
   319				return 1;
   320			}
   321		}
   322	
   323		return 0;
   324	}
   325	EXPORT_SYMBOL_NS_GPL(add_dc_region_attribute, CXL);
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

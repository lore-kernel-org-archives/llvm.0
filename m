Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490762C80
	for <llvm@lists.linux.dev>; Fri,  4 Feb 2022 01:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643938308; x=1675474308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CNE2D9IY98Tddxg5T5fEgwxXM5ybZndP5agnSOJUX5E=;
  b=dhybH+GRw5iVFUoIyMVEBR/VJ/5Wsj89YOD3zRMiSwiiduYws0LDEYjP
   4UYCF+gy1HBcsB2I3iviYLyY0qrCtLfZqB0fM744QlqO5c04XsOm/7WRy
   RtZB8ARQjrXWhj4OdDdhZJhIS3ioN38m19JLsZBz4X7TAvZ7FtzZtfXLP
   EeZTypcegIOMcHQHlZwW5LKMcyYAZjE67oDC5fT4KU7tUIqJ/2WEgK8u2
   KG1dCttnGMU7q54Qzgr7yVsJoplmcYiZ+7kvBbQTfIji5GXu7C52QqjHi
   h3UZi7q8jgQQvI6rhXZEq2w9SzTaNpZCHkrH0ZyYYMlq40KQ+1omRgpjL
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248505646"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="248505646"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 17:31:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="524148164"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Feb 2022 17:31:45 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nFnRx-000Ww2-2r; Fri, 04 Feb 2022 01:31:45 +0000
Date: Fri, 4 Feb 2022 09:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Russ Weight <russell.h.weight@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 3/5] firmware_loader: Split fw_sysfs support from
 fallback
Message-ID: <202202040744.q4EU7xJp-lkp@intel.com>
References: <20220203213053.360190-4-russell.h.weight@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203213053.360190-4-russell.h.weight@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Russ,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on linus/master v5.17-rc2 next-20220203]
[cannot apply to linux/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Russ-Weight/Extend-FW-framework-for-user-FW-uploads/20220204-053320
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git 13e906e50a8cf6033f22c03c4d772e36a9e02c6b
config: hexagon-randconfig-r045-20220130 (https://download.01.org/0day-ci/archive/20220204/202202040744.q4EU7xJp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4ce6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c230afe198b50ce7265dc77e7f63e780b30f8521
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Russ-Weight/Extend-FW-framework-for-user-FW-uploads/20220204-053320
        git checkout c230afe198b50ce7265dc77e7f63e780b30f8521
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/base/firmware_loader/main.c:44:
   In file included from drivers/base/firmware_loader/fallback.h:9:
>> drivers/base/firmware_loader/fw_sysfs.h:72:27: error: incomplete definition of type 'struct firmware_fallback_config'
           return fw_fallback_config.loading_timeout;
                  ~~~~~~~~~~~~~~~~~~^
   drivers/base/firmware_loader/fw_sysfs.h:7:15: note: forward declaration of 'struct firmware_fallback_config'
   extern struct firmware_fallback_config fw_fallback_config;
                 ^
   drivers/base/firmware_loader/fw_sysfs.h:78:20: error: incomplete definition of type 'struct firmware_fallback_config'
           fw_fallback_config.loading_timeout = timeout;
           ~~~~~~~~~~~~~~~~~~^
   drivers/base/firmware_loader/fw_sysfs.h:7:15: note: forward declaration of 'struct firmware_fallback_config'
   extern struct firmware_fallback_config fw_fallback_config;
                 ^
   2 errors generated.


vim +72 drivers/base/firmware_loader/fw_sysfs.h

    68	
    69	/* These getters are vetted to use int properly */
    70	static inline int __firmware_loading_timeout(void)
    71	{
  > 72		return fw_fallback_config.loading_timeout;
    73	}
    74	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

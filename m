Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804583D6B
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 23:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647473721; x=1679009721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2kyFi7igjphyhmmjj37Zhltbd0MTEUB7JIqUeIDofmY=;
  b=QnXeKspeb7nt3WFePeA+FMHnfyuXBTjihNF0KJxc5hxbzAMnVkfz4D2m
   o+MUXNOa1vNfbaHNbS3MPpJfJTLQJbdegEwQ3A6H/+nobtPZKywyH+WQ7
   RgxsyclCqONzksz75IK/+zLkcJSPwmlYLwq+oUE/DGl+LP8Vh/q1Ie4jg
   Am892UUMaU4iM0+d8nJHY6Sti3iyG5C40OO2ssdy9PYXq7H3UzOZy11Kc
   O4rRCEa/rRwWpxhLHqolDuyn1Bk7G0zCUFQ6MHQdTxifcZBjpcY4bhErE
   53qcOaBOO7qEe4Tuf2lTywNvz29XqSs28UzUBvKFTSkorHj5IqD3/lHsM
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="256689581"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="256689581"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 16:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="646845815"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Mar 2022 16:35:19 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUdAk-000D5B-Tq; Wed, 16 Mar 2022 23:35:18 +0000
Date: Thu, 17 Mar 2022 07:35:05 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v5 11/11] rpmsg: Fix kfree() of static memory on setting
 driver_override
Message-ID: <202203170751.5CsN55tm-lkp@intel.com>
References: <20220316150803.421897-5-krzysztof.kozlowski@canonical.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220316150803.421897-5-krzysztof.kozlowski@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Krzysztof,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20220315]
[cannot apply to remoteproc/rpmsg-next driver-core/driver-core-testing helgaas-pci/next linus/master v5.17-rc8 v5.17-rc7 v5.17-rc6 v5.17-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Krzysztof-Kozlowski/Fix-broken-usage-of-driver_override-and-kfree-of-static-memory/20220316-233055
base:    a32cd981a6da2373c093d471ee4405a915e217d5
config: x86_64-randconfig-a011-20220314 (https://download.01.org/0day-ci/archive/20220317/202203170751.5CsN55tm-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a69b0ffffb78c59cee263272190b3fe28df84452
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/Fix-broken-usage-of-driver_override-and-kfree-of-static-memory/20220316-233055
        git checkout a69b0ffffb78c59cee263272190b3fe28df84452
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/rpmsg/qcom_glink_native.c:23:
>> drivers/rpmsg/rpmsg_internal.h:98:2: error: use of undeclared identifier 'ret'
           ret = driver_set_override(&rpdev->dev, &rpdev->driver_override,
           ^
   drivers/rpmsg/rpmsg_internal.h:100:6: error: use of undeclared identifier 'ret'
           if (ret)
               ^
   drivers/rpmsg/rpmsg_internal.h:101:10: error: use of undeclared identifier 'ret'
                   return ret;
                          ^
   drivers/rpmsg/rpmsg_internal.h:103:2: error: use of undeclared identifier 'ret'
           ret = rpmsg_register_device(rpdev);
           ^
   drivers/rpmsg/rpmsg_internal.h:104:6: error: use of undeclared identifier 'ret'
           if (ret)
               ^
   drivers/rpmsg/rpmsg_internal.h:107:9: error: use of undeclared identifier 'ret'
           return ret;
                  ^
   6 errors generated.


vim +/ret +98 drivers/rpmsg/rpmsg_internal.h

    80	
    81	struct device *rpmsg_find_device(struct device *parent,
    82					 struct rpmsg_channel_info *chinfo);
    83	
    84	struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
    85						  struct rpmsg_channel_info *chinfo);
    86	int rpmsg_release_channel(struct rpmsg_device *rpdev,
    87				  struct rpmsg_channel_info *chinfo);
    88	/**
    89	 * rpmsg_ctrldev_register_device() - register a char device for control based on rpdev
    90	 * @rpdev:	prepared rpdev to be used for creating endpoints
    91	 *
    92	 * This function wraps rpmsg_register_device() preparing the rpdev for use as
    93	 * basis for the rpmsg chrdev.
    94	 */
    95	static inline int rpmsg_ctrldev_register_device(struct rpmsg_device *rpdev)
    96	{
    97		strcpy(rpdev->id.name, "rpmsg_ctrl");
  > 98		ret = driver_set_override(&rpdev->dev, &rpdev->driver_override,
    99					  "rpmsg_ctrl", strlen("rpmsg_ctrl"));
   100		if (ret)
   101			return ret;
   102	
   103		ret = rpmsg_register_device(rpdev);
   104		if (ret)
   105			kfree(rpdev->driver_override);
   106	
   107		return ret;
   108	}
   109	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

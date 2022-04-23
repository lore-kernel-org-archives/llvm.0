Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D1F15D6
	for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 07:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650699053; x=1682235053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C541v7PuNvIqabzwOaiOUIw9BmTNKpxThOwoOZGimcI=;
  b=kZPUMeFAyYGqP1gTZ5ZUGNctViasRqylHcxPa1+ZG5DrxSH5jaP5SSbW
   BT8POy8SCi7kntDLcl0DJivIMpbuc5IYgH1n1XBmI7/IJshdm6HsGYoeJ
   TfDGp2v16FQUASZNTOXNfcYbrtyI2Bn0vGXwBgXwZYFIqo9eN+LSzyzGq
   BjVJy2AOt7Zfi2s6TzF1abJVONEz3vLEVkgq0z9IaEK+YH1Qc3ZLR7YvY
   Grp4Z6h+bKu8dOSsHmVxDrbMTljYyWpHb6H3CjKuTZSl2BSrA27n7SjlV
   pZi2iBZ2LeUas1AAotxec4VpR7Gmc21n0WwcDlv21i4LSInr2idR9b3bf
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="244789728"
X-IronPort-AV: E=Sophos;i="5.90,284,1643702400"; 
   d="scan'208";a="244789728"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2022 00:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,284,1643702400"; 
   d="scan'208";a="673433864"
Received: from lkp-server01.sh.intel.com (HELO dd58949a6e39) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Apr 2022 00:30:48 -0700
Received: from kbuild by dd58949a6e39 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1niAEB-00001P-Db;
	Sat, 23 Apr 2022 07:30:47 +0000
Date: Sat, 23 Apr 2022 15:30:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jagdish Gediya <jvgediya@linux.ibm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	baolin.wang@linux.alibaba.com, dave.hansen@linux.intel.com,
	ying.huang@intel.com, aneesh.kumar@linux.ibm.com,
	shy828301@gmail.com, weixugc@google.com, gthelen@google.com,
	dan.j.williams@intel.com, Jagdish Gediya <jvgediya@linux.ibm.com>
Subject: Re: [PATCH v3 6/7] mm: demotion: expose per-node demotion targets
 via sysfs
Message-ID: <202204231557.Jmw6QI8T-lkp@intel.com>
References: <20220422195516.10769-7-jvgediya@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422195516.10769-7-jvgediya@linux.ibm.com>

Hi Jagdish,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on linus/master linux/master v5.18-rc3]
[cannot apply to hnaz-mm/master next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jagdish-Gediya/mm-demotion-Introduce-new-node-state-N_DEMOTION_TARGETS/20220423-035714
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git 4e224719f5d9b92abf1e0edfb2a83053208f3026
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220423/202204231557.Jmw6QI8T-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0717e30f61ac83bd6ec65395bf46fdb5131cb83f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jagdish-Gediya/mm-demotion-Introduce-new-node-state-N_DEMOTION_TARGETS/20220423-035714
        git checkout 0717e30f61ac83bd6ec65395bf46fdb5131cb83f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/base/node.c:567:32: error: call to undeclared function 'node_get_demotion_targets'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           nodemask_t demotion_targets = node_get_demotion_targets(dev->id);
                                         ^
>> drivers/base/node.c:567:13: error: initializing 'nodemask_t' with an expression of incompatible type 'int'
           nodemask_t demotion_targets = node_get_demotion_targets(dev->id);
                      ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/node_get_demotion_targets +567 drivers/base/node.c

   563	
   564	static ssize_t demotion_targets_show(struct device *dev,
   565					     struct device_attribute *attr, char *buf)
   566	{
 > 567		nodemask_t demotion_targets = node_get_demotion_targets(dev->id);
   568	
   569		return sysfs_emit(buf, "%*pbl\n", nodemask_pr_args(&demotion_targets));
   570	}
   571	static DEVICE_ATTR_RO(demotion_targets);
   572	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

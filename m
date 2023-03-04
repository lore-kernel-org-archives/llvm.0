Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585501FCC;
	Sat,  4 Mar 2023 08:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677918232; x=1709454232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=be1rXqOTaA9TmHSy7Fu3SagO+W1K5eB5Fn1fhibjMYE=;
  b=GK3r5MBGFLSuGcBRcoK0R4bmqe38zFLk8fjVvi/vSFW8Wk0V1jwIuCpB
   Hfqg/ix5o+fLCY97Ny1XGAv513j8OG/8g89ICvpB8aHkyn2tJD/ScdNWK
   c5Ty0Z3ACwrp6VJmE2U5Y6pbLCbjmwHyP6f7kMT85DiI3q6X/WsIfL82a
   22vYmnTZEBrn1ga4xPm8QcUC+n0KM2ZVSrLcyQfnvd+aoom1rXtvCeYvd
   WSHrVxDD481Y9Br712CYGLBX8/OolXwgI/jclALhHotssWDDoEhKkP9GC
   R+TETQ7kjvLUuMu5zjYxFz5b8npzxxhqDaSNJLa9GZ+I43ALCymArfYoU
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="336758160"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="336758160"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 00:23:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="705896951"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="705896951"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Mar 2023 00:23:46 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYNBB-00020e-0n;
	Sat, 04 Mar 2023 08:23:45 +0000
Date: Sat, 4 Mar 2023 16:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-cxl@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
	mark.rutland@arm.com, will@kernel.org, dan.j.williams@intel.com,
	bwidawsk@kernel.org, ira.weiny@intel.com, vishal.l.verma@intel.com,
	alison.schofield@intel.com, linuxarm@huawei.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] cxl/pci: Find and register CXL PMU devices
Message-ID: <202303041641.maw8XfoZ-lkp@intel.com>
References: <20230303175022.10806-3-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303175022.10806-3-Jonathan.Cameron@huawei.com>

Hi Jonathan,

I love your patch! Yet something to improve:

[auto build test ERROR on cxl/next]
[also build test ERROR on cxl/pending linus/master next-20230303]
[cannot apply to v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/cxl-Add-function-to-count-regblocks-of-a-given-type/20230304-015342
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20230303175022.10806-3-Jonathan.Cameron%40huawei.com
patch subject: [PATCH 2/4] cxl/pci: Find and register CXL PMU devices
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230304/202303041641.maw8XfoZ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0790ed82bb7adf04c834e8c03008b92c1b23945e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Cameron/cxl-Add-function-to-count-regblocks-of-a-given-type/20230304-015342
        git checkout 0790ed82bb7adf04c834e8c03008b92c1b23945e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/cxl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303041641.maw8XfoZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/core/regs.c:9:10: fatal error: 'cpmu.h' file not found
   #include <cpmu.h>
            ^~~~~~~~
   1 error generated.
--
>> drivers/cxl/core/cpmu.c:8:10: fatal error: 'cpmu.h' file not found
   #include <cpmu.h>
            ^~~~~~~~
   1 error generated.


vim +9 drivers/cxl/core/regs.c

   > 9	#include <cpmu.h>
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

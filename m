Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6792823A2;
	Sat, 28 Jan 2023 06:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674886222; x=1706422222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d2IWTKzpYgPv8xiCBEE212opj45Po0S+P3DkoviomNA=;
  b=Sy2Ei95hkkpNVIwJoWM6Wmodo3hyAZZgcnjj5laQBz33MfgRb9YApmxj
   tG9skcCB/vVeidQ1TOvACiHf2SUMRwl3fjoegpqV41rZKjj0bGuo8vHeM
   WF3MQ2NfEStoPZoBS+8Ky5jUJwz5VdMqNcW9wAUYZthdJPyFhTRdo1y7r
   Z9m5kR+jW2ZIgCHW8S8N/XVM4C5dK8eNEQtl7JUWMaf2rHQh7XwQda9be
   nJ263ZoUAxVQcFVMM6Huk0TjNxrmP9P+ltw5Xfqz3Z1r1k2mZuakZx8p7
   u4fPLvXf1ECTUB+pv1MYY7YBV2Qc8746Ich3/obATZuAwgUArE+jDAiVV
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="327284454"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="327284454"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 22:10:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="806070145"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="806070145"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jan 2023 22:10:19 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLePr-0000RZ-0a;
	Sat, 28 Jan 2023 06:10:19 +0000
Date: Sat, 28 Jan 2023 14:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org
Subject: [cxl:for-6.3/cxl-ram-region 17/18] ERROR: modpost:
 "cxl_add_to_region" [drivers/cxl/cxl_port.ko] undefined!
Message-ID: <202301281329.fAZb07Lx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.3/cxl-ram-region
head:   a7cf664d7e997ac36b0f466af2e2be33464ab598
commit: 3c6c8594f9a2bcb4af19bc8de669ed43834b8d7f [17/18] cxl/region: Add region autodiscovery
config: i386-randconfig-a013-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281329.fAZb07Lx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commit/?id=3c6c8594f9a2bcb4af19bc8de669ed43834b8d7f
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
        git fetch --no-tags cxl for-6.3/cxl-ram-region
        git checkout 3c6c8594f9a2bcb4af19bc8de669ed43834b8d7f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "is_endpoint_decoder" [drivers/cxl/cxl_port.ko] undefined!
>> ERROR: modpost: "cxl_add_to_region" [drivers/cxl/cxl_port.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6D2C2DC;
	Tue, 18 Apr 2023 07:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681801947; x=1713337947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oMCAkxFr3ra5E1m5YVjKpXHHbKpFuiTCPo87zNDOKxg=;
  b=hjG2bfs2naw9llrMGCVvE87sbewrcScATwww0rB4AlfKjkC7Jmow1zqr
   /OnhNNnXdR0rtFhSWCpZFElm/DSgN+7Bzan6kkveQHzRaNM9YoKm5m9VE
   b/kg/f36BVlZ+irnDed7zMoGp40bZAfTQ51VMy/DbTxTuXe9KQb/rbZ2F
   Qs2cFWMaDbg7bPqNG2K9xgvelPG3jzn8n+Gk74za4w/2QaleOAbnRK8Jx
   yuytxhil56zMCX+dqSBVmg0ILSi4A99L+svjyvIVp4z63G+2FVH9N0HqT
   D4JfcdjkYWMQnHZSfFeVvo5MiB6gwhDOwWThsD7wZowyNdmeKuT1FJ2Gl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="410316267"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="410316267"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 00:12:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="1020701111"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="1020701111"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Apr 2023 00:12:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pofVo-000d60-2E;
	Tue, 18 Apr 2023 07:12:24 +0000
Date: Tue, 18 Apr 2023 15:11:37 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Rosenberg <drosen@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 17/37] fuse-bpf: Add support for read/write iter
Message-ID: <202304181516.YA26jbMu-lkp@intel.com>
References: <20230418014037.2412394-18-drosen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418014037.2412394-18-drosen@google.com>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 49859de997c3115b85544bce6b6ceab60a7fabc4]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Rosenberg/bpf-verifier-Accept-dynptr-mem-as-mem-in-herlpers/20230418-094717
base:   49859de997c3115b85544bce6b6ceab60a7fabc4
patch link:    https://lore.kernel.org/r/20230418014037.2412394-18-drosen%40google.com
patch subject: [RFC PATCH v3 17/37] fuse-bpf: Add support for read/write iter
config: x86_64-randconfig-a011-20230417 (https://download.01.org/0day-ci/archive/20230418/202304181516.YA26jbMu-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9a6d8f43790d559390e1045c81a27203963bf109
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Rosenberg/bpf-verifier-Accept-dynptr-mem-as-mem-in-herlpers/20230418-094717
        git checkout 9a6d8f43790d559390e1045c81a27203963bf109
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181516.YA26jbMu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/fuse.h:747:1: warning: // comments are not allowed in this language [-Wcomment]
   // This is likely not what we want
   ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

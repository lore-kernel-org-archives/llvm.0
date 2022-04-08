Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7308B2564
	for <llvm@lists.linux.dev>; Fri,  8 Apr 2022 15:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649433292; x=1680969292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Ef7bdwQ2vU8g4RXlOQh1N7SEV6OmzR0EZJITs0lq1o=;
  b=L63nZQSN7PUq3HWnFBAeCI3hkbmpDjR1N8hLMNF4KAOVi7hOQT+VE7zr
   3xH0ApZENadbosIvYcFkSh2pn+aZ0qNZkPolFG4QCymrvp+18CP2KWtyZ
   VCeIWXAz63qoqdjpNvIlXXcbfJcu8gIAMXpdNkjiXMNnE7YQvna8YTWEs
   oQud8CO+8K0bD/3hsI0Jbi9tG+NL+t0jL2AiS1t5L5jimEhhW7kLMLoQl
   v55+36FDjUR9O6IOdahoh9cxQukrGddIYW//qRxx7MjzqrQ/m3cglc/qd
   8/EMBSJQFkoDFD5EcVRPgtSMleb4XwroqVFl/EFCKMv/9UYIoA4sE8MH9
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="259221948"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="259221948"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 08:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="852115822"
Received: from lkp-server02.sh.intel.com (HELO 7e80bc2a00a0) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 08 Apr 2022 08:54:34 -0700
Received: from kbuild by 7e80bc2a00a0 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ncqwU-0000Q4-8H;
	Fri, 08 Apr 2022 15:54:34 +0000
Date: Fri, 8 Apr 2022 23:53:47 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Fomichev <sdf@google.com>, netdev@vger.kernel.org,
	bpf@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org,
	Stanislav Fomichev <sdf@google.com>
Subject: Re: [PATCH bpf-next v3 2/7] bpf: per-cgroup lsm flavor
Message-ID: <202204082305.Qs2g5Dzf-lkp@intel.com>
References: <20220407223112.1204582-3-sdf@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407223112.1204582-3-sdf@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Stanislav,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev/bpf-cgroup_sock-lsm-flavor/20220408-063705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220408/202204082305.Qs2g5Dzf-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51b3a257908aebc01cd7c4655665db317d66)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3c3f15b5422ca616e2585d699c47aa4e7b7dcf1d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Stanislav-Fomichev/bpf-cgroup_sock-lsm-flavor/20220408-063705
        git checkout 3c3f15b5422ca616e2585d699c47aa4e7b7dcf1d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: btf_obj_id
   >>> referenced by trampoline.c
   >>>               bpf/trampoline.o:(bpf_trampoline_link_cgroup_shim) in archive kernel/built-in.a
   >>> referenced by trampoline.c
   >>>               bpf/trampoline.o:(bpf_trampoline_unlink_cgroup_shim) in archive kernel/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

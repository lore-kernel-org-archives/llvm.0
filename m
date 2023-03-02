Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4C9D524;
	Thu,  2 Mar 2023 21:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677791439; x=1709327439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lZZMuTVM1RRanm/bSThQ5dfquthSDrIJ7mGhQXKjRMQ=;
  b=IOCl7YDZrzsNiMndQ6iDHRI0QXi2TBHoBhUatbfOfXOLIkv60CiRvFBP
   wie1vespEpRsyp0k0vAHx8h52q0E7hLURORv43AVYjSWGItP6828vPfpO
   zEP/5VZK+DV4sHkrmAKBcXwCBbJcWyWXS5Ok4dy1VmmgFxwHTVmpwstvC
   Uljk73/VElYNzV9p6oAuo2HTsC32HVFQgdkWPn6np+SuW9lnFbReYaggZ
   ZRHMHYfySfrUj4DbuaulPCqM5ZjI0fRybRbim3T9sXQcuQErFI8aoY5J6
   NbT1pSx3lhwH0u5J5Bbfx0Cxnx/+zWWAw5g3UoTBu0ey5E1Y9RgU22ioM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="315266356"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="315266356"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 13:10:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="849236477"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="849236477"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Mar 2023 13:10:34 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXqC9-0000t2-1x;
	Thu, 02 Mar 2023 21:10:33 +0000
Date: Fri, 3 Mar 2023 05:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 bpf-next 1/3] bpf: add bpf_link support for
 BPF_NETFILTER programs
Message-ID: <202303030501.plArM8Yu-lkp@intel.com>
References: <20230302172757.9548-2-fw@strlen.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302172757.9548-2-fw@strlen.de>

Hi Florian,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/bpf-add-bpf_link-support-for-BPF_NETFILTER-programs/20230303-013022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230302172757.9548-2-fw%40strlen.de
patch subject: [PATCH RFC v2 bpf-next 1/3] bpf: add bpf_link support for BPF_NETFILTER programs
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230303/202303030501.plArM8Yu-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/dafd9c7dce974be4bf60f89c8427a765acfcba77
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Florian-Westphal/bpf-add-bpf_link-support-for-BPF_NETFILTER-programs/20230303-013022
        git checkout dafd9c7dce974be4bf60f89c8427a765acfcba77
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030501.plArM8Yu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: bpf_nf_link_attach
   >>> referenced by syscall.c:4641 (kernel/bpf/syscall.c:4641)
   >>>               kernel/bpf/syscall.o:(link_create) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

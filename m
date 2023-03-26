Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CB81845;
	Sun, 26 Mar 2023 11:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679829340; x=1711365340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S0NgEEW1kZPAfyAbTN+51TXNixaISQwpuM61h+ra87c=;
  b=oDCVTan/SVv45qHMMA/+bU6sraUUY7FTLQRlJvYtN+ZblRPdYhAk951x
   fU2KQb/YnKXGA94ZK8msSzvaKHtK1+SLYd+Kc+OhZU24IkK8ZfBV1T+5G
   mosGBoC2nr4UBKPyvA8Qfj9qfefzAXAyZC1lhYuH6h/cTHAZwDYEpRZV9
   1xyxhhXhbfnQrmPcqNHfvmg2AML00lrXVu0jWcQpP0ipUgy8pn4lda9cq
   SGWEoIhC4y5Yku9cuHiWLVWLPiCrbv4R4T6SssdqUwhJZ9ZMDcOn8Hl5h
   mwU0HjtFrnNRn/tK5ISKz0ShxHqHJgDqMWv3s0IFrHGfJqTttfrOcSjdj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="328506875"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="328506875"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 04:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="772369178"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="772369178"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Mar 2023 04:15:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgOLa-000H5f-0I;
	Sun, 26 Mar 2023 11:15:38 +0000
Date: Sun, 26 Mar 2023 19:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 03/13] bpf: Implement bpf namespace
Message-ID: <202303261916.LSvC0MJb-lkp@intel.com>
References: <20230326092208.13613-4-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230326092208.13613-4-laoar.shao@gmail.com>

Hi Yafang,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/fork-New-clone3-flag-for-BPF-namespace/20230326-172511
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230326092208.13613-4-laoar.shao%40gmail.com
patch subject: [RFC PATCH bpf-next 03/13] bpf: Implement bpf namespace
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230326/202303261916.LSvC0MJb-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/97c1724462aa56ab051d35da4a23086e98466e40
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yafang-Shao/fork-New-clone3-flag-for-BPF-namespace/20230326-172511
        git checkout 97c1724462aa56ab051d35da4a23086e98466e40
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303261916.LSvC0MJb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/bpf_namespace.c:29:10: warning: implicit conversion from 'unsigned long long' to 'long' changes value from 17179869184 to 0 [-Wconstant-conversion]
           .type = CLONE_NEWBPF,
                   ^~~~~~~~~~~~
   include/uapi/linux/sched.h:39:23: note: expanded from macro 'CLONE_NEWBPF'
   #define CLONE_NEWBPF            0x400000000ULL /* New BPF namespace */
                                   ^~~~~~~~~~~~~~
   1 warning generated.


vim +29 kernel/bpf/bpf_namespace.c

    26	
    27	struct proc_ns_operations bpfns_operations = {
    28		.name = "bpf",
  > 29		.type = CLONE_NEWBPF,
    30		.get  = bpfns_get,
    31		.put  = bpfns_put,
    32		.install = bpfns_install,
    33	};
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

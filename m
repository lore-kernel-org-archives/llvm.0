Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A087E7B
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 11:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652181629; x=1683717629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gsWGSPyTkc/VlkLY/vS2y69jUm7jsjC0mXQq8cr9B5M=;
  b=fnyu5SPiPkZsrXti4qn7bqqEU8/yYRbKrL4BRGfS/swJz2x+q0GBsn/u
   23a5TwBza8oPneLDgOn89FMog+sBK1383+2oe0t6u+MWyajXbqvI8OQUC
   bYFJb3REisszoctqMy/o/DNATu5Y9l6HO9cWqeObYvFFgQkiTI/G2pcga
   6MaBWYZMuqvk/3yxg2Ouiyovcluqm6FmRqje/FLnI3shtDtuRght9tAdh
   DPGpcg3ghKgGmrbHn+Fib+aFZhGoSlWLjpmxRdn1Q1w4dAIPvxBNpRH/e
   KPGyKEG5noA7kOLNfpfP2DAKjjXQSjdToIIkCyrtIpZIhmq8kBtKLTSY1
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="266929527"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="266929527"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 04:20:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="565601022"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 May 2022 04:20:27 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1noNuk-000Hm8-PL;
	Tue, 10 May 2022 11:20:26 +0000
Date: Tue, 10 May 2022 19:19:44 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH bpf-next 4/9] bpf: add bpf rstat helpers
Message-ID: <202205101901.s2K40KKV-lkp@intel.com>
References: <20220510001807.4132027-5-yosryahmed@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510001807.4132027-5-yosryahmed@google.com>

Hi Yosry,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on bpf/master]
[also build test ERROR on tj-cgroup/for-next v5.18-rc6]
[cannot apply to bpf-next/master next-20220509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/bpf-cgroup-hierarchical-stats-collection/20220510-082111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
config: arm-randconfig-c002-20220509 (https://download.01.org/0day-ci/archive/20220510/202205101901.s2K40KKV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/8e6d31618fefe87ecb64ce7445e427dd52563ec3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yosry-Ahmed/bpf-cgroup-hierarchical-stats-collection/20220510-082111
        git checkout 8e6d31618fefe87ecb64ce7445e427dd52563ec3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/bpf/helpers.c:1379:2: error: call to undeclared function 'cgroup_rstat_updated'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           cgroup_rstat_updated(cgrp, smp_processor_id());
           ^
   kernel/bpf/helpers.c:1379:2: note: did you mean 'bpf_cgroup_rstat_updated'?
   kernel/bpf/helpers.c:1377:12: note: 'bpf_cgroup_rstat_updated' declared here
   BPF_CALL_1(bpf_cgroup_rstat_updated, struct cgroup *, cgrp)
              ^
   include/linux/filter.h:511:45: note: expanded from macro 'BPF_CALL_1'
   #define BPF_CALL_1(name, ...)   BPF_CALL_x(1, name, __VA_ARGS__)
                                                 ^
   include/linux/filter.h:503:6: note: expanded from macro 'BPF_CALL_x'
           u64 name(__BPF_REG(x, __BPF_DECL_REGS, __BPF_N, __VA_ARGS__))          \
               ^
>> kernel/bpf/helpers.c:1392:2: error: call to undeclared function 'cgroup_rstat_flush_irqsafe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           cgroup_rstat_flush_irqsafe(cgrp);
           ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_DSA_SMSC_LAN9303
   Depends on NETDEVICES && NET_DSA && (VLAN_8021Q || VLAN_8021Q
   Selected by
   - NET_DSA_SMSC_LAN9303_I2C && NETDEVICES && NET_DSA && I2C


vim +/cgroup_rstat_updated +1379 kernel/bpf/helpers.c

  1376	
  1377	BPF_CALL_1(bpf_cgroup_rstat_updated, struct cgroup *, cgrp)
  1378	{
> 1379		cgroup_rstat_updated(cgrp, smp_processor_id());
  1380		return 0;
  1381	}
  1382	
  1383	static const struct bpf_func_proto bpf_cgroup_rstat_updated_proto = {
  1384		.func		= bpf_cgroup_rstat_updated,
  1385		.gpl_only	= false,
  1386		.ret_type	= RET_VOID,
  1387		.arg1_type	= ARG_ANYTHING,
  1388	};
  1389	
  1390	BPF_CALL_1(bpf_cgroup_rstat_flush, struct cgroup *, cgrp)
  1391	{
> 1392		cgroup_rstat_flush_irqsafe(cgrp);
  1393		return 0;
  1394	}
  1395	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

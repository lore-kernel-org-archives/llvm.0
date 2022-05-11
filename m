Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A6715B9
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 07:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652252434; x=1683788434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yUDPoolSmBC2fJxAtJibtJzafu/kAu6gRvpRDe10vXc=;
  b=gPIHEwXWY54L4Z3n9vAicGfv7GzvXjHF+z1uooaNY59m2EzzOJA8K3OZ
   dv/XmBF67eoGA+bG/T1wrjVPUFVhhoy0w3kRg5dxxg3k/IAfyrK5Pkdf+
   Kk6yVkPn46+5hGTG6UYt0xakt8H/HdU/i7yTkQRelRqpSCpUftJrGGK43
   bC17Heidow6s8RUKcF7+cSuZeGonPN77T/L9gAhgpd2GXh5BRlWd0trA3
   pDmf0V+4vqDgYGkcn5nQjXMHIE/Wtf4E0WMA3LQm8cxA9WmYGGgCoEz3w
   HXlQh7XVdYemswE0yPnja0Hu11M8yOs1cyvp9JhXrt5cz8msdHx8sWRtz
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="251660201"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; 
   d="scan'208";a="251660201"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 00:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; 
   d="scan'208";a="520395788"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 May 2022 00:00:32 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nogKl-000Ip5-CR;
	Wed, 11 May 2022 07:00:31 +0000
Date: Wed, 11 May 2022 15:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH bpf-next 2/9] cgroup: bpf: flush bpf stats on rstat
 flush
Message-ID: <202205111459.Odbvkmpv-lkp@intel.com>
References: <20220510001807.4132027-3-yosryahmed@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510001807.4132027-3-yosryahmed@google.com>

Hi Yosry,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on bpf/master]
[also build test ERROR on tj-cgroup/for-next v5.18-rc6 next-20220510]
[cannot apply to bpf-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/bpf-cgroup-hierarchical-stats-collection/20220510-082111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
config: hexagon-randconfig-r045-20220509 (https://download.01.org/0day-ci/archive/20220511/202205111459.Odbvkmpv-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e341c92f64ca5bb6606ac7e20ea2fc35f366dc3e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yosry-Ahmed/bpf-cgroup-hierarchical-stats-collection/20220510-082111
        git checkout e341c92f64ca5bb6606ac7e20ea2fc35f366dc3e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: bpf_run_rstat_flushers
   >>> referenced by rstat.c:186 (kernel/cgroup/rstat.c:186)
   >>>               cgroup/rstat.o:(cgroup_rstat_flush_locked) in archive kernel/built-in.a
   >>> referenced by rstat.c:186 (kernel/cgroup/rstat.c:186)
   >>>               cgroup/rstat.o:(cgroup_rstat_flush_locked) in archive kernel/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

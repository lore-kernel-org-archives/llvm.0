Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBFA627
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 00:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644798983; x=1676334983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+MphsBjQd9Mx9ssh5ka9JkBfThVEfm9wyc0kFHGmOzs=;
  b=LHvRldXUTd/9pjbmg4OPe6Jzyii7o8Y2653LGJIMJfy8CVbSgWPCW/av
   Cw5e2TzSIWbDmIyFBrGZ5KZiYK1N9tiOMwQ4tJrOJjsyiIQwnz0NZnSgg
   ymKPhoGgpW8XmVXcNu/rBMnX2XB9UvCGhje40LAHmzzWeqgIJS0aCC7wN
   PvGBv9sdBhS7OGGuJqdDbOKbIOQinyEUlJHhMIJ57IQA929IaVo0/BXDj
   M5O5sej/9T2ebhF01TFCHW6uX9oW35xGVYfrcuo9dCv37d9tKieqzD4JJ
   PGAPUNbMksdpyzCMcZPJvdKmy6XMi06ryCfgVEexVwefNHctz81Hy7Byl
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="233534724"
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; 
   d="scan'208";a="233534724"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2022 16:36:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; 
   d="scan'208";a="586968101"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Feb 2022 16:36:21 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJPLp-00082X-7O; Mon, 14 Feb 2022 00:36:21 +0000
Date: Mon, 14 Feb 2022 08:35:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jolsa-perf:bpf/fprobe_link_5 4/10]
 kernel/trace/bpf_trace.c:1043:15: error: no member named 'ip' in 'struct
 pt_regs'
Message-ID: <202202140858.R22HkKfR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/fprobe_link_5
head:   9149abfa25286fdf715525babec5150939c9ac96
commit: 6944d13cf0af8628c0b80eb90359d90cbba0d69c [4/10] bpf: Add bpf_get_func_ip kprobe helper for fprobe link
config: arm-aspeed_g4_defconfig (https://download.01.org/0day-ci/archive/20220214/202202140858.R22HkKfR-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=6944d13cf0af8628c0b80eb90359d90cbba0d69c
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/fprobe_link_5
        git checkout 6944d13cf0af8628c0b80eb90359d90cbba0d69c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/trace/bpf_trace.c:1043:15: error: no member named 'ip' in 'struct pt_regs'
           return regs->ip;
                  ~~~~  ^
   1 error generated.


vim +1043 kernel/trace/bpf_trace.c

  1039	
  1040	BPF_CALL_1(bpf_get_func_ip_fprobe, struct pt_regs *, regs)
  1041	{
  1042		/* This helper call is inlined by verifier. */
> 1043		return regs->ip;
  1044	}
  1045	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

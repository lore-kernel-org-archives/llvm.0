Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE3E3216
	for <llvm@lists.linux.dev>; Tue,  5 Apr 2022 21:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649194000; x=1680730000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+oTJs1jfnV9NW0n9SL3+E3IODEjehGaO0faXtMV5Vvo=;
  b=VvzFjshKwVt8HbO4E6ampP1kvh4i+rvp9MvYnqsMnB0TrgnOY7Xrj5Y1
   pl3MISi7ZWehi36ny7uBsjL0mwhQYLP8kZ0xL3xWYV+XOCqbP6SNz1UHV
   yxBJYt5zrJiIon17YWiY0VDEhD8C9o3K7Jpjw1oFSRr4oGV2Xy4mwGmdO
   0WFqg4wGDEaLZZn36YS7QJODa5yJUuPEGtAOQDegVfzj7dMstmxYdjz90
   ZYknWZUui8ybqBHGfRc/y5SrM/pfbKguQAkt4+OO+i6r+V/2Nuxn7H7+H
   dHVtu7RiowEeoHFz3oNx+yeP+fcCMaw6+Y5tZqSw47ByDSo6bQav4MIBq
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="285829202"
X-IronPort-AV: E=Sophos;i="5.90,238,1643702400"; 
   d="scan'208";a="285829202"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 14:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,238,1643702400"; 
   d="scan'208";a="641773595"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Apr 2022 14:26:34 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nbqh8-0003ly-3e;
	Tue, 05 Apr 2022 21:26:34 +0000
Date: Wed, 6 Apr 2022 05:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	Shubham Bansal <illusionist.neo@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>, bpf@vger.kernel.org,
	kernel-team@fb.com, Jiri Olsa <jolsa@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH bpf 4/4] arm64: rethook: Replace kretprobe trampoline
 with rethook
Message-ID: <202204060512.Pzw5bnTd-lkp@intel.com>
References: <164915126392.982637.10302202550404803304.stgit@devnote2>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164915126392.982637.10302202550404803304.stgit@devnote2>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Masami,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Masami-Hiramatsu/kprobes-rethook-ARM-arm64-Replace-kretprobe-trampoline-with-rethook/20220405-195153
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
config: arm64-randconfig-r022-20220405 (https://download.01.org/0day-ci/archive/20220406/202204060512.Pzw5bnTd-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/74084aa7903f112b1c3df1f864d49b15d8aba270
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Masami-Hiramatsu/kprobes-rethook-ARM-arm64-Replace-kretprobe-trampoline-with-rethook/20220405-195153
        git checkout 74084aa7903f112b1c3df1f864d49b15d8aba270
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/rethook.c:11:22: warning: no previous prototype for function 'arch_rethook_trampoline_callback' [-Wmissing-prototypes]
   unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs)
                        ^
   arch/arm64/kernel/rethook.c:11:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs)
   ^
   static 
   1 warning generated.


vim +/arch_rethook_trampoline_callback +11 arch/arm64/kernel/rethook.c

     9	
    10	/* This is called from arch_rethook_trampoline() */
  > 11	unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs)
    12	{
    13		return rethook_trampoline_handler(regs, regs->regs[29]);
    14	}
    15	NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
    16	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

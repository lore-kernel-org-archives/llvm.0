Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD125668;
	Sun, 30 Apr 2023 21:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682891628; x=1714427628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ZNi1o1cNtzXM4+PESdrHWugNPons1HxyiKCrpnndYE=;
  b=NfjAUy3QNURvFcD0QaV/+tveIGrBRReg2hUFra4/4F7kdJrhvrPdG2ON
   /XAiQolCqpL4TM79ujxDpCZHlynlhwfyyr2fgt5nG4Z7FH3TwmGOSbwgC
   HSPWVxlzRLa9OgehZNp5S1SG6kKSVqsxJKNpXwnutS/r/Qlggan/Uq2pS
   erXfzmbTw4kmNV97qzmytATiUNv9KGhgMU+QcyB7HbK9LLCkT4kJSfYKh
   JHbniAgZObQ/yAMnLjAljnFMI5S0WTsB/76VS50wSiZGFbbF+P701vEFR
   QXk00NDKmu9o7axl77YWJYy0/9Oz/1Fg6XZdLRFF0gN5TbI0NZGYQszjI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="327686825"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="327686825"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 14:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="785065392"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="785065392"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Apr 2023 14:53:46 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptEzK-000095-08;
	Sun, 30 Apr 2023 21:53:46 +0000
Date: Mon, 1 May 2023 05:53:25 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/new-api-tcx2 2/2] kernel/bpf/syscall.c:3597:3: error: use
 of undeclared identifier 'ret'
Message-ID: <202305010556.vBqHjwQi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/new-api-tcx2
head:   d965229f2cb3e8cd8584cc84edac281ba87e2b98
commit: d965229f2cb3e8cd8584cc84edac281ba87e2b98 [2/2] bpf: Add generic attach/detach/query API for multi-progs
config: riscv-randconfig-r042-20230430 (https://download.01.org/0day-ci/archive/20230501/202305010556.vBqHjwQi-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/cilium/linux/commit/d965229f2cb3e8cd8584cc84edac281ba87e2b98
        git remote add cilium https://github.com/cilium/linux.git
        git fetch --no-tags cilium pr/new-api-tcx2
        git checkout d965229f2cb3e8cd8584cc84edac281ba87e2b98
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010556.vBqHjwQi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/syscall.c:3597:3: error: use of undeclared identifier 'ret'
                   ret = sock_map_prog_detach(attr, ptype);
                   ^
   kernel/bpf/syscall.c:3600:3: error: use of undeclared identifier 'ret'
                   ret = lirc_prog_detach(attr);
                   ^
   kernel/bpf/syscall.c:3603:3: error: use of undeclared identifier 'ret'
                   ret = netns_bpf_prog_detach(attr, ptype);
                   ^
   kernel/bpf/syscall.c:3613:3: error: use of undeclared identifier 'ret'
                   ret = cgroup_bpf_prog_detach(attr, ptype);
                   ^
   kernel/bpf/syscall.c:3616:3: error: use of undeclared identifier 'ret'
                   ret = tcx_prog_detach(attr, prog);
                   ^
   kernel/bpf/syscall.c:3619:3: error: use of undeclared identifier 'ret'
                   ret = -EINVAL;
                   ^
   kernel/bpf/syscall.c:3623:9: error: use of undeclared identifier 'ret'
           return ret;
                  ^
   7 errors generated.


vim +/ret +3597 kernel/bpf/syscall.c

  3576	
  3577	static int bpf_prog_detach(const union bpf_attr *attr)
  3578	{
  3579		enum bpf_prog_type ptype;
  3580		struct bpf_prog *prog = NULL;
  3581	
  3582		if (CHECK_ATTR(BPF_PROG_DETACH))
  3583			return -EINVAL;
  3584	
  3585		ptype = attach_type_to_prog_type(attr->attach_type);
  3586		if (attr->attach_bpf_fd) {
  3587			if (ptype == BPF_PROG_TYPE_UNSPEC)
  3588				return -EINVAL;
  3589			prog = bpf_prog_get_type(attr->attach_bpf_fd, ptype);
  3590			if (IS_ERR(prog))
  3591				return PTR_ERR(prog);
  3592		}
  3593	
  3594		switch (ptype) {
  3595		case BPF_PROG_TYPE_SK_MSG:
  3596		case BPF_PROG_TYPE_SK_SKB:
> 3597			ret = sock_map_prog_detach(attr, ptype);
  3598			break;
  3599		case BPF_PROG_TYPE_LIRC_MODE2:
  3600			ret = lirc_prog_detach(attr);
  3601			break;
  3602		case BPF_PROG_TYPE_FLOW_DISSECTOR:
  3603			ret = netns_bpf_prog_detach(attr, ptype);
  3604			break;
  3605		case BPF_PROG_TYPE_CGROUP_DEVICE:
  3606		case BPF_PROG_TYPE_CGROUP_SKB:
  3607		case BPF_PROG_TYPE_CGROUP_SOCK:
  3608		case BPF_PROG_TYPE_CGROUP_SOCK_ADDR:
  3609		case BPF_PROG_TYPE_CGROUP_SOCKOPT:
  3610		case BPF_PROG_TYPE_CGROUP_SYSCTL:
  3611		case BPF_PROG_TYPE_SOCK_OPS:
  3612		case BPF_PROG_TYPE_LSM:
  3613			ret = cgroup_bpf_prog_detach(attr, ptype);
  3614			break;
  3615		case BPF_PROG_TYPE_SCHED_CLS:
  3616			ret = tcx_prog_detach(attr, prog);
  3617			break;
  3618		default:
  3619			ret = -EINVAL;
  3620		}
  3621		if (prog)
  3622			bpf_prog_put(prog);
  3623		return ret;
  3624	}
  3625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

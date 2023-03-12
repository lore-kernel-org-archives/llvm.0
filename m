Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9018E185F;
	Sun, 12 Mar 2023 07:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678605977; x=1710141977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ofVkJp9vgdN20m/Qa/Lmxn9tlv2r55W1dWO1u8kaJY=;
  b=MsOUCdAzwNAAQ1VZAULc2rQ+nv9Uskut7MIyH+pMhWa4zUkl3jdVjBhd
   GBuUwyztKt+ScUAZtEb7kLWJZA1Rf/jxab+hgo2O6WfoJaS6yCdhXPGAv
   KbUYY8KugkV6M3TMl3TjD5Q5txhaEjersgyaNECwPngfw7t6t46uzZ6PZ
   /BKk3vNfbmTANfUn6FT4b2OhegzQrmX5kXg/1kkgZA1eSlhiQxzgeT75Z
   VSYaZxtmHa01qja1WmfwpBoE5j5+duXqeq8KdxoxbPzwTOwvZlsPGYPMj
   4uoig6OO92SZng9+b5HYK2vVeP/4GraD97wv4mZq0w0IeyEsswv62KLbW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="335665563"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="335665563"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 23:26:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="924137772"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="924137772"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Mar 2023 23:26:15 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbG5v-000569-0p;
	Sun, 12 Mar 2023 07:26:15 +0000
Date: Sun, 12 Mar 2023 15:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi_4 1/10] ld.lld: error: duplicate symbol:
 bpf_uprobe_multi_link_attach
Message-ID: <202303121536.GCBiWy87-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi_4
head:   9d1680460291ce10458ce0adcd4859944fd7ada9
commit: aefd3dc75e104d9b49c8fe971eea78fabd70809e [1/10] bpf: Add multi uprobe link
config: hexagon-randconfig-r033-20230312 (https://download.01.org/0day-ci/archive/20230312/202303121536.GCBiWy87-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=aefd3dc75e104d9b49c8fe971eea78fabd70809e
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi_4
        git checkout aefd3dc75e104d9b49c8fe971eea78fabd70809e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303121536.GCBiWy87-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: bpf_uprobe_multi_link_attach
   >>> defined at main.c
   >>>            init/main.o:(bpf_uprobe_multi_link_attach) in archive vmlinux.a
   >>> defined at do_mounts.c
   >>>            init/do_mounts.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_uprobe_multi_link_attach
   >>> defined at main.c
   >>>            init/main.o:(bpf_uprobe_multi_link_attach) in archive vmlinux.a
   >>> defined at do_mounts_initrd.c
   >>>            init/do_mounts_initrd.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_uprobe_multi_link_attach
   >>> defined at main.c
   >>>            init/main.o:(bpf_uprobe_multi_link_attach) in archive vmlinux.a
   >>> defined at exec_domain.c
   >>>            kernel/exec_domain.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_uprobe_multi_link_attach
   >>> defined at main.c
   >>>            init/main.o:(bpf_uprobe_multi_link_attach) in archive vmlinux.a
   >>> defined at umh.c
   >>>            kernel/umh.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_uprobe_multi_link_attach
   >>> defined at main.c
   >>>            init/main.o:(bpf_uprobe_multi_link_attach) in archive vmlinux.a
   >>> defined at workqueue.c
   >>>            kernel/workqueue.o:(.text+0xF4) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_uprobe_multi_link_attach
   >>> defined at main.c
   >>>            init/main.o:(bpf_uprobe_multi_link_attach) in archive vmlinux.a
   >>> defined at pid.c
   >>>            kernel/pid.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_uprobe_multi_link_attach
   >>> defined at main.c
   >>>            init/main.o:(bpf_uprobe_multi_link_attach) in archive vmlinux.a
   >>> defined at exit.c
   >>>            kernel/exit.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_uprobe_multi_link_attach
   >>> defined at main.c
   >>>            init/main.o:(bpf_uprobe_multi_link_attach) in archive vmlinux.a
   >>> defined at softirq.c
   >>>            kernel/softirq.o:(.text+0x130) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_uprobe_multi_link_attach
   >>> defined at main.c
   >>>            init/main.o:(bpf_uprobe_multi_link_attach) in archive vmlinux.a
   >>> defined at sysctl.c
   >>>            kernel/sysctl.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_uprobe_multi_link_attach
   >>> defined at main.c
   >>>            init/main.o:(bpf_uprobe_multi_link_attach) in archive vmlinux.a
   >>> defined at mutex.c
   >>>            kernel/locking/mutex.o:(.text+0x18C) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_uprobe_multi_link_attach
   >>> defined at main.c
   >>>            init/main.o:(bpf_uprobe_multi_link_attach) in archive vmlinux.a
   >>> defined at fair.c
   >>>            kernel/sched/fair.o:(.text+0x0) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

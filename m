Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AE453B0
	for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 17:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660670100; x=1692206100;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Bmp5mCt8wJOGpNRRf+Bk/y7OpqN82x/tmy7rrb/kv5E=;
  b=QxC/gQQ6zOswGAy+LLIXBi+J5o7mjEB6ktPrCunnnQXRhWPKy8amDBSy
   J2GnB1Nc18DiNgbfjoNBFHws0X1cyrHe/07V8gZnHPm5hly/2Vuc/P+wr
   RiZ1hNpbsuqBk7lpRM9B+JHJQrokI1NwwaBdfeAivIYlCjOxEYjAEAvC9
   PsAF5DZuGx1F5Np74USkJGCKR8kYlMDVsXpQzYF6PVEY+plx/NRkFq8dX
   B9AURQB/ll6h60H+avvOur4hIXEYs00/pC3gg0O+xL4eY28E/+tl5qOUt
   64JkcknbXfwU3vCYDAUa7ppwa6EIRiDtjQCQz5T8E885U9VdV6MopGQKu
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="292276706"
X-IronPort-AV: E=Sophos;i="5.93,241,1654585200"; 
   d="scan'208";a="292276706"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 10:14:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,241,1654585200"; 
   d="scan'208";a="635971895"
Received: from lkp-server02.sh.intel.com (HELO 81d7e1ade3ba) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Aug 2022 10:14:58 -0700
Received: from kbuild by 81d7e1ade3ba with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oO09Z-00006K-2T;
	Tue, 16 Aug 2022 17:14:57 +0000
Date: Wed, 17 Aug 2022 01:14:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:linux-5.18.y 2197/3591] vmlinux.o: warning:
 objtool: entry_SYSCALL_compat()+0x0: ANNOTATE_NOENDBR on ENDBR
Message-ID: <202208170117.lGAJUk8f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Borislav Petkov <bp@suse.de>
CC: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.18.y
head:   56bd9e4c28e9ed65e07e7148e65adfdf1f1c5524
commit: 813423f90f0553c81c5fb4d531fc688a5d506b24 [2197/3591] x86/retbleed: Add fine grained Kconfig knobs
config: x86_64-randconfig-a013-20220815 (https://download.01.org/0day-ci/archive/20220817/202208170117.lGAJUk8f-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3bea138ce581d682158eb61c27b3cfdd6ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=813423f90f0553c81c5fb4d531fc688a5d506b24
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.18.y
        git checkout 813423f90f0553c81c5fb4d531fc688a5d506b24
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: entry_SYSCALL_compat()+0x0: ANNOTATE_NOENDBR on ENDBR
   vmlinux.o: warning: objtool: ibt_selftest()+0xf: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ibt_selftest()+0x19: return with modified stack frame


objdump-func vmlinux.o entry_SYSCALL_compat:
0000 0000000000002580 <entry_SYSCALL_compat>:
0000     2580:	f3 0f 1e fa          	endbr64
0004     2584:	0f 01 f8             	swapgs
0007     2587:	41 89 e0             	mov    %esp,%r8d
000a     258a:	48 8b 24 25 00 00 00 00 	mov    0x0,%rsp	258e: R_X86_64_32S	cpu_current_top_of_stack

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

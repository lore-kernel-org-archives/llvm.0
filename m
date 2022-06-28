Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78137A
	for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 00:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656377594; x=1687913594;
  h=date:from:cc:subject:message-id:mime-version;
  bh=T2VIk1t0XemRCMU09PVblre091P/Ulwu6m1TpOXeii0=;
  b=DyR6ahGro+Ni/X5qD7/weGoJfg+I88GQ9JxkI3ukvUeHUKZxgHXD0qQR
   zB0UXCx2V4GPMsMtTsPw+2FUV5aUVn0zWAWAThOEI1xtR+jSU7eFoXrng
   C+b9/LXQF3UL5/LLgFD5pVrDh8YTa7JXZ5oN8X3iyjF8WGlf8t4VKAkv6
   SlVD8mLrT5Ba5kwn3aXaDODDgpz2+evt/be4B5xQJ7wcqaG30QvOsslr6
   0gaEGYIKFLdAstpvPZn6trC2bg13nWUCYqydCR2jpIm8GlOivK7/WZGC9
   J+9IwVDBV8+H2SAcWz9aKtNhFgZsYq4MVPtaILc5hN+OjBUK26pICDnY3
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="367911678"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="367911678"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 17:53:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="594544134"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Jun 2022 17:53:11 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o5zTb-0009Is-9G;
	Tue, 28 Jun 2022 00:53:11 +0000
Date: Tue, 28 Jun 2022 08:52:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 4209/5792] vmlinux.o: warning: objtool:
 __ct_user_enter+0x71: call to __kasan_check_write() leaves .noinstr.text
 section
Message-ID: <202206280854.HQ8PLVn6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Paul E. McKenney" <paulmck@kernel.org>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aab35c3d5112df6e329a1a5a5a1881e5c4ca3821
commit: 22a297887c103cd0a9a251e546cef7f181bd8ce8 [4209/5792] context_tracking: Use arch_atomic_read() in __ct_state for KASAN
config: x86_64-randconfig-r001-20220627 (https://download.01.org/0day-ci/archive/20220628/202206280854.HQ8PLVn6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 016342e319fd31e41cf5ed16a6140a8ea2de74dd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=22a297887c103cd0a9a251e546cef7f181bd8ce8
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 22a297887c103cd0a9a251e546cef7f181bd8ce8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: sync_regs+0x1f: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x21: call to memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __ct_user_enter+0x71: call to __kasan_check_write() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __ct_user_exit+0x46: call to __kasan_check_write() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

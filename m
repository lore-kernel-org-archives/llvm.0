Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65543C22
	for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 14:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657720802; x=1689256802;
  h=date:from:cc:subject:message-id:mime-version;
  bh=/ee2+lTXtfDOutIMvLiuoY4uSXYxh1B6nZZ+zrCwSxo=;
  b=n0tgGcl9C9G33/XX96LtLFTsEWsqDuwgDm83OSBNEGuSOUIG/eN0KGU4
   UuwZG78W+OXfptBn2EWfxC5+KKUNKRjsXhXkwF7j17yUbXuXU/vKwT8jX
   3r0ubqWyIRbPqfpF4WKicoi2PA11J+azxw9J+rLcQvT7fz6/T8M4rgpet
   9uN2c1KVXxIBOwL6RaxSXciTty1ZBd6E9I3+fFQ6Ix/7GVbRt3mmvRvCt
   om6WDZEISj7m3R/YxLQe7c6Y4jPbVUZZl9Dg27fXy+QOhui1zDABQ/UiK
   PDT/kQAsDxrPs1IMWnNKggMmwilrxLGtEL1U2L4WzPGohTDg2BWj6to5F
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="285960828"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="285960828"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2022 07:00:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="653390953"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 13 Jul 2022 07:00:01 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oBcuG-0003Zb-Gm;
	Wed, 13 Jul 2022 14:00:00 +0000
Date: Wed, 13 Jul 2022 21:59:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [ammarfaizi2-block:stable/linux-stable-rc/queue/5.10 7/131]
 arch/x86/kernel/ftrace_64.o: warning: objtool: ftrace_epilogue()+0x10:
 unreachable instruction
Message-ID: <202207132104.LBoWBvHb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@redhat.com>
CC: Sasha Levin <sashal@kernel.org>
CC: Ben Hutchings <bwh@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://github.com/ammarfaizi2/linux-block stable/linux-stable-rc/queue/5.10
head:   b71540e087227d4d16249de8c938a6939614cf9d
commit: c0ca872884e42adc30279b740b2cc98a7fcc1124 [7/131] objtool: Assume only ELF functions do sibling calls
config: x86_64-randconfig-k001 (https://download.01.org/0day-ci/archive/20220713/202207132104.LBoWBvHb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e60b4fb2b777118c0ff664a6347851df14fcf75b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/c0ca872884e42adc30279b740b2cc98a7fcc1124
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block stable/linux-stable-rc/queue/5.10
        git checkout c0ca872884e42adc30279b740b2cc98a7fcc1124
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/ftrace_64.o: warning: objtool: ftrace_epilogue()+0x10: unreachable instruction


objdump-func vmlinux.o ftrace_epilogue:
0000 000000000005dee0 <ftrace_epilogue>:
0000    5dee0:	e9 00 00 00 00       	jmp    5dee5 <ftrace_epilogue+0x5>	5dee1: R_X86_64_PLT32	ftrace_stub-0x4
0005    5dee5:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

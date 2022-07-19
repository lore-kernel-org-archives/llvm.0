Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876A71C04
	for <llvm@lists.linux.dev>; Tue, 19 Jul 2022 13:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658235760; x=1689771760;
  h=date:from:cc:subject:message-id:mime-version;
  bh=hTTnQDGg5BYxjZ3w6khjGuRbcAxQHHQREDW4mn3oXbw=;
  b=fEee9fhmfCDjBtlFY7FIVmabML0rDgx1KKGsmCmUg8qc/CEM0yTSe2L0
   GU10db4bYoEie8H8mMP86JoH+WHfgpCXuf8yr7mRUYwQw/sYdLLVTJQVU
   VZQg4C+xGPjsn/dj9E7AeuySBqVJX2XZ1Ot7aL+QBUddrKVhMDGnx4Sih
   1rsW2MrW/SgbDQPS5PYOD+AF3P7imr0iLoYUJ6IASq4DWTISDLSzo+Raa
   ceHCO91u7EYFd7oHdiZabklmp2HFtUdMLcI4mFju/wr3ndA1xAMhCEnXk
   bqVLufzWj1V6Jl4OQzaXtEu/MRpAq0bJPYPjf8fSvGcGSLnUXh5BmG//G
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="312172189"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; 
   d="scan'208";a="312172189"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 06:02:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; 
   d="scan'208";a="630321917"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Jul 2022 06:02:14 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDmrd-0005fK-CD;
	Tue, 19 Jul 2022 13:02:13 +0000
Date: Tue, 19 Jul 2022 21:01:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x5d: relocation to
 !ENDBR: machine_kexec_prepare+0x532
Message-ID: <202207192027.8iVnGfUz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Borislav Petkov <bp@suse.de>
CC: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ca85855bdcae8f84f1512e88b4c75009ea17ea2f
commit: 1f001e9da6bbf482311e45e48f53c2bd2179e59c x86/ftrace: Use alternative RET encoding
date:   3 weeks ago
config: x86_64-randconfig-a002-20220718 (https://download.01.org/0day-ci/archive/20220719/202207192027.8iVnGfUz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fa0c7639e91fa1cd0cf2ff0445a1634a90fe850a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1f001e9da6bbf482311e45e48f53c2bd2179e59c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1f001e9da6bbf482311e45e48f53c2bd2179e59c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: balance_leaf+0xe70e: stack state mismatch: cfa1=4+400 cfa2=4+416
   vmlinux.o: warning: objtool: leaf_move_items+0xf9a: stack state mismatch: cfa1=4+160 cfa2=4+152
   vmlinux.o: warning: objtool: leaf_copy_boundary_item+0x36b2: stack state mismatch: cfa1=4+240 cfa2=4+232
   vmlinux.o: warning: objtool: leaf_copy_items_entirely+0xd46: stack state mismatch: cfa1=4+256 cfa2=4+248
   vmlinux.o: warning: objtool: balance_internal+0x4e40: stack state mismatch: cfa1=4+312 cfa2=4+320
   vmlinux.o: warning: objtool: internal_move_pointers_items+0x7a5: stack state mismatch: cfa1=4+224 cfa2=4+240
   vmlinux.o: warning: objtool: sync_regs+0x23: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x25: call to memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x5d: relocation to !ENDBR: machine_kexec_prepare+0x532

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

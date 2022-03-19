Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F47180
	for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 12:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647691700; x=1679227700;
  h=date:from:cc:subject:message-id:mime-version;
  bh=fsdOpu4E1VDrex2kEc26/QMpoeQUDqyvg2gIXOKFYXU=;
  b=j5OX88JcwB0DdsBgEHH+GfxXuifrxWnllGQyMTLyoTXqb1ZfiHpSIzR2
   c1dhACG9YFmfXO5r0G1d5bl6Ewb+sgh20UHhPEURZXFyVWh2F8bQLYAzK
   2Q5uDvcbEatq8L/+b3fSuYx7PoCGKAEeyTXYvUuZyJ68AMOrrbo/3Uvkd
   7abOv1Fc0IYH+laDVcBS4xwlKZ6nXMS7s/HTnxdb9vSkTp7OyZvrjGWUL
   zcIRti/+P/lVENtCyNEdUp5t96xG+dgnBtpAeJ3AQ0sHUYrgwWQ3ArAUx
   oGqmvdaST7DjoT63MOyOjqSBM24os7T8C/6Izsga/6SbjDjUPlC/BOgqv
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="257019427"
X-IronPort-AV: E=Sophos;i="5.90,194,1643702400"; 
   d="scan'208";a="257019427"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2022 05:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,194,1643702400"; 
   d="scan'208";a="542383730"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Mar 2022 05:08:19 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nVXsY-000Fx7-LX; Sat, 19 Mar 2022 12:08:18 +0000
Date: Sat, 19 Mar 2022 20:07:19 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [tip:x86/core 53/53] arch/x86/crypto/chacha-x86_64.prelink.o:
 warning: objtool: chacha_2block_xor_avx512vl() falls through to next
 function chacha_8block_xor_avx512vl()
Message-ID: <202203192005.hZMAnkDH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/core
head:   2f35e67f621fffc636cb802a4f93fd168cf38274
commit: 2f35e67f621fffc636cb802a4f93fd168cf38274 [53/53] kbuild: Fixup the IBT kbuild changes
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20220319/202203192005.hZMAnkDH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e4056dff962ec634c5bd4f2f4105a0bef71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=2f35e67f621fffc636cb802a4f93fd168cf38274
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip x86/core
        git checkout 2f35e67f621fffc636cb802a4f93fd168cf38274
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/crypto/chacha-x86_64.prelink.o: warning: objtool: chacha_2block_xor_avx512vl() falls through to next function chacha_8block_xor_avx512vl()
>> arch/x86/crypto/chacha-x86_64.prelink.o: warning: objtool: chacha_4block_xor_avx512vl() falls through to next function chacha_8block_xor_avx512vl()
--
>> arch/x86/crypto/poly1305-x86_64.prelink.o: warning: objtool: poly1305_blocks_avx() falls through to next function poly1305_blocks_x86_64()
>> arch/x86/crypto/poly1305-x86_64.prelink.o: warning: objtool: poly1305_emit_avx() falls through to next function poly1305_emit_x86_64()
>> arch/x86/crypto/poly1305-x86_64.prelink.o: warning: objtool: poly1305_blocks_avx2() falls through to next function poly1305_blocks_x86_64()
>> arch/x86/crypto/poly1305-x86_64.prelink.o: warning: objtool: poly1305_blocks_avx512() falls through to next function poly1305_blocks_x86_64()

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

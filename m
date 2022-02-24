Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2C0184D
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 09:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645696401; x=1677232401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CYRIDdp9DfLLgliDckqKxr1/trJ76a0IiZvbqZYWbu0=;
  b=JLridhCLM/lSEiOcIJXk2Zqs3eLO8gBYH0L6Tz9C8aSmO7GsSS5Wgf81
   B6PFCKIf8i56PEkQH4MvWFbsjq5djm0003YgtpeGrzZQ6HXz4H/ci+kNs
   dr6tCRpc7JEEjr+xhpNQa9ZqBB9qeZlDP6JTQjn5zU6zrVtFyv2+I1Ai2
   Jz05V+4iVFiHUcpKHFu7rvNlTHbPTV3+s3QYR8xbOmEEoyPJuITWTZdyl
   1/JJQsoii0IdYQbvuC7xLhsuU16F5Zz+ejUXgLxeywvFcjOfM/VWK88Gg
   BQTJk290/XZzIs2iBXFzHz5T/NfOs2VF4SRParOyX5FVooGt2qvVXayoH
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="251929847"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; 
   d="scan'208";a="251929847"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 01:53:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; 
   d="scan'208";a="684223536"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2022 01:53:19 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nNAoI-0002yZ-I9; Thu, 24 Feb 2022 09:53:18 +0000
Date: Thu, 24 Feb 2022 17:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [peterz-queue:x86/wip.ibt 27/42] arch/x86/lib/error-inject.c:15:3:
 error: expected ')'
Message-ID: <202202241727.G6Jrx2wZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/wip.ibt
head:   27b6438f414b6a37b60dcd90c8980397586d49db
commit: 894eca106331b66d8f1c261d40386c043da75ee2 [27/42] x86/ibt: Annotate text references
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220224/202202241727.G6Jrx2wZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=894eca106331b66d8f1c261d40386c043da75ee2
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/wip.ibt
        git checkout 894eca106331b66d8f1c261d40386c043da75ee2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/lib/error-inject.c:15:3: error: expected ')'
                   ANNOTATE_NOENDBR
                   ^
   arch/x86/lib/error-inject.c:10:4: note: to match this '('
   asm(
      ^
   1 error generated.


vim +15 arch/x86/lib/error-inject.c

     9	
    10	asm(
    11		".text\n"
    12		".type just_return_func, @function\n"
    13		".globl just_return_func\n"
    14		"just_return_func:\n"
  > 15			ANNOTATE_NOENDBR
    16			ASM_RET
    17		".size just_return_func, .-just_return_func\n"
    18	);
    19	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

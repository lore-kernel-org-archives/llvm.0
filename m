Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741EB4A0A
	for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 19:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657740194; x=1689276194;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Q7KHB3M2QFV9b5Jvr54Kwg9Kzv2u1pwotvnqqbVJQAU=;
  b=jnB3r64t5I8tbkbLFniNPh4ffuufsVBJWKRGiWc9V0RWrDUGPaUn5uua
   Gpo7sDy0Zs8futQyeiG2XbaYfMQAeWH9+9y7rXg/cAgGuSu9NXsLyZzoh
   KVp/o6sFIl8d4S/7KMdKt65FocUy9d8Z0EgG/cPSrM1Jjd0i5XSZrWKE1
   zmqEuOLwwKDsckTklq7DMVF46Ndr32sX0QjOS/Seaete5rIVJS3Z4RKJ8
   Y9WtLXTnwrzHkGPSsKfcGLJSIBK6xjQZMCVbI9k4fE1Yj2NEL3tlgTLYo
   7CeFs5HiPQjcsre1kzY0GCTfLDseaSE4lFNC/WDf9OZA0VPSrq5k/Ocnb
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="310969829"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="310969829"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2022 12:22:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="653536973"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 13 Jul 2022 12:22:07 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oBhvz-0003k7-4L;
	Wed, 13 Jul 2022 19:22:07 +0000
Date: Thu, 14 Jul 2022 03:21:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: entry_SYSCALL_compat+0x0:
 ANNOTATE_NOENDBR on ENDBR
Message-ID: <202207140331.eI1PiJAM-lkp@intel.com>
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
head:   b047602d579b4fb028128a525f056bbdc890e7f0
commit: 2dbb887e875b1de3ca8f40ddf26bcfe55798c609 x86/entry: Add kernel IBRS implementation
date:   2 weeks ago
config: x86_64-randconfig-r005-20220627 (https://download.01.org/0day-ci/archive/20220714/202207140331.eI1PiJAM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e60b4fb2b777118c0ff664a6347851df14fcf75b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2dbb887e875b1de3ca8f40ddf26bcfe55798c609
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2dbb887e875b1de3ca8f40ddf26bcfe55798c609
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: entry_SYSCALL_compat+0x0: ANNOTATE_NOENDBR on ENDBR
   vmlinux.o: warning: objtool: ibt_selftest+0xf: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ibt_selftest+0x19: return with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

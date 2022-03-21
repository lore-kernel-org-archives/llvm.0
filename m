Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47477B
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 01:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647826884; x=1679362884;
  h=date:from:cc:subject:message-id:mime-version;
  bh=P19E82ir2OYglaxn/pEvs6xZVHrxYCTe1/f7/EVVDXI=;
  b=NK3LCJJQd2bj8oR6C7CJBZ0YlwosgBy0fFer7gHJ09BaolYa2SAITlFc
   TekC+HFOwjOqT/V681mYGc+hjQkBidFZnzZoPClyZjag19Mqe+hWej9wS
   tV3xVQEwsPwS9OpC+LbdwYpi8CeQ/L9oxv9F1B4r7o04QrCGlPvievNZA
   LQ8kWSMCumj3TnmGChCv5zOCLl/7CAyTCmE0lWGXLh1VMizkAUZDlqPbQ
   zo3c/HByQrCIjDolyDwZ/X5P5bkmpj/mNm382Tqi/xlU/MDqkKhhWeWVP
   CExW+1fOzIMRWogiEq40O/hCtCc5IPY440ii7+1NmcnR16Ibof23j0AEH
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="282271336"
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; 
   d="scan'208";a="282271336"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2022 18:41:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; 
   d="scan'208";a="716307032"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Mar 2022 18:41:22 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nW72w-000HMa-7T; Mon, 21 Mar 2022 01:41:22 +0000
Date: Mon, 21 Mar 2022 09:40:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: __sev_get_ghcb()+0x69: call to memcpy()
 leaves .noinstr.text section
Message-ID: <202203210940.KXe0q36h-lkp@intel.com>
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
TO: Joerg Roedel <jroedel@suse.de>
CC: Borislav Petkov <bp@suse.de>

Hi Joerg,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f443e374ae131c168a065ea1748feac6b2e76613
commit: d187f217335dba2b49fc9002aab2004e04acddee x86/sev: Make sure IRQs are disabled while GHCB is active
date:   9 months ago
config: x86_64-buildonly-randconfig-r004-20220321 (https://download.01.org/0day-ci/archive/20220321/202203210940.KXe0q36h-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d187f217335dba2b49fc9002aab2004e04acddee
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d187f217335dba2b49fc9002aab2004e04acddee
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: sync_regs()+0x24: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vc_switch_off_ist()+0xe: call to ip_within_syscall_gap() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi()+0x18: call to __kasan_check_read() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x30: call to __memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __sev_get_ghcb()+0x69: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __sev_put_ghcb()+0x61: call to __memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: debug_locks_off()+0x19: call to __kasan_check_write() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

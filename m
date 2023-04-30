Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BAE3C10;
	Sun, 30 Apr 2023 20:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682884845; x=1714420845;
  h=date:from:cc:subject:message-id:mime-version;
  bh=RhMdN84oN1pvp2vzbOOcHYCvsO/1ta+cdPZbwSdpVTU=;
  b=L1pf4U5rsmUDYufLtmj3uYBLjVV0roQ0mXO1waEf/q53UrOel5qGgpwL
   EUOmVxAjBuKVm8bQ8VbNNgiykMa3iJ4MJs3TCHGehGVkvh3TKQwj1I9Dq
   I4fwnqWQ2V6CjBMrsd/qE1geZCSo0k3X10PXygB9hWgiLFSJlB5NxoEi9
   bg6wyJzsoeXL6xtjur/lTdaQkYhbWMNtNcIBsgSNTxglIkOYG24hB5QCy
   SRLhylU267DvggKf9/p+qxrjYpAiveOvmfTmNK6LTpzOICJLyszT/PaqF
   1apbHF+phxO0QwVWBygsWvEYa+SY6ON9ymEBWEznR0DhzxQRhe/JAUKVq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="337164336"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="337164336"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 13:00:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="689680866"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="689680866"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Apr 2023 13:00:44 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptDDv-00006X-1A;
	Sun, 30 Apr 2023 20:00:43 +0000
Date: Mon, 1 May 2023 03:59:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: fs/reiserfs/do_balan.o: warning: objtool: replace_key+0x147: stack
 state mismatch: cfa1=4+32 cfa2=4+48
Message-ID: <202305010327.BfHZv8FK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Vlastimil Babka <vbabka@suse.cz>
CC: Christoph Lameter <cl@linux-foundation.org>

Hi Vlastimil,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   825a0714d2b3883d4f8ff64f6933fb73ee3f1834
commit: e240e53ae0abb0896e0f399bdfef41c69cec3123 mm, slub: add CONFIG_SLUB_TINY
date:   5 months ago
config: x86_64-randconfig-a015-20230501 (https://download.01.org/0day-ci/archive/20230501/202305010327.BfHZv8FK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e240e53ae0abb0896e0f399bdfef41c69cec3123
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e240e53ae0abb0896e0f399bdfef41c69cec3123
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010327.BfHZv8FK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/reiserfs/do_balan.o: warning: objtool: replace_key+0x147: stack state mismatch: cfa1=4+32 cfa2=4+48
   fs/reiserfs/do_balan.o: warning: objtool: balance_leaf+0x3b99: stack state mismatch: cfa1=4+304 cfa2=4+320


objdump-func vmlinux.o replace_key:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6989A3D65
	for <llvm@lists.linux.dev>; Wed,  1 Jun 2022 22:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654121666; x=1685657666;
  h=date:from:cc:subject:message-id:mime-version;
  bh=sDpGTaZKD6JbHrh0tUHx5myLqINQGRTC+NLw/EBNAhU=;
  b=addHi4fIU8ygW3thjHow1aZ31OS26YxNxXV7J6rNZoLWl7J/3nYdLzQB
   0TZvcH0aTJslDm4gphS3CiqD7itK2UAi6djkTgnE9iB3uewZTNaXQU7Cg
   uxYKwsbA+H6Qu8YK9hL9/06UKVUgy5+I6ReP/9iVz9oe2xObZQbxqFi3W
   4VDKYprIjx+SL8eFfPd4UAi+UWjxD0oF98Vd3uoGzpCZCBiBH2ju9+CSs
   /bDShq9iPj6ltgpAPm5hOe+h2givUzogx0CsCcrdxZkxB4ZUjnqSib+RP
   kUsTELkpX5JZ37verPvQDLZ0ZGMBuRujoNPVj2ieCIdVdhbbO3zY9dASs
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="275472491"
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; 
   d="scan'208";a="275472491"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 15:14:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; 
   d="scan'208";a="577172339"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Jun 2022 15:14:25 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwWbg-0004T0-I8;
	Wed, 01 Jun 2022 22:14:24 +0000
Date: Thu, 2 Jun 2022 06:14:01 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0xd4):
 relocation R_HEX_B22_PCREL out of range: 2247556 is not in [-2097152,
 2097151]; references __vmnewmap
Message-ID: <202206020645.r9xnn095-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Kees Cook <keescook@chromium.org>

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8eca6b0a647aabea3d1d2907dd6245fc436f98e7
commit: 606b102876e3741851dfb09d53f3ee57f650a52c drm: fb_helper: fix CONFIG_FB dependency
date:   8 months ago
config: hexagon-randconfig-r033-20220531 (https://download.01.org/0day-ci/archive/20220602/202206020645.r9xnn095-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=606b102876e3741851dfb09d53f3ee57f650a52c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 606b102876e3741851dfb09d53f3ee57f650a52c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0xd4): relocation R_HEX_B22_PCREL out of range: 2247556 is not in [-2097152, 2097151]; references __vmnewmap
   >>> defined in arch/hexagon/built-in.a(kernel/vm_ops.o)
--
>> ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0x12c): relocation R_HEX_B22_PCREL out of range: 2247428 is not in [-2097152, 2097151]; references __vmsetvec
   >>> defined in arch/hexagon/built-in.a(kernel/vm_ops.o)
--
>> ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0x160): relocation R_HEX_B22_PCREL out of range: 2257888 is not in [-2097152, 2097151]; references memset
   >>> defined in arch/hexagon/built-in.a(lib/memset.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

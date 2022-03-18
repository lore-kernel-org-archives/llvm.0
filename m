Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01905137
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 21:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647640251; x=1679176251;
  h=date:from:cc:subject:message-id:mime-version;
  bh=N0aSDa/ktHiqeAHzVVnNbOCQmIBiyH2xATzg3F1uQcw=;
  b=TFKAfpfOn8vAYcbm17ZOLyc4Wl5OkT0Tk0mjDE8ObjwxAyWmV4H4mIxc
   XJPKlkKgn4E60JuijpH2Jkr0MK9znybbcm6C/UrnCH5rIhMlO0cMPseCL
   uKbO8GOYWKXDPaZ5IF9VqePPFEeUKskH5Vx5WNSr2dMfIKLWS+STXrFPB
   LVIApNyu3lqxCHWIRC4oSb4oDo33py0ELAC0zZF0fnb4q29EYFg6vrmIw
   UeTzBQobhayUuLsVpxT1qre19HgALGTt5c2rsYU/SboVzmT57PUgwC7k9
   rpEwqoNgzDlAzHI+vingcypxSEEkAB1BJ0rNEgRbc/T6ahCWPwPseh0VB
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="237843660"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="237843660"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 14:50:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="542055110"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Mar 2022 14:50:50 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nVKUj-000FBX-Ev; Fri, 18 Mar 2022 21:50:49 +0000
Date: Sat, 19 Mar 2022 05:50:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [tip:x86/core 53/53] fs/reiserfs/reiserfs.prelink.o: warning:
 objtool: balance_leaf()+0x58d6: stack state mismatch: cfa1=4+328 cfa2=4+320
Message-ID: <202203190557.ID8l4Z9T-lkp@intel.com>
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
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/20220319/202203190557.ID8l4Z9T-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/reiserfs/reiserfs.prelink.o: warning: objtool: balance_leaf()+0x58d6: stack state mismatch: cfa1=4+328 cfa2=4+320
>> fs/reiserfs/reiserfs.prelink.o: warning: objtool: leaf_copy_items_entirely()+0x4f1: stack state mismatch: cfa1=4+184 cfa2=4+176

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D139F33C4
	for <llvm@lists.linux.dev>; Mon,  4 Jul 2022 13:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656939941; x=1688475941;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ueQU69LnbdXVvK2KioJk6aBCBfBxt67ZPvzTXXRdHGI=;
  b=GY5wWGR5VRGrFYOwrlVz1BXS2a8RWnd26m0Kl2CX1+ZKVa/4CnZiVFny
   Oo/ebAli0iF1ASDeLOO3k0XBTtMjv1dnvMiXjmo2KHOadyc7Uxu9pIqxH
   k1XYRA1p9z5f2wZqUVnGxdyQtpQvUfO/Si51glQe5RsC8YBkw5PgaATY6
   Nuo+dG4DP+HJ4eptFG5a/pRBn9SrHhc3H2/QwesHhE1YNMXpHmZqSOsQ4
   BTeNKohEmNIu7wApSvV/pRegJcko2OlfvFjd/rsBUWUGsnDAFeRlQYkRI
   Mc+l1+UwQLnm/CUvz6Sv01N+P++AwaUkY3PHGU64F9g/Mq0/xStJKcP/t
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="284234766"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="284234766"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2022 06:05:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="619287221"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Jul 2022 06:05:30 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o8Lla-000Htj-2R;
	Mon, 04 Jul 2022 13:05:30 +0000
Date: Mon, 4 Jul 2022 21:05:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [stable:linux-5.15.y 972/8135] fs/reiserfs/ibalance.o: warning:
 objtool: internal_delete_pointers_items()+0x576: stack state mismatch:
 cfa1=4+144 cfa2=4+152
Message-ID: <202207042016.F9az6QLD-lkp@intel.com>
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
TO: Kees Cook <keescook@chromium.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   545aecd229613138d6db54fb2b5221faca10137f
commit: 8d0956438eecfafbefb7cd15b7773087549b38d4 [972/8135] fortify: Explicitly disable Clang support
config: x86_64-randconfig-a011-20220704 (https://download.01.org/0day-ci/archive/20220704/202207042016.F9az6QLD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f7a80c3d08d4821e621fc88d6a2e435291f82dff)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=8d0956438eecfafbefb7cd15b7773087549b38d4
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 8d0956438eecfafbefb7cd15b7773087549b38d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/reiserfs/ibalance.o: warning: objtool: internal_move_pointers_items()+0x746: stack state mismatch: cfa1=4+208 cfa2=4+200
>> fs/reiserfs/ibalance.o: warning: objtool: internal_delete_pointers_items()+0x576: stack state mismatch: cfa1=4+144 cfa2=4+152

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

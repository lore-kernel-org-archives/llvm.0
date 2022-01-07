Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E5129CA
	for <llvm@lists.linux.dev>; Fri,  7 Jan 2022 09:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641546062; x=1673082062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j7A4O0UTzUY86Hb7QTpTewvFDFLlSiE7gOqw7j3u7a8=;
  b=VCVn5d8y9sJRIeTvrcjvQTjn5fsudvcwj0tMUKlUSS6Qx04pXFQEYNUm
   dCwOZXjt2yRNXI7qkfv0okgfjNgDO7GKSKFgHxrk6SePMQSgXVbrliVcz
   Db/7dFF5/yjjfs3dcpvS8Yzlih+kRZRUzMQRGlgOfxnd7YntfqAsOMHBH
   QOKWDYXvnzX3euAMSJuGkO89bgyPl3qd7HIZraIuXIa8HGefsUX4H0rc3
   iMWEIreZgfYDtdkNaSC8oFGOjlv4nwU057gbnRNtwFks3Z7Vo396UhOsr
   vAD2akbyRwMn+Rhc164s3j6/D07dcqbIyvHfx6277vWzVnAMEmi0e4Wk/
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="230177252"
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; 
   d="scan'208";a="230177252"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2022 01:00:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; 
   d="scan'208";a="612131053"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Jan 2022 01:00:46 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5l77-000ITc-Pn; Fri, 07 Jan 2022 09:00:45 +0000
Date: Fri, 7 Jan 2022 17:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Collingbourne <pcc@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: mm/kasan/sw_tags.c:211:6: warning: no previous prototype for
 function 'kasan_tag_mismatch'
Message-ID: <202201071631.N1iQYfX7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ddec8ed2d4905d0967ce2ec432e440e582aa52c6
commit: 1cbdf60bd1b74e397d48aa877367cfc621f45ffe kasan: arm64: support specialized outlined tag mismatch checks
date:   8 months ago
config: arm64-randconfig-r021-20220107 (https://download.01.org/0day-ci/archive/20220107/202201071631.N1iQYfX7-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167bfe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1cbdf60bd1b74e397d48aa877367cfc621f45ffe
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1cbdf60bd1b74e397d48aa877367cfc621f45ffe
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash mm/kasan/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/kasan/sw_tags.c:211:6: warning: no previous prototype for function 'kasan_tag_mismatch' [-Wmissing-prototypes]
   void kasan_tag_mismatch(unsigned long addr, unsigned long access_info,
        ^
   mm/kasan/sw_tags.c:211:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void kasan_tag_mismatch(unsigned long addr, unsigned long access_info,
   ^
   static 
   1 warning generated.


vim +/kasan_tag_mismatch +211 mm/kasan/sw_tags.c

   210	
 > 211	void kasan_tag_mismatch(unsigned long addr, unsigned long access_info,

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

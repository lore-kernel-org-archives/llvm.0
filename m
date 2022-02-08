Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146E02F26
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 10:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644315320; x=1675851320;
  h=date:from:cc:subject:message-id:mime-version;
  bh=zOZg8Ag9avYWdJ7dxOVlyhUozamA2VpOY+meqkpwN4k=;
  b=Ke8JtFcfj7WWr0l24ScqBwuvUpqhtmtltxbbrmqirUqxNbqoEuZeiPGE
   rM/Yom/7qtycvl9bZw9sRlOqfvWqt2Dc/todHtmNIVN9rob7tHhj18NOl
   ifE9uwo6lo2hFpoOxQSlCSmQjZEyqb+x+KusgDBI8iUuc0hlULVdN0Anp
   s4LoNALs88WMgedLhd86Si/FzfkCsjWDDB/NTfg3g+Ug0UbY1wN5mmjXx
   SvOi53aej7dv01EUe8oejSrSrUL/Zk7ump9ZbuW357ueJMlwCPjr/DOKy
   EOhrOLpA71rY4N70oYLmrAptXWjVU2cobu+t4PNDsb3Kk/iLNisceEHr4
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="248682240"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; 
   d="scan'208";a="248682240"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 02:15:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; 
   d="scan'208";a="632800778"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Feb 2022 02:15:18 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHNWn-00001U-H9; Tue, 08 Feb 2022 10:15:17 +0000
Date: Tue, 8 Feb 2022 18:14:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [bpf-next:master 214/221] arch/x86/kernel/alternative.o: warning:
 objtool: text_poke_copy()+0x83: unreachable instruction
Message-ID: <202202081833.UR8dczjA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Song Liu <song@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   5d1e9f437df5ef21e7567f1970a00fda3b5d1126
commit: 0e06b40371682b6b70ed0302a7baec0698ada95c [214/221] x86/alternative: Introduce text_poke_copy
config: x86_64-buildonly-randconfig-r002-20220207 (https://download.01.org/0day-ci/archive/20220208/202202081833.UR8dczjA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=0e06b40371682b6b70ed0302a7baec0698ada95c
        git remote add bpf-next https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
        git fetch --no-tags bpf-next master
        git checkout 0e06b40371682b6b70ed0302a7baec0698ada95c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/alternative.o: warning: objtool: text_poke_copy()+0x83: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

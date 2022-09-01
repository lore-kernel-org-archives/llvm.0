Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9838CA48
	for <llvm@lists.linux.dev>; Thu,  1 Sep 2022 20:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662064918; x=1693600918;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ERLTDOZ304228OPpSL1srOxbym/dJAasDRF9uKAql6k=;
  b=IYRFVXh67ixcNZcPq+9lF6Kid2YDQ8Q291XkcpNLhs/GZQnHVL9kaBN8
   HOgPwDHj2R3gad3pFKUz0MDP+qQbxHSd4p2zsSzA7hLxK6Jzr67yQ1IuG
   PEm09gcIdk/BJHqunIJO5wRENmYZ5EUDOJdcfzo6y6ZcmsDCA4gITp2NX
   Wd6vPnMJdtGamV5PuIRU4cmLVDbQIDLl+brXCOwaRHWin7qDwceDFMR9v
   j6XHoxQXCXu1G18h21QGhhGjIjD8lWgEEFfNGQf/JbwTCjd/1FImcac/3
   NJ01jkCa7uXMna3Q4HcU86Qe/r1bKt57tpvMnpD5AhN9jwRHIfnkxJ3pa
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="276223109"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="276223109"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 13:41:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="642546092"
Received: from lkp-server02.sh.intel.com (HELO b138c9e8658c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 01 Sep 2022 13:41:56 -0700
Received: from kbuild by b138c9e8658c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTr0e-0000kd-0d;
	Thu, 01 Sep 2022 20:41:56 +0000
Date: Fri, 2 Sep 2022 04:41:09 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [masahiroy-kbuild:kbuild 18/19] ld.lld: error:
 vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation
 R_HEX_B22_PCREL out of range: 2313184 is not in [-2097152, 2097151];
 references __vmnewmap
Message-ID: <202209020450.jH1ovepP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kbuild@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
head:   67c0e0cf21cd5065fba45a6a00dd252ae4b9417a
commit: 0b1de512cba77e11bdf0305264c56ab61b23b3e1 [18/19] kbuild: use obj-y instead extra-y for objects placed at the head
config: hexagon-randconfig-r041-20220831 (https://download.01.org/0day-ci/archive/20220902/202209020450.jH1ovepP-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?id=0b1de512cba77e11bdf0305264c56ab61b23b3e1
        git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
        git fetch --no-tags masahiroy-kbuild kbuild
        git checkout 0b1de512cba77e11bdf0305264c56ab61b23b3e1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation R_HEX_B22_PCREL out of range: 2313184 is not in [-2097152, 2097151]; references __vmnewmap
   >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
--
>> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x12c): relocation R_HEX_B22_PCREL out of range: 2313056 is not in [-2097152, 2097151]; references __vmsetvec
   >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
--
>> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x160): relocation R_HEX_B22_PCREL out of range: 2326848 is not in [-2097152, 2097151]; references memset
   >>> defined in vmlinux.a(arch/hexagon/lib/memset.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBBD2F27
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 17:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644254447; x=1675790447;
  h=date:from:cc:subject:message-id:mime-version;
  bh=AGj7X2vLtYEImjsurM8bA/DkfMrFc9kflpMwnfmQ/hU=;
  b=HQ2PG4K3bZY0Jce+LFGxKrseW4M/bcWp2pjO7O1wHJI55VUY8wvGPVKY
   2cOtPFVgj9c6lAz1+pWro109kqV6CIyaXeB+VXPXc2sAH1Vii3u3sPuZJ
   hAQfua/6dy88OW80obKvdTXziqXMJ9/h4t/KchhK4CJfiMchULtan1IuL
   iTz0FFm6lhaYPdQLod8RQQ9bjIUktHBYgjCKPytcr/YkWB8c3D+zN7sCG
   ifaA0LbD5iGddlPk3cH1nt4X5tCicEOqhb1cAuarRVmhOfIr0p12DB4bP
   a8GsQxIs1hce4iEgOSb7lXw4iTFood1HqouPdc4c3jUJ5FLhvMTn3UVAR
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="248529179"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; 
   d="scan'208";a="248529179"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 09:20:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; 
   d="scan'208";a="700539606"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Feb 2022 09:20:45 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nH7gz-0000nC-2R; Mon, 07 Feb 2022 17:20:45 +0000
Date: Tue, 8 Feb 2022 01:20:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 634/4212] ld.lld: error:
 drivers/built-in.a(android/rust_binder.o) is incompatible with aarch64elfb
Message-ID: <202202080112.7LbYVWJm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Wedson Almeida Filho <wedsonaf@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Alex Gaynor <alex.gaynor@gmail.com>
CC: Finn Behrens <me@kloenk.de>
CC: Sven Van Asbroeck <thesven73@gmail.com>
CC: Gary Guo <gary@garyguo.net>
CC: Wayne Campbell <wcampbell1995@gmail.com>

Hi Wedson,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b3c0a155ef77550d48f6eb7c6fdd6075764a5622
commit: fe7751c4f8fce1bd860b5f3f85513f3d2db956ce [634/4212] [RFC] drivers: android: Binder IPC in Rust
config: arm64-randconfig-r031-20220207 (https://download.01.org/0day-ci/archive/20220208/202202080112.7LbYVWJm-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6daaf5a44925592c764c59219b0024ee06317028)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=fe7751c4f8fce1bd860b5f3f85513f3d2db956ce
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout fe7751c4f8fce1bd860b5f3f85513f3d2db956ce
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld.lld: error: rust/built-in.a(core.o) is incompatible with aarch64elfb
   ld.lld: error: rust/built-in.a(compiler_builtins.o) is incompatible with aarch64elfb
   ld.lld: error: rust/built-in.a(alloc.o) is incompatible with aarch64elfb
   ld.lld: error: rust/built-in.a(kernel.o) is incompatible with aarch64elfb
   ld.lld: error: rust/built-in.a(build_error.o) is incompatible with aarch64elfb
>> ld.lld: error: drivers/built-in.a(android/rust_binder.o) is incompatible with aarch64elfb

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

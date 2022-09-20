Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053F2A5C
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 10:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663670970; x=1695206970;
  h=date:from:cc:subject:message-id:mime-version;
  bh=/hvMYd6QrKtJlvCKUCW5sEWI2I4/UBZdupD6MeYnTh0=;
  b=ZX4n1dhKNimXoZV1Kj/OKVMvxg6u8MU0mk5b+u39grSyQfUKj459jWYc
   z3nte49IQOTrMJaHxu24o0qw/LIRlFf8nJlap900HiyY2wHL6cmhbi9pk
   Ro/6mykiW8Qghheg5RlBI+MCHR+T9TfVFUmCoCqOizLl37BjqdvhXYzxY
   kp5k7iHnKZpCH1qyZRw2xp1/qbtSYFF3bJy5QGNasTqObW2BzRlmXmUWO
   sTKjF7Efh5907HB547x2NnrrTs2CONgZTLDCCyriAhbVHMKUnLkQVQzKn
   KhMfzVNB9S3E2Q5a0KQzb6MsX8iOOMgoFVHgV9CfjHe0Xeuz7ZzP/FQrH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="286710477"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="286710477"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 03:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="649538977"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Sep 2022 03:49:28 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oaaoi-0002gf-0f;
	Tue, 20 Sep 2022 10:49:28 +0000
Date: Tue, 20 Sep 2022 18:48:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 7601/8235] ld.lld: error:
 vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation
 R_HEX_B22_PCREL out of range: 2112040 is not in [-2097152, 2097151];
 references __vmnewmap
Message-ID: <202209201854.m9MhIzpX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Masahiro Yamada <masahiroy@kernel.org>

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef08d387bbbc20df740ced8caee0ffac835869ac
commit: 48f513e2b9304affc43dcdf95a150ad02d70f9fd [7601/8235] kbuild: use obj-y instead extra-y for objects placed at the head
config: hexagon-randconfig-r014-20220919 (https://download.01.org/0day-ci/archive/20220920/202209201854.m9MhIzpX-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=48f513e2b9304affc43dcdf95a150ad02d70f9fd
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 48f513e2b9304affc43dcdf95a150ad02d70f9fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation R_HEX_B22_PCREL out of range: 2112040 is not in [-2097152, 2097151]; references __vmnewmap
   >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
--
>> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x12c): relocation R_HEX_B22_PCREL out of range: 2111912 is not in [-2097152, 2097151]; references __vmsetvec
   >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
--
>> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x160): relocation R_HEX_B22_PCREL out of range: 2123760 is not in [-2097152, 2097151]; references memset
   >>> defined in vmlinux.a(arch/hexagon/lib/memset.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

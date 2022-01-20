Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE80173
	for <llvm@lists.linux.dev>; Thu, 20 Jan 2022 04:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642653591; x=1674189591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d5HIxZbCSqqDPPxRqMmtrRQV5thhMXxfOvaJgm6cMrs=;
  b=mOzf5PgNhut7kA1we8x+cijJ/XKEM2KfdA0qp0hs4Z4gPh4bMzLnaV7g
   nQLuq6zWTrlisBxPHntqfb1iuDgcOIp5/OlxWog8H9VJ0VuYIcfPb6N9K
   ynTjD95k98VSBcmWMLmwIBsZiroKJtLftfeUodWZgKfizEHg1Ccqi2Udl
   qh6s6wdHKU9Y8tx0whL0EE4ApTrFK8kqVTgBwl8CikfBHw2bwcQCtZbVG
   cTM3EpzJ62pfckE6mIn3FZ/uhC7Uabz/tBQSt/wBKSNNxLJFMP2sm4SbE
   ui7GlcfkJtfgfgun2Xcs7D4zJoFeniVM5Rax1/hmzpJnlM0iNe8jMZTE6
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="225940642"
X-IronPort-AV: E=Sophos;i="5.88,301,1635231600"; 
   d="scan'208";a="225940642"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2022 20:39:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,301,1635231600"; 
   d="scan'208";a="694061073"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Jan 2022 20:39:49 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nAPEj-000E0e-0X; Thu, 20 Jan 2022 04:39:49 +0000
Date: Thu, 20 Jan 2022 12:39:23 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [cel:topic-rpc-with-tls-upcall 15/18] ld.lld: error: undefined
 symbol: inet6_getname
Message-ID: <202201201215.1OBoCxnK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc-with-tls-upcall
head:   ddd643a7a9a2faa6d6f1513d6f71490707989a28
commit: 6d2eb8a419c0ca5a304072b53d9475846dd1cf43 [15/18] net/tls: Add support for PF_TLSH (a TLS handshake listener)
config: hexagon-randconfig-r021-20220118 (https://download.01.org/0day-ci/archive/20220120/202201201215.1OBoCxnK-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=6d2eb8a419c0ca5a304072b53d9475846dd1cf43
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel topic-rpc-with-tls-upcall
        git checkout 6d2eb8a419c0ca5a304072b53d9475846dd1cf43
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: inet6_getname
   >>> referenced by af_tlsh.c
   >>> tls/af_tlsh.o:(tlsh_getname) in archive net/built-in.a
   >>> referenced by af_tlsh.c
   >>> tls/af_tlsh.o:(tlsh_getname) in archive net/built-in.a
   >>> did you mean: inet_getname
   >>> defined in: net/built-in.a(ipv4/af_inet.o)
--
>> ld.lld: error: undefined symbol: inet6_sendmsg
   >>> referenced by af_tlsh.c
   >>> tls/af_tlsh.o:(tlsh_sendmsg) in archive net/built-in.a
   >>> referenced by af_tlsh.c
   >>> tls/af_tlsh.o:(tlsh_sendmsg) in archive net/built-in.a
--
>> ld.lld: error: undefined symbol: inet6_recvmsg
   >>> referenced by af_tlsh.c
   >>> tls/af_tlsh.o:(tlsh_recvmsg) in archive net/built-in.a
   >>> referenced by af_tlsh.c
   >>> tls/af_tlsh.o:(tlsh_recvmsg) in archive net/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

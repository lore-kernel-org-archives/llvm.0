Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360B44362
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 14:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647525614; x=1679061614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QPfVbT9u+v+Yeu9XDEbPdkI2YLNnYH/l42UkZ4GtSgY=;
  b=mhbwW8OvY1KETIQXcbohZxr+NNQrSHfjywhEJoyQD4O4s0C+E+2gaLi4
   kdWa7er6oSc4/aBlN1056lzu2AMMJtypzuKu3KeNKo/jsU0YG6hdUYTBW
   Q0rJ0Ds81xBeFayXTCzIa2OGcWavefyvxSW5tsnv8Cm1ozSWK+cTkzghf
   QoLlH9/mETep9IR31xWN+iVhlCFnow2uJ8Eo5s1mpiik+Yc9rEqJSjRY+
   mxOQ9+x0vdoaMgWjN4oEzx/ou4fpNt+Z8TucA0DMqJRE7Zr6jkS9abk+0
   UVCnWuhojYCYDHbsWaK84xrFOdk7SGj1HPFgUpccPuVS8QejR7t6VAeI+
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="256600413"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="256600413"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2022 07:00:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="541378125"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Mar 2022 07:00:11 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUqfj-000Djh-2d; Thu, 17 Mar 2022 14:00:11 +0000
Date: Thu, 17 Mar 2022 21:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:rostedt/linux-trace/merge-next-20220315 512/512]
 WARNING: modpost: vmlinux.o(.data+0x296750): Section mismatch in reference
 from the variable nft_rt_type to the function .init.text:set_reset_devices()
Message-ID: <202203172141.n0ep448q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block rostedt/linux-trace/merge-next-20220315
head:   87a21b60077d8cb23d3e70a00a969b542d0695d8
commit: 87a21b60077d8cb23d3e70a00a969b542d0695d8 [512/512] Merge remote-tracking branch 'ftrace/ftrace/core' into HEAD
config: riscv-randconfig-r042-20220314 (https://download.01.org/0day-ci/archive/20220317/202203172141.n0ep448q-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/87a21b60077d8cb23d3e70a00a969b542d0695d8
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block rostedt/linux-trace/merge-next-20220315
        git checkout 87a21b60077d8cb23d3e70a00a969b542d0695d8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.data+0x296750): Section mismatch in reference from the variable nft_rt_type to the function .init.text:set_reset_devices()
The variable nft_rt_type references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x296764): Section mismatch in reference from the variable nft_rt_type to the variable .init.text:.Ltmp2
The variable nft_rt_type references
the variable __init .Ltmp2
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:


Note: the below error/warnings can be found in parent commit:
<< WARNING: modpost: vmlinux.o(.text+0x34cb00): Section mismatch in reference from the function nfs3_proc_unlink_rpc_prepare() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x34cb4c): Section mismatch in reference from the function nfs3_proc_rename_rpc_prepare() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x3500aa): Section mismatch in reference from the function nfs3_xdr_enc_getacl3args() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x3ebc5c): Section mismatch in reference from the function ufs_rename() to the variable .init.text:.LBB130_20
<< WARNING: modpost: vmlinux.o(.text+0x3ebc82): Section mismatch in reference from the function ufs_rename() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x3ebe14): Section mismatch in reference from the function ufs_error() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x3ebf6e): Section mismatch in reference from the function ufs_panic() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x3f1722): Section mismatch in reference from the function ufs_nfs_get_inode() to the variable .init.text:.LBB130_23
<< WARNING: modpost: vmlinux.o(.text+0x3f27c4): Section mismatch in reference from the function jffs2_compressors_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x35026e): Section mismatch in reference from the function nfs3_xdr_enc_setacl3args() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x34cb00): Section mismatch in reference from the function nfs3_proc_unlink_rpc_prepare() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x34cb4c): Section mismatch in reference from the function nfs3_proc_rename_rpc_prepare() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x3500aa): Section mismatch in reference from the function nfs3_xdr_enc_getacl3args() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x3ebc5c): Section mismatch in reference from the function ufs_rename() to the variable .init.text:.LBB130_20
<< WARNING: modpost: vmlinux.o(.text+0x3ebc82): Section mismatch in reference from the function ufs_rename() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x3ebe14): Section mismatch in reference from the function ufs_error() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x3ebf6e): Section mismatch in reference from the function ufs_panic() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x3f1722): Section mismatch in reference from the function ufs_nfs_get_inode() to the variable .init.text:.LBB130_23
<< WARNING: modpost: vmlinux.o(.text+0x3f27c4): Section mismatch in reference from the function jffs2_compressors_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x35026e): Section mismatch in reference from the function nfs3_xdr_enc_setacl3args() to the function .init.text:set_reset_devices()

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

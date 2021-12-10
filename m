Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA182C80
	for <llvm@lists.linux.dev>; Fri, 10 Dec 2021 10:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639131251; x=1670667251;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Vs79zxkkBLzczziAhRnjlUEXXeJCa8cLw/v+L/XWxIQ=;
  b=YMpTM3BUJGo7574AXs9Z7eOjdy8vL7RF71Z4lg51fpGpyLMxTuPdsF8j
   hGM4EotuBfnUfHX0Xd6SFkgfcet0xuhWKtvCMBM/epxpViUNdDyJ/Sm3W
   Vv9MyE2qJ15y/8ApseSxDfUAstZ7yPMUzr6xqaL3RSqoXuvlgETJ+Pb0J
   NpC76tNeFxGlLqhDjkA0sFe8DGpiw/S8RFp+Iy2kFf51vdzd/P+nqW1Ze
   ENCa9xMZVzBDHNjOVMHXFG5xBnHtF8mG8LR/CV/g25/JNGpQVqqngsQwv
   7ri/qBAC8BzYANLZGMeqyHiowBns+4vooG6oHJPmOMEm2ngDp5qgpWebQ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="238122844"
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; 
   d="scan'208";a="238122844"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 02:14:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; 
   d="scan'208";a="503873867"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 10 Dec 2021 02:14:01 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mvcue-000336-F6; Fri, 10 Dec 2021 10:14:00 +0000
Date: Fri, 10 Dec 2021 18:13:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 2637/5842] drivers/auxdisplay/charlcd.o: warning:
 objtool: charlcd_register()+0x2d4: unreachable instruction
Message-ID: <202112101807.jvagJ8rt-lkp@intel.com>
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
TO: Luiz Sampaio <sampaio.ime@gmail.com>
CC: Miguel Ojeda <ojeda@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4eee8d0b64ecc3231040fa68ba750317ffca5c52
commit: 4daa9ff89ef27be43c15995412d6aee393a78200 [2637/5842] auxdisplay: charlcd: checking for pointer reference before dereferencing
config: x86_64-randconfig-a015-20211205 (https://download.01.org/0day-ci/archive/20211210/202112101807.jvagJ8rt-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4daa9ff89ef27be43c15995412d6aee393a78200
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 4daa9ff89ef27be43c15995412d6aee393a78200
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash crypto// drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/auxdisplay/charlcd.o: warning: objtool: charlcd_register()+0x2d4: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

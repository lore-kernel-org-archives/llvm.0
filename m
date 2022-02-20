Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646435EBE
	for <llvm@lists.linux.dev>; Sun, 20 Feb 2022 20:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645389652; x=1676925652;
  h=date:from:cc:subject:message-id:mime-version;
  bh=SXXGu34h+DZ/mxH3AA/rw/vdBuPWP3hSpRq78Ge0y2A=;
  b=I9rVzZjLR6XSvkHcoa35AHeD6XA3vOrZdMF1RNELlfaOpCvSae0Q/kJy
   njlezKOMKvIFD4xijPwhSxxvslux910O7bzY2qxE0yHm9HtXbZYHjSavD
   Ar4/bcZRX6/ApZ7lqNG6N2pPHcsWaWxMRcmY8UVF/2lqcTuWdQhQvDRqn
   ddaMzBbR0It+ptzDJ8imcH599MQKuadAyPnTKXdwxrESDHgooSIR1rWE7
   AL5wACCKLptVKp/1rzcmaAnB4lY9bEPDpbbK1JCX2teMagsoxBqiNxBej
   zIloPZ6TzbrFA/sbJfANePw7Zca3zENPWTahaFzA59noj4XNGApAHMfBU
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="312143058"
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="312143058"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 12:40:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="507402436"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Feb 2022 12:40:51 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nLt0k-0000jM-Bw; Sun, 20 Feb 2022 20:40:50 +0000
Date: Mon, 21 Feb 2022 04:40:39 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:queue/5.10 5180/9999] ld.lld: error:
 arch/hexagon/kernel/head.o:(.init.text+0xd4): relocation R_HEX_B22_PCREL out
 of range: 2376176 is not in [-2097152, 2097151]; references __vmnewmap
Message-ID: <202202210431.kYDLukry-lkp@intel.com>
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
TO: Nathan Chancellor <nathan@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Sasha Levin <sashal@kernel.org>

Hi Nathan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.10
head:   69d6613f68347043222bc45a6627fb94b5b80f04
commit: f7121692795c654b52b460a11107a87285bb1dcd [5180/9999] hexagon: handle {,SOFT}IRQENTRY_TEXT in linker script
config: hexagon-randconfig-r025-20220220 (https://download.01.org/0day-ci/archive/20220221/202202210431.kYDLukry-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=f7121692795c654b52b460a11107a87285bb1dcd
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.10
        git checkout f7121692795c654b52b460a11107a87285bb1dcd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0xd4): relocation R_HEX_B22_PCREL out of range: 2376176 is not in [-2097152, 2097151]; references __vmnewmap
   >>> defined in arch/hexagon/kernel/built-in.a(vm_ops.o)
--
>> ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0x12c): relocation R_HEX_B22_PCREL out of range: 2376048 is not in [-2097152, 2097151]; references __vmsetvec
   >>> defined in arch/hexagon/kernel/built-in.a(vm_ops.o)
--
>> ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0x160): relocation R_HEX_B22_PCREL out of range: 2390320 is not in [-2097152, 2097151]; references memset
   >>> defined in arch/hexagon/lib/built-in.a(memset.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

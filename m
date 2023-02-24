Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C925CBD;
	Fri, 24 Feb 2023 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677251095; x=1708787095;
  h=date:from:cc:subject:message-id:mime-version;
  bh=nGTV1S5Nmu1W5ZM7WxNzxnFNaWItZGWfJWXcjNIYwpI=;
  b=Lm48ukhOc0BCiCyhNScIzmXL8iwNrWwDWRJkIw/k5HmONkEl2zp/VRVp
   3QLkS1dep96gv9XdgTt8bMegFHgTLmKO6HNhpSXK6VT9xNfnzbYF9c9MK
   7vgm0CiyApMxG9lDCMzTG5RzN5t9U8nu7wVD8df0LrZOxRiK0cxpl+aEQ
   c7wa5b20znOTEOt5Qi2vR3cW7PP4aGImlbWc6t6xRP/VxG1maiiWPTEHm
   OF57PlYEJa+MGZ/LOPArGYdFBh0m/b18vuzsTr8hKkUfP/ssPFAuF+0rR
   /o293kuVps+7zvupj147bDKZnX8Fyu9FgVx1mASh8w0l7lRVYWyD4L/Zo
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="334913583"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="334913583"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 07:04:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="703208195"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="703208195"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Feb 2023 07:04:54 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVZcz-0002UD-1r;
	Fri, 24 Feb 2023 15:04:53 +0000
Date: Fri, 24 Feb 2023 23:04:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 7569/13939] error: unknown target CPU '8540'
Message-ID: <202302242257.4W4myB9z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4d6d7ce9baaf9e67a85a53afc69a36af716f7670
commit: 45f7091aac3546ef8112bf62836650ca0bbf0b79 [7569/13939] powerpc/64: Set default CPU in Kconfig
config: powerpc-ppa8548_defconfig (https://download.01.org/0day-ci/archive/20230224/202302242257.4W4myB9z-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=45f7091aac3546ef8112bf62836650ca0bbf0b79
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 45f7091aac3546ef8112bf62836650ca0bbf0b79
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302242257.4W4myB9z-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang: error: unsupported argument '-me500' to option '-Wa,'
>> error: unknown target CPU '8540'
   note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 603e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9, pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, ppc64le, future
   make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error 1
   make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1285: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

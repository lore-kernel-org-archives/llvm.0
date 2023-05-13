Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB76A21;
	Sat, 13 May 2023 06:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683958268; x=1715494268;
  h=date:from:cc:subject:message-id:mime-version;
  bh=UX4ptnZ9cP7zHkZbJqnRu3mGznyGnFb9Em3pCQnYgOA=;
  b=TMH/ktXuUsystQTF8VxY/VSEycFsdSIQ7/sqZob67FVVa3f6Eh37AlWl
   9mFe087QT4N4erh1aI3zzSkpZMXY4AlMvbX14ZjMbv+M4Xbh4yFMUTgqS
   fcYigxD9yq14E3P3uev3AAVbkjXQlkqv4lyEZvf0UE+bAU9k3A5bLhdHE
   2iKWbaCvXXPuLOGsfb/v5dv4aIo3y1VE8O9i2F7qjFTns1e/dagNbSyHI
   ZCWWUCEtiPjIlIKeMyWAFQmS8QR/EJ5H4igYHnIIBSWfVf00MtCfpRhqX
   IWYP9ee7CA/3GWvCNd3Frkvko8S4Gmxlsp5pqtyCRJmjR69alwgub76kJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="354069732"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="354069732"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 23:11:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="765377753"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="765377753"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 May 2023 23:11:06 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxiTC-0005Mm-0M;
	Sat, 13 May 2023 06:11:06 +0000
Date: Sat, 13 May 2023 14:10:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH 2/3] powerpc/{32,book3e}: kcsan: Extend KCSAN Support
Message-ID: <202305131357.vxOBOWIx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <1a1138966780c3709f55bde8a0eb80209fa4395d.1683892665.git.christophe.leroy@csgroup.eu>
References: <1a1138966780c3709f55bde8a0eb80209fa4395d.1683892665.git.christophe.leroy@csgroup.eu>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Marco Elver <elver@google.com>
TO: Dmitry Vyukov <dvyukov@google.com>
TO: "Paul E. McKenney" <paulmck@kernel.org>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: Chris Zankel <chris@zankel.net>
TO: Max Filippov <jcmvbkbc@gmail.com>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: linux-kernel@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: kasan-dev@googlegroups.com
CC: Rohan McLure <rmclure@linux.ibm.com>

Hi Christophe,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.4-rc1 next-20230512]
[cannot apply to jcmvbkbc-xtensa/xtensa-for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/kcsan-Don-t-expect-64-bits-atomic-builtins-from-32-bits-architectures/20230512-235101
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/1a1138966780c3709f55bde8a0eb80209fa4395d.1683892665.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH 2/3] powerpc/{32,book3e}: kcsan: Extend KCSAN Support
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230513/202305131357.vxOBOWIx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/9e591fe641be3e363dceca189200359619af5539
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christophe-Leroy/kcsan-Don-t-expect-64-bits-atomic-builtins-from-32-bits-architectures/20230512-235101
        git checkout 9e591fe641be3e363dceca189200359619af5539
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305131357.vxOBOWIx-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> clang: error: unsupported option '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
>> clang: error: unsupported option '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
   make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error 1
   make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

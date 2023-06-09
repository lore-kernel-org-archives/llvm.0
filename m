Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5980186A;
	Fri,  9 Jun 2023 03:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686280932; x=1717816932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y0Qr7AuHqu9WwNbi1J5fn7mzvygjMiqdxxSohFYmBZo=;
  b=LTsYa37v3MnK4Qhat7fO2puHuRVO5qijdA2psEjQT5rbHLJdjxQwS5sY
   rOxvIl0QhUVF2gXz1LLAJS/ghDqR7iOfQ2hsOQfjgrqdxUTVv2a5t0ghY
   xLwGYrlzZyRMq6mxp3Uh/RTmCWwplmtO/LEFPtFazQ/agcIgKGAgkSCyp
   wJNHiX2+1cz+PLQ8F3kT4lpp5vyIB9dAMwjhZI1aD8GJT9I7sV7eXxG1p
   BmUS1dJe/HNA/zO+Rg+yh5WHfh6c/MZ5XUqjkZpbWFms1h0Svpk6OFNI0
   /NEQrqzrNy+qiEcgbb5KuNYaJ8zXoJdjGUKFFQK3V8UqlJbGLRfXcdmGU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="347149388"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="347149388"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 20:22:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="775333808"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="775333808"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Jun 2023 20:22:10 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7ShW-0008Zo-04;
	Fri, 09 Jun 2023 03:22:10 +0000
Date: Fri, 9 Jun 2023 11:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 08/11] kbuild: implement CONFIG_TRIM_UNUSED_KSYMS
 without recursion
Message-ID: <202306091148.92XsHAbo-lkp@intel.com>
References: <20230608142428.256985-9-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608142428.256985-9-masahiroy@kernel.org>

Hi Masahiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on next-20230608]
[cannot apply to masahiroy-kbuild/fixes arnd-asm-generic/master rafael-pm/linux-next linus/master v6.4-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/Revert-PATCH-uml-export-symbols-added-by-GCC-hardened/20230608-223125
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20230608142428.256985-9-masahiroy%40kernel.org
patch subject: [PATCH v7 08/11] kbuild: implement CONFIG_TRIM_UNUSED_KSYMS without recursion
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20230609/202306091148.92XsHAbo-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install um cross compiling tool for clang build
        # apt-get install binutils-um-linux-gnu
        git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
        git fetch masahiroy-kbuild for-next
        git checkout masahiroy-kbuild/for-next
        b4 shazam https://lore.kernel.org/r/20230608142428.256985-9-masahiroy@kernel.org
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=um olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=um SHELL=/bin/bash M=block

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091148.92XsHAbo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[2]: *** No rule to make target 'block/bfq.ko', needed by '__modfinal'.
   make[2]: Target '__modfinal' not remade because of errors.
--
>> make[2]: *** No rule to make target 'drivers/net/dummy.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/net/tun.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/net/ppp/ppp_generic.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/net/slip/slip.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/net/slip/slhc.ko', needed by '__modfinal'.
   make[2]: Target '__modfinal' not remade because of errors.
--
>> make[2]: *** No rule to make target 'fs/isofs/isofs.ko', needed by '__modfinal'.
   make[2]: Target '__modfinal' not remade because of errors.
--
>> make[2]: *** No rule to make target 'sound/soundcore.ko', needed by '__modfinal'.
   make[2]: Target '__modfinal' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE5D10F0
	for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 08:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650443055; x=1681979055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9FipoHmZXgdNn1n39PJvNFoq4x/sPrtvWbNZiz24q3M=;
  b=GaFjSOvInOl7M0mRkopocqlQr3aEKAAreLisHR0M0p0Uw5CGmsvTaZ2m
   CrvkeDWS9qt4WdntXKuobOZT04CnAN4pwCDaPN60l1BNOXAksMFvOp+4T
   /K1KEBJbUC66rFNOFuS/sOYISL++LF5tmV2w1W7ue6OTcPyc+Y1T9r/Nj
   zguIUGREzjlSDZ0wHU5RHda/CHcsUxy91yOataLdepKdMTOhqjfNHIBSr
   kMZ7kRblX2vislsi9XP5OXYqvj3yF6oUUm4mn7U6NJJUiuuffuLEuWmZN
   vGmtq/2V49rRD+GvFxuGxOGuxulK6l8wx8wL/qCD2TfsD1XKj5s4GWs5M
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="261575693"
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; 
   d="scan'208";a="261575693"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 01:24:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; 
   d="scan'208";a="614332755"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Apr 2022 01:24:13 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nh5dE-0006lc-HQ;
	Wed, 20 Apr 2022 08:24:12 +0000
Date: Wed, 20 Apr 2022 16:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: joao@overdrivepizza.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 03/11] objtool: Support FineIBT offset fixes
Message-ID: <202204201649.Ev9vIWds-lkp@intel.com>
References: <20220420004241.2093-4-joao@overdrivepizza.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420004241.2093-4-joao@overdrivepizza.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/x86/core]
[also build test ERROR on masahiroy-kbuild/for-next linus/master v5.18-rc3]
[cannot apply to tip/master linux/master next-20220419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/joao-overdrivepizza-com/Kernel-FineIBT-Support/20220420-084724
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 203d8919a9eda5d1bc68ac3cd7637588334c9dc1
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220420/202204201649.Ev9vIWds-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0b9af77845b1a1ff5dd809400c36120c21bab7f7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review joao-overdrivepizza-com/Kernel-FineIBT-Support/20220420-084724
        git checkout 0b9af77845b1a1ff5dd809400c36120c21bab7f7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/decode.c:740:32: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
   const char *arch_bypass_fineibt()
                                  ^
                                   void
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/arch/x86/decode.o] Error 1
   make[4]: *** [tools/build/Makefile.build:139: arch/x86] Error 2
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [Makefile:56: tools/objtool/objtool-in.o] Error 2
   make[2]: *** [Makefile:69: objtool] Error 2
   make[1]: *** [Makefile:1337: tools/objtool] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

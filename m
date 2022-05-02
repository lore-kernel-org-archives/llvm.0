Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B252CA6
	for <llvm@lists.linux.dev>; Mon,  2 May 2022 16:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651510366; x=1683046366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l7dpW/TC0IMfrf/S9cUvthLkRYRrPAx2jvWGU+40wOQ=;
  b=f8BR4sIGaDJp+Efas4nfuK9H19ElPemUiHLm7j6s3H4Mw0192kUfT5EW
   mgJYEj1bFgFAUL/t+R46nyjGDcyyqTiYQo8QTIJtD6DPfTY0N+looSeVW
   62TuMXBWCqK6x+gty93LywMnu0XlG8FMVsJkJFZoyEfd0k7RCzrLxS3yG
   T5c/fhfrtJTRFQSiUirlTBW5vMcPPFlYJm8dIGpGN/B+sB3musamu+k3o
   WlMs3+aDqqN5BW5k7/yGrj576FpoaoYw6lTzUFefgw+fn+trl9aeFlJCc
   nmpVV8EscFapf9+3KirtxTLAdghMdBTXx7NnH5Gdt/u2tXLt50RnD5EjM
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="247170460"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; 
   d="scan'208";a="247170460"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 09:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; 
   d="scan'208";a="546513653"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 May 2022 09:52:44 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nlZHv-0009hn-OB;
	Mon, 02 May 2022 16:52:43 +0000
Date: Tue, 3 May 2022 00:52:20 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] kbuild: call checksyscalls.sh and check-atomics.sh
 only if prerequisites change
Message-ID: <202205030015.JCmg5yPS-lkp@intel.com>
References: <20220426155229.436681-1-mailhol.vincent@wanadoo.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426155229.436681-1-mailhol.vincent@wanadoo.fr>

Hi Vincent,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on linus/master linux/master v5.18-rc5]
[cannot apply to next-20220502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Mailhol/kbuild-call-checksyscalls-sh-and-check-atomics-sh-only-if-prerequisites-change/20220427-000131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
config: mips-randconfig-c004-20220501 (https://download.01.org/0day-ci/archive/20220503/202205030015.JCmg5yPS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/3cc91cf9074641923203e150664d1cbf83eab243
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vincent-Mailhol/kbuild-call-checksyscalls-sh-and-check-atomics-sh-only-if-prerequisites-change/20220427-000131
        git checkout 3cc91cf9074641923203e150664d1cbf83eab243
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   clang-15: error: unknown argument: '-mr10k-cache-barrier=store'
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> make[2]: *** No rule to make target 'missing-syscalls'.
   make[1]: *** [arch/mips/Makefile:408: archprepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

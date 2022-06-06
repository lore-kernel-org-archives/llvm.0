Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7A17E
	for <llvm@lists.linux.dev>; Mon,  6 Jun 2022 20:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654546591; x=1686082591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jtrT9xol1zz8x3wq/vAV4b2zS4KUY7UQ5TB0I2JKtBk=;
  b=STSx3aiWAxnzNJyo/oW3oxpFMN62WMehjLQjY+jCkbIlIb4gdIRzN8Uf
   STaWhkizpM5TymjvJAatuQqiAqBkDe6SbYwqjREbTQFaeeP04iOba5kLK
   Ye4l35Xa1bFP6YJMiZAn3cGeF9zlRflSZsxqDLV4QiKYp5OvLCTh91GrP
   E4BA4w9iG7MdATsZ7lY6LVGc3DNns4qTavzX3CBVjjn+5fVpCmt3O/Nuw
   kFk8xDoBwFj9EwKKgH+decnGbgqoj+rtqr2VtGMB7fgZa1JIZeMZRQpTa
   lqJz61EX8OwwxMnL5XpJnTZ8OJaa35UMZ1FbgGAfyPOfJj+56C0WkOe9R
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="276729170"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="276729170"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 13:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="669651235"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Jun 2022 13:16:28 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nyJ9H-000D1x-SJ;
	Mon, 06 Jun 2022 20:16:27 +0000
Date: Tue, 7 Jun 2022 04:16:14 +0800
From: kernel test robot <lkp@intel.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] kbuild: fix build failure by scripts/check-local-export
Message-ID: <202206070434.3wvNWfJZ-lkp@intel.com>
References: <ce0b0a88-f8cb-ba9c-8a0e-1a818f8c50e0@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce0b0a88-f8cb-ba9c-8a0e-1a818f8c50e0@I-love.SAKURA.ne.jp>

Hi Tetsuo,

I love your patch! Yet something to improve:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on linus/master v5.19-rc1 next-20220606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Tetsuo-Handa/kbuild-fix-build-failure-by-scripts-check-local-export/20220606-234446
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
config: arm-mxs_defconfig (https://download.01.org/0day-ci/archive/20220607/202206070434.3wvNWfJZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/7047234a52a99a58113ebe0502e1c227af2b6c61
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tetsuo-Handa/kbuild-fix-build-failure-by-scripts-check-local-export/20220606-234446
        git checkout 7047234a52a99a58113ebe0502e1c227af2b6c61
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> llvm-nm: error: : unknown argument '--'
   make[2]: *** [scripts/Makefile.build:249: scripts/mod/empty.o] Error 1
   make[2]: *** Deleting file 'scripts/mod/empty.o'
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1195: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

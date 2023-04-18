Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA20B1FA0;
	Tue, 18 Apr 2023 09:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681811137; x=1713347137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wlDhzbPza+xuR+HQxyeC3YbJjUbskKZQKYxmK2tXHO4=;
  b=VhDM9jnKuGVwtKvTvzmfdGxnt4KATHFytFveU5sSurJKh/A0bXakP1YW
   dk0V9dBTNCTJFUIfu1QKD2J7QSjQkdRgs9yh+L9cc3X+kT7witmGdO9UJ
   p6Z7w7bxjSBT28ulBu02EXezEqQsRtYVJTw8a4kF9U751QYU5sYn356Gz
   2bwvNnb0hh/zjzbvDOXQpfVF6BG1TKkCmjvX0j/6MiuYz4iTgjZ86Va0p
   Ll3qilPySXTt8dXfq5QbfbmgzfqbfBm10DeKSFn1dnfFGas4ygabMqK75
   ER4q3BANxUxOSp1F3RrAVuvYjETd1mUkpXGXzEe1sqGQ+E1N5adLf1W0F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="431410555"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="431410555"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 02:45:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="693564006"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="693564006"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Apr 2023 02:45:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pohtz-000dDp-2R;
	Tue, 18 Apr 2023 09:45:31 +0000
Date: Tue, 18 Apr 2023 17:44:59 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [sudeep-holla:android13-5.10/ffa 9246/9999] <unknown>:0: error:
 symbol 'secondary_kexec_args' is already defined
Message-ID: <202304181713.Ji2wpzAl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.10/ffa
head:   9e12ac4f9c69befe08119567c073adc938aafc4d
commit: ffff118fe157b534c3244f8b300e655231dbd95c [9246/9999] BACKPORT: scripts/Makefile.clang: default to LLVM_IAS=1
config: mips-buildonly-randconfig-r001-20230417 (https://download.01.org/0day-ci/archive/20230418/202304181713.Ji2wpzAl-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project c5ade37f1f6f97d628a5b9f2fdbb31b9caa1c8df)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/commit/?id=ffff118fe157b534c3244f8b300e655231dbd95c
        git remote add sudeep-holla https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git
        git fetch --no-tags sudeep-holla android13-5.10/ffa
        git checkout ffff118fe157b534c3244f8b300e655231dbd95c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181713.Ji2wpzAl-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/include/asm/asmmacro.h:48:2: warning: macro defined with named parameters which are not used in macro body, possible positional parameter found in body which will have no effect
    .macro local_irq_enable reg=$8
    ^
   arch/mips/include/asm/asmmacro.h:53:2: warning: macro defined with named parameters which are not used in macro body, possible positional parameter found in body which will have no effect
    .macro local_irq_disable reg=$8
    ^
   <unknown>:0: error: symbol 'kexec_args' is already defined
>> <unknown>:0: error: symbol 'secondary_kexec_args' is already defined
   <unknown>:0: error: symbol 'kexec_start_address' is already defined
   <unknown>:0: error: symbol 'kexec_indirection_page' is already defined
   <unknown>:0: error: symbol 'relocate_new_kernel_size' is already defined

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

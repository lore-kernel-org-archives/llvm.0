Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E051D2CA0
	for <llvm@lists.linux.dev>; Mon, 20 Dec 2021 15:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640014811; x=1671550811;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+oAZ/+7HI+1zpA7LYPrGjP2xkInQxlaaPkWYLJIwFNw=;
  b=TfZ8gFhDIDFkglaLbwf6SdEZ0rjsMrGYLhCEvXpd+rOkf/5MlFzsMoss
   5kaABe1MeGPuAPd0UsZHFNMP+DhkrxwUM8FAx7bEpTNMLM4Mh9HvO4OKU
   gSfQeds49Gh4rak3vm8Lq0/POL2YK3IrL7FRQVd8mFvDQoJQwaIm36xJC
   SOB81ctLsyqHI/2GHM7+caMHqji73jnuFF7Z8lOELXp9uOSQBslfM/7af
   w5dSviEicPHcI9AhJPXtqYKZ+Wl2GQLvV6rYJNLy/iVs5o+4nOhmj9LH0
   F+peMwtu36kBdaeJPLKcDNEJs0bBGftQ2E11MLEf8sqzm9UKxcmWFZ74S
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="300975733"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="300975733"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 07:40:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="616440118"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 20 Dec 2021 07:40:10 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzKll-0007w3-U9; Mon, 20 Dec 2021 15:40:09 +0000
Date: Mon, 20 Dec 2021 23:40:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: arch/x86/net/bpf_jit_comp.o: warning: objtool:
 bpf_int_jit_compile()+0x3e33: unreachable instruction
Message-ID: <202112202321.Y3wMuLNM-lkp@intel.com>
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
TO: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a7904a538933c525096ca2ccde1e60d0ee62c08e
commit: 588a25e92458c6efeb7a261d5ca5726f5de89184 bpf: Fix extable address check.
date:   4 days ago
config: x86_64-randconfig-r026-20211220 (https://download.01.org/0day-ci/archive/20211220/202112202321.Y3wMuLNM-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 555eacf75f21cd1dfc6363d73ad187b730349543)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=588a25e92458c6efeb7a261d5ca5726f5de89184
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 588a25e92458c6efeb7a261d5ca5726f5de89184
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/net/bpf_jit_comp.o: warning: objtool: bpf_int_jit_compile()+0x3e33: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

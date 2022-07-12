Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EDB4681
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 20:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657656455; x=1689192455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I4PtPocbbHJsmVqeSdj0j+ww60VTiKmwmGpsonHY+Qs=;
  b=ZiIaZPxJCRYneem7SN3rbQPYWAM8T69oKyqNbyxGJLXETVqVCUaSqB81
   EEWqVDjZisr2d+CoxBieYGoteMIMjGdKlSd1y8g+wapW62Mcpzy5iddp9
   8fXxxiL1hZeunCwcP1r9a+uD55lSC55d2cSfexnPyY6wlrjnxWySDxyMU
   YTBljlf6kKn8hsToie00GSdQIuBKHj4ioY+taNseuqDosb5K0bwjPW3Fe
   +kbtNFrWSJVFwtLdckqSYroENpTvj6FhJHchTuCZcqNSuKNsUhUhCHn4I
   HpO4PuUkC31DmBZEhIfg/0YyiZcwEB8hzFrn498wHjedXuARDaYOfm3dz
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="346714230"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="346714230"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2022 13:07:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="737608261"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2022 13:07:32 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oBMAN-0002ei-HF;
	Tue, 12 Jul 2022 20:07:31 +0000
Date: Wed, 13 Jul 2022 04:07:25 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Borislav Petkov <bp@suse.de>,
	Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
	Ben Hutchings <bwh@kernel.org>
Subject: [linux-stable-rc:linux-5.10.y 7109/7120]
 arch/x86/kernel/cpu/bugs.c:57:21: warning: section attribute is specified on
 redeclared variable
Message-ID: <202207130344.AUqExE4E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
head:   ba398a0e54049bb6a1c102245ae84103f103ff2c
commit: 855b78ccf1c8c952e148bdbd234cde117b098060 [7109/7120] KVM: VMX: Prevent guest RSB poisoning attacks with eIBRS
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220713/202207130344.AUqExE4E-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project badda4ac3c489a8c8cccdad1f74b9308c350a9e0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=855b78ccf1c8c952e148bdbd234cde117b098060
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.10.y
        git checkout 855b78ccf1c8c952e148bdbd234cde117b098060
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/bugs.c:57:21: warning: section attribute is specified on redeclared variable [-Wsection]
   DEFINE_PER_CPU(u64, x86_spec_ctrl_current);
                       ^
   arch/x86/include/asm/nospec-branch.h:278:12: note: previous declaration is here
   extern u64 x86_spec_ctrl_current;
              ^
   1 warning generated.


vim +57 arch/x86/kernel/cpu/bugs.c

c40221c4c496c5 Peter Zijlstra 2022-06-14  55  
c40221c4c496c5 Peter Zijlstra 2022-06-14  56  /* The current value of the SPEC_CTRL MSR with task-specific bits set */
c40221c4c496c5 Peter Zijlstra 2022-06-14 @57  DEFINE_PER_CPU(u64, x86_spec_ctrl_current);
c40221c4c496c5 Peter Zijlstra 2022-06-14  58  EXPORT_SYMBOL_GPL(x86_spec_ctrl_current);
c40221c4c496c5 Peter Zijlstra 2022-06-14  59  

:::::: The code at line 57 was first introduced by commit
:::::: c40221c4c496c5c026ede111094a96f292875d88 x86/bugs: Keep a per-CPU IA32_SPEC_CTRL value

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

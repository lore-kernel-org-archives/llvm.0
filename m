Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9298939C
	for <llvm@lists.linux.dev>; Sun, 17 Apr 2022 18:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650220318; x=1681756318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=03tWKc4tGSNlrP2AZkNUi1dPEIZp6mwmNGkTwQG7Otk=;
  b=QMtgOPr5n0Euf4nFeP996ZMyYEudIdmUmPhJ6//MnyL/pznJdzTrHCbG
   tl27/y+y9vQU0NVAZcJ9hF+CSJqgMm33WODjIWIaY8LlfjrYu8nfabT8w
   2GP5c4XOakDeHRXGMKL35h9DPPbniYB4F/bLFZJ6TsPUypL1mHs1600PU
   fgkBm6fQRnrB4mV+dsFedYRfSsuI9ACYYFlagVTA1tE54opAEU79kQQwN
   RgashA1XDJV6H0lir8lW2W9M3o/dI2Ky8nr518ouayjywc2b8JyiqXZRu
   pNHuHdnt+IHNQ1NTncM9jxtTXDJorLXSMh+mtoWvtaRo5ntyEIXDIiyWV
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10320"; a="261006978"
X-IronPort-AV: E=Sophos;i="5.90,267,1643702400"; 
   d="scan'208";a="261006978"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2022 11:31:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,267,1643702400"; 
   d="scan'208";a="592171763"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Apr 2022 11:31:56 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ng9gh-00045o-KC;
	Sun, 17 Apr 2022 18:31:55 +0000
Date: Mon, 18 Apr 2022 02:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [kees:for-next/randstruct 5/5] include/linux/cred.h:254:17: error:
 no member named 'non_rcu' in 'struct cred'
Message-ID: <202204180214.X2Y1kbZ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/randstruct
head:   0f9614862c554c424c7b099d2cf84a3ecd755357
commit: 0f9614862c554c424c7b099d2cf84a3ecd755357 [5/5] randstruct: Enable Clang support
config: powerpc64-allmodconfig (https://download.01.org/0day-ci/archive/20220418/202204180214.X2Y1kbZ6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ef94609d6ebe981767788e6877b0b3b731d425af)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?id=0f9614862c554c424c7b099d2cf84a3ecd755357
        git remote add kees https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
        git fetch --no-tags kees for-next/randstruct
        git checkout 0f9614862c554c424c7b099d2cf84a3ecd755357
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:10:
>> include/linux/cred.h:254:17: error: no member named 'non_rcu' in 'struct cred'
           nonconst_cred->non_rcu = 0;
           ~~~~~~~~~~~~~  ^
   include/linux/cred.h:266:17: error: no member named 'non_rcu' in 'struct cred'
           nonconst_cred->non_rcu = 0;
           ~~~~~~~~~~~~~  ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
>> include/linux/fs.h:2896:17: error: no member named 'i_nlink' in 'struct inode'
           return !inode->i_nlink || inode_unhashed(inode);
                   ~~~~~  ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   include/linux/compat.h:424:22: warning: array index 3 is past the end of the array (which contains 1 element) [-Warray-bounds]
           case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
                               ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   include/linux/compat.h:424:10: warning: array index 7 is past the end of the array (which contains 2 elements) [-Warray-bounds]
           case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
                   ^     ~
   include/linux/compat.h:131:2: note: array 'sig' declared here
           compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
           ^
   include/linux/compat.h:424:42: warning: array index 6 is past the end of the array (which contains 2 elements) [-Warray-bounds]
           case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
                                                   ^     ~
   include/linux/compat.h:131:2: note: array 'sig' declared here
           compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
           ^
   include/linux/compat.h:424:53: warning: array index 3 is past the end of the array (which contains 1 element) [-Warray-bounds]
           case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
                                                              ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   include/linux/compat.h:426:22: warning: array index 2 is past the end of the array (which contains 1 element) [-Warray-bounds]
           case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
                               ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   include/linux/compat.h:426:10: warning: array index 5 is past the end of the array (which contains 2 elements) [-Warray-bounds]
           case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
                   ^     ~
   include/linux/compat.h:131:2: note: array 'sig' declared here
           compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
           ^
   include/linux/compat.h:426:42: warning: array index 4 is past the end of the array (which contains 2 elements) [-Warray-bounds]
           case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
                                                   ^     ~
   include/linux/compat.h:131:2: note: array 'sig' declared here
           compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
           ^
   include/linux/compat.h:426:53: warning: array index 2 is past the end of the array (which contains 1 element) [-Warray-bounds]
           case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
                                                              ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   include/linux/compat.h:428:22: warning: array index 1 is past the end of the array (which contains 1 element) [-Warray-bounds]
           case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
                               ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   include/linux/compat.h:428:10: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
           case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
                   ^     ~
   include/linux/compat.h:131:2: note: array 'sig' declared here
           compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
           ^
   include/linux/compat.h:428:42: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
           case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
                                                   ^     ~
   include/linux/compat.h:131:2: note: array 'sig' declared here
           compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
           ^
   include/linux/compat.h:428:53: warning: array index 1 is past the end of the array (which contains 1 element) [-Warray-bounds]
           case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
                                                              ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   include/linux/mman.h:157:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   14 warnings and 3 errors generated.
   make[2]: *** [scripts/Makefile.build:120: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1195: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +254 include/linux/cred.h

f1752eec6145c9 David Howells  2008-11-14  234  
f1752eec6145c9 David Howells  2008-11-14  235  /**
f1752eec6145c9 David Howells  2008-11-14  236   * get_cred - Get a reference on a set of credentials
f1752eec6145c9 David Howells  2008-11-14  237   * @cred: The credentials to reference
f1752eec6145c9 David Howells  2008-11-14  238   *
f1752eec6145c9 David Howells  2008-11-14  239   * Get a reference on the specified set of credentials.  The caller must
f06bc03339ad4c NeilBrown      2018-12-03  240   * release the reference.  If %NULL is passed, it is returned with no action.
98870ab0a5a3f1 David Howells  2008-11-14  241   *
98870ab0a5a3f1 David Howells  2008-11-14  242   * This is used to deal with a committed set of credentials.  Although the
98870ab0a5a3f1 David Howells  2008-11-14  243   * pointer is const, this will temporarily discard the const and increment the
98870ab0a5a3f1 David Howells  2008-11-14  244   * usage count.  The purpose of this is to attempt to catch at compile time the
98870ab0a5a3f1 David Howells  2008-11-14  245   * accidental alteration of a set of credentials that should be considered
98870ab0a5a3f1 David Howells  2008-11-14  246   * immutable.
f1752eec6145c9 David Howells  2008-11-14  247   */
d84f4f992cbd76 David Howells  2008-11-14  248  static inline const struct cred *get_cred(const struct cred *cred)
f1752eec6145c9 David Howells  2008-11-14  249  {
1c388ad054fb1e Paul Menage    2009-07-17  250  	struct cred *nonconst_cred = (struct cred *) cred;
f06bc03339ad4c NeilBrown      2018-12-03  251  	if (!cred)
f06bc03339ad4c NeilBrown      2018-12-03  252  		return cred;
e0e817392b9acf David Howells  2009-09-02  253  	validate_creds(cred);
d7852fbd0f0423 Linus Torvalds 2019-07-11 @254  	nonconst_cred->non_rcu = 0;
1c388ad054fb1e Paul Menage    2009-07-17  255  	return get_new_cred(nonconst_cred);
f1752eec6145c9 David Howells  2008-11-14  256  }
f1752eec6145c9 David Howells  2008-11-14  257  

:::::: The code at line 254 was first introduced by commit
:::::: d7852fbd0f0423937fa287a598bfde188bb68c22 access: avoid the RCU grace period for the temporary subjective credentials

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

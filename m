Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB59C369;
	Sun, 23 Apr 2023 06:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682231405; x=1713767405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XOaoXCely6pAa+zJJVyGVfFUKp1Mu1T92yDMKH/vzpY=;
  b=jV9Tu3DTZ/jg6DH0mVGC1TeVBsF7tVqPGl67FUYQsmTNwbhdyLUNP64K
   zX80U080B8LhJknne5mauFC1vuhbMEAt1tv9GpC3hKtr//t5DAtm2pFAh
   aWDALATlJpSBCTALpqoIFMcUXXTOqMBHeMs/a9aTEMNTR9Za7kivhDfRX
   nRE28KsbhF6ENWixTO9VLqXlhdH2Mt93JQ3TIaGGaD+qy1xqazs5hIANK
   4+H6bIAOYkWBhSqcMX01DH5a26fyBtSl2i+dtD+lEci2t361OPe2KdzL9
   Cfb/CBgk+NIbk4tgj/EItiSkCSvK2S1vx6zmWcDce0FhITmr9692hZ+w7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="432527915"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="432527915"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 23:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="1022319832"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="1022319832"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Apr 2023 23:30:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqTEZ-000hl4-0Q;
	Sun, 23 Apr 2023 06:30:03 +0000
Date: Sun, 23 Apr 2023 14:29:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie 14/19] arch/x86/xen/xen-asm.S:31:39: error: unexpected
 token in argument list
Message-ID: <202304231445.bhEb5RIi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ard,

First bad commit (maybe != root cause):

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie
head:   01406d471d3e3718b3771fdabcfca8c505157404
commit: 1b941fed87d107c0bdd8bfa60b150563b2e7ae41 [14/19] x86: percpu: Use RIP-relative symbol references for per-CPU variables
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230423/202304231445.bhEb5RIi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=1b941fed87d107c0bdd8bfa60b150563b2e7ae41
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-pie
        git checkout 1b941fed87d107c0bdd8bfa60b150563b2e7ae41
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304231445.bhEb5RIi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/xen/xen-asm.S:31:39: error: unexpected token in argument list
    movb $1, %gs:(xen_vcpu_info) (% rip) + 1
                                         ^
   arch/x86/xen/xen-asm.S:72:39: error: unexpected token in argument list
    movb $0, %gs:(xen_vcpu_info) (% rip) + 1
                                         ^
   arch/x86/xen/xen-asm.S:81:43: error: unexpected token in argument list
    testb $0xff, %gs:(xen_vcpu_info) (% rip) + 0
                                             ^
   arch/x86/xen/xen-asm.S:100:43: error: unexpected token in argument list
    testb $0xff, %gs:(xen_vcpu_info) (% rip) + 1
                                             ^
   arch/x86/xen/xen-asm.S:116:35: error: unexpected token in argument list
    movq %gs:(xen_vcpu_info) (% rip) + 16, %rax
                                     ^


vim +31 arch/x86/xen/xen-asm.S

5393744b71ce79 Jeremy Fitzhardinge 2009-02-02  24  
09c413071e2de7 Peter Zijlstra      2021-06-24  25  .pushsection .noinstr.text, "ax"
5393744b71ce79 Jeremy Fitzhardinge 2009-02-02  26  /*
130ace11a9dc68 Tejun Heo           2009-02-06  27   * Disabling events is simply a matter of making the event mask
130ace11a9dc68 Tejun Heo           2009-02-06  28   * non-zero.
5393744b71ce79 Jeremy Fitzhardinge 2009-02-02  29   */
6dcc5627f6aec4 Jiri Slaby          2019-10-11  30  SYM_FUNC_START(xen_irq_disable_direct)
5393744b71ce79 Jeremy Fitzhardinge 2009-02-02 @31  	movb $1, PER_CPU_VAR(xen_vcpu_info) + XEN_vcpu_info_mask
f94909ceb1ed4b Peter Zijlstra      2021-12-04  32  	RET
6dcc5627f6aec4 Jiri Slaby          2019-10-11  33  SYM_FUNC_END(xen_irq_disable_direct)
5393744b71ce79 Jeremy Fitzhardinge 2009-02-02  34  

:::::: The code at line 31 was first introduced by commit
:::::: 5393744b71ce797f1b1546fafaed127fc50c2b61 xen: make direct versions of irq_enable/disable/save/restore to common code

:::::: TO: Jeremy Fitzhardinge <jeremy@goop.org>
:::::: CC: H. Peter Anvin <hpa@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

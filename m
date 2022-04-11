Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D161865
	for <llvm@lists.linux.dev>; Mon, 11 Apr 2022 17:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649697698; x=1681233698;
  h=date:from:cc:subject:message-id:mime-version;
  bh=g08oLWYas6bOwoGDG9jluPE/Rimk8VHneCX1q6eI07E=;
  b=Rc9gt9woYGTO/aaBwHhtMI642KRQ7R5Q3AB1CRluGrV9nHuj0sgM/0+/
   oJI/OeLpuuhygWWLOHsuzaDYfsgt5P4Nxa2kzI7/jw15M92xNmy6DYqfM
   /SWpyu+/9EJyja5BRjsEpQ30d0BUVdGb3tRQmjb0KWqV31GQd0KaHLex1
   uFVoQ61POsb27Wg/ToLr4z8Ci3DWLM3XbCmK9z93QHDUnOKaLNEb9hBAe
   Cux8L082mC4UnztUTTfQ7aRfqoDpDmqYOkFIdAoZOTh8gdfEmJXg98IBM
   Bp11BW3CRBq3qz5ZOln7k3XKPkMQ6cbBtiFYb3x7aM+aKWwe1Z7nkXAOW
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261018245"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="261018245"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 10:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="551282670"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 11 Apr 2022 10:21:34 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ndxjJ-00020M-L0;
	Mon, 11 Apr 2022 17:21:33 +0000
Date: Tue, 12 Apr 2022 01:20:43 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool:
 bmi160_data_rdy_trigger_set_state()+0x8b: sibling call from callable
 instruction with modified stack frame
Message-ID: <202204120103.bBTLu7tO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
commit: ed53a0d971926e484d86cce617ec02a7ee85c3fe x86/alternative: Use .ibt_endbr_seal to seal indirect calls
date:   4 weeks ago
config: x86_64-randconfig-r032-20220411 (https://download.01.org/0day-ci/archive/20220412/202204120103.bBTLu7tO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ed53a0d971926e484d86cce617ec02a7ee85c3fe
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ed53a0d971926e484d86cce617ec02a7ee85c3fe
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: bmi160_data_rdy_trigger_set_state()+0x8b: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: do_syscall_64()+0x1c: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sync_regs()+0x24: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x36: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0x10: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack()+0x14: call to cpu_entry_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi()+0x13a: call to __kasan_check_read() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_read_aux()+0x4b: call to mca_msr_reg() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check()+0xc8: call to mce_no_way_out() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_start()+0x44: call to __kasan_check_write() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_severity_amd()+0x66: call to mce_severity_amd_smca() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_page_fault()+0x3d: call to __kasan_check_read() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

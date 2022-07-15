Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B688E17F3
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 04:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657860663; x=1689396663;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Zs3q/XwltCwCMW/iA7/Glyz2lwlzrEyn+sVkHJMxa8A=;
  b=T0ovzVnhXxbqgrWFVL6xBIFaTSAr3mrAHesU1yPNmcOGgjgfiI71AoAO
   g9QSdVoUAO78UDGOiE7hMluKyftq2h2aPRSoknwzPHlJ1nQU7Czr3HEku
   Vs7Q7Gx7kYf5Af38rKyQvb+GDjlOkL8JITAbrsZKWZNbyoSpqturdZouW
   7oZMvg0cVWhobPuLY7NrQCX9OZnxBHAE2bawsdPEmHZEYF9jbS1+097t9
   TZ23zHYSXBpzx/6AwII+0wB20F91ULi/psMGSUH+XrSO+fml4gednRttL
   /2K2SsVsDeM+MF1olsHvdKm14gfYhQ15yVRikJuf0DVEXiK7B6h8uk+An
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="311361470"
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="311361470"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 21:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="654180323"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Jul 2022 21:51:02 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oCDI5-0001YT-Kc;
	Fri, 15 Jul 2022 04:51:01 +0000
Date: Fri, 15 Jul 2022 12:50:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [ammarfaizi2-block:tglx/devel/depthtracking 2/38] vmlinux.o:
 warning: objtool: load_percpu_segment+0x9: call to cpu_kernelmode_gs_base()
 leaves .noinstr.text section
Message-ID: <202207151235.IRGLudU4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel@vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://github.com/ammarfaizi2/linux-block tglx/devel/depthtracking
head:   c7baaa0f29b7e376c4cae98f76121715d234b804
commit: b9b90d25e890c374e7caad80e605d419d572ce38 [2/38] x86/cpu: Use native_wrmsrl() in load_percpu_segment()
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220715/202207151235.IRGLudU4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 2da550140aa98cf6a3e96417c87f1e89e3a26047)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/b9b90d25e890c374e7caad80e605d419d572ce38
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block tglx/devel/depthtracking
        git checkout b9b90d25e890c374e7caad80e605d419d572ce38
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: fixup_bad_iret+0x1e: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack+0x9: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x8: call to sev_es_nmi_complete() leaves .noinstr.text section
   vmlinux.o: warning: objtool: default_do_nmi+0x10: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: load_percpu_segment+0x9: call to cpu_kernelmode_gs_base() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_read_and_reset_apf_flags+0x1: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_on+0xa6: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_off+0xa3: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x63: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x32: call to __this_cpu_preempt_check() leaves .noinstr.text section


objdump-func vmlinux.o load_percpu_segment+0x9: call to cpu_kernelmode_gs_base:

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

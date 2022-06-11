Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C83B3D7B
	for <llvm@lists.linux.dev>; Sat, 11 Jun 2022 22:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654986168; x=1686522168;
  h=date:from:cc:subject:message-id:mime-version;
  bh=rXO9q1UnbuaPGpAWEWKD7oNcrhc+TyKfuNcyRtI9YPM=;
  b=TcAVh/B+1EiqNxy9HRGmh9V4NINDtVjHCKdexSY1YG2JKrk2i8loJFxJ
   NFlwUCN5RuigyBaKM8o18uZNl9INRTyC4q2+yP7oN8os9VM0ugvcFTvRS
   96Mhex5YrppiljDeu2SRKEgx7glqLcbSFKau6YngCC8gjrH2H21G86X/X
   TnlGmaYfWTMYXefq/8zZuKENVK42UZQScVFUihFRhYLh93vhkJdyOqRu1
   cPrleyoo0IdvqL3AtKrF1HQ8ddzUA7MxUKl7Q9y75n/iS9jN9vTrmtSP1
   fBYQQFOJU7C78uxXyjd4iM6VcB2hIQSvEORX7n3yP5Oh9ED1Y5ExnSE80
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10375"; a="364274847"
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="364274847"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2022 15:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="685278426"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Jun 2022 15:22:46 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o09VG-000JNB-A0;
	Sat, 11 Jun 2022 22:22:46 +0000
Date: Sun, 12 Jun 2022 06:22:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [peterz-queue:sched/idle 26/36] vmlinux.o: warning: objtool:
 cpu_idle_poll+0xd4: call to tick_check_broadcast_expired() leaves
 .noinstr.text section
Message-ID: <202206120629.fZjXcCiA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/idle
head:   71aaab7bc1ad5e95c7f1b5895ca4d16e83b4dfdf
commit: 9e433160bc607599df402d672297567e7ba3568e [26/36] cpuidle,sched: Remove annotations from TIF_{POLLING_NRFLAG,NEED_RESCHED}
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220612/202206120629.fZjXcCiA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ff4abe755279a3a47cc416ef80dbc900d9a98a19)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=9e433160bc607599df402d672297567e7ba3568e
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/idle
        git checkout 9e433160bc607599df402d672297567e7ba3568e
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
   vmlinux.o: warning: objtool: kvm_read_and_reset_apf_flags+0x1: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_on+0xa6: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_off+0xa3: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x63: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x32: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x43: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x3d: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x93: call to __monitor() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x9: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: cpu_idle_poll+0xd4: call to tick_check_broadcast_expired() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_do_entry+0x4: call to perf_lopwr_cb() leaves .noinstr.text section
   vmlinux.o: warning: objtool: io_idle+0x3: call to __inb() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

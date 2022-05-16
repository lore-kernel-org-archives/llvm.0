Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4F7138F
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 20:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652733952; x=1684269952;
  h=date:from:cc:subject:message-id:mime-version;
  bh=sS2rY7BUjVQi8xqZPxpoe0M/vhWsNRx8cn7Y+RG2b1g=;
  b=bpkB8EnWIkYAr2cGeUb4Enq0FrmKHyPsQNG4xpCMFJndVS8j/Vib6Tzu
   vSKSGdTPIjqjMGn3xPZaevTUB6h3Bo5eqMVkso/oHJBoiUcDgDRhWIZuJ
   Aa/NjsN2PkHAKnhe7tMdNwvrLFNSna4N8bymJL2BtgG+UC2tDPG01MAib
   QeC9ineA3caYmskBCKmTLpxWUUjA4a6jK/XykGNZG1SaUnnjxpqjyNYaO
   4dUI13HbRhfRcdIPVhiKRbAyPrrEq2iZy2NbpiCQhQW6VZwOBWsCawnVq
   mtuvQJepNvu5qVHP6qwcUYYTBvV49G3oS3DbSXLzd1XmOUNVcW+fldq//
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="296231258"
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="296231258"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 13:45:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="699711028"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 May 2022 13:45:50 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqhbB-0000Jz-VO;
	Mon, 16 May 2022 20:45:49 +0000
Date: Tue, 17 May 2022 04:45:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 27/402] vmlinux.o: warning:
 objtool: kvm_guest_init()+0xba: relocation to !ENDBR:
 __raw_callee_save___kvm_vcpu_is_preempted()+0x0
Message-ID: <202205170436.lsY31f4S-lkp@intel.com>
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
TO: Li RongQing <lirongqing@baidu.com>
CC: Isaku Yamahata <isaku.yamahata@intel.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   ac4f0c947148ba45f7a99d3e0c1779d299fbb2c1
commit: 7d00d7d179ef40ccdc3ce3f4b52a87a5ff83e0de [27/402] KVM: x86: Support the vCPU preemption check with nopvspin and realtime hint
config: x86_64-randconfig-a001-20220516 (https://download.01.org/0day-ci/archive/20220517/202205170436.lsY31f4S-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/7d00d7d179ef40ccdc3ce3f4b52a87a5ff83e0de
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 7d00d7d179ef40ccdc3ce3f4b52a87a5ff83e0de
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ibt_selftest()+0xf: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: kvm_guest_init()+0xba: relocation to !ENDBR: __raw_callee_save___kvm_vcpu_is_preempted()+0x0
   vmlinux.o: warning: objtool: sync_regs()+0x28: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x2a: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0x14: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack()+0x18: call to cpu_entry_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi()+0x117: call to __kasan_check_read() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_page_fault()+0x3b: call to __kasan_check_read() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ibt_selftest()+0x19: return with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365BF7A
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 01:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646875776; x=1678411776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OXbYneJInVZwCybUdFLiYyvUCfRWNANF7grxShhCeP8=;
  b=bjMpv+pq9v67w+RUYMBdTI55wAETPvOoIqkukDp4WYjj9qLtk6sR1pyW
   zPTJeogkIhLwWv3FC3r20gOYUFQEceHHJDEu/1RqIPnbbqaacTCmb8TZy
   6HFj9s7t6frafQFKj5ownxoC47TBTXZT+72WVx27bEmZqV06z2gLOUAC3
   4OX2GG1M8NIwcHzK47COxB7BZBRnhyY8z1L3uA8vo2jnwvP0CprhdZx1A
   RyaG//ka0S9rAcZwuMXguz2a50ne4fwFKNedKSaUNXD0U2TcskQcs3U3L
   13qgVa8tsFzNuc2uNM3wGFHjt8/pei1Sk5uIn3tbcRthRoSiebHTJ8/54
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="237301363"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; 
   d="scan'208";a="237301363"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 17:29:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; 
   d="scan'208";a="611571847"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2022 17:29:33 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nS7cS-00048o-J7; Thu, 10 Mar 2022 01:29:32 +0000
Date: Thu, 10 Mar 2022 09:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: Li RongQing <lirongqing@baidu.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, kvm@vger.kernel.org,
	Robert Hu <robert.hu@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	Danmei Wei <danmei.wei@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [kvm:queue 182/205] <inline asm>:40:208: error: expected relocatable
 expression
Message-ID: <202203100905.1o88Cp2l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
head:   8c1db5a775bc8314d78e99263e0d063a01b692c2
commit: 4ab22f38c2046f2c949cb43fc0f7515666a2a2fb [182/205] KVM: x86: Support the vCPU preemption check with nopvspin and realtime hint
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220310/202203100905.1o88Cp2l-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/virt/kvm/kvm.git/commit/?id=4ab22f38c2046f2c949cb43fc0f7515666a2a2fb
        git remote add kvm https://git.kernel.org/pub/scm/virt/kvm/kvm.git
        git fetch --no-tags kvm queue
        git checkout 4ab22f38c2046f2c949cb43fc0f7515666a2a2fb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> <inline asm>:40:208: error: expected relocatable expression
   .pushsection .text;.global __raw_callee_save___kvm_vcpu_is_preempted;.type __raw_callee_save___kvm_vcpu_is_preempted, @function;__raw_callee_save___kvm_vcpu_is_preempted:movq  __per_cpu_offset(,%rdi,8), %rax;cmpb    $0, KVM_STEAL_TIME_preempted+steal_time(%rax);setne     %al;ret;.size __raw_callee_save___kvm_vcpu_is_preempted, .-__raw_callee_save___kvm_vcpu_is_preempted;.popsection
                                                                                                                                                                                                                   ^
   1 error generated.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

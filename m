Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05EF7B
	for <llvm@lists.linux.dev>; Sat,  9 Jul 2022 20:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657397234; x=1688933234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JoVlVwX6BMuRby3QQvNIysYwgWI6cpUx2QnvUFHbl68=;
  b=kzlnkNfcXcwh19xx5T/Sg9TssLMbyymdiIgByjgSCc2jMsI70re3A7sc
   SkM92X0y/ghrS32tzx5klvmQPQexCtUBEwhq9+Enac3qAdVHke6eC6Ev7
   ItejsQorDnWtOJJyG6FMu3nbq5kqu+BlPux3y+DPby3dn8wVbPAcjFpdu
   lOpr4quITxJIOM00SCxQDDoKYDwdm+nuoq204WEOMZsB35g2HtMa/y3rP
   tClunPsCGj1ood7saHYPDsnDWmlJjfR6nm8P8akaU2nVAarE+l3zdDWUL
   yV8H+uG8EatGb02f2eTHwZZi91IsQZYzmULMRJtfAj2TxX2Sdug0RMIMF
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10403"; a="285584615"
X-IronPort-AV: E=Sophos;i="5.92,259,1650956400"; 
   d="scan'208";a="285584615"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2022 13:07:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,259,1650956400"; 
   d="scan'208";a="544570784"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Jul 2022 13:07:12 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oAGjP-000P3s-TU;
	Sat, 09 Jul 2022 20:07:11 +0000
Date: Sun, 10 Jul 2022 04:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Fomichev <sdf@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>
Subject: [linux-next:master 5835/8914] ld.lld: error: undefined symbol:
 __cgroup_bpf_run_lsm_current
Message-ID: <202207100408.3Fsr7rOp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2528c29385819a84480cacef4886b049761e2c5
commit: 69fd337a975c7e690dfe49d9cb4fe5ba1e6db44e [5835/8914] bpf: per-cgroup lsm flavor
config: arm64-randconfig-r013-20220708 (https://download.01.org/0day-ci/archive/20220710/202207100408.3Fsr7rOp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 77a38f6839980bfac61babb40d83772c51427011)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=69fd337a975c7e690dfe49d9cb4fe5ba1e6db44e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 69fd337a975c7e690dfe49d9cb4fe5ba1e6db44e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __cgroup_bpf_run_lsm_current
   >>> referenced by bpf_lsm.c:0 (kernel/bpf/bpf_lsm.c:0)
   >>> bpf/bpf_lsm.o:(bpf_lsm_find_cgroup_shim) in archive kernel/built-in.a
   >>> referenced by bpf_lsm.c:0 (kernel/bpf/bpf_lsm.c:0)
   >>> bpf/bpf_lsm.o:(bpf_lsm_find_cgroup_shim) in archive kernel/built-in.a
   >>> referenced by bpf_lsm.c:0 (kernel/bpf/bpf_lsm.c:0)
   >>> bpf/bpf_lsm.o:(bpf_lsm_find_cgroup_shim) in archive kernel/built-in.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: __cgroup_bpf_run_lsm_socket
   >>> referenced by bpf_lsm.c:0 (kernel/bpf/bpf_lsm.c:0)
   >>> bpf/bpf_lsm.o:(bpf_lsm_find_cgroup_shim) in archive kernel/built-in.a
   >>> referenced by bpf_lsm.c:0 (kernel/bpf/bpf_lsm.c:0)
   >>> bpf/bpf_lsm.o:(bpf_lsm_find_cgroup_shim) in archive kernel/built-in.a
--
>> ld.lld: error: undefined symbol: __cgroup_bpf_run_lsm_sock
   >>> referenced by bpf_lsm.c:65 (kernel/bpf/bpf_lsm.c:65)
   >>> bpf/bpf_lsm.o:(bpf_lsm_find_cgroup_shim) in archive kernel/built-in.a
   >>> referenced by bpf_lsm.c:65 (kernel/bpf/bpf_lsm.c:65)
   >>> bpf/bpf_lsm.o:(bpf_lsm_find_cgroup_shim) in archive kernel/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

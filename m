Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BCF4C84
	for <llvm@lists.linux.dev>; Fri, 17 Jun 2022 22:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655504039; x=1687040039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gbOy4vnu3/QzrLKXTymMj0U2mUDfzMPdYghScJqPtZs=;
  b=gOfcgRSgxKVMUI69yzaorBC6yN15PLV/4mdaas6lETrtxqVDmtwohQMz
   JgEOsw+wBcpOgPL/NHC5m81vMPzBASmmCT6C71eEItavlvPgrSp+KdCYD
   CQRcqk6RXhNZIqIIYbYhgiGms6W50nN/ob9bYR19eP4Z//auBfq2O/ZSA
   p6yF0ltplY14yEhYwqNU+ULy2UiQpVcOuZ5y/AbcniXSOpo+2GbUabmmM
   kwXZAtdUu77aVSqSurFjmiea65+U7DyMGqh/tjj9Grq/0sbq7k748LUL+
   cRPTpfhJBijj7Hk663dh7Op7pc5qTFYDUhJcJyZ8dhiimzq/Mynt0TPII
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="365921091"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="365921091"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 15:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="590286318"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 17 Jun 2022 15:13:57 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2KE0-000Pnx-O4;
	Fri, 17 Jun 2022 22:13:56 +0000
Date: Sat, 18 Jun 2022 06:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	linux-kernel@vger.kernel.org
Subject: [cilium:pr/meta4 2/2] ld.lld: error: undefined symbol:
 sch_prog_attach_kern
Message-ID: <202206180627.1kpqC1Jb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/meta4
head:   dcea837b60f0d9f8f3cdae284680659042f560d1
commit: dcea837b60f0d9f8f3cdae284680659042f560d1 [2/2] bpf: Add fd-based API to attach tc BPF programs
config: arm-randconfig-r023-20220617 (https://download.01.org/0day-ci/archive/20220618/202206180627.1kpqC1Jb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d764aa7fc6b9cc3fbe960019018f5f9e941eb0a6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/cilium/linux/commit/dcea837b60f0d9f8f3cdae284680659042f560d1
        git remote add cilium https://github.com/cilium/linux.git
        git fetch --no-tags cilium pr/meta4
        git checkout dcea837b60f0d9f8f3cdae284680659042f560d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: sch_prog_attach_kern
   >>> referenced by sch_ingress.c
   >>> sched/sch_ingress.o:(ingress_init) in archive net/built-in.a
   >>> referenced by sch_ingress.c
   >>> sched/sch_ingress.o:(clsact_init) in archive net/built-in.a
   >>> referenced by sch_ingress.c
   >>> sched/sch_ingress.o:(clsact_init) in archive net/built-in.a
--
>> ld.lld: error: undefined symbol: sch_prog_detach_kern
   >>> referenced by sch_ingress.c
   >>> sched/sch_ingress.o:(ingress_destroy) in archive net/built-in.a
   >>> referenced by sch_ingress.c
   >>> sched/sch_ingress.o:(clsact_destroy) in archive net/built-in.a
   >>> referenced by sch_ingress.c
   >>> sched/sch_ingress.o:(clsact_destroy) in archive net/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

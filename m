Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994647F1;
	Fri, 17 Mar 2023 07:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679037474; x=1710573474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sAml/HeBi5qXnzkUPwmWskq+rWHQAKlTXowtB0SS2TM=;
  b=Yu+5L/6EWTp0FLq9v12NnFxCJwiH9q3DfcVBWlof4nlL2VfCCR17ESJl
   xIAKP0lyVxI6a+WuU4bW3xx6JNfsIGuXsYSZBPscf4vIYBgCNb6LuQNvJ
   bThiF9awifet5Hhy8htHWUkEk0KLmOS49qKWci/M+2Q+7CuMzq0ZhQIMt
   0ly7IJoEer053R16METySIsI2eSH4ZpKYBtd9h3hK5RmLSzzVBW/swmkf
   e9XHaOX0hdFGvsX79lNi9ipjqkdnq1CPhOFUiSdfCUVlV2PBBllpStdOx
   iSrGW1xOZfC08apVIqNe+YS3l3NyS4FiC8thaSixIPFkoRuAN2WKOYvwe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="339735187"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="339735187"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 23:40:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="710400908"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="710400908"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Mar 2023 23:40:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd3kt-00099q-0o;
	Fri, 17 Mar 2023 06:39:59 +0000
Date: Fri, 17 Mar 2023 14:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org,
	ast@kernel.org, daniel@iogearbox.net, martin.lau@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, andrii@kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH bpf-next 3/6] bpf: switch BPF verifier log to be a
 rotating log by default
Message-ID: <202303171418.1wRw0c8S-lkp@intel.com>
References: <20230316183013.2882810-4-andrii@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316183013.2882810-4-andrii@kernel.org>

Hi Andrii,

I love your patch! Yet something to improve:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bpf-split-off-basic-BPF-verifier-log-into-separate-file/20230317-023431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230316183013.2882810-4-andrii%40kernel.org
patch subject: [PATCH bpf-next 3/6] bpf: switch BPF verifier log to be a rotating log by default
config: arm-randconfig-r046-20230312 (https://download.01.org/0day-ci/archive/20230317/202303171418.1wRw0c8S-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/f2876fe2427e5bdfbbb27980025b969c93f46c4b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andrii-Nakryiko/bpf-split-off-basic-BPF-verifier-log-into-separate-file/20230317-023431
        git checkout f2876fe2427e5bdfbbb27980025b969c93f46c4b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171418.1wRw0c8S-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __aeabi_uldivmod
   >>> referenced by log.c
   >>>               kernel/bpf/log.o:(bpf_verifier_vlog) in archive vmlinux.a
   >>> referenced by log.c
   >>>               kernel/bpf/log.o:(bpf_verifier_vlog) in archive vmlinux.a
   >>> referenced by log.c
   >>>               kernel/bpf/log.o:(bpf_vlog_finalize) in archive vmlinux.a
   >>> did you mean: __aeabi_uidivmod
   >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

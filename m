Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B24F137B
	for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 10:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647254380; x=1678790380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r0p9pm3oLKHWsveSIV6tlhiifZD0ElwFW/9g6MXz/7M=;
  b=S6eVOtRb7cvEJhuqGzRTvLcoVo0T0QfDdvqN8YBApMJgJcQlJgJyTolY
   z0zGbC6f4jgY3+t8z/6+aBTl7PNZR2DyTKjxnChW/EsbDeCV7ZqAn6zXy
   SR0pdjkfHsr1F2M8S+5WBHWzBjpZwG3jE/Pwi38MNiM+ZAhNfvdsnU1P+
   41qMHTX1Wob8Sg5CZhhq9V5/Qzwx5h3aQC1jDHrcOsrQanh6t+rkMDAx4
   dkc2LfGqKm/sExQInbHvCu1qxjtQ1FwYEZh2dYGi36YfdqoRn26syXuxu
   TbCnUXhYt/ViHPm+Kzbx46l7mUFruMv8sgl9ARvr41nz4ufOtJL4sL2MV
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="253551650"
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; 
   d="scan'208";a="253551650"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 03:39:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; 
   d="scan'208";a="515372378"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Mar 2022 03:39:37 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nTi6y-0009ne-Km; Mon, 14 Mar 2022 10:39:36 +0000
Date: Mon, 14 Mar 2022 18:38:49 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	netfilter-devel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH nf-next 02/12,v2] netfilter: nf_tables: cancel tracking
 for clobbered destination registers
Message-ID: <202203141859.3tgWL82t-lkp@intel.com>
References: <20220314005417.315832-3-pablo@netfilter.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314005417.315832-3-pablo@netfilter.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Pablo,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20220310]
[cannot apply to nf-next/master nf/master linus/master v5.17-rc8 v5.17-rc7 v5.17-rc6 v5.17-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Pablo-Neira-Ayuso/register-tracking-infrastructure-follow-up/20220314-085726
base:    71941773e143369a73c9c4a3b62fbb60736a1182
config: riscv-randconfig-r042-20220314 (https://download.01.org/0day-ci/archive/20220314/202203141859.3tgWL82t-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3e4950d7fa78ac83f33bbf1658e2f49a73719236)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/33636fda14d7c54d333c939eaac47768c7baf913
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Pablo-Neira-Ayuso/register-tracking-infrastructure-follow-up/20220314-085726
        git checkout 33636fda14d7c54d333c939eaac47768c7baf913
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.data+0x2b2994): Section mismatch in reference from the variable trace_event_fields_rpcgss_need_reencode to the function .init.text:set_reset_devices()
The variable trace_event_fields_rpcgss_need_reencode references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x2940fc): Section mismatch in reference from the variable nft_range_type to the function .init.text:set_reset_devices()
The variable nft_range_type references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:


Note: the below error/warnings can be found in parent commit:
<< WARNING: modpost: vmlinux.o(.text+0x1448bbe): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1448bc2): Section mismatch in reference from the function tcp4_proc_exit() to the variable .init.text:.LBB98_4
<< WARNING: modpost: vmlinux.o(.data+0x2b14a0): Section mismatch in reference from the variable trace_event_fields_rpcgss_ctx_class to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b14b4): Section mismatch in reference from the variable trace_event_fields_rpcgss_ctx_class to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b15e8): Section mismatch in reference from the variable event_rpcgss_ctx_init to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b1634): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b1660): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the variable .init.text:.LBB1_1
<< WARNING: modpost: vmlinux.o(.data+0x2b168c): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b1690): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x293824): Section mismatch in reference from the variable nf_ct_proto_mutex to the function .init.text:loglevel()
<< WARNING: modpost: vmlinux.o(.text+0x1448bbe): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1448bc2): Section mismatch in reference from the function tcp4_proc_exit() to the variable .init.text:.LBB98_4
<< WARNING: modpost: vmlinux.o(.data+0x2b14a0): Section mismatch in reference from the variable trace_event_fields_rpcgss_ctx_class to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b14b4): Section mismatch in reference from the variable trace_event_fields_rpcgss_ctx_class to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b15e8): Section mismatch in reference from the variable event_rpcgss_ctx_init to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b1634): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b1660): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the variable .init.text:.LBB1_1
<< WARNING: modpost: vmlinux.o(.data+0x2b168c): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b1690): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x293824): Section mismatch in reference from the variable nf_ct_proto_mutex to the function .init.text:loglevel()

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

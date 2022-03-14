Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F091D1855
	for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 11:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647257452; x=1678793452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T9OM7lbRM6sBr7LMXhS8rmJVF0G2Z+qUjxFlol9/N/k=;
  b=YPCR2GdRf+Y26Q1eH48Oi/+wnGdYu6zdA7xJvzsIm7kQFVZ4/AxiCa6S
   PqRolRSjIWLMO/FjR/4gS2LcSZc7T9fAwXhsBWTIaiNdMcLRMNzgk9Xq2
   +2JjhDbSYQlmgtP+wUmj2CAGTJrh8SJglLcS12YECMPr2fsGD5xWi2oTB
   S1CXX3YUIHieFYDzgI0ISlPJtazt/YxbyCI33AYdZWgCfAXKm8W8C/15L
   zGCaZ1O3dT+yWEHo/RFvg5kXXp4lF0FeVs5TimN9z2vl4FO1ctt/4caMW
   rkeNEslMi70+oCVwME+Ou00ezWhgVDx4mJZAupZ051cX5wf3jH4n9T/b4
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="342426819"
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; 
   d="scan'208";a="342426819"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 04:30:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; 
   d="scan'208";a="645762369"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Mar 2022 04:30:49 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nTiuW-0009pC-CH; Mon, 14 Mar 2022 11:30:48 +0000
Date: Mon, 14 Mar 2022 19:29:49 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 11851/11953] WARNING: modpost:
 vmlinux.o(.data+0x293ae4): Section mismatch in reference from the variable
 nf_ct_proto_mutex to the function .init.text:loglevel()
Message-ID: <202203141933.0aW33U8F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   71941773e143369a73c9c4a3b62fbb60736a1182
commit: c7dfea19781bbd36c2197c83c33227850e217366 [11851/11953] mm/migration: add trace events for base page and HugeTLB migrations
config: riscv-randconfig-r042-20220314 (https://download.01.org/0day-ci/archive/20220314/202203141933.0aW33U8F-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0467eb2cb7654c15ae366967ef35093c5724c416)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c7dfea19781bbd36c2197c83c33227850e217366
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c7dfea19781bbd36c2197c83c33227850e217366
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.data+0x293ae4): Section mismatch in reference from the variable nf_ct_proto_mutex to the function .init.text:loglevel()
The variable nf_ct_proto_mutex references
the function __init loglevel()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x293aec): Section mismatch in reference from the variable nf_ct_proto_mutex to the function .init.text:set_reset_devices()
The variable nf_ct_proto_mutex references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x293ccc): Section mismatch in reference from the variable helper to the function .init.text:set_reset_devices()
The variable helper references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:


Note: the below error/warnings can be found in parent commit:
<< WARNING: modpost: vmlinux.o(.text+0x144827e): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b0ecc): Section mismatch in reference from the variable event_rpcgss_ctx_init to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b0ee8): Section mismatch in reference from the variable event_rpcgss_ctx_init to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b0f18): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b0f34): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b0f60): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:init_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b0f8c): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .exit.text:exit_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b0f90): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b14e8): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x293094): Section mismatch in reference from the variable nf_ct_nat_helpers_mutex to the function .init.text:loglevel()
<< WARNING: modpost: vmlinux.o(.text+0x144827e): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b0ecc): Section mismatch in reference from the variable event_rpcgss_ctx_init to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b0ee8): Section mismatch in reference from the variable event_rpcgss_ctx_init to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b0f18): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b0f34): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b0f60): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:init_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b0f8c): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .exit.text:exit_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b0f90): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b14e8): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x293094): Section mismatch in reference from the variable nf_ct_nat_helpers_mutex to the function .init.text:loglevel()
<< WARNING: modpost: vmlinux.o(.text+0x144827e): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b0ecc): Section mismatch in reference from the variable event_rpcgss_ctx_init to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b0ee8): Section mismatch in reference from the variable event_rpcgss_ctx_init to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b0f18): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b0f34): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b0f60): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:init_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b0f8c): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .exit.text:exit_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b0f90): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b14e8): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x293094): Section mismatch in reference from the variable nf_ct_nat_helpers_mutex to the function .init.text:loglevel()

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

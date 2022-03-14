Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A65E1B73
	for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 15:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647271969; x=1678807969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T/NfigPYndy2tWwevC7RYNfPJauWT/6kUsCWh7obGzo=;
  b=I5LaP7Hq6EqLe8OxcxnFo55G5pYEo30ALmEHJH4Tno0DDYMwfmXu6RwL
   N6ghTP+SPXi5LfjKVUDttdwq/N47InRccyvTonI0mJDDneKosbKJjAw/Z
   nbC05WIuy+dr3LxpHB4Kxtr1L1rtojldzeNStjyUIPXhEL+AMxssvK56Y
   LxEXKE3jb01nYDEap0mn1j81Go3LTrdM7131mxlTlriZwz/Cljjq03A6R
   0WarsB7myZcXELfZK/ZYiD41nyK+5Cf1/15uwXIvDAFf7dj2dV0p1hodR
   w7ClAwIg0MGaMYY83XIPsy+R5LwBDUO5efwayyL+XeCM0rabgG8JUENVD
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="238230545"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="238230545"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 08:32:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="515473282"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Mar 2022 08:32:46 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nTmgf-0009yc-FV; Mon, 14 Mar 2022 15:32:45 +0000
Date: Mon, 14 Mar 2022 23:31:56 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Konovalov <andreyknvl@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 11880/11953] WARNING: modpost:
 vmlinux.o(.data+0x2b1660): Section mismatch in reference from the variable
 trace_event_fields_rpcgss_svc_gssapi_class to the function
 .exit.text:test_ww_mutex_exit()
Message-ID: <202203142305.feC2t4QX-lkp@intel.com>
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
commit: 35d1863f8399825fc31d764b844fb5c35fd853ba [11880/11953] kasan, mm: only define ___GFP_SKIP_KASAN_POISON with HW_TAGS
config: riscv-randconfig-r042-20220314 (https://download.01.org/0day-ci/archive/20220314/202203142305.feC2t4QX-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0467eb2cb7654c15ae366967ef35093c5724c416)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=35d1863f8399825fc31d764b844fb5c35fd853ba
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 35d1863f8399825fc31d764b844fb5c35fd853ba
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.data+0x2b1660): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .exit.text:test_ww_mutex_exit()
The variable trace_event_fields_rpcgss_svc_gssapi_class references
the function __exit test_ww_mutex_exit()
If the reference is valid then annotate the
variable with (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x2b1c7c): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_unwrap_failed to the function .exit.text:test_ww_mutex_exit()
The variable trace_event_fields_rpcgss_svc_unwrap_failed references
the function __exit test_ww_mutex_exit()
If the reference is valid then annotate the
variable with (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x2b1d80): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_seqno_bad to the function .exit.text:test_ww_mutex_exit()
The variable trace_event_fields_rpcgss_svc_seqno_bad references
the function __exit test_ww_mutex_exit()
If the reference is valid then annotate the
variable with (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x2b1ec8): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_accept_upcall to the function .exit.text:test_ww_mutex_exit()
The variable trace_event_fields_rpcgss_svc_accept_upcall references
the function __exit test_ww_mutex_exit()
If the reference is valid then annotate the
variable with (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x2b24e8): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_authenticate to the function .exit.text:test_ww_mutex_exit()
The variable trace_event_fields_rpcgss_svc_authenticate references
the function __exit test_ww_mutex_exit()
If the reference is valid then annotate the
variable with (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x2b2820): Section mismatch in reference from the variable trace_event_fields_rpcgss_seqno to the function .exit.text:test_ww_mutex_exit()
The variable trace_event_fields_rpcgss_seqno references
the function __exit test_ww_mutex_exit()
If the reference is valid then annotate the
variable with (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x2b2950): Section mismatch in reference from the variable trace_event_fields_rpcgss_need_reencode to the function .exit.text:test_ww_mutex_exit()
The variable trace_event_fields_rpcgss_need_reencode references
the function __exit test_ww_mutex_exit()
If the reference is valid then annotate the
variable with (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x2b2af4): Section mismatch in reference from the variable trace_event_fields_rpcgss_update_slack to the function .exit.text:test_ww_mutex_exit()
The variable trace_event_fields_rpcgss_update_slack references
the function __exit test_ww_mutex_exit()
If the reference is valid then annotate the
variable with (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x2b2c84): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_seqno_class to the function .exit.text:test_ww_mutex_exit()
The variable trace_event_fields_rpcgss_svc_seqno_class references
the function __exit test_ww_mutex_exit()
If the reference is valid then annotate the
variable with (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x2b2da0): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_seqno_low to the function .exit.text:test_ww_mutex_exit()
The variable trace_event_fields_rpcgss_svc_seqno_low references
the function __exit test_ww_mutex_exit()
If the reference is valid then annotate the
variable with (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x2b318c): Section mismatch in reference from the variable event_rpcgss_context to the variable .exit.text:.LBB0_1
The variable event_rpcgss_context references
the variable __exit .LBB0_1
If the reference is valid then annotate the
variable with (see linux/init.h) or name the variable:

..

Note: the below error/warnings can be found in parent commit:
<< WARNING: modpost: vmlinux.o(.text+0x1448b6a): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b18a8): Section mismatch in reference from the variable event_rpcgss_ctx_init to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b18ac): Section mismatch in reference from the variable event_rpcgss_ctx_init to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18d8): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18f4): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b1920): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:init_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b194c): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .exit.text:exit_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b1950): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ea8): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ec4): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the variable .init.text:.LBB1_1
<< WARNING: modpost: vmlinux.o(.text+0x1448b6a): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b18a8): Section mismatch in reference from the variable event_rpcgss_ctx_init to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b18ac): Section mismatch in reference from the variable event_rpcgss_ctx_init to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18d8): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18f4): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b1920): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:init_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b194c): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .exit.text:exit_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b1950): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ea8): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ec4): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the variable .init.text:.LBB1_1
<< WARNING: modpost: vmlinux.o(.text+0x1448b6a): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b18a8): Section mismatch in reference from the variable event_rpcgss_ctx_init to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b18ac): Section mismatch in reference from the variable event_rpcgss_ctx_init to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18d8): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18f4): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b1920): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:init_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b194c): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .exit.text:exit_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b1950): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ea8): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ec4): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the variable .init.text:.LBB1_1
<< WARNING: modpost: vmlinux.o(.text+0x1448b6a): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b18a8): Section mismatch in reference from the variable event_rpcgss_ctx_init to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b18ac): Section mismatch in reference from the variable event_rpcgss_ctx_init to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18d8): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18f4): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b1920): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:init_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b194c): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .exit.text:exit_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b1950): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ea8): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ec4): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the variable .init.text:.LBB1_1
<< WARNING: modpost: vmlinux.o(.text+0x1448b6a): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b18a8): Section mismatch in reference from the variable event_rpcgss_ctx_init to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b18ac): Section mismatch in reference from the variable event_rpcgss_ctx_init to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18d8): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18f4): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b1920): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:init_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b194c): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .exit.text:exit_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b1950): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ea8): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ec4): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the variable .init.text:.LBB1_1
<< WARNING: modpost: vmlinux.o(.text+0x1448b6a): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b18a8): Section mismatch in reference from the variable event_rpcgss_ctx_init to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b18ac): Section mismatch in reference from the variable event_rpcgss_ctx_init to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18d8): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18f4): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b1920): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:init_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b194c): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .exit.text:exit_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b1950): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ea8): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ec4): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the variable .init.text:.LBB1_1
<< WARNING: modpost: vmlinux.o(.text+0x1448b6a): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b18a8): Section mismatch in reference from the variable event_rpcgss_ctx_init to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b18ac): Section mismatch in reference from the variable event_rpcgss_ctx_init to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18d8): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18f4): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b1920): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:init_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b194c): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .exit.text:exit_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b1950): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ea8): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ec4): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the variable .init.text:.LBB1_1
<< WARNING: modpost: vmlinux.o(.text+0x1448b6a): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b18a8): Section mismatch in reference from the variable event_rpcgss_ctx_init to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b18ac): Section mismatch in reference from the variable event_rpcgss_ctx_init to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18d8): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18f4): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b1920): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:init_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b194c): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .exit.text:exit_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b1950): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ea8): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ec4): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the variable .init.text:.LBB1_1
<< WARNING: modpost: vmlinux.o(.text+0x1448b6a): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b18a8): Section mismatch in reference from the variable event_rpcgss_ctx_init to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b18ac): Section mismatch in reference from the variable event_rpcgss_ctx_init to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18d8): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18f4): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b1920): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:init_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b194c): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .exit.text:exit_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b1950): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ea8): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ec4): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the variable .init.text:.LBB1_1
<< WARNING: modpost: vmlinux.o(.text+0x1448b6a): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b18a8): Section mismatch in reference from the variable event_rpcgss_ctx_init to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b18ac): Section mismatch in reference from the variable event_rpcgss_ctx_init to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18d8): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18f4): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b1920): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:init_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b194c): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .exit.text:exit_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b1950): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ea8): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ec4): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the variable .init.text:.LBB1_1
<< WARNING: modpost: vmlinux.o(.text+0x1448b6a): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b18a8): Section mismatch in reference from the variable event_rpcgss_ctx_init to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b18ac): Section mismatch in reference from the variable event_rpcgss_ctx_init to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18d8): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b18f4): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b1920): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:init_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b194c): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .exit.text:exit_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b1950): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ea8): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1ec4): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the variable .init.text:.LBB1_1

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

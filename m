Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD928F6E;
	Tue,  2 May 2023 19:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683054636; x=1714590636;
  h=date:from:cc:subject:message-id:mime-version;
  bh=FrU3NoIYNj8IaFmOTbrj7Py2/SHFfYt84I79aboFSD4=;
  b=JVq6H/1KaXx/xj7XBQ/R3vu9gdx62JpyJVJ3TAsq4irGz5lWKAHXiKn/
   w0gYYcgtaSMXvxCqWAxTCgn/5SiB7yCvFjRYshLAvHXpm8hINcjQYmnj2
   78HHE5UBDlPpOQuxeNzO3wwqX8e/+DeBZF0MEZhl6ekxirE2QnGFrIHuJ
   PmNA4HhEAmcC/tskvEuBZynQJJCTPMezXtCdTgr+AwfqI7RnuCf3f1Ur8
   nTEI+xI+auHPKIgDqilUyJ0kxcW2Ru3P3dm3Q5XAlxVmuPcxSchepQCTo
   1+71FUKfj1erqZ/PkN1A+yxTUuf489YenV9BCgC5OQu6eZtBBm0WIA05Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="332841556"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="332841556"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 12:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="646639328"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="646639328"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 May 2023 12:10:34 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptvOU-0001Eq-0X;
	Tue, 02 May 2023 19:10:34 +0000
Date: Wed, 3 May 2023 03:09:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jarkko-tpmdd:tpm1-s3-bug 2/11] fs/cifs/cifs.o: warning: objtool:
 __UNIQUE_ID___addressable_init_module1861+0x0: data relocation to !ENDBR:
 init_module+0x0
Message-ID: <202305030316.Ax7OTfdH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Seth Forshee <seth.forshee@canonical.com>
CC: "Kernel Builder (kathleen)" <ubuntu-kernel-bot@canonical.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm1-s3-bug
head:   16b1299c9762360866dd649a99c6c03f8a213fe4
commit: ff4966a776397da3cce9078aa767917f294deeda [2/11] UBUNTU: SAUCE: kbuild: add -fcf-protection=none when using retpoline flags
config: x86_64-randconfig-k001 (https://download.01.org/0day-ci/archive/20230503/202305030316.Ax7OTfdH-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=ff4966a776397da3cce9078aa767917f294deeda
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd tpm1-s3-bug
        git checkout ff4966a776397da3cce9078aa767917f294deeda
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash crypto// drivers/ fs/ kernel/ lib// mm// net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305030316.Ax7OTfdH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_cifs_flush_err+0x8: data relocation to !ENDBR: __bpf_trace_smb3_sync_err_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_enter+0x8: data relocation to !ENDBR: __bpf_trace_smb3_enter_exit_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_exit_done+0x8: data relocation to !ENDBR: __bpf_trace_smb3_enter_exit_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_tcon+0x8: data relocation to !ENDBR: __bpf_trace_smb3_tcon_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_open_enter+0x8: data relocation to !ENDBR: __bpf_trace_smb3_open_enter_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_posix_mkdir_enter+0x8: data relocation to !ENDBR: __bpf_trace_smb3_open_enter_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_open_err+0x8: data relocation to !ENDBR: __bpf_trace_smb3_open_err_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_posix_mkdir_err+0x8: data relocation to !ENDBR: __bpf_trace_smb3_open_err_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_open_done+0x8: data relocation to !ENDBR: __bpf_trace_smb3_open_done_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_posix_mkdir_done+0x8: data relocation to !ENDBR: __bpf_trace_smb3_open_done_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_lease_done+0x8: data relocation to !ENDBR: __bpf_trace_smb3_lease_done_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_lease_not_found+0x8: data relocation to !ENDBR: __bpf_trace_smb3_lease_done_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_lease_err+0x8: data relocation to !ENDBR: __bpf_trace_smb3_lease_err_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_connect_done+0x8: data relocation to !ENDBR: __bpf_trace_smb3_connect_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_connect_err+0x8: data relocation to !ENDBR: __bpf_trace_smb3_connect_err_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_reconnect+0x8: data relocation to !ENDBR: __bpf_trace_smb3_reconnect_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_partial_send_reconnect+0x8: data relocation to !ENDBR: __bpf_trace_smb3_reconnect_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_reconnect_with_invalid_credits+0x8: data relocation to !ENDBR: __bpf_trace_smb3_credit_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_reconnect_detected+0x8: data relocation to !ENDBR: __bpf_trace_smb3_credit_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_credit_timeout+0x8: data relocation to !ENDBR: __bpf_trace_smb3_credit_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_insufficient_credits+0x8: data relocation to !ENDBR: __bpf_trace_smb3_credit_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_too_many_credits+0x8: data relocation to !ENDBR: __bpf_trace_smb3_credit_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_add_credits+0x8: data relocation to !ENDBR: __bpf_trace_smb3_credit_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_adj_credits+0x8: data relocation to !ENDBR: __bpf_trace_smb3_credit_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_hdr_credits+0x8: data relocation to !ENDBR: __bpf_trace_smb3_credit_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_nblk_credits+0x8: data relocation to !ENDBR: __bpf_trace_smb3_credit_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_pend_credits+0x8: data relocation to !ENDBR: __bpf_trace_smb3_credit_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_wait_credits+0x8: data relocation to !ENDBR: __bpf_trace_smb3_credit_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_waitff_credits+0x8: data relocation to !ENDBR: __bpf_trace_smb3_credit_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_overflow_credits+0x8: data relocation to !ENDBR: __bpf_trace_smb3_credit_class+0x0
   fs/cifs/cifs.o: warning: objtool: __bpf_trace_tp_map_smb3_set_credits+0x8: data relocation to !ENDBR: __bpf_trace_smb3_credit_class+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x0: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x8: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x10: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x18: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x20: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x28: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x30: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x38: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x40: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x48: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x50: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x58: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x60: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x68: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x70: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x78: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x80: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x88: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x90: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x98: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0xa0: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0xa8: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0xb0: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0xb8: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0xc0: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0xc8: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0xd0: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0xd8: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0xe0: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0xe8: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0xf0: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0xf8: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x100: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x108: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x110: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .init_array.1+0x118: data relocation to !ENDBR: asan.module_ctor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x0: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x8: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x10: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x18: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x20: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x28: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x30: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x38: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x40: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x48: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x50: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x58: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x60: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x68: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x70: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x78: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x80: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x88: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x90: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x98: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0xa0: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0xa8: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0xb0: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0xb8: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0xc0: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0xc8: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0xd0: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0xd8: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0xe0: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0xe8: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0xf0: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0xf8: data relocation to !ENDBR: asan.module_dtor+0x0
   fs/cifs/cifs.o: warning: objtool: .fini_array.1+0x100: data relocation to !ENDBR: asan.module_dtor+0x0
>> fs/cifs/cifs.o: warning: objtool: __UNIQUE_ID___addressable_init_module1861+0x0: data relocation to !ENDBR: init_module+0x0
>> fs/cifs/cifs.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module1862+0x0: data relocation to !ENDBR: cleanup_module+0x0
--
   In file included from crypto/gcm.c:8:
   In file included from include/crypto/gf128mul.h:54:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:10:
   In file included from include/linux/linkage.h:8:
   In file included from arch/x86/include/asm/linkage.h:6:
   arch/x86/include/asm/ibt.h:77:8: warning: 'nocf_check' attribute ignored; use -fcf-protection to enable the attribute [-Wignored-attributes]
   extern __noendbr u64 ibt_save(bool disable);
          ^
   arch/x86/include/asm/ibt.h:32:34: note: expanded from macro '__noendbr'
   #define __noendbr       __attribute__((nocf_check))
                                          ^
   arch/x86/include/asm/ibt.h:78:8: warning: 'nocf_check' attribute ignored; use -fcf-protection to enable the attribute [-Wignored-attributes]
   extern __noendbr void ibt_restore(u64 save);
          ^
   arch/x86/include/asm/ibt.h:32:34: note: expanded from macro '__noendbr'
   #define __noendbr       __attribute__((nocf_check))
                                          ^
   2 warnings generated.
   crypto/gcm.o: warning: objtool: crypto_rfc4106_create+0x34a: relocation to !ENDBR: crypto_rfc4106_init_tfm+0x0
>> crypto/gcm.o: warning: objtool: crypto_rfc4106_create+0x375: relocation to !ENDBR: crypto_rfc4106_exit_tfm+0x0
>> crypto/gcm.o: warning: objtool: crypto_rfc4106_create+0x39c: relocation to !ENDBR: crypto_rfc4106_setkey+0x0
>> crypto/gcm.o: warning: objtool: crypto_rfc4106_create+0x3c4: relocation to !ENDBR: crypto_rfc4106_setauthsize+0x0
>> crypto/gcm.o: warning: objtool: crypto_rfc4106_create+0x3ef: relocation to !ENDBR: crypto_rfc4106_encrypt+0x0
>> crypto/gcm.o: warning: objtool: crypto_rfc4106_create+0x417: relocation to !ENDBR: crypto_rfc4106_decrypt+0x0
>> crypto/gcm.o: warning: objtool: crypto_rfc4106_create+0x434: relocation to !ENDBR: crypto_rfc4106_free+0x0
   crypto/gcm.o: warning: objtool: crypto_rfc4543_create+0x34a: relocation to !ENDBR: crypto_rfc4543_init_tfm+0x0
>> crypto/gcm.o: warning: objtool: crypto_rfc4543_create+0x375: relocation to !ENDBR: crypto_rfc4543_exit_tfm+0x0
>> crypto/gcm.o: warning: objtool: crypto_rfc4543_create+0x39c: relocation to !ENDBR: crypto_rfc4543_setkey+0x0
>> crypto/gcm.o: warning: objtool: crypto_rfc4543_create+0x3c4: relocation to !ENDBR: crypto_rfc4543_setauthsize+0x0
>> crypto/gcm.o: warning: objtool: crypto_rfc4543_create+0x3ef: relocation to !ENDBR: crypto_rfc4543_encrypt+0x0
>> crypto/gcm.o: warning: objtool: crypto_rfc4543_create+0x417: relocation to !ENDBR: crypto_rfc4543_decrypt+0x0
>> crypto/gcm.o: warning: objtool: crypto_rfc4543_create+0x434: relocation to !ENDBR: crypto_rfc4543_free+0x0
   crypto/gcm.o: warning: objtool: crypto_gcm_create_common+0x4d6: relocation to !ENDBR: crypto_gcm_init_tfm+0x0
>> crypto/gcm.o: warning: objtool: crypto_gcm_create_common+0x501: relocation to !ENDBR: crypto_gcm_exit_tfm+0x0
>> crypto/gcm.o: warning: objtool: crypto_gcm_create_common+0x527: relocation to !ENDBR: crypto_gcm_setkey+0x0
>> crypto/gcm.o: warning: objtool: crypto_gcm_create_common+0x545: relocation to !ENDBR: crypto_gcm_setauthsize+0x0
>> crypto/gcm.o: warning: objtool: crypto_gcm_create_common+0x563: relocation to !ENDBR: crypto_gcm_encrypt+0x0
>> crypto/gcm.o: warning: objtool: crypto_gcm_create_common+0x581: relocation to !ENDBR: crypto_gcm_decrypt+0x0
>> crypto/gcm.o: warning: objtool: crypto_gcm_create_common+0x59e: relocation to !ENDBR: crypto_gcm_free+0x0
   crypto/gcm.o: warning: objtool: crypto_gcm_encrypt+0x2d3: relocation to !ENDBR: gcm_encrypt_done+0x0
>> crypto/gcm.o: warning: objtool: crypto_gcm_encrypt+0x460: relocation to !ENDBR: gcm_enc_copy_hash+0x0
>> crypto/gcm.o: warning: objtool: crypto_gcm_encrypt+0x529: relocation to !ENDBR: gcm_hash_init_done+0x0
   crypto/gcm.o: warning: objtool: crypto_gcm_decrypt+0x15a: relocation to !ENDBR: gcm_dec_hash_continue+0x0
   crypto/gcm.o: warning: objtool: crypto_gcm_decrypt+0x21f: relocation to !ENDBR: gcm_hash_init_done+0x0
   crypto/gcm.o: warning: objtool: gcm_encrypt_done+0x160: relocation to !ENDBR: gcm_enc_copy_hash+0x0
   crypto/gcm.o: warning: objtool: gcm_encrypt_done+0x22f: relocation to !ENDBR: gcm_hash_init_done+0x0
   crypto/gcm.o: warning: objtool: gcm_hash_init_continue+0xf1: relocation to !ENDBR: gcm_hash_assoc_done+0x0
   crypto/gcm.o: warning: objtool: gcm_hash_init_continue+0x2a6: relocation to !ENDBR: gcm_hash_assoc_remain_done+0x0
   crypto/gcm.o: warning: objtool: gcm_hash_assoc_done+0xcc: relocation to !ENDBR: gcm_hash_assoc_remain_done+0x0
   crypto/gcm.o: warning: objtool: gcm_hash_assoc_remain_continue+0xea: relocation to !ENDBR: gcm_hash_crypt_done+0x0
   crypto/gcm.o: warning: objtool: gcm_hash_assoc_remain_continue+0x2b1: relocation to !ENDBR: gcm_hash_crypt_remain_done+0x0
   crypto/gcm.o: warning: objtool: gcm_hash_crypt_done+0xd1: relocation to !ENDBR: gcm_hash_crypt_remain_done+0x0
   crypto/gcm.o: warning: objtool: gcm_hash_crypt_remain_continue+0x176: relocation to !ENDBR: gcm_hash_len_done+0x0
   crypto/gcm.o: warning: objtool: gcm_dec_hash_continue+0x212: relocation to !ENDBR: gcm_decrypt_done+0x0
   crypto/gcm.o: warning: objtool: __UNIQUE_ID___addressable_init_module701+0x0: data relocation to !ENDBR: init_module+0x0
   crypto/gcm.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module702+0x0: data relocation to !ENDBR: cleanup_module+0x0
   crypto/gcm.o: warning: objtool: crypto_gcm_tmpls+0x20: data relocation to !ENDBR: crypto_gcm_base_create+0x0
   crypto/gcm.o: warning: objtool: crypto_gcm_tmpls+0xc8: data relocation to !ENDBR: crypto_gcm_create+0x0
   crypto/gcm.o: warning: objtool: crypto_gcm_tmpls+0x170: data relocation to !ENDBR: crypto_rfc4106_create+0x0
   crypto/gcm.o: warning: objtool: crypto_gcm_tmpls+0x218: data relocation to !ENDBR: crypto_rfc4543_create+0x0
   crypto/gcm.o: warning: objtool: .init_array.1+0x0: data relocation to !ENDBR: asan.module_ctor+0x0
   crypto/gcm.o: warning: objtool: .fini_array.1+0x0: data relocation to !ENDBR: asan.module_dtor+0x0
--
   In file included from drivers/net/virtio_net.c:7:
   In file included from include/linux/netdevice.h:24:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:5:
   In file included from include/linux/cache.h:6:
   In file included from arch/x86/include/asm/cache.h:5:
   In file included from include/linux/linkage.h:8:
   In file included from arch/x86/include/asm/linkage.h:6:
   arch/x86/include/asm/ibt.h:77:8: warning: 'nocf_check' attribute ignored; use -fcf-protection to enable the attribute [-Wignored-attributes]
   extern __noendbr u64 ibt_save(bool disable);
          ^
   arch/x86/include/asm/ibt.h:32:34: note: expanded from macro '__noendbr'
   #define __noendbr       __attribute__((nocf_check))
                                          ^
   arch/x86/include/asm/ibt.h:78:8: warning: 'nocf_check' attribute ignored; use -fcf-protection to enable the attribute [-Wignored-attributes]
   extern __noendbr void ibt_restore(u64 save);
          ^
   arch/x86/include/asm/ibt.h:32:34: note: expanded from macro '__noendbr'
   #define __noendbr       __attribute__((nocf_check))
                                          ^
   2 warnings generated.
   drivers/net/virtio_net.o: warning: objtool: virtnet_probe+0xa11: relocation to !ENDBR: virtnet_config_changed_work+0x0
   drivers/net/virtio_net.o: warning: objtool: init_vqs+0x22a: relocation to !ENDBR: refill_work+0x0
   drivers/net/virtio_net.o: warning: objtool: init_vqs+0x31b: relocation to !ENDBR: virtnet_poll+0x0
   drivers/net/virtio_net.o: warning: objtool: init_vqs+0x38b: relocation to !ENDBR: virtnet_poll_tx+0x0
   drivers/net/virtio_net.o: warning: objtool: init_vqs+0x720: relocation to !ENDBR: skb_recv_done+0x0
   drivers/net/virtio_net.o: warning: objtool: init_vqs+0x751: relocation to !ENDBR: skb_xmit_done+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_set_ringparam+0x5b2: relocation to !ENDBR: virtnet_sq_free_unused_buf+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_set_ringparam+0x86f: relocation to !ENDBR: virtnet_rq_free_unused_buf+0x0
   drivers/net/virtio_net.o: warning: objtool: init_module+0x15: relocation to !ENDBR: virtnet_cpu_online+0x0
   drivers/net/virtio_net.o: warning: objtool: init_module+0x1c: relocation to !ENDBR: virtnet_cpu_down_prep+0x0
   drivers/net/virtio_net.o: warning: objtool: init_module+0x4c: relocation to !ENDBR: virtnet_cpu_dead+0x0
   drivers/net/virtio_net.o: warning: objtool: virtio_net_driver+0xb8: data relocation to !ENDBR: virtnet_validate+0x0
   drivers/net/virtio_net.o: warning: objtool: virtio_net_driver+0xc0: data relocation to !ENDBR: virtnet_probe+0x0
   drivers/net/virtio_net.o: warning: objtool: virtio_net_driver+0xd0: data relocation to !ENDBR: virtnet_remove+0x0
   drivers/net/virtio_net.o: warning: objtool: virtio_net_driver+0xd8: data relocation to !ENDBR: virtnet_config_changed+0x0
   drivers/net/virtio_net.o: warning: objtool: virtio_net_driver+0xe0: data relocation to !ENDBR: virtnet_freeze+0x0
   drivers/net/virtio_net.o: warning: objtool: virtio_net_driver+0xe8: data relocation to !ENDBR: virtnet_restore+0x0
   drivers/net/virtio_net.o: warning: objtool: mergeable_rx_buffer_size_attribute+0x28: data relocation to !ENDBR: mergeable_rx_buffer_size_show+0x0
>> drivers/net/virtio_net.o: warning: objtool: __UNIQUE_ID___addressable_init_module1447+0x0: data relocation to !ENDBR: init_module+0x0
>> drivers/net/virtio_net.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module1448+0x0: data relocation to !ENDBR: cleanup_module+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x10: data relocation to !ENDBR: virtnet_open+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x18: data relocation to !ENDBR: virtnet_close+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x20: data relocation to !ENDBR: start_xmit+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x40: data relocation to !ENDBR: virtnet_set_rx_mode+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x48: data relocation to !ENDBR: virtnet_set_mac_address+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x98: data relocation to !ENDBR: virtnet_tx_timeout+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0xa0: data relocation to !ENDBR: virtnet_stats+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0xc0: data relocation to !ENDBR: virtnet_vlan_rx_add_vid+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0xc8: data relocation to !ENDBR: virtnet_vlan_rx_kill_vid+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x170: data relocation to !ENDBR: virtnet_set_features+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x1e0: data relocation to !ENDBR: virtnet_get_phys_port_name+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x218: data relocation to !ENDBR: virtnet_xdp+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x220: data relocation to !ENDBR: virtnet_xdp_xmit+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x10: data relocation to !ENDBR: virtnet_get_drvinfo+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x80: data relocation to !ENDBR: virtnet_get_coalesce+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x88: data relocation to !ENDBR: virtnet_set_coalesce+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x90: data relocation to !ENDBR: virtnet_get_ringparam+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x98: data relocation to !ENDBR: virtnet_set_ringparam+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0xc0: data relocation to !ENDBR: virtnet_get_strings+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0xd0: data relocation to !ENDBR: virtnet_get_ethtool_stats+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0xf8: data relocation to !ENDBR: virtnet_get_sset_count+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x100: data relocation to !ENDBR: virtnet_get_rxnfc+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x108: data relocation to !ENDBR: virtnet_set_rxnfc+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x120: data relocation to !ENDBR: virtnet_get_rxfh_key_size+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x128: data relocation to !ENDBR: virtnet_get_rxfh_indir_size+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x130: data relocation to !ENDBR: virtnet_get_rxfh+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x138: data relocation to !ENDBR: virtnet_set_rxfh+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x150: data relocation to !ENDBR: virtnet_get_channels+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x158: data relocation to !ENDBR: virtnet_set_channels+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x1c0: data relocation to !ENDBR: virtnet_get_link_ksettings+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x1c8: data relocation to !ENDBR: virtnet_set_link_ksettings+0x0
   drivers/net/virtio_net.o: warning: objtool: .init_array.1+0x0: data relocation to !ENDBR: asan.module_ctor+0x0
   drivers/net/virtio_net.o: warning: objtool: .fini_array.1+0x0: data relocation to !ENDBR: asan.module_dtor+0x0
--
   In file included from drivers/net/net_failover.c:17:
   In file included from include/linux/netdevice.h:24:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:5:
   In file included from include/linux/cache.h:6:
   In file included from arch/x86/include/asm/cache.h:5:
   In file included from include/linux/linkage.h:8:
   In file included from arch/x86/include/asm/linkage.h:6:
   arch/x86/include/asm/ibt.h:77:8: warning: 'nocf_check' attribute ignored; use -fcf-protection to enable the attribute [-Wignored-attributes]
   extern __noendbr u64 ibt_save(bool disable);
          ^
   arch/x86/include/asm/ibt.h:32:34: note: expanded from macro '__noendbr'
   #define __noendbr       __attribute__((nocf_check))
                                          ^
   arch/x86/include/asm/ibt.h:78:8: warning: 'nocf_check' attribute ignored; use -fcf-protection to enable the attribute [-Wignored-attributes]
   extern __noendbr void ibt_restore(u64 save);
          ^
   arch/x86/include/asm/ibt.h:32:34: note: expanded from macro '__noendbr'
   #define __noendbr       __attribute__((nocf_check))
                                          ^
   2 warnings generated.
   drivers/net/net_failover.o: warning: objtool: ___ksymtab_gpl+net_failover_create+0x0: data relocation to !ENDBR: net_failover_create+0x0
   drivers/net/net_failover.o: warning: objtool: ___ksymtab_gpl+net_failover_destroy+0x0: data relocation to !ENDBR: net_failover_destroy+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0x10: data relocation to !ENDBR: net_failover_open+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0x18: data relocation to !ENDBR: net_failover_close+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0x20: data relocation to !ENDBR: net_failover_start_xmit+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0x30: data relocation to !ENDBR: net_failover_select_queue+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0x40: data relocation to !ENDBR: net_failover_set_rx_mode+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0x88: data relocation to !ENDBR: net_failover_change_mtu+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0xa0: data relocation to !ENDBR: net_failover_get_stats+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0xc0: data relocation to !ENDBR: net_failover_vlan_rx_add_vid+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0xc8: data relocation to !ENDBR: net_failover_vlan_rx_kill_vid+0x0
   drivers/net/net_failover.o: warning: objtool: failover_ethtool_ops+0x10: data relocation to !ENDBR: nfo_ethtool_get_drvinfo+0x0
   drivers/net/net_failover.o: warning: objtool: failover_ethtool_ops+0x1c0: data relocation to !ENDBR: nfo_ethtool_get_link_ksettings+0x0
   drivers/net/net_failover.o: warning: objtool: net_failover_ops+0x0: data relocation to !ENDBR: net_failover_slave_pre_register+0x0
   drivers/net/net_failover.o: warning: objtool: net_failover_ops+0x8: data relocation to !ENDBR: net_failover_slave_register+0x0
   drivers/net/net_failover.o: warning: objtool: net_failover_ops+0x10: data relocation to !ENDBR: net_failover_slave_pre_unregister+0x0
   drivers/net/net_failover.o: warning: objtool: net_failover_ops+0x18: data relocation to !ENDBR: net_failover_slave_unregister+0x0
   drivers/net/net_failover.o: warning: objtool: net_failover_ops+0x20: data relocation to !ENDBR: net_failover_slave_link_change+0x0
   drivers/net/net_failover.o: warning: objtool: net_failover_ops+0x28: data relocation to !ENDBR: net_failover_slave_name_change+0x0
   drivers/net/net_failover.o: warning: objtool: net_failover_ops+0x30: data relocation to !ENDBR: net_failover_handle_frame+0x0
>> drivers/net/net_failover.o: warning: objtool: __UNIQUE_ID___addressable_init_module973+0x0: data relocation to !ENDBR: init_module+0x0
>> drivers/net/net_failover.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module974+0x0: data relocation to !ENDBR: cleanup_module+0x0
   drivers/net/net_failover.o: warning: objtool: .init_array.1+0x0: data relocation to !ENDBR: asan.module_ctor+0x0
   drivers/net/net_failover.o: warning: objtool: .fini_array.1+0x0: data relocation to !ENDBR: asan.module_dtor+0x0
--
   In file included from net/core/failover.c:10:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:5:
   In file included from include/linux/cache.h:6:
   In file included from arch/x86/include/asm/cache.h:5:
   In file included from include/linux/linkage.h:8:
   In file included from arch/x86/include/asm/linkage.h:6:
   arch/x86/include/asm/ibt.h:77:8: warning: 'nocf_check' attribute ignored; use -fcf-protection to enable the attribute [-Wignored-attributes]
   extern __noendbr u64 ibt_save(bool disable);
          ^
   arch/x86/include/asm/ibt.h:32:34: note: expanded from macro '__noendbr'
   #define __noendbr       __attribute__((nocf_check))
                                          ^
   arch/x86/include/asm/ibt.h:78:8: warning: 'nocf_check' attribute ignored; use -fcf-protection to enable the attribute [-Wignored-attributes]
   extern __noendbr void ibt_restore(u64 save);
          ^
   arch/x86/include/asm/ibt.h:32:34: note: expanded from macro '__noendbr'
   #define __noendbr       __attribute__((nocf_check))
                                          ^
   2 warnings generated.
   net/core/failover.o: warning: objtool: ___ksymtab_gpl+failover_slave_unregister+0x0: data relocation to !ENDBR: failover_slave_unregister+0x0
   net/core/failover.o: warning: objtool: ___ksymtab_gpl+failover_register+0x0: data relocation to !ENDBR: failover_register+0x0
   net/core/failover.o: warning: objtool: ___ksymtab_gpl+failover_unregister+0x0: data relocation to !ENDBR: failover_unregister+0x0
   net/core/failover.o: warning: objtool: failover_notifier+0x0: data relocation to !ENDBR: failover_event+0x0
>> net/core/failover.o: warning: objtool: __UNIQUE_ID___addressable_init_module900+0x0: data relocation to !ENDBR: init_module+0x0
>> net/core/failover.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module901+0x0: data relocation to !ENDBR: cleanup_module+0x0
   net/core/failover.o: warning: objtool: .init_array.1+0x0: data relocation to !ENDBR: asan.module_ctor+0x0
   net/core/failover.o: warning: objtool: .fini_array.1+0x0: data relocation to !ENDBR: asan.module_dtor+0x0
..


objdump-func vmlinux.o __UNIQUE_ID___addressable_init_module1861:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

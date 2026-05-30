Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80103AC0DC;
	Sat, 30 May 2026 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780142683; cv=none; b=IgyC+Ffv9NwJmMyLwJGRVpIjqiDHLxrl9HucDw0eqoB8vGKf0eOCKw37DVkRZ1W7i3ukw9zDn4cJmVjHlneM33b63bSFI+ykwcfP0gemnLP8IDTmThiI2EEr/p7tKStPWUPQJJwG7mdXsGD1i/ZdWiaVw9961/72y3nsGASD5Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780142683; c=relaxed/simple;
	bh=Z+UEKFvQ7bfLzRUwe7UBNuu8X0ir2psIoBYnK0bKKCQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cvmdUXH67XUbUvVpjS5NyzjHn7RYawwhC4LAPDYQwqzt+glmlgIMReOP8MdS/Fdel7RykOaShtdmFuCAhalSS3ESpOIscoLiQBfoiFC9Eorn1LPkAnZI7nz3SWgI+x9SgZnFbWFLcytBf3mm54cqcyfmJoh+Gf5cHqecfRr+9yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jV5cHQlS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jV5cHQlS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780142681; x=1811678681;
  h=date:from:to:cc:subject:message-id;
  bh=Z+UEKFvQ7bfLzRUwe7UBNuu8X0ir2psIoBYnK0bKKCQ=;
  b=jV5cHQlSVoTcjVeFp9K7brBdv/pGxiA8NeaN5t2yx8V696/PPjrn5NU1
   i1I43J80GNxudGp4Rg87r0yRzmvBDaZUjfqxVWS1iv6g1rkqppwsMvScf
   7zvrMX91TjW8esTk3HnU65knloxd7G7AH9vsxv1mKd4GOcvxC63hUDvGl
   lnJD9Bfuir9xjQZ8BsD7azc9X9we6+81bgnYlLr9Tf7LfUAi8N6r4c4vy
   3uSBfIX+vAbcgVhYU9cPPeLe/CUjjLeq1NF5lDdcJVY/VsraJCyP/MlAK
   3Heet0rp3ZbQC6eFHOihk16u33apvd3Eb8+zidjUEqWkigN7kmotra1fg
   Q==;
X-CSE-ConnectionGUID: aoJW+4TbQTaQ2cfFl8VP4g==
X-CSE-MsgGUID: naP7AXeXRjquwp3e5HoC4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="81003020"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="81003020"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 05:04:40 -0700
X-CSE-ConnectionGUID: 7Wid1G+sQbC89MAItntdVw==
X-CSE-MsgGUID: CEElo/ZyRoyA2QxVt0binw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="273395111"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 May 2026 05:04:38 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTIQd-000000008O2-1VNX;
	Sat, 30 May 2026 12:04:35 +0000
Date: Sat, 30 May 2026 20:04:27 +0800
From: kernel test robot <lkp@intel.com>
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joro:kvm-planes-v7.0 32/62]
 arch/s390/kvm/../../../virt/kvm/kvm_main.c:4596:7: error: invalid application
 of 'sizeof' to an incomplete type 'struct kvm_debugregs'
Message-ID: <202605301940.5WzmMrxi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git kvm-planes-v7.0
head:   dbb5c2770eccdd9477ce812561c61d49ef7891ab
commit: cdb548334cc63d4a4149d890056482719042314c [32/62] KVM: Implement KVM_CREATE_VCPU ioctl for planes
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260530/202605301940.5WzmMrxi-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301940.5WzmMrxi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301940.5WzmMrxi-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/kvm_host.h:1076:58: error: no member named 'srcu_depth' in 'struct kvm_vcpu'
    1076 |                   "KVM: Illegal vCPU srcu_idx UNLOCK, depth=%d", vcpu->srcu_depth);
         |                                                                  ~~~~  ^
   arch/s390/include/asm/bug.h:115:16: note: expanded from macro 'WARN_ONCE'
     115 |                                 format, ## arg);                        \
         |                                            ^~~
   arch/s390/include/asm/bug.h:101:52: note: expanded from macro '__WARN_print_arg'
     101 |         __WARN_trap(__WARN_bug_entry(__flags, format), ## arg);         \
         |                                                           ^~~
   In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:38:
   include/linux/mman.h:157:9: warning: division by zero is undefined [-Wdivision-by-zero]
     157 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:135:21: note: expanded from macro '_calc_vm_trans'
     135 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
     159 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:135:21: note: expanded from macro '_calc_vm_trans'
     135 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:42:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:42:
   include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:42:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:42:
   include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:53: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:42:
   include/linux/compat.h:458:22: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:42:
   include/linux/compat.h:458:10: warning: array index 3 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:42: warning: array index 2 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:53: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:4596:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_debugregs'
    4596 |         case KVM_GET_DEBUGREGS:
         |              ^~~~~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1408:35: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:86:60: note: expanded from macro '_IOR'
      86 | #define _IOR(type,nr,argtype)           _IOC(_IOC_READ,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:13:4: note: expanded from macro '_IOC_TYPECHECK'
      13 |         ((sizeof(t) == sizeof(t[1]) && \
         |           ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4596:7: note: forward declaration of 'struct kvm_debugregs'
   include/uapi/linux/kvm.h:1408:61: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                                             ^
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:4596:7: error: array has incomplete element type 'struct kvm_debugregs'
    4596 |         case KVM_GET_DEBUGREGS:
         |              ^
   include/uapi/linux/kvm.h:1408:35: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                   ^
   include/uapi/asm-generic/ioctl.h:86:60: note: expanded from macro '_IOR'
      86 | #define _IOR(type,nr,argtype)           _IOC(_IOC_READ,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                                                     ^
   include/asm-generic/ioctl.h:13:25: note: expanded from macro '_IOC_TYPECHECK'
      13 |         ((sizeof(t) == sizeof(t[1]) && \
         |                                ^
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4596:7: note: forward declaration of 'struct kvm_debugregs'
   include/uapi/linux/kvm.h:1408:61: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                                             ^
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:4596:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_debugregs'
    4596 |         case KVM_GET_DEBUGREGS:
         |              ^~~~~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1408:35: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:86:60: note: expanded from macro '_IOR'
      86 | #define _IOR(type,nr,argtype)           _IOC(_IOC_READ,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:14:4: note: expanded from macro '_IOC_TYPECHECK'
      14 |           sizeof(t) < (1 << _IOC_SIZEBITS)) ? \
         |           ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4596:7: note: forward declaration of 'struct kvm_debugregs'
   include/uapi/linux/kvm.h:1408:61: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                                             ^
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:4596:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_debugregs'
    4596 |         case KVM_GET_DEBUGREGS:
         |              ^~~~~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1408:35: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:86:60: note: expanded from macro '_IOR'
      86 | #define _IOR(type,nr,argtype)           _IOC(_IOC_READ,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:15:4: note: expanded from macro '_IOC_TYPECHECK'
      15 |           sizeof(t) : __invalid_size_argument_for_IOC)
         |           ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4596:7: note: forward declaration of 'struct kvm_debugregs'
   include/uapi/linux/kvm.h:1408:61: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                                             ^
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4597:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_debugregs'
    4597 |         case KVM_SET_DEBUGREGS:
         |              ^~~~~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1409:35: note: expanded from macro 'KVM_SET_DEBUGREGS'
    1409 | #define KVM_SET_DEBUGREGS         _IOW(KVMIO,  0xa2, struct kvm_debugregs)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:87:61: note: expanded from macro '_IOW'
      87 | #define _IOW(type,nr,argtype)           _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:13:4: note: expanded from macro '_IOC_TYPECHECK'
      13 |         ((sizeof(t) == sizeof(t[1]) && \
         |           ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4596:7: note: forward declaration of 'struct kvm_debugregs'
    4596 |         case KVM_GET_DEBUGREGS:
         |              ^
   include/uapi/linux/kvm.h:1408:61: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                                             ^
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4597:7: error: array has incomplete element type 'struct kvm_debugregs'
    4597 |         case KVM_SET_DEBUGREGS:
         |              ^
   include/uapi/linux/kvm.h:1409:35: note: expanded from macro 'KVM_SET_DEBUGREGS'
    1409 | #define KVM_SET_DEBUGREGS         _IOW(KVMIO,  0xa2, struct kvm_debugregs)
         |                                   ^
   include/uapi/asm-generic/ioctl.h:87:61: note: expanded from macro '_IOW'
      87 | #define _IOW(type,nr,argtype)           _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                                                      ^
   include/asm-generic/ioctl.h:13:25: note: expanded from macro '_IOC_TYPECHECK'
      13 |         ((sizeof(t) == sizeof(t[1]) && \
         |                                ^
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4596:7: note: forward declaration of 'struct kvm_debugregs'
    4596 |         case KVM_GET_DEBUGREGS:
         |              ^
   include/uapi/linux/kvm.h:1408:61: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                                             ^
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4597:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_debugregs'
    4597 |         case KVM_SET_DEBUGREGS:
         |              ^~~~~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1409:35: note: expanded from macro 'KVM_SET_DEBUGREGS'
    1409 | #define KVM_SET_DEBUGREGS         _IOW(KVMIO,  0xa2, struct kvm_debugregs)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:87:61: note: expanded from macro '_IOW'
      87 | #define _IOW(type,nr,argtype)           _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:14:4: note: expanded from macro '_IOC_TYPECHECK'
      14 |           sizeof(t) < (1 << _IOC_SIZEBITS)) ? \
         |           ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4596:7: note: forward declaration of 'struct kvm_debugregs'
    4596 |         case KVM_GET_DEBUGREGS:
         |              ^
   include/uapi/linux/kvm.h:1408:61: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                                             ^
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4597:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_debugregs'
    4597 |         case KVM_SET_DEBUGREGS:
         |              ^~~~~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1409:35: note: expanded from macro 'KVM_SET_DEBUGREGS'
    1409 | #define KVM_SET_DEBUGREGS         _IOW(KVMIO,  0xa2, struct kvm_debugregs)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:87:61: note: expanded from macro '_IOW'
      87 | #define _IOW(type,nr,argtype)           _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:15:4: note: expanded from macro '_IOC_TYPECHECK'
      15 |           sizeof(t) : __invalid_size_argument_for_IOC)
         |           ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4596:7: note: forward declaration of 'struct kvm_debugregs'
    4596 |         case KVM_GET_DEBUGREGS:
         |              ^
   include/uapi/linux/kvm.h:1408:61: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                                             ^
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:4600:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_lapic_state'
    4600 |         case KVM_GET_LAPIC:
         |              ^~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1376:35: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:86:60: note: expanded from macro '_IOR'
      86 | #define _IOR(type,nr,argtype)           _IOC(_IOC_READ,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:13:4: note: expanded from macro '_IOC_TYPECHECK'
      13 |         ((sizeof(t) == sizeof(t[1]) && \
         |           ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4600:7: note: forward declaration of 'struct kvm_lapic_state'
   include/uapi/linux/kvm.h:1376:61: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                                             ^
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:4600:7: error: array has incomplete element type 'struct kvm_lapic_state'
    4600 |         case KVM_GET_LAPIC:
         |              ^
   include/uapi/linux/kvm.h:1376:35: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                   ^
   include/uapi/asm-generic/ioctl.h:86:60: note: expanded from macro '_IOR'
      86 | #define _IOR(type,nr,argtype)           _IOC(_IOC_READ,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                                                     ^
   include/asm-generic/ioctl.h:13:25: note: expanded from macro '_IOC_TYPECHECK'
      13 |         ((sizeof(t) == sizeof(t[1]) && \
         |                                ^
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4600:7: note: forward declaration of 'struct kvm_lapic_state'
   include/uapi/linux/kvm.h:1376:61: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                                             ^
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:4600:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_lapic_state'
    4600 |         case KVM_GET_LAPIC:
         |              ^~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1376:35: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:86:60: note: expanded from macro '_IOR'
      86 | #define _IOR(type,nr,argtype)           _IOC(_IOC_READ,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:14:4: note: expanded from macro '_IOC_TYPECHECK'
      14 |           sizeof(t) < (1 << _IOC_SIZEBITS)) ? \
         |           ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4600:7: note: forward declaration of 'struct kvm_lapic_state'
   include/uapi/linux/kvm.h:1376:61: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                                             ^
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:4600:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_lapic_state'
    4600 |         case KVM_GET_LAPIC:
         |              ^~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1376:35: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:86:60: note: expanded from macro '_IOR'
      86 | #define _IOR(type,nr,argtype)           _IOC(_IOC_READ,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:15:4: note: expanded from macro '_IOC_TYPECHECK'
      15 |           sizeof(t) : __invalid_size_argument_for_IOC)
         |           ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4600:7: note: forward declaration of 'struct kvm_lapic_state'
   include/uapi/linux/kvm.h:1376:61: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                                             ^
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4601:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_lapic_state'
    4601 |         case KVM_SET_LAPIC:
         |              ^~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1377:35: note: expanded from macro 'KVM_SET_LAPIC'
    1377 | #define KVM_SET_LAPIC             _IOW(KVMIO,  0x8f, struct kvm_lapic_state)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:87:61: note: expanded from macro '_IOW'
      87 | #define _IOW(type,nr,argtype)           _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:13:4: note: expanded from macro '_IOC_TYPECHECK'
      13 |         ((sizeof(t) == sizeof(t[1]) && \
         |           ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4600:7: note: forward declaration of 'struct kvm_lapic_state'
    4600 |         case KVM_GET_LAPIC:
         |              ^
   include/uapi/linux/kvm.h:1376:61: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                                             ^
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4601:7: error: array has incomplete element type 'struct kvm_lapic_state'
    4601 |         case KVM_SET_LAPIC:
         |              ^
   include/uapi/linux/kvm.h:1377:35: note: expanded from macro 'KVM_SET_LAPIC'
    1377 | #define KVM_SET_LAPIC             _IOW(KVMIO,  0x8f, struct kvm_lapic_state)
         |                                   ^
   include/uapi/asm-generic/ioctl.h:87:61: note: expanded from macro '_IOW'
      87 | #define _IOW(type,nr,argtype)           _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                                                      ^
   include/asm-generic/ioctl.h:13:25: note: expanded from macro '_IOC_TYPECHECK'
      13 |         ((sizeof(t) == sizeof(t[1]) && \
         |                                ^
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4600:7: note: forward declaration of 'struct kvm_lapic_state'
    4600 |         case KVM_GET_LAPIC:
         |              ^
   include/uapi/linux/kvm.h:1376:61: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                                             ^
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4601:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_lapic_state'
    4601 |         case KVM_SET_LAPIC:
         |              ^~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1377:35: note: expanded from macro 'KVM_SET_LAPIC'
    1377 | #define KVM_SET_LAPIC             _IOW(KVMIO,  0x8f, struct kvm_lapic_state)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:87:61: note: expanded from macro '_IOW'
      87 | #define _IOW(type,nr,argtype)           _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:14:4: note: expanded from macro '_IOC_TYPECHECK'
      14 |           sizeof(t) < (1 << _IOC_SIZEBITS)) ? \
         |           ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4600:7: note: forward declaration of 'struct kvm_lapic_state'
    4600 |         case KVM_GET_LAPIC:
         |              ^
   include/uapi/linux/kvm.h:1376:61: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                                             ^
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4601:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_lapic_state'
    4601 |         case KVM_SET_LAPIC:
         |              ^~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1377:35: note: expanded from macro 'KVM_SET_LAPIC'
    1377 | #define KVM_SET_LAPIC             _IOW(KVMIO,  0x8f, struct kvm_lapic_state)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:87:61: note: expanded from macro '_IOW'
      87 | #define _IOW(type,nr,argtype)           _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:15:4: note: expanded from macro '_IOC_TYPECHECK'
      15 |           sizeof(t) : __invalid_size_argument_for_IOC)
         |           ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4600:7: note: forward declaration of 'struct kvm_lapic_state'
    4600 |         case KVM_GET_LAPIC:
         |              ^
   include/uapi/linux/kvm.h:1376:61: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                                             ^
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:4602:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_msrs'
    4602 |         case KVM_GET_MSRS:
         |              ^~~~~~~~~~~~
   include/uapi/linux/kvm.h:1370:35: note: expanded from macro 'KVM_GET_MSRS'
    1370 | #define KVM_GET_MSRS              _IOWR(KVMIO, 0x88, struct kvm_msrs)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:88:72: note: expanded from macro '_IOWR'
      88 | #define _IOWR(type,nr,argtype)          _IOC(_IOC_READ|_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:13:4: note: expanded from macro '_IOC_TYPECHECK'
      13 |         ((sizeof(t) == sizeof(t[1]) && \
         |           ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:4602:7: note: forward declaration of 'struct kvm_msrs'
   include/uapi/linux/kvm.h:1370:61: note: expanded from macro 'KVM_GET_MSRS'
    1370 | #define KVM_GET_MSRS              _IOWR(KVMIO, 0x88, struct kvm_msrs)
         |                                                             ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   14 warnings and 20 errors generated.


vim +4596 arch/s390/kvm/../../../virt/kvm/kvm_main.c

  4592	
  4593	static inline bool kvm_is_vcpu_plane_ioctl(unsigned ioctl)
  4594	{
  4595		switch (ioctl) {
> 4596		case KVM_GET_DEBUGREGS:
  4597		case KVM_SET_DEBUGREGS:
  4598		case KVM_GET_FPU:
  4599		case KVM_SET_FPU:
> 4600		case KVM_GET_LAPIC:
  4601		case KVM_SET_LAPIC:
> 4602		case KVM_GET_MSRS:
  4603		case KVM_SET_MSRS:
  4604		case KVM_GET_NESTED_STATE:
  4605		case KVM_SET_NESTED_STATE:
  4606		case KVM_GET_ONE_REG:
  4607		case KVM_SET_ONE_REG:
  4608		case KVM_GET_REGS:
  4609		case KVM_SET_REGS:
  4610		case KVM_GET_SREGS:
  4611		case KVM_SET_SREGS:
  4612		case KVM_GET_SREGS2:
  4613		case KVM_SET_SREGS2:
  4614		case KVM_GET_VCPU_EVENTS:
  4615		case KVM_SET_VCPU_EVENTS:
  4616		case KVM_GET_XCRS:
  4617		case KVM_SET_XCRS:
  4618		case KVM_GET_XSAVE:
  4619		case KVM_GET_XSAVE2:
  4620		case KVM_SET_XSAVE:
  4621	
  4622		case KVM_GET_REG_LIST:
  4623		case KVM_TRANSLATE:
  4624			return true;
  4625	
  4626		default:
  4627			return false;
  4628		}
  4629	}
  4630	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

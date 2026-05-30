Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2211DDC28;
	Sat, 30 May 2026 06:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780120881; cv=none; b=IL4ThiYWGTn1RVCoACAjaYYxmD1pPgQE9XDhWa6yVq/lUTtZvldhqvgnE4sbf7VKge2D0rlxEeEUKj5LfkqZ/bTzS71Qw0Q96lg59I9lFJZwtWFZF+kLL4cRO1IoooC2kJGY0tSI4Ow5aFw4rHlL+9TzPx9BEfNu7TKsxW9h7qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780120881; c=relaxed/simple;
	bh=QGjRSDz+VFUdOxAOa4vtpq4cWxvbAvdlKG6PCASx/sA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ANQhO5Gs+QTcBRhmUVNKtWeHt7fByR7BBQMGUraYNIm5n8oQTIlLPtcfBPteiW0XneCagaecUiMD2D8Co8xp/Bm4sRWjui6mYgmK0n6uPuu+sJVCuoCMMe4qQbdAqMjireKdNU4r7+dLSPxHyhproN8LXWfWeraBe8BNVvKnLxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jAe5lJWs; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jAe5lJWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780120880; x=1811656880;
  h=date:from:to:cc:subject:message-id;
  bh=QGjRSDz+VFUdOxAOa4vtpq4cWxvbAvdlKG6PCASx/sA=;
  b=jAe5lJWsS0hgK4oMD1+Bbg7tosInPKMFi8khdg/If0O6KnQG30GZglMq
   3jbaFm478HBS1Y52UGdFFQRiyqR6aJYIx2XonI8KejldU0kMlcGze0/t2
   yE1BD6vG5cuYi5VZHrxNKv6Mqy7A+L2DGVEbf6GDOBhOMjjgBNiTIotJd
   mse9cXaDbAQOteBuYpx2//XUCrdY0ka+2mJUIseE9B/mkZxUN1HW0MBrJ
   H5DBEksjL5R8Fz2qdqx6HISNsxIcwV3XTTWDfUPBIW/vK+pfi5RHBeJdJ
   HOn9GNx39Fu9zeWVBD+HUKTBLEvHwLezBZ8/92HjsdzBzKjIGvnn8TiCh
   w==;
X-CSE-ConnectionGUID: fWXADPDAR6ajJUaYLIqOmg==
X-CSE-MsgGUID: Fj8VtcUwRo63ozIh6+H4ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="81152139"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="81152139"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 23:01:19 -0700
X-CSE-ConnectionGUID: sRkghpkzSyqSQ33vZeQd5Q==
X-CSE-MsgGUID: 2YBAoaVxQsuufdCQbQ4lPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="281162498"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 May 2026 23:01:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTCl0-0000000089W-264L;
	Sat, 30 May 2026 06:01:14 +0000
Date: Sat, 30 May 2026 14:01:02 +0800
From: kernel test robot <lkp@intel.com>
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joro:kvm-planes-v7.0 32/62]
 arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4596:7: error: invalid
 application of 'sizeof' to an incomplete type 'struct kvm_debugregs'
Message-ID: <202605301330.4Tex4quV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git kvm-planes-v7.0
head:   dbb5c2770eccdd9477ce812561c61d49ef7891ab
commit: cdb548334cc63d4a4149d890056482719042314c [32/62] KVM: Implement KVM_CREATE_VCPU ioctl for planes
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260530/202605301330.4Tex4quV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301330.4Tex4quV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301330.4Tex4quV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kvm/../../../virt/kvm/kvm_main.c:15:
   include/linux/kvm_host.h:1065:56: error: no member named 'srcu_depth' in 'struct kvm_vcpu'
    1065 |                   "KVM: Illegal vCPU srcu_idx LOCK, depth=%d", vcpu->srcu_depth - 1);
         |                                                                ~~~~  ^
   include/linux/kvm_host.h:1076:58: error: no member named 'srcu_depth' in 'struct kvm_vcpu'
    1076 |                   "KVM: Illegal vCPU srcu_idx UNLOCK, depth=%d", vcpu->srcu_depth);
         |                                                                  ~~~~  ^
   In file included from arch/riscv/kvm/../../../virt/kvm/kvm_main.c:38:
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
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4596:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_debugregs'
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
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4596:7: note: forward declaration of 'struct kvm_debugregs'
   include/uapi/linux/kvm.h:1408:61: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                                             ^
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4596:7: error: array has incomplete element type 'struct kvm_debugregs'
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
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4596:7: note: forward declaration of 'struct kvm_debugregs'
   include/uapi/linux/kvm.h:1408:61: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                                             ^
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4596:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_debugregs'
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
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4596:7: note: forward declaration of 'struct kvm_debugregs'
   include/uapi/linux/kvm.h:1408:61: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                                             ^
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4596:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_debugregs'
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
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4596:7: note: forward declaration of 'struct kvm_debugregs'
   include/uapi/linux/kvm.h:1408:61: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                                             ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4597:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_debugregs'
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
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4596:7: note: forward declaration of 'struct kvm_debugregs'
    4596 |         case KVM_GET_DEBUGREGS:
         |              ^
   include/uapi/linux/kvm.h:1408:61: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                                             ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4597:7: error: array has incomplete element type 'struct kvm_debugregs'
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
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4596:7: note: forward declaration of 'struct kvm_debugregs'
    4596 |         case KVM_GET_DEBUGREGS:
         |              ^
   include/uapi/linux/kvm.h:1408:61: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                                             ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4597:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_debugregs'
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
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4596:7: note: forward declaration of 'struct kvm_debugregs'
    4596 |         case KVM_GET_DEBUGREGS:
         |              ^
   include/uapi/linux/kvm.h:1408:61: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                                             ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4597:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_debugregs'
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
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4596:7: note: forward declaration of 'struct kvm_debugregs'
    4596 |         case KVM_GET_DEBUGREGS:
         |              ^
   include/uapi/linux/kvm.h:1408:61: note: expanded from macro 'KVM_GET_DEBUGREGS'
    1408 | #define KVM_GET_DEBUGREGS         _IOR(KVMIO,  0xa1, struct kvm_debugregs)
         |                                                             ^
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4600:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_lapic_state'
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
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4600:7: note: forward declaration of 'struct kvm_lapic_state'
   include/uapi/linux/kvm.h:1376:61: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                                             ^
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4600:7: error: array has incomplete element type 'struct kvm_lapic_state'
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
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4600:7: note: forward declaration of 'struct kvm_lapic_state'
   include/uapi/linux/kvm.h:1376:61: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                                             ^
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4600:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_lapic_state'
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
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4600:7: note: forward declaration of 'struct kvm_lapic_state'
   include/uapi/linux/kvm.h:1376:61: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                                             ^
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4600:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_lapic_state'
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
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4600:7: note: forward declaration of 'struct kvm_lapic_state'
   include/uapi/linux/kvm.h:1376:61: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                                             ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4601:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_lapic_state'
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
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4600:7: note: forward declaration of 'struct kvm_lapic_state'
    4600 |         case KVM_GET_LAPIC:
         |              ^
   include/uapi/linux/kvm.h:1376:61: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                                             ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4601:7: error: array has incomplete element type 'struct kvm_lapic_state'
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
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4600:7: note: forward declaration of 'struct kvm_lapic_state'
    4600 |         case KVM_GET_LAPIC:
         |              ^
   include/uapi/linux/kvm.h:1376:61: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                                             ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4601:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_lapic_state'
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
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4600:7: note: forward declaration of 'struct kvm_lapic_state'
    4600 |         case KVM_GET_LAPIC:
         |              ^
   include/uapi/linux/kvm.h:1376:61: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                                             ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4601:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_lapic_state'
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
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4600:7: note: forward declaration of 'struct kvm_lapic_state'
    4600 |         case KVM_GET_LAPIC:
         |              ^
   include/uapi/linux/kvm.h:1376:61: note: expanded from macro 'KVM_GET_LAPIC'
    1376 | #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
         |                                                             ^
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4602:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_msrs'
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
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4602:7: note: forward declaration of 'struct kvm_msrs'
   include/uapi/linux/kvm.h:1370:61: note: expanded from macro 'KVM_GET_MSRS'
    1370 | #define KVM_GET_MSRS              _IOWR(KVMIO, 0x88, struct kvm_msrs)
         |                                                             ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   2 warnings and 20 errors generated.


vim +4596 arch/riscv/kvm/../../../virt/kvm/kvm_main.c

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

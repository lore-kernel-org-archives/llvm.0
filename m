Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EC9409618;
	Wed,  3 Jun 2026 08:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475359; cv=none; b=YX8rO7DNtFeFWy4ZWtQzX9sK0+ZPeq1v9p8Gry9CB1lHIk9mU+4FnsaSvB/sjaLO3FSm0q/BMBueuMpxBPlaV3wDh0gAgRri703glVTMl1Y4DJ4GWlW4W7LpUqfpe04tzWk8vg9NfHW83n86KVCHRw4j60HSZVhyG9TYnivbohg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475359; c=relaxed/simple;
	bh=UTJOI+NBL4jyfZrshSVGj9ae9M2ocgqqSAeROCZaLww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SjAgb3PYIURz1bVPxgIBxEKMUxOIGTan8CTukKdWujVl8m6eJPF7BeklbdFRKYJ3tiFZhGN15DHeK6wy98c4oIQ+hq6M+2XfovAowjg9sIaF3eunVIJU+LQ5JQexegwqdplWnIYZBsSxQytvMQtAR+FlXna9ITcLxtT8fM9+xx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mozCYZHp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mozCYZHp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780475357; x=1812011357;
  h=date:from:to:cc:subject:message-id;
  bh=UTJOI+NBL4jyfZrshSVGj9ae9M2ocgqqSAeROCZaLww=;
  b=mozCYZHprQXrZY31mvJNvs/dqq5LW18mykGgjL8pi/6HxG4hGt/LwRVe
   HMWk4bN4koLTv1/2c8qB+9DBw/RQmeCA/aOEA0bgqSSPZsYY2kOY0JAm1
   4C8i3bEO8w2CbgGU323TDUpleRPq0rC+erK2VKimyLql1XUVZq4dGgVvH
   lLL2WWQkRllkGVHA7+o5usAlPKQkM4BkrkJHqZ5QIL31nGZecRk/1uDlg
   4adRBWK1om/fddk3t0Yth3a+IBvw4yUbgRjG2LwOvSLBXyEykfbeSznP8
   CVdxaWdTFkQ/1GLluxOOyfNAdbjoY+eZHe21blzt5hRad74dSZaWQTnSP
   A==;
X-CSE-ConnectionGUID: 9yDbi1xXRDCtAyI5W8QsVw==
X-CSE-MsgGUID: NPanXltjSRyujdfdAC3P6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91848498"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="91848498"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 01:29:15 -0700
X-CSE-ConnectionGUID: +nhpGyqWTxyVMzTtuBql6w==
X-CSE-MsgGUID: vEyx+xa3T9Se7PUJVS5DSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244000428"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Jun 2026 01:29:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUgyM-00000000D9O-1kVA;
	Wed, 03 Jun 2026 08:29:10 +0000
Date: Wed, 03 Jun 2026 16:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joro:kvm-planes-v7.1 33/60]
 arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4595:7: error: array has
 incomplete element type 'struct kvm_msrs'
Message-ID: <202606031604.ZjaQwJMP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git kvm-planes-v7.1
head:   02b786614480597a489766ec45b0ec286a3301a0
commit: ff0aae76b3b7cd22365bbcb936c38a7c605d3948 [33/60] KVM: Implement KVM_CREATE_VCPU ioctl for planes
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260603/202606031604.ZjaQwJMP-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606031604.ZjaQwJMP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606031604.ZjaQwJMP-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4594:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_lapic_state'
           case KVM_SET_LAPIC:
                ^~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1387:35: note: expanded from macro 'KVM_SET_LAPIC'
   #define KVM_SET_LAPIC             _IOW(KVMIO,  0x8f, struct kvm_lapic_state)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:87:61: note: expanded from macro '_IOW'
   #define _IOW(type,nr,argtype)           _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:13:4: note: expanded from macro '_IOC_TYPECHECK'
           ((sizeof(t) == sizeof(t[1]) && \
             ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
            ((size) << _IOC_SIZESHIFT))
              ^~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4593:7: note: forward declaration of 'struct kvm_lapic_state'
           case KVM_GET_LAPIC:
                ^
   include/uapi/linux/kvm.h:1386:61: note: expanded from macro 'KVM_GET_LAPIC'
   #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
                                                               ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4594:7: error: array has incomplete element type 'struct kvm_lapic_state'
           case KVM_SET_LAPIC:
                ^
   include/uapi/linux/kvm.h:1387:35: note: expanded from macro 'KVM_SET_LAPIC'
   #define KVM_SET_LAPIC             _IOW(KVMIO,  0x8f, struct kvm_lapic_state)
                                     ^
   include/uapi/asm-generic/ioctl.h:87:61: note: expanded from macro '_IOW'
   #define _IOW(type,nr,argtype)           _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
                                                                        ^
   include/asm-generic/ioctl.h:13:25: note: expanded from macro '_IOC_TYPECHECK'
           ((sizeof(t) == sizeof(t[1]) && \
                                  ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4593:7: note: forward declaration of 'struct kvm_lapic_state'
           case KVM_GET_LAPIC:
                ^
   include/uapi/linux/kvm.h:1386:61: note: expanded from macro 'KVM_GET_LAPIC'
   #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
                                                               ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4594:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_lapic_state'
           case KVM_SET_LAPIC:
                ^~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1387:35: note: expanded from macro 'KVM_SET_LAPIC'
   #define KVM_SET_LAPIC             _IOW(KVMIO,  0x8f, struct kvm_lapic_state)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:87:61: note: expanded from macro '_IOW'
   #define _IOW(type,nr,argtype)           _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:14:4: note: expanded from macro '_IOC_TYPECHECK'
             sizeof(t) < (1 << _IOC_SIZEBITS)) ? \
             ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
            ((size) << _IOC_SIZESHIFT))
              ^~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4593:7: note: forward declaration of 'struct kvm_lapic_state'
           case KVM_GET_LAPIC:
                ^
   include/uapi/linux/kvm.h:1386:61: note: expanded from macro 'KVM_GET_LAPIC'
   #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
                                                               ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4594:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_lapic_state'
           case KVM_SET_LAPIC:
                ^~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1387:35: note: expanded from macro 'KVM_SET_LAPIC'
   #define KVM_SET_LAPIC             _IOW(KVMIO,  0x8f, struct kvm_lapic_state)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:87:61: note: expanded from macro '_IOW'
   #define _IOW(type,nr,argtype)           _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:15:4: note: expanded from macro '_IOC_TYPECHECK'
             sizeof(t) : __invalid_size_argument_for_IOC)
             ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
            ((size) << _IOC_SIZESHIFT))
              ^~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4593:7: note: forward declaration of 'struct kvm_lapic_state'
           case KVM_GET_LAPIC:
                ^
   include/uapi/linux/kvm.h:1386:61: note: expanded from macro 'KVM_GET_LAPIC'
   #define KVM_GET_LAPIC             _IOR(KVMIO,  0x8e, struct kvm_lapic_state)
                                                               ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4595:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_msrs'
           case KVM_GET_MSRS:
                ^~~~~~~~~~~~
   include/uapi/linux/kvm.h:1380:35: note: expanded from macro 'KVM_GET_MSRS'
   #define KVM_GET_MSRS              _IOWR(KVMIO, 0x88, struct kvm_msrs)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:88:72: note: expanded from macro '_IOWR'
   #define _IOWR(type,nr,argtype)          _IOC(_IOC_READ|_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:13:4: note: expanded from macro '_IOC_TYPECHECK'
           ((sizeof(t) == sizeof(t[1]) && \
             ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
            ((size) << _IOC_SIZESHIFT))
              ^~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4595:7: note: forward declaration of 'struct kvm_msrs'
   include/uapi/linux/kvm.h:1380:61: note: expanded from macro 'KVM_GET_MSRS'
   #define KVM_GET_MSRS              _IOWR(KVMIO, 0x88, struct kvm_msrs)
                                                               ^
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4595:7: error: array has incomplete element type 'struct kvm_msrs'
           case KVM_GET_MSRS:
                ^
   include/uapi/linux/kvm.h:1380:35: note: expanded from macro 'KVM_GET_MSRS'
   #define KVM_GET_MSRS              _IOWR(KVMIO, 0x88, struct kvm_msrs)
                                     ^
   include/uapi/asm-generic/ioctl.h:88:72: note: expanded from macro '_IOWR'
   #define _IOWR(type,nr,argtype)          _IOC(_IOC_READ|_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
                                                                                  ^
   include/asm-generic/ioctl.h:13:25: note: expanded from macro '_IOC_TYPECHECK'
           ((sizeof(t) == sizeof(t[1]) && \
                                  ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4595:7: note: forward declaration of 'struct kvm_msrs'
   include/uapi/linux/kvm.h:1380:61: note: expanded from macro 'KVM_GET_MSRS'
   #define KVM_GET_MSRS              _IOWR(KVMIO, 0x88, struct kvm_msrs)
                                                               ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4595:7: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_msrs'
           case KVM_GET_MSRS:
                ^~~~~~~~~~~~
   include/uapi/linux/kvm.h:1380:35: note: expanded from macro 'KVM_GET_MSRS'
   #define KVM_GET_MSRS              _IOWR(KVMIO, 0x88, struct kvm_msrs)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/ioctl.h:88:72: note: expanded from macro '_IOWR'
   #define _IOWR(type,nr,argtype)          _IOC(_IOC_READ|_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/ioctl.h:14:4: note: expanded from macro '_IOC_TYPECHECK'
             sizeof(t) < (1 << _IOC_SIZEBITS)) ? \
             ^
   include/uapi/asm-generic/ioctl.h:73:5: note: expanded from macro '_IOC'
            ((size) << _IOC_SIZESHIFT))
              ^~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4595:7: note: forward declaration of 'struct kvm_msrs'
   include/uapi/linux/kvm.h:1380:61: note: expanded from macro 'KVM_GET_MSRS'
   #define KVM_GET_MSRS              _IOWR(KVMIO, 0x88, struct kvm_msrs)
                                                               ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +4595 arch/riscv/kvm/../../../virt/kvm/kvm_main.c

  4585	
  4586	static inline bool kvm_is_vcpu_plane_ioctl(unsigned ioctl)
  4587	{
  4588		switch (ioctl) {
  4589		case KVM_GET_DEBUGREGS:
  4590		case KVM_SET_DEBUGREGS:
  4591		case KVM_GET_FPU:
  4592		case KVM_SET_FPU:
  4593		case KVM_GET_LAPIC:
  4594		case KVM_SET_LAPIC:
> 4595		case KVM_GET_MSRS:
  4596		case KVM_SET_MSRS:
  4597		case KVM_GET_NESTED_STATE:
  4598		case KVM_SET_NESTED_STATE:
  4599		case KVM_GET_ONE_REG:
  4600		case KVM_SET_ONE_REG:
  4601		case KVM_GET_REGS:
  4602		case KVM_SET_REGS:
  4603		case KVM_GET_SREGS:
  4604		case KVM_SET_SREGS:
  4605		case KVM_GET_SREGS2:
  4606		case KVM_SET_SREGS2:
  4607		case KVM_GET_VCPU_EVENTS:
  4608		case KVM_SET_VCPU_EVENTS:
  4609		case KVM_GET_XCRS:
  4610		case KVM_SET_XCRS:
  4611		case KVM_GET_XSAVE:
  4612		case KVM_GET_XSAVE2:
  4613		case KVM_SET_XSAVE:
  4614	
  4615		case KVM_GET_REG_LIST:
  4616		case KVM_TRANSLATE:
  4617			return true;
  4618	
  4619		default:
  4620			return false;
  4621		}
  4622	}
  4623	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

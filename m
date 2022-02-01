Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A8229CA
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 07:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643698893; x=1675234893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0rn+zx4Is4enDytQe+WBVqNYCrR1ao71qNPltgw9ICE=;
  b=jhuZQOAl96OOJP2Uwz9INMV3+MxRIcCX0Q/D6zr6mUTW4t8oDaDaNcEN
   N+Er5dsWro22s5QPSZN26ayXuCtWhKY8oWw7KVe93eq6LPcw7XNCpSIkx
   RA7EESykQN867wpRcnmirvK2qto4tbKXYKto4EHp45VvU/guTyEqUFFIy
   bNahQVwX+t9tI4/IG3OCiojtz0rey4Dmzp80pgLsiSw7e4gumLMzkPOD0
   5ZUVqUjNA8ns1n/IrwwWf0Jia61hFCrSpCi0+NAR5QUtFtkkWSvy8A/MU
   l+xMCBzApWAE/0aK0vc/sJ7gSyvb6bt8oyCZ2oB9JPJZByvd4uO8YtDYW
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="228293178"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; 
   d="scan'208";a="228293178"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 23:01:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; 
   d="scan'208";a="675996016"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2022 23:01:23 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEnAI-000SvU-UU; Tue, 01 Feb 2022 07:01:22 +0000
Date: Tue, 1 Feb 2022 15:01:16 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	kvm@vger.kernel.org
Subject: Re: [PATCH 3/5] KVM: x86: Use __try_cmpxchg_user() to update guest
 PTE A/D bits
Message-ID: <202202011400.EaZmWZ48-lkp@intel.com>
References: <20220201010838.1494405-4-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201010838.1494405-4-seanjc@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Sean,

I love your patch! Yet something to improve:

[auto build test ERROR on 26291c54e111ff6ba87a164d85d4a4e134b7315c]

url:    https://github.com/0day-ci/linux/commits/Sean-Christopherson/x86-uaccess-CMPXCHG-KVM-bug-fixes/20220201-091001
base:   26291c54e111ff6ba87a164d85d4a4e134b7315c
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220201/202202011400.EaZmWZ48-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c880d7a9df876f20dc3acdd893c5c71f3cda5029
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sean-Christopherson/x86-uaccess-CMPXCHG-KVM-bug-fixes/20220201-091001
        git checkout c880d7a9df876f20dc3acdd893c5c71f3cda5029
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/mmu/mmu.c:4246:
>> arch/x86/kvm/mmu/paging_tmpl.h:244:9: error: invalid output size for constraint '+a'
                   ret = __try_cmpxchg_user(ptep_user, &orig_pte, pte, fault);
                         ^
   arch/x86/include/asm/uaccess.h:629:11: note: expanded from macro '__try_cmpxchg_user'
           __ret = !unsafe_try_cmpxchg_user(_ptr, _oldp, _nval, _label);   \
                    ^
   arch/x86/include/asm/uaccess.h:606:18: note: expanded from macro 'unsafe_try_cmpxchg_user'
           case 1: __ret = __try_cmpxchg_user_asm("b", "q",                \
                           ^
   arch/x86/include/asm/uaccess.h:467:22: note: expanded from macro '__try_cmpxchg_user_asm'
                          [old] "+a" (__old)                               \
                                      ^
   In file included from arch/x86/kvm/mmu/mmu.c:4246:
>> arch/x86/kvm/mmu/paging_tmpl.h:244:9: error: invalid output size for constraint '+a'
   arch/x86/include/asm/uaccess.h:629:11: note: expanded from macro '__try_cmpxchg_user'
           __ret = !unsafe_try_cmpxchg_user(_ptr, _oldp, _nval, _label);   \
                    ^
   arch/x86/include/asm/uaccess.h:610:18: note: expanded from macro 'unsafe_try_cmpxchg_user'
           case 2: __ret = __try_cmpxchg_user_asm("w", "r",                \
                           ^
   arch/x86/include/asm/uaccess.h:467:22: note: expanded from macro '__try_cmpxchg_user_asm'
                          [old] "+a" (__old)                               \
                                      ^
   In file included from arch/x86/kvm/mmu/mmu.c:4246:
>> arch/x86/kvm/mmu/paging_tmpl.h:244:9: error: invalid output size for constraint '+a'
   arch/x86/include/asm/uaccess.h:629:11: note: expanded from macro '__try_cmpxchg_user'
           __ret = !unsafe_try_cmpxchg_user(_ptr, _oldp, _nval, _label);   \
                    ^
   arch/x86/include/asm/uaccess.h:614:18: note: expanded from macro 'unsafe_try_cmpxchg_user'
           case 4: __ret = __try_cmpxchg_user_asm("l", "r",                \
                           ^
   arch/x86/include/asm/uaccess.h:467:22: note: expanded from macro '__try_cmpxchg_user_asm'
                          [old] "+a" (__old)                               \
                                      ^
   In file included from arch/x86/kvm/mmu/mmu.c:4250:
>> arch/x86/kvm/mmu/paging_tmpl.h:244:9: error: invalid output size for constraint '+a'
                   ret = __try_cmpxchg_user(ptep_user, &orig_pte, pte, fault);
                         ^
   arch/x86/include/asm/uaccess.h:629:11: note: expanded from macro '__try_cmpxchg_user'
           __ret = !unsafe_try_cmpxchg_user(_ptr, _oldp, _nval, _label);   \
                    ^
   arch/x86/include/asm/uaccess.h:606:18: note: expanded from macro 'unsafe_try_cmpxchg_user'
           case 1: __ret = __try_cmpxchg_user_asm("b", "q",                \
                           ^
   arch/x86/include/asm/uaccess.h:467:22: note: expanded from macro '__try_cmpxchg_user_asm'
                          [old] "+a" (__old)                               \
                                      ^
   In file included from arch/x86/kvm/mmu/mmu.c:4250:
>> arch/x86/kvm/mmu/paging_tmpl.h:244:9: error: invalid output size for constraint '+a'
   arch/x86/include/asm/uaccess.h:629:11: note: expanded from macro '__try_cmpxchg_user'
           __ret = !unsafe_try_cmpxchg_user(_ptr, _oldp, _nval, _label);   \
                    ^
   arch/x86/include/asm/uaccess.h:610:18: note: expanded from macro 'unsafe_try_cmpxchg_user'
           case 2: __ret = __try_cmpxchg_user_asm("w", "r",                \
                           ^
   arch/x86/include/asm/uaccess.h:467:22: note: expanded from macro '__try_cmpxchg_user_asm'
                          [old] "+a" (__old)                               \
                                      ^
   In file included from arch/x86/kvm/mmu/mmu.c:4250:
>> arch/x86/kvm/mmu/paging_tmpl.h:244:9: error: invalid output size for constraint '+a'
   arch/x86/include/asm/uaccess.h:629:11: note: expanded from macro '__try_cmpxchg_user'
           __ret = !unsafe_try_cmpxchg_user(_ptr, _oldp, _nval, _label);   \
                    ^
   arch/x86/include/asm/uaccess.h:614:18: note: expanded from macro 'unsafe_try_cmpxchg_user'
           case 4: __ret = __try_cmpxchg_user_asm("l", "r",                \
                           ^
   arch/x86/include/asm/uaccess.h:467:22: note: expanded from macro '__try_cmpxchg_user_asm'
                          [old] "+a" (__old)                               \
                                      ^
   6 errors generated.


vim +244 arch/x86/kvm/mmu/paging_tmpl.h

   191	
   192	static int FNAME(update_accessed_dirty_bits)(struct kvm_vcpu *vcpu,
   193						     struct kvm_mmu *mmu,
   194						     struct guest_walker *walker,
   195						     gpa_t addr, int write_fault)
   196	{
   197		unsigned level, index;
   198		pt_element_t pte, orig_pte;
   199		pt_element_t __user *ptep_user;
   200		gfn_t table_gfn;
   201		int ret;
   202	
   203		/* dirty/accessed bits are not supported, so no need to update them */
   204		if (!PT_HAVE_ACCESSED_DIRTY(mmu))
   205			return 0;
   206	
   207		for (level = walker->max_level; level >= walker->level; --level) {
   208			pte = orig_pte = walker->ptes[level - 1];
   209			table_gfn = walker->table_gfn[level - 1];
   210			ptep_user = walker->ptep_user[level - 1];
   211			index = offset_in_page(ptep_user) / sizeof(pt_element_t);
   212			if (!(pte & PT_GUEST_ACCESSED_MASK)) {
   213				trace_kvm_mmu_set_accessed_bit(table_gfn, index, sizeof(pte));
   214				pte |= PT_GUEST_ACCESSED_MASK;
   215			}
   216			if (level == walker->level && write_fault &&
   217					!(pte & PT_GUEST_DIRTY_MASK)) {
   218				trace_kvm_mmu_set_dirty_bit(table_gfn, index, sizeof(pte));
   219	#if PTTYPE == PTTYPE_EPT
   220				if (kvm_x86_ops.nested_ops->write_log_dirty(vcpu, addr))
   221					return -EINVAL;
   222	#endif
   223				pte |= PT_GUEST_DIRTY_MASK;
   224			}
   225			if (pte == orig_pte)
   226				continue;
   227	
   228			/*
   229			 * If the slot is read-only, simply do not process the accessed
   230			 * and dirty bits.  This is the correct thing to do if the slot
   231			 * is ROM, and page tables in read-as-ROM/write-as-MMIO slots
   232			 * are only supported if the accessed and dirty bits are already
   233			 * set in the ROM (so that MMIO writes are never needed).
   234			 *
   235			 * Note that NPT does not allow this at all and faults, since
   236			 * it always wants nested page table entries for the guest
   237			 * page tables to be writable.  And EPT works but will simply
   238			 * overwrite the read-only memory to set the accessed and dirty
   239			 * bits.
   240			 */
   241			if (unlikely(!walker->pte_writable[level - 1]))
   242				continue;
   243	
 > 244			ret = __try_cmpxchg_user(ptep_user, &orig_pte, pte, fault);
   245			if (ret)
   246				return ret;
   247	
   248			kvm_vcpu_mark_page_dirty(vcpu, table_gfn);
   249			walker->ptes[level - 1] = pte;
   250		}
   251		return 0;
   252	}
   253	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

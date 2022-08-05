Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6172F2B
	for <llvm@lists.linux.dev>; Fri,  5 Aug 2022 22:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659737076; x=1691273076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qOJ9xOElTcLFLOkgd7xhEU8kKTIqL81MtjUM2S74dDU=;
  b=BrU+uFmvnfsPpjpu8LEpfQbS18dEPeCt7LMCQ5GVMG8yU2Dt+yDH+FmT
   2m5hjI7XoAfOseUwhCzCozJKWZzJoltyVnLUJbczg+AfYgjfLO0Gh3Eiw
   TM0MLsiuQDd1e4cznH4hbgA4pQ6iPX83XasoOivYrtfhoGl72UodhgSkS
   6vqM9LGcE1TEXw00XamCN/X4P53/iGGjPLjL0e+F0/wJmbdjLO5sz//Rq
   P9cQKdNxjA2T5dnVzNiRKDdo1BBFyiLNlOxM7ZyujNgP9GqhpkkUEUcXD
   GZaU+cAeTEUEL93jQKQbeIsD92D1OnF5LAbXde8T92cgmAwVXYqWr8MNm
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="316196944"
X-IronPort-AV: E=Sophos;i="5.93,217,1654585200"; 
   d="scan'208";a="316196944"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2022 15:04:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,217,1654585200"; 
   d="scan'208";a="931375499"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Aug 2022 15:04:34 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oK5Qn-000Jlv-2l;
	Fri, 05 Aug 2022 22:04:33 +0000
Date: Sat, 6 Aug 2022 06:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 1/1] kvm: Use a new spinlock to avoid atomic
 operations in kvm_get_dirty_log_protect
Message-ID: <202208060555.HXg1BW0b-lkp@intel.com>
References: <20220805073544.555261-1-leobras@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805073544.555261-1-leobras@redhat.com>

Hi Leonardo,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on kvm/queue]
[also build test ERROR on linus/master v5.19 next-20220805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leonardo-Bras/kvm-Use-a-new-spinlock-to-avoid-atomic-operations-in-kvm_get_dirty_log_protect/20220805-153809
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
config: s390-randconfig-r032-20220805 (https://download.01.org/0day-ci/archive/20220806/202208060555.HXg1BW0b-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 26dd42705c2af0b8f6e5d6cdb32c9bd5ed9524eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6d5c7b373425e7b50ae4f41f21472ae0ae2a031d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Leonardo-Bras/kvm-Use-a-new-spinlock-to-avoid-atomic-operations-in-kvm_get_dirty_log_protect/20220805-153809
        git checkout 6d5c7b373425e7b50ae4f41f21472ae0ae2a031d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:18:
   In file included from include/linux/kvm_host.h:41:
   In file included from include/linux/kvm_para.h:5:
   In file included from include/uapi/linux/kvm_para.h:37:
   In file included from arch/s390/include/asm/kvm_para.h:25:
   In file included from arch/s390/include/asm/diag.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:18:
   In file included from include/linux/kvm_host.h:41:
   In file included from include/linux/kvm_para.h:5:
   In file included from include/uapi/linux/kvm_para.h:37:
   In file included from arch/s390/include/asm/kvm_para.h:25:
   In file included from arch/s390/include/asm/diag.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:18:
   In file included from include/linux/kvm_host.h:41:
   In file included from include/linux/kvm_para.h:5:
   In file included from include/uapi/linux/kvm_para.h:37:
   In file included from arch/s390/include/asm/kvm_para.h:25:
   In file included from arch/s390/include/asm/diag.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:3319:14: error: passing 'const spinlock_t *' (aka 'const struct spinlock *') to parameter of type 'spinlock_t *' (aka 'struct spinlock *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                           spin_lock(&memslot->bm_switch_lock);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:347:51: note: passing argument to parameter 'lock' here
   static __always_inline void spin_lock(spinlock_t *lock)
                                                     ^
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:3322:33: error: passing 'const struct kvm_memory_slot *' to parameter of type 'struct kvm_memory_slot *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                                              kvm_second_dirty_bitmap(memslot));
                                                                      ^~~~~~~
   include/linux/kvm_host.h:594:78: note: passing argument to parameter 'memslot' here
   static inline unsigned long *kvm_second_dirty_bitmap(struct kvm_memory_slot *memslot)
                                                                                ^
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:3326:16: error: passing 'const spinlock_t *' (aka 'const struct spinlock *') to parameter of type 'spinlock_t *' (aka 'struct spinlock *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                           spin_unlock(&memslot->bm_switch_lock);
                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:387:53: note: passing argument to parameter 'lock' here
   static __always_inline void spin_unlock(spinlock_t *lock)
                                                       ^
   12 warnings and 3 errors generated.


vim +3319 arch/s390/kvm/../../../virt/kvm/kvm_main.c

  3310	
  3311		if (memslot && kvm_slot_dirty_track_enabled(memslot)) {
  3312			unsigned long rel_gfn = gfn - memslot->base_gfn;
  3313			u32 slot = (memslot->as_id << 16) | memslot->id;
  3314	
  3315			if (kvm->dirty_ring_size) {
  3316				kvm_dirty_ring_push(&vcpu->dirty_ring,
  3317						    slot, rel_gfn);
  3318			} else {
> 3319				spin_lock(&memslot->bm_switch_lock);
  3320				if (memslot->use_secondary)
  3321					set_bit_le(rel_gfn,
> 3322						   kvm_second_dirty_bitmap(memslot));
  3323				else
  3324					set_bit_le(rel_gfn, memslot->dirty_bitmap);
  3325	
  3326				spin_unlock(&memslot->bm_switch_lock);
  3327			}
  3328		}
  3329	}
  3330	EXPORT_SYMBOL_GPL(mark_page_dirty_in_slot);
  3331	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

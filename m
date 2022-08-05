Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4ED290E
	for <llvm@lists.linux.dev>; Fri,  5 Aug 2022 21:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659735815; x=1691271815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qfg4R2BtXdjYTXw2GPqRYJZIr9XIs5w0XjDVgS2B3Bg=;
  b=bT8G2tX541uxVgM6y90TcxcwB5vv1N+dwMHB6etrrvgPmJ4vmgyAYKdQ
   WevqJlyWe0qIqUuHfKJm7Qu9hZsz/dM3tz8z44Xre8ThyOsk73FtHsXKk
   zYCnd2o3HEHINUS6uQMK2N5+QiVE8zGyvLQyjdpRtG906IRifuu/wE1mp
   RH3PNO114QBjBkJHAEQvHuE0KrM7/xriijVmfBPxk96tWAq4Y18NnJloq
   X1553GyY0u52YScoOXsI/htASuUxn+1Eg7X2FvUPJAlvJ8MZLLeDLNqLK
   QwqiPv/6tDlQtn7qAT8QSjg7nvsf9FcMvMsOadDSVc8unW6bOdvFXr+w3
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="270684112"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="270684112"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2022 14:43:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="745993530"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2022 14:43:33 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oK56T-000Jl6-0r;
	Fri, 05 Aug 2022 21:43:33 +0000
Date: Sat, 6 Aug 2022 05:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 1/1] kvm: Use a new spinlock to avoid atomic
 operations in kvm_get_dirty_log_protect
Message-ID: <202208060522.0KJornHh-lkp@intel.com>
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
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220806/202208060522.0KJornHh-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 26dd42705c2af0b8f6e5d6cdb32c9bd5ed9524eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6d5c7b373425e7b50ae4f41f21472ae0ae2a031d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Leonardo-Bras/kvm-Use-a-new-spinlock-to-avoid-atomic-operations-in-kvm_get_dirty_log_protect/20220805-153809
        git checkout 6d5c7b373425e7b50ae4f41f21472ae0ae2a031d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:3319:14: error: passing 'const spinlock_t *' (aka 'const struct spinlock *') to parameter of type 'spinlock_t *' (aka 'struct spinlock *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                           spin_lock(&memslot->bm_switch_lock);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:347:51: note: passing argument to parameter 'lock' here
   static __always_inline void spin_lock(spinlock_t *lock)
                                                     ^
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:3322:33: error: passing 'const struct kvm_memory_slot *' to parameter of type 'struct kvm_memory_slot *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                                              kvm_second_dirty_bitmap(memslot));
                                                                      ^~~~~~~
   include/linux/kvm_host.h:594:78: note: passing argument to parameter 'memslot' here
   static inline unsigned long *kvm_second_dirty_bitmap(struct kvm_memory_slot *memslot)
                                                                                ^
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:3326:16: error: passing 'const spinlock_t *' (aka 'const struct spinlock *') to parameter of type 'spinlock_t *' (aka 'struct spinlock *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                           spin_unlock(&memslot->bm_switch_lock);
                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:387:53: note: passing argument to parameter 'lock' here
   static __always_inline void spin_unlock(spinlock_t *lock)
                                                       ^
   3 errors generated.


vim +3319 arch/x86/kvm/../../../virt/kvm/kvm_main.c

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

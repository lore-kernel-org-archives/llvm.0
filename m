Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE8915B3;
	Thu, 23 Mar 2023 02:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679539747; x=1711075747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7VbtLKdWVx9S7NwOAQ3lSLqyuzugnCct0im0AWQilVM=;
  b=BnlhKokPAE1+rTOfAbnhir4U7nTZjU2PV9eGMDWiVwv1yMdc7VOCVU7l
   5n/mgiSdzHgy/2ouup+mqjPHvXrjq0kzbStf3z2TZobDfDMn+VShHAFuo
   XQKdrDw3RbTyVSjI22b7PGqCCZjZ97kRkxfrRed4hzp5NUGqtNZetqlvX
   rNg9a7NkkgFc116zixm9nEt/C7Y9sUtXaEmo0ACqn+CltLhPKWH2iRwlE
   0E52mjNi6yiDYcg+jbLxXFn+6ds+wQuQTbYUZZTYWVTbi3J+3c5OU3BYh
   xNmAoEw56MTJIK8+7WvQhNUGcMgVLT1qpp68O42oDOG94geG7WHfUM8L4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="338101376"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="338101376"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 19:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="792823002"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="792823002"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2023 19:49:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfB0j-000Ds8-0f;
	Thu, 23 Mar 2023 02:49:05 +0000
Date: Thu, 23 Mar 2023 10:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lstoakes@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 288/290] mm/vmalloc.c:3448:8: warning: no
 previous prototype for function 'zero_iter'
Message-ID: <202303231055.DeninwHS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   39aca4f17e02ee4076b6ab327577c9b1be23775d
commit: d9cab54f77377439e766e1c5916f79ec2ee27a6c [288/290] mm: vmalloc: convert vread() to vread_iter()
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230323/202303231055.DeninwHS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=d9cab54f77377439e766e1c5916f79ec2ee27a6c
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout d9cab54f77377439e766e1c5916f79ec2ee27a6c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231055.DeninwHS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmalloc.c:3448:8: warning: no previous prototype for function 'zero_iter' [-Wmissing-prototypes]
   size_t zero_iter(struct iov_iter *iter, size_t count)
          ^
   mm/vmalloc.c:3448:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   size_t zero_iter(struct iov_iter *iter, size_t count)
   ^
   static 
>> mm/vmalloc.c:3543:6: warning: variable 'remains' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (bitmap_empty(vb->used_map, VMAP_BBMAP_BITS)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:3587:17: note: uninitialized use occurs here
           return count - remains + zero_iter(iter, remains);
                          ^~~~~~~
   mm/vmalloc.c:3543:2: note: remove the 'if' if its condition is always false
           if (bitmap_empty(vb->used_map, VMAP_BBMAP_BITS)) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:3539:6: warning: variable 'remains' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!vb)
               ^~~
   mm/vmalloc.c:3587:17: note: uninitialized use occurs here
           return count - remains + zero_iter(iter, remains);
                          ^~~~~~~
   mm/vmalloc.c:3539:2: note: remove the 'if' if its condition is always false
           if (!vb)
           ^~~~~~~~
   mm/vmalloc.c:3524:16: note: initialize the variable 'remains' to silence this warning
           size_t remains, n;
                         ^
                          = 0
   3 warnings generated.


vim +/zero_iter +3448 mm/vmalloc.c

  3442	
  3443	/*
  3444	 * Atomically zero bytes in the iterator.
  3445	 *
  3446	 * Returns the number of zeroed bytes.
  3447	 */
> 3448	size_t zero_iter(struct iov_iter *iter, size_t count)
  3449	{
  3450		size_t remains = count;
  3451	
  3452		while (remains > 0) {
  3453			size_t num, copied;
  3454	
  3455			num = remains < PAGE_SIZE ? remains : PAGE_SIZE;
  3456			copied = copy_page_to_iter_atomic(ZERO_PAGE(0), 0, num, iter);
  3457			remains -= copied;
  3458	
  3459			if (copied < num)
  3460				break;
  3461		}
  3462	
  3463		return count - remains;
  3464	}
  3465	
  3466	/*
  3467	 * small helper routine, copy contents to iter from addr.
  3468	 * If the page is not present, fill zero.
  3469	 *
  3470	 * Returns the number of copied bytes.
  3471	 */
  3472	static size_t aligned_vread_iter(struct iov_iter *iter,
  3473					 const char *addr, size_t count)
  3474	{
  3475		size_t remains = count;
  3476		struct page *page;
  3477	
  3478		while (remains > 0) {
  3479			unsigned long offset, length;
  3480			size_t copied = 0;
  3481	
  3482			offset = offset_in_page(addr);
  3483			length = PAGE_SIZE - offset;
  3484			if (length > remains)
  3485				length = remains;
  3486			page = vmalloc_to_page(addr);
  3487			/*
  3488			 * To do safe access to this _mapped_ area, we need lock. But
  3489			 * adding lock here means that we need to add overhead of
  3490			 * vmalloc()/vfree() calls for this _debug_ interface, rarely
  3491			 * used. Instead of that, we'll use an local mapping via
  3492			 * copy_page_to_iter_atomic() and accept a small overhead in
  3493			 * this access function.
  3494			 */
  3495			if (page)
  3496				copied = copy_page_to_iter_atomic(page, offset, length,
  3497								  iter);
  3498	
  3499			/* Zero anything we were unable to copy. */
  3500			copied += zero_iter(iter, length - copied);
  3501	
  3502			addr += copied;
  3503			remains -= copied;
  3504	
  3505			if (copied != length)
  3506				break;
  3507		}
  3508	
  3509		return count - remains;
  3510	}
  3511	
  3512	/*
  3513	 * Read from a vm_map_ram region of memory.
  3514	 *
  3515	 * Returns the number of copied bytes.
  3516	 */
  3517	static size_t vmap_ram_vread_iter(struct iov_iter *iter, const char *addr,
  3518					  size_t count, unsigned long flags)
  3519	{
  3520		char *start;
  3521		struct vmap_block *vb;
  3522		unsigned long offset;
  3523		unsigned int rs, re;
  3524		size_t remains, n;
  3525	
  3526		/*
  3527		 * If it's area created by vm_map_ram() interface directly, but
  3528		 * not further subdividing and delegating management to vmap_block,
  3529		 * handle it here.
  3530		 */
  3531		if (!(flags & VMAP_BLOCK))
  3532			return aligned_vread_iter(iter, addr, count);
  3533	
  3534		/*
  3535		 * Area is split into regions and tracked with vmap_block, read out
  3536		 * each region and zero fill the hole between regions.
  3537		 */
  3538		vb = xa_load(&vmap_blocks, addr_to_vb_idx((unsigned long)addr));
  3539		if (!vb)
  3540			goto finished_zero;
  3541	
  3542		spin_lock(&vb->lock);
> 3543		if (bitmap_empty(vb->used_map, VMAP_BBMAP_BITS)) {
  3544			spin_unlock(&vb->lock);
  3545			goto finished_zero;
  3546		}
  3547	
  3548		remains = count;
  3549		for_each_set_bitrange(rs, re, vb->used_map, VMAP_BBMAP_BITS) {
  3550			size_t copied;
  3551	
  3552			if (remains == 0)
  3553				goto finished;
  3554	
  3555			start = vmap_block_vaddr(vb->va->va_start, rs);
  3556	
  3557			if (addr < start) {
  3558				size_t to_zero = min_t(size_t, start - addr, remains);
  3559				size_t zeroed = zero_iter(iter, to_zero);
  3560	
  3561				addr += zeroed;
  3562				remains -= zeroed;
  3563	
  3564				if (remains == 0 || zeroed != to_zero)
  3565					goto finished;
  3566			}
  3567	
  3568			/*it could start reading from the middle of used region*/
  3569			offset = offset_in_page(addr);
  3570			n = ((re - rs + 1) << PAGE_SHIFT) - offset;
  3571			if (n > remains)
  3572				n = remains;
  3573	
  3574			copied = aligned_vread_iter(iter, start + offset, n);
  3575	
  3576			addr += copied;
  3577			remains -= copied;
  3578	
  3579			if (copied != n)
  3580				goto finished;
  3581		}
  3582	
  3583		spin_unlock(&vb->lock);
  3584	
  3585	finished_zero:
  3586		/* zero-fill the left dirty or free regions */
  3587		return count - remains + zero_iter(iter, remains);
  3588	finished:
  3589		/* We couldn't copy/zero everything */
  3590		spin_unlock(&vb->lock);
  3591		return count - remains;
  3592	}
  3593	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

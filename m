Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE17F3C04;
	Thu, 23 Mar 2023 09:52:52 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id r29so19735350wra.13;
        Thu, 23 Mar 2023 02:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679565171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NuCYbliYZ7iZ3hIyi5yG8ohoqgdvx6wlOaRLu54YPSU=;
        b=PXPR8xqtM4ILQGOHY6q7yjPHVzqlU6UXFPx3bszIw3h2Srtk+ckG4P2JdL3lOKrjig
         3c1dh+Cn4hpgZuxYoHbfDpipAh13NCRRq9QCc0GC0Ng8X5ml1CVqQSOVaRDH5o4/w8zs
         amiXEPHgh5hElR7wOM49MiXJPDJHHcre2hSu63hZ1LcGM4kdaJcp8fToJ/NNWI6kvgs/
         mpaoOPfFou84weNVhN2pxADqBrc0QpEmlQlX6zoIqTdQ7AWiauUppHfI+jmLuosd0e8d
         PoEGmGisTPnljDvAg3FggGYV5f99UgVa1k4UEK8rl2MdbinE1YBHdp6Pd3Yb6hc0BhCD
         nqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679565171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuCYbliYZ7iZ3hIyi5yG8ohoqgdvx6wlOaRLu54YPSU=;
        b=ZtPNsE+YKRBmVoHA7SEY9o4X5tljlk5rO2s1aL9ccdi0cUEgn8b4I7hiA+8Nc5EX12
         MMiO5pTxqYBIAFO/pWhapaEoZ3AuJ7gR+jKJqkraymN/1Zxx3sjYGb/p+tfdNSjXdRTX
         Grc+RvrHCTtFr7JoA3XTDdKv6FJudZHbAF+03zDC2T7tFjbOz2zHobfuX0Hs9K+mtzPz
         iSsyOYF+Z07BabeWvlRV+hkhqT9B1zzjRRV2QEmQ6GG0WNN3AhA/3ddy6qKKb8Ka2ZIf
         wQSaWuVUwRTy9mw+k69xDsW2m8N7CC4QCZ7t8rbvSfjc8q/yp0A6HpHEKIRjQKEDUCVB
         3g0Q==
X-Gm-Message-State: AAQBX9fSRE4lRuHuswOTzA0tn8fqMFFR1nrCc9cGGUqEY4wmfG1BIveY
	CEv50RvLTStZqjhaFUOw9QU=
X-Google-Smtp-Source: AKy350Zn3ROzMC35b/WPrdnragWj+/Zs+ielQ0U1vcvKr79sUEUlFPxL5o94H0dALIrP/x3+QWX6fg==
X-Received: by 2002:adf:f3c6:0:b0:2ce:fd37:9392 with SMTP id g6-20020adff3c6000000b002cefd379392mr1887256wrp.45.1679565170635;
        Thu, 23 Mar 2023 02:52:50 -0700 (PDT)
Received: from localhost (host86-156-84-164.range86-156.btcentralplus.com. [86.156.84.164])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d590f000000b002cfec8b7f89sm15909232wrd.77.2023.03.23.02.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 02:52:49 -0700 (PDT)
Date: Thu, 23 Mar 2023 09:52:49 +0000
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 288/290] mm/vmalloc.c:3448:8: warning: no
 previous prototype for function 'zero_iter'
Message-ID: <e95f6db4-9e0b-4346-8fdd-7e35202f77f9@lucifer.local>
References: <202303231055.DeninwHS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303231055.DeninwHS-lkp@intel.com>

On Thu, Mar 23, 2023 at 10:48:09AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   39aca4f17e02ee4076b6ab327577c9b1be23775d
> commit: d9cab54f77377439e766e1c5916f79ec2ee27a6c [288/290] mm: vmalloc: convert vread() to vread_iter()
> config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230323/202303231055.DeninwHS-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=d9cab54f77377439e766e1c5916f79ec2ee27a6c
>         git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
>         git fetch --no-tags akpm-mm mm-unstable
>         git checkout d9cab54f77377439e766e1c5916f79ec2ee27a6c
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303231055.DeninwHS-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> mm/vmalloc.c:3448:8: warning: no previous prototype for function 'zero_iter' [-Wmissing-prototypes]
>    size_t zero_iter(struct iov_iter *iter, size_t count)
>           ^
>    mm/vmalloc.c:3448:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    size_t zero_iter(struct iov_iter *iter, size_t count)
>    ^
>    static

Ack, will fix + respin.

> >> mm/vmalloc.c:3543:6: warning: variable 'remains' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>            if (bitmap_empty(vb->used_map, VMAP_BBMAP_BITS)) {
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/vmalloc.c:3587:17: note: uninitialized use occurs here
>            return count - remains + zero_iter(iter, remains);
>                           ^~~~~~~
>    mm/vmalloc.c:3543:2: note: remove the 'if' if its condition is always false
>            if (bitmap_empty(vb->used_map, VMAP_BBMAP_BITS)) {
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/vmalloc.c:3539:6: warning: variable 'remains' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>            if (!vb)
>                ^~~
>    mm/vmalloc.c:3587:17: note: uninitialized use occurs here
>            return count - remains + zero_iter(iter, remains);
>                           ^~~~~~~
>    mm/vmalloc.c:3539:2: note: remove the 'if' if its condition is always false
>            if (!vb)
>            ^~~~~~~~
>    mm/vmalloc.c:3524:16: note: initialize the variable 'remains' to silence this warning
>            size_t remains, n;
>                          ^
>                           = 0
>    3 warnings generated.
>

Remaining warnings have all already been fixed in latest version of this patch series.

>
> vim +/zero_iter +3448 mm/vmalloc.c
>
>   3442
>   3443	/*
>   3444	 * Atomically zero bytes in the iterator.
>   3445	 *
>   3446	 * Returns the number of zeroed bytes.
>   3447	 */
> > 3448	size_t zero_iter(struct iov_iter *iter, size_t count)
>   3449	{
>   3450		size_t remains = count;
>   3451
>   3452		while (remains > 0) {
>   3453			size_t num, copied;
>   3454
>   3455			num = remains < PAGE_SIZE ? remains : PAGE_SIZE;
>   3456			copied = copy_page_to_iter_atomic(ZERO_PAGE(0), 0, num, iter);
>   3457			remains -= copied;
>   3458
>   3459			if (copied < num)
>   3460				break;
>   3461		}
>   3462
>   3463		return count - remains;
>   3464	}
>   3465
>   3466	/*
>   3467	 * small helper routine, copy contents to iter from addr.
>   3468	 * If the page is not present, fill zero.
>   3469	 *
>   3470	 * Returns the number of copied bytes.
>   3471	 */
>   3472	static size_t aligned_vread_iter(struct iov_iter *iter,
>   3473					 const char *addr, size_t count)
>   3474	{
>   3475		size_t remains = count;
>   3476		struct page *page;
>   3477
>   3478		while (remains > 0) {
>   3479			unsigned long offset, length;
>   3480			size_t copied = 0;
>   3481
>   3482			offset = offset_in_page(addr);
>   3483			length = PAGE_SIZE - offset;
>   3484			if (length > remains)
>   3485				length = remains;
>   3486			page = vmalloc_to_page(addr);
>   3487			/*
>   3488			 * To do safe access to this _mapped_ area, we need lock. But
>   3489			 * adding lock here means that we need to add overhead of
>   3490			 * vmalloc()/vfree() calls for this _debug_ interface, rarely
>   3491			 * used. Instead of that, we'll use an local mapping via
>   3492			 * copy_page_to_iter_atomic() and accept a small overhead in
>   3493			 * this access function.
>   3494			 */
>   3495			if (page)
>   3496				copied = copy_page_to_iter_atomic(page, offset, length,
>   3497								  iter);
>   3498
>   3499			/* Zero anything we were unable to copy. */
>   3500			copied += zero_iter(iter, length - copied);
>   3501
>   3502			addr += copied;
>   3503			remains -= copied;
>   3504
>   3505			if (copied != length)
>   3506				break;
>   3507		}
>   3508
>   3509		return count - remains;
>   3510	}
>   3511
>   3512	/*
>   3513	 * Read from a vm_map_ram region of memory.
>   3514	 *
>   3515	 * Returns the number of copied bytes.
>   3516	 */
>   3517	static size_t vmap_ram_vread_iter(struct iov_iter *iter, const char *addr,
>   3518					  size_t count, unsigned long flags)
>   3519	{
>   3520		char *start;
>   3521		struct vmap_block *vb;
>   3522		unsigned long offset;
>   3523		unsigned int rs, re;
>   3524		size_t remains, n;
>   3525
>   3526		/*
>   3527		 * If it's area created by vm_map_ram() interface directly, but
>   3528		 * not further subdividing and delegating management to vmap_block,
>   3529		 * handle it here.
>   3530		 */
>   3531		if (!(flags & VMAP_BLOCK))
>   3532			return aligned_vread_iter(iter, addr, count);
>   3533
>   3534		/*
>   3535		 * Area is split into regions and tracked with vmap_block, read out
>   3536		 * each region and zero fill the hole between regions.
>   3537		 */
>   3538		vb = xa_load(&vmap_blocks, addr_to_vb_idx((unsigned long)addr));
>   3539		if (!vb)
>   3540			goto finished_zero;
>   3541
>   3542		spin_lock(&vb->lock);
> > 3543		if (bitmap_empty(vb->used_map, VMAP_BBMAP_BITS)) {
>   3544			spin_unlock(&vb->lock);
>   3545			goto finished_zero;
>   3546		}
>   3547
>   3548		remains = count;
>   3549		for_each_set_bitrange(rs, re, vb->used_map, VMAP_BBMAP_BITS) {
>   3550			size_t copied;
>   3551
>   3552			if (remains == 0)
>   3553				goto finished;
>   3554
>   3555			start = vmap_block_vaddr(vb->va->va_start, rs);
>   3556
>   3557			if (addr < start) {
>   3558				size_t to_zero = min_t(size_t, start - addr, remains);
>   3559				size_t zeroed = zero_iter(iter, to_zero);
>   3560
>   3561				addr += zeroed;
>   3562				remains -= zeroed;
>   3563
>   3564				if (remains == 0 || zeroed != to_zero)
>   3565					goto finished;
>   3566			}
>   3567
>   3568			/*it could start reading from the middle of used region*/
>   3569			offset = offset_in_page(addr);
>   3570			n = ((re - rs + 1) << PAGE_SHIFT) - offset;
>   3571			if (n > remains)
>   3572				n = remains;
>   3573
>   3574			copied = aligned_vread_iter(iter, start + offset, n);
>   3575
>   3576			addr += copied;
>   3577			remains -= copied;
>   3578
>   3579			if (copied != n)
>   3580				goto finished;
>   3581		}
>   3582
>   3583		spin_unlock(&vb->lock);
>   3584
>   3585	finished_zero:
>   3586		/* zero-fill the left dirty or free regions */
>   3587		return count - remains + zero_iter(iter, remains);
>   3588	finished:
>   3589		/* We couldn't copy/zero everything */
>   3590		spin_unlock(&vb->lock);
>   3591		return count - remains;
>   3592	}
>   3593
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests

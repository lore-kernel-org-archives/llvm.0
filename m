Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028456;
	b=tSLOmB8ETcCcPV3UulrNSBZoSvFFRxQuIZVqBdNEtExyaoE8/ZUNpFsDc9+YU8oLzZn1
	 7w5YzmYda0jYOn9coegr0/kW3y+/mEXbL9A6jZhKx5cRBNZdN2uDyebY5uVhxdZ+3O5+s
	 eALwTh1w5GK2RzqUVMdCy430GpZP6+3FvL/59f5kf/JE97keFgwhJjFXUqmJOq8lBI78Z
	 ct/kRv2oNdrtHlOOOgLu80bouLqP0Z3+i06EPpHYTyvGHOkPvpQJ7jQKZ0TvrbYZHQVD1
	 13pwTYrSWkJr5GAhj+biJts9FsR1PKPKXFsvHw6FMiue8bTyyzOT2dEnoq65yKc29lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028456;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=uwrviB0V77dOZT+62nwdF52qcqTnfDzhgh0JkbWxJAQ=;
	b=buDtkUW23GOQikCRA0bB97dQ6gJ+fpc4+IF9GGA6wsPeIrFiXUh9GgaMQGmsnUKvLoQL
	 N0tyvOTDVDz5EHmOM6rWjcUUgwucmRBYbxi9RX6LskDcR6reJt0BWLdMFXhR6hQXytoZp
	 B7mNCGzS7pN7XLeMaI/txlw4O6eiEPwJKByORb85/I8w0G44QX14Z+xtECwrhvZkgxlWP
	 M4/XyVkcU0/XiuH/yeVOOTfilePIj1Y6ssx3Ns9+Gyku+rJgX0RUAzpO74Tdug6veYjC0
	 YptpZr5VpyV8fyc+uS9fVJ8sRtTcULQ3HbABGzxZ81Uxd0TkUP1YP2ZZsjzWTLLBPEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="F/eOUNaY";
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254F4606A31D;
	Mon, 26 Oct 2026 15:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 254F4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F/eOUNaY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793028456; x=1824564456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=76se6GdY00wxVeRrT06BipJC7tgWRFFYIOsN4/CQ9fQ=;
  b=F/eOUNaYD70cn729veofdbj0Ih5U2RzLh4OtXCXA2sz2fCf4RTXODfeD
   vraaXlEc7v4CU5S7gaG/MvmeW0FJLZDIkwN92txoPyZYhg/M4AuwfSIUt
   WxLq56Bsq8s4DHPzKUNvBZ2J8zq9tyE7XBCHaIrSj0HzSpF+z5rMnoxD3
   Kh71hoKtYMPwCqyIeg4bRyeyzP/I+fxQlg55xe5BF6jxgAoFx6odqqtTa
   WG+3LIqr9u1ldE8QjQy/p6bSCRH4iprh75HRhUhZ/Fyvc4i4SEs9nN0Iv
   fRPBFxOCdPzDukpEPf1Nz2WwALVQNnGFHiNeKjWxR8OW0rHrDEyy016jO
   A==;
X-CSE-ConnectionGUID: c7wPKrInSN+rWUW2rud9ow==
X-CSE-MsgGUID: IYuLdH6oS4+zrEzxQs5yhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1589087"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1589087"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 08:27:35 -0700
X-CSE-ConnectionGUID: aerT82FXQ2C8FihUzrHUXw==
X-CSE-MsgGUID: YtHeDwQ6TLKRrAvfX4ztpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4407337"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Oct 2026 08:27:34 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLMbj-00000000W9C-1ddb;
	Mon, 26 Oct 2026 15:27:31 +0000
Date: Mon, 26 Oct 2026 23:27:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 4/9] bpf: Add kfuncs to allocate and seal user
 pages
Message-ID: <202610262325.yiL2BU9U-lkp@intel.com>
References: <20261021195759.119421-5-jolsa@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021195759.119421-5-jolsa@kernel.org>

Hi Jiri,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/bpf-Add-__srcptr-kfunc-argument-suffix/20261021-215750
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20261021195759.119421-5-jolsa%40kernel.org
patch subject: [RFC bpf-next 4/9] bpf: Add kfuncs to allocate and seal user pages
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261026/202610262325.yiL2BU9U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610262325.yiL2BU9U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610262325.yiL2BU9U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/helpers.c:3855:2: error: call to undeclared function 'flush_icache_user_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3855 |         flush_icache_user_page(vma, page, addr, PAGE_SIZE);
         |         ^
   1 error generated.


vim +/flush_icache_user_page +3855 kernel/bpf/helpers.c

  3807	
  3808	/**
  3809	 * bpf_user_page_exec() - Make a BPF-allocated user page read/execute
  3810	 * @addr: Address of the page to change
  3811	 *
  3812	 * Changes a writable page created by bpf_user_page_alloc() to read/execute.
  3813	 * The page cannot be made writable again after this call.
  3814	 *
  3815	 * Return: 0 on success, or a negative error code.
  3816	 */
  3817	__bpf_kfunc int bpf_user_page_exec(unsigned long addr)
  3818	{
  3819		struct mm_struct *mm = current->mm;
  3820		struct vm_area_struct *vma;
  3821		struct page *page;
  3822		int err = -EINVAL;
  3823	
  3824		if (unlikely(in_interrupt() ||
  3825			     current->flags & (PF_KTHREAD | PF_EXITING)))
  3826			return -EPERM;
  3827		if (unlikely(!nmi_uaccess_okay()))
  3828			return -EPERM;
  3829		if (unlikely(!mm))
  3830			return -EFAULT;
  3831		if ((addr & ~PAGE_MASK) || addr > ULONG_MAX - PAGE_SIZE)
  3832			return -EINVAL;
  3833	
  3834		if (mmap_write_lock_killable(mm))
  3835			return -EINTR;
  3836	
  3837		vma = find_vma(mm, addr);
  3838		if (!vma || vma->vm_start > addr)
  3839			goto out;
  3840		/* Allow to change only vma allocated by bpf_user_page_alloc. */
  3841		if (vma->vm_private_data != &bpf_user_page_marker)
  3842			goto out;
  3843		if (!(vma->vm_flags & VM_WRITE) || !(vma->vm_flags & VM_MAYEXEC))
  3844			goto out;
  3845	
  3846		vma_start_write(vma);
  3847	
  3848		err = get_user_pages(addr, 1, FOLL_WRITE, &page);
  3849		if (err != 1) {
  3850			if (!err)
  3851				err = -EFAULT;
  3852			goto out;
  3853		}
  3854	
> 3855		flush_icache_user_page(vma, page, addr, PAGE_SIZE);
  3856		err = do_mprotect_pkey_locked(addr, PAGE_SIZE, PROT_READ | PROT_EXEC, -1);
  3857		if (!err) {
  3858			vma = find_vma(mm, addr);
  3859			vm_flags_clear(vma, VM_MAYWRITE);
  3860		}
  3861		put_page(page);
  3862	out:
  3863		mmap_write_unlock(mm);
  3864		return err;
  3865	}
  3866	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

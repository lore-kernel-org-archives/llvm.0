Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A73183092;
	Mon,  2 Sep 2024 08:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265253; cv=none; b=EFKrTSz7ZGtbOT8iq5cttgSCmFhTc2xK8DxcyILwknQckcDV/kvM/btlKE/HSOU1W/WJ9C/a1kptKhYPYxji76uDe3XqIw177YpgC20J6e3xpAzn8TU81mdkTCRQc1NdvdDkaTPxDDlBGzcpMJ3nPHLJy1FR1Xfb84RqH1cmgw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265253; c=relaxed/simple;
	bh=DfeU9RwT8eIcyB1OUEULcyLn9iuo5xD510NAoTytBfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLzHLgWKwAPdjpfykCOzeD8CUIuzkZVaacWXi163ftXuwjIndMPKB0JQmtu35RgWLPWFkrv/h16eP1JFxN8UO9CYYdTaODVma0Tp81PsJDT7CpvBIH0hZ6c4IPBSpDTsiO1PO+hlwVh7/LgPmQjPz8mJ61b86TInUyGdzmSbSgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhGZzNpD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhGZzNpD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725265252; x=1756801252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DfeU9RwT8eIcyB1OUEULcyLn9iuo5xD510NAoTytBfA=;
  b=mhGZzNpD9J+R9yDDqmyMKS5Hk4rX5bub/B0j1pfaourUu74pvyvZIolk
   c+Pc8E0mTG0IROIQQh5lhr4s+zvOKBQW9EipfMXwO9D6r79Yoz6EPWjbu
   fRHsNEXu2q+O6YgvOS+nw36u/bRD2MGVcBZw2SUccyA8cE+uktG7/cyzj
   lYkhHgRkP/eFvfNbVSavmyoqHOVeGsIttq4cIW4773eKO2rp2CDQDYHYU
   Y2d6CIjJDI7QYiWdCELNpPRfh/pgG0riXMmZ54AWON1S/sey9j5A+Ho/W
   Ea7NEwInuFL3vCoBb9gAMuuFa+ECJ/IL+sjMOISmrmQWHMODH4B2wBiV1
   w==;
X-CSE-ConnectionGUID: inKPPP8DRGaeOlBhGjpfPw==
X-CSE-MsgGUID: btEDgfPcR32qfXBGJwdCYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="46347039"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="46347039"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 01:20:50 -0700
X-CSE-ConnectionGUID: 5uzsWQsFRfGG6KqA+0s4Nw==
X-CSE-MsgGUID: TLoUZJKTQfSDErpMhVndTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="95346307"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Sep 2024 01:20:48 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sl2In-0005Hi-2u;
	Mon, 02 Sep 2024 08:20:45 +0000
Date: Mon, 2 Sep 2024 16:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 3/5] kvm: Convert to use guest_memfd library
Message-ID: <202409021535.vtV8F7s7-lkp@intel.com>
References: <20240829-guest-memfd-lib-v2-3-b9afc1ff3656@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-guest-memfd-lib-v2-3-b9afc1ff3656@quicinc.com>

Hi Elliot,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 5be63fc19fcaa4c236b307420483578a56986a37]

url:    https://github.com/intel-lab-lkp/linux/commits/Elliot-Berman/mm-Introduce-guest_memfd/20240830-062545
base:   5be63fc19fcaa4c236b307420483578a56986a37
patch link:    https://lore.kernel.org/r/20240829-guest-memfd-lib-v2-3-b9afc1ff3656%40quicinc.com
patch subject: [PATCH RFC v2 3/5] kvm: Convert to use guest_memfd library
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240902/202409021535.vtV8F7s7-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409021535.vtV8F7s7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409021535.vtV8F7s7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/guest_memfd.c:443:5: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
     442 |         WARN_ONCE(val != expected, "folio[%x] safe ref: %d != expected %d\n",
         |                                           ~~
         |                                           %lx
     443 |                   folio_index(folio), val, expected);
         |                   ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:152:38: note: expanded from macro 'WARN_ONCE'
     152 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                                             ^~~~~~
   include/linux/once_lite.h:31:9: note: expanded from macro 'DO_ONCE_LITE_IF'
      31 |                         func(__VA_ARGS__);                              \
         |                              ^~~~~~~~~~~
   include/asm-generic/bug.h:134:29: note: expanded from macro 'WARN'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                                           ^~~~~~
   include/asm-generic/bug.h:106:17: note: expanded from macro '__WARN_printf'
     106 |                 __warn_printk(arg);                                     \
         |                               ^~~
>> mm/guest_memfd.c:443:25: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
     442 |         WARN_ONCE(val != expected, "folio[%x] safe ref: %d != expected %d\n",
         |                                                         ~~
         |                                                         %lu
     443 |                   folio_index(folio), val, expected);
         |                                       ^~~
   include/asm-generic/bug.h:152:38: note: expanded from macro 'WARN_ONCE'
     152 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                                             ^~~~~~
   include/linux/once_lite.h:31:9: note: expanded from macro 'DO_ONCE_LITE_IF'
      31 |                         func(__VA_ARGS__);                              \
         |                              ^~~~~~~~~~~
   include/asm-generic/bug.h:134:29: note: expanded from macro 'WARN'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                                           ^~~~~~
   include/asm-generic/bug.h:106:17: note: expanded from macro '__WARN_printf'
     106 |                 __warn_printk(arg);                                     \
         |                               ^~~
   mm/guest_memfd.c:443:30: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
     442 |         WARN_ONCE(val != expected, "folio[%x] safe ref: %d != expected %d\n",
         |                                                                        ~~
         |                                                                        %lu
     443 |                   folio_index(folio), val, expected);
         |                                            ^~~~~~~~
   include/asm-generic/bug.h:152:38: note: expanded from macro 'WARN_ONCE'
     152 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                                             ^~~~~~
   include/linux/once_lite.h:31:9: note: expanded from macro 'DO_ONCE_LITE_IF'
      31 |                         func(__VA_ARGS__);                              \
         |                              ^~~~~~~~~~~
   include/asm-generic/bug.h:134:29: note: expanded from macro 'WARN'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                                           ^~~~~~
   include/asm-generic/bug.h:106:17: note: expanded from macro '__WARN_printf'
     106 |                 __warn_printk(arg);                                     \
         |                               ^~~
   3 warnings generated.
--
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:37:14: error: use of undeclared identifier 'slot'
      37 |         gfn_t gfn = slot->base_gfn + folio_index(folio) - slot->gmem.pgoff;
         |                     ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:37:52: error: use of undeclared identifier 'slot'
      37 |         gfn_t gfn = slot->base_gfn + folio_index(folio) - slot->gmem.pgoff;
         |                                                           ^
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:38:33: error: use of undeclared identifier 'kvm'
      38 |         int rc = kvm_arch_gmem_prepare(kvm, gfn, pfn, folio_order(folio));
         |                                        ^
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:41:9: error: call to undeclared library function 'index' with type 'char *(const char *, int)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      41 |                                     index, gfn, pfn, rc);
         |                                     ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:41:9: note: include the header <strings.h> or explicitly provide a declaration for 'index'
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:41:9: warning: format specifies type 'unsigned long' but the argument has type 'char *(*)(const char *, int)' [-Wformat]
      40 |                 pr_warn_ratelimited("gmem: Failed to prepare folio for index %lx GFN %llx PFN %llx error %d.\n",
         |                                                                              ~~~
      41 |                                     index, gfn, pfn, rc);
         |                                     ^~~~~
   include/linux/printk.h:675:49: note: expanded from macro 'pr_warn_ratelimited'
     675 |         printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:659:17: note: expanded from macro 'printk_ratelimited'
     659 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:362:3: error: use of undeclared identifier 'grab_flags'
     362 |                 grab_flags = GUEST_MEMFD_GRAB_ACCESSIBLE;
         |                 ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:364:3: error: use of undeclared identifier 'grab_flags'
     364 |                 grab_flags = GUEST_MEMFD_GRAB_INACCESSIBLE;
         |                 ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:366:46: error: use of undeclared identifier 'grab_flags'; did you mean 'iocb_flags'?
     366 |         folio = guest_memfd_grab_folio(file, index, grab_flags);
         |                                                     ^~~~~~~~~~
         |                                                     iocb_flags
   include/linux/fs.h:3431:19: note: 'iocb_flags' declared here
    3431 | static inline int iocb_flags(struct file *file)
         |                   ^
   1 warning and 7 errors generated.
--
>> arch/x86/kvm/svm/sev.c:2300:9: error: call to undeclared function 'guest_memfd_make_inaccessible'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2300 |                 ret = guest_memfd_make_inaccessible(pfn_folio(pfn));
         |                       ^
   1 error generated.


vim +/grab_flags +362 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   336	
   337	/* Returns a locked folio on success.  */
   338	static struct folio *
   339	__kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
   340			   gfn_t gfn, kvm_pfn_t *pfn, bool accessible,
   341			   int *max_order)
   342	{
   343		pgoff_t index = gfn - slot->base_gfn + slot->gmem.pgoff;
   344		struct kvm_gmem *gmem = file->private_data;
   345		struct folio *folio;
   346	
   347		if (file != slot->gmem.file) {
   348			WARN_ON_ONCE(slot->gmem.file);
   349			return ERR_PTR(-EFAULT);
   350		}
   351	
   352		gmem = file_to_kvm_gmem(file);
   353		if (WARN_ON_ONCE(!gmem))
   354			return ERR_PTR(-EFAULT);
   355	
   356		if (xa_load(&gmem->bindings, index) != slot) {
   357			WARN_ON_ONCE(xa_load(&gmem->bindings, index));
   358			return ERR_PTR(-EIO);
   359		}
   360	
   361		if (accessible)
 > 362			grab_flags = GUEST_MEMFD_GRAB_ACCESSIBLE;
   363		else
   364			grab_flags = GUEST_MEMFD_GRAB_INACCESSIBLE;
   365	
   366		folio = guest_memfd_grab_folio(file, index, grab_flags);
   367		if (IS_ERR(folio))
   368			return folio;
   369	
   370		if (folio_test_hwpoison(folio)) {
   371			folio_unlock(folio);
   372			guest_memfd_put_folio(folio, accessible ? 1 : 0);
   373			return ERR_PTR(-EHWPOISON);
   374		}
   375	
   376		*pfn = folio_file_pfn(folio, index);
   377		if (max_order)
   378			*max_order = 0;
   379	
   380		return folio;
   381	}
   382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

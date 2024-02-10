Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D727347F5F;
	Sat, 10 Feb 2024 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707569306; cv=none; b=Ml/8aRxi4v9x4yVHAooO0fSX/32PVXrgdRdZyZjbUfew0V2FCunmJHd1e0Ka/Ijl7bDOVE2lwtGSM3EJlvDJxx/i6lZ6JtA6E2tRyVhsMfuXDYfpkjxMTNK3XBF+JGO+rFHrG+7pg3a8n+PmKhIm8s8Hm8vesNmB3hnij64/eC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707569306; c=relaxed/simple;
	bh=s7tJQulCMzXrw+l1/39EpAZgwKS/Tf4uyEU5QBW2waA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMb9QYTYX6FUaDE+34U4Mx5qwMt9WdCvYy7CAwnnqijmR9iAZszZFdBIoSmisoR0xzcn4BaUrEuPq/5fntw+WNN1tHDBUyHcBOwGU3G4A3jFmVAcE5uVYVvq2a7ODglX4KRZ9+4MjtcFPC4O43QRygutuXDb1U8GRz9jvDrE8SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hcauqa5a; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hcauqa5a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707569304; x=1739105304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s7tJQulCMzXrw+l1/39EpAZgwKS/Tf4uyEU5QBW2waA=;
  b=hcauqa5ae2TN/6x8L9BSrQdgygvwW6jVTehOtbKfLSufMw201bN4ON5n
   0POo8HJIF2pSZTh6V3retDEWRR124QdXpQO0za6toEE/LQVHIJA7ompJW
   IRfBurxGlCFHceAOiENIBaz2q1kJ3XWhtlz8APUxP9VEwWoUH8jcnOBOv
   6k3nskRxhWnZe1b7JD6KTKP2VSiaxWuZrUEj/9kv+IYBwsk1USmao7xi4
   itr0XAkmMOSpP42vyxTEcBhBSYqYwWJy6teaEA2LIX7KvYb3sQgdv2wvr
   9oNcjxz3zpPjHzuq25XPQu3EMK3ZDYZDI38OzhuYv1oouBSfAGLoeisWZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1692936"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="1692936"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 04:48:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="934664994"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="934664994"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2024 04:48:19 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYmmH-0005f8-0q;
	Sat, 10 Feb 2024 12:48:17 +0000
Date: Sat, 10 Feb 2024 20:48:10 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/9] shmem: add per-block uptodate tracking for
 hugepages
Message-ID: <202402102029.0PdBJnsN-lkp@intel.com>
References: <20240209142901.126894-3-da.gomez@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240209142901.126894-3-da.gomez@samsung.com>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on brauner-vfs/vfs.all linus/master v6.8-rc3 next-20240209]
[cannot apply to vfs-idmapping/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Gomez/splice-don-t-check-for-uptodate-if-partially-uptodate-is-impl/20240209-223226
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240209142901.126894-3-da.gomez%40samsung.com
patch subject: [RFC PATCH 2/9] shmem: add per-block uptodate tracking for hugepages
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20240210/202402102029.0PdBJnsN-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ac0577177f053ba7e7016e1b7e44cf5932d00b03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402102029.0PdBJnsN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402102029.0PdBJnsN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/shmem.c:29:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/shmem.c:29:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/shmem.c:29:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> mm/shmem.c:4660:27: error: use of undeclared identifier 'shmem_invalidate_folio'; did you mean 'shmem_replace_folio'?
    4660 |         .invalidate_folio      = shmem_invalidate_folio,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
         |                                  shmem_replace_folio
   mm/shmem.c:1866:12: note: 'shmem_replace_folio' declared here
    1866 | static int shmem_replace_folio(struct folio **foliop, gfp_t gfp,
         |            ^
>> mm/shmem.c:4661:27: error: use of undeclared identifier 'shmem_release_folio'; did you mean 'shmem_replace_folio'?
    4661 |         .release_folio         = shmem_release_folio,
         |                                  ^~~~~~~~~~~~~~~~~~~
         |                                  shmem_replace_folio
   mm/shmem.c:1866:12: note: 'shmem_replace_folio' declared here
    1866 | static int shmem_replace_folio(struct folio **foliop, gfp_t gfp,
         |            ^
>> mm/shmem.c:4662:27: error: use of undeclared identifier 'shmem_is_partially_uptodate'; did you mean 'shmem_set_range_uptodate'?
    4662 |         .is_partially_uptodate = shmem_is_partially_uptodate,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  shmem_set_range_uptodate
   mm/shmem.c:242:13: note: 'shmem_set_range_uptodate' declared here
     242 | static void shmem_set_range_uptodate(struct folio *folio, size_t off,
         |             ^
>> mm/shmem.c:4660:27: error: incompatible function pointer types initializing 'void (*)(struct folio *, size_t, size_t)' (aka 'void (*)(struct folio *, unsigned int, unsigned int)') with an expression of type 'int (struct folio **, gfp_t, struct shmem_inode_info *, unsigned long)' (aka 'int (struct folio **, unsigned int, struct shmem_inode_info *, unsigned long)') [-Wincompatible-function-pointer-types]
    4660 |         .invalidate_folio      = shmem_invalidate_folio,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
>> mm/shmem.c:4661:27: error: incompatible function pointer types initializing 'bool (*)(struct folio *, gfp_t)' (aka '_Bool (*)(struct folio *, unsigned int)') with an expression of type 'int (struct folio **, gfp_t, struct shmem_inode_info *, unsigned long)' (aka 'int (struct folio **, unsigned int, struct shmem_inode_info *, unsigned long)') [-Wincompatible-function-pointer-types]
    4661 |         .release_folio         = shmem_release_folio,
         |                                  ^~~~~~~~~~~~~~~~~~~
   mm/shmem.c:4662:27: error: incompatible function pointer types initializing 'bool (*)(struct folio *, size_t, size_t)' (aka '_Bool (*)(struct folio *, unsigned int, unsigned int)') with an expression of type 'void (struct folio *, size_t, size_t)' (aka 'void (struct folio *, unsigned int, unsigned int)') [-Wincompatible-function-pointer-types]
    4662 |         .is_partially_uptodate = shmem_is_partially_uptodate,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 warnings and 6 errors generated.


vim +4660 mm/shmem.c

  4648	
  4649	const struct address_space_operations shmem_aops = {
  4650		.writepage	= shmem_writepage,
  4651		.dirty_folio	= noop_dirty_folio,
  4652	#ifdef CONFIG_TMPFS
  4653		.write_begin	= shmem_write_begin,
  4654		.write_end	= shmem_write_end,
  4655	#endif
  4656	#ifdef CONFIG_MIGRATION
  4657		.migrate_folio	= migrate_folio,
  4658	#endif
  4659		.error_remove_folio    = shmem_error_remove_folio,
> 4660		.invalidate_folio      = shmem_invalidate_folio,
> 4661		.release_folio         = shmem_release_folio,
> 4662		.is_partially_uptodate = shmem_is_partially_uptodate,
  4663	};
  4664	EXPORT_SYMBOL(shmem_aops);
  4665	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

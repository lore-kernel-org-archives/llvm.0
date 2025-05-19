Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1FE286D50;
	Mon, 19 May 2025 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747671027; cv=none; b=FE24QjGLgL82d2m8LbyH/LaRFSh22+h5CXUDMWKSSUjugZAI+SIW6rLLZwVAx0ASu00WOAVviUOLgjTPShOHQ2BUbtZVhll1qSg0R0xTSD5/5lRgCXPN1HLTTC3vADafhUK8KUKjyvrVjcmrHWWOLGcVxtadMjyMrskA1GQoQxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747671027; c=relaxed/simple;
	bh=j+bVP0uNICCNurLdqiZqA9Cju8ETnecDRX3gzCIri2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rlsRbmrrWASEAivN78mViOI0EudSRm4LiRHc1aSMy2nXu2oS0QQ8wruosmuoOiS+J2yQC2FvUnegcj/jw0bPW3VtI1CiSr2NWXqsG7LKs7V/FyQAJnZckPS3YO7khmSBTWlpgQDaIiUGEDaYftgSCtTwP/HtNOnMqXM2qQ/fggI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KaOPIu32; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KaOPIu32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747671026; x=1779207026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j+bVP0uNICCNurLdqiZqA9Cju8ETnecDRX3gzCIri2A=;
  b=KaOPIu32tbwCjGRsqhAFDWJ8DBamk6EhYYVo/6yD2KZ59ijvaWZaJAer
   zOQ9ynJl6BNWMUwO2F1tnLPLa/qfnZhP75X/zn1o43us7lllre9nvqd8O
   fYKzERvMtoF2SUL/y3w0mwQH3xuiTpBwMkJaoXOMPHScy58Ymhox8vj5E
   cgRGsGnPAGDOC7V5AtXItoNjYYSNT7tc/FDUMERjSIROkaWqsBExo/NPd
   bd1dyo6iHwfrKCh6fvAVMqRl3R2CddLWTtTyP8La8mDJuoLFdSY5qY11j
   m2Oe3w7tGmudFYfBOsbxJAGsMRAOdquAcydAWRe/JSDJFKbowygP4OLKT
   A==;
X-CSE-ConnectionGUID: gH+x68/yStSorPZg+k4KQw==
X-CSE-MsgGUID: XYuVXDvBTwyDwh4L8VGuEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53251259"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="53251259"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 09:05:45 -0700
X-CSE-ConnectionGUID: RbCs4tWdSvm+X2195BkpyA==
X-CSE-MsgGUID: 1bMx/4ULQXaSvJz8gAclcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="144291402"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 May 2025 09:05:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH2zl-000Ler-09;
	Mon, 19 May 2025 16:05:41 +0000
Date: Tue, 20 May 2025 00:05:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ira Weiny <ira.weiny@intel.com>,
	Vishal Annapurve <vannapurve@google.com>
Subject: [weiny2:ackerley-1g-master 61/75]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1054:8: error: call to
 undeclared function 'kvm_gmem_try_split_folio_in_filemap'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202505192308.KaLy1qgi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git ackerley-1g-master
head:   773f26b5bef6e4d3094a33605165a5c6ab9aa0f0
commit: e7be1476dfcae0413b3fd9882a6fe5f951113c22 [61/75] KVM: guest_memfd: Split allocator pages for guest_memfd use
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250519/202505192308.KaLy1qgi-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505192308.KaLy1qgi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505192308.KaLy1qgi-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:888:2: error: too few arguments to function call, at least argument 'fmt' must be specified
     888 |         WARN_ONCE("Unexpected call to get shared folio.")
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:152:29: note: expanded from macro 'WARN_ONCE'
     152 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/linux/once_lite.h:31:4: note: expanded from macro 'DO_ONCE_LITE_IF'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:134:3: note: expanded from macro 'WARN'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:106:20: note: expanded from macro '__WARN_printf'
     106 |                 __warn_printk(arg);                                     \
         |                 ~~~~~~~~~~~~~    ^
   include/asm-generic/bug.h:93:28: note: '__warn_printk' declared here
      93 | extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
         |                            ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:888:51: error: expected ';' after expression
     888 |         WARN_ONCE("Unexpected call to get shared folio.")
         |                                                          ^
         |                                                          ;
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1054:8: error: call to undeclared function 'kvm_gmem_try_split_folio_in_filemap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1054 |         ret = kvm_gmem_try_split_folio_in_filemap(inode, folio);
         |               ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1593:15: warning: variable 'argp' set but not used [-Wunused-but-set-variable]
    1593 |         void __user *argp;
         |                      ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1623:1: warning: unused label 'out' [-Wunused-label]
    1623 | out:
         | ^~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1653:33: warning: unused variable 'private' [-Wunused-variable]
    1653 |         struct kvm_gmem_inode_private *private = kvm_gmem_private(inode);
         |                                        ^~~~~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1840:20: error: no member named 'shareability' in 'struct kvm_gmem_inode_private'
    1840 |         mt_init(&private->shareability);
         |                  ~~~~~~~  ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1843:36: error: incompatible pointer types passing 'struct kvm_gmem_inode_private *' to parameter of type 'struct maple_tree *' [-Werror,-Wincompatible-pointer-types]
    1843 |         err = kvm_gmem_shareability_setup(private, size, flags);
         |                                           ^~~~~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:881:59: note: passing argument to parameter 'mt' here
     881 | static int kvm_gmem_shareability_setup(struct maple_tree *mt, loff_t size, u64 flags)
         |                                                           ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:2047:6: error: call to undeclared function 'kvm_gmem_supports_shared'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2047 |         if (kvm_gmem_supports_shared(inode) && slot->userspace_addr &&
         |             ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:2047:6: note: did you mean 'kvm_gmem_memslot_supports_shared'?
   include/linux/kvm_host.h:2504:20: note: 'kvm_gmem_memslot_supports_shared' declared here
    2504 | static inline bool kvm_gmem_memslot_supports_shared(const struct kvm_memory_slot *slot)
         |                    ^
   3 warnings and 6 errors generated.


vim +/kvm_gmem_try_split_folio_in_filemap +1054 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   985	
   986	/*
   987	 * Returns a locked folio on success.  The caller is responsible for
   988	 * setting the up-to-date flag before the memory is mapped into the guest.
   989	 * There is no backing storage for the memory, so the folio will remain
   990	 * up-to-date until it's removed.
   991	 *
   992	 * Ignore accessed, referenced, and dirty flags.  The memory is
   993	 * unevictable and there is no storage to write back to.
   994	 */
   995	static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
   996	{
   997		size_t allocated_size;
   998		struct folio *folio;
   999		pgoff_t index_floor;
  1000		int ret;
  1001	
  1002	repeat:
  1003		folio = filemap_lock_folio(inode->i_mapping, index);
  1004		if (!IS_ERR(folio))
  1005			return folio;
  1006	
  1007		if (kvm_gmem_has_custom_allocator(inode)) {
  1008			size_t nr_pages;
  1009			void *p;
  1010	
  1011			p = kvm_gmem_allocator_private(inode);
  1012			folio = kvm_gmem_allocator_ops(inode)->alloc_folio(p);
  1013			if (IS_ERR(folio))
  1014				return folio;
  1015	
  1016			nr_pages = kvm_gmem_allocator_ops(inode)->nr_pages_in_folio(p);
  1017			index_floor = round_down(index, nr_pages);
  1018		} else {
  1019			gfp_t gfp = mapping_gfp_mask(inode->i_mapping);
  1020	
  1021			folio = filemap_alloc_folio(gfp, 0);
  1022			if (!folio)
  1023				return ERR_PTR(-ENOMEM);
  1024	
  1025			ret = mem_cgroup_charge(folio, NULL, gfp);
  1026			if (ret) {
  1027				folio_put(folio);
  1028				return ERR_PTR(ret);
  1029			}
  1030	
  1031			index_floor = index;
  1032		}
  1033		allocated_size = folio_size(folio);
  1034	
  1035		ret = kvm_gmem_filemap_add_folio(inode->i_mapping, folio, index_floor);
  1036		if (ret) {
  1037			folio_put(folio);
  1038	
  1039			/*
  1040			 * There was a race, two threads tried to get a folio indexing
  1041			 * to the same location in the filemap. The losing thread should
  1042			 * free the allocated folio, then lock the folio added to the
  1043			 * filemap by the winning thread.
  1044			 */
  1045			if (ret == -EEXIST)
  1046				goto repeat;
  1047	
  1048			return ERR_PTR(ret);
  1049		}
  1050	
  1051		/* Leave just filemap's refcounts on folio. */
  1052		folio_put(folio);
  1053	
> 1054		ret = kvm_gmem_try_split_folio_in_filemap(inode, folio);
  1055		if (ret)
  1056			goto err;
  1057	
  1058		spin_lock(&inode->i_lock);
  1059		inode->i_blocks += allocated_size / 512;
  1060		spin_unlock(&inode->i_lock);
  1061	
  1062		/*
  1063		 * folio is the one that is allocated, this gets the folio at the
  1064		 * requested index.
  1065		 */
  1066		folio = filemap_lock_folio(inode->i_mapping, index);
  1067	
  1068		return folio;
  1069	
  1070	err:
  1071		filemap_remove_folio(folio);
  1072		return ERR_PTR(ret);
  1073	}
  1074	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

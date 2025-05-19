Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720AC1A83F9;
	Mon, 19 May 2025 18:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747679399; cv=none; b=UqR0aK6PSt6jRCsAQyH0TON3kIvVXDT+k16B1rfad+8pn9iQjtpQ5w2v5nkpDr+4fyITyc57OWdDYQ0ZhIwFUAN+2BivFrtdESSIcb6Y7NQ5aTfqqe/YPapJKm2LHvYcSn6UR4VPGg+aG7R/9mpDbR+vZnhfHkiN1ZTKAtBt1XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747679399; c=relaxed/simple;
	bh=HmQquMQN/UROkULz3PH1GfX4fGfn71RkQOo/em3UOWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q7Bk9EndfjulCf/ABkqh/LipMCcKw4+rHhFMnlEtCLR6qtgTJcyevVSGBfu99Oad05ZIBZTGSzEm+7byDlGC2a6jEs4hnq2iBeauCFm/j8DrSH+W2Y1hOKl8Gmzh5SUxDt+EuzTC7TCA5mYkcSESck9/RXpCINZe1icAibSKUK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JAgmnEPQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JAgmnEPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747679398; x=1779215398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HmQquMQN/UROkULz3PH1GfX4fGfn71RkQOo/em3UOWg=;
  b=JAgmnEPQKWUKOzajIWh6I7fXDAikiRWgLabNemHW5DS9AsKmrmSuQXjk
   b73eFpYRe1jmhvOiF66D8TwRhPHmZuvQK+I5diJFdgM25s4Ai8/wME4RF
   SJogwBEo/VlUJ7/yBtpAcJ1fAxtpsZ/ANeDzKVdoKWRH7mhy1OQiBjjLA
   ifVw8fdDCEqS1azT2VoTr4fyukuz2yR8CBR9D+PrUxFGbOwar8bq5tbei
   1N0dyPTk7T0Jskc5ggu9qsMakd3Tz/g0NAJFGcrDIJ/p8AStQzfE/WBKN
   DbS6cafOvXEVj1PqQo88GNrtJIzEWldtOODB1lJGx5M0LP6rdgYtfZZTV
   A==;
X-CSE-ConnectionGUID: BaWj7RxdQDy8ytUnf4eyEQ==
X-CSE-MsgGUID: o6NzrQZtQtqkPI/WYncNqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60983952"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="60983952"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 11:29:57 -0700
X-CSE-ConnectionGUID: Q21P7mQsS2uGWP4GItsnXw==
X-CSE-MsgGUID: FCcel5PNQRyDjvirwSNWAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="144205046"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 May 2025 11:29:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH5FI-000LlE-2g;
	Mon, 19 May 2025 18:29:52 +0000
Date: Tue, 20 May 2025 02:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:ackerley-1g-master 62/75]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1240:8: error: call to
 undeclared function 'kvm_gmem_has_some_shared'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202505200253.xz9wu1KV-lkp@intel.com>
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
commit: 1c706dec333eedd0ac331ee16563622c757597ea [62/75] KVM: guest_memfd: Merge and truncate on fallocate(PUNCH_HOLE)
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250520/202505200253.xz9wu1KV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505200253.xz9wu1KV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200253.xz9wu1KV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:923:2: error: too few arguments to function call, at least argument 'fmt' must be specified
     923 |         WARN_ONCE("Unexpected call to get shared folio.")
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
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:923:51: error: expected ';' after expression
     923 |         WARN_ONCE("Unexpected call to get shared folio.")
         |                                                          ^
         |                                                          ;
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1089:8: error: call to undeclared function 'kvm_gmem_try_split_folio_in_filemap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1089 |         ret = kvm_gmem_try_split_folio_in_filemap(inode, folio);
         |               ^
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1240:8: error: call to undeclared function 'kvm_gmem_has_some_shared'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1240 |                     !kvm_gmem_has_some_shared(inode, idx, nr_per_huge_page)) {
         |                      ^
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1244:10: error: call to undeclared function 'kvm_gmem_merge_truncate_indices'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1244 |                         ret = kvm_gmem_merge_truncate_indices(inode, idx,
         |                               ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1244:10: note: did you mean 'kvm_gmem_truncate_indices'?
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1180:13: note: 'kvm_gmem_truncate_indices' declared here
    1180 | static long kvm_gmem_truncate_indices(struct address_space *mapping,
         |             ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1653:15: warning: variable 'argp' set but not used [-Wunused-but-set-variable]
    1653 |         void __user *argp;
         |                      ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1683:1: warning: unused label 'out' [-Wunused-label]
    1683 | out:
         | ^~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1713:33: warning: unused variable 'private' [-Wunused-variable]
    1713 |         struct kvm_gmem_inode_private *private = kvm_gmem_private(inode);
         |                                        ^~~~~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1900:20: error: no member named 'shareability' in 'struct kvm_gmem_inode_private'
    1900 |         mt_init(&private->shareability);
         |                  ~~~~~~~  ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1903:36: error: incompatible pointer types passing 'struct kvm_gmem_inode_private *' to parameter of type 'struct maple_tree *' [-Werror,-Wincompatible-pointer-types]
    1903 |         err = kvm_gmem_shareability_setup(private, size, flags);
         |                                           ^~~~~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:916:59: note: passing argument to parameter 'mt' here
     916 | static int kvm_gmem_shareability_setup(struct maple_tree *mt, loff_t size, u64 flags)
         |                                                           ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:2107:6: error: call to undeclared function 'kvm_gmem_supports_shared'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2107 |         if (kvm_gmem_supports_shared(inode) && slot->userspace_addr &&
         |             ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:2107:6: note: did you mean 'kvm_gmem_memslot_supports_shared'?
   include/linux/kvm_host.h:2504:20: note: 'kvm_gmem_memslot_supports_shared' declared here
    2504 | static inline bool kvm_gmem_memslot_supports_shared(const struct kvm_memory_slot *slot)
         |                    ^
   3 warnings and 8 errors generated.


vim +/kvm_gmem_has_some_shared +1240 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

  1209	
  1210	/**
  1211	 * kvm_gmem_truncate_inode_aligned_pages() - Removes entire folios from filemap
  1212	 * in @inode.
  1213	 *
  1214	 * @inode: inode to remove folios from.
  1215	 * @index: start of range to be truncated. Must be hugepage aligned.
  1216	 * @nr_pages: number of PAGE_SIZE pages to be iterated over.
  1217	 *
  1218	 * Removes folios beginning @index for @nr_pages from filemap in @inode, updates
  1219	 * inode metadata.
  1220	 *
  1221	 * Return: 0 on success and negative error otherwise.
  1222	 */
  1223	static long kvm_gmem_truncate_inode_aligned_pages(struct inode *inode,
  1224							  pgoff_t index,
  1225							  size_t nr_pages)
  1226	{
  1227		size_t nr_per_huge_page;
  1228		long num_freed;
  1229		pgoff_t idx;
  1230		void *priv;
  1231		long ret;
  1232	
  1233		priv = kvm_gmem_allocator_private(inode);
  1234		nr_per_huge_page = kvm_gmem_allocator_ops(inode)->nr_pages_in_folio(priv);
  1235	
  1236		ret = 0;
  1237		num_freed = 0;
  1238		for (idx = index; idx < index + nr_pages; idx += nr_per_huge_page) {
  1239			if (mapping_exiting(inode->i_mapping) ||
> 1240			    !kvm_gmem_has_some_shared(inode, idx, nr_per_huge_page)) {
  1241				num_freed += kvm_gmem_truncate_indices(
  1242					inode->i_mapping, idx, nr_per_huge_page);
  1243			} else {
> 1244				ret = kvm_gmem_merge_truncate_indices(inode, idx,
  1245								      nr_per_huge_page);
  1246				if (ret < 0)
  1247					break;
  1248	
  1249				num_freed += ret;
  1250				ret = 0;
  1251			}
  1252		}
  1253	
  1254		spin_lock(&inode->i_lock);
  1255		inode->i_blocks -= (num_freed << PAGE_SHIFT) / 512;
  1256		spin_unlock(&inode->i_lock);
  1257	
  1258		return ret;
  1259	}
  1260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21651F3BAC;
	Wed,  1 Oct 2025 16:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759336586; cv=none; b=KkLeehGSHm7AM9l9eIbCm7wTk5SRPeN5K0bsLPKlWLE0g1WQwGRyugZt0K8Nsir6P19PYtUrRqcPbIGGDsSDE/TL93BarA/QnHjN3JmIOLmCtcQTcgqUCGJzlxtMsBBbC6YUPT6LNgz5fq6TLxozccM6dSHEPj+328p1gocCxhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759336586; c=relaxed/simple;
	bh=wAhZviQ+ykere6AC+0egkslm6hpLxzq3dXJfpIf9gig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t0EVvmyF3XiXgkomxTgls4BvuAjl36SEg5E7BG1p0ju0GgS8rS11AXjk+PWfq4I+Rzaw4QXW+iG0+R4LQiG1TnxGKKjIxnVjTPXPkuHL5CtX5sMBldMWr+1OP3jbFeKeuPKKxiTRA9LXl/T/tHGoZs36LvIatGBCsXlfkX+noG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQFF2j0S; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQFF2j0S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759336584; x=1790872584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wAhZviQ+ykere6AC+0egkslm6hpLxzq3dXJfpIf9gig=;
  b=GQFF2j0SiC6KVmLob0DJLvW9ebyhOFjeXtoRFbVBiceNVXRqgzlS294s
   J+DpJvKn/AoaUR1HkLya7z0m4WJ6z2pQQw/flFF7eefQPEYN7vnc8e21Z
   aJ/6jPmRnczNEhZqtKxPtAf6Yq1eAf5FkWGbTe/UJVMnaNNq+urcHlRSX
   AWZtAPDNvAhccuEmclnHaN9MaIUx/PpeOuUPCATiNB3g8ZUptddi+W20r
   qqv/Ymsd/qU8pZgPkEOJPPRG7mdoiyAOjcai4QKZKP2lgNqeUoz+zXND4
   D9X9UTuvViskJJK5e7pRX1cRCUjd3XOXcQw/L7IMom1K0qYNuo2VGVEvt
   Q==;
X-CSE-ConnectionGUID: ZxiIK+FwTLixZupOMCwqgg==
X-CSE-MsgGUID: 1jZxwrXBSL6IiRi1J8RSkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61506570"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; 
   d="scan'208";a="61506570"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 09:36:23 -0700
X-CSE-ConnectionGUID: TjWigyvSQ3+0PocnQYJJog==
X-CSE-MsgGUID: LO+QQuXxRFm9Xu+Y1EiDYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; 
   d="scan'208";a="183116775"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Oct 2025 09:36:22 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3zoR-0003B7-2B;
	Wed, 01 Oct 2025 16:36:19 +0000
Date: Thu, 2 Oct 2025 00:35:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/gmem_inplace 37/37]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:688:28: error: incompatible
 pointer types passing 'struct gmem_file *' to parameter of type 'struct
 inode *'
Message-ID: <202510020037.7vopinNt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/gmem_inplace
head:   1b94e099a7fd1a1e2d61d908a51937b494816d7c
commit: 1b94e099a7fd1a1e2d61d908a51937b494816d7c [37/37] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES
config: x86_64-buildonly-randconfig-005-20251001 (https://download.01.org/0day-ci/archive/20251002/202510020037.7vopinNt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251002/202510020037.7vopinNt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510020037.7vopinNt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:683:47: error: too many arguments to function call, expected 3, have 4
     683 |                         kvm_gmem_invalidate_begin(inode, f, start, end);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~                  ^~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:265:13: note: 'kvm_gmem_invalidate_begin' declared here
     265 | static void kvm_gmem_invalidate_begin(struct inode *inode, pgoff_t start,
         |             ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     266 |                                       pgoff_t end)
         |                                       ~~~~~~~~~~~
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:688:28: error: incompatible pointer types passing 'struct gmem_file *' to parameter of type 'struct inode *' [-Werror,-Wincompatible-pointer-types]
     688 |                         kvm_gmem_invalidate_end(f, start, end);
         |                                                 ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:289:51: note: passing argument to parameter 'inode' here
     289 | static void kvm_gmem_invalidate_end(struct inode *inode, pgoff_t start,
         |                                                   ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1266:3: error: member reference base type 'void' is not a structure or union
    1266 |                 mt_set_external_lock(&gi->attributes, NULL);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:206:34: note: expanded from macro 'mt_set_external_lock'
     206 |         (mt)->ma_external_lock = &(lock)->dep_map
         |                                   ~~~~~~^ ~~~~~~~
   3 errors generated.


vim +688 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   635	
   636	static int __kvm_gmem_set_attributes(struct inode *inode,
   637					     struct kvm_memory_attributes *attrs,
   638					     pgoff_t *err_index)
   639	{
   640		struct address_space *mapping = inode->i_mapping;
   641		pgoff_t nr_pages = attrs->size >> PAGE_SHIFT;
   642		pgoff_t start = attrs->offset >> PAGE_SHIFT;
   643		struct gmem_inode *gi = GMEM_I(inode);
   644		pgoff_t end = start + nr_pages;
   645		struct ma_state mas;
   646		struct gmem_file *f;
   647		void *entry;
   648		int r;
   649	
   650		filemap_invalidate_lock(mapping);
   651	
   652		mas_init(&mas, &gi->attributes, start);
   653	
   654		*err_index = start;
   655	
   656		/*
   657		 * Note!  Iterating over each entry is guaranteed to process all pages
   658		 * within the gmem instance, as the maple tree is fully initialized and
   659		 * the size of the gmem instance is immutable, i.e. all pages _always_
   660		 * have an entry in the maple tree.
   661		 */
   662		mas_for_each(&mas, entry, end - 1) {
   663			MA_STATE(m2, &gi->attributes, 0, 0);
   664	
   665			if (attrs->attributes == xa_to_value(entry))
   666				continue;
   667	
   668			r = kvm_gmem_mas_preallocate(&m2, attrs->attributes, start, end);
   669			if (r) {
   670				*err_index = m2.index;
   671				goto out;
   672			}
   673	
   674			unmap_mapping_pages(mapping, start, nr_pages, false);
   675	
   676			if (!kvm_gmem_is_safe_for_conversion(inode, start, nr_pages, err_index)) {
   677				mas_destroy(&m2);
   678				r = -EAGAIN;
   679				goto out;
   680			}
   681	
   682			kvm_gmem_for_each_file(f, mapping)
 > 683				kvm_gmem_invalidate_begin(inode, f, start, end);
   684	
   685			mas_store_prealloc(&m2, xa_mk_value(attrs->attributes));
   686	
   687			kvm_gmem_for_each_file(f, mapping)
 > 688				kvm_gmem_invalidate_end(f, start, end);
   689		}
   690		r = 0;
   691	out:
   692		filemap_invalidate_unlock(mapping);
   693		return r;
   694	}
   695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

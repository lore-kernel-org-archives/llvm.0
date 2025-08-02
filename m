Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0700546BF;
	Sat,  2 Aug 2025 16:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754150963; cv=none; b=NFNKHdcNZkaiuLMEp+T/zg/813ckkFHkIrhGPRdPWtIbufHz1jo6yGtnlQVUuRKNOirXbBKw/bv0uzeknNgHvkdnS+W/rSaFSJJotKn6iRPJzL8IZDobh/wTM67J3ay3UcQBjWzafn/s5aM4syRZ+dXxdHQEd5H28iFlU1IE99A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754150963; c=relaxed/simple;
	bh=aRdvdBwO+5l0IzkaUPkXUQ3dPee1ROzL31zDMHvtI+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PKsKphShJ90Hj4qYrXtH5QcbMYFKXhsoyecv3C617MpaCkOeXI2gv5zVe3WzeRHzAdxL+O7OZhSRVsE2YL7ICURjw1ibOaYXyw98jOn6pS9HEo7UUg2NCL3YHNtfawRwqETtMU+XmK5GEJfBMn5BNRjVfdRTGl5fulLTKM57qwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikzgIOaG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikzgIOaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754150961; x=1785686961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aRdvdBwO+5l0IzkaUPkXUQ3dPee1ROzL31zDMHvtI+0=;
  b=ikzgIOaGQyNPRYlvlO0qy4nqVVd5pVwNgb30R5YFozAw2u+pcGN7DMYj
   YzrO8pKeC7Gbup9Ew1lwr75WvCY6YrZar9zJVu/wJZxFrphDoVrv8GNDv
   KDYCqG3bCI2qNOm+altef3PyyTkUdH2amx7J82ti4HnZvSqAW7xQU+unw
   pXzlOuHNrrDW27uVebgB/bXXrLrK7878pc3OG+DGmvhjLcTkwWp5Zb49G
   NBYaSHP0+Trmij7LUNeZ259B0wq2xpSr296ZIQ4f3k5v36vYbMqK6QlBW
   tCaOJV18RxHbaO9CowtYHx8egEfUfuU9SBHN9GFy0LhzqkhQtHowi9Xa1
   A==;
X-CSE-ConnectionGUID: 7Bqvban4RtSA+ocklRuleQ==
X-CSE-MsgGUID: QrbeBZo0RmiZksV17J1enA==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56176920"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56176920"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 09:09:20 -0700
X-CSE-ConnectionGUID: rbov9MPTQ02CJczJnSLs5w==
X-CSE-MsgGUID: sL5NPcWXQyK9CpidL/WVkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="200967101"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Aug 2025 09:09:19 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiEnN-0005Rw-0U;
	Sat, 02 Aug 2025 16:09:17 +0000
Date: Sun, 3 Aug 2025 00:08:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:vmx/tdx_post_populate 2/2]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:672:53: error: too few
 arguments to function call, expected 6, have 5
Message-ID: <202508022300.8y4vzVXi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux vmx/tdx_post_populate
head:   6ae5e841f16df438a7723a1def7656c100700a8e
commit: 6ae5e841f16df438a7723a1def7656c100700a8e [2/2] tmp
config: x86_64-buildonly-randconfig-004-20250802 (https://download.01.org/0day-ci/archive/20250802/202508022300.8y4vzVXi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508022300.8y4vzVXi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508022300.8y4vzVXi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:672:53: error: too few arguments to function call, expected 6, have 5
     672 |         ret = post_populate(kvm, gfn, pfn, src_page, opaque);
         |               ~~~~~~~~~~~~~                                ^
   1 error generated.


vim +672 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   629	
   630	#ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
   631	static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
   632					struct file *file, gfn_t gfn, void __user *src,
   633					kvm_gmem_populate_cb post_populate, void *opaque)
   634	{
   635		pgoff_t index = kvm_gmem_get_index(slot, gfn);
   636		struct page *src_page = NULL;
   637		bool is_prepared = false;
   638		struct folio *folio;
   639		int ret, max_order;
   640		kvm_pfn_t pfn;
   641	
   642		if (src) {
   643			ret = get_user_pages((unsigned long)src, 1, 0, &src_page);
   644			if (ret < 0)
   645				return ret;
   646			if (ret != 1)
   647				return -ENOMEM;
   648		}
   649	
   650		filemap_invalidate_lock(file->f_mapping);
   651	
   652		if (!kvm_range_has_memory_attributes(kvm, gfn, gfn + 1,
   653						     KVM_MEMORY_ATTRIBUTE_PRIVATE,
   654						     KVM_MEMORY_ATTRIBUTE_PRIVATE)) {
   655			ret = -EINVAL;
   656			goto out_unlock;
   657		}
   658	
   659		folio = __kvm_gmem_get_pfn(file, slot, index, &pfn, &is_prepared, &max_order);
   660		if (IS_ERR(folio)) {
   661			ret = PTR_ERR(folio);
   662			goto out_unlock;
   663		}
   664	
   665		folio_unlock(folio);
   666	
   667		if (is_prepared) {
   668			ret = -EEXIST;
   669			goto out_put_folio;
   670		}
   671	
 > 672		ret = post_populate(kvm, gfn, pfn, src_page, opaque);
   673		if (!ret)
   674			kvm_gmem_mark_prepared(folio);
   675	
   676	out_put_folio:
   677		folio_put(folio);
   678	out_unlock:
   679		filemap_invalidate_unlock(file->f_mapping);
   680	
   681		if (src_page)
   682			put_page(src_page);
   683		return ret;
   684	}
   685	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

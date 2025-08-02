Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3016F158535;
	Sat,  2 Aug 2025 04:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754107911; cv=none; b=QjqxZosaOtkuuTF8DFUcRfjxlvQ+2Zl6fbO8jENML9STDSlIPiZ3BgdS0924C2rhxTF9DwE0QEIqpBseAbVx6pKlpxl57af0+ZoNaXvll2Vd1++VQOfyVnIrOcCxkcyUuY0KvLf50MlhsQTtMsbxmUBoOWwHqt9DPecFmaX+gl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754107911; c=relaxed/simple;
	bh=cB3q1ywX9Ag/0m/MSf31ZV74YjB8RNCbCwHE78ewP8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eyn9kmI22qA0iTIox95lCuP4lPVYNSvzaYT50dk/N4HEX3+EMtWp7xilGDEq89NGo1nZvFRzlCK6uvJ9s3IYJil8+QoFgLHpf+9iJlraUhKRnhRUeVoCg4k37Sa18sFg6mvKJmR/yejgB2q4pz2slOI0TFXOf8SkjwiNVV4I9BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jy2RAhQQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jy2RAhQQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754107910; x=1785643910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cB3q1ywX9Ag/0m/MSf31ZV74YjB8RNCbCwHE78ewP8o=;
  b=jy2RAhQQUTsYDIcNHK5YqCFlHIp/tOY4QacsGVd6jrA9Ik/nHy2I4jNY
   dBUIjGhhcExlAKeWY1o7+zJPTYqKofSkEeLUUqup7UQnd98/IlbzymSsR
   cjR1PfjEx0uLSz2BpOKMjSbRQvTvAUz68iKAXg3t7IVzzaUs9pB6cXnfC
   3JclM+1wogRjh92lOvDYrjzGFuT6WgLJej0mEEAbDlCPphmXwIIS+aeuh
   y7LhhFZngQqqF2Ad2a+RwbGS7crW349uKVs9Dgdrkofmrv6q89x73dKX4
   MtkiJxByhyRHD7D87VHHvdRQmsXEtI6EONSULiYSCVCkwhP69g2jYy/Xv
   g==;
X-CSE-ConnectionGUID: Ge+xcXQ1QRCp51bcJi5dOA==
X-CSE-MsgGUID: vAw9qeQYSTynKQF2keJ7Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="81905094"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="81905094"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 21:11:50 -0700
X-CSE-ConnectionGUID: 29K8AqZMRu+nCZxjk8xXXw==
X-CSE-MsgGUID: 8MHGYAviSIO4aME8xT7VPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164180781"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 01 Aug 2025 21:11:49 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui3b0-0001Lv-1K;
	Sat, 02 Aug 2025 04:11:46 +0000
Date: Sat, 2 Aug 2025 06:11:23 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:vmx/tdx_post_populate 2/2]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:672:53: error: too few
 arguments to function call, expected 6, have 5
Message-ID: <202508020606.1JpNEvUC-lkp@intel.com>
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
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250802/202508020606.1JpNEvUC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020606.1JpNEvUC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020606.1JpNEvUC-lkp@intel.com/

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

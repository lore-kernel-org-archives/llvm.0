Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AD62D73A6;
	Thu, 11 Jun 2026 19:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781206390; cv=none; b=MQPV8BZXrxGyPEUhjrwtMyyjAbR5tQmhdmTcoevjG5hJX19tBYZ/vHyE3Ro++O4IB7Sz/dHs+01IYlu8r58pjun82Pfmvw2DnHI848Yk1+eGA486dL6/6hJDey8h5YEBxkfT0NytcdRyHFZzQ2/fKbyNRmXJdP48IVsYRWrktsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781206390; c=relaxed/simple;
	bh=Cqq+0GPv0O+0FgBka9Xq4A6rR9DUIeNAvdbF6EB/Hig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HYE/7sKzmpC1/v7rfPvzbBWXVb9wLJKIP8yLhf5ob6Po5pAYwaHx95yDrNs9KTQHDIb4pYrhUwF04BTiQtRVuyNgHq26Yk7ZXZl7kgTPf6fiWd1a2b0G8yg9J0T8x30xFPTtA8kFm2hqWGAxgnJXEqHkxPvv+9zZ9ZEIdlVZf78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWJpF+gW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWJpF+gW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781206389; x=1812742389;
  h=date:from:to:cc:subject:message-id;
  bh=Cqq+0GPv0O+0FgBka9Xq4A6rR9DUIeNAvdbF6EB/Hig=;
  b=QWJpF+gWcWlXMrU5YECf429z1WktFezfneaPpUgD9B4BUNoUm0+EDek3
   71Zrc3yl/6LPVrkBrWswr1L3lxCEy1adREmjumtLg48ZCNaRMpxEuUzrz
   D95gt7A1Zn2m5Y1y28ZxSdSdPxpyAO1pSe0YmbdWaCrIX4txU1Ln35n6A
   nuD7Jj9Cv+Bc95wnSgXweOgjSX/XbjYaN/QQnqrp9HYFTLA/qCLuEM+1E
   BicVIs2tq4tMlSvlMKNEO6uPF7JZvjcr1ipoCgTFWXFeaHADo0wfHiRLt
   TaV4SRInVyZzwnB1Be+sv6ZY36FSDxGcoqbdaoSD87Fhq55K6vpSi4RTd
   A==;
X-CSE-ConnectionGUID: vlF3GA19SPqMxqrxwt4ePw==
X-CSE-MsgGUID: Qfur0AE3Sby8UQ6HeqD/7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81939514"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="81939514"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:32:57 -0700
X-CSE-ConnectionGUID: bGSpF6ZcQCq5NEbRBSD8QA==
X-CSE-MsgGUID: qgtQI2+9ToqhK3D4Zrtnyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="248474511"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jun 2026 12:32:55 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXl93-00000000459-1Ij6;
	Thu, 11 Jun 2026 19:32:53 +0000
Date: Thu, 11 Jun 2026 21:32:16 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Ackerley Tng <ackerleytng@google.com>
Subject: [sean-jc:x86/gmem_inplace 35/59]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1204:10: error: call to
 undeclared function 'kvm_range_has_vm_memory_attributes'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202606112109.SWdbql08-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/gmem_inplace
head:   4a99b51978dc7e7b3e5f61c14790e9f49c33fdbb
commit: 3b494d9b05174562830962ea9e49aff75fde974f [35/59] KVM: Let userspace disable per-VM mem attributes, enable per-gmem attributes
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260611/202606112109.SWdbql08-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112109.SWdbql08-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606112109.SWdbql08-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1204:10: error: call to undeclared function 'kvm_range_has_vm_memory_attributes'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1204 |                 return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
         |                        ^
   1 error generated.


vim +/kvm_range_has_vm_memory_attributes +1204 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

1f6c06b177513e8 Paolo Bonzini       2024-02-14  1196  
36cf63bb5df6883 Fuad Tabba          2025-07-29  1197  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE
3338335299abe86 Sean Christopherson 2026-06-10  1198  static bool kvm_gmem_range_is_private(struct file *file, pgoff_t index,
3338335299abe86 Sean Christopherson 2026-06-10  1199  				      size_t nr_pages, struct kvm *kvm, gfn_t gfn)
3338335299abe86 Sean Christopherson 2026-06-10  1200  {
3338335299abe86 Sean Christopherson 2026-06-10  1201  	struct maple_tree *mt = &GMEM_I(file_inode(file))->attributes;
3338335299abe86 Sean Christopherson 2026-06-10  1202  
3338335299abe86 Sean Christopherson 2026-06-10  1203  	if (!gmem_in_place_conversion)
3338335299abe86 Sean Christopherson 2026-06-10 @1204  		return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
3338335299abe86 Sean Christopherson 2026-06-10  1205  							  KVM_MEMORY_ATTRIBUTE_PRIVATE,
3338335299abe86 Sean Christopherson 2026-06-10  1206  							  KVM_MEMORY_ATTRIBUTE_PRIVATE);
3338335299abe86 Sean Christopherson 2026-06-10  1207  
e4f7252dca71e1a Ackerley Tng        2026-04-23  1208  	return kvm_gmem_range_has_attributes(mt, index, nr_pages,
e4f7252dca71e1a Ackerley Tng        2026-04-23  1209  					     KVM_MEMORY_ATTRIBUTE_PRIVATE);
3338335299abe86 Sean Christopherson 2026-06-10  1210  }
2a62345b30529e4 Michael Roth        2026-01-08  1211  

:::::: The code at line 1204 was first introduced by commit
:::::: 3338335299abe867f2a5d5b207df57edba03b5f1 KVM: guest_memfd: Wire up kvm_get_memory_attributes() to per-gmem attributes

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

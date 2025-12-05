Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6668431B11E;
	Fri,  5 Dec 2025 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928550; cv=none; b=O4fl742nDNGr6VQZJ6TjgBqbv+Mhpr0IvhtJtxBLr/2CrQTseihUWZ3nqMrlFMvSaAOuBnUYBqaaqJzftAAXPZQezRUNn2P05f8hLUn5zuxahhn+gjl+xHGmglkrwYV0ouYnLSoq4QmE1g40DBrKm06zog87q9XbZj3ByCnMoWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928550; c=relaxed/simple;
	bh=eQcvofA5/i6F3yeN81r21V15GmbWxJ3Ch+IAs5hJX/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fU+jd/3FQgKp2hxgmsSrq6xSIT3H8p3IvvijOwYUAGAx3ej3wdsay6/vEKXPdbJDilyrZmfC1du0J61p1dpM1YTeDiIncp63kdkbV1TRZ1GSlQTGeLnYtW3p29dIo2PRZUMurvyjj/XUrgTRP70VQ9R0MiHeEQfKg/a1urkM8JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZChswqrB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZChswqrB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764928546; x=1796464546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eQcvofA5/i6F3yeN81r21V15GmbWxJ3Ch+IAs5hJX/c=;
  b=ZChswqrBY60OD2mD0+vm6Lub2u6UKVqnLzfR5VGbSl5mpEqB43fAXTuN
   bXaS4xFjnGfhBSN92V5CFD1AzSxxaQgM+EeSv7cT+lciNq3fyySIqysA9
   wkZnhHrQIU8K5XYiFl26oJOWPAUCQvEoBLypBGUw0cUOiAzqk3WouEscq
   dTAfjTL8j3YjVSNFmQB+wrmayc0u3a3BhVREIn2u1cILUVt4aEyex9laH
   VMKim4ld3FiruW8pXofyApUc2o1e/c/4vTYRF/y8csdDBEnwF3Ya+RWLK
   pdsuIlu9q6uzNe0XKdjMdZUQU5cscqJ/nbjve3jiD0m3p20agGEdAfSru
   g==;
X-CSE-ConnectionGUID: d4q6olR2T56Zf2Cw9BtKqw==
X-CSE-MsgGUID: MtrfQ6sjQTC4j9czpyPvcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70811103"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="70811103"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 01:55:40 -0800
X-CSE-ConnectionGUID: pusVzaMERzeoiK+G+tUCgQ==
X-CSE-MsgGUID: ZIkYCspeRxubYpnKrr9OWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="194907167"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Dec 2025 01:55:38 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRSXI-00000000Eqr-1zy7;
	Fri, 05 Dec 2025 09:55:36 +0000
Date: Fri, 5 Dec 2025 17:55:10 +0800
From: kernel test robot <lkp@intel.com>
To: Takahiro Itazuri <itazur@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] KVM: pfncache: Use vmap() for guest_memfd pages
 without direct map
Message-ID: <202512051702.JVgyDZnV-lkp@intel.com>
References: <20251203144159.6131-3-itazur@amazon.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203144159.6131-3-itazur@amazon.com>

Hi Takahiro,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on kvm/next mst-vhost/linux-next linus/master v6.18 next-20251205]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takahiro-Itazuri/KVM-pfncache-Use-kvm_gmem_get_pfn-for-guest_memfd-backed-memslots/20251203-224344
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20251203144159.6131-3-itazur%40amazon.com
patch subject: [RFC PATCH 2/2] KVM: pfncache: Use vmap() for guest_memfd pages without direct map
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251205/202512051702.JVgyDZnV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051702.JVgyDZnV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051702.JVgyDZnV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/events/intel/core.c:17:
>> include/linux/kvm_host.h:634:9: error: call to undeclared function 'mapping_no_direct_map'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     634 |                mapping_no_direct_map(slot->gmem.file->f_mapping);
         |                ^
   1 error generated.


vim +/mapping_no_direct_map +634 include/linux/kvm_host.h

   630	
   631	static inline bool kvm_slot_no_direct_map(const struct kvm_memory_slot *slot)
   632	{
   633		return slot && kvm_slot_has_gmem(slot) &&
 > 634		       mapping_no_direct_map(slot->gmem.file->f_mapping);
   635	}
   636	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

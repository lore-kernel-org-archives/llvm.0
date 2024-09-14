Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A10B143723;
	Sat, 14 Sep 2024 10:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726308479; cv=none; b=NI0Tef4KpGcWw8uTq/cxcuhvs+p4Xs8OT8qj4RpGTk5IZLpTvT9NAWRHvX+lIGzX6lYK7Om1okr+rouxA2Kc8Y/5z2L04nV5XL7fUfR9wXVKr8PqqKGSn5M2Tzab01OovwXiNoRDcXxhHj/AUeAD7eFuvOKVVKbHq07cKOTGGOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726308479; c=relaxed/simple;
	bh=D2K5mzwFbYYJ5gmg5Ev9xqQ6HGEqbVJKpdxN+0yysk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qs9diYFv8B+cd2KthNXiftO3TxqXNqCeQZy5j+Oyb8FC6XGQazBfqUF6oSHi/jYMsYl7EMippOCgceSQ8LRSFkvJ61jgb0imzspdBAgz8HIfo/D5uZt6tre1y7svPPN50Wi+p/3C7XKyF3B7BO6L5dhbOyLfzsb05VEHpcB5i6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcVpZw0d; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcVpZw0d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726308478; x=1757844478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D2K5mzwFbYYJ5gmg5Ev9xqQ6HGEqbVJKpdxN+0yysk0=;
  b=UcVpZw0dpxIlAKbLbXyZQfpaW/tcZhc4XsFFHNGlPw6ZhVHBxrhZTeU2
   hZmkeAecA/Y5uLCcHZoI7cuKGayFzBdRjxkcjQ69+qPCEUSaFiJtopxq4
   blKanlEY7O/AH1qWszGQAxaefSzy+9T+K64gULefrPR/QA9akCOjgpz+s
   fLB/mU+fj33CRw9UiWqVsAD55/jjAC3BPiiixdohlljE7PDjaOuhucJit
   TVmKrLcREIIFchCm9UjOLYyR40OgJKEGZ5pCoMJyJcwLwiyKeic7CWxXW
   lm+CkFFVUjKyNFVDE6dREI44UXNcJLdqsurqMsgNzCWAzgpE2Jy4DXRi9
   g==;
X-CSE-ConnectionGUID: ekq/yah2QAiH+qL+k8mD0A==
X-CSE-MsgGUID: 2eGqo/mqTz+eLr302oV/Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25364953"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="25364953"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 03:07:55 -0700
X-CSE-ConnectionGUID: uhGAQ8JTTFWo0m7rl6jQmg==
X-CSE-MsgGUID: AliTTPSoRU+FxEzRvVcQVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="99219229"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Sep 2024 03:07:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spPh2-0007cU-08;
	Sat, 14 Sep 2024 10:07:52 +0000
Date: Sat, 14 Sep 2024 18:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 39/39] KVM: guest_memfd: Dynamically
 split/reconstruct HugeTLB page
Message-ID: <202409141709.Edd1Sxg8-lkp@intel.com>
References: <38723c5d5e9b530e52f28b9f9f4a6d862ed69bcd.1726009989.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38723c5d5e9b530e52f28b9f9f4a6d862ed69bcd.1726009989.git.ackerleytng@google.com>

Hi Ackerley,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on linus/master v6.11-rc7]
[cannot apply to akpm-mm/mm-everything kvm/linux-next next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ackerley-Tng/mm-hugetlb-Simplify-logic-in-dequeue_hugetlb_folio_vma/20240911-074716
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/38723c5d5e9b530e52f28b9f9f4a6d862ed69bcd.1726009989.git.ackerleytng%40google.com
patch subject: [RFC PATCH 39/39] KVM: guest_memfd: Dynamically split/reconstruct HugeTLB page
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240914/202409141709.Edd1Sxg8-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141709.Edd1Sxg8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141709.Edd1Sxg8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "default_hstate_idx" [arch/x86/kvm/kvm.ko] undefined!
ERROR: modpost: "hstates" [arch/x86/kvm/kvm.ko] undefined!
ERROR: modpost: "hugepage_new_subpool" [arch/x86/kvm/kvm.ko] undefined!
ERROR: modpost: "folio_zero_user" [arch/x86/kvm/kvm.ko] undefined!
ERROR: modpost: "hugetlb_fault_mutex_hash" [arch/x86/kvm/kvm.ko] undefined!
ERROR: modpost: "hugetlb_fault_mutex_table" [arch/x86/kvm/kvm.ko] undefined!
ERROR: modpost: "get_mem_cgroup_from_current" [arch/x86/kvm/kvm.ko] undefined!
ERROR: modpost: "mem_cgroup_hugetlb_try_charge" [arch/x86/kvm/kvm.ko] undefined!
ERROR: modpost: "hugepage_subpool_get_pages" [arch/x86/kvm/kvm.ko] undefined!
>> ERROR: modpost: "mem_cgroup_cancel_charge" [arch/x86/kvm/kvm.ko] undefined!
WARNING: modpost: suppressed 18 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

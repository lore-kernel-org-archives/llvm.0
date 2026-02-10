Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5850D372B21;
	Tue, 10 Feb 2026 17:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770745919; cv=none; b=NjGQtKqFJ/k+sJWJQrZvWYZ3d3e7Rjgf7rnT4iCrAqDF9j6UjaSZLOdkwNgSI3ovwX+9Mm9hoXpsxLe7hXRYTzZ8z+/0bdYtKo/61OeEsql+sUxWeAy+9Kji4CSINWzKxzs6ZNmzAPAtfKc5CP28UYzOJeDNH0nZ6ZKUfxF9yUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770745919; c=relaxed/simple;
	bh=qA06aqPLShHsei2q4s7sufdt3dRHU5s7RVveGATdUlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLtU/VC5/arROnKEVEqMIV/Np1i+/k0xXgpZ8mY6yjUsriOWeKtU/QNUoC7fodrMm87kzcwM17DzpKyhAOyD8D+IzOAXbZQbzjctg8Q+S2eDuj0TxcRQH4mMiSkhIdi3U/lFgVHR2EeGeZBmsMOHd7HQOemP84TTy08JhnbTEoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5tDKn5p; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5tDKn5p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770745918; x=1802281918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qA06aqPLShHsei2q4s7sufdt3dRHU5s7RVveGATdUlY=;
  b=U5tDKn5pe9Huq749TSHvIeaTGvQ598+9GEQSY/KmxYObscu3XMkWAR7W
   3qsGW4isHRYpKwelVIlx2NfAJNNeTSLxwEAugNYAMr8zQcNYdeofknwiq
   PNaabKiIxO6Q+IMHUuggZnu74cjRtKxK39ANkLIyhQA0jnZ7tG5/gE0Rn
   ULhjA2inFWanVXEwvw5+p8BjM9AgW9Ei4IzIBEZ7esFDohRSnhZ8m+I45
   o1EzRA8jwbVF0UK9nTiFAcN3iAp0QKRmWbyX8MDLX5gvUIm3ZwMUvXBqG
   2AT7vrysyv5Dps7eeSyIPQ15nVtjzZ9UcRP1+qptmXL6emuaHt9wHP6Kw
   w==;
X-CSE-ConnectionGUID: w6nSWZ5ZSgyh3x2mCJQk2g==
X-CSE-MsgGUID: ullgCn8AQSirwmkkp1IuQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="89473475"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89473475"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 09:51:55 -0800
X-CSE-ConnectionGUID: 5euT5pk4QyyxthZ+F314CA==
X-CSE-MsgGUID: DBvC165RT2emIBVDWIIp4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216495371"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Feb 2026 09:51:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vprtt-00000000pH0-0MlI;
	Tue, 10 Feb 2026 17:51:49 +0000
Date: Wed, 11 Feb 2026 01:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: Deepanshu Kartikey <kartikey406@gmail.com>, akpm@linux-foundation.org,
	david@kernel.org, lorenzo.stoakes@oracle.com,
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, ackerleytng@google.com, seanjc@google.com,
	pbonzini@redhat.com, michael.roth@amd.com, vannapurve@google.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, ziy@nvidia.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+33a04338019ac7e43a44@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm: thp: Deny THP for guest_memfd and secretmem in
 file_thp_enabled()
Message-ID: <202602110124.Y72YFz1K-lkp@intel.com>
References: <20260209033558.22943-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209033558.22943-1-kartikey406@gmail.com>

Hi Deepanshu,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepanshu-Kartikey/mm-thp-Deny-THP-for-guest_memfd-and-secretmem-in-file_thp_enabled/20260209-113800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260209033558.22943-1-kartikey406%40gmail.com
patch subject: [PATCH] mm: thp: Deny THP for guest_memfd and secretmem in file_thp_enabled()
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260211/202602110124.Y72YFz1K-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110124.Y72YFz1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110124.Y72YFz1K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/huge_memory.c:96:30: error: use of undeclared identifier 'GUEST_MEMFD_MAGIC'
      96 |         if (inode->i_sb->s_magic == GUEST_MEMFD_MAGIC ||
         |                                     ^
>> mm/huge_memory.c:97:30: error: use of undeclared identifier 'SECRETMEM_MAGIC'
      97 |             inode->i_sb->s_magic == SECRETMEM_MAGIC)
         |                                     ^
   2 errors generated.


vim +/GUEST_MEMFD_MAGIC +96 mm/huge_memory.c

    84	
    85	static inline bool file_thp_enabled(struct vm_area_struct *vma)
    86	{
    87		struct inode *inode;
    88	
    89		if (!IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS))
    90			return false;
    91	
    92		if (!vma->vm_file)
    93			return false;
    94	
    95		inode = file_inode(vma->vm_file);
  > 96		if (inode->i_sb->s_magic == GUEST_MEMFD_MAGIC ||
  > 97		    inode->i_sb->s_magic == SECRETMEM_MAGIC)
    98			return false;
    99	
   100		return !inode_is_open_for_write(inode) && S_ISREG(inode->i_mode);
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

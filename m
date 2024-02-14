Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B29D290C;
	Wed, 14 Feb 2024 01:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707872616; cv=none; b=TOiViNf6bxNixt42PLQ0TnhR+4IM77m7awLqc8fY5fuZpj7+n+KGHH78VCdwRU91qO/0O67AbxXCmClUzAUvjbKi+tX5aqm3+B9jXu6CVhEGEgzXIKkLzG9K2Ohoh10BDNuhfCyawX76iL9/96j1rIMEGOaGuMlHP7LATqxyXPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707872616; c=relaxed/simple;
	bh=RvI8sU/ZZv6Ip2AVny6l0ijrE/CKCdDNgDTwC3I6mSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELWhI7jtJM0/Vj0pBTGJ3O/6Kh2nckkMgYwsjNL7869/Wc16qT0FkyM1lHVx6Dd4stySyeFxaqsGoo4Mjx5OFAvP7ahWw9D1g1LKfKEX16l0coMVnC2BeFjuE4GkBaLLLHqXmfezQ9ez15KG2h/i8m+EOATU1DjPCDzMCbnfuT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brdfMlqd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brdfMlqd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707872615; x=1739408615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RvI8sU/ZZv6Ip2AVny6l0ijrE/CKCdDNgDTwC3I6mSs=;
  b=brdfMlqdGcXW1VsOriTVMNVUj41pr6yrll0kYHKH5hjnQWEhJLU0Swts
   cIOGnyqnt3gEEevQ7OxoV7sDR4chrT2RDJ9sBf4kJK17HRk5HJ9q9M9Cx
   HvYeGr08R1BtWK98Xhdf+ONA0GGkBoJh8Oi6OY6U4N1o8zbYAf3Ktnx2O
   9ndesT3dhD9k9sJgn+DdPfFs4mxzcO323v5mU2m8y+bGLO3bZHiod4/Dr
   DShowQ3uBO/AImOR8NYmeRnc4im6RK3NxTCccYKH1wBTs8bJUMrMxCVEB
   jmlO6Em9ak0TNB3DFa5Pd/Kx/BXCd4r7eYY9rAK9w8EO8xN9I4ulJ2J24
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12998065"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="12998065"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 17:03:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="34105654"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Feb 2024 17:03:26 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ra3gJ-0008C8-2U;
	Wed, 14 Feb 2024 01:03:23 +0000
Date: Wed, 14 Feb 2024 09:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de,
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com,
	corbet@lwn.net, void@manifault.com, peterz@infradead.org,
	juri.lelli@redhat.com, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com,
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com,
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, dennis@kernel.org,
	tj@kernel.org, muchun.song@linux.dev
Subject: Re: [PATCH v3 22/35] mm/slab: enable slab allocation tagging for
 kmalloc and friends
Message-ID: <202402140813.MLA22JVg-lkp@intel.com>
References: <20240212213922.783301-23-surenb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212213922.783301-23-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on linus/master v6.8-rc4]
[cannot apply to akpm-mm/mm-everything vbabka-slab/for-next next-20240213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/lib-string_helpers-Add-flags-param-to-string_get_size/20240213-054335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20240212213922.783301-23-surenb%40google.com
patch subject: [PATCH v3 22/35] mm/slab: enable slab allocation tagging for kmalloc and friends
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240214/202402140813.MLA22JVg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402140813.MLA22JVg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402140813.MLA22JVg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `krealloc` in crate `bindings`
   --> rust/kernel/allocator.rs:39:24
   |
   39 |     unsafe { bindings::krealloc(ptr as *const core::ffi::c_void, size, flags) as *mut u8 }
   |                        ^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

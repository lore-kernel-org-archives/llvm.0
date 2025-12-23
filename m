Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442D74C92;
	Tue, 23 Dec 2025 07:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766475968; cv=none; b=qsfb1YgsWazCwH6alkpDgLsI6vmwLwD3UhNgpPn0U7yS301giGyU6SlWySIm261L5IScTqb8ej7PeFtrw6Kgy0nc2gWN6iOi6WcgyNlHtphkgwgRi/kx5b6duCUiJ5yvfeRkLOIN5BRgylxZML3PD2mChZ1IrNBzSbkcHflKiBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766475968; c=relaxed/simple;
	bh=EK+X9cvpnZumkE5VdXNrNDnpOJbV5oAh7rMbhuXvouI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BAfRToo929JNfl/uo4a1tnvE9oeZ8c5iciMLeauVTOXCstGjTYmy7B26VltUfNv91f80GowlxmIEpRIf35K7If9qWnhjzSOD1kWG5j27WPpi0eu2tFJAnyRPKazbeeIIGExOcgn7I6K1O0MK1zj4/JY8BLM/3OlS4eVz+BkHFRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQzP1asP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQzP1asP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766475966; x=1798011966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EK+X9cvpnZumkE5VdXNrNDnpOJbV5oAh7rMbhuXvouI=;
  b=XQzP1asP/HHPAYnYDd7F1d4Yk4mK5dd/nxwXxmukJqCwPo1wGBknKLEN
   +cuOfSNuQbZmUlI8o+ZpkirKHtlSZLXCKIhpdZXrfn2jRnsMoZoUgv55B
   c7oOZhs75CKDGUOjzxc5XK2qOc/usL0I95k/qoo30rQyUD/l1+D+a4nXo
   L2YBK+kCpTl944WMl/wdPhNBfnhpY/umQohAnb/ovgm9V5XC5DKE2yCvv
   Kbo1odhN3FCD4d45o5J2MD0cHgPLWxsyLJMa4yt+osqVCPS8a2eG03cLL
   hNaxhMT+B5ukYcBa3LZUp4pIMYsM+dAzmjQZP3VwY2Ks+zhcxikRvylBF
   w==;
X-CSE-ConnectionGUID: U30GCXetRTaW3qb9+tfZFQ==
X-CSE-MsgGUID: Pg5y+Ii4S/+XEO5HAS2Q6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79778011"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="79778011"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 23:46:06 -0800
X-CSE-ConnectionGUID: VTvSP80xSwKu0XJHqk3anQ==
X-CSE-MsgGUID: SkpwsRCgR0K4Y9psLbd0UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="198860893"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Dec 2025 23:46:05 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXx5m-000000001bh-1NUq;
	Tue, 23 Dec 2025 07:46:02 +0000
Date: Tue, 23 Dec 2025 15:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v5 3/6] rust: gpu: Add GPU buddy allocator bindings
Message-ID: <202512232015.WVmaP40F-lkp@intel.com>
References: <20251219203805.1246586-4-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219203805.1246586-4-joelagnelf@nvidia.com>

Hi Joel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joel-Fernandes/rust-clist-Add-support-to-interface-with-C-linked-lists/20251220-044108
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251219203805.1246586-4-joelagnelf%40nvidia.com
patch subject: [PATCH RFC v5 3/6] rust: gpu: Add GPU buddy allocator bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251223/202512232015.WVmaP40F-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512232015.WVmaP40F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512232015.WVmaP40F-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `gpu_buddy_block_offset` in crate `bindings`
   --> rust/kernel/gpu/buddy.rs:474:28
   |
   474   |         unsafe { bindings::gpu_buddy_block_offset(self.as_raw()) }
   |                            ^^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `gpu_buddy_block_print`
   |
   ::: rust/bindings/bindings_generated.rs:61566:5
   |
   61566 |     pub fn gpu_buddy_block_print(mm: *mut gpu_buddy, block: *mut gpu_buddy_block);
   |     ------------------------------------------------------------------------------ similarly named function `gpu_buddy_block_print` defined here
--
>> error[E0425]: cannot find function `gpu_buddy_block_order` in crate `bindings`
   --> rust/kernel/gpu/buddy.rs:480:28
   |
   480   |         unsafe { bindings::gpu_buddy_block_order(self.as_raw()) }
   |                            ^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `gpu_buddy_block_print`
   |
   ::: rust/bindings/bindings_generated.rs:61566:5
   |
   61566 |     pub fn gpu_buddy_block_print(mm: *mut gpu_buddy, block: *mut gpu_buddy_block);
   |     ------------------------------------------------------------------------------ similarly named function `gpu_buddy_block_print` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

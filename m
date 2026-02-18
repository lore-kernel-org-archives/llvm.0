Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9EA72631;
	Wed, 18 Feb 2026 22:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771454134; cv=none; b=TKRb4xzMdkZrffcWajBtWMe2CE60beihBVSSeYOrgTS2Wgr6PE4z/r+LsbwO3xKBy5VtfLk66hpCTc6+DI/9ijEdvA2IE9oak7M4i8W5A6q+Hp64MwAkc/N+C4Nz6Rjc4iRzw/f/42psHhI1tP6H1TvNVrcUVpv03WxvBxwwlk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771454134; c=relaxed/simple;
	bh=O/rX9K2lLbdMCVbMoTjWa3keet+zD0coVHI15wTiLF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rURW5z8sgW2wRsMRPdWIV9xkTnx30f/CZySsgkRMSKcu+QZfnmrDOAMNJFXBCaQqXWem6ZuDmwI6GGJZotxERhcit2Y/znSDl6XeB7vA0316wxHOR28x8baok/JCInPOF6KT3KJbzFG5/mkugPUJv3xRAvPXKDq0fWVb9AZm6l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mKaN0F9w; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mKaN0F9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771454131; x=1802990131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O/rX9K2lLbdMCVbMoTjWa3keet+zD0coVHI15wTiLF8=;
  b=mKaN0F9wTFUKrqk0iQtqk/WcJU6o6m7WRI+uwskpw5U5QCHzxYb2uWSH
   UJUIc1cKw9+m/2czKXyjxua1uKKnbmAusHPM8JPeEqKB+8qUKhedFoYNK
   kEpRn7ic2GRXLvUgGnFoDbaYXO6xHCiEquqFW+Ip1qpMKL84Q1vdjLz55
   pL56zCVdxVik1esGhGz3k8SIFJdS9GAyx3DwpSbzaX7V3F7TZgCkJiHky
   +qVPN4PDgDsphs/QqUlx7KQ/Bw79v+5iyPYNaMirA7QxNnJGpzlM7ApGW
   QHRyENCnBQAt17Qs7aKleGnisVikTZ7UgjXy9/4GRZYjf7eqnt2ZMESIp
   Q==;
X-CSE-ConnectionGUID: QIavHjEIT7Gm+tk0jPZZyg==
X-CSE-MsgGUID: hkLBUE4bQlG1WEItdOoM0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83257397"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="83257397"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 14:35:31 -0800
X-CSE-ConnectionGUID: soRkJHYkRb2cXuqof3SBEw==
X-CSE-MsgGUID: dVMtaFQzSEOQdM3Y8Oiunw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="244924470"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 18 Feb 2026 14:35:28 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsq8k-000000003lx-0xM6;
	Wed, 18 Feb 2026 22:35:26 +0000
Date: Wed, 18 Feb 2026 23:34:29 +0100
From: kernel test robot <lkp@intel.com>
To: redacherkaoui <redacherkaoui67@gmail.com>, x86@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/boot/compressed: Fix signedness of rdfs8()
Message-ID: <202602182354.HCHrfAu7-lkp@intel.com>
References: <20260218150008.28179-1-redacherkaoui67@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218150008.28179-1-redacherkaoui67@gmail.com>

Hi redacherkaoui,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/master tip/auto-latest linus/master v6.19 next-20260218]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/redacherkaoui/x86-boot-compressed-Fix-signedness-of-rdfs8/20260218-230616
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20260218150008.28179-1-redacherkaoui67%40gmail.com
patch subject: [PATCH] x86/boot/compressed: Fix signedness of rdfs8()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260218/202602182354.HCHrfAu7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602182354.HCHrfAu7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602182354.HCHrfAu7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined hidden symbol: get_cmd_line_ptr
   >>> referenced by ident_map_64.c
   >>>               arch/x86/boot/compressed/ident_map_64.o:(initialize_identity_maps)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E456E22D795;
	Fri, 28 Nov 2025 06:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764312784; cv=none; b=E3pZt2N5WJ0y15ScMQKwUyijyUolZT2CntfYMH5oJZjElCJexMeKzaf9xgo93fw9Xb80lBzVzpDW3BOT1mxGC1BKcBdjBKBFCHgg5v5iitAJkpXDkxcpvbklOoYII47eT0cIZChGqBLTniqAopz20XJzJeR/Al20S/NtWsrvDKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764312784; c=relaxed/simple;
	bh=G7EQ5Xbh9ouNtbTkz+/UKLvzH4/5yFaMifyXrBKs790=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c29JbqcIaBgDkfEgAv1O4/N+xmtROFv4JHs1PqjSJXwvI99tDqgL0XVDUti47lyZmrrTRVHfnszO0dJzn4JuI0amq1QKAtzXmvphQkdL/isT/89zla6ERo9/DDTyG3k0CgRHzzBY2Lgb3lHJBq515ur7SoiLbbJoUJ5inpH7H6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3DlttWB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3DlttWB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764312782; x=1795848782;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G7EQ5Xbh9ouNtbTkz+/UKLvzH4/5yFaMifyXrBKs790=;
  b=M3DlttWBhcxzBqTL6tZrKFe+wEapeeENwhtweLWNokB5Ncp+96WGHqOL
   jdeD8EWUVLaxlfMedCMceHT1NBDSDnVJq9CcvGKDj4XzQvRHmBXovbxfH
   TgCny0UiXJGlnNQmbV22dWpFgQYrwKeDQaKiHEI/Wd8PMuH5PBqvT/2zj
   eeA2RMlvtHYKQlQfQGqgVKkcTEXhzxnPy8GtZs4mCvT9jkAJWr3muWH58
   j1lHsBvfEOcRLFkQRKnmDRq9LqL0vJq1pxRNv2TA1y59nw1i1F+iolQdp
   8DUylbjfDONTSfKTFArOxVksMgYc0qAy0E0WEWwtXVWm4E7Z8Vjvp2aUK
   w==;
X-CSE-ConnectionGUID: 9TDaJV2zRBKsokmBkG0A7g==
X-CSE-MsgGUID: 0XuPxwibQlGQ34n1du0eqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66060801"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66060801"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:53:01 -0800
X-CSE-ConnectionGUID: zPT8RkxQQ3KX8TftpDgckg==
X-CSE-MsgGUID: Gvmlsdd/RbOr909gABXKrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198506456"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Nov 2025 22:53:00 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOsLh-0000000067J-45CE;
	Fri, 28 Nov 2025 06:52:57 +0000
Date: Fri, 28 Nov 2025 14:52:09 +0800
From: kernel test robot <lkp@intel.com>
To: Yushan Wang <wangyushan12@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
Message-ID: <202511281454.4H2aIAJS-lkp@intel.com>
References: <20251125080542.3721829-2-wangyushan12@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125080542.3721829-2-wangyushan12@huawei.com>

Hi Yushan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.18-rc7]
[cannot apply to next-20251127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yushan-Wang/soc-cache-L3-cache-driver-for-HiSilicon-SoC/20251125-160816
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20251125080542.3721829-2-wangyushan12%40huawei.com
patch subject: [RFC PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
config: um-randconfig-001-20251128 (https://download.01.org/0day-ci/archive/20251128/202511281454.4H2aIAJS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511281454.4H2aIAJS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511281454.4H2aIAJS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/misc/hisi_l3c.h:22:2: error: unknown type name 'size_t'
      22 |         size_t lock_size;
         |         ^
>> ./usr/include/misc/hisi_l3c.h:23:2: error: unknown type name 'bool'
      23 |         bool address_alignment;
         |         ^
   ./usr/include/misc/hisi_l3c.h:24:2: error: unknown type name 'size_t'
      24 |         size_t max_lock_size;
         |         ^
   ./usr/include/misc/hisi_l3c.h:25:2: error: unknown type name 'size_t'
      25 |         size_t min_lock_size;
         |         ^
   4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

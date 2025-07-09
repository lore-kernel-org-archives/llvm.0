Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56C91D54F7;
	Wed,  9 Jul 2025 15:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752075286; cv=none; b=o5L/aAsNtxCP5AxXUw1zMcO5xQv9cSQYsB8ClpGU5TFAcTzvSq+lmHMmuyXNViy2nlcLpNpZ4oBC5rLvC++roXAn70AqHcDKdPY2ZFYz/b+wbrAvTXOYSKOiGw/JV+k7FHBMoxvF6oeZczgiLASYYVit4OP+vdKsZWps4nbbbf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752075286; c=relaxed/simple;
	bh=+lQkuVDmVjwJb2kOydCd89LXVHW1SiX9OVD8hVyugOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9NHXbBNIXudHdCUm7/njt2261uzmlLYszlsRnjpJeq8D5J64WQXSBSeMQWdTRg1SR1oaajsoRnhyxlybq1oAS9CQIxCRb9OANFaXJi6woSRYVZgq+afjyycucyq7+zxWa23k3RjA43FICT5xEAUTlAy2MBkb/5uXL7KnqTnHEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VKJYMUnN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKJYMUnN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752075285; x=1783611285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+lQkuVDmVjwJb2kOydCd89LXVHW1SiX9OVD8hVyugOg=;
  b=VKJYMUnNrQgmlhzYI1j+l13wn7CjUkHbInfiO9B3IcylNdd/16LvGc2I
   o+JHgokzxTelVCFYKX8iegEKVNhbGiMojM81XlsGpjKoSRbUWVE31sgPa
   nBsRUbzXzdKSVWC9yyNnsAy5sNzrM8FwLnJCvxbaXkk5uluxo/yUam2pW
   ecTiT/Nwq9RNcaiBxrESF+r/RLN7sVymj2/1fnFUVeIyv76ckmNynATTS
   93WPDabPuBBrFIAY9rwiPrkpdsyfyR3o3djXSf9asgEg+LOyMhcbs7Kio
   nX4wsIpl09Vl+wm5+OHhXwNkGW4puHI2pivcvWbC95YgX2rZ4pXVBGRRN
   g==;
X-CSE-ConnectionGUID: O26oiMeiSdGrxtiQFHypQQ==
X-CSE-MsgGUID: poi69Xe/REaKxMPJbGpatw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54312161"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54312161"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 08:34:45 -0700
X-CSE-ConnectionGUID: YFju73/HRzeJ6c1xH2Jakg==
X-CSE-MsgGUID: wLWHhCYpQBqmjr7YZKDvIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="159836383"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jul 2025 08:34:43 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZWoi-0003g9-2p;
	Wed, 09 Jul 2025 15:34:40 +0000
Date: Wed, 9 Jul 2025 23:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] vfs: security: Parse dev_name before calling
 security_sb_mount
Message-ID: <202507092338.cQvAA2aV-lkp@intel.com>
References: <20250708230504.3994335-1-song@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708230504.3994335-1-song@kernel.org>

Hi Song,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on pcmoore-selinux/next linus/master v6.16-rc5]
[cannot apply to viro-vfs/for-next next-20250709]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/vfs-security-Parse-dev_name-before-calling-security_sb_mount/20250709-070602
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250708230504.3994335-1-song%40kernel.org
patch subject: [RFC] vfs: security: Parse dev_name before calling security_sb_mount
config: i386-buildonly-randconfig-003-20250709 (https://download.01.org/0day-ci/archive/20250709/202507092338.cQvAA2aV-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507092338.cQvAA2aV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507092338.cQvAA2aV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/tomoyo/mount.c:81 function parameter 'dev_path' not described in 'tomoyo_mount_acl'
>> Warning: security/tomoyo/mount.c:203 function parameter 'dev_path' not described in 'tomoyo_mount_permission'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

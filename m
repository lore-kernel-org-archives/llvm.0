Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEBA4A33;
	Fri, 21 Nov 2025 00:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763683362; cv=none; b=lxqm5/01PMquFyD51AjpcE962XKVHfps7S/gdcHhT9BfvdpyqhdJZhA/MNZhTeeiZhhdYu6YpAcV3UKtimJlQkUIkxwVTDd3fcN4qiOoTEww1pUAFj+0jsmhA3plunNmtHbYlvXwJtUz5ujYZYa3GmZ/RRL3R+Rfu2A2Z7mCBSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763683362; c=relaxed/simple;
	bh=uWHTfEA/eIKeRRLFO0e/1rE2zaLduAEAKSabFtNoxqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q8Uin+9NVRZZkTNp9HET1RmSzIzIaJxEdSfMV3SxbH1ZLqN/rrsP6o2jaCczWncpxBF5+c7q5ydTuoWcbnrh5SzPqmjhufMGEmSZdvhxNJBH472MNry7ftKxRVgh5o6vEvmmn2xhWj0xWi5iEtEdfEkdwwzzx1pzo5+cwIy28DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+8V0IyC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+8V0IyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763683361; x=1795219361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uWHTfEA/eIKeRRLFO0e/1rE2zaLduAEAKSabFtNoxqU=;
  b=Y+8V0IyCTi9bgYsIu4omymRMa9Ci60ou1BZPMePAkJCqG4MjTo9D2iBx
   yYxnWWMhldLsFJbAS9CrdnLZbxp91TvYvmGsw7FarvLPxoBthqF8YQOKp
   pWkv7kjLYKsWlSRBblBRywdHeOj1S3E9zNXO2pEm/mdGvLpCKbZ9aiDEM
   /IFrf+NyiiWiMSlkZJU+YHKkDkUSd+fmA7DKX0oQlH40456mtB52wx2Dj
   wGUBnFyu3yPIcS4gWrToLZKwnqYsSRRSN2idb3k6eMFgEwLnQzgkPohUS
   vOr4pV3ZXpS2paCt7fUuzDs0gpE3A2AjkowaV6V/ZrO+mhadxUMu/55zC
   w==;
X-CSE-ConnectionGUID: hUk/pmR+SCmvSjbxnK8WfA==
X-CSE-MsgGUID: 3dYdEUFFQpm1mZoQFeSb5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65809227"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="65809227"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:02:41 -0800
X-CSE-ConnectionGUID: kdVv1FWgRaGWnMMAYNfIaQ==
X-CSE-MsgGUID: 6rZ9x8kiRuKmnAA+UxYoxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="195678621"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Nov 2025 16:02:39 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMEbk-0004k0-2l;
	Fri, 21 Nov 2025 00:02:36 +0000
Date: Fri, 21 Nov 2025 08:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>
Subject: error[E0609]: no field `release` on type `bindings::device`
Message-ID: <202511210711.MizfIPQu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd95357fd8c6778ac7dea6c57a19b8b182b6e91f
commit: c4f8ac095fc91084108ec21117eb9c1fff64725d Merge tag 'nova-next-v6.16-2025-05-20' of https://gitlab.freedesktop.org/drm/nova into drm-next
date:   6 months ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511210711.MizfIPQu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210711.MizfIPQu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210711.MizfIPQu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `release` on type `bindings::device`
   --> rust/kernel/auxiliary.rs:308:25
   |
   308 |             (*adev).dev.release = Some(Device::release);
   |                         ^^^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

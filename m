Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374A11A683E;
	Mon, 13 Apr 2026 00:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776041560; cv=none; b=sgYNBv4fAVE4GEHuABCAOmvkgF4ZX0clOCXsXVU4A2Hs3BjLK+9+egBfZe3fdbtvYoMtGPbx9Lbvw2HM5ghWV2iQ8BRIgVoQH/w+oR9YcJzpOWZKKKlh1EsmcyWoWIBdNCkvufoj9w/Q8FJ3Fr4A8QKlLG8t0/vFQKGLtx86eoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776041560; c=relaxed/simple;
	bh=aeGMJJM/4PwPfjZpAtGAaJ+SY9eoesNZD9YCQFNgM+E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GzX7piHHTBLS83XrJR4qjMfsepRC8DnvbDXjpb7A5Ci2O80n+pES5RQDggPTkvJ7FZjNh97MOWcjqrg1nx+4sm4jDTDv1JBwDmVG6qfaVXFbtlej5RwxrX5RXrsYip6+gXJYJr8lUoFNQ4IJiJ9DbUx590vDOYZ0PBM4eZ+gjyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KblxZMdf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KblxZMdf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776041559; x=1807577559;
  h=date:from:to:cc:subject:message-id;
  bh=aeGMJJM/4PwPfjZpAtGAaJ+SY9eoesNZD9YCQFNgM+E=;
  b=KblxZMdf3yFuC+CPhRO3v9/tQRfiWWdbq0u7ykf5mrh0NDmvINZ7TifK
   1ngDFysoxpseYbB27GeLxeGG06d8q6Xoak5n2WKW6HFYXYWkeZ6ZeQweO
   d6ZAl3nOWYZO4wmuGWQL2l4bgM3hT68F2oLYN+cOhhs54SGoD0pkZLGw6
   1jSFGPJLbLc+iHywizi8lX019kwXtPzvkxjNZxo3NpB7GFo43BMT6E0Tk
   0nXgvOvCB0smNw7fdvRpJTaICpNlvsDD/or8oGGMpyS8wsHW7oau6Z8u6
   zkSNsA8YPEXn1etFN60Tne4GinoyrNcyMt6fpT0E3958QO1nobdsXR0YV
   w==;
X-CSE-ConnectionGUID: SHabkrHITZuhc0hTl/K2Rw==
X-CSE-MsgGUID: b2WUCAGVQC2VC0jDpnSdcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="99616135"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="99616135"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 17:52:38 -0700
X-CSE-ConnectionGUID: 4mkDpKcoRNaNt1leSDp7RA==
X-CSE-MsgGUID: LkSUDnxeS/6594gVhTfDKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="267626524"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 12 Apr 2026 17:52:36 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wC5XW-00000000BOL-1oY4;
	Mon, 13 Apr 2026 00:52:34 +0000
Date: Mon, 13 Apr 2026 02:51:56 +0200
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: mm/filemap.c:2167 function parameter 'nid' not
 described in '__find_lock_entries'
Message-ID: <202604130242.AWygXc47-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/fs-drop_caches-introduce-per-node-drop_caches-interface/20260412-192452
head:   219094de1eb16041433aaff8c95a50f7bafd491f
commit: 219094de1eb16041433aaff8c95a50f7bafd491f fs: drop_caches: introduce per-node drop_caches interface
date:   13 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260413/202604130242.AWygXc47-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604130242.AWygXc47-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604130242.AWygXc47-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/filemap.c:2167 function parameter 'nid' not described in '__find_lock_entries'
>> Warning: mm/filemap.c:2167 function parameter 'nid' not described in '__find_lock_entries'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

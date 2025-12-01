Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07882242D72;
	Mon,  1 Dec 2025 21:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764624340; cv=none; b=CI6KrooeCr+mWQn0C8aDL3Bvb0XlS7FX5DxuiUSx2oN1ZFoM1SWo5aOj0Nwhbq0KrQIBZNCJezWKk8D/GUHuexXnO/4wLWGV4c1gnm5WRVympa08hdd3aNUTa/fXDVQZcc5gn83/xsIm13kJfm//wlmEB6qctaX/i8Tub0jGyCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764624340; c=relaxed/simple;
	bh=VORlba5EFyGeuUWDG3q0bVhvLun3ia7D1O1zcljTNWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=caKWPlU8kqVKWN8txCHHZyagED0YME74RhcK60VrmI5mrm+qClsAC8dygVPEbzUR6Mb8ryyk1/Wc4lv14Q4jnz80nWRJHSwOddKEfD2GNXjxxBVUkYsmAsWJ6dJxOdL+BTLEMs40CMjI5Dj6LmE4qsL/u+MStmi7LeGXqB7qH5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PvnqUIfC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvnqUIfC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764624339; x=1796160339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VORlba5EFyGeuUWDG3q0bVhvLun3ia7D1O1zcljTNWw=;
  b=PvnqUIfCxpGLki9kvV7GV7fhotLHEtiuRFmtHOf6ZmCPM/gZSHccoK9b
   MR9Vfz3ctXZkNQv8yeG1OIBUJ4cymUwViJOWr2patScJg1NCqNDOz51bb
   UW3o+g8KDCnoLJet51e1WWJDJAQbL1kSn77vcuzyRrUL/3jouEbWvBUhL
   UlwnSohHFSRhG033qxZd74Pm7JUT3pdsZNp9SV/vgrVXtf26wuJpjc5P+
   aC8wZUj2nRv+Bz1ju//12miH5tb8W1CfzBNHpPm7znstjy/DLj5hlRLOQ
   b0QPE6ryZIb6our0+qNQt+hWeY1FXFGttxPNi41iRSTNHmIs1ga/GPvFb
   A==;
X-CSE-ConnectionGUID: /J/5SQe0RDKn5MdEz/XHcQ==
X-CSE-MsgGUID: wuX3HuoTTP++4QhgIXTRhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70426342"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="70426342"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 13:25:38 -0800
X-CSE-ConnectionGUID: ZQ5JrA8BQG6g2BSOGeUVig==
X-CSE-MsgGUID: jYQhlMBFTAydOJr0YA5qPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194012127"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Dec 2025 13:25:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQBOo-0000000099z-1ybr;
	Mon, 01 Dec 2025 21:25:34 +0000
Date: Tue, 2 Dec 2025 05:24:37 +0800
From: kernel test robot <lkp@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: error[E0609]: no field `class` on type `bindings::pci_dev`
Message-ID: <202512020539.vRk7h3HD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi John,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7d0a66e4bb9081d75c82ec4957c50034cb0ea449
commit: ed78a01887e2257cff0412b640db68b70a2654dc rust: pci: provide access to PCI Class and Class-related items
date:   3 months ago
config: arm64-randconfig-001-20251202 (https://download.01.org/0day-ci/archive/20251202/202512020539.vRk7h3HD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020539.vRk7h3HD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020539.vRk7h3HD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `class` on type `bindings::pci_dev`
   --> rust/kernel/pci.rs:471:51
   |
   471 |         Class::from_raw(unsafe { (*self.as_raw()).class })
   |                                                   ^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

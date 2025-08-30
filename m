Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D00122F764;
	Sat, 30 Aug 2025 06:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756535284; cv=none; b=lCWr0anMq1aMxvvY2tFJH8JYKLuXcrRf7iwiG5dSCnc/RiICv+14EOijc0SkrAfMhNr0F07lOr+FRX3zfn9tu7j17bsr38tZeDQk9SCrg0J3QtF/3qw15cpOR2ZfJKyhZ8mpS/kwQe+TksxRYoUPcMNWdRrSKY3WxT5Cfbngebc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756535284; c=relaxed/simple;
	bh=7dCt/sEtPsoHIlnTfrUe+eC906mWlmM6c75ossvgjbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WePIulJ0QCCHq5E/V60/F9+LkrtO8rfXsa8Iu2DMXWMPRrvM0zsCs0LueaKh9FFDLTAu1XFeX6sBhXkoRNVzyNEJc0JzrbB7LiVeAwmk8DF0qUmfkL4bXZxDBV/ogYXv/2YuEJ0stEwAcpJJsjRdiJgVUOgWHQOzupgVxCVDmps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2ZwgCGb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2ZwgCGb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756535283; x=1788071283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7dCt/sEtPsoHIlnTfrUe+eC906mWlmM6c75ossvgjbU=;
  b=P2ZwgCGbF6MaTUrAPjEpqI07z9UU+AUipUYNyD69PZzgQ5VfJKFeo7OB
   sqhLzxfEY7kZY21VLzaij9AYp06HKXlnskRgNkDIN3Iw5XTx9/5ZEAhsi
   6jWyJ1+5MfepJNfjQw7XiFCtCSTIpKqeIFCj3ZgugDLXoAKCaHrkrR0zp
   O6t0fj0UUoX15hTvR6RwWpGmcdWmXl0hQqX2VrLk6RtVhH+tQaKvIaQOd
   1bSZt5nV+ruB3q8WHQMLxUpTKg75M9gxQffV/ln2lrEKDgR3PjMmHsrfE
   V3B5UO8LfiMWu6Xc/P/hJg4SIu4G7xKXiFwu+/naaCnWqTOR3SWeI22Tc
   Q==;
X-CSE-ConnectionGUID: ZJP7xuGbRDa11vEmX2dFAQ==
X-CSE-MsgGUID: z4RodY5MRpKFijJvgn6+Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58741181"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58741181"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 23:28:02 -0700
X-CSE-ConnectionGUID: SdOF4iyDQEClpc+3Pa9+FA==
X-CSE-MsgGUID: woX1x0aUSOqF70Rt8YijxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="175849808"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 Aug 2025 23:28:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usF40-000VDA-1E;
	Sat, 30 Aug 2025 06:27:49 +0000
Date: Sat, 30 Aug 2025 14:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs-6.18.rust 4/4] error[E0425]: cannot find
 function `to_result` in this scope
Message-ID: <202508301455.vR6YEPjD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.18.rust
head:   bcd0b5f0199b33d65271c10859b414b4864aa1f2
commit: bcd0b5f0199b33d65271c10859b414b4864aa1f2 [4/4] rust: file: use to_result for error handling
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250830/202508301455.vR6YEPjD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508301455.vR6YEPjD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508301455.vR6YEPjD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `to_result` in this scope
   --> rust/kernel/fs/file.rs:402:9
   |
   402 |         to_result(fd)?;
   |         ^^^^^^^^^ not found in this scope
   |
   help: consider importing this function
   |
   10  + use crate::error::to_result;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

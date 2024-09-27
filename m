Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4910A481AB;
	Fri, 27 Sep 2024 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727447068; cv=none; b=snQQdoWGM5/WWnUNQzpQqa7W74HNrYok/sQDPOTwcb55FuUe4ihmWM466aRtIaVpsxOp89vs7M7pcExFYxlL6p0zwu8g42XGcL54QF1b1RD4LCasK5c/GVAglPrMpRZRn9hsx4EHW2jxfXd8FW1SS84+Mw1/e1OALgfSs0dCtRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727447068; c=relaxed/simple;
	bh=rTOyVE+dmMH2XppcmW/DqoicWy0P2ss0UJS6GP3iHzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GXKy/efs8P5/lrcPHdVtK1dg67e6/R8lQpuu2Ls7TJFVEbLyWun4oqYuSA7rMi2BedTg87HftcYwVvprbBJUSgQ+XdIsKv7kZD0HLb+lc8oMdI8S6jIV9Innld7+pZRUlcuyWfXHT5OF9TtBR4Evn+BwmdW4f5UiV/ZO6SpnNmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/UOBpOF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/UOBpOF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727447067; x=1758983067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rTOyVE+dmMH2XppcmW/DqoicWy0P2ss0UJS6GP3iHzk=;
  b=G/UOBpOF93SxGT3m06SVTrODva1IUNwvKtFSNp5Hykt8RlvYBB1LyFuw
   vLUqTAZP1k1euuGmYCeiqsW+9EbE64N+879Ua+Jqm1ms2OQv5Cka+cnZx
   Bdh+41d2xUkm9AGLkyjUtlFgKVV0ZbMEhOgsQwIS4U25s0N78CZ9Tj0db
   O0NrsKVnQsV6Y0D1UW9day9iPrLwWQC36w/WJzsgdCnkuSDxSNtjknwju
   ZlrKK5n+uUqaN33l5Jf9NydcD3/zGVk/Ikvc0Zv0pDtvDtZlYFo6czoZ3
   EDIK1Sm7q5kv78+de1LtcgHgj7Rqw0+pv+KvWs2c3IfYjJqNjFoXpqhxt
   Q==;
X-CSE-ConnectionGUID: yBotKFRmSlePPy5mYQM1Jw==
X-CSE-MsgGUID: bcuHkFHdSBGrsl08zvkAcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="49119851"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="49119851"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 07:24:26 -0700
X-CSE-ConnectionGUID: 4UNxmo7nQZWagH+tjsX3KQ==
X-CSE-MsgGUID: Vg+9aTarSj+0S7Qi0VMNtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="76927139"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Sep 2024 07:24:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suBtP-000ME1-0b;
	Fri, 27 Sep 2024 14:24:23 +0000
Date: Fri, 27 Sep 2024 22:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:staging/rust-pci 3/12] = note: `init` from trait: `fn(&'static
 kernel::prelude::CStr, &'static kernel::ThisModule) -> Result<Self,
 kernel::error::Error>`
Message-ID: <202409272204.5DFMtOua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux staging/rust-pci
head:   249ffdfb5019c0bd62b4b67d915af6c2c98ead08
commit: acde67c82eb0233f3b58001d36882f23f5c8b0f1 [3/12] rust: pass module name to `Module::init`
config: x86_64-randconfig-076-20240927 (https://download.01.org/0day-ci/archive/20240927/202409272204.5DFMtOua-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409272204.5DFMtOua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272204.5DFMtOua-lkp@intel.com/

All errors (new ones prefixed by >>):

   error[E0050]: method `init` has 1 parameter but the declaration in trait `kernel::Module::init` has 2
   --> drivers/block/rnull.rs:39:22
   |
   39 |     fn init(_module: &'static ThisModule) -> Result<Self> {
   |                      ^^^^^^^^^^^^^^^^^^^ expected 2 parameters, found 1
   |
>> = note: `init` from trait: `fn(&'static kernel::prelude::CStr, &'static kernel::ThisModule) -> Result<Self, kernel::error::Error>`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

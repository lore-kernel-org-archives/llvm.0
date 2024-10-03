Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DFF54FAD;
	Thu,  3 Oct 2024 06:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727935583; cv=none; b=KUiJSwWWeou22yHszhlJwIv3rKx9wdDSAeQCHYP6a7/J64QdI6/XVhRtaa46N+aOd+E+pDHimivrFDd/36eHsGt7OvAvrPonNxw0yPEENU79x4vq6DBxNSwqk9FebrqPVE3SFEk+6iosQM0QmUXQG2w4GOIlOQFHzDlcHNYMQXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727935583; c=relaxed/simple;
	bh=DdHrleDjJxN+3yfIZewSE3Qg72wk0HgjysSiK5PlXq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCV3NmYBPQsfjsRdjdO4R58k2v/Q1Ig7C51nTbKQpfFe2rT+cngUctFbZ+lGREhjd2DBEYu4SsJVeTmRxOp66srS6/YJavFTMc9meJBTesPy9xEZNoVrDg0TwcElZrIqzH9s3jri+lwj7+p1YF9ywng4GehUCcWAEkzixd36aLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9rhn/od; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9rhn/od"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727935581; x=1759471581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DdHrleDjJxN+3yfIZewSE3Qg72wk0HgjysSiK5PlXq4=;
  b=J9rhn/odqE01sdi9qqmKt47TbmoZGFULeFTI5DyZNxlpM7uK5H0owUKN
   YIYlQnKiz+o7mwBgQa2afrHonuBkzeEFLSVYRpldKdG7w/RFHDMTlms3I
   9vzBbovFy1GHVmlegYaFanVzkuXb/1MfiR87FspUHGhB/sPt4WQRyn3+H
   ARnkNkzLUlcQy831AQrkxqJor7FEW/AFP+XLz5pCI23oQAQ5Bd4JeyLS6
   bUR8T+NC/K0Y7tRC1o1RTsFoH6fxfMwMHl4bZ+Sw2S2Qe6PcvMCrA0gyP
   dDI1QTZ/VwQkplbZrl2KstbistPROVZQTCl4GtL4kdAIboAYjyerxRlGC
   w==;
X-CSE-ConnectionGUID: 9NWzcmrIQDWn0moCi8vnZg==
X-CSE-MsgGUID: bR3bT81yQOezPD4+IJ76jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26626459"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="26626459"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 23:06:19 -0700
X-CSE-ConnectionGUID: 00XRWYgyQa+IS2qtKfEueg==
X-CSE-MsgGUID: YnwF+bkhRAOJVHX/PzgMpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="73833784"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Oct 2024 23:06:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swEyd-00006w-2B;
	Thu, 03 Oct 2024 06:06:15 +0000
Date: Thu, 3 Oct 2024 14:05:40 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 16/29] rust: alloc: implement kernel `Vec` type
Message-ID: <202410031358.mGNWoD6u-lkp@intel.com>
References: <20241001150008.183102-17-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001150008.183102-17-dakr@kernel.org>

Hi Danilo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/rust-alloc-add-Allocator-trait/20241001-230558
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241001150008.183102-17-dakr%40kernel.org
patch subject: [PATCH v8 16/29] rust: alloc: implement kernel `Vec` type
config: riscv-randconfig-001-20241002 (https://download.01.org/0day-ci/archive/20241003/202410031358.mGNWoD6u-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031358.mGNWoD6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031358.mGNWoD6u-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0658]: inline-const is experimental
   --> rust/kernel/alloc/kvec.rs:170:12
   |
   170 |         if const { Self::is_zst() } {
   |            ^^^^^
   |
   = note: see issue #76001 <https://github.com/rust-lang/rust/issues/76001> for more information
   = help: add `#![feature(inline_const)]` to the crate attributes to enable
   = note: this compiler was built on 2024-04-29; consider upgrading it if it is out of date

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

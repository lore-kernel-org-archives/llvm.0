Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654EB4EDCAC;
	Fri,  9 Oct 2026 16:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562866; cv=none; b=MYjtSpESX49NLURMwFh3F9N7vwTc2jXjj8DDYdzAyrk0lg8UbzvWtx9CWZ7pGGCq9jJ/ss/r0HOc8qznb1WZWPvZRnqrUxP1DSAJKmaLELLVILArZgcj8GmtDU0/Fru/Mjb8sI3qKArozLQYClfr4ZSuy66MNBO8x8P0s5KNnhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562866; c=relaxed/simple;
	bh=gsJ/8HUiw+/ntCHZuU0jjeW3L80Z+FUKEdpD7y86gqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkaM7Gi55QiSKTuUYu8rMBPn4O4anywTHcPkUsXI1JHe5TEn9NRlH5yaJckVa/SMufXncoPczCGehYYKHonsvDj7TS0QQD2BnQRRJPSuDtooeTYh2faGcp3IQWcNIG3o+s+NzpTz75SBNTUCdXxg6VWT3x67Axx3RuA65OIvEVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dW8tbKG2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dW8tbKG2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791562862; x=1823098862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gsJ/8HUiw+/ntCHZuU0jjeW3L80Z+FUKEdpD7y86gqw=;
  b=dW8tbKG2r5UNRZGQPiPeQIhl0Lh24ELQGTjrgex5dhGAmyqVG64uMBWn
   1SwOIHUHcqBa3cLVX5uZonG5058eh2pKmKdPwfcTzBRhgOt4/qFytjYrY
   9SOwgwh+LhSCi/4ewHaKea/snjuEXSk4fDIOdFA1IOSlcL1aI19CMl96w
   gsjbl7K7emMGi7PvMY4NHAtxqZAkAHR2m4dnL+sJe4x6HOi4uEvWvZwS1
   K9hJCunCJLV39LDsYyD/INMrpVFncpgbjiugtDktqY8eXogs3gVyC1HN3
   dfoZ7ML9NGM87GktLMlLHje5blj3AOnT6Dqtu1kuX7Ek8g072XpH55aTv
   Q==;
X-CSE-ConnectionGUID: VCmIeYQFTdyKv/5KwKoZRg==
X-CSE-MsgGUID: YBOwesg2QXGTsr4uCrEvWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="369149"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="369149"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 09:21:01 -0700
X-CSE-ConnectionGUID: dn6Xe7yeQyqvBT75D8pYAA==
X-CSE-MsgGUID: Jt+nk3KNRQK7ishZzw2+7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="290053"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Oct 2026 09:20:58 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFDL5-000000005zY-0JHI;
	Fri, 09 Oct 2026 16:20:55 +0000
Date: Sat, 10 Oct 2026 00:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
	daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org,
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v3] rust: compiler_builtins: Fix silent trap in
 prohibited intrinsics
Message-ID: <202610100054.UyoZyPQ5-lkp@intel.com>
References: <20261008114717.992497-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008114717.992497-1-tomo@flapping.org>

Hi FUJITA,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2dee3d3adcadcc57d62ba6608cd02f50b0c10264]

url:    https://github.com/intel-lab-lkp/linux/commits/FUJITA-Tomonori/rust-compiler_builtins-Fix-silent-trap-in-prohibited-intrinsics/20261008-204717
base:   2dee3d3adcadcc57d62ba6608cd02f50b0c10264
patch link:    https://lore.kernel.org/r/20261008114717.992497-1-tomo%40flapping.org
patch subject: [PATCH v3] rust: compiler_builtins: Fix silent trap in prohibited intrinsics
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261010/202610100054.UyoZyPQ5-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610100054.UyoZyPQ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610100054.UyoZyPQ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: _RNvNtNtCsjYlAz7NZ3Sw_4core3fmt3num8exp_u128+0x7d: __rust__udivti3() missing __noreturn in .c/.h or NORETURN() in noreturns.h

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

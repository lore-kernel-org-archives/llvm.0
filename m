Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715861EF0B9;
	Sat, 13 Dec 2025 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765637153; cv=none; b=XnW9jeqiaOQ9NjMGwhTwQ3aHL1fScN1NyCCacXTqVmAquK8eSq5U94VEHjEoKl0d4SUUxj9ibknDRTz3tblY60jIcEsxqfCIGvBU8MmogqaEB3oLe9u2wJuRag60wxQDTKV1KIuKXvX/OtEV5APM6scjeetZBVGB00MbiZCzq/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765637153; c=relaxed/simple;
	bh=x3O7UystAmu0laPnZukWplU+jTS2X0j4gWkEiv+zu7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knVZ4Xgxdk3nPMkuZqwrpxjvJkH80T/9aBuWjspqDEnIVNbW0BMgqMVzI92S/Z89lReVBTEIHPXYT2lVXXJrvvD+CGOQBsHGwJqmpJABClnziSlorhgdjxdXF9HFweugfG5UqVzjFbaZjfHov5V2FkHv612uKeT+kyagqvw2N5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehglhjFU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehglhjFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765637153; x=1797173153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x3O7UystAmu0laPnZukWplU+jTS2X0j4gWkEiv+zu7M=;
  b=ehglhjFUDqOapDMV0wu0pOW3naw1bthzmaO/motRhWzjFoJFQnexZIVp
   yJYDk4S+xDw1sOzUNo7SoTk7/6faJqXrqOdwqLvueg9Sw6SWZ0fZE7Wey
   qoz5aibYWTH78K9ceDm7VnHqlDmVVMxqXUI9beakscLMC+uQNWgC3KDGY
   WTPl8psnIXOplmMNUQ2mcQUL9628G0MPeVtdKIA4GIgyoHo87x6FGpWAS
   Akw+AxvC/H08oppORJ0dCDf7ERQY/Uj1Dkwnyff0RIlFxnHsbbgct2M2T
   5Le513vJj/X9Np0xeO8MChF9OaOeeGy/2yYEP6vC8TGgQxKPAj1WPSthd
   Q==;
X-CSE-ConnectionGUID: 6D4u1bCMRg2pzieNGTAgkg==
X-CSE-MsgGUID: VdoloMtOQP6adDe2s9tGeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78727484"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="78727484"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 06:45:51 -0800
X-CSE-ConnectionGUID: Pv9s2lbRQmSJaXuB0ktrRw==
X-CSE-MsgGUID: r3LA0x/jQp2Xk2n+5OlajA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="201502891"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Dec 2025 06:45:48 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUQsU-000000007kV-0nSD;
	Sat, 13 Dec 2025 14:45:46 +0000
Date: Sat, 13 Dec 2025 22:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Shephard <bshephar@bne-home.net>, aliceryhl@google.com,
	joelagnelf@nvidia.com, acourbot@nvidia.com, airlied@redhat.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
	Brendan Shephard <bshephar@bne-home.net>
Subject: Re: [PATCH v3] drm/nova: Align GEM memory allocation to system page
 size
Message-ID: <202512132208.bhsQf8d8-lkp@intel.com>
References: <20251208071810.653223-1-bshephar@bne-home.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208071810.653223-1-bshephar@bne-home.net>

Hi Brendan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 37bb2e7217b01404e2abf9d90d8e5705a5603b52]

url:    https://github.com/intel-lab-lkp/linux/commits/Brendan-Shephard/drm-nova-Align-GEM-memory-allocation-to-system-page-size/20251208-153603
base:   37bb2e7217b01404e2abf9d90d8e5705a5603b52
patch link:    https://lore.kernel.org/r/20251208071810.653223-1-bshephar%40bne-home.net
patch subject: [PATCH v3] drm/nova: Align GEM memory allocation to system page size
config: x86_64-buildonly-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132208.bhsQf8d8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132208.bhsQf8d8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132208.bhsQf8d8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: no method named `ok_or` found for type `usize` in the current scope
   --> drivers/gpu/drm/nova/gem.rs:31:45
   |
   31 |         let aligned_size = page_align(size).ok_or(EINVAL)?;
   |                                             ^^^^^ method not found in `usize`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

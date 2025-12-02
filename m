Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69A541C71;
	Tue,  2 Dec 2025 01:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764640196; cv=none; b=egMyHCgYETtn6nc8Yi7YdVQpvBFIPOybW1+C6b+eMS6Wrt9jL/+/ObQyusdfLuMTlI7FVvTneLN8DlbFFfi2XhE/j3dHqwnZjLL/mBt5KzcZYo2Nz8XEJ8w0HzC/BdRBcgIXu9c8F0OiUWy5ENJkzagmyEV9F11N5ze9M/T2h1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764640196; c=relaxed/simple;
	bh=HMsjCRo6Hs7VVm/tvsRz7J/MZ52pYZvPwUkSaLkmm2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVXlXMhAHeh/QZjn0QkLZfFoHlZE84OUe1pA5+5Vfl7jWFJ/SNGUK2PPnnA8ka69GV5sRPzr8Ky2RdMe4bo0G+8KCy1OsWde05l8Y9sCJWM9Z065/cdyG2DqgI4wrzW+wmITqizwZqAl5JSJILGHvTqnruxLH/GSIbeQyX3yxQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHicr47K; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHicr47K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764640195; x=1796176195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HMsjCRo6Hs7VVm/tvsRz7J/MZ52pYZvPwUkSaLkmm2Q=;
  b=NHicr47KES+CBjHYHL1pXh3wCCQwUtr6bGsdqFQHa3+13df/UW0inzbq
   ksOYzkWrwD4/zpMLfuudQvMBhtRm/FWYpBilI0fOuu5I+m5kZOlQk5FXE
   cvPiNF0U745Ve0Y9ECKgniNsqaZ1sJsADalg2cQRyGm0Gs97EUHd2oGiG
   FcCJZp2270TksIxuC8kaEWt2Is9RUbGO55KlqAMvbyD+kvzVXTnGrNOUm
   SE3QHhcPY+dlo4Spuwc41Ux+xUidWJcwzk221EtBCW0wy9ZC+XViEkFmq
   GYF8WPRHewRKR8jsTM08NsntM9eRpP1T8cJFRtMfBhYATl6pt2Q/eDn7p
   w==;
X-CSE-ConnectionGUID: XvXJpntvThumB7f2EFy/5A==
X-CSE-MsgGUID: d7DqLGnvQnKC1JrRko1NFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65783286"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="65783286"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 17:49:55 -0800
X-CSE-ConnectionGUID: GKwxFtV8TkSlCe5AdF6rjQ==
X-CSE-MsgGUID: XDUTgTCHQMq4fRdbY0t7EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="217566757"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Dec 2025 17:49:49 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQFWV-000000009Iv-1UJJ;
	Tue, 02 Dec 2025 01:49:47 +0000
Date: Tue, 2 Dec 2025 09:49:34 +0800
From: kernel test robot <lkp@intel.com>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, lossin@kernel.org,
	lyude@redhat.com, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
	peterz@infradead.org, mingo@redhat.com, will@kernel.org,
	longman@redhat.com, felipe_life@live.com, daniel@sedlak.dev,
	daniel.almeida@collabora.com, thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH v8 5/6] rust: ww_mutex: add Mutex, AcquireCtx and
 MutexGuard
Message-ID: <202512020943.whFrDsXx-lkp@intel.com>
References: <20251201102855.4413-6-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201102855.4413-6-work@onurozkan.dev>

Hi Onur,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/locking/core]
[also build test ERROR on rust/rust-next linus/master v6.18 next-20251201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Onur-zkan/rust-add-C-wrappers-for-ww_mutex-inline-functions/20251201-184152
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20251201102855.4413-6-work%40onurozkan.dev
patch subject: [PATCH v8 5/6] rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard
config: arm64-randconfig-001-20251202 (https://download.01.org/0day-ci/archive/20251202/202512020943.whFrDsXx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020943.whFrDsXx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020943.whFrDsXx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `ww_class` on type `ww_acquire_ctx`
   --> rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs:110:41
   |
   110 |         let class_ptr = unsafe { (*ctx).ww_class };
   |                                         ^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `ww_class` on type `ww_acquire_ctx`
   --> rust/kernel/sync/lock/ww_mutex.rs:252:49
   |
   252 |             let ctx_class = unsafe { (*ctx_ptr).ww_class };
   |                                                 ^^^^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

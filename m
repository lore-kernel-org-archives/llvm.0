Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5B911CAF;
	Thu,  3 Oct 2024 00:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727915274; cv=none; b=bkK1W6quX4QAT0miqCVBcQfdBHuz4gS9pcFGmwv9Si4hKBOnO+psSqB798Etqu12WVMc0v4BO5eD3oe1RQVpTstmZLXQAp3zQSpkTKtTrMEnPVbUkCjGi6+XWX29PnGa5I//Z/nsmv/vV+nrC1sYdHUNoEboBGwvgPj6S/Nxvwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727915274; c=relaxed/simple;
	bh=4jOSy2S5vzvt4SXm1y8gfO76VgZUH7wm+QIBYnhH3Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E02pT2XgqgNs8SnV18hpZy1uU02FsBR+J2hYV9yWnLxWdN8XEFOS1t+rkBRrohOlHmeFDCdMqtroIFM+SYHD6CciL4PzVKkmT+HOCBmgdU2a8MGIyte6BTpFMnSOzEJ0SR9YOLmeU19fBX18V8I3Z5myLtak2OZOogMbI5VoMoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWJEXH6p; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWJEXH6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727915272; x=1759451272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4jOSy2S5vzvt4SXm1y8gfO76VgZUH7wm+QIBYnhH3Cg=;
  b=FWJEXH6pFiMldM9nE3x3PMaexwnVe+ympLpzGwsqN0b+pHLt9742g+IU
   lN9cGq0fAJ0vXqPqPLgzyVS4RbpfbDztc1I41bYotK+Gad4+LDpmeRfB1
   ZZOWycPcOIxD9dkHF+PnsPn7o/dFbEqO/x5o2/LcRYXoxeTcJ1qqyXaRE
   cXZjD37oNjaKiOtJVonRNRZktqEQ5nkXmcC0oz2ey3Cg1c8vqbas3U7DB
   onsxZu71E8gu3DrOc410OeEfZ8Djlm9lbah+xVUL46e+5ZBPLJdAgVS4k
   cTzPOZ4IkNwzwWA7tpl4VYJSgxANHiZLM6x1ftk4sqOiSB/Wtu8Eda+gE
   w==;
X-CSE-ConnectionGUID: WxpcPG93QjGbO8VINnnuOQ==
X-CSE-MsgGUID: /gGwsLCuRta2HXZGxEjG7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30983714"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="30983714"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 17:27:51 -0700
X-CSE-ConnectionGUID: dwjIvjloTeinYpM1Frs8nw==
X-CSE-MsgGUID: xpDUIod3TPOk3JYCsRfp0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="74293881"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Oct 2024 17:27:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw9h1-000Ujz-0l;
	Thu, 03 Oct 2024 00:27:43 +0000
Date: Thu, 3 Oct 2024 08:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org,
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com,
	akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com,
	boris.brezillon@collabora.com, lina@asahilina.net,
	mcanal@igalia.com, zhiw@nvidia.com, cjia@nvidia.com,
	jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com,
	lyude@redhat.com, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v8 15/29] rust: alloc: introduce `ArrayLayout`
Message-ID: <202410030724.cV9BEoNG-lkp@intel.com>
References: <20241001150008.183102-16-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001150008.183102-16-dakr@kernel.org>

Hi Danilo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/rust-alloc-add-Allocator-trait/20241001-230558
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241001150008.183102-16-dakr%40kernel.org
patch subject: [PATCH v8 15/29] rust: alloc: introduce `ArrayLayout`
config: riscv-randconfig-001-20241002 (https://download.01.org/0day-ci/archive/20241003/202410030724.cV9BEoNG-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410030724.cV9BEoNG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030724.cV9BEoNG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `size_of` in this scope
   --> rust/kernel/alloc/layout.rs:47:31
   |
   47 |         match len.checked_mul(size_of::<T>()) {
   |                               ^^^^^^^ not found in this scope
   |
   help: consider importing this function
   |
   7  + use core::mem::size_of;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

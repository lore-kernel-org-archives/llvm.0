Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D547E29B239;
	Mon, 20 Oct 2025 02:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760929081; cv=none; b=WtpMs5Mn0uTxHPJtm0o+KEZ9rf2lZHzYDxB1J1Xde5Gqkr2MpxOM4Pv2RjB2jsmKrCtMwXK6NUmoXLMFFyqaaq+pxmejw8UvY6cvbjzPAs7A2q30QOHsVO8oPB3pwiubNPOIMKEb8M4xp7He/MQwNwiBb+sj79pkCkQ3Kq0kUFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760929081; c=relaxed/simple;
	bh=Gh5hPLnkeHc+KlwOm9AytAgvoUXZl9XGma7idMK9I70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwQbOn31M7YbtPd7ksojQ5G6poix5pDsM8AlqG4k6dWAcWlwG+kqReEtvsttMSz0FhKwtM5iBhdlb6FQRCcLgtj2oaMVWgbIxbak9XO5uSkzDSzDFlmNV8VTqGFcNec2dXrO9SBnHzgFXODL7A/rWQi8a5sRaUwXBlCSs08YeA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GxQgJh6X; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GxQgJh6X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760929080; x=1792465080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gh5hPLnkeHc+KlwOm9AytAgvoUXZl9XGma7idMK9I70=;
  b=GxQgJh6XybmFFR5H1oj8n3MA+qZsgr0L/RVGIBQk6W1pce8zm1jqQJ4Y
   DcBfUfi75faBF5awb7NXOXYXW3W09fBQqVwBcf9GCCal9BXlqQ5qt8HUv
   KO2fuoTtcNwgv47A1PWzOhK4H0HIunAw3WlPol4VQ9Aa27t779ZYL4ZwT
   MARrs9OxhaCAawaVanhMlzeyUPszeCwss11CZqM4CKnOrNCPlkSSRTMXv
   FowcePSz4bZmQWwgR3hNPxSwaMUWoSrdVAFFi8JkK3XejvUGK5L/2AdlH
   O9NDpIuB93HoJ0Yi0rA5J2CX+OVJhe28xGoR5m+zo5Tf91gwKWrM2qMkM
   g==;
X-CSE-ConnectionGUID: IWudFsFBQMylyjtt72efpg==
X-CSE-MsgGUID: UiEaaSwET5ypeoW2IfzLPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="63192386"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="63192386"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 19:57:59 -0700
X-CSE-ConnectionGUID: Xy2HzDYOQtuMKSp/im0Qww==
X-CSE-MsgGUID: 1yfFCHgITcykxUOswjPuuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="183179065"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Oct 2025 19:57:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAg5K-0009Rl-1v;
	Mon, 20 Oct 2025 02:57:45 +0000
Date: Mon, 20 Oct 2025 10:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v18 16/16] rust: replace `CStr` with `core::ffi::CStr`
Message-ID: <202510201014.KMYY9XHs-lkp@intel.com>
References: <20251018180552.3616793-1-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018180552.3616793-1-aliceryhl@google.com>

Hi Alice,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6f3b6e91f7201e248d83232538db14d30100e9c7]

url:    https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/samples-rust-platform-remove-trailing-commas/20251019-060517
base:   6f3b6e91f7201e248d83232538db14d30100e9c7
patch link:    https://lore.kernel.org/r/20251018180552.3616793-1-aliceryhl%40google.com
patch subject: [PATCH v18 16/16] rust: replace `CStr` with `core::ffi::CStr`
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251020/202510201014.KMYY9XHs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510201014.KMYY9XHs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510201014.KMYY9XHs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: no method named `as_bytes` found for struct `CString` in the current scope
   --> samples/rust/rust_debugfs_scoped.rs:41:38
   |
   41 |         .retain(|device| device.name.as_bytes() != to_remove.as_bytes());
   |                                      ^^^^^^^^
   |
   help: there is a method `to_bytes` with a similar name
   |
   41 -         .retain(|device| device.name.as_bytes() != to_remove.as_bytes());
   41 +         .retain(|device| device.name.to_bytes() != to_remove.as_bytes());
   |
--
>> error[E0599]: no method named `as_bytes` found for reference `&core::ffi::CStr` in the current scope
   --> samples/rust/rust_debugfs_scoped.rs:41:62
   |
   41 |         .retain(|device| device.name.as_bytes() != to_remove.as_bytes());
   |                                                              ^^^^^^^^
   |
   help: there is a method `to_bytes` with a similar name
   |
   41 -         .retain(|device| device.name.as_bytes() != to_remove.as_bytes());
   41 +         .retain(|device| device.name.as_bytes() != to_remove.to_bytes());
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

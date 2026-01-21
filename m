Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B9939A7E3;
	Wed, 21 Jan 2026 17:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769017860; cv=none; b=P/usreMVf9kepFPJXB3Ksq5gCoOubVL98c8b1sN6GlReSaCUjKDp50VoH2QqZMh2OowePzF37o1zrM6zXEREeVT8gxRTW9l6/SsUMPcfJlOgb5CdWSjinnwTArbIT34hrVceigHHG5sRBloRiCRBLudpfie1d8E9npkV5qCeLxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769017860; c=relaxed/simple;
	bh=ll8/q951I+mbZX8NSSKwqvgeX2YCxrhKGAqk2oHlt7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8qFReZ+tzS5l48JKjNoK9Q5s8HHt04Jf2zwRKbBzZLFIXGH49FyGsr6RWJUrDmmy1UrUu/cain0GTq4Heyynhu5sy5GsYUzoemigWGNUjZEDKZiTPl1pIsyOyGPk7wypg5ZYdsQ5uyRjrCJ6jYtQtnj1TWLbk7EkGEhIZBQAro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkKsyEfb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkKsyEfb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769017858; x=1800553858;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ll8/q951I+mbZX8NSSKwqvgeX2YCxrhKGAqk2oHlt7M=;
  b=nkKsyEfbqiYmIzaaXc/DkA5ucLzrc9L21kwtvJnw615R+cuzahyDavj3
   KoXnHpW4swzWZKfAMnImqQNHUD6MLQVrEPePolpTjc+ZuPySbqAC26dSW
   wyOUnwW+0/aPKtEwaC+TG3Ubp2osCaV3QnDL/mso+LQpF3pz8x3pVW1rW
   FRhJd4ibJZsy5PTr+pfY+DgMeps/oE915suMKNCPPjpobsI2lH6pFWUQv
   ZVXbFTkEKKpgpBklkQeG+07bdeu1T1LNpCYzehQ9ewPPp86C7EwemqMvn
   0lY4rwXzpHULp9inwibsWbU31LatuKJX4QSk/UoQci4L/7s+h+ZkZtJMA
   w==;
X-CSE-ConnectionGUID: pAyLFedjQhSkNH02KSatWQ==
X-CSE-MsgGUID: AQHFVNgVSUG0EB+NIR9fYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70345620"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70345620"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 09:50:57 -0800
X-CSE-ConnectionGUID: XW3odpzCSvynTviE8+gVUQ==
X-CSE-MsgGUID: QI6wgQGaTDeADj+lpccI2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206410352"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 09:50:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vicLx-00000000RW3-0zwD;
	Wed, 21 Jan 2026 17:50:49 +0000
Date: Thu, 22 Jan 2026 01:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Yury Norov <yury.norov@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v2 2/5] rust: num: add `shr` and `shl` methods to
 `Bounded`
Message-ID: <202601220119.LQY1LLC8-lkp@intel.com>
References: <20260121-register-v2-2-79d9b8d5e36a@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-register-v2-2-79d9b8d5e36a@nvidia.com>

Hi Alexandre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c259cd7ea3c9ad369c473ba2385d82e3432088b1]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Courbot/rust-enable-the-generic_arg_infer-feature/20260121-152936
base:   c259cd7ea3c9ad369c473ba2385d82e3432088b1
patch link:    https://lore.kernel.org/r/20260121-register-v2-2-79d9b8d5e36a%40nvidia.com
patch subject: [PATCH v2 2/5] rust: num: add `shr` and `shl` methods to `Bounded`
config: x86_64-randconfig-071-20260121 (https://download.01.org/0day-ci/archive/20260122/202601220119.LQY1LLC8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220119.LQY1LLC8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220119.LQY1LLC8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unnecessary `unsafe` block
   --> rust/kernel/num/bounded.rs:491:9
   |
   491 |         unsafe { Bounded::__new(self.0 >> SHIFT) }
   |         ^^^^^^ unnecessary `unsafe` block
   |
   = note: `#[warn(unused_unsafe)]` on by default
--
>> warning: unnecessary `unsafe` block
   --> rust/kernel/num/bounded.rs:511:9
   |
   511 |         unsafe { Bounded::__new(self.0 << SHIFT) }
   |         ^^^^^^ unnecessary `unsafe` block

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA9F4BCADF;
	Fri, 15 May 2026 16:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863727; cv=none; b=lL3VlWCMPC/iaOiO+rYxhe0135fxZl7OTBWFUL5FnMlvOSYKgoXRkIgXmgGi5kSb9hYBaNOH+6qVZpiChKdfGF2ttk2SF2B44ZPcgq768kYByqLZdKSTZPKmhn7z/tm8wseEQaBKQ4Vw21uxLg6j609RtFG9+pALGUN6yzd8BeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863727; c=relaxed/simple;
	bh=MPw8XqSizwsQjt6Lb1RIg4Lh/0+lz373q/Wiu6x99+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edtXyNM8xfWr5C/3OfD7Sdc+6e5I58ki7K+DHAmofpK0zbu6gTg03s5bLdvO8maeXODo27X4ZMNqUUiaTrG+pnuZ2znEE234u9z0W41e3VNRsnY3SwyNJRNtaxVfnjDdLTGncTB0iOkR6GkK/V2CyrnqCy1OpXYk9/SiUfRAuNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHY412eE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHY412eE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778863726; x=1810399726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MPw8XqSizwsQjt6Lb1RIg4Lh/0+lz373q/Wiu6x99+s=;
  b=nHY412eEX4RvS8UP31Yv9qIlVrFJAn/GcA9F+WZ2tByJL37r1dr1QWvQ
   dD7EBIjFCz4ep9GONQfDPQW/m9CeGGufNF8lPxKqbdH0JuwkE+xddPeH7
   zugE1YzO3Zmm41+KxKNx9tnZIs0sMiJcEFe89ZvMm5Uqs2Gzl5J4UAJAW
   0txrHOlaUS2+vtUrUhPdxp9dH205Rd1tfP2mMSm6jSYqsvPadbEV8SPwI
   SUTj/E/Bi6+6JutnW2ScsGmv/oMdZsPswQvqygoJsAQll69jLGyHOrKar
   qCrwYv5ur5yI3KAOVTXg28EiN2g6l4FeM9pRfKMYD7ZPBbvq1qdBym4mI
   w==;
X-CSE-ConnectionGUID: D5CsZsB1TiS0pzwLTvFS5A==
X-CSE-MsgGUID: 892FWbQJS8+vr23k5q32Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="102496143"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="102496143"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:48:45 -0700
X-CSE-ConnectionGUID: HeSRgMiyTiemDA8r7WgISA==
X-CSE-MsgGUID: h/F4wMP/QrWC77q33VikPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="240558211"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 May 2026 09:48:39 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNvhQ-000000002JF-09Gd;
	Fri, 15 May 2026 16:48:28 +0000
Date: Sat, 16 May 2026 00:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: Albab Hasan <albabhasan276@gmail.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Albab Hasan <albabhasan276@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: io: convert `PhysAddr` type alias to newtype
Message-ID: <202605160005.NTpIKu0B-lkp@intel.com>
References: <20260504045714.59248-1-albabhasan276@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504045714.59248-1-albabhasan276@gmail.com>

Hi Albab,

kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus rust/rust-next linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Albab-Hasan/rust-io-convert-PhysAddr-type-alias-to-newtype/20260515-155255
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20260504045714.59248-1-albabhasan276%40gmail.com
patch subject: [PATCH] rust: io: convert `PhysAddr` type alias to newtype
config: loongarch-randconfig-002-20260515 (https://download.01.org/0day-ci/archive/20260516/202605160005.NTpIKu0B-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160005.NTpIKu0B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160005.NTpIKu0B-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0308]: mismatched types
   --> rust/kernel/io/mem.rs:257:43
   |
   257  |             unsafe { bindings::ioremap_np(res_start, size) }
   |                      -------------------- ^^^^^^^^^ expected `u64`, found `PhysAddr`
   |                      |
   |                      arguments to this function are incorrect
   |
   note: function defined here
   --> rust/bindings/bindings_helpers_generated.rs:1272:12
   |
   1272 |     pub fn ioremap_np(offset: phys_addr_t, size: usize) -> *mut ffi::c_void;
   |            ^^^^^^^^^^
   help: call `Into::into` on this expression to convert `PhysAddr` into `u64`
   |
   257  |             unsafe { bindings::ioremap_np(res_start.into(), size) }
   |                                                    +++++++
--
>> error[E0308]: mismatched types
   --> rust/kernel/io/mem.rs:262:40
   |
   262  |             unsafe { bindings::ioremap(res_start, size) }
   |                      ----------------- ^^^^^^^^^ expected `u64`, found `PhysAddr`
   |                      |
   |                      arguments to this function are incorrect
   |
   note: function defined here
   --> rust/bindings/bindings_helpers_generated.rs:1268:12
   |
   1268 |     pub fn ioremap(offset: phys_addr_t, size: usize) -> *mut ffi::c_void;
   |            ^^^^^^^
   help: call `Into::into` on this expression to convert `PhysAddr` into `u64`
   |
   262  |             unsafe { bindings::ioremap(res_start.into(), size) }
   |                                                 +++++++

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

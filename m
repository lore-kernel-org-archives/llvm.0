Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DC02D3EF2;
	Fri, 23 Jan 2026 11:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168519; cv=none; b=iBWSvP42wI/TkSCj6PnDRrt56X9dGxsm6EEj/LQdvn27mSn4OtKLSsg6m4HuH05a+3ATVUB5UMnLdaBtazKLxW/71HWxHqd/dcYxVAqfGWzcWk8I2GoMMPbCkz2E0rgPsUOi3OAGBL1tNHTwZoeOMOTOcbATg3VWX3MtXL14pa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168519; c=relaxed/simple;
	bh=ktlQ8RmvlJ+pU9m2ooBrGlb3XT/RfR84iLXgy7qFdXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msz2duJcGme5FAH/Cez+N3dsJuZq3yWodJ1G+xkcdHr4z/Rocbs8spQDlKNcvCIKNV+KOoSLqRm281jpaxfj7ihFE5hJEXKUPC8UPnjyIUPIHG/1B1wpfT5CM9P6cY7f556WB2DSniI/qUBJ74dxCQA+EOw4zkFUTR7p5VIqAv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KgMwD0+K; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KgMwD0+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769168517; x=1800704517;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ktlQ8RmvlJ+pU9m2ooBrGlb3XT/RfR84iLXgy7qFdXs=;
  b=KgMwD0+KNm5YOQrgOMv9Ji1rIrtI4dOtMbM5nO0n+tQxjiT3nm63IObc
   tQB6InOUNfrf76lOz9EO1txvkbkgB+kpVKBmmIsNQG+4vDf6S0pZ+6YFf
   Gzx5aRe3ZmfiUZgottBD1IXpKqq0ouoY8H1DkoeFh33mAc1ojupMu5BrL
   88obuuH16MmW9eK7NyH5KO0JgadQBGoTMMImViRpl5jqtqxhzue1V0vD0
   EMyZ8erZvlHhIXjDD3UAEWAIhzufOPLG7v3yvnXA/ZHlIyJKOfn71c8HZ
   S/8L5FKE+C4H4GTgYNiC3cLd2E2tfkj5u2GjxOrY7M2AcPty+nrpAM2Jr
   Q==;
X-CSE-ConnectionGUID: 3VHVoOyGTTu6D5HqcJky1g==
X-CSE-MsgGUID: yvuCmoHGS1SUMNuVyZpcQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70481942"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70481942"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 03:41:57 -0800
X-CSE-ConnectionGUID: YIPNh8WcSOuGSPsfMfyLTg==
X-CSE-MsgGUID: s9l23Rw9SeuhgXCraeLZ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="211130241"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jan 2026 03:41:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjFXy-00000000Tu0-0mZ6;
	Fri, 23 Jan 2026 11:41:50 +0000
Date: Fri, 23 Jan 2026 19:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ke Sun <sunke@kylinos.cn>, Miguel Ojeda <ojeda@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: Re: [PATCH v9 2/4] rust: fmt: add HashedPtr for safe pointer
 formatting
Message-ID: <202601231901.n0LCYrxo-lkp@intel.com>
References: <20260119033006.1453006-3-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119033006.1453006-3-sunke@kylinos.cn>

Hi Ke,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on linus/master v6.19-rc6]
[cannot apply to next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ke-Sun/rust-fmt-add-Pointer-trait-for-foreign-type-formatting/20260119-123751
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260119033006.1453006-3-sunke%40kylinos.cn
patch subject: [PATCH v9 2/4] rust: fmt: add HashedPtr for safe pointer formatting
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260123/202601231901.n0LCYrxo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231901.n0LCYrxo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231901.n0LCYrxo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0308]: mismatched types
   --> rust/kernel/fmt.rs:180:71
   |
   180   |             unsafe { bindings::scnprintf(buf.as_mut_ptr(), buf.len(), c"0x%p".as_ptr(), ptr) };
   |                      -------------------                              ^^^^^^^^^^^^^^^^ expected `*const u8`, found `*const i8`
   |                      |
   |                      arguments to this function are incorrect
   |
   = note: expected raw pointer `*const u8`
   found raw pointer `*const i8`
   note: function defined here
   --> rust/bindings/bindings_generated.rs:27439:12
   |
   27439 |     pub fn scnprintf(
   |            ^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

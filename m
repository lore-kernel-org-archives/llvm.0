Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD811FC3;
	Thu, 23 Oct 2025 00:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761179801; cv=none; b=bVtejIqEuZNalSFE1S+bNNLm26NTjoX8k32/3aTxDCwl0sh8KHPBDXIMSjidw9olL4Wcho6234Uqi8vEDDd6jM8HdNy4G4PmRyX5TSVLxi8PWw6e331U/LLYjj7eLf8r7zGTcMDqVdr9KDRrtkavIH4N5xZWwJMF2DYEKo068Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761179801; c=relaxed/simple;
	bh=Tbyz0EOwOY6fjz8bsCF+rgeu3HZ1GWxhkU2Mfg5zCrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+pea5CMVcXHatftUFRyq0u38fOqk9HtmMlSghJ4TlJHbSAsjijYeiufIkXRY9VrmkemuDK2kvEyWAmeDbgA7Gq98PHmrsvdnD9ojoet8AqtnxSazzMVuwDbpJ0uIDSJlMgemaQqjEty/J1pLk6AZKQxRgChCzHBPNrR901l1MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8TGDGpn; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8TGDGpn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761179800; x=1792715800;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tbyz0EOwOY6fjz8bsCF+rgeu3HZ1GWxhkU2Mfg5zCrY=;
  b=U8TGDGpnvB0EieqemQ0AmMNr2OR8Wav2T6lalbXme0uB+G7MUPu0hpv9
   xa3asEdoFJpguoGRzKGos3RFzuNvksssCg21ezZ/2RyGvCeI5exkGdbAX
   IxxltgzZGNx+vkdjy+v8KeXA1cROOnB4ildI65uDeAExZ1QAKivC5F7ri
   pNlXPDmSSXHdHQPwSSFwsVOGKu5YWrJ2fXVqeFQqv7npTYOwK/7t18WeI
   1E3G420Em71Z5MBygDcljMTITXFbNLPjyL3gU3TxDu4rL4OKA/epbrLEp
   YtsTv80XtqPQgf6pzOIEudreVoaJDj8jySfDcosjLkCQRf8sl2P0/1P/q
   Q==;
X-CSE-ConnectionGUID: ZMMDpg+TR1We6iI/t407Jw==
X-CSE-MsgGUID: XmojRzCyRwi9FpVKgcrVGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63043801"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63043801"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 17:36:40 -0700
X-CSE-ConnectionGUID: QoGETW7NQ8izRDTJnc1Jzw==
X-CSE-MsgGUID: wb7s2b+8TJSpn0NZLbsWfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="221206028"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Oct 2025 17:36:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBjJg-000Crd-1b;
	Thu, 23 Oct 2025 00:36:32 +0000
Date: Thu, 23 Oct 2025 08:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v2 4/5] rust: id_pool: do not immediately acquire new ids
Message-ID: <202510230839.DJZaY5US-lkp@intel.com>
References: <20251021-binder-bitmap-v2-4-e652d172c62b@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-binder-bitmap-v2-4-e652d172c62b@google.com>

Hi Alice,

kernel test robot noticed the following build errors:

[auto build test ERROR on 211ddde0823f1442e4ad052a2f30f050145ccada]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/rust-bitmap-add-MAX_LEN-and-NO_ALLOC_MAX_LEN-constants/20251021-213620
base:   211ddde0823f1442e4ad052a2f30f050145ccada
patch link:    https://lore.kernel.org/r/20251021-binder-bitmap-v2-4-e652d172c62b%40google.com
patch subject: [PATCH v2 4/5] rust: id_pool: do not immediately acquire new ids
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251023/202510230839.DJZaY5US-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230839.DJZaY5US-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230839.DJZaY5US-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: no method named `acquire_next_id` found for struct `Guard<'_, IdPool, SpinLockBackend>` in the current scope
   --> rust/doctests_kernel_generated.rs:6515:20
   |
   6515 |         match pool.acquire_next_id(0) {
   |                    ^^^^^^^^^^^^^^^ method not found in `Guard<'_, IdPool, SpinLockBackend>`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

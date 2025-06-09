Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F8922A4FA;
	Mon,  9 Jun 2025 23:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749511399; cv=none; b=KdTUhTm75uQlbJs11N6Xa+k2AWj1YctmyxMZ0PO6hif697+xWAmFhoEYnipx8OR1KiXu/xYbDMxJrrCele+ZHz/LgcHkmOOoThXKqhB2svRaC2zZitmxASHjGn+3N4kwf76YpUub0cnk3O1K3ycsYuxtZc5KjJQLjnA1cE6xHY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749511399; c=relaxed/simple;
	bh=SodzVzd/dy3fVY28H5PbgVki2bKFD3jp9tNeLI1aFg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZgNhe2jgX94Ui3Fi5zhSOWUThEOnVQzUlLSCbkSnFWClxT7l0a1IJCQXHOCEutYQw7WFTR1l8tp/3CB3D5nsjEk6MUWxiivwRoLYQmm5X2uOaJRlZZfHqF2T3tzH0mElDCOwJKoLVNkhLRWLz7DsPl7RUGA19ICOkPG0dkZ0+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XszQCCjI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XszQCCjI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749511398; x=1781047398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SodzVzd/dy3fVY28H5PbgVki2bKFD3jp9tNeLI1aFg8=;
  b=XszQCCjIy9IXn6GfoHrawvM3XXauF5PyfDp3cQTJnkwCvHAs1iiNQOG5
   QGTJNEQ4stJd1dZvyBUy2EUPl6lFRhBqU4BuR+aLtuTwwUjHyzDtcz6gx
   xZVlJbucxK9hAG4ufeGSgYe2hh43G8kYtarNEOXcxBosnf1BxYK7BwrvW
   qypTaiPBZkDL8q31sL/8UzR7GYpORm7c/RWmHTaXODGmuckwIJTe3zLAk
   k1gRU7V8FKW9EN4Rw8+BiwoVtNyvcNWZapr03Vr69PyLkH8lZxmwu0jVx
   pya9P7OwDGIp2Gm6Nli3WT75hGeSwe3bOZlqgsjHBzgsYRnqXKuyVku9Q
   g==;
X-CSE-ConnectionGUID: SYVVtUvYSGq72RelQ9oDwg==
X-CSE-MsgGUID: ZIdHLox8Qk+0JeVGPK0DxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51594759"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="51594759"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 16:23:18 -0700
X-CSE-ConnectionGUID: hvrmWd1WTxiZ4LdyJauPwg==
X-CSE-MsgGUID: tm1WvLkSQJefGulOu2XGfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="151654521"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jun 2025 16:23:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOlpd-0007VJ-36;
	Mon, 09 Jun 2025 23:23:09 +0000
Date: Tue, 10 Jun 2025 07:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Benno Lossin <lossin@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH v4 6/6] rust: pci: add irq accessors
Message-ID: <202506100619.ZG8fk4Yz-lkp@intel.com>
References: <20250608-topics-tyr-request_irq-v4-6-81cb81fb8073@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608-topics-tyr-request_irq-v4-6-81cb81fb8073@collabora.com>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on e271ed52b344ac02d4581286961d0c40acc54c03]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Almeida/rust-irq-add-irq-module/20250609-065947
base:   e271ed52b344ac02d4581286961d0c40acc54c03
patch link:    https://lore.kernel.org/r/20250608-topics-tyr-request_irq-v4-6-81cb81fb8073%40collabora.com
patch subject: [PATCH v4 6/6] rust: pci: add irq accessors
config: x86_64-randconfig-005-20250610 (https://download.01.org/0day-ci/archive/20250610/202506100619.ZG8fk4Yz-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100619.ZG8fk4Yz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100619.ZG8fk4Yz-lkp@intel.com/

All errors (new ones prefixed by >>):

   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 20.1.2
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
>> error[E0425]: cannot find function `pci_irq_vector` in crate `crate::bindings`
   --> rust/kernel/pci.rs:409:49
   |
   409 |               let irq = unsafe { crate::bindings::pci_irq_vector(self.as_raw(), index) };
   |                                                   ^^^^^^^^^^^^^^ not found in `crate::bindings`
   ...
   443 | /     gen_irq_accessor!(
   444 | |         /// Returns a [`kernel::irq::Registration`] for the IRQ vector at the given index.
   445 | |         irq_by_index, Registration, Handler
   446 | |     );
   | |_____- in this macro invocation
   |
   = note: this error originates in the macro `gen_irq_accessor` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find function `pci_irq_vector` in crate `crate::bindings`
   --> rust/kernel/pci.rs:409:49
   |
   409 |               let irq = unsafe { crate::bindings::pci_irq_vector(self.as_raw(), index) };
   |                                                   ^^^^^^^^^^^^^^ not found in `crate::bindings`
   ...
   447 | /     gen_irq_accessor!(
   448 | |         /// Returns a [`kernel::irq::ThreadedRegistration`] for the IRQ vector at the given index.
   449 | |         threaded_irq_by_index, ThreadedRegistration, ThreadedHandler
   450 | |     );
   | |_____- in this macro invocation
   |
   = note: this error originates in the macro `gen_irq_accessor` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

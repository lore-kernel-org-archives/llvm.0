Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3E7A95E;
	Fri, 14 Nov 2025 01:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763083898; cv=none; b=Xtezx6Xd6pG+c8AIuq+seNHO34Xp6hsH3WjeDRNyqw5IQRhP+zYGubKZvhjr/mZYBuZjMh2kqcGYU3rQyaXyq7ZikuEsSb6wo54SafkrxVm9v8ZXvRyQzXCuNF2BT/MQz3JZb+awe5uCMBhSOhO4SlzNAR2epYVYrWQLCFHN/WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763083898; c=relaxed/simple;
	bh=laTZSKpJzP4Hut1iCExX/xDMmYB/9yAVHfLcQCjHzA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B32ABcwPc0+mEkGsWVxyKfv8oKSV3LDxI1HeVS+alRnGzqLodWp9BBcFbdUViyPRYU6BV07PVPIu7IQy7j/bh37cxycgoMdt9TDJUJ9HEyv64BF1W2cUvxL8oMmM+GuBzdsCUKvQ0wsYaAC0vhtQvipFiSdFd+mfQljdPmQ9ll8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYEdL5EI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYEdL5EI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763083897; x=1794619897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=laTZSKpJzP4Hut1iCExX/xDMmYB/9yAVHfLcQCjHzA0=;
  b=fYEdL5EIf4TUag/4IdZ1RxPkBhNdYoAClplB8efPbLa9Iu4iXh9cCKy7
   agmekIlfcavPe8YWRsE7g7PDp8KXfRE/ntxnQgRxeiPY6pIm8Gmw4eYxd
   Gn5xcb6aCA7pqgigO/ofUKlx8E0Iv53fPcnNQRfCaXsOjxVzvJJGZcoTN
   kIAaRwAWmJdEpExl/DVu/shjhgfpLzrnJqShiVoInU7QEKPqPPttM3YKj
   uPou4eWpQAFKFJUBx4dLkS5foOw+j0iAYvtJDxkTizg2qyzyp16Ri5yyX
   VlB4g6U4uuyC7LtRx95yihGF9gPzZC/hsEN1zHNii5tF0FZEY/Lv4/Psu
   w==;
X-CSE-ConnectionGUID: wk7BAnNBStScB+kPbdRz1w==
X-CSE-MsgGUID: DXX/VtFATTidZWeOU6Ed5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64381172"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="64381172"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 17:31:37 -0800
X-CSE-ConnectionGUID: v23CV3FPSGeHgBNJ8pI7BA==
X-CSE-MsgGUID: tuCFbmEuRKi5MadrhV504g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="190422879"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2025 17:31:31 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJiev-000631-1y;
	Fri, 14 Nov 2025 01:31:29 +0000
Date: Fri, 14 Nov 2025 09:31:27 +0800
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
Subject: Re: [PATCH v5 3/6] rust: bitmap: rename IdPool::new() to
 with_capacity()
Message-ID: <202511140825.Bbsm1dKT-lkp@intel.com>
References: <20251112-binder-bitmap-v5-3-8b9d7c7eca82@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-binder-bitmap-v5-3-8b9d7c7eca82@google.com>

Hi Alice,

kernel test robot noticed the following build errors:

[auto build test ERROR on 211ddde0823f1442e4ad052a2f30f050145ccada]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/rust-bitmap-add-MAX_LEN-and-MAX_INLINE_LEN-constants/20251112-205752
base:   211ddde0823f1442e4ad052a2f30f050145ccada
patch link:    https://lore.kernel.org/r/20251112-binder-bitmap-v5-3-8b9d7c7eca82%40google.com
patch subject: [PATCH v5 3/6] rust: bitmap: rename IdPool::new() to with_capacity()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251114/202511140825.Bbsm1dKT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140825.Bbsm1dKT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140825.Bbsm1dKT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   kernel/sched/sched.h:3743:18: warning: variable 'cpumask' set but not used [-Wunused-but-set-variable]
   3743 |         struct cpumask *cpumask;
   |                         ^
   1 warning generated.
>> error[E0425]: cannot find value `BITS_PER_LONG` in this scope
   --> rust/kernel/id_pool.rs:103:43
   |
   103 |         let num_ids = usize::max(num_ids, BITS_PER_LONG);
   |                                           ^^^^^^^^^^^^^ not found in this scope
   |
   help: consider importing one of these constants
   |
   7   + use crate::bindings::BITS_PER_LONG;
   |
   7   + use crate::uapi::BITS_PER_LONG;
   |
   7   + use bindings::BITS_PER_LONG;
   |
   7   + use uapi::BITS_PER_LONG;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

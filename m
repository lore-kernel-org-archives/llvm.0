Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC28939936D;
	Thu,  9 Jul 2026 07:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581457; cv=none; b=j0brIGh21lNPh3OUsEBi8HvYDFTY/6QJgq4Z7h+enqTzGxsJoq4ye/fnuIyR+Y0jV/p2NVvxDl6X/TXu7Y/OKPFFwzRiIt0fVe7Gjxvw5yZ75CcdYihA0na1yvwZmOO9586pelMpD4/xyV9i+5Ceef8RotfD3bY2zP8QGJZwoaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581457; c=relaxed/simple;
	bh=3uJPVOYFFByp5XYeV+VKrq6D2H+v3HXAPTE3FjbuUqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQQq4XCU31fzxont+dAGGHFYrrAJxSu1k7uxCqNGHXsrhLIHWcsx2kqbV2yDqR8DAuw0ZFoRlfTA9OMmkG8hevI7zHj1WCTxxVhK99S+XhqC08ZCrkf7PJOGqaPg9TWw/poLYJxqmYFZoU8vMQAbCIfOIofWyuALi0oLDLZlanw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B94WpBlo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B94WpBlo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783581455; x=1815117455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3uJPVOYFFByp5XYeV+VKrq6D2H+v3HXAPTE3FjbuUqk=;
  b=B94WpBloL6wfa/4qe0fhKupLphjJP7tCZDqXxN/zzCxb2JrcBFm3zSyo
   NKC8MCyszOkxq7Wf/FlycmSgyj3mfhTSb+4h8/scbX9NoaXgZa8r1vtke
   GJ9hpu0gRJrFc15uTLQyig5qE7KaHgdtAVxRdGxDPqWOZFkhxIYQbhtpw
   JvA6iNB67P+DdN2/JD3hrtJ5EzSiNsGFUULoYekHHKrU0MENbRil4XG6i
   HyKyvgFEzyEqnL/0w4Q5xsRtvCaJd+AxbSE+iJOV1etzjqxmpZLSycjHA
   F0HlTW1vJhaTCQWNMZH0F2UWeuMn5luIGmkcUGRVclAmnsYWyLZaxABUF
   w==;
X-CSE-ConnectionGUID: pozE6bqmSDyX/W+CAQRliA==
X-CSE-MsgGUID: IGENf08ZSjaPGCMDf4H3wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84132332"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84132332"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:17:34 -0700
X-CSE-ConnectionGUID: PViMM8NITLePp/f3rFYlFw==
X-CSE-MsgGUID: 6GoYpkNyRSaNNWTMaMJ4Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252757503"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 09 Jul 2026 00:17:28 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whj0e-00000000HNz-1eD1;
	Thu, 09 Jul 2026 07:17:24 +0000
Date: Thu, 9 Jul 2026 15:16:59 +0800
From: kernel test robot <lkp@intel.com>
To: FUJITA Tomonori <tomo@aliasing.net>, ojeda@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org, a.hindborg@kernel.org,
	acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
	gary@garyguo.net, lossin@kernel.org, tamird@kernel.org,
	tmgross@umich.edu, work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2] rust: bug: Add bug macro
Message-ID: <202607091512.wQmfg8U1-lkp@intel.com>
References: <20260709000103.2912159-1-tomo@aliasing.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709000103.2912159-1-tomo@aliasing.net>

Hi FUJITA,

kernel test robot noticed the following build errors:

[auto build test ERROR on dc59e4fea9d83f03bad6bddf3fa2e52491777482]

url:    https://github.com/intel-lab-lkp/linux/commits/FUJITA-Tomonori/rust-bug-Add-bug-macro/20260709-080347
base:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
patch link:    https://lore.kernel.org/r/20260709000103.2912159-1-tomo%40aliasing.net
patch subject: [PATCH v2] rust: bug: Add bug macro
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260709/202607091512.wQmfg8U1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091512.wQmfg8U1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091512.wQmfg8U1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:28:
   In file included from include/linux/cgroup_api.h:1:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
   |                                                   ~~~~~~~~~~ ^
   1 warning generated.
   In file included from rust/helpers/helpers.c:49:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
   |                                                   ~~~~~~~~~~ ^
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1 warning generated.
>> error[E0599]: no method named `as_char_ptr` found for reference `&ffi::CStr` in the current scope
   --> rust/kernel/bug.rs:94:53
   |
   94 |                     $crate::c_str!(::core::file!()).as_char_ptr(),
   |                                                     ^^^^^^^^^^^
   |
   ::: rust/kernel/lib.rs:220:5
   |
   220 |     crate::bug!();
   |     ------------- in this macro invocation
   |
   = help: items from traits can only be used if the trait is in scope
   = note: this error originates in the macro `$crate::warn_flags` which comes from the expansion of the macro `crate::bug` (in Nightly builds, run with -Z macro-backtrace for more info)
   help: trait `CStrExt` which provides `as_char_ptr` is implemented but not in scope; perhaps you want to import it
   --> rust/kernel/lib.rs:35:1
   |
   35 + use crate::str::CStrExt;
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

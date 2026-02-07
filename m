Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD5D2EC54D;
	Sat,  7 Feb 2026 05:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770440675; cv=none; b=nXqU47JjPgo6I3ipsz2p0yZnP/hgFyE4XdwS0GSTSdQRMnsRW4l0jVrby49kmcX1lRXXEjqUJqCFYU/EnfKA3wIsZ8xFJ41vS6NYBYyidYzufUoq5xbbGU9TqMXJPP+N/Wmuse/hB5KbLvu40QVvgSLNha9LymwQPb1RPFmrb2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770440675; c=relaxed/simple;
	bh=ngYaAqvtxnSUbIiuZTs7bVh1k+OObb19G2nulu3ITjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5ybdIFLl6DH7GmeGgkgodUccqbRb2s6hUvL6Fe5IXs1IoVshCZg80XOv6TFbytUzGLCUnCe0dwKzRZEFS9k6TqBY/YVX/oHQQNGxIr9AOccZJDJvqCJoPN/ChdIETjAPstZ4G6XyTAtPAsYJSzjwnPOXHmnLhry3I3COGnP828=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RRGNusUw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RRGNusUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770440676; x=1801976676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ngYaAqvtxnSUbIiuZTs7bVh1k+OObb19G2nulu3ITjQ=;
  b=RRGNusUwHzrFr634TQx/nmo248bWDX+qJXb+uXSnc3Qn70K8J20WYYNy
   T6H8kFwZFYozQIozutcYyS5idxN+2TMlIQ3jvuZDnkqtxjMNt8veMk6Ii
   jFVTjP1Q7E/TBxS7NlAIpTjfCfuM3OywD1ynQpgPXtOFFe3C/4rLg75VF
   u3S2m7pQsZkNq8gZPxaRQ4U3kfbKzWCWh+oGCzsUPp24AFFv6OPw/9igA
   PghHRMOlkHlJUFEU/3axmOa/TqDouCAP85YOvvwZyxjyYcHiPrGrhFkXQ
   g3VEDzC7fs+8kgy1S0iR16zBqMKsbDq7fwxFM5ZiHgek/gjBKl0K+JDSh
   Q==;
X-CSE-ConnectionGUID: 9lDPxHcmTtSUAJeNg3bYTg==
X-CSE-MsgGUID: 1t7gg/pzRliU5e6WSbyBfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71547747"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71547747"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 21:04:36 -0800
X-CSE-ConnectionGUID: AQ6xvpxDQgOxgrsduql4fA==
X-CSE-MsgGUID: F95+kT66TyiVclkjb3H2oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="215567363"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Feb 2026 21:04:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voaUd-00000000lOq-1wWT;
	Sat, 07 Feb 2026 05:04:27 +0000
Date: Sat, 7 Feb 2026 13:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Lameter <cl@linux-foundation.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH v2 11/11] rust: xarray: add preload API
Message-ID: <202602071349.6yvINDvm-lkp@intel.com>
References: <20260206-xarray-entry-send-v2-11-91c41673fd30@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-xarray-entry-send-v2-11-91c41673fd30@kernel.org>

Hi Andreas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 18f7fcd5e69a04df57b563360b88be72471d6b62]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Hindborg/rust-xarray-minor-formatting-fixes/20260207-051500
base:   18f7fcd5e69a04df57b563360b88be72471d6b62
patch link:    https://lore.kernel.org/r/20260206-xarray-entry-send-v2-11-91c41673fd30%40kernel.org
patch subject: [PATCH v2 11/11] rust: xarray: add preload API
config: arm64-randconfig-001-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071349.6yvINDvm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071349.6yvINDvm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071349.6yvINDvm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `kernel::mm::sheaf`
   --> rust/kernel/xarray.rs:33:9
   |
   33 |     mm::sheaf::{
   |         ^^^^^ could not find `sheaf` in `mm`
   |
   note: found an item that was configured out
   --> rust/kernel/mm.rs:22:9
   |
   22 | pub mod sheaf;
   |         ^^^^^
   note: the item is gated here
   --> rust/kernel/mm.rs:21:1
   |
   21 | #[cfg(not(any(CONFIG_SLUB_TINY, CONFIG_SLUB_DEBUG)))]
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> error[E0433]: failed to resolve: could not find `sheaf` in `mm`
   --> rust/kernel/xarray.rs:75:18
   |
   75 | impl kernel::mm::sheaf::KMemCacheInit<XArrayNode> for XArrayNode {
   |                  ^^^^^ could not find `sheaf` in `mm`
   |
   note: found an item that was configured out
   --> rust/kernel/mm.rs:22:9
   |
   22 | pub mod sheaf;
   |         ^^^^^
   note: the item is gated here
   --> rust/kernel/mm.rs:21:1
   |
   21 | #[cfg(not(any(CONFIG_SLUB_TINY, CONFIG_SLUB_DEBUG)))]
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

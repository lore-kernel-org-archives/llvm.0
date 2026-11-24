Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539264;
	b=cZeMSQcAoB8zweW2qI6BkcGjdoHNZnb1XNkUu/eYv1gz9Fs5RlA4+hE/DE+bNI+53Jr8
	 y2W7KOBJ+783ufKK96t595ij+t0iGN1xXFtj9rkEk0griFO2THs2KcnYzlrZ5LfXHzo+z
	 pDE3OpFSd02NN/RmqP+wO1U6BQJMRc0YKq9NCzPZZ2yO7CXl6Z7wR2q5LdR5+QutgjGnC
	 k1J2SF+g1s2t/Q+2DBqpat+ZkeT10CkHF0h7PgzVb1FDyYbh/99IV4AccTjAwn9mwCowh
	 XbqDtleq/poQgviLvvXpuJNxkN9ELvZo+x9gUtv65AGM9XKZdIOppuuBfpv7Ed4oRCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539264;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=CQq3cn5OTp7tCndSsmVZ6PwJT9jX22+B9CY0Yosdsx4=;
	b=HpAXtBEEsWdkOLGGQce+W4L5GW8yG/Z9DicSdQVX3sGpLCXMm5Y4bjhXp77Siv33Dvzp
	 lMs3JXkAeJZvUspYM2MpY0EEogSIMbFH+KXgnRDaChBuQJwTXSrZDntKbwQV4nqhgVPPf
	 DzulNZORVIqtIq7p16dtU9aOhrKCUxIDZI7e16eV5Ny256/l+uMXDcprgnP3FiawhTWVX
	 NXVMudgi7z/3KQJlSp84quyupjgc6WTCNf7y/v18uciyGWiVAcoJTm4miMY9ZRQxf1UKO
	 DIDWpihqOStYwaBpytjjJ6LqQwlcUfECu8R841fRBegkejxzS4jCETfqmfLJzsBot8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hq3Q7Te3;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB88606A333;
	Tue, 24 Nov 2026 16:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB88606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hq3Q7Te3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795539262; x=1827075262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cEnj9GUC9C0dZpOykEV7TDMrFtzJuotLx+ZqYNB/UEs=;
  b=hq3Q7Te3YSLAVqX5aEUlPpI36NLy0NdVv4KUtYRTxeB7bUGQ8BF4d/Vt
   H23Xs4oCPvI00VjQ4y39ytUyAgrRz9OEN4LZq4rD7pdzhQeswZvxiCZZL
   xZJK/ZC7pfd7c0q9q7IusMkFy6AXTuJOG9COgvBS9B1WGyA4MqoCy3c53
   R1uYPN6ok1hHI/xkC00WLPy4wLN+u8L0DqADB0dZ8HYN40zYWS5wiuLe/
   mG1QxUydFXdJSxwDmqXcN8WTBlXqVGeRgufLMliJzz5e+IqgSSLS+U1sK
   +PWCkmWkh9iKjXDdF/f1jIaC0x++oPNfnV4pijeeBSbq4zMO9fzInMP3t
   g==;
X-CSE-ConnectionGUID: Iwd+72x0Sdi1c0lWiNHFGg==
X-CSE-MsgGUID: BcpDfs0nSoGM+6QE6vQl7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4240338"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4240338"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 08:54:09 -0800
X-CSE-ConnectionGUID: vnpYnMGKSYeRsQ/M01NTNQ==
X-CSE-MsgGUID: GhG120cyQY+TVqu2ME3v0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11810537"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Nov 2026 08:54:04 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVtmL-00000001Pmw-0kfT;
	Tue, 24 Nov 2026 16:54:01 +0000
Date: Wed, 25 Nov 2026 00:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	"Liam R . Howlett" <liam@infradead.org>,
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org,
	Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
Subject: Re: [PATCH] rust: bug: add warn_once! macro
Message-ID: <20261125001602.y8fdKF1R-lkp@intel.com>
References: <20261124132707.101769-1-mbkchelofficialdev@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124132707.101769-1-mbkchelofficialdev@gmail.com>

Hi Ivan,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on akpm-mm/mm-everything linus/master v7.4-rc4 next-20261123]
[cannot apply to ah-configfs/configfs-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Tverdokhleb/rust-bug-add-warn_once-macro/20261124-152707
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20261124132707.101769-1-mbkchelofficialdev%40gmail.com
patch subject: [PATCH] rust: bug: add warn_once! macro
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20261125/20261125001602.y8fdKF1R-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125001602.y8fdKF1R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125001602.y8fdKF1R-lkp@intel.com/

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
   llvm-nm: error: rust/helpers/helpers.o: No such file or directory
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> error[E0425]: cannot find value `BUGFLAG_ONCE` in crate `$crate::bindings`
   --> rust/kernel/bug.rs:172:37
   |
   172 |                 | $crate::bindings::BUGFLAG_ONCE;
   |                                     ^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/mm/virt.rs:118:12
   |
   118 |         if crate::warn_once!(did_overflow || address < self.start() || self.end() < end) {
   |            ----------------------------------------------------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `crate::warn_once` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

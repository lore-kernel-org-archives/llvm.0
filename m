Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E177261F;
	Sun, 20 Jul 2025 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753014613; cv=none; b=bMxWveKeJnvskENAJVC2Xd5lcuXHw2JpCL2Zn4q5KShcG9NX7nyBfN/diOBOx+h4lifL5d4QsuT+i5epiZ/1pMAfPxLFBOl+oKKILA/+NqnD604VBZa400Sag9Zs7sZThcH7b6kZh0UtxQ+vYmyD0nZ2P/aRd46nGaXVcrwR9rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753014613; c=relaxed/simple;
	bh=Pi4SWubD7L9QbNR9J+qgTLLaeJVidEjGwCfMDjw9Lv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HkRj7OzSZpqhywlboai3Yf4yqIaJqiVGC9K4sn8GPLjYJoNPJIIer+4AZhqreLa3SsBH3i1OpLOeTksX2HH7km2r4T9ZcqRTCnUOwbVWlam8SRJ2wxgEhz/CYJaC5bbe0t9uhaNRK8JXZm8Yu68dV4zXMi83uB/1JCn0MoJCtaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IvbgZWDA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IvbgZWDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753014611; x=1784550611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pi4SWubD7L9QbNR9J+qgTLLaeJVidEjGwCfMDjw9Lv8=;
  b=IvbgZWDAFn8FgrCpT3scjkQtLVsmmRBOg2nYx8kR0mTUMGzDH+RsuKN7
   TZVTiLhD0wrASu4x7ycgFaz1Xy76xCXeMnnVO+1Zv8aPF0vxNAerB9zOP
   Zf4cHSu3jilR8mf/azNzSOPiFrV/AbDPEtT43QrXj94x/+7FHbKD6nunl
   Tl1liFYAO0LjG7AZW936dzybcc0rOZ2fsBaOusndxLtIuQQIwN6Hxk9i2
   iNiaXoeGKVH3ASNoDW0opbnPxOaF/cDzBHcZqXAn2M1vBXCUZx5P/T+sg
   epCYQpi7rmRjkV9TNq59ROFE9mqA+FXPkfYWAac7suvwhdxrDgHlOka/C
   Q==;
X-CSE-ConnectionGUID: uZ8bOQMCTpiRM60V943blA==
X-CSE-MsgGUID: iTS4obH4T8Coe8c/tORxng==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="72813838"
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="72813838"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 05:30:10 -0700
X-CSE-ConnectionGUID: vw7IUtZAQrmT/JKKal5jlg==
X-CSE-MsgGUID: oeCuXcGERV6qLi/nIMCYdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="158272059"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Jul 2025 05:30:08 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udTB7-000G65-2v;
	Sun, 20 Jul 2025 12:30:05 +0000
Date: Sun, 20 Jul 2025 20:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sidong Yang <sidong.yang@furiosa.ai>, Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org, Sidong Yang <sidong.yang@furiosa.ai>
Subject: Re: [PATCH 1/4] rust: bindings: add io_uring headers in
 bindings_helper.h
Message-ID: <202507202006.8ZnBwBsW-lkp@intel.com>
References: <20250719143358.22363-2-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719143358.22363-2-sidong.yang@furiosa.ai>

Hi Sidong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rust/rust-next]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v6.16-rc6 next-20250718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sidong-Yang/rust-bindings-add-io_uring-headers-in-bindings_helper-h/20250719-223630
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20250719143358.22363-2-sidong.yang%40furiosa.ai
patch subject: [PATCH 1/4] rust: bindings: add io_uring headers in bindings_helper.h
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250720/202507202006.8ZnBwBsW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250720/202507202006.8ZnBwBsW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507202006.8ZnBwBsW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: `extern` fn uses type `io_tw_state`, which is not FFI-safe
   --> rust/bindings/bindings_generated.rs:109725:28
   |
   109725 |     ::core::option::Option<unsafe extern "C" fn(req: *mut io_kiocb, tw: io_tw_token_t)>;
   |                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not FFI-safe
   |
   = help: consider adding a member to this struct
   = note: this struct has no fields
   note: the type is defined here
   --> rust/bindings/bindings_generated.rs:109642:1
   |
   109642 | pub struct io_tw_state {}
   | ^^^^^^^^^^^^^^^^^^^^^^
   = note: `#[warn(improper_ctypes_definitions)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

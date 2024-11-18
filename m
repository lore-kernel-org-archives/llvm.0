Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A2C13C9A6;
	Mon, 18 Nov 2024 06:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731912260; cv=none; b=kqhRG4K3FZ3182o7XSfDq209NUcijNrARE0hoKKLULhL53tBTUAHxlukK0x55tPdrdbM4omvMC1Hi4BzhOXMz+/t2pSnSpZjCKZ2WzSLNXjjN8Ed4jY43qEz112aa98GgDxEBdpprR/mfCb0H3Eep2WwynYKQReFz2bmJa3/4Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731912260; c=relaxed/simple;
	bh=N9W7+KEZ4I6K3vgSIQGNLoLtQ6G+UALTqB25PYXV5nE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RxCMbUzbRl7tEbAK+NOvlV02HrvLVC0Zw8YWwfCBXrGkG9Z3F41ospnzx6o9XSzgN2SdZhM45J0FPgBCT8v0t22ryPtDTqyzOqAy85qEkIb+QtrQLXtFQnSVPEQklok0AZeIS4jpqMfBOHNr1eB5VshPrjM5e76hbkT/PqUORZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MX+bdMT1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MX+bdMT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731912259; x=1763448259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N9W7+KEZ4I6K3vgSIQGNLoLtQ6G+UALTqB25PYXV5nE=;
  b=MX+bdMT1BXpZ+7xM9+Px2p+RcXLr1pEB+oyjbRPiQQJSs7VUC9aHmCq0
   Oel4u/E9IKXHZ9PyrMRS0BX+i5gChg1wmkvMy+7k9x8KmOOt6BxHlFNpR
   D0EppuBt2+LC/LiqT24klliMWZ0u+sjDM3UHfzWRqO0P5T27AyARyZdME
   S3CjmxVcgChiRxQn/ma+UhnVgKwixNGyA76XuTfmpSBIHrh/HAQ0FInZe
   3xVKyIPRecnJxzlNmUls0M2BbBJ11QkDYtryNSU+gLonQQRCtw67Lh9lI
   zA52p9GECB7Ej+NWbcmhdwoSR311ZFGvi7prBH9CqOKZ+A7ltdUZ3uZiX
   Q==;
X-CSE-ConnectionGUID: olVnnPmCT7uCljZ+UwaRag==
X-CSE-MsgGUID: +6h6CudhRByxKQxxYEFhmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31704099"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31704099"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 22:44:18 -0800
X-CSE-ConnectionGUID: 2pDzZl4vQNu6jYartFo/sA==
X-CSE-MsgGUID: oaNS8PuEQneDgkRiTy71Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="120077022"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Nov 2024 22:44:17 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCvUc-0002J3-17;
	Mon, 18 Nov 2024 06:44:14 +0000
Date: Mon, 18 Nov 2024 14:43:50 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>
Subject: [linux-next:master 8127/11989] error[E0308]: mismatched types
Message-ID: <202411181440.qEdcuyh6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   744cf71b8bdfcdd77aaf58395e068b7457634b2c
commit: 169484ab667788e73d1817d75c2a2c4af37dbc7f [8127/11989] rust: add arch_static_branch
config: um-randconfig-001-20241118 (https://download.01.org/0day-ci/archive/20241118/202411181440.qEdcuyh6-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181440.qEdcuyh6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181440.qEdcuyh6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0308]: mismatched types
   --> samples/rust/rust_print.rs:87:5
   |
   87 | /     kernel::declare_trace! {
   88 | |         /// # Safety
   89 | |         ///
   90 | |         /// Always safe to call.
   91 | |         unsafe fn rust_sample_loaded(magic: c_int);
   92 | |     }
   | |     ^
   | |     |
   | |_____types differ in mutability
   |       arguments to this function are incorrect
   |
   = note: expected raw pointer `*mut kernel::bindings::static_key`
   found raw pointer `*const kernel::bindings::static_key`
   note: function defined here
   --> rust/bindings/bindings_helpers_generated.rs:33:12
   |
   33 |     pub fn static_key_count(key: *mut static_key) -> core::ffi::c_int;
   |            ^^^^^^^^^^^^^^^^
   = note: this error originates in the macro `$crate::jump_label::static_branch_unlikely` which comes from the expansion of the macro `kernel::declare_trace` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69649207A16;
	Wed, 13 Nov 2024 21:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731532601; cv=none; b=DxduOU8UR/jM605Ifoa4hhsU/Mq0ATumbvHDaXAMZVPlTSHbfpOm8TbuLVCpkK770Gd6svJPLMYbASkqJSvfS1clPtr+aUGjlZM4eNRg5FLNTT/RLXLi6gB8BvBolVI3NF5cvm1o55ZKiECPrvN/2ogktZOi6VHSw94oh8Lv46Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731532601; c=relaxed/simple;
	bh=03wuwAMfX/K1xKI+KUwDaxJqXKn6A3vcvMH1wpG3UUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ebgEo7guQvfDWQ08+ZCz2f4ovqWKVhzhMaBIraLSNQHU9Ky0LnLNBc+I/jvH01cor4uyRhyZldmiOjvUrC/EZyxHchBQAqnkXQNxNB0jp5WvX7nJMIrO02GGL+oYRXv/8F2+zCb0XVRSOqOOo6Cie/b+FFlbMh9sRiYQ/rse/fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLa9xc8u; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLa9xc8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731532600; x=1763068600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=03wuwAMfX/K1xKI+KUwDaxJqXKn6A3vcvMH1wpG3UUc=;
  b=XLa9xc8uzDgUfT/5mk0I6U+YEC+wjt0QG6fQSg2A3JtoQkLOlTq+mQlz
   LWkh55sQPTaEb16LhA0/IVQ1wbBB3tdrRnfcUdAZ0oJa5eWstT2C0Q37E
   OIXwn6iuYT8Jrt3VINfovH/soDG4moZ7ht4MNjuNwv8HVpDDv7uRa1gNe
   n65MJOtQqxY5M1HC+CQiAXCFVT7Klb04NtFQ8PzUfVvYz/XfpJfrTvVCH
   pUeoRPS37S2qsXvcnAWIeYdGBqhk/7w6NhUaWKUiva9egQCjXxlf1GCIY
   DJo2qtyQMtf9gEnsNXptF7FeALiseTBDRMCl85KCNrkrj9MUHvsea7kDx
   Q==;
X-CSE-ConnectionGUID: gSexmyhNTUye/E0X0Unoiw==
X-CSE-MsgGUID: FDvQrdDWRjO+7fNKHoLS6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53990745"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53990745"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 13:16:38 -0800
X-CSE-ConnectionGUID: 4NGEhYoKTUeN/NmYf4faHQ==
X-CSE-MsgGUID: D/QV0AUFTfSQeTpmCMq9tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="93056463"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Nov 2024 13:16:37 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBKj4-0000j4-0I;
	Wed, 13 Nov 2024 21:16:34 +0000
Date: Thu, 14 Nov 2024 05:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [linux-next:master 8233/11277] error[E0425]: cannot find function
 `rust_do_trace_rust_sample_loaded` in crate `$crate::bindings`
Message-ID: <202411140520.VL33V6fD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bd05b9a700c10473c2f52bf12c5c5938c30e80b0
commit: 91d39024e1b02914cc5e2dbc137908e29b269ce4 [8233/11277] rust: samples: add tracepoint to Rust sample
config: x86_64-randconfig-013-20241113 (https://download.01.org/0day-ci/archive/20241114/202411140520.VL33V6fD-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140520.VL33V6fD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140520.VL33V6fD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `rust_do_trace_rust_sample_loaded` in crate `$crate::bindings`
   --> samples/rust/rust_print.rs:87:5
   |
   87 | /     kernel::declare_trace! {
   88 | |         /// # Safety
   89 | |         ///
   90 | |         /// Always safe to call.
   91 | |         unsafe fn rust_sample_loaded(magic: c_int);
   92 | |     }
   | |_____^ not found in `$crate::bindings`
   |
   = note: this error originates in the macro `kernel::declare_trace` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

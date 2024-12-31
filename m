Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6477156220;
	Tue, 31 Dec 2024 07:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735629371; cv=none; b=oweznaEnVg9Ec9xx7t7B7GIR6lr751XOT+PWfkK2cJl/23iOJmSfxvot38PnaYlBlC6M81I0WTaIqn/XgLeVEQyo03RgPFWPQxGMnvtJm2sX15ON1ln6LujNpcb6jrKsjJ13SOPIubPb8VADloTgjJ+Jg7xa2JfSFrzzyLX1kvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735629371; c=relaxed/simple;
	bh=fApJCHrn31Vh6fErbfPcRBxFjy0hahLbp7eKl4doSPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QWohowtDsFNcuMVTGxU21ie3gu1fESlOGbB4ILNJD6ECAyWc2n89GwRJN+VTmGdIynZDjoL1ETIm4PtZsAEmRtNVoZZlZUqnqltbjBVqZI6hPQIn3JuzR3Q5XuSX2qDQNtuyPxETNMxGKav/QROPG08fNLoA+v88o80qBuhHghY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUtHPsng; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUtHPsng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735629368; x=1767165368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fApJCHrn31Vh6fErbfPcRBxFjy0hahLbp7eKl4doSPM=;
  b=fUtHPsngR6nDuKekgcJX2ZihVOd+fxUD5NDGV1BR4cNccZfbFfEb1ob2
   1xBYYtM8spy+r+cqQ/9zF4OhFMnbc72EQS+WirVx7YKVFnQlFS0mvBnt+
   3FVPD+HV88lkgQ4EwySYGOIpMVp7CrlFD1ITTPdlI7ZdkCNmphDpI0Ee8
   pNsaJ0e63elX50I8o3AwT607Hbw1+6lZF5jH/VBZxtWgohIeW9lHbbTMY
   3xl/Z5vq16f8oirnoKuk6sfnpMykxLxf+LqW/qYc832W/NX+ZEaOiDrtr
   P0nW4wi4TogkMEMUoHFZ4AFNs0QLP/vFHd63p8UJ6ObTbZJTQDYMxtIxQ
   g==;
X-CSE-ConnectionGUID: L/o5X+GcRS+7C936LJ1sAQ==
X-CSE-MsgGUID: 0bPVI+lATLqLWRTdHfiycg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="38742412"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="38742412"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 23:16:08 -0800
X-CSE-ConnectionGUID: q2b2GBZfQ7uzWqvf0LmYoA==
X-CSE-MsgGUID: NpPDoN6DSsmsTm8kKDNs+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124274047"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Dec 2024 23:16:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSWU0-0006u6-2H;
	Tue, 31 Dec 2024 07:16:04 +0000
Date: Tue, 31 Dec 2024 15:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: error[E0425]: cannot find value `__tracepoint_rust_sample_loaded` in
 crate `$crate::bindings`
Message-ID: <202412311507.14xdiaIX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alice,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
commit: 91d39024e1b02914cc5e2dbc137908e29b269ce4 rust: samples: add tracepoint to Rust sample
date:   8 weeks ago
config: x86_64-buildonly-randconfig-001-20241230 (https://download.01.org/0day-ci/archive/20241231/202412311507.14xdiaIX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311507.14xdiaIX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311507.14xdiaIX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `__tracepoint_rust_sample_loaded` in crate `$crate::bindings`
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

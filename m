Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0DA3E2777;
	Fri,  2 Oct 2026 07:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925697; cv=none; b=GkGlKxWiYDT6J8kvfEdLL4f0JpDHmO2qKsE4Dg5VCN2HFJEmPG/vVomFEDlnL3wfbcXVy2X/E2AHDFNrgEcwM9GhroRCOXiBcMnNrB6m/7bCxFjBmYYh++7v9E6GC7L3MMIHDafsG2Qqr4EywlFq2Z2Jw6pnUpCowZfqA3mI1P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925697; c=relaxed/simple;
	bh=ZVYig8nm802AxMNxnT+x0fnP4NgcCxjn1L8bEbbnjDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MZ9KyNyT0MnEisTtTIdCbd5parGlVwSDVhxIylxo+xTQGXiv/yFrNkv/amHzcMaMOCzlHHAHwnk8PT9Y1afYOQ2O7qkF9M2ZLO/AaZ1uCRaB/j5m8Gf+6ByctHuSYJfkTCvgnAH72tXf33egZh+MRgjhEEAMmbL/Xu0oSQgbjrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXIf1ooc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXIf1ooc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790925696; x=1822461696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZVYig8nm802AxMNxnT+x0fnP4NgcCxjn1L8bEbbnjDM=;
  b=MXIf1oocU4k6AHqAMKNB+bwCUxQdEZyJXDBTOwvM7Y8cOs4RCfy9Ibcx
   KvFkeFRAMUBSWmEauXmLM4RvdVeXcyUAM0ZWc7gLWpHf3iN6buhzEW1t6
   dNtEyDQtZniafqsvxqwCoGEtg2FTwlUTQS05R4pD3HnKsdDmn73ZvtUt5
   FRF2Er7NeUxEgqvqUGdRLg4O2OrbY6N+TPChE7Hmam09uQsBxzIg9pe9U
   Rkd3mZY2A6aAyya9N+w2rJYK89UtIWqQHlGle1DbI6NyD2qsPyecfIEcy
   cfWbtDHJ82wfv8JcNIabxWO2iEfwY6fXgyg0OR3R81WDvr8F19CpuT1rM
   g==;
X-CSE-ConnectionGUID: YEX9SKbhSf+q8pEsg9Xpxg==
X-CSE-MsgGUID: FP54dLqCTbm4/mNJ6uts6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102214037"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="102214037"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:21:36 -0700
X-CSE-ConnectionGUID: oKhN53pbQ46P8/YMVZoGHw==
X-CSE-MsgGUID: hjxUwJKuTkeAG7ogBvp92Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="279942327"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Oct 2026 00:21:34 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCXaF-00000000SjI-15r3;
	Fri, 02 Oct 2026 07:21:31 +0000
Date: Fri, 02 Oct 2026 15:21:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rust-dyndbg 15/15] error[E0277]: the
 `?` operator can only be used in a closure that returns `Result` or `Option`
 (or another type that implements `FromResidual`)
Message-ID: <202610021540.mJ8YCCMD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/rust-dyndbg
head:   e0f643bcb55eadaa7c1b9d23ea0569cf7b5377a8
commit: e0f643bcb55eadaa7c1b9d23ea0569cf7b5377a8 [15/15] rust: device: enable dynamic debug for dev_dbg!()
config: x86_64-buildonly-randconfig-1003-20261002 (https://download.01.org/0day-ci/archive/20261002/202610021540.mJ8YCCMD-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021540.mJ8YCCMD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021540.mJ8YCCMD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0277]: the `?` operator can only be used in a closure that returns `Result` or `Option` (or another type that implements `FromResidual`)
   --> drivers/gpu/nova-core/firmware/gsp.rs:77:79
   |
   77 |             dev_dbg!(dev, "loaded gsp firmware v{}\n", tlv.get_string(b"VERS")?);
   |                                                                               ^ cannot use the `?` operator in a closure that returns `()`
   |
   ::: rust/kernel/dynamic_debug.rs:227:72
   |
   227 |         $crate::dynamic_func_call!($crate::__format_string!($($arg)+), || {
   |                                                                        -- this function should return `Result` or `Option` to accept `?`
--
>> error[E0277]: the `?` operator can only be used in a closure that returns `Result` or `Option` (or another type that implements `FromResidual`)
   --> drivers/gpu/nova-core/firmware/booter.rs:100:36
   |
   100 |             tlv.get_string(b"VERS")?
   |                                    ^ cannot use the `?` operator in a closure that returns `()`
   |
   ::: rust/kernel/dynamic_debug.rs:227:72
   |
   227 |         $crate::dynamic_func_call!($crate::__format_string!($($arg)+), || {
   |                                                                        -- this function should return `Result` or `Option` to accept `?`
--
>> error[E0277]: the `?` operator can only be used in a closure that returns `Result` or `Option` (or another type that implements `FromResidual`)
   --> drivers/gpu/nova-core/firmware/fsp.rs:53:75
   |
   53 |         dev_dbg!(dev, "loaded fsp firmware v{}\n", tlv.get_string(b"VERS")?);
   |                                                                           ^ cannot use the `?` operator in a closure that returns `()`
   |
   ::: rust/kernel/dynamic_debug.rs:227:72
   |
   227 |         $crate::dynamic_func_call!($crate::__format_string!($($arg)+), || {
   |                                                                        -- this function should return `Result` or `Option` to accept `?`
--
>> error[E0277]: the `?` operator can only be used in a closure that returns `Result` or `Option` (or another type that implements `FromResidual`)
   --> drivers/gpu/nova-core/firmware/fwsec/bootloader.rs:129:36
   |
   129 |             tlv.get_string(b"VERS")?
   |                                    ^ cannot use the `?` operator in a closure that returns `()`
   |
   ::: rust/kernel/dynamic_debug.rs:227:72
   |
   227 |         $crate::dynamic_func_call!($crate::__format_string!($($arg)+), || {
   |                                                                        -- this function should return `Result` or `Option` to accept `?`
--
>> error[E0277]: the `?` operator can only be used in a closure that returns `Result` or `Option` (or another type that implements `FromResidual`)
   --> drivers/gpu/nova-core/firmware/riscv.rs:36:36
   |
   36 |             tlv.get_string(b"VERS")?
   |                                    ^ cannot use the `?` operator in a closure that returns `()`
   |
   ::: rust/kernel/dynamic_debug.rs:227:72
   |
   227 |         $crate::dynamic_func_call!($crate::__format_string!($($arg)+), || {
   |                                                                        -- this function should return `Result` or `Option` to accept `?`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

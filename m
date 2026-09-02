Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAD4244667;
	Wed,  2 Sep 2026 04:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788323170; cv=none; b=ryX+E3tylBABCX4sG093gYQ2E4lyFEX5jrqkd3XvION4i3ZtHDJZzA3dhnvrw4v43/ILEbrJHjAC8mPshrn6ZwCeUxXbq//+W54Tl1Q9qr9BlME5gz+ihd6F2ReaoHbeP//RPgwFl2fC6yUq8xLDaKybMJS12rzRqrOSDNvYMp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788323170; c=relaxed/simple;
	bh=zP5ZhSowRPGpYmdA5e0K7FfoiqjOee59uTTP7+S95/E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oushKtuf7/jscbNGy/WfDpgjWvc9Cnh9IddcxxEQp25hwxykeaeAEsqL60OU1TCKUJNnwLoKFBUS0fjd0BZ0ECXa91lW/HNE98vQcyrad0U48Nvc/oFyhDgjFZpB54GlJsUCcrc+7VuTXuu6sS89ExMSgDgvVK8Pu4GQRH1KZY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LwAe4tXR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwAe4tXR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788323168; x=1819859168;
  h=date:from:to:cc:subject:message-id;
  bh=zP5ZhSowRPGpYmdA5e0K7FfoiqjOee59uTTP7+S95/E=;
  b=LwAe4tXRMeG+Z1vYgRV8av5sBVg5f2aIvOBuWjck8RVWFf9ugzGb/5Rp
   d6VjA8TnTxPkLiwFOkaPaXjBmiOXf+pFU/rjibLBc5qIxEzO56o5dm8Ic
   MQL6+UUErdA74e45QbnKLQE1/niob5ISkKyf3/oY6bEAfMRIGTEspJT8V
   oEPn0QjraAhY+VvTSfz0DB5Um+dsxVHw8BfiLU44EwA8IAzxjsRWYXrtG
   5/acn0hNB3p/cbIZaZQ3/lUtq+H6mcO74bfecXRNodLwGUqktaapzZMkZ
   yVygJuozXvDGGz9unAaDmcZO0zViJwmCK6zDjgcgorljdg0QB4EGyW081
   Q==;
X-CSE-ConnectionGUID: hRE+meeCRi2jgnJ4uqi8Xg==
X-CSE-MsgGUID: NMSBsp1DS2iKnDTn6egI5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="92640257"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="92640257"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 21:26:07 -0700
X-CSE-ConnectionGUID: yLrpXmBMRDaaprGAvCgVSQ==
X-CSE-MsgGUID: GBynp4FiQMGyI9I6gbhz1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="263154834"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Sep 2026 21:26:05 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1cXy-000000001zC-1Mf9;
	Wed, 02 Sep 2026 04:26:02 +0000
Date: Wed, 02 Sep 2026 12:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 38/79] error[E0425]: cannot find
 type `Registration` in module `soc`
Message-ID: <202609021217.1vnDmN5r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   e793b14f66e33b70363166d84886d82d462f1987
commit: 12df0d4caf19584f993989efdfd00fc7d8f9b1cf [38/79] rust: soc: apple: rtkit: Add Apple RTKit abstraction
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260902/202609021217.1vnDmN5r-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609021217.1vnDmN5r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609021217.1vnDmN5r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find type `Registration` in module `soc`
   --> samples/rust/rust_soc.rs:21:20
   |
   21 |     _dev_reg: soc::Registration,
   |                    ^^^^^^^^^^^^ not found in `soc`
   |
   help: consider importing one of these structs
   |
   5 + use crate::soc::bus::Registration;
   |
   5 + use kernel::auxiliary::Registration;
   |
   5 + use kernel::cpufreq::Registration;
   |
   5 + use kernel::driver::Registration;
   |
   = and 5 other candidates
   help: if you import `Registration`, refer to it directly
   |
   21 -     _dev_reg: soc::Registration,
   21 +     _dev_reg: Registration,
   |
--
>> error[E0422]: cannot find struct, variant or union type `Attributes` in module `soc`
   --> samples/rust/rust_soc.rs:58:29
   |
   58 |             let attr = soc::Attributes {
   |                             ^^^^^^^^^^ not found in `soc`
   |
   help: consider importing one of these structs
   |
   5 + use crate::soc::bus::Attributes;
   |
   5 + use kernel::soc::bus::Attributes;
   |
   help: if you import `Attributes`, refer to it directly
   |
   58 -             let attr = soc::Attributes {
   58 +             let attr = Attributes {
   |
--
>> error[E0433]: cannot find `Registration` in `soc`
   --> samples/rust/rust_soc.rs:68:34
   |
   68 |                 _dev_reg <- soc::Registration::new(attr),
   |                                  ^^^^^^^^^^^^ could not find `Registration` in `soc`
   |
   help: consider importing one of these structs
   |
   5 + use crate::soc::bus::Registration;
   |
   5 + use kernel::auxiliary::Registration;
   |
   5 + use kernel::cpufreq::Registration;
   |
   5 + use kernel::driver::Registration;
   |
   = and 5 other candidates
   help: if you import `Registration`, refer to it directly
   |
   68 -                 _dev_reg <- soc::Registration::new(attr),
   68 +                 _dev_reg <- Registration::new(attr),
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

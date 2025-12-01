Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F0436D50A;
	Mon,  1 Dec 2025 20:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764620498; cv=none; b=WB6njZ41vpKB3K1isSzpLp1j7whwOuub0hq0TMe27De+xmJ2UmNEH9HynJNIjjVKl3592o5EawXLKfhW3PMMeSIPtM41NDDx+spwP4Y0DWs5Z3tw+LTtRBau185YCL5exPyaoEZs2QfmhRDoenbP8Tct/vKahAQgZ6IiHN5sixg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764620498; c=relaxed/simple;
	bh=62lh+tbV3n/nhaIWuR60JUPQpx285BxC2pJgdd+LAaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GiBBejrfYjSSrQwXuPv4nSN6sIy1tWY+I0EC+0U6kGQkAaCkTgFdFb0tR7iXlxjn9lALXlgvZcCDLdTMpTD3Cbcukj8L066RgAgsq48FA7ppj1pji4Kjxy09KXj4Yj1m+16PzCe6Rwo9JeEdP9/rOp9Cs6nJgIUfzkSYsVpgaXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpkjSkBO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpkjSkBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764620496; x=1796156496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=62lh+tbV3n/nhaIWuR60JUPQpx285BxC2pJgdd+LAaE=;
  b=OpkjSkBOkqjpFsU4YwkQc4ZddtiZ4ggVNmBHQ0D3g1HGJWmNpclkk2Sl
   /oB9UVG9iCb6G8b75WXYA7rNYx/hsk6OfrtPxRPonOiSEcaS/Yp1v6qEm
   HQfRBGmPdm/dnwUg+661HeHtdRUpzKPaeFrirognzYGuWNSpOiPyRwyNi
   tKGfl5mpIZ9oOEnAm/oqd+KCvlQAlKq7PcT1wKG+qomUIdk5HU26KEej+
   9FgDowcPtlneLQApGENnns5D8Yq1AbPxn3iHXbe0h32xAslSHR+86pPBE
   86X7bIaJdG4n2Oz8xgOoG3xO1eHEGo/3Ob7lgnfkuWQdAB11pX2DXmQOm
   g==;
X-CSE-ConnectionGUID: UoLu0MUMTq2PmhcpRv8wrw==
X-CSE-MsgGUID: vkyo6FVZQFO7AM6MMCcqNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70189421"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="70189421"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 12:21:35 -0800
X-CSE-ConnectionGUID: C+2Hj+sZRum+J0i0L1lpUw==
X-CSE-MsgGUID: crN4YeCvQvu4nw2tW/GB1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="224867858"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Dec 2025 12:21:34 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQAOp-0000000096r-1GFw;
	Mon, 01 Dec 2025 20:21:31 +0000
Date: Tue, 2 Dec 2025 04:20:58 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Gomez <da.gomez@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Subject: [linux-next:master 4752/13171] error[E0609]: no field
 `__bindgen_anon_1` on type `bindings::kernel_param`
Message-ID: <202512020454.Tf36WHw5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andreas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 0b08fc292842a13aa496413b48c1efb83573b8c6 [4752/13171] rust: introduce module_param module
config: arm64-randconfig-001-20251202 (https://download.01.org/0day-ci/archive/20251202/202512020454.Tf36WHw5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020454.Tf36WHw5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020454.Tf36WHw5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `__bindgen_anon_1` on type `bindings::kernel_param`
   --> rust/kernel/module_param.rs:78:46
   |
   78 |         let container = unsafe { &*((*param).__bindgen_anon_1.arg.cast::<SetOnce<T>>()) };
   |                                              ^^^^^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

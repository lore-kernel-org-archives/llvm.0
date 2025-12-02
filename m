Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361BE17BB35;
	Tue,  2 Dec 2025 01:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764639412; cv=none; b=bl1KlfUl/nvLkQGIztwDZnae4EcIsvw2eh6wY+vV3TRfJ/u5ds1ylldxOy3oXn9OkaZt56XDwReVurSPwsYg49E2dz2Ydfmh4RiD+PQmOmmoFGO7QrlTqbcUYGnsIj5Jdx3qt3cic/W+RW3DOZtY8sBqGFzHmGV10jN/O/HfRFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764639412; c=relaxed/simple;
	bh=27XcZDmASTOQMb7AFYNSzFc1U4hkGPeaQgYZWKiuj/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bbj00y4lpStDMHXM2kmCNPZGZ2pRJbOlnsVi7Tiyqfy6JGdDWIL9JOtQ2WghZy1lkUhcjPkundWpdGK1xUnX9GwBVSWO6qoNEzfW9MkNeJAGU6b3Wyv8vB9h7qnNlaE0E2w520rgdOonfPaoDXC1MAj9x5d+f95/XrKYJl1t+z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WBeE07Ti; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WBeE07Ti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764639411; x=1796175411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=27XcZDmASTOQMb7AFYNSzFc1U4hkGPeaQgYZWKiuj/c=;
  b=WBeE07TipbB2/5iUoErcYOJH65y8tbhbYxv2d23Sn0EeMDGcexnjs8OP
   3mMysp3wzX9+OzKRB8tGrMxRu36pmwbdcM3ys35YAdLMtjTGcN97zijcG
   jlZ2zYv0EQAwUaec73lNWhVWyJAEkS/5IIGZvsf6T/zgRzg+rG2/HR96N
   8DVQ9QQV2FAqTekkNIYW5/poxB4PxP7rQ9JvOu0EvFJVmiIZZRrnjfr3A
   E9DdC7ci0FmoptoyBGyx+hrtiOwHA9GmDnCk2AYMzrixP1vaIJsHYfUxy
   hdrWFm2kZhnAFIS8wsmof2eZTbi2+3AQIqvMbIuR91Pjnm8eLD3gdMuzL
   Q==;
X-CSE-ConnectionGUID: 9F3NdgFFT6G4bN7GMZtG7g==
X-CSE-MsgGUID: HKb/ECpURu6K1YlBJMGqVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="89243219"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="89243219"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 17:36:50 -0800
X-CSE-ConnectionGUID: AYRg98eERTG41VclPD6q0g==
X-CSE-MsgGUID: EjO2WWCLSxiRSfXmjNQivQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194108781"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Dec 2025 17:36:49 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQFJu-000000009If-3yiT;
	Tue, 02 Dec 2025 01:36:46 +0000
Date: Tue, 2 Dec 2025 09:36:42 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Danilo Krummrich <dakr@kernel.org>
Subject: [linux-next:master 8986/13171] error[E0609]: no field `type_` on
 type `i2c_board_info`
Message-ID: <202512020925.2CUjcAsA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Igor,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: f3cc26a417b77a07ff4418f7621dd318a1c533b1 [8986/13171] rust: i2c: add manual I2C device creation abstractions
config: arm64-randconfig-001-20251202 (https://download.01.org/0day-ci/archive/20251202/202512020925.2CUjcAsA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020925.2CUjcAsA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020925.2CUjcAsA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `nr` on type `i2c_adapter`
   --> rust/kernel/i2c.rs:390:35
   |
   390 |         unsafe { (*self.as_raw()).nr }
   |                                   ^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `type_` on type `i2c_board_info`
   --> rust/kernel/i2c.rs:444:28
   |
   444 |             i2c_board_info.type_[i] = src[i];
   |                            ^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `addr` on type `i2c_board_info`
   --> rust/kernel/i2c.rs:448:24
   |
   448 |         i2c_board_info.addr = addr;
   |                        ^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

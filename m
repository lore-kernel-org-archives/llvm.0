Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF83D3C465;
	Fri, 21 Nov 2025 00:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763685346; cv=none; b=t1DdmttlY7InIAZONeYOrdVhzZZ25A3iUWqlWWg3frupcaOTWjGt62wir4I1dS+dO0y9cmwQE349/XXc4aqlv322XuV7NtVnJC8BgLQdUmRbjSu1RGPhGSsGpQAhr9W5QqcsfPiXERDztpSBJatSmG+h88TM0O2XYlCBavlPYDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763685346; c=relaxed/simple;
	bh=L/eS9F58uaJgAc7ZQ36NadBkDM4ggHGaukZ+oaZQaqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Be8+aV5DJoqEX7L1lc8t4BalFfH3YDUmC4LWgdkbRhpMcby1ZCGysLeJz/IZxE0MAvRJpNozidgexhKpK2kuHkwXkC8D/vhCSZgnduA7teXVETYl76hRvMf6CGeA3HSmnWOk6fgKKP8rCkL3idPfWSXFDYk0goCu53clZUojUhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKCUFYdA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKCUFYdA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763685345; x=1795221345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L/eS9F58uaJgAc7ZQ36NadBkDM4ggHGaukZ+oaZQaqE=;
  b=SKCUFYdAYulTGTm/POUygP+hN3H/7MeP1zgJ3smJ3Um7yctW/cc1KZJp
   EV4i2mYe5A2VEovqMckYatA2z9rXSV6k9mRctIDKYjR0nNvur7wg8HtBh
   0obM3M+U42O0W6K82Fffnq0TfmoPh5t/YseEheC9tdURs+Ghzbpu5+RPA
   7hb5yXYr0ve5E1sjX/iA9Kzdm1rpUhCFrGyMpSHbeEa0GxYZ2WxQBuN/e
   6LZIcX3kbFktZmHh4KqQvHzavUUfN4UwkNnzT1z9tjj4w6tzKWGIGNSvt
   fXkzZKCIeoopFr8tuFj4+X7leQuy3WkaXc0cHK7f9TpVMnONDYNnprzkE
   w==;
X-CSE-ConnectionGUID: JMkOIdeQQ++6OQUl5b+t7w==
X-CSE-MsgGUID: d8xyLMgXSsKrJp8pBDpU0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69387913"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="69387913"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:35:44 -0800
X-CSE-ConnectionGUID: s2KDm1qCRi2he/MukdwbSg==
X-CSE-MsgGUID: 1k+gm3MyRumFxSWs0dpdfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="214892313"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Nov 2025 16:35:43 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMF7k-0004lP-1N;
	Fri, 21 Nov 2025 00:35:40 +0000
Date: Fri, 21 Nov 2025 08:34:45 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Danilo Krummrich <dakr@kernel.org>
Subject: [linux-next:master 9316/10599] error[E0609]: no field `type_` on
 type `i2c_board_info`
Message-ID: <202511210849.7WWIzNvA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
commit: f3cc26a417b77a07ff4418f7621dd318a1c533b1 [9316/10599] rust: i2c: add manual I2C device creation abstractions
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511210849.7WWIzNvA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210849.7WWIzNvA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210849.7WWIzNvA-lkp@intel.com/

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

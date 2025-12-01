Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EB02749C1;
	Mon,  1 Dec 2025 21:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764626263; cv=none; b=fJ9chjrFzP1J7FgeotLsFqmfUs5OMcjl+fd3F+WZcUZU573mDt6e6GNZuqPQE0G0MCH13W/Ovw78WSb0NiYX6hjY60c5sRyTtPkgZgvM8fAmO3jfPccVrARSPOQps6mIFMNGSJ+9V7/XH7tpiNFnLb/PXCjeDj0qs5p1ejex9vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764626263; c=relaxed/simple;
	bh=1xEw1RdK+EOTQf2hWr0lnGFfNrxYDNEMBYWyOASag50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dOa1b1eMNcNXw9K8P9H1+2vAhDEqAodHPd79gpQ2SBd1fd/UTRjHpVAKWvr+RB++GnAbds3AZ3VAKpoV5x/pLWF6/Z2Qc6bme/vLWN85BSniYwbOLiIxcWUGWWVEcBtLIKrfPRUYyP8TlVW0i/foIyZtxmVImk3Fngw7fZeYcCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nnqmp3GG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nnqmp3GG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764626261; x=1796162261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1xEw1RdK+EOTQf2hWr0lnGFfNrxYDNEMBYWyOASag50=;
  b=Nnqmp3GGg1LY6Pgw4cvmydptqCeVpUYInzBWi0tWayF5qUJWSD8Qi5Hs
   n5m6WdxYUV3bwwDP1OZwcwLFVf0HG7tgq6EzIGvtnwu6SR0Z9M7gFa5Og
   Dl/g5sNgvbFNlgCkGQV11pN7Eue9tp4gYt49g7+dSisVgG0F7BCFc0vA6
   aAljPd3AQ7dCqweYj8NzP5R4gTf0KLC1a1GbiSLVOySQkljJsLEfXRaKB
   KJAeI4rEFCHY9dHIzazPkeSc8wCdihD9hRIDogiNgxiQ+z0Y2pLb8WBve
   vu852CMBFh5EUzfaUr1XP1jt9neKAqLqw7MAMhpLRQgGxM/uLGj+FWG2N
   g==;
X-CSE-ConnectionGUID: bt7ENLfBRpyXTMbprsBdBg==
X-CSE-MsgGUID: ERhSUEZJQgist/scj/a1qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="89228604"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="89228604"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 13:57:41 -0800
X-CSE-ConnectionGUID: G2oBo9fvR+mqLIw10gwxSw==
X-CSE-MsgGUID: qVFB5utsQmGFZZEbzTcfxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194018675"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Dec 2025 13:57:39 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQBtn-000000009B1-3VpI;
	Mon, 01 Dec 2025 21:57:35 +0000
Date: Tue, 2 Dec 2025 05:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-next:master 4056/13171] error[E0609]: no field `p` on type
 `bindings::device`
Message-ID: <202512020510.Fsn6vGmt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Danilo,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 6f61a2637abe4f89877da3280775565baedb60e0 [4056/13171] rust: device: introduce Device::drvdata()
config: arm64-randconfig-001-20251202 (https://download.01.org/0day-ci/archive/20251202/202512020510.Fsn6vGmt-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020510.Fsn6vGmt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020510.Fsn6vGmt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `p` on type `bindings::device`
   --> rust/kernel/device.rs:206:49
   |
   206 |         let private = unsafe { (*self.as_raw()).p };
   |                                                 ^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `p` on type `bindings::device`
   --> rust/kernel/device.rs:291:49
   |
   291 |         let private = unsafe { (*self.as_raw()).p };
   |                                                 ^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

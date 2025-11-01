Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657BF299AAC;
	Sat,  1 Nov 2025 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761982577; cv=none; b=a8gI3BMw1KbrM/Te83lZidBLLOqSDRaaxvbxjYLrooXIEx7F9BLEkrQSiv4UiENxBeL/eFzuEXO9xQ2ubRF8VS1RiRpb+RteE3NkweuXqzsIn0iHEBi7S5APf+rHf3nTtW81/Y0gaNBUbewBjKTXFEl01L4eJMyOo2x0M2N/W9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761982577; c=relaxed/simple;
	bh=2VdscPC7pHDwv0/PiRnBKewiLHLlkoj22vBUnc0cpXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IaQIcuZPIGmsiJ0kh/VDKlYwU7lJDocM54+Y7A2Avxo9LRH4Av9RtBfkgGqxJijNARLKkFq618aDkv3ZLgKekw5m4qUGgotlXFRaauZ3phJrM/vTTldKXy/ghQVHPwwXCQYbEykq4F98+/VLkwvLb7XmWKb27KqVbP84eB0zjMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m3n8Qvqk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m3n8Qvqk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761982575; x=1793518575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2VdscPC7pHDwv0/PiRnBKewiLHLlkoj22vBUnc0cpXs=;
  b=m3n8QvqkUiWfuMmWLboG8kBxO7OHnlVE2V0BOsHNrXgS+WDqUCA/Y+R/
   Sx5YCCxvNX0CzVa71bGPi4Y3ykuhrwp6kXUT1rl/bZmxKDOJ/57Acj3tr
   AJvP/AtClGYFQl4DKZsKKMQD5Ddf2Ef2a5dEBIljQOHHUGcmrf/9xt0FP
   EjlYGHh0vtjyj9/kDH97htynJ0M/zW0qSFstwc4X3Jr3bk7rdwQr3qOTG
   rAwGVYAxtiCM88i7lpnZO6EsGlJkqQllUG2rXIhfjBxa61kkQlSwuxSbY
   19oyBlYLhQCcNvrZvbiO2KVtQ7iO0fpCs8zzGPd+D1DNqbQm0EgPmnq0f
   g==;
X-CSE-ConnectionGUID: AHzB+nAYSe6LUGGNmP25qw==
X-CSE-MsgGUID: 4+lZzUgtSOyjXyX4OnDcbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64176295"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="64176295"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 00:36:09 -0700
X-CSE-ConnectionGUID: 2wZYMgcDTG6ACTMrPwVJ8A==
X-CSE-MsgGUID: b5y0npAAQJmutDCAcYhFlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="190761705"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Nov 2025 00:36:08 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF69d-000O00-27;
	Sat, 01 Nov 2025 07:36:05 +0000
Date: Sat, 1 Nov 2025 15:35:47 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Simon Horman <horms@kernel.org>
Subject: drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c:3938:28: error: no
 member named 'ixgbe_dbg_adapter' in 'struct ixgbe_adapter'
Message-ID: <202511011546.mIG3y3Pt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michal,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba36dd5ee6fd4643ebbf6ee6eefcecf0b07e35c7
commit: 641585bc978e0a1170ca8f12fbb1468b3874a2db ixgbe: fwlog support for e610
date:   7 weeks ago
config: powerpc-skiroot_defconfig (https://download.01.org/0day-ci/archive/20251101/202511011546.mIG3y3Pt-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cc271437553452ede002d871d32abc02084341a8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011546.mIG3y3Pt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011546.mIG3y3Pt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c:3938:28: error: no member named 'ixgbe_dbg_adapter' in 'struct ixgbe_adapter'
    3938 |                 .debugfs_root = adapter->ixgbe_dbg_adapter,
         |                                 ~~~~~~~  ^
   1 error generated.


vim +3938 drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c

  3931	
  3932	int ixgbe_fwlog_init(struct ixgbe_hw *hw)
  3933	{
  3934		struct ixgbe_adapter *adapter = hw->back;
  3935		struct libie_fwlog_api api = {
  3936			.pdev = adapter->pdev,
  3937			.send_cmd = __fwlog_send_cmd,
> 3938			.debugfs_root = adapter->ixgbe_dbg_adapter,
  3939			.priv = hw,
  3940		};
  3941	
  3942		if (hw->mac.type != ixgbe_mac_e610)
  3943			return -EOPNOTSUPP;
  3944	
  3945		return libie_fwlog_init(&hw->fwlog, &api);
  3946	}
  3947	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

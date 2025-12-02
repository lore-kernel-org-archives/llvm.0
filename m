Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1C726D4DE;
	Tue,  2 Dec 2025 08:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764665534; cv=none; b=KMClMy8TCw5WnNhF8ZgNR81mmyEz8eEc9yyXtjS6d86VvHBVtXwYeKdAxRXuUsqBX4kKkv2JwJQJZio+Db3qYf7sSGxmRjCaSXwRK9rNk1/RiJs56P5fk8JBCCf2F3m+aFb7HkC1vQkhw/kmUFmiQGKExUzawlXv+GxNuZhvjZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764665534; c=relaxed/simple;
	bh=hNJlp1YnV9WDSnxJuKoKcvZBziCiBD1vpLxA5P4iOQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OQztkQ5pMwe4x7uJeyhtsuiPtcQq1FtPauDwy6fBAf0rpgst3axTyn6K9LOjO2cSZm/7Sa/GEWjgjCSu1Sz+Q22IQH6TrCpam2hmHv5P+Zs8VO7iisPCgTho+kytmT/9qxWseKF9FYw1sJARRbmomGChkJRUhTKwjIHUaHH8YfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IwGRk8Gy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IwGRk8Gy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764665533; x=1796201533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hNJlp1YnV9WDSnxJuKoKcvZBziCiBD1vpLxA5P4iOQM=;
  b=IwGRk8GyHd8dZInlS8qk8b/n/GILhdmW/5Bn45psJoupZn/VQcJL5bNH
   oWKTbho6DJRstxS2hWS3WpCClh22D4A92ENEgggYdaJ5pyGmMiEpJ1oV1
   Af25zLggJxBMWEjo6kSJKEHHps708QiwamgGu9RLjRXaElSdKszQPWtbu
   7nuhja8Tdub2VTbp9z068K0N7zBape4OGVjXGT+7LOGi3phdw8Maz/f6q
   78kbfrXMH49JxTiQRAlFbvqypn+3+o+UPn++26wv5XCxH6pPmc+rnGXvF
   0JRkrY2ishQElCHkBeqSMRjhL5WnBy/ZUhPvVcphUIF1+eQBe7dTFIzt6
   g==;
X-CSE-ConnectionGUID: u7PAdQBiTUiNnNfJXeFEWw==
X-CSE-MsgGUID: ApcWInNpT6OOvmhF7bBeTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65811175"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="65811175"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 00:52:13 -0800
X-CSE-ConnectionGUID: 8ZpJYAuMT8mFD3xOXACW1g==
X-CSE-MsgGUID: MwcCbNjKTyuKA8ZD/xuxng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="217660587"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Dec 2025 00:52:11 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQM7F-000000009by-06XX;
	Tue, 02 Dec 2025 08:52:09 +0000
Date: Tue, 2 Dec 2025 16:51:17 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [linux-next:master 12362/13055] drivers/i3c/device.c:272:61:
 warning: shift count >= width of type
Message-ID: <202512021644.lp8ZMSx5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47b7b5e32bb7264b51b89186043e1ada4090b558
commit: 256a21743d911f94ce92fe28f793cd586f3860b2 [12362/13055] i3c: Add HDR API support
config: i386-buildonly-randconfig-004-20251202 (https://download.01.org/0day-ci/archive/20251202/202512021644.lp8ZMSx5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021644.lp8ZMSx5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021644.lp8ZMSx5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i3c/device.c:272:61: warning: shift count >= width of type [-Wshift-count-overflow]
     272 |         return i3c_dev_get_master(dev->desc)->this->info.hdr_cap | BIT(I3C_SDR);
         |                                                                    ^~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   1 warning generated.


vim +272 drivers/i3c/device.c

   261	
   262	/**
   263	 * i3c_device_get_supported_xfer_mode - Returns the supported transfer mode by
   264	 *					connected master controller.
   265	 * @dev: I3C device
   266	 *
   267	 * Return: a bit mask, which supported transfer mode, bit position is defined at
   268	 *	   enum i3c_hdr_mode
   269	 */
   270	u32 i3c_device_get_supported_xfer_mode(struct i3c_device *dev)
   271	{
 > 272		return i3c_dev_get_master(dev->desc)->this->info.hdr_cap | BIT(I3C_SDR);
   273	}
   274	EXPORT_SYMBOL_GPL(i3c_device_get_supported_xfer_mode);
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

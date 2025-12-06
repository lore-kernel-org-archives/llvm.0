Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8578D1CAA4;
	Sat,  6 Dec 2025 17:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765042255; cv=none; b=fO8HX4U/NaICVdD81siqkrelMzbne1dlYkB/L6inOk35jN+i22HyJkeCNvmWKS9OO4lMDprVMrqmP9br5DV1IboBnUBnJ/he7S7uXAl8HmtINtONxQUnDwyN7WIeRei9uV3BPhvL6u0QWQGyN6eZurVaQ2tGQ7LsnD3U5CrDsU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765042255; c=relaxed/simple;
	bh=T18aWWdZTngWVNtBdYSKeMJUvnQR0k7j+qIp6d94sr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qIurPIJh2q2Kn+2OxdRNoUofEylhXuCpeF/3OktuiKEPUULa5Wwuo6uuU0HAybwPKor/Mms5Awkq8adu0v8GC5IRYsg+ukFe0iI2f8xJZPWdhStjdYT7UeabWU0lKGuYEao1rnC2bupIGHW2S2covQDWE7zwkco/wanOHH69xOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izZLU08T; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izZLU08T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765042253; x=1796578253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T18aWWdZTngWVNtBdYSKeMJUvnQR0k7j+qIp6d94sr8=;
  b=izZLU08TgTV2E28XDVQ7fKYza0MKmiRi/eGzOnox0bG0bNxRdRSkQl3S
   scyouOMVEPTC4VQ3g1rIwNQDRq4T+9QVcEVSdFJhfPp6UNajPfpP3fiyZ
   ei+2u6j00HHH+zOhzZuo00rWWcvNGE5O/wa8CA52Xs4HDTLW8S4MJ4z0M
   Z56Nrlsb0n1ygwCrHhgBS3W0FLzB8+Q9qcBdZ5CIhcZqX52g2px3koFN5
   0o/l8OyTWhGHE5WsnTXNBCytXdSv02WlD5OUskWgPYB013ohOs7HTC8pl
   PbCe8uD+YiUc1/RGkNHHNZh5qY1tZuGWgAzPtLarUrD2I6Psv6OK748cO
   w==;
X-CSE-ConnectionGUID: c/e/Hia5TnyDpVd6dmNUGg==
X-CSE-MsgGUID: +NW/k1EcSlu8+8170HdBVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67086275"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="67086275"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 09:30:51 -0800
X-CSE-ConnectionGUID: tXeUKYbpSdqvXKVT92cVIA==
X-CSE-MsgGUID: av038Gd1RCCAamJXRbkf6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="194616260"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Dec 2025 09:30:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRw7L-00000000IbX-0Ese;
	Sat, 06 Dec 2025 17:30:47 +0000
Date: Sun, 7 Dec 2025 01:30:17 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>, David Wei <dw@davidwei.uk>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [cilium:pr/netkit-iouring7 2/12] net/core/netdev_queues.c:75:28:
 error: passing 'const struct net_device *' to parameter of type 'struct
 net_device *' discards qualifiers
Message-ID: <202512070112.EoZMs8hu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-iouring7
head:   49e30646c2932aa37daeb4edc45b82d3e0c72bf3
commit: 3064e035c5cf344cbcc324173a049f464cd6e69e [2/12] net: Implement netdev_nl_queue_create_doit
config: x86_64-randconfig-001-20251206 (https://download.01.org/0day-ci/archive/20251207/202512070112.EoZMs8hu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512070112.EoZMs8hu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512070112.EoZMs8hu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/netdev_queues.c:75:28: error: passing 'const struct net_device *' to parameter of type 'struct net_device *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      75 |         if (xsk_get_pool_from_qid(dev, idx)) {
         |                                   ^~~
   include/net/xdp_sock_drv.h:299:42: note: passing argument to parameter 'dev' here
     299 | xsk_get_pool_from_qid(struct net_device *dev, u16 queue_id)
         |                                          ^
   1 error generated.


vim +75 net/core/netdev_queues.c

    67	
    68	bool netdev_queue_busy(const struct net_device *dev, int idx,
    69			       struct netlink_ext_ack *extack)
    70	{
    71		if (netdev_rx_queue_leased(dev, idx)) {
    72			NL_SET_ERR_MSG(extack, "Lease device queue is already leased");
    73			return true;
    74		}
  > 75		if (xsk_get_pool_from_qid(dev, idx)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

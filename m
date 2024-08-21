Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ACC14D2B1;
	Wed, 21 Aug 2024 19:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724267939; cv=none; b=j1fCQh3HlxXHLmZQJyHNT4kg+eEH5sarCeXU6cV6uH0AVcbIcII7NLTKvdgmZO7p4laH/wiHJHRu/H7SSn4hTbrbPnAFltpHLICb4RuFu1ExPpv9gHioPQ1JSW4gAZhRn5ATYVsfFcrql6EZHutyI3jrl2oAhZR6KynOVGOIisw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724267939; c=relaxed/simple;
	bh=/HGn/HgpYHGtVC6vfSV8eUlIobosvrnFmtrlKUaogSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XF5UfbAqR0rpuwTLGiIpRLruvy/qV2vgkxEKyWtiPZH9qbAWT32ipdWtSxfPf+ZI+LGPipPM4rAmr1pNHWaEb2JNms0bItHSH50FJ61dTCB+zP6vVsrBpq674cnQl3VhxXnmjQwQw2gx+XGqJpTDzEtC2bci71M7N0aFOCR149k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKks3S9P; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKks3S9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724267937; x=1755803937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/HGn/HgpYHGtVC6vfSV8eUlIobosvrnFmtrlKUaogSc=;
  b=UKks3S9P9aeZNyX/xiTeVri/zwr7pv7wIcWIXDpAtjxAaViymudS+Htr
   vpBEvq3rV+V0C268Z7vdbvVoPF7U+GApournWoCF1SJU28O4jilb93bYZ
   r/ni7dMiKKwJAW10/yP6BAancFuRBo/VpCubqxUN97+F/jFRkrYIvD5WU
   jo3kMnvWejQ9wDXKJBBqHtq/OQ67p/4kOUVO8r9B7P6241IqFOjvIVHIB
   fNXm/l7Q5fVFlK2UlOeODfvfaebUG4nOp8HBWhzI+1MJAQgsaCGjpNeLu
   hzOGBh3Lf5j3VSzbB6moSwg7HuXLjz217AnTbWNgJu2NByJqVZ8+js46T
   w==;
X-CSE-ConnectionGUID: 8KTyne+mR5WLged7DxHbtA==
X-CSE-MsgGUID: HXMlZRUnQ8euTXLYgNWC+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26403426"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="26403426"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 12:18:56 -0700
X-CSE-ConnectionGUID: FgUeWDQISHiAdL3I5GF6RQ==
X-CSE-MsgGUID: 57gFyWUZQ52FJCMd7D+Q/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="66071041"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Aug 2024 12:18:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgqr7-000BrG-00;
	Wed, 21 Aug 2024 19:18:53 +0000
Date: Thu, 22 Aug 2024 03:18:36 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Guralnik <michaelgur@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH rdma-next 6/7] RDMA/nldev: Add support for RDMA monitoring
Message-ID: <202408220229.aRX7ynjF-lkp@intel.com>
References: <20240821051017.7730-7-michaelgur@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821051017.7730-7-michaelgur@nvidia.com>

Hi Michael,

kernel test robot noticed the following build errors:

[auto build test ERROR on rdma/for-next]
[also build test ERROR on linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Guralnik/RDMA-mlx5-Check-RoCE-LAG-status-before-getting-netdev/20240821-131236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/20240821051017.7730-7-michaelgur%40nvidia.com
patch subject: [PATCH rdma-next 6/7] RDMA/nldev: Add support for RDMA monitoring
config: i386-randconfig-003-20240821 (https://download.01.org/0day-ci/archive/20240822/202408220229.aRX7ynjF-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408220229.aRX7ynjF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220229.aRX7ynjF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/infiniband/core/device.c:45:
>> include/rdma/rdma_netlink.h:120:33: warning: declaration of 'struct ib_device' will not be visible outside of this function [-Wvisibility]
     120 | int rdma_nl_notify_event(struct ib_device *ib, u32 port_num,
         |                                 ^
>> drivers/infiniband/core/device.c:1360:29: error: incompatible pointer types passing 'struct ib_device *' to parameter of type 'struct ib_device *' [-Werror,-Wincompatible-pointer-types]
    1360 |         ret = rdma_nl_notify_event(device, 0, RDMA_REGISTER_EVENT);
         |                                    ^~~~~~
   include/rdma/rdma_netlink.h:120:44: note: passing argument to parameter 'ib' here
     120 | int rdma_nl_notify_event(struct ib_device *ib, u32 port_num,
         |                                            ^
   drivers/infiniband/core/device.c:1369:30: error: incompatible pointer types passing 'struct ib_device *' to parameter of type 'struct ib_device *' [-Werror,-Wincompatible-pointer-types]
    1369 |                 ret = rdma_nl_notify_event(device, port,
         |                                            ^~~~~~
   include/rdma/rdma_netlink.h:120:44: note: passing argument to parameter 'ib' here
     120 | int rdma_nl_notify_event(struct ib_device *ib, u32 port_num,
         |                                            ^
   drivers/infiniband/core/device.c:1520:23: error: incompatible pointer types passing 'struct ib_device *' to parameter of type 'struct ib_device *' [-Werror,-Wincompatible-pointer-types]
    1520 |         rdma_nl_notify_event(ib_dev, 0, RDMA_UNREGISTER_EVENT);
         |                              ^~~~~~
   include/rdma/rdma_netlink.h:120:44: note: passing argument to parameter 'ib' here
     120 | int rdma_nl_notify_event(struct ib_device *ib, u32 port_num,
         |                                            ^
   drivers/infiniband/core/device.c:2227:24: error: incompatible pointer types passing 'struct ib_device *' to parameter of type 'struct ib_device *' [-Werror,-Wincompatible-pointer-types]
    2227 |                 rdma_nl_notify_event(ib_dev, port, etype);
         |                                      ^~~~~~
   include/rdma/rdma_netlink.h:120:44: note: passing argument to parameter 'ib' here
     120 | int rdma_nl_notify_event(struct ib_device *ib, u32 port_num,
         |                                            ^
   1 warning and 4 errors generated.
--
   In file included from drivers/infiniband/core/iwpm_msg.c:34:
   In file included from drivers/infiniband/core/iwpm_util.h:50:
>> include/rdma/rdma_netlink.h:120:33: warning: declaration of 'struct ib_device' will not be visible outside of this function [-Wvisibility]
     120 | int rdma_nl_notify_event(struct ib_device *ib, u32 port_num,
         |                                 ^
   1 warning generated.


vim +1360 drivers/infiniband/core/device.c

  1353	
  1354	static void ib_device_notify_register(struct ib_device *device)
  1355	{
  1356		struct net_device *netdev;
  1357		u32 port;
  1358		int ret;
  1359	
> 1360		ret = rdma_nl_notify_event(device, 0, RDMA_REGISTER_EVENT);
  1361		if (ret)
  1362			return;
  1363	
  1364		rdma_for_each_port(device, port) {
  1365			netdev = ib_device_get_netdev(device, port);
  1366			if (!netdev)
  1367				continue;
  1368	
  1369			ret = rdma_nl_notify_event(device, port,
  1370						   RDMA_NETDEV_ATTACH_EVENT);
  1371			dev_put(netdev);
  1372			if (ret)
  1373				return;
  1374		}
  1375		return;
  1376	}
  1377	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

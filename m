Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C0D323D;
	Fri, 14 Jun 2024 01:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718327669; cv=none; b=KQSBg/kaYVgU+ErNDGlSNeaIhUWec0DW1GSTyLM7/WR01KuJCw/nn5zCjzIqeWCfQbOodeDzlAYiVoVEJFZCDFyIp6ftJoJKJ5FLOx+hza10TNCwc3zqjn6puWxHFjJ1tOyurb2RnhkpJ+gpDTYqbQ1mjlkYXoae81L/+ZSYo3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718327669; c=relaxed/simple;
	bh=8KfC9VFndm2twvD1DZSOT4YgBFoMsM0rh3VvPrRYA60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ShOHmmXiPQsEJHWreXsQbxXwFnid4b6pMpdUqgiQoWTxdjlrNpwZpQ382fEBIJ64TOZl2f1x9ignVCjtNfZy5skuRsC9ZuJ2a32l6svh/q+t1+HbRhNgBTwJ+RjlYqi45l3a5+7/YkihzoJJmHscYuXGOiZejjhZ/gKM+i4sO6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mfGhLtUY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mfGhLtUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718327667; x=1749863667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8KfC9VFndm2twvD1DZSOT4YgBFoMsM0rh3VvPrRYA60=;
  b=mfGhLtUYw142fkstsNje4P9IscQ5JcKbyqgqp2xM8HadpjjXBZcufMA+
   paJw1m2ijhJYIAEVxebD2W4M1j6SFHNGy6QEXNSmLvr3vOOJcaiJ9tiZ0
   SWIMmiCUoRdddfUXAez/dHIZTScpU0A2uQeCoPeGIwLLxqVJi+SvW8joL
   iuIosI1ydWFWHtjHJX/MBvHcnUzHR6Eeofu/A0/8MsJ65zVIjySURO6i4
   fM5t/SGRVJ6B/iNthsiOrrESS6c+aBotvlWVuwcuR9/I2urdZcuWdUpiS
   4h7cRqRoL7M7DhgS8bGEfbqh3XMj+DF0+1L7rjbHK/a7wmQ2rTp605cwz
   w==;
X-CSE-ConnectionGUID: /rqs3xpzT52+Tyidhkbk+A==
X-CSE-MsgGUID: Ll5wcR/ARn6kaC3+rpneEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26595996"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="26595996"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 18:14:26 -0700
X-CSE-ConnectionGUID: HxoAdzYcSXuX8YNxWxI+wA==
X-CSE-MsgGUID: XeAu3nBPTsyqqkxc87s0Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="45258237"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Jun 2024 18:14:24 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHvWH-0000cp-1O;
	Fri, 14 Jun 2024 01:14:21 +0000
Date: Fri, 14 Jun 2024 09:13:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Sai Krishna <saikrishnag@marvell.com>,
	Ahmed Zaki <ahmed.zaki@intel.com>,
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Subject: [tnguy-next-queue:dev-queue 52/84] ld.lld: error: undefined symbol:
 ptp_clock_register
Message-ID: <202406140913.c9jJ4gWg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   5f94b437aa6a1f7a19022db2b3524417ca06d232
commit: 709eab0aad17cbe55b6ffe6a9bab375640d9216a [52/84] iavf: add initial framework for registering PTP clock
config: i386-randconfig-016-20240614 (https://download.01.org/0day-ci/archive/20240614/202406140913.c9jJ4gWg-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406140913.c9jJ4gWg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406140913.c9jJ4gWg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ptp_clock_register
   >>> referenced by iavf_ptp.c:43 (drivers/net/ethernet/intel/iavf/iavf_ptp.c:43)
   >>>               drivers/net/ethernet/intel/iavf/iavf_ptp.o:(iavf_ptp_init) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: ptp_clock_unregister
   >>> referenced by iavf_ptp.c:97 (drivers/net/ethernet/intel/iavf/iavf_ptp.c:97)
   >>>               drivers/net/ethernet/intel/iavf/iavf_ptp.o:(iavf_ptp_release) in archive vmlinux.a
   >>> referenced by iavf_ptp.c:97 (drivers/net/ethernet/intel/iavf/iavf_ptp.c:97)
   >>>               drivers/net/ethernet/intel/iavf/iavf_ptp.o:(iavf_ptp_process_caps) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

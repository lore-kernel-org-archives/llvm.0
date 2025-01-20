Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACEB1EBFF0;
	Mon, 20 Jan 2025 18:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737396336; cv=none; b=nPMmGjIOPbdkWd+uOBUYbSyZlplO6aR/K4qnlH8DVMx8LCOOTNR3oF8Zcqlbkjs011+Z/C7a75o9w50kxxX7xM9A7oYaJt+3pO9Dzc+5p0vOGRrkjJ6WxmZP8oTIE1R/lKaOFeXEnnv5SaNhLnZYVMJRsU+P9L1cuIjQPrwyRZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737396336; c=relaxed/simple;
	bh=Yr2jZ8FMxjmsp9bVLjMEx6gPvAU0ztGYgh78NazUIHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jj34z3kN1sBKobwoO7ye3QLoKSHC0eXXv9pn/3A4mgBnBsDbp8T920qQuGMyfQrnNT2FZg7Jpsqs5GJ3Kc5eaXxmpx4UJidXZB5kpZ/SWCylEugCuPwIqmK23KI/0JBqyyDwrsbloIcsxGc3Z04TvRfZ/AbF5cSLZu72ZkiRx+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JT20wWrE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JT20wWrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737396335; x=1768932335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yr2jZ8FMxjmsp9bVLjMEx6gPvAU0ztGYgh78NazUIHY=;
  b=JT20wWrEY++aSVpDKGh+SrPlwfLJG/P3ES6sOsYoCRheBVRM8ph/+RGV
   BNlFbBllcblHysnEo9xxyeIqnTju6iEq9mwO2DdTB/3huEOM51tmmPjxc
   LlJlj/Z22vR55+RxWRs561xBl/q9Gmn4FfpWsyA9B85XY3xyPEA4JcTuY
   F8MWMJQEtFQlUdYXq6+/ww22Puy8xFJBiy6AZ6NJhHZGXD4VhcfWt0G+A
   XxH3xXen+P5ck8VFXNRPGWSNOX2GaRDS392ttbVOyT+dkq3wm+6ZEuxlx
   /e7iNWH1fX4qNZLCmnJCeog1Uf2G0wRkbVY5A0kYZQTtaMaTHvhqWaKJT
   A==;
X-CSE-ConnectionGUID: XyxEnc3KT7OjkMzMyjoh6g==
X-CSE-MsgGUID: vlRH/MdPRJKvIh7uiblAVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37676582"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="37676582"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 10:05:32 -0800
X-CSE-ConnectionGUID: Legl/rM8RHqpQ6Ec4268CA==
X-CSE-MsgGUID: RfOkbzX4Su+JzcQSgZslpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129861742"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Jan 2025 10:05:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZw9Q-000Wqc-0X;
	Mon, 20 Jan 2025 18:05:28 +0000
Date: Tue, 21 Jan 2025 02:05:17 +0800
From: kernel test robot <lkp@intel.com>
To: Rickard Andersson <rickard.andersson@axis.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [linux-next:master 9665/10024] drivers/mtd/ubi/cdev.c:854:7: error:
 cast to incomplete type 'typeof (ureq->erase_counters)' (aka 'int[]')
Message-ID: <202501210248.iDT47UZQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1573c8d4cb206a2d1454ff711e79f8df2353290b
commit: 01099f635a4c68b8574d350a972ba062dd5142e9 [9665/10024] ubi: Implement ioctl for detailed erase counters
config: riscv-randconfig-001-20250120 (https://download.01.org/0day-ci/archive/20250121/202501210248.iDT47UZQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210248.iDT47UZQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210248.iDT47UZQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mtd/ubi/cdev.c:854:7: error: cast to incomplete type 'typeof (ureq->erase_counters)' (aka 'int[]')
     854 |         if (!access_ok(ureq->erase_counters, (end_peb-req.start) * sizeof(int32_t)))
         |              ^
   arch/riscv/include/asm/uaccess.h:42:50: note: expanded from macro 'access_ok'
      42 | #define access_ok(addr, size) likely(__access_ok(untagged_addr(addr), size))
         |                                                  ^
   arch/riscv/include/asm/uaccess.h:33:2: note: expanded from macro 'untagged_addr'
      33 |         (__force __typeof__(addr))__untagged_addr_remote(current->mm, __addr);  \
         |         ^
   1 error generated.


vim +854 drivers/mtd/ubi/cdev.c

   830	
   831	static int ubi_get_ec_info(struct ubi_device *ubi, struct ubi_ecinfo_req __user *ureq)
   832	{
   833		struct ubi_ecinfo_req req;
   834		struct ubi_wl_entry *wl;
   835		int read_cnt;
   836		int peb;
   837		int end_peb;
   838	
   839		/* Copy the input arguments */
   840		if (copy_from_user(&req, ureq, sizeof(struct ubi_ecinfo_req)))
   841			return -EFAULT;
   842	
   843		/* Check input arguments */
   844		if (req.length <= 0 || req.start < 0 || req.start >= ubi->peb_count)
   845			return -EINVAL;
   846	
   847		if (check_add_overflow(req.start, req.length, &end_peb))
   848			return -EINVAL;
   849	
   850		if (end_peb > ubi->peb_count)
   851			end_peb = ubi->peb_count;
   852	
   853		/* Check access rights before filling erase_counters array */
 > 854		if (!access_ok(ureq->erase_counters, (end_peb-req.start) * sizeof(int32_t)))
   855			return -EFAULT;
   856	
   857		/* Fill erase counter array */
   858		read_cnt = 0;
   859		for (peb = req.start; peb < end_peb; read_cnt++, peb++) {
   860			int ec;
   861	
   862			if (ubi_io_is_bad(ubi, peb)) {
   863				if (__put_user(UBI_UNKNOWN, ureq->erase_counters+read_cnt))
   864					return -EFAULT;
   865	
   866				continue;
   867			}
   868	
   869			spin_lock(&ubi->wl_lock);
   870	
   871			wl = ubi->lookuptbl[peb];
   872			if (wl)
   873				ec = wl->ec;
   874			else
   875				ec = UBI_UNKNOWN;
   876	
   877			spin_unlock(&ubi->wl_lock);
   878	
   879			if (__put_user(ec, ureq->erase_counters+read_cnt))
   880				return -EFAULT;
   881	
   882		}
   883	
   884		/* Return actual read length */
   885		req.read_length = read_cnt;
   886	
   887		/* Copy everything except erase counter array */
   888		if (copy_to_user(ureq, &req, sizeof(struct ubi_ecinfo_req)))
   889			return -EFAULT;
   890	
   891		return 0;
   892	}
   893	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

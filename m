Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8806522EE9;
	Sun,  4 Feb 2024 16:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707063873; cv=none; b=WsylVSviaagqmPX3b0IRNIKCZVopL28sI5qzOaYyIIxhjNRJkqkl0yagKHykv95mM8Y+tb+gE810H9/LGg8/BRHPYqWba8RD2sEJp2fL5DqWEa5wLKKpnIHcr7CQWwv9thMzDvLnf0fFccc6UcwevxfTb/TbqJoCN3McOqsRUtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707063873; c=relaxed/simple;
	bh=f6q5963lnhRBU8bwQ82dCcLqxbFlqmg12jbvycEBKUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uWn5AUVx/AOmvC/DLqCzuhKyoW7KuVTikpFBZ5GEgrw4EPSKC+/BsoaIVrCfPo9cfytOTRa+pqG4rtXKIAhhTAlejHELgHWefV8lMxO6UtNalfs2lU7uH1MHqHvvaEOb68JVoH1MiGpQ5kWQczYMwWmP/JGRZd4GHhfg+zVDzjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oa0lbebo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oa0lbebo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707063871; x=1738599871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f6q5963lnhRBU8bwQ82dCcLqxbFlqmg12jbvycEBKUI=;
  b=Oa0lbeboKOfAYimAosgfUvLpvTm7LItlo/vUU/5fI3mJwn/6h6au+fuI
   XCihM7CezxQHYETW+bqVqNMUj4Cixib95BM4fqwMmn3vqmzFNkcgDWAMy
   kzyMyF6zY/cLJALfa5EwDmwJseXMBl7GF21MWXLis1AgilfgBs2rjr8/j
   eKktEKBGcFJbRq8AYa2bj5X2LcR9fA3QhghthCMBECIaDCmlS0m+ibfQf
   aKJB/CLLTAN2dhYC7K5YNPc8jBFUhrNMz6G2iotg9ASONjbOMDszLFdt0
   0J6Zi00DsxlW1hT/WHbgUVAAhacl4kHcTY8BbcD5dJu7zH8zrNHG85u+e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="22880884"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="22880884"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 08:24:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5135967"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 04 Feb 2024 08:24:28 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWfI5-0006VS-0v;
	Sun, 04 Feb 2024 16:24:22 +0000
Date: Mon, 5 Feb 2024 00:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tj-wq:wq-bh-v1 26/31] kernel/workqueue.c:1217:4: error: call to
 undeclared function 'raise_softirq_irqoff'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202402050054.QQ5snTVE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git wq-bh-v1
head:   3af70c858c44623c77be759d0809b7ae8ff09b26
commit: aec8a645378b508d17c2286276451d85d74bf1ec [26/31] workqueue: Implement BH workqueues to eventually replace tasklets
config: mips-vocore2_defconfig (https://download.01.org/0day-ci/archive/20240205/202402050054.QQ5snTVE-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402050054.QQ5snTVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402050054.QQ5snTVE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/workqueue.c:1217:4: error: call to undeclared function 'raise_softirq_irqoff'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           raise_softirq_irqoff(HI_SOFTIRQ);
                           ^
   kernel/workqueue.c:1217:25: error: use of undeclared identifier 'HI_SOFTIRQ'
                           raise_softirq_irqoff(HI_SOFTIRQ);
                                                ^
   kernel/workqueue.c:1219:25: error: use of undeclared identifier 'TASKLET_SOFTIRQ'
                           raise_softirq_irqoff(TASKLET_SOFTIRQ);
                                                ^
   3 errors generated.


vim +/raise_softirq_irqoff +1217 kernel/workqueue.c

  1197	
  1198	/**
  1199	 * kick_pool - wake up an idle worker if necessary
  1200	 * @pool: pool to kick
  1201	 *
  1202	 * @pool may have pending work items. Wake up worker if necessary. Returns
  1203	 * whether a worker was woken up.
  1204	 */
  1205	static bool kick_pool(struct worker_pool *pool)
  1206	{
  1207		struct worker *worker = first_idle_worker(pool);
  1208		struct task_struct *p;
  1209	
  1210		lockdep_assert_held(&pool->lock);
  1211	
  1212		if (!need_more_worker(pool) || !worker)
  1213			return false;
  1214	
  1215		if (pool->flags & POOL_BH) {
  1216			if (pool->attrs->nice == HIGHPRI_NICE_LEVEL)
> 1217				raise_softirq_irqoff(HI_SOFTIRQ);
  1218			else
  1219				raise_softirq_irqoff(TASKLET_SOFTIRQ);
  1220			return true;
  1221		}
  1222	
  1223		p = worker->task;
  1224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

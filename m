Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF25BBE49;
	Thu,  6 Feb 2025 01:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738806012; cv=none; b=OJ0XfCuNbz+2oq48KB5OYu01tG7WuvtxJDaKl8tdLYSTGYoKurw74642tAgFnhymc6MPW5/5vHzRMiX+PkNfh3RxCW4O88OdfsgFwfoon2X3iDYMs/FIQAiKxlYXyw9d8BOb00jN1CMWamDcQIusw6GrwrA9byxTJ/PNBKtJrL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738806012; c=relaxed/simple;
	bh=W9pDPPAcog5toBT+xp8jBBC7LxadDyj4qTaMyXUs+RU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F8ayfUfokLqxKB3V2xwfwzN9MFz41rNfBGQu9H/rQjdYKd0j8xZbGTNhCsAkHMO5Djuy49i4Uu06dJ9SPT4gNJkyiLRUxWBwofaIr91MMIViiE/cOpmtY7Q9whi4tTQfIf9sG9Iiv7w0w8BWEbFPKUqRk1a5hWYcNa3io+xTB38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfMB2mE2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfMB2mE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738806011; x=1770342011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W9pDPPAcog5toBT+xp8jBBC7LxadDyj4qTaMyXUs+RU=;
  b=nfMB2mE2+FLUw/uyis6XXdqeJkAcLEF9UNS0KfsDqqWHC3Ca5cHWGhKk
   dBmUCRwZYTLppJUKfusIr+PfjQ0kV+3D4zMXGQan4JBQtw4RLw3IvvoJA
   GwcXDr/rJOshBu16IuuLgsmmBgfOjEErQ4FWkwS7VhQxhxY3jW9WMHWIK
   7qemhUSOF0A1d6irOfDC32VC6FICqMKCOMrb9o6dVCFjum6fUNb9rU49I
   tt2LrQAPXlT5qCiZBkTjaLTH/0Z2mQZ8+iQmoLT4g+QJXlNAj9l346DJs
   KJVowttfyhJNz0Xq0jEuQy5RMSxGR7Z9elW81Ua+hTx28+/NoEVzxcni2
   g==;
X-CSE-ConnectionGUID: FwNxXyzZR2iqcavjsUEFUg==
X-CSE-MsgGUID: oaHbP5qFQyys6HJXacUmKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50015765"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="50015765"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 17:40:10 -0800
X-CSE-ConnectionGUID: vNi0daFcRla4hQroCidfkg==
X-CSE-MsgGUID: s8bWwbmXT5yxpWw8uSoU+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141949807"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Feb 2025 17:40:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfqsA-000wKn-20;
	Thu, 06 Feb 2025 01:40:06 +0000
Date: Thu, 6 Feb 2025 09:39:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [rcu:torture.2025.02.04a 1/10] kernel/rcu/rcutorture.c:1152:33:
 error: call to undeclared function 'get_torture_init_jiffies'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202502060904.wYhRuUph-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git torture.2025.02.04a
head:   7b4389d6456ab5bca223c6cd4829724d984c8511
commit: 65c7582d8315f7f0451eac635d803b2def726d44 [1/10] rcutorture: Add a test_boost_holdoff module parameter
config: i386-buildonly-randconfig-004-20250206 (https://download.01.org/0day-ci/archive/20250206/202502060904.wYhRuUph-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060904.wYhRuUph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060904.wYhRuUph-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/rcutorture.c:1152:33: error: call to undeclared function 'get_torture_init_jiffies'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1152 |         unsigned long booststarttime = get_torture_init_jiffies() + test_boost_holdoff * HZ;
         |                                        ^
   1 error generated.


vim +/get_torture_init_jiffies +1152 kernel/rcu/rcutorture.c

  1145	
  1146	static int rcu_torture_boost(void *arg)
  1147	{
  1148		unsigned long endtime;
  1149		unsigned long gp_state;
  1150		unsigned long gp_state_time;
  1151		unsigned long oldstarttime;
> 1152		unsigned long booststarttime = get_torture_init_jiffies() + test_boost_holdoff * HZ;
  1153	
  1154		if (test_boost_holdoff <= 0 || time_after(jiffies, booststarttime)) {
  1155			VERBOSE_TOROUT_STRING("rcu_torture_boost started");
  1156		} else {
  1157			VERBOSE_TOROUT_STRING("rcu_torture_boost started holdoff period");
  1158			while (time_before(jiffies, booststarttime)) {
  1159				schedule_timeout_idle(HZ);
  1160				if (kthread_should_stop())
  1161					goto cleanup;
  1162			}
  1163			VERBOSE_TOROUT_STRING("rcu_torture_boost finished holdoff period");
  1164		}
  1165	
  1166		/* Set real-time priority. */
  1167		sched_set_fifo_low(current);
  1168	
  1169		/* Each pass through the following loop does one boost-test cycle. */
  1170		do {
  1171			bool failed = false; // Test failed already in this test interval
  1172			bool gp_initiated = false;
  1173	
  1174			if (kthread_should_stop())
  1175				goto checkwait;
  1176	
  1177			/* Wait for the next test interval. */
  1178			oldstarttime = READ_ONCE(boost_starttime);
  1179			while (time_before(jiffies, oldstarttime)) {
  1180				schedule_timeout_interruptible(oldstarttime - jiffies);
  1181				if (stutter_wait("rcu_torture_boost"))
  1182					sched_set_fifo_low(current);
  1183				if (torture_must_stop())
  1184					goto checkwait;
  1185			}
  1186	
  1187			// Do one boost-test interval.
  1188			endtime = oldstarttime + test_boost_duration * HZ;
  1189			while (time_before(jiffies, endtime)) {
  1190				// Has current GP gone too long?
  1191				if (gp_initiated && !failed && !cur_ops->poll_gp_state(gp_state))
  1192					failed = rcu_torture_boost_failed(gp_state, &gp_state_time);
  1193				// If we don't have a grace period in flight, start one.
  1194				if (!gp_initiated || cur_ops->poll_gp_state(gp_state)) {
  1195					gp_state = cur_ops->start_gp_poll();
  1196					gp_initiated = true;
  1197					gp_state_time = jiffies;
  1198				}
  1199				if (stutter_wait("rcu_torture_boost")) {
  1200					sched_set_fifo_low(current);
  1201					// If the grace period already ended,
  1202					// we don't know when that happened, so
  1203					// start over.
  1204					if (cur_ops->poll_gp_state(gp_state))
  1205						gp_initiated = false;
  1206				}
  1207				if (torture_must_stop())
  1208					goto checkwait;
  1209			}
  1210	
  1211			// In case the grace period extended beyond the end of the loop.
  1212			if (gp_initiated && !failed && !cur_ops->poll_gp_state(gp_state))
  1213				rcu_torture_boost_failed(gp_state, &gp_state_time);
  1214	
  1215			/*
  1216			 * Set the start time of the next test interval.
  1217			 * Yes, this is vulnerable to long delays, but such
  1218			 * delays simply cause a false negative for the next
  1219			 * interval.  Besides, we are running at RT priority,
  1220			 * so delays should be relatively rare.
  1221			 */
  1222			while (oldstarttime == READ_ONCE(boost_starttime) && !kthread_should_stop()) {
  1223				if (mutex_trylock(&boost_mutex)) {
  1224					if (oldstarttime == boost_starttime) {
  1225						WRITE_ONCE(boost_starttime,
  1226							   jiffies + test_boost_interval * HZ);
  1227						n_rcu_torture_boosts++;
  1228					}
  1229					mutex_unlock(&boost_mutex);
  1230					break;
  1231				}
  1232				schedule_timeout_uninterruptible(HZ / 20);
  1233			}
  1234	
  1235			/* Go do the stutter. */
  1236	checkwait:	if (stutter_wait("rcu_torture_boost"))
  1237				sched_set_fifo_low(current);
  1238		} while (!torture_must_stop());
  1239	
  1240	cleanup:
  1241		/* Clean up and exit. */
  1242		while (!kthread_should_stop()) {
  1243			torture_shutdown_absorb("rcu_torture_boost");
  1244			schedule_timeout_uninterruptible(HZ / 20);
  1245		}
  1246		torture_kthread_stopping("rcu_torture_boost");
  1247		return 0;
  1248	}
  1249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

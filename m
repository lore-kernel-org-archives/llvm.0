Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D34A2D9494;
	Wed, 18 Feb 2026 01:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771376971; cv=none; b=CGX1ODTmGc6Q6diGHYbippo16Rsb5x3czvYkggQHY0ROLza2v2cypWdBixpYN3afvcvehniOyQWjESztGfriQhE/W7sK/oQjWSfxAJBkoWL5OJS95dt2A7bwm8sb1zOewPDaCulo7AqTYgr0KZpXJtMR0H/62VxWIiP1Fi5JKRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771376971; c=relaxed/simple;
	bh=L8fu7ZzHqON+aczOe2hKK8WB5l8RY6VsC8L7sLoEwkQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AoWcW+bGc4w1FIn9siL1cXaxOy6AgM4LxUzAUM4kydlw9VA5bDWTBT0nQ34Rqx/IohrbCn5mjdisn6bJC3G9m+i2Eu3zCrqNBdIiuSZmrpjOJzbnK8CQ5rdVZMqFkAtZzEbJ9NSY96qWvPTuFKWrx9Zhey3C8vmh+oxI2mncpwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Olr+SQr8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Olr+SQr8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771376970; x=1802912970;
  h=date:from:to:cc:subject:message-id;
  bh=L8fu7ZzHqON+aczOe2hKK8WB5l8RY6VsC8L7sLoEwkQ=;
  b=Olr+SQr8GExnSW0svE/aSG9R9luxC5Jys2YKHpk0leMN29orKN+TwIiU
   KvqkU/rP6Vu72KaH0BLTCU8eQ8qgWv3eUFtWJz/k6VpjWD3HwHS/WYzeb
   a40gAxv94l/BEG2S+S3MX/fHgNd6SkE4Yd3vGj1h+7sSde8nAczMqtYxE
   KfueGxv58hzdLIdg+wXGJLcxLwrEIBak7DtnnJyF2kDl7AXZppL82xGvw
   +UHNhIy/N/FqFOCutxIgxptoDCEx3M6K0GEhBmuREbdi4a3vUbl4bx71M
   euF8I8vknCNAPVANHq3VS0eB45asg5xs2+pUJnUApUYBUVB7icU/Uj4cx
   g==;
X-CSE-ConnectionGUID: MSB356ckQOiVIEuI1kHQBw==
X-CSE-MsgGUID: MhOY6NRtTrqp9YtbO6M31Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="60025889"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="60025889"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 17:09:28 -0800
X-CSE-ConnectionGUID: Liph7H2gTZO652xP4Enpkg==
X-CSE-MsgGUID: ch+zqYraSqCpG9QwK+OtBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="213142700"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Feb 2026 17:09:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsW4B-000000011ti-20ZV;
	Wed, 18 Feb 2026 01:09:23 +0000
Date: Wed, 18 Feb 2026 09:08:50 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Thomas Gleixner <tglx@kernel.org>, Juri Lelli <juri.lelli@redhat.com>
Subject: [tglx-devel:sched/hrtick 24/37]
 kernel/time/hrtimer.c:1279:6: error: use of undeclared identifier 'cpu_base'
Message-ID: <202602180922.bMUhjY2v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   1f963bc350a6fc3e2f217d3563f7a9b1bf12a49b
commit: 4ba259e7551f93452bf9b9c7d023686628b33904 [24/37] hrtimer: Avoid pointless reprogramming in __hrtimer_start_range_ns()
config: x86_64-randconfig-005-20260217 (https://download.01.org/0day-ci/archive/20260218/202602180922.bMUhjY2v-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180922.bMUhjY2v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180922.bMUhjY2v-lkp@intel.com/

Note: the tglx-devel/sched/hrtick HEAD 1f963bc350a6fc3e2f217d3563f7a9b1bf12a49b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> kernel/time/hrtimer.c:1279:6: error: use of undeclared identifier 'cpu_base'
    1279 |         if (cpu_base->in_hrtirq)
         |             ^
   1 error generated.


vim +/cpu_base +1279 kernel/time/hrtimer.c

  1222	
  1223	static bool __hrtimer_start_range_ns(struct hrtimer *timer, ktime_t tim, u64 delta_ns,
  1224					     const enum hrtimer_mode mode, struct hrtimer_clock_base *base)
  1225	{
  1226		struct hrtimer_cpu_base *this_cpu_base = this_cpu_ptr(&hrtimer_bases);
  1227		struct hrtimer_clock_base *new_base;
  1228		bool force_local, first, was_armed;
  1229	
  1230		/*
  1231		 * If the timer is on the local cpu base and is the first expiring
  1232		 * timer then this might end up reprogramming the hardware twice
  1233		 * (on removal and on enqueue). To avoid that prevent the reprogram
  1234		 * on removal, keep the timer local to the current CPU and enforce
  1235		 * reprogramming after it is queued no matter whether it is the new
  1236		 * first expiring timer again or not.
  1237		 */
  1238		force_local = base->cpu_base == this_cpu_base;
  1239		force_local &= base->cpu_base->next_timer == timer;
  1240	
  1241		/*
  1242		 * Don't force local queuing if this enqueue happens on a unplugged
  1243		 * CPU after hrtimer_cpu_dying() has been invoked.
  1244		 */
  1245		force_local &= this_cpu_base->online;
  1246	
  1247		/*
  1248		 * Remove an active timer from the queue. In case it is not queued
  1249		 * on the current CPU, make sure that remove_hrtimer() updates the
  1250		 * remote data correctly.
  1251		 *
  1252		 * If it's on the current CPU and the first expiring timer, then
  1253		 * skip reprogramming, keep the timer local and enforce
  1254		 * reprogramming later if it was the first expiring timer.  This
  1255		 * avoids programming the underlying clock event twice (once at
  1256		 * removal and once after enqueue).
  1257		 */
  1258		was_armed = remove_hrtimer(timer, base, true, force_local);
  1259	
  1260		if (mode & HRTIMER_MODE_REL)
  1261			tim = ktime_add_safe(tim, __hrtimer_cb_get_time(base->clockid));
  1262	
  1263		tim = hrtimer_update_lowres(timer, tim, mode);
  1264	
  1265		hrtimer_set_expires_range_ns(timer, tim, delta_ns);
  1266	
  1267		/* Switch the timer base, if necessary: */
  1268		if (!force_local)
  1269			new_base = switch_hrtimer_base(timer, base, mode & HRTIMER_MODE_PINNED);
  1270		else
  1271			new_base = base;
  1272	
  1273		first = enqueue_hrtimer(timer, new_base, mode, was_armed);
  1274	
  1275		/*
  1276		 * If the hrtimer interrupt is running, then it will reevaluate the
  1277		 * clock bases and reprogram the clock event device.
  1278		 */
> 1279		if (cpu_base->in_hrtirq)
  1280			return false;
  1281	
  1282		if (!force_local) {
  1283			/*
  1284			 * If the current CPU base is online, then the timer is never
  1285			 * queued on a remote CPU if it would be the first expiring
  1286			 * timer there unless the timer callback is currently executed
  1287			 * on the remote CPU. In the latter case the remote CPU will
  1288			 * re-evaluate the first expiring timer after completing the
  1289			 * callbacks.
  1290			 */
  1291			if (hrtimer_base_is_online(this_cpu_base))
  1292				return first;
  1293	
  1294			/*
  1295			 * Timer was enqueued remote because the current base is
  1296			 * already offline. If the timer is the first to expire,
  1297			 * kick the remote CPU to reprogram the clock event.
  1298			 */
  1299			if (first) {
  1300				struct hrtimer_cpu_base *new_cpu_base = new_base->cpu_base;
  1301	
  1302				smp_call_function_single_async(new_cpu_base->cpu, &new_cpu_base->csd);
  1303			}
  1304			return false;
  1305		}
  1306	
  1307		/*
  1308		 * Timer was forced to stay on the current CPU to avoid
  1309		 * reprogramming on removal and enqueue. Force reprogram the
  1310		 * hardware by evaluating the new first expiring timer.
  1311		 */
  1312		hrtimer_force_reprogram(new_base->cpu_base, /* skip_equal */ true);
  1313		return false;
  1314	}
  1315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

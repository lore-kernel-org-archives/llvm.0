Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F316C168488;
	Mon,  9 Dec 2024 05:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720990; cv=none; b=Zwif/kWUX39YL2WGbpY6yhyziw7l4vR6zkN6e5OnithcdRyglmFs6JauEkQg4VbuEbQOEJtaIcPIFSO9iNUqh505pvCdjMZtS/Huz1tA324NP7cTr9aQESmWT0qJh+ljqi6NmTNnhYMp4SH0UOiDI+aX36YECmCBdLj5Osjao7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720990; c=relaxed/simple;
	bh=TvkkkjiXDWWEdoRVwPtvHmkXGbKrz4j1rFRtJP8D+8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u4jXc9kRm7BJjkjHBDUrE8e2v0Kfrce4Z1cNNl+1TY2mNVkay/JZoodbR1BeIOvtpqiyUy+grFXMScHnCfIzNPQBao+1KB6czIWiK72S651APwkInYOveheK8ElSwJDlzm3nj20+qbKzMQEmKUKsszwvgR+QftexRF01T9hGx5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wyb0xhzJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wyb0xhzJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720989; x=1765256989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TvkkkjiXDWWEdoRVwPtvHmkXGbKrz4j1rFRtJP8D+8I=;
  b=Wyb0xhzJFmI0xudujYwILB3Jur6b5sQKHCaywY0a98iRPYsTdU4nAKsM
   inNy4EsqaT38Lnmwz5s0aW/bkUTSE24liqFrkCr225VaOn+MzLpHoH709
   HQwaERySUYc0nq3sRM7ukfMVOm3rtL6ec0V7568FaMY+u9SgEiTKpwEFi
   tPzEfY2YSvOCiWxfHLfJAZHz0EYZ05wQpJq6s+sbs88w+cq+rsnASlf+d
   Q4ILGAu2Or972jshfNnQCVVKkRoIZ3Y0w6MdpaJhYeQlAVTZUxilfVOAA
   tmjETTW8QgaxPqn4dH8BCbXBNupBkShvADiA5D6V9jkQ+/ikRtuV++b7W
   w==;
X-CSE-ConnectionGUID: M9v+8UhvQuO9L5hxoBH2Kw==
X-CSE-MsgGUID: a1SYOBodRIaLyq4pa8ifYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37683987"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37683987"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 21:09:46 -0800
X-CSE-ConnectionGUID: SgzI/z7xRrqlFlHU7mCI5w==
X-CSE-MsgGUID: 6ysyKkubSi2Kto3SmCMvYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125806854"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Dec 2024 21:09:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKW1e-0003yF-0h;
	Mon, 09 Dec 2024 05:09:42 +0000
Date: Mon, 9 Dec 2024 13:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wei Liu <wei.liu@kernel.org>, Michael Kelley <mhklinux@outlook.com>
Subject: [hyperv:hyperv-fixes 5/11] drivers/hv/hv_balloon.c:1377:9: error:
 call to undeclared function 'secs_to_jiffies'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202412091224.Z3o0dSDz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-fixes
head:   b8ea8cd0fbd358feee3e9172c5ef8afd671e0d11
commit: eced6df67f6b76889e80ded109a73ca5fac1e5cd [5/11] drivers: hv: Convert open-coded timeouts to secs_to_jiffies()
config: i386-buildonly-randconfig-002-20241209 (https://download.01.org/0day-ci/archive/20241209/202412091224.Z3o0dSDz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091224.Z3o0dSDz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412091224.Z3o0dSDz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hv/hv_balloon.c:14:
   In file included from include/linux/mman.h:6:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/hv/hv_balloon.c:30:
   include/linux/hyperv.h:646:2: warning: 'counted_by' should not be applied to an array with element of unknown size because 'struct gpa_range' is a struct type with a flexible array member. This will be an error in a future compiler version [-Wbounds-safety-counted-by-elt-type-unknown-size]
     646 |         struct gpa_range range[] __counted_by(rangecount);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hv/hv_balloon.c:1377:9: error: call to undeclared function 'secs_to_jiffies'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1377 |                                                                 secs_to_jiffies(1));
         |                                                                 ^
   drivers/hv/hv_balloon.c:1752:57: error: call to undeclared function 'secs_to_jiffies'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1752 |         t = wait_for_completion_timeout(&dm_device.host_event, secs_to_jiffies(5));
         |                                                                ^
   2 warnings and 2 errors generated.


vim +/secs_to_jiffies +1377 drivers/hv/hv_balloon.c

  1370	
  1371	static int dm_thread_func(void *dm_dev)
  1372	{
  1373		struct hv_dynmem_device *dm = dm_dev;
  1374	
  1375		while (!kthread_should_stop()) {
  1376			wait_for_completion_interruptible_timeout(&dm_device.config_event,
> 1377									secs_to_jiffies(1));
  1378			/*
  1379			 * The host expects us to post information on the memory
  1380			 * pressure every second.
  1381			 */
  1382			reinit_completion(&dm_device.config_event);
  1383			post_status(dm);
  1384			/*
  1385			 * disable free page reporting if multiple hypercall
  1386			 * failure flag set. It is not done in the page_reporting
  1387			 * callback context as that causes a deadlock between
  1388			 * page_reporting_process() and page_reporting_unregister()
  1389			 */
  1390			if (hv_hypercall_multi_failure >= HV_MAX_FAILURES) {
  1391				pr_err("Multiple failures in cold memory discard hypercall, disabling page reporting\n");
  1392				disable_page_reporting();
  1393				/* Reset the flag after disabling reporting */
  1394				hv_hypercall_multi_failure = 0;
  1395			}
  1396		}
  1397	
  1398		return 0;
  1399	}
  1400	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

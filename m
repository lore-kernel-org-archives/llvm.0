Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2110C2C21E8;
	Sat,  4 Apr 2026 07:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775288575; cv=none; b=DDGTST6aapM9W62Sm6VTE5wSRS/E4LiFv2rykiOOVDlIMQ0dsuazjVRRMrUmIhRdrwUH1518PJlV9vqfkFNkgXOfjPJaMEFiXXfki5Lkajc2Nfo2mdTJsMslMsBZLeNVVZ6nbvTHuL3JXUob2PwXgF59Q/xRbYP6dJRMQoEJYII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775288575; c=relaxed/simple;
	bh=72sbCiMCAfR3CeKYUsOGOQ3ruWPsWRkc0GUjLO+Jnds=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QJ3boH5kE7nqlGSLEx7HfAhyrl2eSP8dl02iR5OH6bIOv5ZGOTX6lE4lkDa897UepZDFih2NufZfSztRve5io01r9OlaHebgNd0BZwiVjvuN8iWUfi29Gn22Ym7KGdCmHqLgfftISQ83yuCvs9JMDqJKEjzVY/J9kUw/5003bTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KydIqtuQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KydIqtuQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775288574; x=1806824574;
  h=date:from:to:cc:subject:message-id;
  bh=72sbCiMCAfR3CeKYUsOGOQ3ruWPsWRkc0GUjLO+Jnds=;
  b=KydIqtuQFjoChR3Ck3TzitbtJGJfhNFveGmTcRfpLOEvsj8KtyF4Es5f
   86VoWY/etYqiyCnYDq9TKxUk0MEl7ghH4axRViQ/pZuCJZ4EPsYwVs6vk
   G8JUZIMF8iXuwK3YH2iCRbSRzmyClgQUNhALHIGkAYOFLyNs0Q7sBLsUe
   M1AmoXuxHllFaXZiMas/yoMx9akhGgxcPNmZUfIMi6BGyNFp31HyEYDln
   wyOGRLcxvfkPLeJY6AUTiR8VNyj3Xezm6waoREvDz7KzBAFthxrBSi8v9
   TyEf2aU7AKxmlqDaCHlXYxP1wL7fLfO2AzkS6nvxLQdDUwp+hxeONJkPf
   A==;
X-CSE-ConnectionGUID: KADHi3H0SsCTa8SCLYFAlA==
X-CSE-MsgGUID: XLb/7XqQR1uIcjv/IlXaMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="75506329"
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="75506329"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 00:42:53 -0700
X-CSE-ConnectionGUID: IBOVhV17QL69uXAty35ylQ==
X-CSE-MsgGUID: hoLQSJH4TPWzpnEwpeLeIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="222611495"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 04 Apr 2026 00:42:52 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8veb-000000009YT-3UGN;
	Sat, 04 Apr 2026 07:42:49 +0000
Date: Sat, 04 Apr 2026 09:42:22 +0200
From: kernel test robot <lkp@intel.com>
To: Yaxiong Tian <tianyaxiong@kylinos.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/devfreq/devfreq.c:1417:45: error: use of undeclared
 identifier 'gov_attr_group'; did you mean 'op_stat_group'?
Message-ID: <202604040902.67J4kfiS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Yaxiong-Tian/PM-devfreq-Fix-possible-null-pointer-issue-in-devfreq_add_governor/20260403-043102
head:   46389bf8fc8104f5048ebf43f1cae6710e2431b5
commit: f623b4f534cb38851b67bbc263fe66a60725a524 PM / devfreq: Fix governor_store() failing when device has no current governor
date:   35 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260404/202604040902.67J4kfiS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040902.67J4kfiS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040902.67J4kfiS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/devfreq/devfreq.c:1417:45: error: use of undeclared identifier 'gov_attr_group'; did you mean 'op_stat_group'?
    1417 |                         ret = sysfs_update_group(&df->dev.kobj, &gov_attr_group);
         |                                                                  ^~~~~~~~~~~~~~
         |                                                                  op_stat_group
   include/linux/blk_types.h:506:19: note: 'op_stat_group' declared here
     506 | static inline int op_stat_group(enum req_op op)
         |                   ^
   1 error generated.


vim +1417 drivers/devfreq/devfreq.c

  1389	
  1390	static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
  1391				      const char *buf, size_t count)
  1392	{
  1393		struct devfreq *df = to_devfreq(dev);
  1394		int ret;
  1395		char str_governor[DEVFREQ_NAME_LEN + 1];
  1396		const struct devfreq_governor *governor, *prev_governor;
  1397	
  1398		ret = sscanf(buf, "%" __stringify(DEVFREQ_NAME_LEN) "s", str_governor);
  1399		if (ret != 1)
  1400			return -EINVAL;
  1401	
  1402		mutex_lock(&devfreq_list_lock);
  1403		governor = try_then_request_governor(str_governor);
  1404		if (IS_ERR(governor)) {
  1405			ret = PTR_ERR(governor);
  1406			goto out;
  1407		}
  1408	
  1409		if (!df->governor) {
  1410			df->governor = governor;
  1411			ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
  1412			if (ret) {
  1413				dev_warn(dev, "%s: Governor %s not started(%d)\n",
  1414					__func__, df->governor->name, ret);
  1415				df->governor = NULL;
  1416			} else {
> 1417				ret = sysfs_update_group(&df->dev.kobj, &gov_attr_group);
  1418			}
  1419			goto out;
  1420		}
  1421	
  1422		if (df->governor == governor) {
  1423			ret = 0;
  1424			goto out;
  1425		} else if (IS_SUPPORTED_FLAG(df->governor->flags, IMMUTABLE)
  1426			|| IS_SUPPORTED_FLAG(governor->flags, IMMUTABLE)) {
  1427			ret = -EINVAL;
  1428			goto out;
  1429		}
  1430	
  1431		/*
  1432		 * Stop the current governor and remove the specific sysfs files
  1433		 * which depend on current governor.
  1434		 */
  1435		ret = df->governor->event_handler(df, DEVFREQ_GOV_STOP, NULL);
  1436		if (ret) {
  1437			dev_warn(dev, "%s: Governor %s not stopped(%d)\n",
  1438				 __func__, df->governor->name, ret);
  1439			goto out;
  1440		}
  1441		remove_sysfs_files(df, df->governor);
  1442	
  1443		/*
  1444		 * Start the new governor and create the specific sysfs files
  1445		 * which depend on the new governor.
  1446		 */
  1447		prev_governor = df->governor;
  1448		df->governor = governor;
  1449		ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
  1450		if (ret) {
  1451			dev_warn(dev, "%s: Governor %s not started(%d)\n",
  1452				 __func__, df->governor->name, ret);
  1453	
  1454			/* Restore previous governor */
  1455			df->governor = prev_governor;
  1456			ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
  1457			if (ret) {
  1458				dev_err(dev,
  1459					"%s: reverting to Governor %s failed (%d)\n",
  1460					__func__, prev_governor->name, ret);
  1461				df->governor = NULL;
  1462				goto out;
  1463			}
  1464		}
  1465	
  1466		/*
  1467		 * Create the sysfs files for the new governor. But if failed to start
  1468		 * the new governor, restore the sysfs files of previous governor.
  1469		 */
  1470		create_sysfs_files(df, df->governor);
  1471	
  1472	out:
  1473		mutex_unlock(&devfreq_list_lock);
  1474	
  1475		if (!ret)
  1476			ret = count;
  1477		return ret;
  1478	}
  1479	static DEVICE_ATTR_RW(governor);
  1480	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

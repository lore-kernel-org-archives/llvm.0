Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5459D8F58;
	Tue, 18 Mar 2025 01:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742259777; cv=none; b=ZlZ5iDkiZPWLSfompGN97I65OOoTQRKoo2Tsz3sClQmKr6MqQddetvG56Oo9vkqAsWRddSwfV/5HC5JA1DHBxKcagYtS+IykOZIncVw1FwkiBhPFS3saIkeAkfIRZ09qKhG/6z8yRvoZsaZ3qvgGY/ru+n5mzPl9fB1+f+Dx4Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742259777; c=relaxed/simple;
	bh=Mwe54XY4RCOEn3usZ4QwkYYOc0QRLk9kncYdOjtiUqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tMM95jDo3fJ8OEJY1wJUMOumkjjZ3NJrs07P+RB5UgqCkxyAb4PD1mPusP7JEy5dVoinWTjStAzp6tOjB2Yed+BSAOQ78OD7uGwiTUrUj8qXSj4PAMccPl5elgXxae9To9O2EfhkgVWYECAUh5ItL0LnBoUazOhcMd5CLnKFGbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVBG5MR4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVBG5MR4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742259775; x=1773795775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mwe54XY4RCOEn3usZ4QwkYYOc0QRLk9kncYdOjtiUqM=;
  b=mVBG5MR4SSk1ZAvSh/MBrgP31jv7KsZbQ8AohgPjvVfyhZeHRwFdMPt6
   8fdc5loQMniPbCwLnrCwJSoga9JEMBpqQddEukrYHLdQf2/9K9/L+gqlV
   pjMlzhzaSOlk+64cNkDNsHt5BeRDiifhGqp8AYkuhQR2/7n8rq9QGyRKi
   DqNWGZiBm7U9kJgM16b6t4RwhS83D/w19L8rElgyGbUts2ipZfbaVx3UH
   TWy4B2nRpc2DRhU1KCZzQaq2dluU1k7xusQ2DkHEzMt7ePmFQcMi37MLd
   jJvNk7nB9rn9We1jI3pIwuDa1ivIr2FAey//6CT9tfUm394cfu0/I9b4g
   A==;
X-CSE-ConnectionGUID: 6aJ4yqfhQ1uLvFw6vzKcGQ==
X-CSE-MsgGUID: jQQQKFQoSY+hbOeP1byVKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54048180"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="54048180"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 18:02:55 -0700
X-CSE-ConnectionGUID: HTQNH8nvSZuD4nepD6EBTg==
X-CSE-MsgGUID: 4is4CaraQ0Clc4ad9F/P6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="126759998"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Mar 2025 18:02:53 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuLM3-000DGh-1T;
	Tue, 18 Mar 2025 01:02:51 +0000
Date: Tue, 18 Mar 2025 09:02:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2025.03.11a 35/38]
 drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:1686:38: error: assigning to
 'atomic_t' from incompatible type 'int'
Message-ID: <202503180826.EiekA1MB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2025.03.11a
head:   f8336d73124404df2b42d757b8a2c73f70281b97
commit: 85393d1591b54e5b41e61ec6ca2f2c84bf94351d [35/38] ratelimit: Convert the ->missed field to atomic_t
config: i386-buildonly-randconfig-001-20250318 (https://download.01.org/0day-ci/archive/20250318/202503180826.EiekA1MB-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503180826.EiekA1MB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503180826.EiekA1MB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:1686:38: error: assigning to 'atomic_t' from incompatible type 'int'
    1686 |                 adev->throttling_logging_rs.missed = 0;
         |                                                    ^ ~
   1 error generated.


vim +1686 drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c

b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1657  
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1658  static ssize_t amdgpu_set_thermal_throttling_logging(struct device *dev,
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1659  						     struct device_attribute *attr,
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1660  						     const char *buf,
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1661  						     size_t count)
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1662  {
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1663  	struct drm_device *ddev = dev_get_drvdata(dev);
1348969ab68cb8 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Luben Tuikov 2020-08-24  1664  	struct amdgpu_device *adev = drm_to_adev(ddev);
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1665  	long throttling_logging_interval;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1666  	unsigned long flags;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1667  	int ret = 0;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1668  
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1669  	ret = kstrtol(buf, 0, &throttling_logging_interval);
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1670  	if (ret)
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1671  		return ret;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1672  
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1673  	if (throttling_logging_interval > 3600)
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1674  		return -EINVAL;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1675  
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1676  	if (throttling_logging_interval > 0) {
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1677  		raw_spin_lock_irqsave(&adev->throttling_logging_rs.lock, flags);
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1678  		/*
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1679  		 * Reset the ratelimit timer internals.
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1680  		 * This can effectively restart the timer.
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1681  		 */
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1682  		adev->throttling_logging_rs.interval =
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1683  			(throttling_logging_interval - 1) * HZ;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1684  		adev->throttling_logging_rs.begin = 0;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1685  		adev->throttling_logging_rs.printed = 0;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22 @1686  		adev->throttling_logging_rs.missed = 0;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1687  		raw_spin_unlock_irqrestore(&adev->throttling_logging_rs.lock, flags);
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1688  
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1689  		atomic_set(&adev->throttling_logging_enabled, 1);
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1690  	} else {
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1691  		atomic_set(&adev->throttling_logging_enabled, 0);
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1692  	}
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1693  
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1694  	return count;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1695  }
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1696  

:::::: The code at line 1686 was first introduced by commit
:::::: b265bdbd9f2811c2a674ea9d1161de821923897c drm/amdgpu: added a sysfs interface for thermal throttling related V4

:::::: TO: Evan Quan <evan.quan@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

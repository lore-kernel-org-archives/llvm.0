Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEE917E1;
	Sun, 12 Nov 2023 02:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3+OE1H7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699754572; x=1731290572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zYgV3EeWTUWInSYElFdO19myYIuDelV579co8Zr1cYA=;
  b=e3+OE1H72WCvdP9b5UKhvA7gBuw+E2y/sIDIaMrQYXsrMdcm8EueU4zL
   QqLsB5N3VGOY65UPa0sK1T7p14pwPKrlfD3droTFrdM1odKxbkdI1+7K0
   R7TfoHbpxFdDGxHibDGsG8gKuopx1wi0tYSzr/Sy+k3tSPLuNlQY98/eR
   oCexk/WbFVm3pkiVpyLaTgCIesJffwEr2QQvsfKlWH9NUXa2Wbiq4eeQO
   LCkI9FMDi4KOC+VtivBb1/2GCFpQQ6yGOH3+L23LmKMBNCUaGZH1RJZYy
   F31VK3WAs/EOnpP+r2+Uru4jKNh7izWcTi7mzFiy6siSznDJ7FhUU/EiD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="11857531"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="11857531"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 18:02:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="11761982"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Nov 2023 18:02:47 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1zoC-000AsW-2c;
	Sun, 12 Nov 2023 02:02:44 +0000
Date: Sun, 12 Nov 2023 10:02:36 +0800
From: kernel test robot <lkp@intel.com>
To: Bean Huo <beanhuo@iokpp.de>, avri.altman@wdc.com, bvanassche@acm.org,
	alim.akhtar@samsung.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, stanley.chu@mediatek.com,
	mani@kernel.org, quic_cang@quicinc.com, quic_asutoshd@quicinc.com,
	beanhuo@micron.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	mikebi@micron.com, lporzio@micron.com
Subject: Re: [PATCH v1 2/2] scsi: ufs: core: Add sysfs node for UFS RTC update
Message-ID: <202311120923.S1Zbpb0s-lkp@intel.com>
References: <20231109125217.185462-3-beanhuo@iokpp.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109125217.185462-3-beanhuo@iokpp.de>

Hi Bean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bean-Huo/scsi-ufs-core-Add-UFS-RTC-support/20231110-051048
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20231109125217.185462-3-beanhuo%40iokpp.de
patch subject: [PATCH v1 2/2] scsi: ufs: core: Add sysfs node for UFS RTC update
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231112/202311120923.S1Zbpb0s-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120923.S1Zbpb0s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311120923.S1Zbpb0s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ufs/core/ufs-sysfs.c:276:6: warning: variable 'resume_period_update' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     276 |         if (!hba->dev_info.rtc_update_period && ms > 0)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufs-sysfs.c:281:6: note: uninitialized use occurs here
     281 |         if (resume_period_update)
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufs-sysfs.c:276:2: note: remove the 'if' if its condition is always true
     276 |         if (!hba->dev_info.rtc_update_period && ms > 0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     277 |                 resume_period_update =  true;
         | ~~~~~~~~~~~~~~~~
>> drivers/ufs/core/ufs-sysfs.c:276:6: warning: variable 'resume_period_update' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     276 |         if (!hba->dev_info.rtc_update_period && ms > 0)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufs-sysfs.c:281:6: note: uninitialized use occurs here
     281 |         if (resume_period_update)
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufs-sysfs.c:276:6: note: remove the '&&' if its condition is always true
     276 |         if (!hba->dev_info.rtc_update_period && ms > 0)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufs-sysfs.c:271:27: note: initialize the variable 'resume_period_update' to silence this warning
     271 |         bool resume_period_update;
         |                                  ^
         |                                   = 0
   2 warnings generated.


vim +276 drivers/ufs/core/ufs-sysfs.c

   265	
   266	static ssize_t rtc_update_ms_store(struct device *dev, struct device_attribute *attr,
   267				   const char *buf, size_t count)
   268	{
   269		struct ufs_hba *hba = dev_get_drvdata(dev);
   270		unsigned int ms;
   271		bool resume_period_update;
   272	
   273		if (kstrtouint(buf, 0, &ms))
   274			return -EINVAL;
   275	
 > 276		if (!hba->dev_info.rtc_update_period && ms > 0)
   277			resume_period_update =  true;
   278		/* Minimum and maximum update frequency should be synchronized with all UFS vendors */
   279		hba->dev_info.rtc_update_period = ms;
   280	
   281		if (resume_period_update)
   282			schedule_delayed_work(&hba->ufs_rtc_delayed_work,
   283							msecs_to_jiffies(hba->dev_info.rtc_update_period));
   284		return count;
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D010118D;
	Tue, 24 Dec 2024 01:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735004493; cv=none; b=lemFRqhmcxEsWIJBMfqpal0zTrQzlX1rF/TaGMyl31xagbIdJK+GV/62fBU9vkjXrtGLthzII4AicOXkOAjNRIVd/f/ankKXA9YT3LaRfRZV+l5bpQtCF9nLQMHJ68cE6MvMXDcC4noy+vd1BQRZWAKHPXD+A/nnnHHXYQ3MGuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735004493; c=relaxed/simple;
	bh=ntAdJ39PK3EGoanprL+FLMeQD7O7Yi1AZjE3z5QrdBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sr0jiBqlWsS5sUWaoRPD3IDb5VlWecfLbLcTLd2RhwAi2+0YScqUldIIrRdn6EA8XzuYn/bWsy6fKzqp0nyEq4TO0v8qbQ901RRBTZexXLz51z2/6L7gcSSgyTSZXOF8r9XYm1H3ocCgquK0ENHKyrwuyNuJm/a90ANpPmMKvLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IzeVsB48; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IzeVsB48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735004491; x=1766540491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ntAdJ39PK3EGoanprL+FLMeQD7O7Yi1AZjE3z5QrdBI=;
  b=IzeVsB48SqRiHWFQb/F3+74gjOTECq98FCbt0yRYLMA/nRFr63G6e+m5
   xg72n7NcZC8UDmI6Mk3n3uaK9AN9HKNqCPuuzbH7O5Wyt6IYf8ooNj+Li
   jP2VYW+1oHb4WqVuGmQ7TWJWMeWE2NFcG8f3QfgGHS1SW9Ghu54Ry92hU
   +QwxdqPjvKlV4tCq3CbWm/b8DiUlyOP1LfVJz+qDkbMsqKELUpfztVm9e
   UgE3y93c10YCdB/Vuvi9sMODGzvg8ciUzVXiCluQxiqTsBLYWixr8Yob9
   Rh96o5dF68pNkDlh9dOLdw9G+GOW4QXmfkkMyH4ORmEQidb0eN4mGhVHL
   Q==;
X-CSE-ConnectionGUID: UZY53vzuTL6MuhCg7zWbaw==
X-CSE-MsgGUID: 3/ywziUkSderaCUUdrxsjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="35694633"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="35694633"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 17:41:30 -0800
X-CSE-ConnectionGUID: v9ZLPoE+TjastWvu8oqcFA==
X-CSE-MsgGUID: 29HRz9vnSsaHb+s/Af/CYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="99719925"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Dec 2024 17:41:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPtvJ-0000kN-2w;
	Tue, 24 Dec 2024 01:41:25 +0000
Date: Tue, 24 Dec 2024 09:40:31 +0800
From: kernel test robot <lkp@intel.com>
To: Pavan Holla <pholla@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [usb:usb-testing 9/58] drivers/usb/typec/ucsi/cros_ec_ucsi.c:187:40:
 error: incompatible pointer to integer conversion passing 'u64 *' (aka
 'unsigned long long *') to parameter of type 'u64' (aka 'unsigned long
 long'); remove &
Message-ID: <202412240903.xAqTOQpa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   b1d7c2a8a364695a5dca2bb18ebcf2c10ad61172
commit: 475db78842851d9efd7888154a80af697946de1e [9/58] usb: typec: ucsi: Implement ChromeOS UCSI driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241224/202412240903.xAqTOQpa-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240903.xAqTOQpa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240903.xAqTOQpa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/typec/ucsi/cros_ec_ucsi.c:187:40: error: incompatible pointer to integer conversion passing 'u64 *' (aka 'unsigned long long *') to parameter of type 'u64' (aka 'unsigned long long'); remove & [-Wint-conversion]
     187 |                 cros_ucsi_async_control(udata->ucsi, &cmd);
         |                                                      ^~~~
   drivers/usb/typec/ucsi/cros_ec_ucsi.c:90:59: note: passing argument to parameter 'cmd' here
      90 | static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
         |                                                           ^
   1 error generated.


vim +187 drivers/usb/typec/ucsi/cros_ec_ucsi.c

   154	
   155	static void cros_ucsi_write_timeout(struct work_struct *work)
   156	{
   157		struct cros_ucsi_data *udata =
   158			container_of(work, struct cros_ucsi_data, write_tmo.work);
   159		u32 cci;
   160		u64 cmd;
   161	
   162		if (cros_ucsi_read(udata->ucsi, UCSI_CCI, &cci, sizeof(cci))) {
   163			dev_err(udata->dev,
   164				"Reading CCI failed; no write timeout recovery possible.");
   165			return;
   166		}
   167	
   168		if (cci & UCSI_CCI_BUSY) {
   169			udata->tmo_counter++;
   170	
   171			if (udata->tmo_counter <= WRITE_TMO_CTR_MAX)
   172				schedule_delayed_work(&udata->write_tmo,
   173						      msecs_to_jiffies(WRITE_TMO_MS));
   174			else
   175				dev_err(udata->dev,
   176					"PPM unresponsive - too many write timeouts.");
   177	
   178			return;
   179		}
   180	
   181		/* No longer busy means we can reset our timeout counter. */
   182		udata->tmo_counter = 0;
   183	
   184		/* Need to ack previous command which may have timed out. */
   185		if (cci & UCSI_CCI_COMMAND_COMPLETE) {
   186			cmd = UCSI_ACK_CC_CI | UCSI_ACK_COMMAND_COMPLETE;
 > 187			cros_ucsi_async_control(udata->ucsi, &cmd);
   188	
   189			/* Check again after a few seconds that the system has
   190			 * recovered to make sure our async write above was successful.
   191			 */
   192			schedule_delayed_work(&udata->write_tmo,
   193					      msecs_to_jiffies(WRITE_TMO_MS));
   194			return;
   195		}
   196	
   197		/* We recovered from a previous timeout. Treat this as a recovery from
   198		 * suspend and call resume.
   199		 */
   200		ucsi_resume(udata->ucsi);
   201	}
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

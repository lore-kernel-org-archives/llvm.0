Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEBB17A2F5;
	Fri, 18 Jul 2025 18:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752862908; cv=none; b=PMDIGzNrv9SOmynPFCjs8tRKWJ+trfn+2GOc7w7EzafhGM6V2VXfzypstOCz1iixJxwI9ln4bzeZrMeAmeiXbliBByDx3EWS0QretgDIO++XGfD2Acap3VF1Q6g4l1/NFe4SnB1dU/1C5wMvZuk1nNbQ6V4MBNkF86vkrkvduSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752862908; c=relaxed/simple;
	bh=P+9EJz816VbmV7HS5BwOfxdEj45paRDrlxlwnAf6Jfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o8uEWxacMn6JFRy1aVzhDaMMPFR1eXCOE4pLUHhlAMLANaf1OONjKrUtErZUrEMMs1/QCcgwOTIYflKnB+lydJGH7pFH1zcoNVoNSJOSZnjOKFI9trQa0Wf5N6Waj9tFRSRpzyaRiPgktxMqO08gy63Mf7jBI7SKq2sLFNshue0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0qxbY54; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0qxbY54"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752862906; x=1784398906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P+9EJz816VbmV7HS5BwOfxdEj45paRDrlxlwnAf6Jfs=;
  b=e0qxbY54biluLcpa9o4kLwNBDHLd1EOa/h9PqEd9qQ3cIbS7Fnkf1otB
   FgGkmtMuK+6Cpb4mF/lgp+lG7mHAGadqSt1g+ZCW5RkQ91ukjvEfJGCl7
   2GuARQPg7eGIU8YNM6slhZXsddJlV1fZlO3pKQuJinEJjRVpn0sSeEWBw
   emnvdjcqwPilqBHy0sQ7N6gSm89PgA2nRGJOUDD0QoTkak83oDZjqFLgo
   /cjzvrbjU4bKsd7T7IO54uJZABx9bo56s5BNoTMc7lIk+YdTSMJLGFXk/
   KhVY/tNAh58jnBsI0+A444ub6DnNfqlunIFDtgJ46mtqVDEpe8OBD0VUc
   A==;
X-CSE-ConnectionGUID: khFSaM9+Rmen2fxurloFEg==
X-CSE-MsgGUID: aN2/OZSbS8uhURejFaFA5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="58947034"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="58947034"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 11:21:45 -0700
X-CSE-ConnectionGUID: dfBBGi8hQAKPr27O9jgOyg==
X-CSE-MsgGUID: 7AZntq2VQb+Ale4UkiYwyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="162632303"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Jul 2025 11:21:42 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucpiG-000Ewp-1J;
	Fri, 18 Jul 2025 18:21:40 +0000
Date: Sat, 19 Jul 2025 02:20:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:string-helper-2025-07-18 135/157]
 drivers/md/dm-vdo/vdo.c:1376:36: error: call to undeclared function
 'str_enabled_disabled'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202507190253.z3mxU8Ux-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux string-helper-2025-07-18
head:   ea52943b017c3b53f3f8c9ff679ccfb8eaae222a
commit: 76ff9a5ac5f25b351b7ecc7743f4910aceb7bd1d [135/157] dm vdo: use string choices helper
config: s390-randconfig-001-20250718 (https://download.01.org/0day-ci/archive/20250719/202507190253.z3mxU8Ux-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190253.z3mxU8Ux-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190253.z3mxU8Ux-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/md/dm-vdo/vdo.c:1376:36: error: call to undeclared function 'str_enabled_disabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1376 |         vdo_log_info("compression is %s", str_enabled_disabled(*enable));
         |                                           ^
>> drivers/md/dm-vdo/vdo.c:1376:36: warning: format specifies type 'char *' but the argument has type 'int' [-Wformat]
    1376 |         vdo_log_info("compression is %s", str_enabled_disabled(*enable));
         |                                      ~~   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      %d
   drivers/md/dm-vdo/logger.h:91:57: note: expanded from macro 'vdo_log_info'
      91 | #define vdo_log_info(...) vdo_log_message(VDO_LOG_INFO, __VA_ARGS__)
         |                                                         ^~~~~~~~~~~
   drivers/md/dm-vdo/logger.h:84:55: note: expanded from macro 'vdo_log_message'
      84 |         __vdo_log_message(priority, VDO_LOGGING_MODULE_NAME, __VA_ARGS__)
         |                                                              ^~~~~~~~~~~
   1 warning and 1 error generated.
--
>> drivers/md/dm-vdo/dm-vdo-target.c:2399:37: error: call to undeclared function 'str_enabled_disabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2399 |                 vdo_log_info("compression is %s", str_enabled_disabled(enable));
         |                                                   ^
>> drivers/md/dm-vdo/dm-vdo-target.c:2399:37: warning: format specifies type 'char *' but the argument has type 'int' [-Wformat]
    2399 |                 vdo_log_info("compression is %s", str_enabled_disabled(enable));
         |                                              ~~   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                              %d
   drivers/md/dm-vdo/logger.h:91:57: note: expanded from macro 'vdo_log_info'
      91 | #define vdo_log_info(...) vdo_log_message(VDO_LOG_INFO, __VA_ARGS__)
         |                                                         ^~~~~~~~~~~
   drivers/md/dm-vdo/logger.h:84:55: note: expanded from macro 'vdo_log_message'
      84 |         __vdo_log_message(priority, VDO_LOGGING_MODULE_NAME, __VA_ARGS__)
         |                                                              ^~~~~~~~~~~
   1 warning and 1 error generated.


vim +/str_enabled_disabled +1376 drivers/md/dm-vdo/vdo.c

  1357	
  1358	/**
  1359	 * set_compression_callback() - Callback to turn compression on or off.
  1360	 * @completion: The completion.
  1361	 */
  1362	static void set_compression_callback(struct vdo_completion *completion)
  1363	{
  1364		struct vdo *vdo = completion->vdo;
  1365		bool *enable = completion->parent;
  1366		bool was_enabled = vdo_get_compressing(vdo);
  1367	
  1368		if (*enable != was_enabled) {
  1369			WRITE_ONCE(vdo->compressing, *enable);
  1370			if (was_enabled) {
  1371				/* Signal the packer to flush since compression has been disabled. */
  1372				vdo_flush_packer(vdo->packer);
  1373			}
  1374		}
  1375	
> 1376		vdo_log_info("compression is %s", str_enabled_disabled(*enable));
  1377		*enable = was_enabled;
  1378		complete_synchronous_action(completion);
  1379	}
  1380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6E621CC64;
	Thu,  1 Jan 2026 18:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767291889; cv=none; b=DGi8DEnUWNO754cRDKy3jfr85VK8XPE8l7GtTAX3BgzqiVrR1rlt2aaworpnsVwAqX1W5BDWgR8KJYKqeUwJjGEM/ymvPBySPF4FhNXPClYoIqUmQqvQPDQZQGaXMEn7Web2+b3L3b5T9BCN5JH1u5SxefpmTe8wd+6Rjp+wqOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767291889; c=relaxed/simple;
	bh=DAOcHh2NP4X6BvmCgQOFtGglNzMYFUDr8cNn7KV4X0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPnODHSLH4HlTQXXkyK1qQ7KqvQDvt3WYvZGAGNWfVe9/TT2n3WxgF1TQNn37gAwYSYgBeOmrbEqqEs3Uz8Gjld9+Uj7tXNgkOA+7bSJocEjYFb78Icca2QekmjzpiZpENeG594RzPkImTwUFBUL1tydSp4mXU8W4ILAt8+nsyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkmkWkbQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkmkWkbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767291887; x=1798827887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DAOcHh2NP4X6BvmCgQOFtGglNzMYFUDr8cNn7KV4X0c=;
  b=PkmkWkbQet10duy8O8YYqarpKXfpF5isVQzILzz6/b7LLIifMLNlwP6Y
   u4il39BFJAEVgPe8oAA+Ip+bzL1uZAPaq0TA3xqNTRQNpfj7y3qUEEi3E
   iKjHo7xBPt6+KQLx/FHIZ4hmtw6J16YGimqHXDAqWFmjYMhzusY32xyxF
   th2u/GdV+t0cUEhnocMfvn5C1HfdH5NcGRChirbCyTuug9TEIY34G9n3i
   uNDsG3unLB3stexGsQreV2kq6ykprqljjYRUCuBESfDa6EFH93OJuobDy
   6vYl9IYwY1N8lACXccbYxL/36ZDOoO8h3PH/VWflZ7vfZ+TU5KhNaTaib
   w==;
X-CSE-ConnectionGUID: zEem1wsfSNKccT1WmGz3bw==
X-CSE-MsgGUID: NYCIbND1RDOTEPQbHUNDLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="79936548"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="79936548"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 10:24:46 -0800
X-CSE-ConnectionGUID: c2CNmyWcRPej0OPL58ZsYg==
X-CSE-MsgGUID: RCgLJvmeT1iMSi2eyv3ujQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="200892981"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jan 2026 10:24:44 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbNLm-000000001zB-1bw9;
	Thu, 01 Jan 2026 18:24:42 +0000
Date: Fri, 2 Jan 2026 02:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: Navid-Derakhshandeh <navid.derakhshandeh1@gmail.com>,
	mporter@kernel.crashing.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alex.bou9@gmail.com, linux-kernel@vger.kernel.org,
	Navid-Derakhshandeh <navid.derakhshandeh1@gmail.com>
Subject: Re: [PATCH] mailbox: rio : implement discovery for all
Message-ID: <202601020241.CwU3w5vS-lkp@intel.com>
References: <20251229190724.20608-1-navid.derakhshandeh1@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229190724.20608-1-navid.derakhshandeh1@gmail.com>

Hi Navid-Derakhshandeh,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Navid-Derakhshandeh/mailbox-rio-implement-discovery-for-all/20251230-031149
base:   linus/master
patch link:    https://lore.kernel.org/r/20251229190724.20608-1-navid.derakhshandeh1%40gmail.com
patch subject: [PATCH] mailbox: rio : implement discovery for all
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260102/202601020241.CwU3w5vS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601020241.CwU3w5vS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601020241.CwU3w5vS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/rapidio/rio.c:1081:4: error: call to undeclared function 'rio_scan_mport'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1081 |                         rio_scan_mport(net->hport);
         |                         ^
>> drivers/rapidio/rio.c:1074:6: warning: no previous prototype for function 'rio_restart_discovery_all' [-Wmissing-prototypes]
    1074 | void rio_restart_discovery_all(void)
         |      ^
   drivers/rapidio/rio.c:1074:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1074 | void rio_restart_discovery_all(void)
         | ^
         | static 
   drivers/rapidio/rio.c:1109:3: error: call to undeclared function 'rio_scan_mport'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1109 |                 rio_scan_mport(net->hport);
         |                 ^
   drivers/rapidio/rio.c:1119:3: error: call to undeclared function 'rio_scan_mport'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1119 |                 rio_scan_mport(net->hport);
         |                 ^
   1 warning and 3 errors generated.


vim +/rio_scan_mport +1081 drivers/rapidio/rio.c

  1021	
  1022	/**
  1023	 * rio_get_input_status - Sends a Link-Request/Input-Status control symbol and
  1024	 *                        returns link-response (if requested).
  1025	 * @rdev: RIO devive to issue Input-status command
  1026	 * @pnum: Device port number to issue the command
  1027	 * @lnkresp: Response from a link partner
  1028	 */
  1029	static int
  1030	rio_get_input_status(struct rio_dev *rdev, int pnum, u32 *lnkresp)
  1031	{
  1032		u32 regval;
  1033		int checkcount;
  1034	
  1035		if (lnkresp) {
  1036			/* Read from link maintenance response register
  1037			 * to clear valid bit */
  1038			rio_read_config_32(rdev,
  1039				RIO_DEV_PORT_N_MNT_RSP_CSR(rdev, pnum),
  1040				&regval);
  1041			udelay(50);
  1042		}
  1043	
  1044		/* Issue Input-status command */
  1045		rio_write_config_32(rdev,
  1046			RIO_DEV_PORT_N_MNT_REQ_CSR(rdev, pnum),
  1047			RIO_MNT_REQ_CMD_IS);
  1048	
  1049		/* Exit if the response is not expected */
  1050		if (!lnkresp)
  1051			return 0;
  1052	
  1053		checkcount = 3;
  1054		while (checkcount--) {
  1055			udelay(50);
  1056			rio_read_config_32(rdev,
  1057				RIO_DEV_PORT_N_MNT_RSP_CSR(rdev, pnum),
  1058				&regval);
  1059			if (regval & RIO_PORT_N_MNT_RSP_RVAL) {
  1060				*lnkresp = regval;
  1061				return 0;
  1062			}
  1063		}
  1064	
  1065		return -EIO;
  1066	}
  1067	/**
  1068	 * rio_restart_discovery_all - Restart discovery on all RapidIO networks
  1069	 *
  1070	 * Iterates through all registered RapidIO networks and restarts topology
  1071	 * discovery process from each network's host port. Intended to be used
  1072	 * after a system-wide error or configuration change.
  1073	 */
> 1074	void rio_restart_discovery_all(void)
  1075	{
  1076		struct rio_net *net;
  1077	
  1078		spin_lock(&rio_global_list_lock);
  1079		list_for_each_entry(net, &rio_nets, node) {
  1080			if (net->hport)
> 1081				rio_scan_mport(net->hport);
  1082		}
  1083		spin_unlock(&rio_global_list_lock);
  1084	}
  1085	EXPORT_SYMBOL_GPL(rio_restart_discovery_all);
  1086	/**
  1087	 * rio_maybe_restart_discovery - Restart discovery if device requires rediscovery
  1088	 * @rdev: Pointer to RIO device control structure
  1089	 *
  1090	 * If the given device is associated with a RapidIO network,
  1091	 * attempts to restart topology discovery from the network's host port.
  1092	 * Intended to be called if an error condition is detected that may
  1093	 * require rediscovery to restore normal operation.
  1094	 */
  1095	static void rio_maybe_restart_discovery(struct rio_dev *rdev)
  1096	{
  1097		struct rio_net *net;
  1098	
  1099		if (!rdev || !rdev->net)
  1100			return;
  1101	
  1102		net = rdev->net;
  1103	
  1104		/* Only restart if there is a valid host port */
  1105		if (net->hport) {
  1106			msleep(100); /* Brief delay for safety */
  1107			pr_info("RIO: Discovery restart triggered for device %s (net '%s')\n",
  1108				dev_name(&rdev->dev), dev_name(&net->dev));
  1109			rio_scan_mport(net->hport);
  1110		}
  1111	}
  1112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

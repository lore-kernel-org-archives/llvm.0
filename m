Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC13E17BBF;
	Fri,  9 Aug 2024 13:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723208644; cv=none; b=RcfiRZeLgKXpHbTnME62rT2/dOdzMWI3J0pwW1mAnZUPt/qtBRm+6rUNvhGprYlmmzYXLmDci2MbnHmo6yiRx0znlyxlhCtBqf4wgLZKMymALEO8pfdWg0qU9f1r9RDPWm4WOX0To9a+TV90A5f0c3gMsxpATO1xn4Ap4ipEFNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723208644; c=relaxed/simple;
	bh=Iu9g4cXXQfyRBajjpYj9YppWW91EA9ZF/wnThkZr79Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRMeanPeCsHR7nOWCmNwDSm+E7hWk2C9xrYraaoT+maiAbyN8dyZ+qrv8dVEwVM1BXf1WNWSnjxo14ek0AKHInkoeJijzpGguUDkAGtUyAHK1wtULvlrZdRlh5/ucl+H6OaYbIV5NCcQbMCDCJzj0ApADHmc2EKKyJRjaQc0Ll4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5ksVXEx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5ksVXEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723208643; x=1754744643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Iu9g4cXXQfyRBajjpYj9YppWW91EA9ZF/wnThkZr79Y=;
  b=d5ksVXExHwmFomxlUJlt9HZanGMMlro/p5M45owm1veFXG/GOKO3EtTR
   ayh8iRrv8I8Cj3kgXfza/Wy/ToqjDTx0Sp9iH4+NnDQORx5nW01NXPOSR
   ojm5vU5xU8EH9aaLy4LCWWtMvdrv5Q6df1KrVM+RnEw0MPXwN5+hy4JCZ
   bLLfzqY7NT6TT6lgLsll/8+7+TAsbF6gndNT4p8sxz8YLIzfV72iM2bkg
   AtEmFIL3cxtTNh6cv5uFhZsq378RbWNNiPwvHfO0fJirTk5XOO9Pm2p+W
   Z9OzvbNYOzw/4TV0ebAl0ipd2LgfX1X1LEWFmw8hCrbwc6uLVeuRQ/kqV
   Q==;
X-CSE-ConnectionGUID: MbiATAKoRf665a140Icurg==
X-CSE-MsgGUID: dTE43loHTvG3MhXoJM+Tfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21507892"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="21507892"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 06:04:02 -0700
X-CSE-ConnectionGUID: tyr/c8aoRLmCsE+IMHkZEA==
X-CSE-MsgGUID: ee4Kc0tlTYGPM+DYHbq6qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="57443158"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 09 Aug 2024 06:04:00 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scPH8-00082a-25;
	Fri, 09 Aug 2024 13:03:49 +0000
Date: Fri, 9 Aug 2024 21:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-usb@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org, venkat.jayaraman@intel.com,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: Re: [PATCH] usb: typec: ucsi: Add DATA_RESET option of Connector
 Reset command
Message-ID: <202408092049.X5fsVaNn-lkp@intel.com>
References: <20240808231443.1772374-1-venkat.jayaraman@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808231443.1772374-1-venkat.jayaraman@intel.com>

Hi Venkat,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v6.11-rc2 next-20240809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Venkat-Jayaraman/usb-typec-ucsi-Add-DATA_RESET-option-of-Connector-Reset-command/20240809-122908
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240808231443.1772374-1-venkat.jayaraman%40intel.com
patch subject: [PATCH] usb: typec: ucsi: Add DATA_RESET option of Connector Reset command
config: i386-buildonly-randconfig-005-20240809 (https://download.01.org/0day-ci/archive/20240809/202408092049.X5fsVaNn-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408092049.X5fsVaNn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408092049.X5fsVaNn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/ucsi/ucsi.c:1347: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Hard Reset bit field was defined with value 1 in UCSI spec version 1.0.


vim +1347 drivers/usb/typec/ucsi/ucsi.c

  1345	
  1346	/**
> 1347	 * Hard Reset bit field was defined with value 1 in UCSI spec version 1.0.
  1348	 * Starting with spec version 1.1, Hard Reset bit field was removed from the
  1349	 * CONNECTOR_RESET command, until spec 2.0 reintroduced it with value 0, so, in effect,
  1350	 * the value to pass in to the command for a Hard Reset is different depending
  1351	 * on the supported UCSI version by the LPM.
  1352	 *
  1353	 * For performing a Data Reset on LPMs supporting version 2.0 and greater,
  1354	 * this function needs to be called with the second argument set to 0.
  1355	 */
  1356	static int ucsi_reset_connector(struct ucsi_connector *con, bool hard)
  1357	{
  1358		u64 command;
  1359	
  1360		command = UCSI_CONNECTOR_RESET | UCSI_CONNECTOR_NUMBER(con->num);
  1361	
  1362		if (con->ucsi->version < UCSI_VERSION_1_1)
  1363			command |= hard ? UCSI_CONNECTOR_RESET_HARD_VER_1_0 : 0;
  1364		else if (con->ucsi->version >= UCSI_VERSION_2_0)
  1365			command |= hard ? 0 : UCSI_CONNECTOR_RESET_DATA_VER_2_0;
  1366	
  1367		return ucsi_send_command(con->ucsi, command, NULL, 0);
  1368	}
  1369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

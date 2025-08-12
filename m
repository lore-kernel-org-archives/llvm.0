Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CEB1E32D3;
	Tue, 12 Aug 2025 01:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754963873; cv=none; b=ocX+9+FKx6rFRkIvKdqOIn9YZKsjDZUGEsvZj1csulycKIRZ7OearIczQbAzfJfrF3sQ4p4rCTTJ39auLXsc7v3ElloZNOWVIKxUwKqltIboATuaVvibozjjIKKG8NZa9Ll+xxsXr1Tyrk3OFjORSro1O3UUdm22k7jDDf5g5pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754963873; c=relaxed/simple;
	bh=Qx071dDd7KP7Mdv3hH4EvJNOeYH7CLLLCfN3/r8YVSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MDgoojCusANE6GAxqvwmlnEMAA8DeI26Vc0FfxBV/hq8m0huzstpOqbVun1znAoRqdF0wW/M1luq6ryQEDzfoVzfycuHTYcg11GLMSVWUePTuUYKLritSY2H1PWeAk+O0bpxv9B7JTCtZ3QbvNNSli7hsP5wqEc2cysIm1jSQvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONKGH043; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONKGH043"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754963871; x=1786499871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qx071dDd7KP7Mdv3hH4EvJNOeYH7CLLLCfN3/r8YVSI=;
  b=ONKGH043t2rWhq2x+6BOxDDmxSAMGxM0kegEk6LZX7jd74O6iY2IMWd8
   mid3nVmKEiWOyr2z6pLG66Z22OI/nX8r8VryWzj8YRkgLrxVo5Y7f8t+0
   jUXg/7jcLMQJ+et8A7ZtA3j+vrbuVU99UXcV5cRcmLq8pRW5ljs7VBiKw
   o4vW9NFzmZYts0QL1UpnNiK9QY/Y7zirag5Iu3Myg8SomZQ2TYpVUij4+
   wazG2zuOdOh/Be/5Mu+uLNdWPSWzrEVg4Cwv5XMmssP1HlQGfRgb1ZL6K
   N8dqkOg+ESrR0jEjlDuiKjNs8K2MkKoUBBmXkscwaniF6wwiFGhMXIPb2
   A==;
X-CSE-ConnectionGUID: RtdOoGwkRDOlphhc1olBoQ==
X-CSE-MsgGUID: K55/AFrrTIKIYyxi27frOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57130208"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57130208"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 18:57:51 -0700
X-CSE-ConnectionGUID: jHVKlFXGRmuO+2fTRzHUOA==
X-CSE-MsgGUID: I0KYCu56Siqb1Y0OWzZh4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166446122"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 11 Aug 2025 18:57:49 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uleGp-0003CJ-1u;
	Tue, 12 Aug 2025 01:57:47 +0000
Date: Tue, 12 Aug 2025 03:57:02 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/umh-h 9/10]
 drivers/block/drbd/drbd_nl.c:383:8: error: call to undeclared function
 'call_usermodehelper'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202508120340.IMBXzPpp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/umh-h
head:   a1a2ca5277223b8a92db92f3f53fdafe0c462675
commit: d2f44a17dab4dab7e29a9fbde3594789beb8fcd8 [9/10] modules/kmod: remove transitive include of umh.h
config: i386-buildonly-randconfig-2003-20250812 (https://download.01.org/0day-ci/archive/20250812/202508120340.IMBXzPpp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120340.IMBXzPpp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508120340.IMBXzPpp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/block/drbd/drbd_nl.c:383:8: error: call to undeclared function 'call_usermodehelper'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     383 |         ret = call_usermodehelper(drbd_usermode_helper, argv, envp, UMH_WAIT_PROC);
         |               ^
>> drivers/block/drbd/drbd_nl.c:383:62: error: use of undeclared identifier 'UMH_WAIT_PROC'
     383 |         ret = call_usermodehelper(drbd_usermode_helper, argv, envp, UMH_WAIT_PROC);
         |                                                                     ^
   drivers/block/drbd/drbd_nl.c:425:8: error: call to undeclared function 'call_usermodehelper'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     425 |         ret = call_usermodehelper(drbd_usermode_helper, argv, envp, UMH_WAIT_PROC);
         |               ^
   drivers/block/drbd/drbd_nl.c:425:62: error: use of undeclared identifier 'UMH_WAIT_PROC'
     425 |         ret = call_usermodehelper(drbd_usermode_helper, argv, envp, UMH_WAIT_PROC);
         |                                                                     ^
   4 errors generated.


vim +/call_usermodehelper +383 drivers/block/drbd/drbd_nl.c

b411b3637fa71f Philipp Reisner     2009-09-25  353  
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  354  int drbd_khelper(struct drbd_device *device, char *cmd)
6b75dced005c7f Philipp Reisner     2011-03-16  355  {
6b75dced005c7f Philipp Reisner     2011-03-16  356  	char *envp[] = { "HOME=/",
6b75dced005c7f Philipp Reisner     2011-03-16  357  			"TERM=linux",
6b75dced005c7f Philipp Reisner     2011-03-16  358  			"PATH=/sbin:/usr/sbin:/bin:/usr/bin",
6b75dced005c7f Philipp Reisner     2011-03-16  359  			 (char[20]) { }, /* address family */
6b75dced005c7f Philipp Reisner     2011-03-16  360  			 (char[60]) { }, /* address */
6b75dced005c7f Philipp Reisner     2011-03-16  361  			NULL };
0982368bfd5964 Lars Ellenberg      2016-06-14  362  	char mb[14];
8ab761e17efa75 Greg Kroah-Hartman  2017-08-29  363  	char *argv[] = {drbd_usermode_helper, cmd, mb, NULL };
a6b32bc3cebd3f Andreas Gruenbacher 2011-05-31  364  	struct drbd_connection *connection = first_peer_device(device)->connection;
6b75dced005c7f Philipp Reisner     2011-03-16  365  	struct sib_info sib;
6b75dced005c7f Philipp Reisner     2011-03-16  366  	int ret;
6b75dced005c7f Philipp Reisner     2011-03-16  367  
bde89a9e151b48 Andreas Gruenbacher 2011-05-30  368  	if (current == connection->worker.task)
bde89a9e151b48 Andreas Gruenbacher 2011-05-30  369  		set_bit(CALLBACK_PENDING, &connection->flags);
6f3465ed82b109 Lars Ellenberg      2012-07-30  370  
0982368bfd5964 Lars Ellenberg      2016-06-14  371  	snprintf(mb, 14, "minor-%d", device_to_minor(device));
bde89a9e151b48 Andreas Gruenbacher 2011-05-30  372  	setup_khelper_env(connection, envp);
6b75dced005c7f Philipp Reisner     2011-03-16  373  
1090c056c5eb6d Lars Ellenberg      2010-07-19  374  	/* The helper may take some time.
1090c056c5eb6d Lars Ellenberg      2010-07-19  375  	 * write out any unsynced meta data changes now */
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  376  	drbd_md_sync(device);
1090c056c5eb6d Lars Ellenberg      2010-07-19  377  
8ab761e17efa75 Greg Kroah-Hartman  2017-08-29  378  	drbd_info(device, "helper command: %s %s %s\n", drbd_usermode_helper, cmd, mb);
3b98c0c2093d1f Lars Ellenberg      2011-03-07  379  	sib.sib_reason = SIB_HELPER_PRE;
3b98c0c2093d1f Lars Ellenberg      2011-03-07  380  	sib.helper_name = cmd;
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  381  	drbd_bcast_event(device, &sib);
a29728463b254c Andreas Gruenbacher 2014-07-31  382  	notify_helper(NOTIFY_CALL, device, connection, cmd, 0);
8ab761e17efa75 Greg Kroah-Hartman  2017-08-29 @383  	ret = call_usermodehelper(drbd_usermode_helper, argv, envp, UMH_WAIT_PROC);
b411b3637fa71f Philipp Reisner     2009-09-25  384  	if (ret)
d01801710265cf Andreas Gruenbacher 2011-07-03  385  		drbd_warn(device, "helper command: %s %s %s exit code %u (0x%x)\n",
8ab761e17efa75 Greg Kroah-Hartman  2017-08-29  386  				drbd_usermode_helper, cmd, mb,
b411b3637fa71f Philipp Reisner     2009-09-25  387  				(ret >> 8) & 0xff, ret);
b411b3637fa71f Philipp Reisner     2009-09-25  388  	else
d01801710265cf Andreas Gruenbacher 2011-07-03  389  		drbd_info(device, "helper command: %s %s %s exit code %u (0x%x)\n",
8ab761e17efa75 Greg Kroah-Hartman  2017-08-29  390  				drbd_usermode_helper, cmd, mb,
b411b3637fa71f Philipp Reisner     2009-09-25  391  				(ret >> 8) & 0xff, ret);
3b98c0c2093d1f Lars Ellenberg      2011-03-07  392  	sib.sib_reason = SIB_HELPER_POST;
3b98c0c2093d1f Lars Ellenberg      2011-03-07  393  	sib.helper_exit_code = ret;
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  394  	drbd_bcast_event(device, &sib);
a29728463b254c Andreas Gruenbacher 2014-07-31  395  	notify_helper(NOTIFY_RESPONSE, device, connection, cmd, ret);
b411b3637fa71f Philipp Reisner     2009-09-25  396  
bde89a9e151b48 Andreas Gruenbacher 2011-05-30  397  	if (current == connection->worker.task)
bde89a9e151b48 Andreas Gruenbacher 2011-05-30  398  		clear_bit(CALLBACK_PENDING, &connection->flags);
c2ba686f353972 Lars Ellenberg      2012-06-14  399  
b411b3637fa71f Philipp Reisner     2009-09-25  400  	if (ret < 0) /* Ignore any ERRNOs we got. */
b411b3637fa71f Philipp Reisner     2009-09-25  401  		ret = 0;
b411b3637fa71f Philipp Reisner     2009-09-25  402  
b411b3637fa71f Philipp Reisner     2009-09-25  403  	return ret;
b411b3637fa71f Philipp Reisner     2009-09-25  404  }
b411b3637fa71f Philipp Reisner     2009-09-25  405  

:::::: The code at line 383 was first introduced by commit
:::::: 8ab761e17efa75449db2d71dc6fabf96d110588c drbd: rename "usermode_helper" to "drbd_usermode_helper"

:::::: TO: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BD8348458;
	Thu, 15 Jan 2026 13:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483028; cv=none; b=gmtIb5MouGCZj0VJJy+P1lxxWY/lVpXGipTg1TJMtvQgMg0nQj4XWOv1H9KdHd4iTUknvcYRFiRpTWd1qg6UkKatVcKjUsMmtfHBhTc2NmWvY+cbGc6D7GODn6RiClFw0QjdPaj7t3ujJWOYsb9jMnvChhE8XDZuNBfusJsQOdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483028; c=relaxed/simple;
	bh=LXAAtqwWDTcMivM/8r6216OVPqCU1gH+dga9Cygj59s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+68MCvMtYCxO60uWCXZg7H96d4v1Qv6Pcc5eOWiPEvPuJf+OMr1ubdLQBYNXvpPlNX9l1qDytUeHDMsUi7Sz1oKZHttJzwyecxmcxi0Vm9GldT+Z+kxQ8IyuiuFYSKGRK/23ftC1x+q2eOpVlw4Dc4tTEmeLZnMRgO7Va/qbiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IVQ2GZV/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVQ2GZV/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768483027; x=1800019027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LXAAtqwWDTcMivM/8r6216OVPqCU1gH+dga9Cygj59s=;
  b=IVQ2GZV/h/nd3JGlh34dJ35xUIng0330/FEZPboyPVfgH5xMUdWT02Ec
   vn01gAtxbaevzvCtBRUmvqVc2026KYAcy8BW68eVxIsISGmX9K4nc3nj2
   OMcZbPQpYvhbe3jv2MDDf3VI8MlkPNE8detoIxGZJFRTKYdDLNF3z4Hq3
   i3X1NetJYowN2rNGzY/S3QpAFBPsV85uw08JoRied4w5MuL9PiHnTrw90
   kh2NoW0qY9U2BmOQg12+ku1e2QcQKbUNOdEWXdTmbVdfW1Jh2Fcz9mmtz
   UDlHbJfNKGeq7oloVT0tlSvsMrOf0t6Wf1+FMG0oWCOj2usu1FjkF3cbo
   g==;
X-CSE-ConnectionGUID: L7qHrIeFSYyYKq2tRfE+xQ==
X-CSE-MsgGUID: 47PFOnrwSjiD3HsPUtQX2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="81151173"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="81151173"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 05:17:07 -0800
X-CSE-ConnectionGUID: yGhCw92URRGxSAJ1pglvGw==
X-CSE-MsgGUID: LxvWpiDCQgKBlWUW5YYMfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="242493058"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Jan 2026 05:17:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgNDi-00000000Hzc-1VVZ;
	Thu, 15 Jan 2026 13:17:02 +0000
Date: Thu, 15 Jan 2026 21:16:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 7/7] net: wwan: hwsim: support NMEA port emulation
Message-ID: <202601152039.wm03lOE5-lkp@intel.com>
References: <20260109010909.4216-8-ryazanov.s.a@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109010909.4216-8-ryazanov.s.a@gmail.com>

Hi Sergey,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main net-next/main net/main linus/master v6.19-rc5 next-20260115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sergey-Ryazanov/net-wwan-core-remove-unused-port_id-field/20260109-091432
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260109010909.4216-8-ryazanov.s.a%40gmail.com
patch subject: [RFC PATCH v5 7/7] net: wwan: hwsim: support NMEA port emulation
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260115/202601152039.wm03lOE5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152039.wm03lOE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601152039.wm03lOE5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wwan/wwan_hwsim.c:239:33: error: call to undeclared function 'from_timer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     239 |         struct wwan_hwsim_port *port = from_timer(port, t, nmea_emul.timer);
         |                                        ^
   drivers/net/wwan/wwan_hwsim.c:239:33: note: did you mean 'mod_timer'?
   include/linux/timer.h:151:12: note: 'mod_timer' declared here
     151 | extern int mod_timer(struct timer_list *timer, unsigned long expires);
         |            ^
>> drivers/net/wwan/wwan_hwsim.c:239:53: error: use of undeclared identifier 'nmea_emul'
     239 |         struct wwan_hwsim_port *port = from_timer(port, t, nmea_emul.timer);
         |                                                            ^
   2 errors generated.


vim +/from_timer +239 drivers/net/wwan/wwan_hwsim.c

   233	
   234	static void wwan_hwsim_nmea_emul_timer(struct timer_list *t)
   235	{
   236		/* 43.74754722298909 N 11.25759835922875 E in DMM format */
   237		static const unsigned int coord[4 * 2] = { 43, 44, 8528, 0,
   238							   11, 15, 4559, 0 };
 > 239		struct wwan_hwsim_port *port = from_timer(port, t, nmea_emul.timer);
   240		struct sk_buff *skb;
   241		struct tm tm;
   242	
   243		time64_to_tm(ktime_get_real_seconds(), 0, &tm);
   244	
   245		mod_timer(&port->nmea_emul.timer, jiffies + HZ);	/* 1 second */
   246	
   247		skb = alloc_skb(NMEA_MAX_LEN * 2, GFP_KERNEL);	/* GGA + RMC */
   248		if (!skb)
   249			return;
   250	
   251		wwan_hwsim_nmea_skb_push_sentence(skb,
   252						  "$GPGGA,%02u%02u%02u.000,%02u%02u.%04u,%c,%03u%02u.%04u,%c,1,7,1.03,176.2,M,55.2,M,,",
   253						  tm.tm_hour, tm.tm_min, tm.tm_sec,
   254						  coord[0], coord[1], coord[2],
   255						  coord[3] ? 'S' : 'N',
   256						  coord[4], coord[5], coord[6],
   257						  coord[7] ? 'W' : 'E');
   258	
   259		wwan_hwsim_nmea_skb_push_sentence(skb,
   260						  "$GPRMC,%02u%02u%02u.000,A,%02u%02u.%04u,%c,%03u%02u.%04u,%c,0.02,31.66,%02u%02u%02u,,,A",
   261						  tm.tm_hour, tm.tm_min, tm.tm_sec,
   262						  coord[0], coord[1], coord[2],
   263						  coord[3] ? 'S' : 'N',
   264						  coord[4], coord[5], coord[6],
   265						  coord[7] ? 'W' : 'E',
   266						  tm.tm_mday, tm.tm_mon + 1,
   267						  (unsigned int)tm.tm_year - 100);
   268	
   269		wwan_port_rx(port->wwan, skb);
   270	}
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

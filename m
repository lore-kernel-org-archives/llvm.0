Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795140885;
	b=wqZ2VCieXltjFP/FtDSSG2Jz0QssLEpGW7C5Y00WWTkEpVI+53NcpzLHqWZ2Pg8c1ZPT
	 vEQo29Ts2B9S3hRlHNdotnwM8rOZd9p8FGHO687PFD0jGchGQB2lDxbw2BJMIt5FuzDBB
	 iIEdNEbdyjDu15XntyAZDY6kxW6jhy2MHbwYjJXuRat7KPRY7gWmxaFfsnpOxmg7Jpemg
	 QLenyaiBIgUY/02I7A1GNXPVGEjRqSFXBBpGIuNpCMJMoDQRzYgHfQytMgppGJm1loIx0
	 AM4+QZ8lhPba2PsQDoc7zslo2Jb/j4saHGzN/AmWyaPTLaVaWeFm6d3UHfzXzYYRoyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795140885;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=FdLagE20xckeK88G2jVV+nvgmytAhD6GFPZ4ISYn+ok=;
	b=JeuTrI3HRrV56Omocug5NiCaatwYJNKPcuhfBB3P/4YhRsf85/Nbm84w/D5oo6xXLK50
	 9W8IDQ8GtDfsvJOuElt/cSdEwzbZOzJA5eM3SsM2v70QSE5ZjPQ7uo01H7rhpwc3og0il
	 zQesZRz/IDs3COT7NjH6qtwUz4MfMjCbQQZFqyqzTcaKcI2j5bwV2xJZX2vAMunakK3Rz
	 lHnisPJnYYc53ajLJVJxGGl5JUBGcUytjlAJDy5XPX3pwI/MeEDsOPJFuDldvy/mWeLrR
	 PJLb7J9jp6RhsiGeftkpMRAWT8zUqX4C6zIM6/qrT8Dfxz68EliWw9TGsH6sV/tOBDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B9nu9pQG;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5193606A320;
	Fri, 20 Nov 2026 02:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5193606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B9nu9pQG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795140886; x=1826676886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T9Y4lim52oYCdSAIVMkmqTfqUDlfhPNGv2sRd4QoMNc=;
  b=B9nu9pQGJPZDjxeazLcHJxsJ6sZ7pNR+4V2qiW7bNa5Rrc5UBo+JRbEC
   zff+15QHfacnG2x9P1wedtXOJe5iKEm1zBAhA00YqxfaxFCQGn/i4VmRm
   R/op2G8Dp4uxe0vi8ould6YgZ5zujsNQF8ibggPo0bP0TYk0YhOQRSElO
   PClfwN0/fJP2I+lik4aLvt5A5oc7cFO3Bg16XIHBc9mammQYx2/8QWuM3
   RdHF7uGZGhZ+0BZ4c8UxBazLmiREEAkIgP1hTJNfeyMVMBumYHKEvY4Yk
   MULujcW2Mn46Mkrik2/qieQC/W0fYf96ILHvjzYC7gX8i0NbaHZuMSq32
   A==;
X-CSE-ConnectionGUID: 7viuPJZdSM2wSWpSRKNxlw==
X-CSE-MsgGUID: V9+DAZpNQwG5WiDuVDT0nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3912481"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3912481"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:14:45 -0800
X-CSE-ConnectionGUID: snmrXm6GRDqVl7DgsoHI8g==
X-CSE-MsgGUID: gvmG+in/TbC0emdaGi1Lbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10727124"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Nov 2026 18:14:37 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUE93-00000001GxR-1lW1;
	Fri, 20 Nov 2026 02:14:33 +0000
Date: Fri, 20 Nov 2026 10:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Williamson <alex@shazbot.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alex Williamson <alex@shazbot.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	David Lechner <dlechner@baylibre.com>, Armin Wolf <W_Armin@gmx.de>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Marco Elver <elver@google.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Bradley Morgan <brads@mainlining.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Petr Mladek <pmladek@suse.com>,
	Pnina Feder <pnina.feder@mobileye.com>,
	Mete Durlu <meted@linux.ibm.com>
Subject: Re: [PATCH] s390/vfio: Allow untainted use of driver_override
Message-ID: <202611200956.drD2v0r8-lkp@intel.com>
References: <20261119051507.3306075-1-alex@shazbot.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119051507.3306075-1-alex@shazbot.org>

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvms390/next]
[also build test ERROR on awilliam-vfio/next soc/for-next awilliam-vfio/for-linus linus/master v7.4-rc3 next-20261116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Williamson/s390-vfio-Allow-untainted-use-of-driver_override/20261118-221504
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git next
patch link:    https://lore.kernel.org/r/20261119051507.3306075-1-alex%40shazbot.org
patch subject: [PATCH] s390/vfio: Allow untainted use of driver_override
config: s390-defconfig (https://download.01.org/0day-ci/archive/20261120/202611200956.drD2v0r8-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611200956.drD2v0r8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611200956.drD2v0r8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/s390/cio/vfio_ccw_drv.c:378:4: error: field designator 'support_driver_override' does not refer to any field in type 'struct device_driver'
     378 |                 .support_driver_override = true,
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/s390/crypto/vfio_ap_drv.c:65:10: error: field designator 'support_driver_override' does not refer to any field in type 'struct device_driver'
      65 |         .driver.support_driver_override = true,
         |         ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +378 drivers/s390/cio/vfio_ccw_drv.c

   373	
   374	static struct css_driver vfio_ccw_sch_driver = {
   375		.drv = {
   376			.name = "vfio_ccw",
   377			.owner = THIS_MODULE,
 > 378			.support_driver_override = true,
   379		},
   380		.subchannel_type = vfio_ccw_sch_ids,
   381		.irq = vfio_ccw_sch_irq,
   382		.probe = vfio_ccw_sch_probe,
   383		.remove = vfio_ccw_sch_remove,
   384		.shutdown = vfio_ccw_sch_shutdown,
   385		.sch_event = vfio_ccw_sch_event,
   386		.chp_event = vfio_ccw_chp_event,
   387	};
   388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107119;
	b=zQrZKjDXE0ce7mBjl3CYw1W4E2p+GrYsH/rDoKJjOmojpGHoqahbMvdeq0id09BzhqBT
	 l6oSd1zZ7WXGOSEP6C8ryVfos99xB5pbRFd+KT3sqm3dLJIdUtF6K8fpFbtyQJuRWJyXG
	 dhodFAK5GRPRJQvNva3gEB51CBxn656KeWjjveZMxzHbpEcTXVYfmU0CI2IAaz4XyZYyW
	 JFlo9zWr4qK3klXh24sQmgM3dp5djLUBjV6VbwkPWwLTzrWm0TmOrhY5TEICl8R45YNGd
	 WqVsz08Ee5o0t1rWuc5S4PYKdvC7jQEqKAdcZegbZFCm+eHtqHxd0zld1duh1yRZ3IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107119;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=jOmSWaH0NoseM7eEQor0PCauI2FtvndXKKCrHJYdp5Y=;
	b=bHX6KLobBNm57TrGkFTg1j9Ei5cc4EsZ7YlTv5wpITtH5V35AmhFbQM7zuH3IgwopeVH
	 e8PSPRtI5wnIzLeXDdE0lAqomkSt8u1VdNIT/bWA+IuIvHL9YLK3/qi0YUHXwKkX1T7+f
	 +xFDQcEe2BSIIt0vZIKbAIsPZVBsh4MAq6eSPziOiJWs6ZDAuZqBK+kdkzklE7v0dovC1
	 zMDqbYoKG9CGo4Sz0GTNyyK6JOShFJldAXaffJ7KqPnuANghpXBk6d6PQ6XcWd5ysJ/Ja
	 hug//RY6e4nr48XEfhAC2WMIzH9qs3IFPk0wCHx/qzWjTehkx9jflouGfe0guvUSIvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="dzTM/3T7";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65D3606A326;
	Thu, 19 Nov 2026 16:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A65D3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dzTM/3T7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795107119; x=1826643119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Ypv7CUPwYDm+rPJoVRIsIBp43C79oWLpiPYtRb+HX8=;
  b=dzTM/3T7y8rsOZ6LtE1ril6PTClhrR0tFLQZcquS0lG4D/xy5IHYNU/q
   94hoQ6/YJyLQC6zFufFwxPjOKOJQY3ITa4qHQd250qxZt8Z+R2ptCCwb9
   WSkljkidZctIZ5LYbOorlQXxmL5FJSI2sJaRNiB3lKSV8t0d492nDIXFc
   cFh5FPgOZESME1PlLrS9ra+1Z6VV9D2J8wn6N4Xw8SMRSJ9rfTmRNN4Ex
   NxiWSVjqAt9CxqGpIpAbpgjN+qH9MaXRhF5yRCH3Sks7Sl6uvPXC4FLYO
   zj9YuDN69x94fAQv7RJ+A504kXhDpsZ4qIRNe1rySB1Fk25N7PSJWcs9+
   w==;
X-CSE-ConnectionGUID: HFFGpaYYRL+U6WsTHBpF1Q==
X-CSE-MsgGUID: ACz3n2RUROGT65I8XF7yjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3886043"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3886043"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:51:58 -0800
X-CSE-ConnectionGUID: 47DHlI57QH+bfQ+a9JbaIA==
X-CSE-MsgGUID: /NxNv2KZTm+aJAcr17dwOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10811352"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Nov 2026 08:51:52 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU5MR-00000001G9s-1vGF;
	Thu, 19 Nov 2026 16:51:47 +0000
Date: Fri, 20 Nov 2026 00:51:44 +0800
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
Subject: Re: [PATCH] vfio: Allow untainted use of driver_override
Message-ID: <202611200005.ynk0zwGb-lkp@intel.com>
References: <20261118235645.2907908-2-alex@shazbot.org>
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
In-Reply-To: <20261118235645.2907908-2-alex@shazbot.org>

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on awilliam-vfio/next]
[also build test ERROR on linus/master v7.4-rc3 next-20261116]
[cannot apply to awilliam-vfio/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Williamson/vfio-Allow-untainted-use-of-driver_override/20261118-165644
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20261118235645.2907908-2-alex%40shazbot.org
patch subject: [PATCH] vfio: Allow untainted use of driver_override
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20261120/202611200005.ynk0zwGb-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3b14d7c370558b46e5f0c6494a05c492e59bf32c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611200005.ynk0zwGb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611200005.ynk0zwGb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/pci/vfio_pci.c:264:9: error: field designator 'support_driver_override' does not refer to any field in type 'struct device_driver'
     264 |                             .support_driver_override = true },
         |                             ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +264 drivers/vfio/pci/vfio_pci.c

   255	
   256	static struct pci_driver vfio_pci_driver = {
   257		.name			= "vfio-pci",
   258		.id_table		= vfio_pci_table,
   259		.probe			= vfio_pci_probe,
   260		.remove			= vfio_pci_remove,
   261		.sriov_configure	= vfio_pci_sriov_configure,
   262		.err_handler		= &vfio_pci_err_handlers,
   263		.driver		= { .pm = pm_ptr(&vfio_pci_pm_ops),
 > 264				    .support_driver_override = true },
   265		.driver_managed_dma	= true,
   266	};
   267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

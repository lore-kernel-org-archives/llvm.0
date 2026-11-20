Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157967;
	b=sWuCnh8NkxTctcKN7gWttpfbZVhxNZsC/d0d65Nih5fHS6glWnseDifRnU4UOdstI50A
	 Dnu6x8+x4jHAp7ZeuqiI5ZlwCgTt/UrAlDwOtKQNsjrOxaQM5EwF6osEPQQRkwt6wIPlt
	 NJiYc68lRjlTEvQ5myv60LpD43fvWdqwDSHz+nRLy7vsBrK5GjYZZq1Z5BGFRnJwB4Bqq
	 vUZcopgviUAb8OQSxLJdGgiw7L+1Cd96FLD4CxMJPGXno1UBFKXDaoQaoeyNepwO+t9hg
	 I0Wf59yCgG6tp1l+vlyFzxjruUZdLeaXWw+JpdKICkwZvMUZT8hI7aSrHosVctyhKGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157967;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GqQKDW2mAXubWgPJoR5AXq1PFV8yqcFgiU2g7CuZ8IY=;
	b=ywMxWaH2dfG/6/DWooJEPqfdH7QZwos+Jn1WN4ApD7TtN/9r67n0+7hhcuZrEgGU2HMZ
	 ojzH2qHwR7e0emY7/wT0STqEUs9MrsWh0cBR72L2duu46wx0fHu+DynxAbogUtiD5JGEq
	 fW/xh5AbZhmDExKyoUL811xGm0sAk8MrwXP6MrOwPP09Pl9Posw8YEvWbH97Vxl9HhfoK
	 TkluCupAcqeC9csOVyfRpMITByyRggb7bdeHcAOzY5cTDhu9KU4xO1maIeafVINI2pTvo
	 1Bv85DSQC+HfCb3cYV4nhfTmvHriwewPevc8vMAlMZrc+oeFV8bcZ5LRc8+h3amsDMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oC6ok8kQ;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B2F606A320;
	Fri, 20 Nov 2026 06:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1B2F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oC6ok8kQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795157966; x=1826693966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SnI+Dzdsr+rQqdwN9p1c4GpH9EILitFRJyMiNp8nR0I=;
  b=oC6ok8kQgLzzJStZRpADZyMftLE9SMnNQHBQfpE+4VKNDB1yvVgq5S7x
   CvXrdV55pMZ3SCHClX+lFtmm4/a0HdiUbSG94UGKLbDy+HJ3FTpCfab0S
   f/cqpQ+R55hIK6IdyzBKb/QUWiL52nFQ5QV4q/CBL8HV6nJCzUi7dRiat
   qJ0SN5wxcr3RFGgy0pPS7uo720Sb7Y0t4KeYW6Fmz7K7BUxHoiB8RI896
   rfYLJ9Z7BESu/xCQWCena+dnJQJDElZ1Dyi1wsOjOcSD22Fe67MWB7Upq
   cBuse5ovErjtvCjnxWglLYyS6VyqYmoyOXWm9CKETKtEQRnhblFrSOzqh
   Q==;
X-CSE-ConnectionGUID: xPoaNceQTiazu9PMXfHlcw==
X-CSE-MsgGUID: kp3FZF5AQLm5JZBgSnCKNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4071515"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4071515"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 22:59:25 -0800
X-CSE-ConnectionGUID: Gs41PpVETNiQ+MR09BIa5Q==
X-CSE-MsgGUID: qRKObIMLQoS+9yliyccTyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="12474588"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 19 Nov 2026 22:59:20 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUIaZ-00000001HI3-2xJc;
	Fri, 20 Nov 2026 06:59:15 +0000
Date: Fri, 20 Nov 2026 14:58:40 +0800
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
Subject: Re: [PATCH] PCI: Allow untainted driver_override for PCI stub drivers
Message-ID: <202611201442.3jFAppXk-lkp@intel.com>
References: <20261118235645.2907908-1-alex@shazbot.org>
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
In-Reply-To: <20261118235645.2907908-1-alex@shazbot.org>

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v7.4-rc3 next-20261119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Williamson/PCI-Allow-untainted-driver_override-for-PCI-stub-drivers/20261118-165643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20261118235645.2907908-1-alex%40shazbot.org
patch subject: [PATCH] PCI: Allow untainted driver_override for PCI stub drivers
config: loongarch-randconfig-1000-20261120 (https://download.01.org/0day-ci/archive/20261120/202611201442.3jFAppXk-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611201442.3jFAppXk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611201442.3jFAppXk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/pci-stub.c:40:10: error: field designator 'support_driver_override' does not refer to any field in type 'struct device_driver'
      40 |         .driver.support_driver_override = true,
         |         ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +40 drivers/pci/pci-stub.c

    34	
    35	static struct pci_driver stub_driver = {
    36		.name		= "pci-stub",
    37		.id_table	= NULL,	/* only dynamic id's */
    38		.probe		= pci_stub_probe,
    39		.driver_managed_dma = true,
  > 40		.driver.support_driver_override = true,
    41	};
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

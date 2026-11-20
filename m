Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795148495;
	b=KhAgdngsz219Tfg/tgwZf+2Z80L39oVRVTXyt5EXuGMaZDXTyCngY3oSwMsZIqhboTYf
	 DEqxp5Eu+9Ww5BBM6ItEfmcThcxG57qQXj81o63/ZnC9SmHB40J1uh3q51gGNh30EoJQK
	 iUDoJWwSrF4quuN3RGvRpNjJ/UB4zXLD/oCKiz7EWnvvkX5lPaLDX19XVbvNOZNu9iNfX
	 mSTFs4Jm26OEG6AyxPn51XXovnxFmuhOkppb1sMUxU2/ef2ZNi6Ok1TYOGtlo47VkqF4j
	 knV8MO5lyKJfM/4cq/fkcvV3Xhx3Kq/65zjI9MXhbqkIBg9yVIqXrFx8u585Ut0YYow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795148495;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=aCF/9QsXGxPiuVfa9izWAY1bS5suwF+J5Gv8PYcgibE=;
	b=SueYLVOdfCHw8L4djrNy/YtVtKHGwZj70Lls61g+Ptkk7ubL3GfNTAj90sqG56Pm4YMl
	 /TVbJ3GyrA/73jXROiRfSLGl8AFOkGaxuJXr8jGDXE2tV8OLM4l2xBI5q9kS/nKOw9R9n
	 vHavrHLvwxSdfPpV/Sht6uqWu08heiMlXk33v0K0Rx83r78pObGMwjSuFz4Oy0l8HXwkl
	 u2geg5jd3anEJttEcZY9uGkirh7KwVnKq3PrIqXMtPLTKR5fO/EnRqTmHlrOik6LAleBg
	 9CRF70rlTxSJPPDovPXwNSaso7PECVFGvTktBbqLRRteW6j8DIhg48kH1x/C9wONMAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d9Dtvzhp;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB66606A320;
	Fri, 20 Nov 2026 04:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCB66606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d9Dtvzhp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795148495; x=1826684495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hYIJ0a2DlFsoUIkgJ8frMlcR8Pb107JbX1ud/3a5NwA=;
  b=d9Dtvzhp0b2L5LJT1iA3NDrqJSvoeejKKLDI0Rp23CQ1/w81GGkkRY8X
   +CYD76rSSJL0gjL8Gg2iXQO6ZUTJE8JJoK4UCG0ITXWt28xDerjCs1+si
   YBB1sneXsQ4hjtBQXSlYJsnMB4WEL9pFCwKQyTFLVY33yhJS5mwVODeqU
   qaXrnP6prOywAyKIFc7ZywWYVOQmE4b2Ixj58BIuvGsq4XekvZhmS9rie
   o/auRQFqz/FXgREjA/ED+tuaLZEneVN4zuw4ouzZna4Q1WyV/cHH7IDoF
   NHTUfLsO9AzMU6lzFsvEAK89SJtxScbtvd0Vy/FXsYvjfA/5pLndBp/aw
   g==;
X-CSE-ConnectionGUID: /uJAPvi0TYKvRn/1EJ5bfw==
X-CSE-MsgGUID: /tsp0npbTZGYyD2EWI7ggw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3941977"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3941977"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 20:21:34 -0800
X-CSE-ConnectionGUID: QSyDhMpXTSyTx5+CPSQzGg==
X-CSE-MsgGUID: VvpOMlxNQyuEqgIo9lpwfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10692032"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 20:21:27 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUG7n-00000001H3D-1HgV;
	Fri, 20 Nov 2026 04:21:23 +0000
Date: Fri, 20 Nov 2026 12:20:27 +0800
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
Message-ID: <202611201122.JwnDSHON-lkp@intel.com>
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
[also build test ERROR on pci/for-linus linus/master v7.4-rc3 next-20261116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Williamson/PCI-Allow-untainted-driver_override-for-PCI-stub-drivers/20261118-165643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20261118235645.2907908-1-alex%40shazbot.org
patch subject: [PATCH] PCI: Allow untainted driver_override for PCI stub drivers
config: i386-buildonly-randconfig-1003-20261120 (https://download.01.org/0day-ci/archive/20261120/202611201122.JwnDSHON-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611201122.JwnDSHON-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611201122.JwnDSHON-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/pci-pf-stub.c:39:10: error: field designator 'support_driver_override' does not refer to any field in type 'struct device_driver'
      39 |         .driver.support_driver_override = true,
         |         ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +39 drivers/pci/pci-pf-stub.c

    33	
    34	static struct pci_driver pf_stub_driver = {
    35		.name			= "pci-pf-stub",
    36		.id_table		= pci_pf_stub_whitelist,
    37		.probe			= pci_pf_stub_probe,
    38		.sriov_configure	= pci_sriov_configure_simple,
  > 39		.driver.support_driver_override = true,
    40	};
    41	module_pci_driver(pf_stub_driver);
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

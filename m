Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793860151;
	b=syCg1LjkAQiLt1mKkTdnAjqy5M+1a8c8syQEl3IG4W7z4cuixoH0MZGXeozTBGJbxqnD
	 V2z9at6WhFUOggDBVzq/m9jc9HsHxAiYzxEzl5/9aXr4L72h+dgCHPfwFQJcRjcmN97dC
	 R6ml9Yn4j40XY4n/AkhKdi5CZOxU+oVRcql+COHQxVTJrSBHPM9SP4OlWYKEl2bHchv2Z
	 cuJXa0QMVSOrKrHqWY6xTyQoO8QDHrZDkdP+BOJXmqpWRGYK4hxohq1fUs76G0FwrxKDF
	 K055gYthlEs9NYQic4EYOPU33D4VWarrjGLFfPfqkToxpZZqcpO8sqxm/DJzAoP8tuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793860151;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=fT7Px+NmjCAA9PKMV95Cz4j5aB+r3wMHBoWzLVXxYrg=;
	b=f8ulXBiWQUkhLuWynhEgzkib1LRjUcHLC87lqrsND1sI20/JISuxyMO3bmDhhnIKvH8X
	 6hYIMbJucDAcczv1dhtvfPHGw7XkeMgYudnA5oaZA5fEVUV1xAzwHYHrufXFihbyIJ46K
	 wRc9gsyFIZD2rBfXFoHdNigUgG1wclH/VWINuXQGv1ehmd7uenJk3km94/mWBRo6hltud
	 Uzh0nvcdy3TeXU7VBNd9ywG11yBXnBG4CIhigsKtFv0VRjZpqmcigHqlSjtHWEkdXt5af
	 6pz7/85oDl0BF4X8acC7a3S8eTld0VJSiaTyIBJ9F882ph2iJ8p8f1Md1H4nZwQaG1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LWBwTpyI;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4981C606A332;
	Thu,  5 Nov 2026 06:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4981C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LWBwTpyI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793860151; x=1825396151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2ndfGt5xh6jwi3F6B4Ttw+51NBBwFube5hJI/DxpsGc=;
  b=LWBwTpyIvovOZff8bZ+13snebEb0lsN58SCmiUaS5PpDGYcmaGwtlpZX
   bMhMCApcVJLdl0h4qdMGlOk3OuKXLMYHzYIMM5YW06wtgOe1ARbE54p4M
   4zZbPZOuT/8ExLWWZCk7DF+JovUjsDAfqRH0ZC2gmDWn8bkjKHtvat6XK
   OujoTfH3Yg1qjaOoDdEeQqdUVBn1Pg4netJMXxpki/dg4eMNVyGSOzaZL
   Pt0N7RaaBw0UEu0pfTOPVPf7WZ3WwQ/DVog4ymtRT3W0DBy3yn6O3x0A8
   fhHLk4lrDyHmk69JWKMrMGA4qFUZBgnvk5fycXfoIBDADDJlw7cJRQOXG
   g==;
X-CSE-ConnectionGUID: r70oGXRLQjWeO077gDgCUw==
X-CSE-MsgGUID: qL5TD4rOSV21jGdI3usJZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2630134"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2630134"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 22:29:10 -0800
X-CSE-ConnectionGUID: +zSRKQ3YRb2fTMqeC7KvBg==
X-CSE-MsgGUID: dyyLTA/KQk+AWAdppHgdqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6763798"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Nov 2026 22:29:03 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOqy2-00000000lnL-2umG;
	Thu, 05 Nov 2026 06:28:58 +0000
Date: Thu, 5 Nov 2026 14:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kees Cook <kees@kernel.org>, Len Brown <lenb@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 9/9] gpio: shared: generalize most code to firmware nodes
Message-ID: <202611051423.Dk3ycCJc-lkp@intel.com>
References: <20261104-fwnode-for-each-prop-v1-9-6e28fe1c72c4@oss.qualcomm.com>
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
In-Reply-To: <20261104-fwnode-for-each-prop-v1-9-6e28fe1c72c4@oss.qualcomm.com>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/device-property-fix-fwnode_name_eq-for-empty-node-names/20261104-150343
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261104-fwnode-for-each-prop-v1-9-6e28fe1c72c4%40oss.qualcomm.com
patch subject: [PATCH 9/9] gpio: shared: generalize most code to firmware nodes
config: um-randconfig-1000-20261105 (https://download.01.org/0day-ci/archive/20261105/202611051423.Dk3ycCJc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051423.Dk3ycCJc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051423.Dk3ycCJc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpio/gpiolib-shared.c:28:
   In file included from drivers/gpio/gpiolib.h:16:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/gpio/gpiolib-shared.c:300:12: warning: function 'gpio_shared_fwnode_traverse' is not needed and will not be emitted [-Wunneeded-internal-declaration]
     300 | static int gpio_shared_fwnode_traverse(struct fwnode_handle *curr)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/gpio_shared_fwnode_traverse +300 drivers/gpio/gpiolib-shared.c

   299	
 > 300	static int gpio_shared_fwnode_traverse(struct fwnode_handle *curr)
   301	{
   302		int ret;
   303	
   304		if (gpio_shared_fwnode_ignore(curr))
   305			return 0;
   306	
   307		ret = gpio_shared_fwnode_scan_properties(curr);
   308		if (ret)
   309			return ret;
   310	
   311		fwnode_for_each_child_node_scoped(curr, child) {
   312			ret = gpio_shared_fwnode_traverse(child);
   313			if (ret)
   314				return ret;
   315		}
   316	
   317		return 0;
   318	}
   319	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

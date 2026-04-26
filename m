Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0849F27281E;
	Sun, 26 Apr 2026 16:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777221770; cv=none; b=nY9tg3nhgng+wvKr3+K7ur8ilQHQGvD6ZY8lVVw9+Y4AgRDe+BmNReRtBX4OUJc0zoCcpHqxaBmgqKjUv/rxn8uVB/T1uPuo+18P1KyEsNk+bwz23T2W//eNH5GFmiy4IC2dD1z7Yu+1hdGd5JIVPuPSl39MdjbrnVtetJt5HEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777221770; c=relaxed/simple;
	bh=XE2nKYblpdCSdRIAPbme03/8dvmfdFGgGQM2hyn5dEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XksAsA9r5mM+/rjhT+89T9KFtlKuUN+0ONtNqqm+lAQqNUcWvftn9TARN+7aDzDjFUPK8mWs0oYaBng6bKWI9LzRFYemeA6o5NetliHzqMbMOLXFuyxFu8epAYbMZ1iRZ26WXm7Rb6eyc46SkARNcTzMJP78x1d9GruvsMcfWDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5sTmk8s; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5sTmk8s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777221768; x=1808757768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XE2nKYblpdCSdRIAPbme03/8dvmfdFGgGQM2hyn5dEc=;
  b=g5sTmk8sdVruz9VFw2WEUbs+TpEjSr/2evwGseDtAlvDfjlGXEIbTXHO
   vvi72VUWeHQI5aziEZ4inZ0ueoERxAo0cKlpL8k5eSQQ29lMxN/p2k7zD
   78JjjdXEcYCg6BQMECFgTMNo2GhiORx8UmDM7R9uxRK8UaGIRFsMuHOZO
   3CQc6/tLQrAO994SDTEXWyzzsZmtOVasI+0WeJYHR/5G8CAyOIAehLRRS
   4ZkQPqRlaEGnyRWxIxIUBdWrbX/RcSSoNAbYSHq4Wz+f64dy7kRnmLhKX
   QGcZMcgkXXNOn+L33ZchWtLzsRC7qfD+ug2MMg9yHuANEOa/KVK3NAgoQ
   A==;
X-CSE-ConnectionGUID: 8bPjXx6RQva2IeaSGwEpcA==
X-CSE-MsgGUID: ZyHwxmAFSqOpeNEhQOBFYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="89207294"
X-IronPort-AV: E=Sophos;i="6.23,200,1770624000"; 
   d="scan'208";a="89207294"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 09:42:48 -0700
X-CSE-ConnectionGUID: CJ1mEGNBQ7C1MGDNwN1ypA==
X-CSE-MsgGUID: VtH3pctjSXmmWA3wQeMVKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,200,1770624000"; 
   d="scan'208";a="232552500"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Apr 2026 09:42:46 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wH2Z9-0000000083B-2oDJ;
	Sun, 26 Apr 2026 16:42:43 +0000
Date: Mon, 27 Apr 2026 00:42:25 +0800
From: kernel test robot <lkp@intel.com>
To: a0282524688@gmail.com, tmyu0@nuvoton.com, lee@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ming Yu <a0282524688@gmail.com>
Subject: Re: [PATCH v3 1/1] mfd: Add Host Interface (HIF) support for Nuvoton
 NCT6694
Message-ID: <202604270032.OVoX7km0-lkp@intel.com>
References: <20260422035307.2065172-2-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422035307.2065172-2-a0282524688@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-leds/for-leds-next linus/master lee-mfd/for-mfd-fixes v7.0 next-20260424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/a0282524688-gmail-com/mfd-Add-Host-Interface-HIF-support-for-Nuvoton-NCT6694/20260424-201531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20260422035307.2065172-2-a0282524688%40gmail.com
patch subject: [PATCH v3 1/1] mfd: Add Host Interface (HIF) support for Nuvoton NCT6694
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260427/202604270032.OVoX7km0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260427/202604270032.OVoX7km0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604270032.OVoX7km0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-nct6694.c:21:9: warning: 'NCT6694_GPIO_MOD' macro redefined [-Wmacro-redefined]
      21 | #define NCT6694_GPIO_MOD        0xFF
         |         ^
   include/linux/mfd/nct6694.h:27:9: note: previous definition is here
      27 | #define NCT6694_GPIO_MOD        NCT6694_RPT_MOD
         |         ^
   1 warning generated.


vim +/NCT6694_GPIO_MOD +21 drivers/gpio/gpio-nct6694.c

611a995e8ae1a5 Ming Yu 2025-09-12  15  
611a995e8ae1a5 Ming Yu 2025-09-12  16  /*
611a995e8ae1a5 Ming Yu 2025-09-12  17   * USB command module type for NCT6694 GPIO controller.
611a995e8ae1a5 Ming Yu 2025-09-12  18   * This defines the module type used for communication with the NCT6694
611a995e8ae1a5 Ming Yu 2025-09-12  19   * GPIO controller over the USB interface.
611a995e8ae1a5 Ming Yu 2025-09-12  20   */
611a995e8ae1a5 Ming Yu 2025-09-12 @21  #define NCT6694_GPIO_MOD	0xFF
611a995e8ae1a5 Ming Yu 2025-09-12  22  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

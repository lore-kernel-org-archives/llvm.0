Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294DC2D3206;
	Mon, 21 Jul 2025 12:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753101570; cv=none; b=XJqhw3N8PtCdA/AvngEQk59VCAqFBRiGBnUQtbyz9k9LCVTcWt1YKjAuXbQI6tAfg11YNHfnHDIedRXdyaoMX7BOwnL8apa/r2YtUbt1smfcKRdUYWN4LcErrzw8POFv+UakQY1D1emchB0m1gSOAb2mq7UpEhYsDStN6OlreJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753101570; c=relaxed/simple;
	bh=iiR1FFOV2ZzU5qWAzbQi6NjbvGro2kfiOZy+4xIRW8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJhZGVkIX7Jtc++stagEzsPljWqabDENG69ZyqHtaPW1t1PnDkeasOAttq+wllXRPoe314gq5H69DipbLES/j+pMSiionV6cj7rrwmQgXtJNo87EeCyTp99uPoa9oOSEaIjHW8Ll0EKQkzpbc5euKlLvk5XVI9eAJ855jpjjjZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQzRleBk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQzRleBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753101570; x=1784637570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iiR1FFOV2ZzU5qWAzbQi6NjbvGro2kfiOZy+4xIRW8E=;
  b=KQzRleBkJIRDQTdiGujjzkjk8oc2f7P/psOEnxBTk5USblnwIyznV2rl
   H65iwqKSjh1/6rJbVjb3ADq6HElWlKZmt6qKNRDBkJop4pq+7Rfo6NWV9
   XvMXgFkeaSEAmT8gwZfXPPKRwSOyIi3t2emUhnEccivZ5ssp4RLgYqXEO
   W+hqPVzivxApnwi6aia5dVnMVXZD11Ypmy7kRFfWLMJPW5t4DijXrXkTA
   SUbE6ewVRx8PVmnSezgFWpTmAcR/AkIqHvJdSgmzSZbkAzruLPl+1iFAQ
   jbmsyrNm6OPxoGUrr9mY7yDyaz9Q5JF6WGRKVcij7nW+X5A8l85Lavg2o
   g==;
X-CSE-ConnectionGUID: rcqO51hBS5CaqjIsAZj35g==
X-CSE-MsgGUID: eF58bNACQFe1XXqS0baqfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55164356"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="55164356"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 05:39:27 -0700
X-CSE-ConnectionGUID: nvPV/R2VS8mgn0J/TLblXA==
X-CSE-MsgGUID: AIiDAzKCRXG4Hs6s/55TuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="159556598"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Jul 2025 05:39:25 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udpnc-000GnV-05;
	Mon, 21 Jul 2025 12:39:20 +0000
Date: Mon, 21 Jul 2025 20:38:19 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksa Sarai <cyphar@cyphar.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/4] pidns: move is-ancestor logic to helper
Message-ID: <202507212040.eC5zmwiV-lkp@intel.com>
References: <20250721-procfs-pidns-api-v1-1-5cd9007e512d@cyphar.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-procfs-pidns-api-v1-1-5cd9007e512d@cyphar.com>

Hi Aleksa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 4c838c7672c39ec6ec48456c6ce22d14a68f4cda]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Sarai/pidns-move-is-ancestor-logic-to-helper/20250721-164648
base:   4c838c7672c39ec6ec48456c6ce22d14a68f4cda
patch link:    https://lore.kernel.org/r/20250721-procfs-pidns-api-v1-1-5cd9007e512d%40cyphar.com
patch subject: [PATCH RFC 1/4] pidns: move is-ancestor logic to helper
config: x86_64-buildonly-randconfig-001-20250721 (https://download.01.org/0day-ci/archive/20250721/202507212040.eC5zmwiV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507212040.eC5zmwiV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507212040.eC5zmwiV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_atomic_helper.c:31:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:16:
   In file included from include/linux/ptrace.h:10:
>> include/linux/pid_namespace.h:125:6: warning: no previous prototype for function 'pidns_is_ancestor' [-Wmissing-prototypes]
     125 | bool pidns_is_ancestor(struct pid_namespace *child,
         |      ^
   include/linux/pid_namespace.h:125:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     125 | bool pidns_is_ancestor(struct pid_namespace *child,
         | ^
         | static 
   1 warning generated.
--
>> ld.lld: error: duplicate symbol: pidns_is_ancestor
   >>> defined at pid_namespace.h:128 (include/linux/pid_namespace.h:128)
   >>>            drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.o:(pidns_is_ancestor)
   >>> defined at pid_namespace.h:128 (include/linux/pid_namespace.h:128)
   >>>            drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: pidns_is_ancestor
   >>> defined at pid_namespace.h:128 (include/linux/pid_namespace.h:128)
   >>>            drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.o:(pidns_is_ancestor)
   >>> defined at pid_namespace.h:128 (include/linux/pid_namespace.h:128)
   >>>            drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: pidns_is_ancestor
   >>> defined at pid_namespace.h:128 (include/linux/pid_namespace.h:128)
   >>>            bridge/cadence/cdns-mhdp8546-core.o:(pidns_is_ancestor)
   >>> defined at pid_namespace.h:128 (include/linux/pid_namespace.h:128)
   >>>            bridge/cadence/cdns-mhdp8546-j721e.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: pidns_is_ancestor
   >>> defined at pid_namespace.h:128 (include/linux/pid_namespace.h:128)
   >>>            bridge/cadence/cdns-mhdp8546-core.o:(pidns_is_ancestor)
   >>> defined at pid_namespace.h:128 (include/linux/pid_namespace.h:128)
   >>>            bridge/cadence/cdns-mhdp8546-hdcp.o:(.text+0x0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

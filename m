Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C69333991;
	Sun, 13 Jul 2025 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752399627; cv=none; b=ifTJtoapeDDjxNKyvSwkUmWJawP5dIIw3VhGJvqCIqC0fXMwEcuFAC1/Ca+ertrhB26WO4ITCK/BBBb7/Vax+asIvH7JHb4+LT5lG2dba5BiSBO/z1L6apbju53LX9VeFSen14jbEdx9S1CVLitbOv5Lh4WdPr1LIR6PhUPIvkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752399627; c=relaxed/simple;
	bh=z6H+/dfDA1jxV3PRbRLusmrKafP1/m65S0ZBclRIrXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/TjcY6DX/ONDPEwqiL6UhqFmASeq6g8S+7qTSFz55Ox8bsHeL3F5+pkZGYV9pwK9yo8JLtrIQKvsF12ee6NFOZq4qDVCkRQYSVdWmTj/StymGZ8Be9vD681AYjYzOuglr3raNfI+lu9m2wxPY16Wu2tLrarz1ni5IqSacyVcz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nk3UYP+O; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nk3UYP+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752399627; x=1783935627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z6H+/dfDA1jxV3PRbRLusmrKafP1/m65S0ZBclRIrXc=;
  b=nk3UYP+OVFVPbCRgl7Ibg4MXe/ZjGhd5Kpm2y0wo4XwV6eoWrIvw+6uI
   WtqPkv1CGgQ+Vt1ACA6AQLZOVJFFr6J/N20lki7oCRar+lCvcj/eNei6i
   I+UiqgkMmrh5+QRcXIRuGzT0LkR8C8T5zPvixxXtZtmiwyzAH85BVSr74
   A84oNr9PcoUMINlQiXQ87+z02//00ZvEsNdzDCgOyD5hbZSOIeL3VXrT0
   sRfgRGb8sSqPuA7KJZkSwYtwjKQVgGsCphUQBH2nFVh56RVPuS974f/Op
   GJ3c278iAoqwzAYU+aFhp1qCgYYVqRDPGnmYEVEzRFk4WdSs4f43Svg8i
   g==;
X-CSE-ConnectionGUID: pS+2+BiaRZyCJ2lX8IToxQ==
X-CSE-MsgGUID: 4QERjoW2TyC24hdrVr6sDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54752202"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="54752202"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 02:40:26 -0700
X-CSE-ConnectionGUID: hqbHRsduQL6WedYBy6Vm0g==
X-CSE-MsgGUID: ks9mlP5TRn6xEG+FZzBLvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="162381211"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Jul 2025 02:40:24 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uatC1-00081P-2z;
	Sun, 13 Jul 2025 09:40:21 +0000
Date: Sun, 13 Jul 2025 17:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v3 1/4] kernel/api: introduce kernel API specification
 framework
Message-ID: <202507131704.ek9UoT2n-lkp@intel.com>
References: <20250711114248.2288591-2-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711114248.2288591-2-sashal@kernel.org>

Hi Sasha,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on uml/next]
[also build test ERROR on uml/fixes tip/x86/core arnd-asm-generic/master masahiroy-kbuild/for-next masahiroy-kbuild/fixes akpm-mm/mm-everything tip/sched/core linus/master v6.16-rc5 next-20250711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Levin/kernel-api-introduce-kernel-API-specification-framework/20250711-194622
base:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
patch link:    https://lore.kernel.org/r/20250711114248.2288591-2-sashal%40kernel.org
patch subject: [RFC v3 1/4] kernel/api: introduce kernel API specification framework
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250713/202507131704.ek9UoT2n-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507131704.ek9UoT2n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507131704.ek9UoT2n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __stop_kapi_specs
   >>> referenced by kernel_api_spec.c
   >>>               kernel/api/kernel_api_spec.o:(kapi_get_spec) in archive vmlinux.a
   >>> referenced by kernel_api_spec.c
   >>>               kernel/api/kernel_api_spec.o:(kapi_get_spec) in archive vmlinux.a
   >>> referenced by kernel_api_spec.c
   >>>               kernel/api/kernel_api_spec.o:(kapi_register_spec) in archive vmlinux.a
   >>> referenced 5 more times
--
>> ld.lld: error: undefined symbol: __start_kapi_specs
   >>> referenced by kernel_api_spec.c
   >>>               kernel/api/kernel_api_spec.o:(kapi_get_spec) in archive vmlinux.a
   >>> referenced by kernel_api_spec.c
   >>>               kernel/api/kernel_api_spec.o:(kapi_get_spec) in archive vmlinux.a
   >>> referenced by kernel_api_spec.c
   >>>               kernel/api/kernel_api_spec.o:(kapi_register_spec) in archive vmlinux.a
   >>> referenced 5 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E9D257844;
	Wed, 15 Apr 2026 08:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243231; cv=none; b=lBWTaYlgV3EgfgeYuQ70ru4ZSjzr63BscyRRZ2l8f/t0sVFaCHu8cC8hMUkRdI5+fHotug6CjrW+C1T+9Nhg3uuLqLhjM3Lxyr6HYxdVHWH+FU4NEP1G+kec1vUV2UM6RRxFwo1RSRMWZ1VXkzBi0fTMJ/2oQrXnPhEoqCjC8l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243231; c=relaxed/simple;
	bh=IpYz+F25z70UZKXdWfzUkzZ79iU+BGsUvci95/BvFyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDBzQdVONdPazpXKgZbwATKMvcAjXsVCaMXdJPC5j9jggkae0PUJqAh+qbX+kzi+QWVOghaWz07Cr6wyDdx9hoXOPh4IIW/5WDj7IEYaEAExt1k88quMV9KF5HhMyF2WLQx9hFi2MqWmwRXOPGgBUDMwCyjtExdaNeyB6UIZcxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLx0+Bst; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLx0+Bst"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776243229; x=1807779229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IpYz+F25z70UZKXdWfzUkzZ79iU+BGsUvci95/BvFyU=;
  b=YLx0+BstCEoHab+/ZGGUmn6em4da+MGsayqQcX4Ku6rW+uFqGj7KJoW0
   NQQXFHbxNYYIZvJJEqcKqh76GJbT4uAOQ0ylgOugzjhywT1DECCUO2lQU
   b2hIj+UyRaW9JB1Vmi/XOcMzpHxN9G9z82ArjuGw6yQlAnlCCzUsWSrgO
   uTk/Kq1N0g49ldHREWEROjUcoRzITIEG8a2/X8Rqw/oc2TjTzfMDpQNUv
   wE2KmwPRAs/7ls2cUsE2+uLihTUSzSnXpq826WFeatIoJwOorvEev1rya
   IXQgHYyYx/zhKUxyybVCIhiYD9CYvyhoh24bUAdDdWcJ6tK7tqqmK0K35
   g==;
X-CSE-ConnectionGUID: 9xxsPSNiSOqoPOVv2nc79A==
X-CSE-MsgGUID: IFH/kWZWTaiIRvaeSo+GEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77090635"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77090635"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 01:53:49 -0700
X-CSE-ConnectionGUID: KizOaOsEQFSlATXIjldBMw==
X-CSE-MsgGUID: 8Bmg9ft1QSKcrHTDdqn32Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253575816"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Apr 2026 01:53:48 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCw0H-000000000Kj-3djw;
	Wed, 15 Apr 2026 08:53:45 +0000
Date: Wed, 15 Apr 2026 16:53:31 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Ruley <brian.ruley@gehealthcare.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] test: mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <202604151613.x4lwSnHV-lkp@intel.com>
References: <20260410114336.983057-1-brian.ruley@gehealthcare.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410114336.983057-1-brian.ruley@gehealthcare.com>

Hi Brian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on arm/for-next]
[also build test ERROR on akpm-mm/mm-everything arm-perf/for-next/perf arm64/for-next/core linus/master arm/fixes v7.0 next-20260414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Ruley/test-mm-arm-pgtable-remove-young-bit-check-for-pte_valid_user/20260414-235000
base:   git://git.armlinux.org.uk/~rmk/linux-arm.git for-next
patch link:    https://lore.kernel.org/r/20260410114336.983057-1-brian.ruley%40gehealthcare.com
patch subject: [RFC PATCH] test: mm/arm: pgtable: remove young bit check for pte_valid_user
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260415/202604151613.x4lwSnHV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604151613.x4lwSnHV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604151613.x4lwSnHV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: migrate_exec_log_dump
   >>> referenced by traps.c
   >>>               arch/arm/kernel/traps.o:(do_undefinstr) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

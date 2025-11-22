Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F322246781;
	Sat, 22 Nov 2025 21:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763848443; cv=none; b=cC7rUlFa27N0gbD15Bjtg82zHCi3oOU3+63I0S0Q07jm8JsenV8VbLTXKgaRJR8RcpRfmsfBPCpCa+wJMP4dolMiBSgOyokdeQB4a4oM9DUgstYpSDg+ShFaVrXy3Ochx+tJE7ujTj2Tu2GHaHjTce8iz6wSQ6DNpIxVW27k/kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763848443; c=relaxed/simple;
	bh=oL+v8c4wj4tqwU4CXS8MuDAQjOCZyt1sM82IcbZLkw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpaedCpC5sBX0jGm/sSLKNzNrF9M9XUiTUMzkcwurYx05qq+R/i24H9f+mvP592wtnxZzoc4wsMQbc5CGI2vl1zwszzRTcLFsBZGTNDYU33P3ld8WYmw02anVKF+FSH7Qrfif913deFMVaChGdkE4OHWVt7sdaMn2k4j/WmUJCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nz1S3gYW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nz1S3gYW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763848442; x=1795384442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oL+v8c4wj4tqwU4CXS8MuDAQjOCZyt1sM82IcbZLkw8=;
  b=Nz1S3gYWNohsFz/V82oLIobP+6EihwrWfz1OURNQPJpLWZKtc7u5OMo+
   /5Y3HJ9XoEi7SHalB/oM2bjjFt7smD9XD2qGimqJmLIIm4mpBFmdtuz9s
   qTgMzVci50pwC0lu/xNgzUmcRzt4b1snmZujWeIGI6NcxYwk9+s2q2PZQ
   Bk3bGRPu1b7Iwn92/gumaXRrACOEVOYXVQyVuQHvKtjhvlQIczcyZ+Jfe
   7sV7u7BwfsZoZ9GspoH4yMM3V2ZLTM4PMRQktxsZ/+K/Y5FLMAOekfBNX
   oIm1uO0wwoNyrKzelJcKDRXsnR4fE+aw8Bpj4DsZbVxBpYgPViISD7oOD
   g==;
X-CSE-ConnectionGUID: m42he8ATRB2p7+APRhv7tg==
X-CSE-MsgGUID: Ag1eKct+TX+u/PH/P5/B0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65796179"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="65796179"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 13:54:01 -0800
X-CSE-ConnectionGUID: WIZoTmqmSBy+ttVSbmwk7g==
X-CSE-MsgGUID: LlEaTSW/T3CrA3ylVCgh/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="192011123"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Nov 2025 13:54:00 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMvYL-0007rD-1t;
	Sat, 22 Nov 2025 21:53:57 +0000
Date: Sun, 23 Nov 2025 05:53:50 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Kepplinger <martink@posteo.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/4] hack: Input: edt-ft5x06: hackery to probe after panel
Message-ID: <202511230502.L6yEiuAI-lkp@intel.com>
References: <20251119065109.910251-4-martink@posteo.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119065109.910251-4-martink@posteo.de>

Hi Martin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.18-rc6 next-20251121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Kepplinger/hack-drm-panel-mantix-Allow-to-query-enabled-state/20251120-121327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20251119065109.910251-4-martink%40posteo.de
patch subject: [RFC 3/4] hack: Input: edt-ft5x06: hackery to probe after panel
config: arm-randconfig-002-20251123 (https://download.01.org/0day-ci/archive/20251123/202511230502.L6yEiuAI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230502.L6yEiuAI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511230502.L6yEiuAI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mantix_panel_prepared
   >>> referenced by edt-ft5x06.c:1163 (drivers/input/touchscreen/edt-ft5x06.c:1163)
   >>>               drivers/input/touchscreen/edt-ft5x06.o:(edt_ft5x06_ts_probe) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

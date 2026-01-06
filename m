Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3202C235E;
	Tue,  6 Jan 2026 20:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767732131; cv=none; b=kwSsIkYTmTCjj7V7ZsrTJ2xQT7jdIyT/Nf7FhjBf8Y9Bdrsmzpjtogi0p84sGCV/I7/Ih7m6QA/LAx5W2i7i0yEKf/L4RDgeV8yStibTuulEqpEuRIjKsO9EIofhvfo/Dr1PK4ejsrqL61asoJJ0e6Ai5J7uBJ6cjUGat83lkAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767732131; c=relaxed/simple;
	bh=QdU+6NVMxxEzVebMqZpEsC53ZJi/7OFJtfc5Tylldb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEOz8AeMm/NORm9uYVWsy8WkkmdbTC6OJj6HMK/1ogSSEG+Uun1UJm/jg6nugCBl4ABepW+mm3KiCVZ3ys8I/F8K3wnPFeTv8f8KclQfShA5Jvte1tmfu0bRMpmrbn0Hhva5Ib9Cc9XtCwUzfkUdQ/RsAllSetXlTJkJsUfhx0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heZES/eo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heZES/eo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767732121; x=1799268121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QdU+6NVMxxEzVebMqZpEsC53ZJi/7OFJtfc5Tylldb4=;
  b=heZES/eonyu3wAl5RE+C1GEsBdkCJMxoezA1q50aFSvBDUnYQoM2qzXt
   sMSGZ71NNuowxtOS+2VIWG3K3Rui5i/GQjG3LdDlPD0BRKrMNlnomqKmJ
   OPv6X9DyzB48gxUuitwzxuNhK6l5ZcJPwkGKzDk0eH43zNFSSa/5kFubj
   pbgxEdJA3HjCmwX5ELePvYAo9fGOc1yaK9RXBEkFFG2C/VYLIodzaJD83
   p2nkYjFu+YfExfUMiScHZkRt8BMWDODOVu7Se0DQfyE25VllNCrZApVER
   /WkwABZwnA5qAsGVVL1AI8z8TcUUU7zhIpmhYaGmcaYLTNgNolpmpF/SG
   w==;
X-CSE-ConnectionGUID: qVcJXo4QQq6kwAa3qaPSUQ==
X-CSE-MsgGUID: dQREj8wvRnqQdKxZcQ230g==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69011997"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="69011997"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 12:41:49 -0800
X-CSE-ConnectionGUID: gkNM0d3nRzugpbb3AvAAvw==
X-CSE-MsgGUID: blcg7+VlRxKYHjNuAEQhSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="203198562"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jan 2026 12:41:48 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdDsA-000000001Mb-0SXJ;
	Tue, 06 Jan 2026 20:41:46 +0000
Date: Tue, 6 Jan 2026 21:41:08 +0100
From: kernel test robot <lkp@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] cpufreq: Pass the policy to
 cpufreq_driver->adjust_perf()
Message-ID: <202601062141.sfoMtUSB-lkp@intel.com>
References: <20260106073608.278644-3-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106073608.278644-3-kprateek.nayak@amd.com>

Hi Prateek,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 8aa9e2868a8e38ccc5228399fc641d54aea444ed]

url:    https://github.com/intel-lab-lkp/linux/commits/K-Prateek-Nayak/cpufreq-amd-pstate-Pass-the-policy-to-amd_pstate_update/20260106-154118
base:   8aa9e2868a8e38ccc5228399fc641d54aea444ed
patch link:    https://lore.kernel.org/r/20260106073608.278644-3-kprateek.nayak%40amd.com
patch subject: [RFC PATCH 2/2] cpufreq: Pass the policy to cpufreq_driver->adjust_perf()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260106/202601062141.sfoMtUSB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601062141.sfoMtUSB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601062141.sfoMtUSB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/cpufreq/cpufreq.c:2250 function parameter 'policy' not described in 'cpufreq_driver_adjust_perf'
>> Warning: drivers/cpufreq/cpufreq.c:2250 function parameter 'policy' not described in 'cpufreq_driver_adjust_perf'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

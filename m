Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C01B4070F3;
	Thu, 26 Mar 2026 17:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774545833; cv=none; b=BfP7J+d9CaTPtgDcH4+IF4xN00QiDbHEwosC/iQrZKzJWi/Rt7Pn4kCWhVrJ0kIWy3Icg7Hg+XKjqwpy+RzPWxHwKgb9HCIvZM4qXL7VM03vDGpQd57TSs2TQUT4cELUFaCpx59r/UN37RmRFZa6bJzKHO9/4+TbBrshJXJpXO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774545833; c=relaxed/simple;
	bh=jJmlpac80zwUsAWqRFRE5W5E4jpys3n9j4q3g4U5Cwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXBmdegZSm5Wq9iSYsnbMwEuXhCMIIsKmC2evzIEnwF03y0YxyrPKtwth5u9LJ8eivGVJo3X4Ex/iMR4BbvBr3Qh8HEFQHohq8406TrOuA2SReOr3LpVUns5+oYTcBlEue5EdpNOL19NfBm6x482dovtvpDl+aQjMmlQkdmLeUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RlHnli1U; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RlHnli1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774545829; x=1806081829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jJmlpac80zwUsAWqRFRE5W5E4jpys3n9j4q3g4U5Cwg=;
  b=RlHnli1Uf6YyIpFGpDL+6DHGDFjzUhsBExkSOoAnHEE9CSB/vrawsZcg
   ygY9Pp6p4TCKq9rwcC/UYcsKxSR0blsnKuXYgPIbEXnh9aqhTw7KggD9l
   Z2w3q5wSso+/9EXL9wfdtwoB1eZiROaRb6fu0reUEhLUnaLBfylrInPwO
   cg60wezGtfmU4eMVOgmz0vXAJWNag8c77yFqNAeSffJyC47KM95t8UwDw
   G1B8/79Xk/F4ATPRl63jCuJ92MKjAgTpIzNJbiqwWi3HiWbK87rrIv5v3
   JqdpuwF7E4a/8/fFL2N1tLZqg6RyZBRhS7qbsWzp3AcIFXgq/Tc0kSPxR
   Q==;
X-CSE-ConnectionGUID: D8sYOk2kTCm7QCZK6PapnA==
X-CSE-MsgGUID: KkgHKHeFTk+aWaHIFhuPHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75631369"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75631369"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 10:23:48 -0700
X-CSE-ConnectionGUID: XtXiMnUSROec8CzTHDfHvw==
X-CSE-MsgGUID: rU9dt+OTTjSVhCuTuzamLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="218464915"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Mar 2026 10:23:45 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5oQo-0000000097J-2irT;
	Thu, 26 Mar 2026 17:23:42 +0000
Date: Fri, 27 Mar 2026 01:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	shubhrajyoti.datta@amd.com, bp@alien8.de, tony.luck@intel.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 5/5] EDAC/versalnet: Fix device name memory leak
Message-ID: <202603270107.jJ92lLm3-lkp@intel.com>
References: <20260322131149.1684771-1-ptsm@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322131149.1684771-1-ptsm@linux.microsoft.com>

Hi Prasanna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260320]
[cannot apply to ras/edac-for-next linus/master v7.0-rc5 v7.0-rc4 v7.0-rc3 v7.0-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prasanna-Kumar-T-S-M/EDAC-versalnet-Release-reference-to-remoteproc-device-in-remove/20260324-014933
base:   next-20260320
patch link:    https://lore.kernel.org/r/20260322131149.1684771-1-ptsm%40linux.microsoft.com
patch subject: [PATCH 5/5] EDAC/versalnet: Fix device name memory leak
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260327/202603270107.jJ92lLm3-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270107.jJ92lLm3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270107.jJ92lLm3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/edac/versalnet_edac.c:163 struct member 'mci_name' not described in 'mc_priv'
>> Warning: drivers/edac/versalnet_edac.c:163 struct member 'mci_name' not described in 'mc_priv'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

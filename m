Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B44498902;
	Fri,  2 Oct 2026 16:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956998; cv=none; b=PfsRZFR2nK8rVPrIrFliUiXCfyeUTL6pQ6FwH5aOilaHs3DQX2ttcmH+CCMM08mxo9zzKfvKeOAbi6DC5nV1lUR9+8sVBJFBm564VvwF5jLOoGUfQVnJKsKSeg7vhUYYWK0luXITA2o/kmW5qiu7I11pEecRbcy9jmDpJSJem9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956998; c=relaxed/simple;
	bh=NE3/nu3MEaimkwHpaJna+PshdJTxRo8BHeW5zxEbdSs=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcvLnhr9YmZdkooYahFvdYF4co0YSZnn9FQSPkkYPf2qVkYgyBfGYDkPgbIC8zEVYJRQTTMDGQpGW7eq7e+jPgBuWv4vLWkHmAfZh9J8A5QPaj69WLMgqfprEZaf/sF/iWpuUZcmkPqt3jcOZ5PdXT6B9v61Y9NRO2XkjGdKrE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLv+ZcF8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLv+ZcF8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790956995; x=1822492995;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=NE3/nu3MEaimkwHpaJna+PshdJTxRo8BHeW5zxEbdSs=;
  b=bLv+ZcF8DVEEHKtnqsHhaCAEK00AOl66aOhZOWoFTlaA/7Y47p4GyfQr
   jn9Dl5iekNYiTekitgsdtHlHyG1lpCKWrbdTC4V9G+O6Z44dZbNIcj1pe
   hYEXInEUa9xGKjpvVtMin3W4iBr65KC30U6uODAYCt7qIv1TTrvHA/nVv
   9dmouIgy9Z6WtYowROr/cj46X1xz8CfS1JydbP+eoVkpWCwsNho7TYllG
   4kQieDWl/csLyzABlDhBg0xNN+TM8o+NLKDrOyPl4V1MYqg5o6uTNFKVI
   snR6AU9BaaZWy/t6mxfaJsjvgtpGMpzI6wvQx4aqNY+MUmH/JFY1knfl2
   A==;
X-CSE-ConnectionGUID: IRvXutzDSySDPvgRjv8Liw==
X-CSE-MsgGUID: BLp+ELjUSYaMT1xpx+hq+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="108103821"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="108103821"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 09:03:13 -0700
X-CSE-ConnectionGUID: lQvrSTpBTxWBo0dUohrZ6w==
X-CSE-MsgGUID: RbGqYiNKSiSlS1BoMd8osw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275818423"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 02 Oct 2026 09:03:12 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCfj4-000000000et-0LXH;
	Fri, 02 Oct 2026 16:03:10 +0000
Date: Fri, 2 Oct 2026 18:02:42 +0200
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: bpf: Add gated tracepoints for skb life-cycle
Message-ID: <202610021700.2tsioxwY-lkp@intel.com>
References: <202610021700.2tsioxwY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610021700.2tsioxwY-lkp@intel.com>

Hi Jakub,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Sitnicki/bpf-Add-gated-tracepoints-for-skb-life-cycle/20260928-134018
base:   
patch link:    https://lore.kernel.org/r/202610021700.2tsioxwY-lkp%40intel.com
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261002/202610021700.2tsioxwY-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021700.2tsioxwY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021700.2tsioxwY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: net/core/filter.c:12450 function parameter 'skb' not described in 'bpf_trace_skb'
>> Warning: net/core/filter.c:12450 Excess function parameter 'skb_' description in 'bpf_trace_skb' (did you mean one of: 'skb')
>> Warning: net/core/filter.c:12467 function parameter 'skb' not described in 'bpf_skb_is_traced'
>> Warning: net/core/filter.c:12467 Excess function parameter 'skb_' description in 'bpf_skb_is_traced' (did you mean one of: 'skb')
>> Warning: net/core/filter.c:12450 function parameter 'skb' not described in 'bpf_trace_skb'
>> Warning: net/core/filter.c:12450 Excess function parameter 'skb_' description in 'bpf_trace_skb' (did you mean one of: 'skb')
>> Warning: net/core/filter.c:12467 function parameter 'skb' not described in 'bpf_skb_is_traced'
>> Warning: net/core/filter.c:12467 Excess function parameter 'skb_' description in 'bpf_skb_is_traced' (did you mean one of: 'skb')

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

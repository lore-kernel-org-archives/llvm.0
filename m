Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F6030DEA9;
	Thu,  4 Dec 2025 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764850208; cv=none; b=Ai2DK0SAS18Jsb7lVFNS1ECr0p96KYqQCdwUR56glh4Q3XOchNZRr/aftmjYWu4g0ZVklFBqwwM6NEmbnaIAi76VrYxi9n74T/+fWUleI36TH5nnUpbPJs+CzA8++Qd2J+RAssrKHeCEC5QvXoJifEoZNDLuY28Nhu3RfO1Oh3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764850208; c=relaxed/simple;
	bh=4oFP79WXuKz1WKeaDX3yOyOsBv/c6W7j7TtojyjQ+FU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbYttdArYzIB8AgFbGxtNs9mE8nvu/0uNBplsJUBS48WhUSS3Qg4+XGdzL0V+4GitBPlO6PtJNLgL+eb+fTmA4ZjIqKaT9mbGCGil4Zlau9rlKOVTY461KfJV4yK2fgfVzqL+dRnZgNMxQDTxNRJQt9xwV+cDo1v+R1QRdLECtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXAS+01Y; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXAS+01Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764850208; x=1796386208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4oFP79WXuKz1WKeaDX3yOyOsBv/c6W7j7TtojyjQ+FU=;
  b=gXAS+01YpcGrrAMoWcqqHgW3r4VJaHAk/vpm+FuFrWACRQQQ8MttpuYF
   2a18CPeXH7dDnX/hIo98HxqNuFdHQgOjLxzGmDRXQcsVnNvKYPG6DnOfg
   SYIpdH1W+JY9ROKrbKmLQAamTVGcr5bTH3nv6Clbu7nkoJgFJIRtbEcD1
   YbJbdFF5IcG/wkkGuTu8ozhS1AZUSYNXH8O0t7day78p3CaOR3cmQLgnp
   8oKz/B0ZBdY5zrkyBUCFIAgXM2K8o1GguX/qjvQ3FfdCcJp2Ns12/zGe9
   TfeyZ/PKbMXFqCgPhMq4ZYE875HdtRO7znI66g8b75EPVDRVqqwTd+WVW
   A==;
X-CSE-ConnectionGUID: hiO5G3n/SQ2+q7D8ICRm3g==
X-CSE-MsgGUID: fJ01e9J/TrK0AhLN4oPxUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66941629"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="66941629"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:10:07 -0800
X-CSE-ConnectionGUID: yQ32Sw5GRZGBGlnMXpYuOg==
X-CSE-MsgGUID: uDnaW1ckRnSZFddY0wiT8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="195001490"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Dec 2025 04:10:05 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR89r-00000000Dm9-08ac;
	Thu, 04 Dec 2025 12:10:03 +0000
Date: Thu, 4 Dec 2025 20:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC nf-next 3/4] netfilter: flowtable: Add IP6IP6 tx sw
 acceleration
Message-ID: <202512041913.uvmmSqqP-lkp@intel.com>
References: <20251201-flowtable-offload-ip6ip6-v1-3-1dabf534c074@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-flowtable-offload-ip6ip6-v1-3-1dabf534c074@kernel.org>

Hi Lorenzo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 0177f0f07886e54e12c6f18fa58f63e63ddd3c58]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/netfilter-Introduce-tunnel-metadata-info-in-nf_flowtable_ctx-struct/20251201-214911
base:   0177f0f07886e54e12c6f18fa58f63e63ddd3c58
patch link:    https://lore.kernel.org/r/20251201-flowtable-offload-ip6ip6-v1-3-1dabf534c074%40kernel.org
patch subject: [PATCH RFC nf-next 3/4] netfilter: flowtable: Add IP6IP6 tx sw acceleration
config: x86_64-randconfig-003-20251204 (https://download.01.org/0day-ci/archive/20251204/202512041913.uvmmSqqP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512041913.uvmmSqqP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512041913.uvmmSqqP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ipv6_push_frag_opts
   >>> referenced by nf_flow_table_ip.c:702 (net/netfilter/nf_flow_table_ip.c:702)
   >>>               vmlinux.o:(nf_flow_offload_ipv6_hook)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

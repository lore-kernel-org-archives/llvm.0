Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8834D795D;
	Sun, 18 Oct 2026 16:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340892; cv=none; b=IZ4HTbnTatFk9ChBJa0J9AkO+hU9dUvXwQes/OLL8XJ3nbLgfcp3QMJatDgqWvWKCMIRDQOjgqGCNjkXqfXDoIDrawlp9j/Ha2ki+Ivpy5XZjhouf0QQa8J2StaQjoH+xkbnlVQc2Kqp86qwSA3bj+Qj9drF6McwhqbQsyvzAZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340892; c=relaxed/simple;
	bh=ZBA8tSQbubossuH1e0FKUSZnykdLDrvv7ylxlX+GGLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEd6MJhu8alezdRkJ3Nb1EITaec+pxgzJdsHpK3Pf10Pj1gnuGEzL112Qp9pntOozi5FV7p/LsS+fEftZJ7zb5YT5BrPgoCtsvEJYXpXwuflCwERcVAI1/MOLzWcRiWPrqw4gs3j5lx6A0uD4pF5iNLUqp3H8nGixgLUeLLDAIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mB954k/U; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mB954k/U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792340890; x=1823876890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZBA8tSQbubossuH1e0FKUSZnykdLDrvv7ylxlX+GGLg=;
  b=mB954k/UhAYtUEVEXsYmHUoot2sO0oyg8vIGhYXv1YJWzMvlZPaM2F+/
   BZfq6I3+7WJS0CEfirl+d9tGwuQMn30kkr3iodUAhlbSZnuGmDsDvcvO3
   MCBTOtizMTDgKKDQIJmB5KeNXa50BGN0G0L+IpXKq7gNMR9RC5lAs+OZ5
   co2mDRqnWW3UE72CvNUtRbAap1rmSxM7cZJI5WAPlySkMutAv2Mc1uEmL
   bqJpHTY4rVl/cxOfM8fFzDBH+cOjV7egl5cztGpaqvclyhSxO4oNHddq5
   /k5oylRvB3DjumFTsfMpzFjeCPhzIurtprCpFR+HKKOIaZ7tXIa/R8TtY
   Q==;
X-CSE-ConnectionGUID: g6bH15UDQLSY7qV3LdXWTg==
X-CSE-MsgGUID: awj/Bny1SX6156wkGjnlSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1026110"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1026110"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 09:28:09 -0700
X-CSE-ConnectionGUID: 5/7AfZ7UQ2KA15pMTXM/TQ==
X-CSE-MsgGUID: uwVZIlhrSpSfeTSkzJ/6bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2647672"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Oct 2026 09:28:08 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xITjx-00000000KaE-34ff;
	Sun, 18 Oct 2026 16:28:05 +0000
Date: Mon, 19 Oct 2026 00:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 04/16] pmdomain: core: Support named indexed virtual
 attachments
Message-ID: <202610190046.TT10nBaw-lkp@intel.com>
References: <20261014-topic-qc_clk_dvfs-v1-4-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-4-3041b788e9f7@oss.qualcomm.com>

Hi Konrad,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 4eb2586bd40db27d77cc5b724ca9386ed0c71d53]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/clk-Propagate-rate-programming-failures/20261014-141901
base:   4eb2586bd40db27d77cc5b724ca9386ed0c71d53
patch link:    https://lore.kernel.org/r/20261014-topic-qc_clk_dvfs-v1-4-3041b788e9f7%40oss.qualcomm.com
patch subject: [PATCH RFC 04/16] pmdomain: core: Support named indexed virtual attachments
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261019/202610190046.TT10nBaw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190046.TT10nBaw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190046.TT10nBaw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pmdomain/core.c:3601 function parameter 'suffix' not described in '__genpd_dev_pm_attach_by_id'
>> Warning: drivers/pmdomain/core.c:3601 expecting prototype for genpd_dev_pm_attach_by_id(). Prototype was for __genpd_dev_pm_attach_by_id() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

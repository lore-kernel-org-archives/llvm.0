Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3AA1BCA1C;
	Fri, 20 Feb 2026 03:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771557000; cv=none; b=RYAHi4s2O3kUMFtYlBWjGT2JNpaPc3yHSa31QZbaXtLPbdpqlC6QHQeppU4jm46BNN7OYKzCxfAwLAaUBbUE/iPQKDG53+Zrg2uh40xt23tBIJh1CvDy7BIB893ZRQCWDLeGo4dWDub5JJ0t/YiScfB63B9dwusg2z+AZT7yOIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771557000; c=relaxed/simple;
	bh=0GpU9pOckBzcCfndGc7TTdYld7gaGsNTeTIKdjFUrik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGC60eSyUrwr+4XOku7fncFFpueE4TQztYoO6ee6Rv0PfUS/s8QWiYwO0XDhlyXrFaHhOsbLpEeYk836UTSBpsBxd63bZDVCRenl0it9K/C+jwWrTkJxxbVUimM0D/InMCxOy68UJg28oOLQqFaunGcmTiQoEzi98mfdFXtzwdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5rAv/hg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5rAv/hg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771556999; x=1803092999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0GpU9pOckBzcCfndGc7TTdYld7gaGsNTeTIKdjFUrik=;
  b=U5rAv/hg6bpjxcKcahxo6nwX3ZER5blYAS8c7ajO795i5GyYjQ7+ECbM
   0d53TWqxkpkSBgFKfyndg45YY0SgOq7AaJCrCPp8OEYf0qiXN5u/uEDIN
   DeKn40SV1tyboakaE7Q1Tb/HJFUD7R6lBwcy4OEXj4h1PuVpRruDwsQSp
   wFAcGrdqAZqwRmdD7FF/Eukva+6Qw8GfjnjrrywuFiAyc3rK7DGyVG4hV
   zv7OZY1E3DR32G7gUxjnomI2nkJByKdSRk6oTQjAKc/qkRyj0EvFXtegc
   kKO1kNVOlnAh81i43xarXIlrcSiQS4F1HD2A4lmp89n7uEBTTba1mIMnG
   A==;
X-CSE-ConnectionGUID: 6Jd8w7KDSZSmAK02y/hAzQ==
X-CSE-MsgGUID: OcOWNeu6SKCHZFWOYSGhFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76491766"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="76491766"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 19:09:59 -0800
X-CSE-ConnectionGUID: dtoyotxYTkOs2nbMkJcBVA==
X-CSE-MsgGUID: GqbvW035RYiGHy9hQ93PaA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Feb 2026 19:09:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtGtv-000000013mK-3Iu7;
	Fri, 20 Feb 2026 03:09:55 +0000
Date: Fri, 20 Feb 2026 11:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 2/4] ethtool: module: Add CMIS loopback GET/SET
 support
Message-ID: <202602201104.2XiB2Zfo-lkp@intel.com>
References: <20260219130050.2390226-3-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260219130050.2390226-3-bjorn@kernel.org>

Hi Björn,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 37a93dd5c49b5fda807fd204edf2547c3493319c]

url:    https://github.com/intel-lab-lkp/linux/commits/Bj-rn-T-pel/ethtool-module-Define-CMIS-loopback-YAML-spec-and-UAPI/20260219-210654
base:   37a93dd5c49b5fda807fd204edf2547c3493319c
patch link:    https://lore.kernel.org/r/20260219130050.2390226-3-bjorn%40kernel.org
patch subject: [RFC net-next 2/4] ethtool: module: Add CMIS loopback GET/SET support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260220/202602201104.2XiB2Zfo-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602201104.2XiB2Zfo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602201104.2XiB2Zfo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ethtool/module.c:88:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
      88 |         }
         |         ^
   1 warning generated.


vim +88 net/ethtool/module.c

    76	
    77	static bool module_is_cmis(u8 phys_id)
    78	{
    79		switch (phys_id) {
    80		case SFF8024_ID_QSFP_DD:
    81		case SFF8024_ID_OSFP:
    82		case SFF8024_ID_DSFP:
    83		case SFF8024_ID_QSFP_PLUS_CMIS:
    84		case SFF8024_ID_SFP_DD_CMIS:
    85		case SFF8024_ID_SFP_PLUS_CMIS:
    86			return true;
    87		default:
  > 88		}
    89		return false;
    90	}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

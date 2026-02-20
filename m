Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399BE30AAB3;
	Fri, 20 Feb 2026 11:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771586953; cv=none; b=SuQjDUbRaSthcC/wVpQeNwb46HgaVYmV5N4zXqyL+a8pFL/3KuR09XWwPvPBHSxQt2fEwdqnm+8jBAJCfxr2O8oPckBmlbVxQ4ERteW6HEV90XCAeWAnxvdNWcPRNgvD5SDYsMZ2vF7t2uDwUeYaPGe1vG86qnDeD6DIVU5DUek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771586953; c=relaxed/simple;
	bh=IezDaeJ66Y00GXUiQy6naP3VX2n0phbZa2DiNEQh9yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvQ//VVqA66OkWXYpNUwTkZ71JfIc9dU6IPI4imMeOwesfGPsY+y7ItTGVtS9YEHzzr7Jq8Eai40pexfmOOBz6EJly9DiYRUgxAEWEe+6Vn1cBZcLMe6eQv9pExAQOhAO4v+pLZvtlARDXO4Dkj1mMoutn1VShJbDu/yGCHoFgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcMSJyE0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcMSJyE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771586952; x=1803122952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IezDaeJ66Y00GXUiQy6naP3VX2n0phbZa2DiNEQh9yY=;
  b=LcMSJyE0oZV56IW3H8oa3zEyF1+Ac4ucveBdzy3t+osTpegUsUiOhiKX
   kHkt/RVDtXU1VYOQBt8UUPriHW+dmQU6bttzJS7BrIeri6it3q80G/OMj
   hFitrVwPvNBhqf9I/f+IX1cbbDhXgLOJ8AeF+ka1shpAZCCfIT+nxOawu
   KgdSVGWq9+VEr0v8odEnyR1WcMkCOBln6vGOg/Zrna0PbhxM4E/LLfy5l
   EEwImzwoObimnAnPtBRxYuw5SamnOPc0zTdxZTetyeX2Ochhds3xWdcTz
   Hij4iKWsWxFU6n+8ggiZc9jFz8gF1c02aV/sP8EsKeJRLSRT/qcKVionn
   Q==;
X-CSE-ConnectionGUID: W26BxfFrSEaqkEjUYdujoQ==
X-CSE-MsgGUID: jWCTX0+VTBu+U6AFpRTspg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="84039626"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="84039626"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 03:29:12 -0800
X-CSE-ConnectionGUID: Tac755swQ2qgDLkvt2UU2w==
X-CSE-MsgGUID: +FTRFBv4Tw2UWv8ihaOXhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="219374757"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Feb 2026 03:29:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtOh2-0000000143E-1gEG;
	Fri, 20 Feb 2026 11:29:08 +0000
Date: Fri, 20 Feb 2026 19:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 2/4] ethtool: module: Add CMIS loopback GET/SET
 support
Message-ID: <202602201933.l8JXzIMt-lkp@intel.com>
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
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260220/202602201933.l8JXzIMt-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602201933.l8JXzIMt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602201933.l8JXzIMt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ethtool/module.c:88:2: warning: label at end of compound statement is a C2x extension [-Wc2x-extensions]
           }
           ^
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

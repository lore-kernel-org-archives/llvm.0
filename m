Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345062E284B;
	Thu, 30 Oct 2025 04:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761797334; cv=none; b=SFcDaNDfXya5IhEMcOOPa0dgo/DPrtyacmRAx1RSKsBSEUgppOGzqL0HZBxseEeSZ/Ky45C3ktj+mbJoD+bHLlr7gQuoV6FIWlSFsCavGsRd1/T8bC8Tb1BM/iW2P8aXdqDTA0xlCEOd7gLYIRykH4/N4Ira4deBbpala3jvCYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761797334; c=relaxed/simple;
	bh=B+sOnqt8S6+E72VPgLNfKPsheBwDneDieIaq7l/8ieA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNSBtBhGoaKx7CQiZoRrvSUwTwXFeuOZYiNveggpiH+a6b8P5Po0a86MUM65OGBZYefZZJBA74sw90FkHUe33VxZTdBTGmauWtuH4HEf0uq1HRirL3OK0B8/M+9cxApLruO6KREXg6jh+jRMy3WLe8+jNeRM44N3cMIr4nW+Zoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m7QSOp6S; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m7QSOp6S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761797333; x=1793333333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B+sOnqt8S6+E72VPgLNfKPsheBwDneDieIaq7l/8ieA=;
  b=m7QSOp6St2eDfiuVn01EM5xfSxuJH+mpgdoO+tCQtB4uYiEfGeno64tL
   XSCg5izWB+ttOzEe7723c2xviKQlXlh01eEd7DgLLVMG2E2HkW+04PgXr
   XxTiwaFS1f4f9UfkI2vdKICxPPoS6EOS6bzocAQD3p0foqwIWOc1F8tgS
   Rc6Ow9kPakCgPfz3BGkvMkxFRkhbVWzCQf8PR/hhYWu6spfuBO8qpR3zc
   wjwT5S8K2K+6RHOmGvNKvRkbG2WwZuYB3N0VLXqBNWnniRmbPLHQ948XD
   lMZryqT3MVFY8DwwUV/Jn6Aj7qLesZGo1WYFIFPZxiLwyjeWaXuBcMrKf
   g==;
X-CSE-ConnectionGUID: 7osZxYTHRv+5Ko/W+VoNZA==
X-CSE-MsgGUID: 9FxI4b7RTFSbxUL9XR5SLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63967861"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="63967861"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 21:08:52 -0700
X-CSE-ConnectionGUID: jqV37IabRP+Wt4VguqV4Jg==
X-CSE-MsgGUID: XuQ0Lq6oS+aXu+ai9k06Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="189916728"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2025 21:08:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEJwy-000LRk-0o;
	Thu, 30 Oct 2025 04:08:04 +0000
Date: Thu, 30 Oct 2025 12:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Raj Chouhan <pc1598@mainlining.org>,
	linux-arm-msm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com,
	Piyush Raj Chouhan <pc1598@mainlining.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8150: Add support for Xiaomi
 Redmi K20 Pro
Message-ID: <202510301118.DYvzM3NK-lkp@intel.com>
References: <20251022054026.22816-2-pc1598@mainlining.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022054026.22816-2-pc1598@mainlining.org>

Hi Piyush,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.18-rc3 next-20251029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Piyush-Raj-Chouhan/arm64-dts-qcom-sm8150-Add-support-for-Xiaomi-Redmi-K20-Pro/20251022-134317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251022054026.22816-2-pc1598%40mainlining.org
patch subject: [PATCH 2/2] arm64: dts: qcom: sm8150: Add support for Xiaomi Redmi K20 Pro
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251030/202510301118.DYvzM3NK-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301118.DYvzM3NK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301118.DYvzM3NK-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm64/boot/dts/qcom/sm8150-xiaomi-raphael.dts:514.2-18 Properties must precede subnodes
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

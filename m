Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C61619AD89;
	Wed, 19 Feb 2025 04:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739940758; cv=none; b=JIeM54XYD6uHv6HZfvm9QsYw5taaKkrxlCXGmSExNg4MuhQF6YA/gZb6U49XWtvwEGV6OngzMJly7z6YoUIsN8vNfHTmZILpMjBuO1U6vI3mjlOYmFy2WXHrO+5AaoDfA/YFyqnwEWBZ9bWXkQ7GDb9rFw3Zqv78E1CT8jTAlwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739940758; c=relaxed/simple;
	bh=CqJ6DkASQPJEC9ewBqvxq88kqMSk27cnnMTjXeKRPDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJPTfZSXCvrRFA1nicdYdW+0cPtjGEyLcvL8e/I3jTVEpReok1e6ylqRLaRsE4046CrGFWcd6qWyqq8gjnUduJPfa5h147NoplQKvRo8NPEBG/ev3fDv0kqYWo4vAIzMPr/uDeWSVuzvVCR94mx4CnwcY479u2AupDB7Bbb0hqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g8frQxmV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g8frQxmV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739940756; x=1771476756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CqJ6DkASQPJEC9ewBqvxq88kqMSk27cnnMTjXeKRPDc=;
  b=g8frQxmVIS0emUrpT9RKj/DTk/+F7LuBmjIrSRs+vSJzuWxNK2g/71tY
   0v7irETel3Pvvj0Q8Fmzf08gAfcgNRAKtwnj2PVfYzN0/5EIpPHRIk7Nm
   vn3s1MmWROBYkLuTzGU0Z6V4wxknS7HiV2QUJGiZKFVjQWJJZdx5ee/O4
   mnAtLEGJsmNKuBj3bnoN1l4d1JeC3xcul+FqgnQmlOWbdwZ6emX84GN2U
   n/CZe5Y7WU5WniSDWkTmBQM/ae6Nbz9U6uffTh2s/zAn8xUWX/vVmHa62
   T8Q7igD8enzj5XboLzCWq9xhbANYDDY6Fk20rdpCT5Sulg1QRYldj+kOM
   w==;
X-CSE-ConnectionGUID: 4/l2ol4TToKJiLLfyAPHgw==
X-CSE-MsgGUID: 3zXaInlcTF64XMLEioLEOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44420799"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="44420799"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 20:52:35 -0800
X-CSE-ConnectionGUID: /Nas89t0TGGoDTHvDacfhw==
X-CSE-MsgGUID: d4uI7X/cQ1uJw9H4hbMHuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="114456632"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Feb 2025 20:52:31 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkc4J-0001Fb-11;
	Wed, 19 Feb 2025 04:52:24 +0000
Date: Wed, 19 Feb 2025 12:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com, Frank.Li@nxp.com,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH 2/2] drivers: i3c: Add driver for NXP P3H2x4x i3c-hub
 device
Message-ID: <202502191226.OQpregx1-lkp@intel.com>
References: <20250212132227.1348374-2-aman.kumarpandey@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212132227.1348374-2-aman.kumarpandey@nxp.com>

Hi Aman,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.14-rc3 next-20250218]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aman-Kumar-Pandey/drivers-i3c-Add-driver-for-NXP-P3H2x4x-i3c-hub-device/20250212-213659
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250212132227.1348374-2-aman.kumarpandey%40nxp.com
patch subject: [PATCH 2/2] drivers: i3c: Add driver for NXP P3H2x4x i3c-hub device
config: i386-randconfig-006-20250219 (https://download.01.org/0day-ci/archive/20250219/202502191226.OQpregx1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502191226.OQpregx1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191226.OQpregx1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/bpf/preload/bpf_preload.o
>> ERROR: modpost: "i2c_slave_event" [drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

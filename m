Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED4B36C581;
	Wed,  4 Mar 2026 23:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772666988; cv=none; b=M9M1SxOdRdLDEqQq+qbnpjaIbtONuJYA33OCob/gXXZ08siawcXly/KUoN0jmSYVjBXGIZol1yGGumV4lib3l+2NYAcs/wwHf0evVM0xI6CdUQ2iEj8Lx4JD2LnDCFfZ1eJcckz4+BcdrTOY1bZwgQmJNJodHqa2n+GcNGjtNV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772666988; c=relaxed/simple;
	bh=IxhaafHkztuY+zBNGR9QmlTYlbpS+bBlFqY6qE/kIHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lo+Ex6w6sGJmWamIFBr0RbFzx0KQgir7QwIU3YYFpdRZtN81CU7fZ6d49cJOopckj+LU33L7myu3AoykrKbVqJpYc1qM2K6Y/Gq/DEop0Hzabw4OPxIJmjBgDyrVRaHC0CfyGg7BSl1G/TJBvMX/uRFB6xYnqauUjYMSTEgAFKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/ooWKjX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/ooWKjX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772666986; x=1804202986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IxhaafHkztuY+zBNGR9QmlTYlbpS+bBlFqY6qE/kIHI=;
  b=P/ooWKjXQsaWU5Y/vhoNqLaycKwgA5uWbawOS8L444WCXjgUAj+TAzUY
   6h3+dyQh5+YnIU0G8wjNGeyee5H2THVo69rpI9VvkUjelnqs79gTj1laH
   5iERB30QVT+uEvpkLaJk5xYLmR8zj2mF4CFNcmItZuVxs6l/0KoNIXQUQ
   D8tJKypum+XryaiHrMJLvjg/6arnBbcXbkWFczADnmVh/MU/fxlbvUIiH
   I6FEci++2U+1vXbyt/66GYdB9zqShuf/uYGoSRbOotalvfCCfI67ETp7B
   AQm/dDHpiGXwO78jHiVnhk/tS8tXVuebB2qabCnWIxQ5tHzu2JDkTsk9D
   A==;
X-CSE-ConnectionGUID: Y3eQNYmTSC66bJj4rflPjA==
X-CSE-MsgGUID: OYe4WGdHQ9yUKH1jk3EGOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73865423"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73865423"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 15:29:46 -0800
X-CSE-ConnectionGUID: 8NrmtTl6TbKliB5/stzpFQ==
X-CSE-MsgGUID: sDfz6LUbRIu6hfvflP1C4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217739473"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Mar 2026 15:29:43 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxvet-000000004gL-2d5F;
	Wed, 04 Mar 2026 23:29:39 +0000
Date: Thu, 5 Mar 2026 07:29:23 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Chen <peter.chen@cixtech.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
	pawell@cadence.com, rogerq@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	Peter Chen <peter.chen@cixtech.com>
Subject: Re: [PATCH 1/2] usb: cdns3: Add USBSSP platform driver support
Message-ID: <202603050737.OrrASrnZ-lkp@intel.com>
References: <20260302030339.324196-2-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302030339.324196-2-peter.chen@cixtech.com>

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.0-rc2 next-20260304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Chen/usb-cdns3-Add-USBSSP-platform-driver-support/20260302-110634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260302030339.324196-2-peter.chen%40cixtech.com
patch subject: [PATCH 1/2] usb: cdns3: Add USBSSP platform driver support
config: hexagon-randconfig-001-20260305 (https://download.01.org/0day-ci/archive/20260305/202603050737.OrrASrnZ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050737.OrrASrnZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050737.OrrASrnZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/cdns3/cdns3-plat.c:26:28: warning: unused variable 'cdns3_plat' [-Wunused-const-variable]
      26 | static const unsigned long cdns3_plat;
         |                            ^~~~~~~~~~
   1 warning generated.


vim +/cdns3_plat +26 drivers/usb/cdns3/cdns3-plat.c

    25	
  > 26	static const unsigned long cdns3_plat;
    27	static const unsigned long cdnsp_plat;
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

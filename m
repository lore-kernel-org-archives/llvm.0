Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2307C23B8;
	Thu, 21 Sep 2023 15:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695310402; x=1726846402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UN0E2d7xSAWUwxO5LwpdogXJolKeSbU5R9vMjuwaEeY=;
  b=VHZeKucgHzdGkbJmgrSmBTIHeUdrzGm52y9TkPVVKSFsb2hXVsByHUJ4
   YdTyqvsjHxxamq3jYzq93tHTyuRM6GwLra6u+OFUWH+SBWQnVQYnAmbGm
   EmwrRqT6MgOw0RoRkvlRZ02odx6ur6ce4hyh0rxV4GJmStvNYf11Coc1r
   +D5QbFJj+41rcz+GUy8sNXV36rO31CRgcdCSxxd9BL4D/So5TbQLCleBo
   aT8xvi1rMheOWL8RNNfMDWkyIiue6sGizH+S9dUr4jFg1NBZZLJPBiGCO
   SxwpeblzYhTwixqxMJc+6dv4Iskc/Sk6VjLYJZDUDzv7/pXuWZv/dh6V+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="377849585"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="377849585"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 08:33:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="890415119"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="890415119"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 21 Sep 2023 08:32:13 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjLfr-000061-0K;
	Thu, 21 Sep 2023 15:33:03 +0000
Date: Thu, 21 Sep 2023 23:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jani.nikula@intel.com
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/hdcp: Move common message
 filling function to its own file
Message-ID: <202309212348.71aApJ0M-lkp@intel.com>
References: <20230920063611.242942-3-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920063611.242942-3-suraj.kandpal@intel.com>

Hi Suraj,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-i915-hdcp-Move-checks-for-gsc-health-status/20230921-174353
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230920063611.242942-3-suraj.kandpal%40intel.com
patch subject: [Intel-gfx] [PATCH 2/2] drm/i915/hdcp: Move common message filling function to its own file
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230921/202309212348.71aApJ0M-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309212348.71aApJ0M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309212348.71aApJ0M-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_hdcp_gsc.c:11:10: fatal error: 'intel_hdcp_gsc_message.h' file not found
   #include "intel_hdcp_gsc_message.h"
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +11 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c

  > 11	#include "intel_hdcp_gsc_message.h"
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

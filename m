Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C047FBFD;
	Mon,  1 Apr 2024 09:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711963559; cv=none; b=S2RsL+clNHS73BCVwbRkCBmhQTmCbiWR98jQ07JgUA+HnhOL+dbuahdPo2LON+6QTA6lGqYu79jW1sLtr/vjEC9Z/93Rr5X6uAfdm7+6PPtRZBzdlOG0DajzWYLw0QlBnCm/3fIMQGUrjxNVTbw/SQoi1TLyC7jER7U9in9dUpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711963559; c=relaxed/simple;
	bh=681T0zCtD19J2TUcsekIhyPXq2Cc2jWEYMcSLzuUOkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDkcB6AFF+Uk3uR3GLRx+43ikvONdEoizPIdJH5mWb3yLEmk9LO6SdRXTzGNV7vN49Dy4HoX653A2b4dpNMjgzMUpAL6S3mfkWnGOKA3Eqg0rOUsyhsVSJBA21IRas4Qb6GAUnBc0rfbZn4x1iKeKeXk5xQ/H+vFzmWFc3zmdRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=coxO62rq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="coxO62rq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711963557; x=1743499557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=681T0zCtD19J2TUcsekIhyPXq2Cc2jWEYMcSLzuUOkI=;
  b=coxO62rq75aA7/g4sSBb7KmiwGb0FK1CyUJNmMEHFAXGZbvE09HNoq+5
   FqwyFDsxO0Z9OpDrn7P+6jcsJB0xtf1KKzRiZuShHI9C7IXr2t2Zcn7hQ
   h6z9R0rGIEbkt6IsRIqyrGenZqwQoXWtiutVhFJGwPotpNLm0VEqD+V5M
   CrFeERYE2Nuao/HK/umi3hxAMy018Rxo9a2RTjSMRHPtwoDfN8s+/FGEX
   PkoBAnAebfH0hzHKnvc6K9Ro5pm5+UyGgemf2BcREiKposfVpo7K8YBxo
   NmkrczG/XD3wDCpZUpbsr55D+6e4Qco4tko8ZXbAOclqIks6a1cMyYx7L
   A==;
X-CSE-ConnectionGUID: k2sq8ONGS9O/V3EAuZRBCg==
X-CSE-MsgGUID: OtQRnmwySf2fezcH0IXz7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="32489981"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="32489981"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 02:25:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="22354324"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 01 Apr 2024 02:25:54 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrDvL-0000D1-28;
	Mon, 01 Apr 2024 09:25:51 +0000
Date: Mon, 1 Apr 2024 17:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	chaitanya.kumar.borah@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/hdcp: Fix get remote hdcp capability
 function
Message-ID: <202404011741.3ktdUlWv-lkp@intel.com>
References: <20240401030106.274787-3-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240401030106.274787-3-suraj.kandpal@intel.com>

Hi Suraj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.9-rc2 next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-i915-display-Initialize-capability-variables/20240401-110451
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240401030106.274787-3-suraj.kandpal%40intel.com
patch subject: [PATCH 2/2] drm/i915/hdcp: Fix get remote hdcp capability function
config: arm-randconfig-001-20240401 (https://download.01.org/0day-ci/archive/20240401/202404011741.3ktdUlWv-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240401/202404011741.3ktdUlWv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404011741.3ktdUlWv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dp_hdcp.c:697:17: warning: expression which evaluates to zero treated as a null pointer constant of type 'bool *' (aka '_Bool *') [-Wnon-literal-null-conversion]
           hdcp_capable = false;
                          ^~~~~
   drivers/gpu/drm/i915/display/intel_dp_hdcp.c:698:18: warning: expression which evaluates to zero treated as a null pointer constant of type 'bool *' (aka '_Bool *') [-Wnon-literal-null-conversion]
           hdcp2_capable = false;
                           ^~~~~
   2 warnings generated.


vim +697 drivers/gpu/drm/i915/display/intel_dp_hdcp.c

   683	
   684	static
   685	int intel_dp_hdcp_get_remote_capability(struct intel_connector *connector,
   686						bool *hdcp_capable,
   687						bool *hdcp2_capable)
   688	{
   689		struct drm_i915_private *i915 = to_i915(connector->base.dev);
   690		struct drm_dp_aux *aux = &connector->port->aux;
   691		u8 bcaps;
   692		int ret;
   693	
   694		if (!intel_encoder_is_mst(connector->encoder))
   695			return -EINVAL;
   696	
 > 697		hdcp_capable = false;
   698		hdcp2_capable = false;
   699		ret =  _intel_dp_hdcp2_get_capability(aux, hdcp2_capable);
   700		if (ret)
   701			drm_dbg_kms(&i915->drm,
   702				    "HDCP2 DPCD capability read failed err: %d\n", ret);
   703	
   704		ret = intel_dp_hdcp_read_bcaps(aux, i915, &bcaps);
   705		if (ret)
   706			return ret;
   707	
   708		*hdcp_capable = bcaps & DP_BCAPS_HDCP_CAPABLE;
   709	
   710		return 0;
   711	}
   712	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

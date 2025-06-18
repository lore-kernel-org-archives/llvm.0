Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A792F546E;
	Wed, 18 Jun 2025 18:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269623; cv=none; b=CdMfR1yTSqgi0C28lniA1Ca7s2U3dD+9X8xR5hC3AgjqCbS57shAnSSh+jWzugYuyXHekXgH1ymj3/V/AdK8+z8Xm+miemQORSJfLLrAgqY6wU7mKaUvot0j1UeuBgt/1omtcumQ3DDdReFcwUWAkhxVwHetZKmjYEPeqes99XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269623; c=relaxed/simple;
	bh=AY51LktMBALPiD923VjW1Ue6ct2aMtypau/sy83niBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvyaOdTzR2RfmOH2Y1xg+GbN9ycP7gtGHp1O1XDk6rno/cRa0+jZgpLuRAxiVS/pR68cvnkiwUzLETS7QUqAsBwWowkzNDXz1+c0OegjzsFKsJ2/sc67ov5OVFXi5oGKg5s3sjPmmxZY76E3sYCJ9/ZcvMjeexXEfqwR88MUgqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DqjQfMT7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DqjQfMT7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750269621; x=1781805621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AY51LktMBALPiD923VjW1Ue6ct2aMtypau/sy83niBU=;
  b=DqjQfMT7vOusTOD+zdkSjFdrizagXQIu5m+ulAlyw7YRwekuu59APX+D
   rR8mIs65hKqpvLglahz4ZaQfPW2+6GOmTS5Uh68pWAownI6W+tYW2R7/o
   7T1od48gIKAz5rGW1DYZpAkklIe2L3B70RxQKR9EZEhpP9uCIrhgyLq0t
   cV162gM6XJmKWJSyqfJM7uydKafWDCZRT9l+RWsZva44e2zbyr11WuiPl
   1EMwaR7RQyoUHcfvKlhgxabun0Y8ug35XqSiDIZD00dtf4KNuD7UctAAa
   Psksj8+K9vTY79uLJB5ZByaVG8vXi3MOZx7M6TLL8IR249L5sRixAplt9
   g==;
X-CSE-ConnectionGUID: VkVM5wauRGCb3jZsk5BQRQ==
X-CSE-MsgGUID: hm5mP43qSfyGkj2sgggNxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="51734831"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="51734831"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:00:20 -0700
X-CSE-ConnectionGUID: kAiU2hH7TT2yv5Q4l9b6SA==
X-CSE-MsgGUID: +jFpxS40T4azDAtAI3NIMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="150655742"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Jun 2025 11:00:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRx50-000K1m-2p;
	Wed, 18 Jun 2025 18:00:10 +0000
Date: Thu, 19 Jun 2025 01:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
	alex.hung@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
	pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
	jadahl@redhat.com, sebastian.wick@redhat.com,
	shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
	mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com,
	victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
	quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
	quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
	sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
	louis.chauvet@bootlin.com, arthurgrillo@riseup.net
Subject: Re: [PATCH V10 15/46] drm/vkms: Add kunit tests for linear and sRGB
 LUTs
Message-ID: <202506190132.r51ujYGM-lkp@intel.com>
References: <20250617041746.2884343-16-alex.hung@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617041746.2884343-16-alex.hung@amd.com>

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc2]
[cannot apply to drm-exynos/exynos-drm-next drm/drm-next drm-misc/drm-misc-next next-20250618]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Hung/drm-Add-helper-for-conversion-from-signed-magnitude/20250617-123027
base:   linus/master
patch link:    https://lore.kernel.org/r/20250617041746.2884343-16-alex.hung%40amd.com
patch subject: [PATCH V10 15/46] drm/vkms: Add kunit tests for linear and sRGB LUTs
config: riscv-randconfig-001-20250618 (https://download.01.org/0day-ci/archive/20250619/202506190132.r51ujYGM-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506190132.r51ujYGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506190132.r51ujYGM-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "srgb_eotf" [drivers/gpu/drm/vkms/tests/vkms_color_test.ko] undefined!
>> ERROR: modpost: "srgb_inv_eotf" [drivers/gpu/drm/vkms/tests/vkms_color_test.ko] undefined!
>> ERROR: modpost: "linear_eotf" [drivers/gpu/drm/vkms/tests/vkms_color_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

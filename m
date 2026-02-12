Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C10C1CDFD5;
	Thu, 12 Feb 2026 03:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770867427; cv=none; b=MOF0MgPxTWevAvgubY64CyXLkFV4QW96Zmlk9+JyCcOXdYbmXXWgG0CsX5Tldm/peY9k3p6TBka7CXqSq4wGmbEdRleBYldLHTrNID1BFqiWKpYYt/aFcn/V0kIobfI5tRSGQ8WDl3HTaUV4ZlHkqtpMut7+ENYjamHz9Ma95bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770867427; c=relaxed/simple;
	bh=NKfao1ygz76tzoQRBfZlrExWua32iDkEJOkINJcRurs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKD87n944eXzafe8K6hyeGa/ir6Zge+jB5i9nFDsJQgsKVpGC/qPetnA7g9Q5FtBXxb6hffH1WT3YvZXsubNN21SGrp25nWT0lWBk1TPyqG7R7+Ks9sw58XeZQLSK18a54fat9Buc8o6uKD3dwmF33WPDwlP4W91FjuDBQzNtrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIiZXz7K; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIiZXz7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770867426; x=1802403426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NKfao1ygz76tzoQRBfZlrExWua32iDkEJOkINJcRurs=;
  b=OIiZXz7KeF/bIJo6KBDHFV33oIy4of0XsT5g+YU5V2qHynisTKFoW7Oi
   CUvb8NhpzS/6fQFJVFjE84JacIGQnAoBRg1pJ6tiTYy+ywG77UwEdQ/wi
   IUa5LK9xi0Z74AxFen+/d3KfyZkhnAUzRuBSMoXoLaoucc8MVuh6X1K+W
   XE4KMJjwzGGVQ3tOuDHIZF+9SFB5U12SPETK5Oiuaux/hyT7Fjkpu+I3s
   sEqn532EsdkhFSUEZtl9exxt1oW+FsaCLOO1mCfb3yc8fGrReK/WXJBqs
   leODtXfOVxOrh2s+KWDL/K5Kw4Nv1WnWTBXoV7l63Hey5WdaY6QpE0/Wg
   w==;
X-CSE-ConnectionGUID: cIFI+bBRTT2Vk4AW8mdu2w==
X-CSE-MsgGUID: +klyAku4R5Stu1Ohjl7dMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89437584"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="89437584"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 19:37:05 -0800
X-CSE-ConnectionGUID: 4UDyxZNkRe+pwwQEoO+3Yw==
X-CSE-MsgGUID: k1ubzEQYRAmfo7N5rhdgsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="211554495"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Feb 2026 19:37:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqNVj-00000000qc0-1kpV;
	Thu, 12 Feb 2026 03:36:59 +0000
Date: Thu, 12 Feb 2026 11:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
	broonie@kernel.org, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH v1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <202602121116.499PMsGK-lkp@intel.com>
References: <20260211195406.289634-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211195406.289634-1-work@onurozkan.dev>

Hi Onur,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on drm-i915/for-linux-next drm-i915/for-linux-next-fixes v6.19]
[cannot apply to drm-misc/drm-misc-next daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-tip/drm-tip linus/master next-20260211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Onur-zkan/drm-tyr-make-SRAM-supply-optional-like-panthor/20260212-035718
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20260211195406.289634-1-work%40onurozkan.dev
patch subject: [PATCH v1] drm/tyr: make SRAM supply optional like panthor
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260212/202602121116.499PMsGK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602121116.499PMsGK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602121116.499PMsGK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `regulator_get_optional` in crate `bindings`
   --> rust/kernel/regulator.rs:287:23
   |
   287  |             bindings::regulator_get_optional(dev.as_raw(), name.as_char_ptr())
   |                       ^^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `regulator_get_voltage`
   |
   ::: rust/bindings/bindings_helpers_generated.rs:1306:5
   |
   1306 |     pub fn regulator_get_voltage(regulator: *mut regulator) -> ffi::c_int;
   |     ---------------------------------------------------------------------- similarly named function `regulator_get_voltage` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

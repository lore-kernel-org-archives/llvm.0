Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9D71E878;
	Sat, 11 May 2024 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715423644; cv=none; b=jX2D8IhQICh4wVoxjrASoP4FJmO319CHo5V4Om4dseaB2F4mcgnhWb1RJn6es8Ry+aSOdmmiwtBzfRjrU6v6Jhz7laL+SvX8ZgSlDxAbYf5CatvRlBz2HjNqNJ6k3+K6TI/bqo4by1QgXacy1YErFa0mUTy2Erjo35fuknyl7Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715423644; c=relaxed/simple;
	bh=LT6Da7c4yV7kBRJbMeeyERprde8ybU+YWeO2wvVYDYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daGKzfGKPvav41HXp3Y1lCrnOdak8eIiFUpHvhZK6AGAw5Gb517NG9ynOyROPzUp/5MIn1SKUfh4sLH86CvBbgWAlPNpgw48orjADna7g5JRlBWXHz82hcogCS+QAwi7k2YCTbBmrbK95PWfTeTRhuqTieGCpbtUK+XuKRwvrIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+a5zrEY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+a5zrEY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715423643; x=1746959643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LT6Da7c4yV7kBRJbMeeyERprde8ybU+YWeO2wvVYDYw=;
  b=m+a5zrEYsjLHmhtgTf7xSAOKR0mZl8ciX8aP2wdPakbvwaz5E/V6PIUY
   fLCCjcZ+qRu9R+bEJF/3agmlURKi4J8wFh8CFGewebt/AGAhmT/tvln/H
   b3pdcHHAKf0DnqvJPFmI1fd45Be3SIXA+jxEIi8jsYJTnIVg7A5DcqPV3
   KxIFUFGmZ55ubp9IHGTk99Vvg1Sh5BgmUYNbKSGxxizOlBp60+a1pNKKO
   AFuYBU3NySgV32NWKdy8hAbZgQ6xt/F0kBzRDnQ77QdKtJFzIQ3ZpfcgO
   PTAmJvbzPhmKea81bFVM04cYF86h+eI0POQ9xeHynpV4yuSZin7kSloBe
   g==;
X-CSE-ConnectionGUID: ka9ywpTaTBuM6usaZ94UIA==
X-CSE-MsgGUID: 9qFHJGrqTU+atx4yYZbbnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="22823084"
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="22823084"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 03:34:02 -0700
X-CSE-ConnectionGUID: G0c0dGLoTZi5sT1EHAA2Tg==
X-CSE-MsgGUID: SIOyAG5mTmC5erWvfJq7JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="29845344"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 May 2024 03:34:01 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5k3B-0007Fn-2u;
	Sat, 11 May 2024 10:33:57 +0000
Date: Sat, 11 May 2024 18:33:09 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 20/20] drm/xe/display: move device_remove over to drmm
Message-ID: <202405111828.vE3DTOeD-lkp@intel.com>
References: <20240510181212.264622-42-matthew.auld@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510181212.264622-42-matthew.auld@intel.com>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm-misc/drm-misc-next next-20240510]
[cannot apply to linus/master v6.9-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Auld/drm-drm_managed-try-to-improve-the-drmm-DOC/20240511-061452
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240510181212.264622-42-matthew.auld%40intel.com
patch subject: [PATCH 20/20] drm/xe/display: move device_remove over to drmm
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240511/202405111828.vE3DTOeD-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405111828.vE3DTOeD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405111828.vE3DTOeD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_device.c:18:
>> drivers/gpu/drm/xe/display/xe_display.h:50:60: warning: non-void function does not return a value [-Wreturn-type]
      50 | static inline int xe_display_probe(struct xe_device *xe) { }
         |                                                            ^
   1 warning generated.


vim +50 drivers/gpu/drm/xe/display/xe_display.h

    49	
  > 50	static inline int xe_display_probe(struct xe_device *xe) { }
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

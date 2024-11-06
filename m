Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C686764D;
	Wed,  6 Nov 2024 03:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730863149; cv=none; b=GX0gqgJT6+mLcab7bguMJc1VVXrrqed4k9Yj9BBAKMJGHxz/N28L6KpF15JisakB5osS3eeS2S4A4swDenQ5PHBt17AShO1+RzIzzh723sAvIzPz/LBz3FUuuF6yOayIh0ekmEsg1lFw09Tt/q4x27TVQe0/MAdEdW3a7M38Fos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730863149; c=relaxed/simple;
	bh=o8aQslghnk2+z70tsW+2DklDn7CG8sbivh6qhEJ0ZDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FliyTWLQwtVQHI3qbfnGZP2slvV7NqJwkrqp8Wl11PWCrRYO6lET7SlvLpGrnSeGhzPdgRVhuRk7GSLWh0tutve5fpxFW+EAwGXtvpdlcwDSWXUcFF+7oXuAiOXSlHo6skDzxyywea8RZky3KpHotpMUpX4HTBI8BDAnsdcB2k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKFrk0Tw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKFrk0Tw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730863147; x=1762399147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o8aQslghnk2+z70tsW+2DklDn7CG8sbivh6qhEJ0ZDw=;
  b=iKFrk0TwIVGBVt3HxtOjHyojIfP2bcgm8pVao+89GIoa9749AAHbBYyr
   r9GZlKr0mxJ2UoGIL6ZNqZVHYdAOYX94ZagfZxu4rCdZNrgAq+oIrqSHg
   I7uQf2Lz83hVASmgbAOoFRd4M8OFJGAuLAdhg08HceLxXih5PlzvwAosL
   aR7pCg1epAdU17Z+aCKAlvqWgc6IvxenUpNQBpzYlrphp81+bIu7omhMr
   dZ0MbQFimXCI4Xp3jpFqdw4mWy+WkL5E8g1H2Ibpy036NkZlGgfz710Mz
   Yn0Ggi8wv0FWGt+iDElTyKYN29MEKnYcjFMYMS1JciJYOYTxImKhRZbGZ
   w==;
X-CSE-ConnectionGUID: wtBflMw+RZ2DsSODeHfrvA==
X-CSE-MsgGUID: v8ZGg4gfSme4paemXnOF1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30759608"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="30759608"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 19:19:06 -0800
X-CSE-ConnectionGUID: C3b9hammQ5K62oSusumzvA==
X-CSE-MsgGUID: xp94QqJRThKSfiZb/sjasA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="84692741"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Nov 2024 19:19:04 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8WZR-000msn-04;
	Wed, 06 Nov 2024 03:19:01 +0000
Date: Wed, 6 Nov 2024 11:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>, linux-hwmon@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pwm-fan) Introduce start from dead stop
 handling
Message-ID: <202411061031.GHHHxm19-lkp@intel.com>
References: <20241105135259.101126-2-marex@denx.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105135259.101126-2-marex@denx.de>

Hi Marek,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.12-rc6 next-20241105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/hwmon-pwm-fan-Introduce-start-from-dead-stop-handling/20241105-215454
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20241105135259.101126-2-marex%40denx.de
patch subject: [PATCH 2/2] hwmon: (pwm-fan) Introduce start from dead stop handling
config: arm-defconfig (https://download.01.org/0day-ci/archive/20241106/202411061031.GHHHxm19-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061031.GHHHxm19-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061031.GHHHxm19-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_uldivmod" [drivers/hwmon/pwm-fan.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

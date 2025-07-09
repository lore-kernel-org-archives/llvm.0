Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A622528B7DE;
	Wed,  9 Jul 2025 10:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752056599; cv=none; b=B+8DL6rK4tU1T8Ea/38tZ/3VOQe1kOdzQdkcIJaOwGBKTq8J2RRkdn75+AReCESrK1Byb6JJ9/BxUbh9kpNE8naw6NcgYgbutOBU11p7NJ25ATbgp0lh1EAdjCs4Eq1nbyOiNEH5g8HmTzHXoIaUUEisFpogSWWVyY+hS2uly6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752056599; c=relaxed/simple;
	bh=saN/d4gfnEw13D+prR8b8IdE3mlm76MqGHQUgKWmIVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbMwXVjKXkeZ8fqI+SAsDhbbS1D1fPfTZrFN8A1Jg8rNG8TBE/3m/AI1MbMB2T5S3wjeBO0+92rixKrjjGUYYXXsj16hlO2tiGiskLt6iVm04kPwWZTbET3ube7yuPAoxUFN8WDQDjrTWSi/z20P89h0iPWejKdNTQVxPWZ5Wzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nicqy+R0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nicqy+R0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752056598; x=1783592598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=saN/d4gfnEw13D+prR8b8IdE3mlm76MqGHQUgKWmIVM=;
  b=Nicqy+R0TdipZB532ShK1EFZo84lQVBzNlTwzCGM2jTJJ7yx8f1TythC
   9cD1nXSvYFloTkkGz4nwkJCEl+LsAdRag1io2J/GZxi65Nb8aaCACCXBE
   XAzZPyiu7JEcaqtaUpiermnk0zc9yfyBtFXoye25HeK2jP1Uixxo+Sf0x
   oon5ciUIsitZYlfUskxocOQdwb7gu7P88tnsH4koKTl+IMin7ftr1SGV8
   Z6LXjylATW79MznIQcARhCA2+GNh2/uThBhx2ZO9yR1omWwclhuj7hQJu
   fzPjQNW1OH3dVL22NJ0mzCGBUzzALKTs5vTx/lvJ4TFVBQG88N+v4jwey
   w==;
X-CSE-ConnectionGUID: Jz5gSZY4ROS6kaw3MgCqhw==
X-CSE-MsgGUID: kQ+CgewJRoOXXFaPyZgFGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76860268"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="76860268"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 03:23:16 -0700
X-CSE-ConnectionGUID: 0H38jff9RYSTaPGDbHz5iw==
X-CSE-MsgGUID: P5tlRiFCQPi8zz6fhqvRcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="156221519"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jul 2025 03:23:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZRxG-0003OR-0S;
	Wed, 09 Jul 2025 10:23:10 +0000
Date: Wed, 9 Jul 2025 18:22:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 2/8] media: uapi: Convert RkISP1 to V4L2 extensible params
Message-ID: <202507091859.x8Yx8AZb-lkp@intel.com>
References: <20250708-extensible-parameters-validation-v1-2-9fc27c9c728c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-extensible-parameters-validation-v1-2-9fc27c9c728c@ideasonboard.com>

Hi Jacopo,

kernel test robot noticed the following build errors:

[auto build test ERROR on a8598c7de1bcd94461ca54c972efa9b4ea501fb9]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-uapi-Introduce-V4L2-extensible-params/20250708-184651
base:   a8598c7de1bcd94461ca54c972efa9b4ea501fb9
patch link:    https://lore.kernel.org/r/20250708-extensible-parameters-validation-v1-2-9fc27c9c728c%40ideasonboard.com
patch subject: [PATCH 2/8] media: uapi: Convert RkISP1 to V4L2 extensible params
config: i386-buildonly-randconfig-003-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091859.x8Yx8AZb-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091859.x8Yx8AZb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091859.x8Yx8AZb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/rkisp1-config.h:10:10: fatal error: 'linux/build_bug.h' file not found
      10 | #include <linux/build_bug.h>
         |          ^~~~~~~~~~~~~~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

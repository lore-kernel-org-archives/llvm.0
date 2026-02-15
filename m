Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3102E246BA7;
	Sun, 15 Feb 2026 19:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771184883; cv=none; b=IPtbcB0+5+zEGkhzTJ2thsBg/CHcE6+SCSuVvADodUI9rKoFVifJ079EUZzUvWoZzH4E+PZrRY8wzNnqgziWZ8LpRXS8TQAlgVGMN3x7VTUqV3Gfoqf6PcJqPCDkaBy3g8CEXy6Bjn8JxLXNyXMLX3xdG+wukpw9TqAj+vega78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771184883; c=relaxed/simple;
	bh=u21ohV5VvKmlx+8cj5HkNObPwIvl500QqK0TSysoYAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2DlEIezYCxDrhEzro7xcKJRNsoGxq65o4zYQTUE3ybp+Uy7WM6JYyHirO4d5tRRyST/Rq+veSPBJz7+q7KzeK1swxveS+LJIcVd3Q2DFAJjlvmfLWkshq5M6MUZ3EqBB3AGziB+3wUkXD3uZlCi4SJelreO9s3gCYCkMq2hE0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2qaou5V; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2qaou5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771184882; x=1802720882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u21ohV5VvKmlx+8cj5HkNObPwIvl500QqK0TSysoYAg=;
  b=F2qaou5VOxaooDPAwvWIsZam1sW1jRJALHQ/tL2y/eygF4yrBl5io0hO
   q/adY7CI4CqkMBil476trdLn2r2ZdVKn/A9o/EioaiLPxBYnD+71cGHpa
   oGcn1B0Ube/1Qhp0BMFK716x7Edj29xwDBEXqcC1zc433WW02FCLVApMh
   xhduQnJGbluFZXjIULWMmBewQTb6v2M+Pz9DhnmrLlMYX0T5hA/Sy/PpQ
   Rj1Hy8giKIOELkKUPz1CkdYu8ecZpwnnLDSrxM4hRpJaHTal0cgNZ00GO
   HvzUnvJ/iwBmFjiolRovJGEKrAUwj6/NAoV7hDy5vTn1l5qJlqR34d0SN
   g==;
X-CSE-ConnectionGUID: Rawk4xw3TiipXPgNVJDihQ==
X-CSE-MsgGUID: VTkWnfPxS86sbwenMT5EvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72378360"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="72378360"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 11:48:02 -0800
X-CSE-ConnectionGUID: SfCyACTCS5eG7cGxB5whvA==
X-CSE-MsgGUID: Du1doCDySMOrRpu7mppgWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="236419391"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Feb 2026 11:47:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vri61-00000000z6i-0FX9;
	Sun, 15 Feb 2026 19:47:57 +0000
Date: Mon, 16 Feb 2026 03:47:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting.
Message-ID: <202602160335.x6UNh7ba-lkp@intel.com>
References: <20260215061339.2842486-7-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215061339.2842486-7-derekjohn.clark@gmail.com>

Hi Derek,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5a5203a45b063a594e89a2aeaf9e4923893a5b4c]

url:    https://github.com/intel-lab-lkp/linux/commits/Derek-J-Clark/platform-x86-lenovo-wmi-other-Add-LWMI_ATTR_ID-Macro/20260215-141750
base:   5a5203a45b063a594e89a2aeaf9e4923893a5b4c
patch link:    https://lore.kernel.org/r/20260215061339.2842486-7-derekjohn.clark%40gmail.com
patch subject: [PATCH v2 6/6] platform/x86: lenovo-wmi-other: Add WMI battery charge limiting.
config: i386-randconfig-003-20260215 (https://download.01.org/0day-ci/archive/20260216/202602160335.x6UNh7ba-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602160335.x6UNh7ba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602160335.x6UNh7ba-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_battery_hook_register
   >>> referenced by wmi-other.c:788 (drivers/platform/x86/lenovo/wmi-other.c:788)
   >>>               vmlinux.o:(lwmi_om_master_bind)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

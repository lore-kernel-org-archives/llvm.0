Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A17535AB;
	Tue, 26 Mar 2024 14:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711461651; cv=none; b=MdXH7nZ5svfpJ/QcA6lsfK2I6/JxgD7jPNDxHD6CK1tSjhFKFT3+5P/Ix3fYbJgVecwD/XkeJQ4QwBWMyTFuIx750aMXwHBRPzklo3SJNWgcRD92UU8a0lxWsthIEp+ZlK14ArVi2khj57JRlIXyop/40fe2m5jWseSyhjf+csc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711461651; c=relaxed/simple;
	bh=dPmw/P3DQOIQeQOCPuoNevPMcY+dNrGN9ALSzGJjMyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpcnIqFCL4WsKTbuVdzt+h9XrFFGbmNV43PiwCfJbP9OTH2ZlretwSj4xMVDIwo9pEZA/MR+cskJHecp+6oRrSlIW20NNS4oz3WCzTJuDu1LhC/ekYyAI23RmhxdeYtvUPYjx8D12YNq08olnXJyXWHJUIAMVSRcvlcPPd/Bjfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndr8TbKm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndr8TbKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711461649; x=1742997649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dPmw/P3DQOIQeQOCPuoNevPMcY+dNrGN9ALSzGJjMyE=;
  b=ndr8TbKmLA/r4SrYIasVur+IGC9qXFVGi9kJEvdzroWFFnGDcysXvjfy
   /C0Pm+rtRP5oYytcAcHGK9wqJrGxUz8f3Ti8gRKdd03r0zCTrv+n7upX7
   zrzXnOpS3faa4GbSGp7koTCQ1FkUM1jWbF7ngKPjfM5d4xgtEMRa4q+le
   HhjjqGE1GBWtGOOY2Q1R3v/FTeIQTI5FvFZKGLONP6kciAVNHk9suLUvn
   9QB89lyof/a/SBrKNyccsO3ZPuCes6RyFyNWhvraUtCLHY0k4yCSoF1yH
   CU9D5faazYL7HWuF2WhDI72WSVNTt1KXZaWoboGZBh3lnKwYXIEycU5Q3
   w==;
X-CSE-ConnectionGUID: B/mJAXtaSWCMZdrHLbPe3Q==
X-CSE-MsgGUID: AaZBi65pQLyxv2Jjkg1OBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17055929"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17055929"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 07:00:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="914881298"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="914881298"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 07:00:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rp7M5-0000000GJrL-1JZ2;
	Tue, 26 Mar 2024 16:00:45 +0200
Date: Tue, 26 Mar 2024 16:00:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: Re: [broonie-ci:fileECoqy0 5/6]
 sound/soc/generic/simple-card-utils.c:755:14: error: no member named 'gpio'
 in 'struct snd_soc_jack_gpio'
Message-ID: <ZgLVDe5PfLMHOSGD@smile.fi.intel.com>
References: <202403261005.2Hemu0jm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202403261005.2Hemu0jm-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 26, 2024 at 10:33:35AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileECoqy0
> head:   3c398a2eb9081a10c34a40701159a34319a35f19
> commit: c81737adb6536b26ebf9176179b3551cb33be4c0 [5/6] ASoC: soc-jack: Get rid of legacy GPIO support
> config: x86_64-buildonly-randconfig-002-20240325 (https://download.01.org/0day-ci/archive/20240326/202403261005.2Hemu0jm-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403261005.2Hemu0jm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403261005.2Hemu0jm-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> sound/soc/generic/simple-card-utils.c:755:14: error: no member named 'gpio' in 'struct snd_soc_jack_gpio'
>      755 |         sjack->gpio.gpio = -ENOENT;
>          |         ~~~~~~~~~~~ ^
>    1 error generated.

Already fixed.

-- 
With Best Regards,
Andy Shevchenko



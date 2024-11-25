Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6903194A44;
	Mon, 25 Nov 2024 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732534972; cv=none; b=Zu7wZLBdYWNRRLHG5MRxo6ZrrM8sxGBWGCDufRHn3cmL3JJzPY0+tm5DrRcsfD9xpf9wKy5ODh1XEW6WSgFqH60BpeGuu67qZKjV1fCunfFF5FFBOmasjBPixmNSoRg/+gDQcGKVGSYzaol4+01uN3MkhKuEJnta231JqbNtUq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732534972; c=relaxed/simple;
	bh=/tvYCZ2YN+fHWCx8kb6FLlRxDsTEAuSmzNv0Qt9XmIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfeDEhz81COWL2D62kV6b9kl5X/TS308qub2MLGR7na6aiKFSQSWLeAYYnjs+mMqZQ07JC+oI833EwUzZq8yqce2/JeZQmfevKtOxxQEcmT2YnbxYhskoF9HiO27FF68pH2zAsPndyLDlsI3OSsu3spcHnJHSItxjPdVCeMS9HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqoo0JrW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqoo0JrW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732534971; x=1764070971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/tvYCZ2YN+fHWCx8kb6FLlRxDsTEAuSmzNv0Qt9XmIY=;
  b=eqoo0JrWts/Wl5B+do1opBh5NSr+OVq5FxYvgEsoefc0MFUnhfCSll0u
   M8fkaT3HRphId4kVor2v8Quczfma+4oyKdZmNwZPs1iqOu1XsVmrhdIB9
   VjOCT1S34FFvuLbPij2WLbLJN8cSqo0xNB2ZajxFj0MYwoTS2KpClHQFY
   9FJIG+40qHksfA4tDSY0rt3u2RcZqNyG/EBQsQq4pRrHkHR1mGvpk1veG
   Vjo1iEwAwP4ue8iB1nPO9Cjp2j2vi+uHTDP64noGNSj7Fwc4n+Bu0Q+HK
   04tumBCP2165WydxxdWiWPaFLI4qkqrtYIpJTnljDJDX0C/0ax9vRkTrx
   A==;
X-CSE-ConnectionGUID: rOFIPJZGRCKxndOZfycxxQ==
X-CSE-MsgGUID: jqTOmgSxRj6NqNb3SBDz/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43699115"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="43699115"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 03:42:49 -0800
X-CSE-ConnectionGUID: MTmHcvOASc+QL/oqKW29QQ==
X-CSE-MsgGUID: yoIqH574SOqq/islBK6hdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="95654008"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Nov 2024 03:42:46 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFXUK-0006GH-0h;
	Mon, 25 Nov 2024 11:42:44 +0000
Date: Mon, 25 Nov 2024 19:42:22 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>, tglx@linutronix.de, bp@alien8.de,
	andy@kernel.org, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: Re: [PATCH 2/2] string: retire bcmp()
Message-ID: <202411251926.sIYJ9sEV-lkp@intel.com>
References: <20241123094729.1099378-3-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241123094729.1099378-3-mjguzik@gmail.com>

Hi Mateusz,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/hardening]
[also build test ERROR on tip/master tip/x86/core linus/master v6.12 next-20241125]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mateusz-Guzik/x86-callthunks-s-bcmp-memcmp/20241125-110959
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
patch link:    https://lore.kernel.org/r/20241123094729.1099378-3-mjguzik%40gmail.com
patch subject: [PATCH 2/2] string: retire bcmp()
config: arm-footbridge_defconfig (https://download.01.org/0day-ci/archive/20241125/202411251926.sIYJ9sEV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251926.sIYJ9sEV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251926.sIYJ9sEV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "bcmp" [fs/fat/fat.ko] undefined!
>> ERROR: modpost: "bcmp" [fs/isofs/isofs.ko] undefined!
>> ERROR: modpost: "bcmp" [fs/nfsd/nfsd.ko] undefined!
>> ERROR: modpost: "bcmp" [drivers/net/slip/slhc.ko] undefined!
>> ERROR: modpost: "bcmp" [drivers/usb/core/usbcore.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

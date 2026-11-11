Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363680;
	b=vTsFXpV7UfSvNbdMkEZtuYcuJHHkIkbmQpR15DSjk8yrzKcILDR5UC8YbcyINWOTH7Ww
	 tgFemg2bpP7j5vxiS7ykCG8uG/tLIZkapmT4C0tYhd/Fo6wCf5ZQzwYYmOBxixHGDriBx
	 6oIRG/mswSC53KqfMqXYc+2SM9W6CeSjMiGqwIVEAL8l6yuKEAfBdp8/akXxezXDCec9P
	 Grhyxit9kdMw9uTMSIoyQ1G1Tu7JknVWZ9fwsR665lGlTblVmnKNsLK/ZFgIBLr56incn
	 1eu8OwS312LrXr344JniuhwHbpPP9G07aC7i4rApJPENphDwPH7s7sdxet6TB3kYYvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363680;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=jWIl+ok0LbJ19byLo3dH0duNZ9w4DvvvkmxQAxf7nIc=;
	b=K9IiQMkuJKfKbdlUFN5YcL8+ro4u8Y2bo+oa836ceMcoLjDTjjAcHTZOKpUNum/POtpw
	 sWY0M6iRq8vBodzsajMHKQTLRguDK3F1WWiN5S4yeAs3GG2YE8BOwrSoWd4yOQeP9hdxZ
	 AyRHxWKNR4Fun1rJrS2spEn8WJJbtopyVlPfm8F4kZbb3AsASgJ+zhDLynmFZ2/6o2gHz
	 IXdTOEGypVShWKdOBqCRyVKNyStkEO1sNxIg7AQy24he/1jWugAoFldaoifym1eWwbvfN
	 6qEIAW1pF1F+X6HRQTJeIBxNKbqQyRrNZzp240tspjTi+Uic31kby3AdzlsKOEW+lQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Ir/R1h08";
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D924606A320;
	Wed, 11 Nov 2026 02:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D924606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ir/R1h08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794363680; x=1825899680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rvOSeQ39NBfasCqukJ3UzPVt4fIxoPRRFZUOJCqReNs=;
  b=Ir/R1h08Gzb3HriUfFNccs+s24IZCXGHKT4i/bHJp5dk2KyCEmZOld0W
   iPzX82iK8tnWV8x8NdmOas6urmfyiueroLw1bZoyydHwaTkEUrUFRIm88
   K8vOk7XTvAB5KOo9pSGDip04S6zKZ1MgypetsffvQ0NIDMVAmHytuHGsW
   gsIXa7Fb0/pmwcVg4w5EQJCv7/9NV2Qws2SkLOHgfwaN73WL41gg6mYEm
   1WWZ0sUk9woQVTIGBFLgnwYYNagvhWREAmWFJq/MSlhXtPqqZ23T/FHTL
   KaBPjcWj+DXPdZhesDd77t7oHl+Kigeum1g2fqIF6P9DBGt0Wy7E1ECRO
   Q==;
X-CSE-ConnectionGUID: fh8AzQ0DQn2z1XkMFSNxfw==
X-CSE-MsgGUID: xCCth0aETiW84eanNhaCSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3153915"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3153915"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 18:21:19 -0800
X-CSE-ConnectionGUID: s8pgxb4ITw21UwrhpOPJ5g==
X-CSE-MsgGUID: AL16Hv83ShS6CQy8vh+/+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8643053"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Nov 2026 18:21:17 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQxxa-00000000xtt-3Hs2;
	Wed, 11 Nov 2026 02:21:14 +0000
Date: Wed, 11 Nov 2026 10:20:18 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] pstore: Use match_string() helper to simplify the
 code
Message-ID: <202611110914.EoazwrWL-lkp@intel.com>
References: <20261110151844.661926-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110151844.661926-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kees/for-next/pstore]
[also build test WARNING on kees/for-next/kspp aegl/next linus/master v7.4-rc2 next-20261109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pstore-Use-match_string-helper-to-simplify-the-code/20261110-161844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/pstore
patch link:    https://lore.kernel.org/r/20261110151844.661926-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] pstore: Use match_string() helper to simplify the code
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261111/202611110914.EoazwrWL-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611110914.EoazwrWL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611110914.EoazwrWL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/pstore/platform.c:134:13: warning: if statement has empty body [-Wempty-body]
     134 |         if (i >= 0);
         |                    ^
   fs/pstore/platform.c:134:13: note: put the semicolon on a separate line to silence this warning
   1 warning generated.


vim +134 fs/pstore/platform.c

   128	
   129	enum pstore_type_id pstore_name_to_type(const char *name)
   130	{
   131		int i;
   132	
   133		i = match_string(pstore_type_names, PSTORE_TYPE_MAX, name);
 > 134		if (i >= 0);
   135			return i;
   136	
   137		return PSTORE_TYPE_MAX;
   138	}
   139	EXPORT_SYMBOL_GPL(pstore_name_to_type);
   140	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

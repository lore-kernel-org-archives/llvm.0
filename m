Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6013C18C90A;
	Fri, 18 Oct 2024 23:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729295714; cv=none; b=sG2Ce4kGNuQc2VBurmb56qICguaHra+4aIYiFEsB63Fk+pBWIdUcY2PDcQcjW1mzFtmTCsOwVT9EKZF8KwihX88pmp4GxHEGR36c1eXM5eK3s0VlEsAJ3zfooA3puCNxn0zg5ddw3xgfJptje+JaImtxuapM7q/EAsaxzHE2trQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729295714; c=relaxed/simple;
	bh=MJjIeO3loNc/duwvXwN1EGCcLC/ZJhsZTCKwhBQqNA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dv8Xjg4h+pt0o3sVGnP/VSEn3D0Y3AyoD/wd3mZdyOyIswurvOy1cdf8LW6M+/MDOWwYlV8OLfeWaAwQ6Nh0y256zxLGUblyMo17NrrCd4ugb3C4t8M3ekvPI813fspKq0XggttdyIrTBROT1UBs1GMjpWb7sJcrrJFRyMMGUFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5rhTkT9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5rhTkT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729295712; x=1760831712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MJjIeO3loNc/duwvXwN1EGCcLC/ZJhsZTCKwhBQqNA0=;
  b=S5rhTkT9kC3PFDwDeZb0SEBMP0/wmCWc96Pbw6h4zOielF1xmq8MvRSK
   JrCXc+4TE0jsu9kkt2zebbcW1tfyFU/GKwX4Pr7IGo4QjsZg5QqBwcrW+
   bbv6wYNKogjbb+jBZ0gOWNtI1xFilev5k0rCRYuXhKY1sCKXjjY+BBJ9S
   jZDRZU9nosvE34UpMqimoKrFpqplqGJ/lZgQ++oTRyz14jWXuNc6pT5ZP
   UTSM7QvsqXqVYDpa30azopSIiKjQKzZFSx4mCb0fJ2zK6U3UT7VLhVVXR
   1PAIuVNil9LGy6JcKXKI9/kjQlKGCivP55kAX2W3mJOp9FsYmk5GFI38v
   Q==;
X-CSE-ConnectionGUID: 4uoGh/0nSe6QqlE0oU5TVQ==
X-CSE-MsgGUID: E5nkAuORS4WPHshC07L0BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28800073"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28800073"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 16:55:11 -0700
X-CSE-ConnectionGUID: PSWMNZc6R4GHJbkGTXLarQ==
X-CSE-MsgGUID: sVZLQ4YaRCKnJlz7q+gtAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="78969679"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Oct 2024 16:55:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1woF-000ORJ-01;
	Fri, 18 Oct 2024 23:55:07 +0000
Date: Sat, 19 Oct 2024 07:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb+git@google.com>, linux-crypto@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ebiggers@kernel.org, herbert@gondor.apana.org.au,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 1/2] crypto/crc32: Provide crc32-base alias to enable
 fuzz testing
Message-ID: <202410190753.2wu0ZufT-lkp@intel.com>
References: <20241015141514.3000757-5-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015141514.3000757-5-ardb+git@google.com>

Hi Ard,

kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/crypto-crc32-Provide-crc32-base-alias-to-enable-fuzz-testing/20241015-221858
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241015141514.3000757-5-ardb%2Bgit%40google.com
patch subject: [PATCH 1/2] crypto/crc32: Provide crc32-base alias to enable fuzz testing
config: i386-buildonly-randconfig-002-20241018 (https://download.01.org/0day-ci/archive/20241019/202410190753.2wu0ZufT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190753.2wu0ZufT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190753.2wu0ZufT-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
>> ERROR: modpost: "crc32_le_base" [crypto/crc32_generic.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

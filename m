Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF591DF975;
	Wed, 29 Jan 2025 20:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738181445; cv=none; b=YlfaZ6P6JwN3oWJTGnvSc3XXQzZPoI2+Rbt74WqD+oro3WqAZLIglaz2SV+X0DJM6v7DepVblmx68i2JuuGPEvvXVNoppZJjXmeIv3gGnnhGkD+ugDvLQCQRRgToAmrTvFp8Yndk1YUPG2yXei/7p5syJg+AiwIDpDzu4BqSX/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738181445; c=relaxed/simple;
	bh=a6ilCHDRDrR8mtp09/WOTr2MZ+Eh4q9jTMUMotr870s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptls4i02lMKF+adDjvyrx3XEYCOaS2vgg6TCBs+lHOtlFwIBIuJQp3TyNtdBDeK1ly+5cnV9aMVmq11DBoWdn0wI5A3QCA9TXu7gdTVWwvqfRJP6WMK6gXCUyq4K/B1k3nBnWONU/1V5+mfJZX5zzwCsd8EL+kFhPWA79tRjWUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OLMcK5py; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLMcK5py"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738181443; x=1769717443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a6ilCHDRDrR8mtp09/WOTr2MZ+Eh4q9jTMUMotr870s=;
  b=OLMcK5pyXwj5sgBv47s0otcqUHvHAzF3vWu7QOQ+1gpg45YJz4zHOILb
   9o4Tisot/XxG7elsAE687jvt8oM5V6cunrZZJSXHOKRBtkK5R5WARCWHc
   7kjKrw+eaQGj5qQ0Owohc17Q83nVHTga3/0EBKs6utfxY2yRpg+FXKReu
   AdHxA5hD9/eesQsFhfiqFjy/788tTpoadViR8r1BauynHUZSRBNkzM7rS
   1BbQI1Zr/C5yTcWlfoYTc/uVtL5odJquzWF5Y2i9b1kkEoeyJgnAfmJ/U
   bhJvQRpZ1pvHlcyIfDFSjnn7PYPmboRnGmNBRG5Fkh5EwES99g1xLh/BU
   Q==;
X-CSE-ConnectionGUID: gzL6HqDtSUKPyhfJfhogYw==
X-CSE-MsgGUID: 7TpbZFdgQ56SXrvvMCvL8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="37913362"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="37913362"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 12:10:42 -0800
X-CSE-ConnectionGUID: ge1tKmN2TG2CRX2+N4B62g==
X-CSE-MsgGUID: y0lQxt+8QaWdgEeNm+wNXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="108936865"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Jan 2025 12:10:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdEOU-000jJ5-2y;
	Wed, 29 Jan 2025 20:10:38 +0000
Date: Thu, 30 Jan 2025 04:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] crypto: x86/aes-ctr - rewrite AES-NI optimized CTR and
 add VAES support
Message-ID: <202501300300.GpVBw7ZQ-lkp@intel.com>
References: <20250128063118.187690-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128063118.187690-1-ebiggers@kernel.org>

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on 805ba04cb7ccfc7d72e834ebd796e043142156ba]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Biggers/crypto-x86-aes-ctr-rewrite-AES-NI-optimized-CTR-and-add-VAES-support/20250128-143541
base:   805ba04cb7ccfc7d72e834ebd796e043142156ba
patch link:    https://lore.kernel.org/r/20250128063118.187690-1-ebiggers%40kernel.org
patch subject: [PATCH] crypto: x86/aes-ctr - rewrite AES-NI optimized CTR and add VAES support
config: x86_64-randconfig-072-20250129 (https://download.01.org/0day-ci/archive/20250130/202501300300.GpVBw7ZQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501300300.GpVBw7ZQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501300300.GpVBw7ZQ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ucs2_string.o
>> ERROR: modpost: "nil" [arch/x86/crypto/aesni-intel.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

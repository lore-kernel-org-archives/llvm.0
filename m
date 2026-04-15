Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA2C2D2385;
	Wed, 15 Apr 2026 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776256688; cv=none; b=hiyg+lF+oz1byJo/31CwRn3ggHEDaumJVf+xScYyb334qe3h/4hVZiMTxxKvAuvQdE9XeGjWHCIRF9FAKjBLjV+0LhuQeYdhR21HMv3LkgaKVLIoRbUEW/cekF5MZHJeW+T1f8jIqml1HPin4H8fcI99HSkIZDc7FowDd0I7470=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776256688; c=relaxed/simple;
	bh=vbfDbK70zsatpuCrYngbdq77H1uDo+Or6GxMvEi/fzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4lw3kx/epKUla/yhjkEQnoaXiIGVAZqRbhB7LC4yYtX25C2t2bRd3kKDXVcc9LC9jGg79QOOpXJz39c7fyzTg8q8EVM+AoJNsNcr0+GPiBmRp+TXm3LpVMoZmUTTDHW6q/DWA4cH51mWysQTdUraUwsLMH1h0MBn/czHD7cIRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQv1H5Gc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQv1H5Gc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776256687; x=1807792687;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vbfDbK70zsatpuCrYngbdq77H1uDo+Or6GxMvEi/fzY=;
  b=GQv1H5GcScrgubiyHZkg2D1aB0dxeQ0hEnW1WOb2rF+r/4oOngKlStB6
   NBnHPQnwaWb6mL7zx+GrpMCbOIifK0xIdAdukxppgbyBoZ+F4q6JD2H4g
   G/Eqn2x03ut96jWwQX+yDl8lYtUG06mkJrr9WkaQvHkdzV43VoI7lUHms
   cCQT6KdP2R4vlvfq0v2E1wrcCB4xgDEpGs9IBZYrOAOFzThhcHy5PEUzq
   6XoyHdt6dBY19kbxamkHWKAP/1CmB6on4xYioW66qjBP37oO0Huvhu9uR
   vMM5NVKt1+SNnSXdYFXeiEXeDqwgYyTtNW0TfOAK6NVv4U1JrgOoHt5BX
   w==;
X-CSE-ConnectionGUID: UfjDj2jSRLi4tzh/LOh8rg==
X-CSE-MsgGUID: owe7WVbhSWW5HrfKOklfZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76935788"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76935788"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 05:38:07 -0700
X-CSE-ConnectionGUID: whPPT0bHRAyDGG6oKhg1GQ==
X-CSE-MsgGUID: hQcsOYnCTyW0D/A0/ztw9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253629749"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Apr 2026 05:38:04 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCzVK-000000000Vd-3OzV;
	Wed, 15 Apr 2026 12:38:02 +0000
Date: Wed, 15 Apr 2026 20:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] virtio-mem: support Confidential Computing (CoCo)
 environments
Message-ID: <202604152042.Ddpp3f0z-lkp@intel.com>
References: <20260401-coco-v1-1-b9c3072e2d9c@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260401-coco-v1-1-b9c3072e2d9c@redhat.com>

Hi Marc-André,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on c369299895a591d96745d6492d4888259b004a9e]

url:    https://github.com/intel-lab-lkp/linux/commits/Marc-Andr-Lureau/virtio-mem-support-Confidential-Computing-CoCo-environments/20260414-201359
base:   c369299895a591d96745d6492d4888259b004a9e
patch link:    https://lore.kernel.org/r/20260401-coco-v1-1-b9c3072e2d9c%40redhat.com
patch subject: [PATCH RFC] virtio-mem: support Confidential Computing (CoCo) environments
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260415/202604152042.Ddpp3f0z-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604152042.Ddpp3f0z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604152042.Ddpp3f0z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/virtio/virtio_mem.c:876:9: error: call to undeclared function 'set_memory_encrypted'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     876 |         return set_memory_encrypted((unsigned long)__va(addr), PFN_DOWN(size));
         |                ^
>> drivers/virtio/virtio_mem.c:881:9: error: call to undeclared function 'set_memory_decrypted'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     881 |         return set_memory_decrypted((unsigned long)__va(addr), PFN_DOWN(size));
         |                ^
   2 errors generated.


vim +/set_memory_encrypted +876 drivers/virtio/virtio_mem.c

   868	
   869	/*
   870	 * In CoCo (TDX, SEV-SNP) environments, hotplugged memory must be explicitly
   871	 * accepted before use (private/encrypted), and converted to shared/decrypted
   872	 * before returning to the hypervisor on unplug.
   873	 */
   874	static int virtio_mem_coco_set_encrypted(uint64_t addr, uint64_t size)
   875	{
 > 876		return set_memory_encrypted((unsigned long)__va(addr), PFN_DOWN(size));
   877	}
   878	
   879	static int virtio_mem_coco_set_decrypted(uint64_t addr, uint64_t size)
   880	{
 > 881		return set_memory_decrypted((unsigned long)__va(addr), PFN_DOWN(size));
   882	}
   883	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

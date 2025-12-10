Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2092459DD;
	Wed, 10 Dec 2025 01:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765331917; cv=none; b=f+4nNzNgnxrMi1LuTsKIPHq/qCJKulbGdOkfJW2/FL0iqWuBFYYeMhjGfPUsOdB11yVBA/ByoZOBYwrQ0iwq/66FzxKO2isHfP+KcgS+V3SXeKhPhPxanYH6FrgxDKMMu+DefGRDTRW8kIyMtoEqxjZ+DLxoS9079rF4DGIJNAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765331917; c=relaxed/simple;
	bh=fCX7xujzSpfm9sIREyOPWYr8OrY/3aRU3D1fSBZfF/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNLdM4HR6BGUGfiRMfJTkdtCxGaF2HrqAzJouK1pCpPYi7CIBQiqGSEyvlHa2LqGAzpL/fHmK7ovfxw3vYHZxb4x9kwxlof2kiKykLcYdSlJTlSvicoLgUnz5wTp40XX0S41iEcIg62kQDuPUmgwBkh4cxCcq4uaDXdHN9vgSnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XoIy2SxT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XoIy2SxT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765331916; x=1796867916;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fCX7xujzSpfm9sIREyOPWYr8OrY/3aRU3D1fSBZfF/Y=;
  b=XoIy2SxTOknmGmEuzFRc+5axjl/v8veDA12xAKImuQikmwtUUg+8CsLh
   sYY5yqUyQFX6or7vwYQGJSWuCul+4b4eO6MecNB3yBSPBeBKdkH8c3ND9
   I+1p9++F6hcQPoDMKTBSXbPNZvnV1dhYuU4tgCKYXy0ILaf18Py8U7fia
   pZ6Mpx5ITwNIV+CS85CVBKloQ3GL8lcW8jeIBvBuBF5XbjqKsKuP9avIf
   cDrh3BzD9qDvkrfOp9VQotxApBCGEeIuXCHXXHTudCwlnpM8yX+0VaWCv
   zLCtva0J+3luBVeIHZ8QNGis1UEdo1UjVDAKm9uWARRxwAQtG/32H7suH
   Q==;
X-CSE-ConnectionGUID: QXU1qOYdQYSiFqyWXu+zHw==
X-CSE-MsgGUID: ZAbgOSc3THOAFJppj39D7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="89951052"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="89951052"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 17:58:35 -0800
X-CSE-ConnectionGUID: hZMr/NYOTmGfGFh16KbqWA==
X-CSE-MsgGUID: 4omt8EB4QlyPfxSfYyumXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="196371829"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Dec 2025 17:58:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT9TK-000000002Xx-386X;
	Wed, 10 Dec 2025 01:58:30 +0000
Date: Wed, 10 Dec 2025 09:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6/9] s390/bug: Implement __WARN_printf()
Message-ID: <202512100917.tlpUz0UA-lkp@intel.com>
References: <20251209121701.1856271-7-hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209121701.1856271-7-hca@linux.ibm.com>

All warnings (new ones prefixed by >>):

>> lib/bug.c:187:22: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 0)' attribute to the declaration of '__warn_printf' [-Wmissing-format-attribute]
     176 | static void __warn_printf(const char *fmt, struct pt_regs *regs)
         | __attribute__((format(printf, 1, 0))) 
     177 | {
     178 |         if (!fmt)
     179 |                 return;
     180 | 
     181 | #ifdef HAVE_ARCH_BUG_FORMAT_ARGS
     182 |         if (regs) {
     183 |                 struct arch_va_list _args;
     184 |                 va_list *args = __warn_args(&_args, regs);
     185 | 
     186 |                 if (args) {
     187 |                         vprintk(fmt, *args);
         |                                           ^
   lib/bug.c:176:13: note: '__warn_printf' declared here
     176 | static void __warn_printf(const char *fmt, struct pt_regs *regs)
         |             ^
   1 warning generated.


vim +187 lib/bug.c

7664c5a1da4711b Jeremy Fitzhardinge 2006-12-08  175  
5c47b7f3d1a9d75 Peter Zijlstra      2025-06-07  176  static void __warn_printf(const char *fmt, struct pt_regs *regs)
d292dbb5640c5b7 Peter Zijlstra      2025-06-02  177  {
d292dbb5640c5b7 Peter Zijlstra      2025-06-02  178  	if (!fmt)
d292dbb5640c5b7 Peter Zijlstra      2025-06-02  179  		return;
d292dbb5640c5b7 Peter Zijlstra      2025-06-02  180  
5c47b7f3d1a9d75 Peter Zijlstra      2025-06-07  181  #ifdef HAVE_ARCH_BUG_FORMAT_ARGS
5c47b7f3d1a9d75 Peter Zijlstra      2025-06-07  182  	if (regs) {
5c47b7f3d1a9d75 Peter Zijlstra      2025-06-07  183  		struct arch_va_list _args;
5c47b7f3d1a9d75 Peter Zijlstra      2025-06-07  184  		va_list *args = __warn_args(&_args, regs);
5c47b7f3d1a9d75 Peter Zijlstra      2025-06-07  185  
5c47b7f3d1a9d75 Peter Zijlstra      2025-06-07  186  		if (args) {
5c47b7f3d1a9d75 Peter Zijlstra      2025-06-07 @187  			vprintk(fmt, *args);
5c47b7f3d1a9d75 Peter Zijlstra      2025-06-07  188  			return;
5c47b7f3d1a9d75 Peter Zijlstra      2025-06-07  189  		}
5c47b7f3d1a9d75 Peter Zijlstra      2025-06-07  190  	}
5c47b7f3d1a9d75 Peter Zijlstra      2025-06-07  191  #endif
5c47b7f3d1a9d75 Peter Zijlstra      2025-06-07  192  
d292dbb5640c5b7 Peter Zijlstra      2025-06-02  193  	printk("%s", fmt);
d292dbb5640c5b7 Peter Zijlstra      2025-06-02  194  }
d292dbb5640c5b7 Peter Zijlstra      2025-06-02  195  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

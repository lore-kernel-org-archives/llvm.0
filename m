Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373931;
	b=q/Z9pcGBPebpZVfqhCQjw7k79lNykMn6MGlM2fr8Tpss3Sq234jjaOdMKuucooAQtrxU
	 7UuuL2Sez9dJSbb3AC86KJS/aTkfR7hGAHeoXaDG9iYtP10QKDthLxdIBasuqbpYf7WTj
	 tPlAKzeej+5MQkcJwg9bKjGULbCXl4FiDmI6Ew2vRHLVF7KSmWrGp3bsoypgyhWqR02GK
	 iOi/1UBGN1ry8w7urbgeSnQvtKvqF1C/yMqjFoDDIV1tcxI/dreZQZB1oEUKZnO3S8d6t
	 7UzFHmDnBDZJGLPzmG+bkizDarWqyY6Ue8uLdllVE4YRrDoOZYIOoqbngDCmydZZGfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373931;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=g96ejP5k7aVZP0ZuEY0gLmKmg/HLJgGWzMsks9zcj4g=;
	b=qIG+5ysObRqzN6t/FsLnJ7vmC+KvBka1DgwzL+/KOIWdFAG/eOJbtywsDA7IfMaOvtXT
	 MAfD9/JAtgZ4CKTujDZU21UkbXqSbv8QKyKATetO+6KzpIqBQKn+p0yarJZRETRHjd2hH
	 EQ80M7RbRd5qt+J63gb3uU2VBnjIikyTX39FnQosIofBuVua60IiojTBcDZ6uJgN5jxF4
	 r4ycHWMIXfwYZppTKzFh/FBl1B2c/eBNozDEcZM5EUqlunKrtvt2ERu/CDAzdMZh+yUBG
	 5qsotzYgAVTrjM+Cm6F5xreOMrkR6/Aos55jffYolAxp/m+EXRKZnLNG53zu3H6VjyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nNKYTsqr;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01377606A31D;
	Fri, 30 Oct 2026 15:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01377606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nNKYTsqr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793373930; x=1824909930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sPmRebhi39B1GLuucQ7j9mUgxJfeUGZv2Q2/PJX0BEc=;
  b=nNKYTsqrIgyNn6SV2u4GOujKz+4zcBA/LtTEtCA50wJ0YCdG0UvCJc8f
   m0bvM/nLS3vapcAbe8iaYMV5W2uS5uHq4bcQ4VgFZenTURnu6kA57mFVx
   z1swjWCSJmQEGXg5JduIugezNtqWiRWSHLM35uSKTJ+H7IBc/0BtHbZZt
   jIjkysvcYVgEKKLymVpFJyc4BFsMDhAFBedaDu0QU/jgm5sOzYbDpMQ01
   qgfYOpl3D4lh6LBp0yIoMDmbp36+QGT80upTCXocz6JmYNw1KHQSTivf9
   ttaRlbzhiALduGH2z8Xf4mEUR/Osh16RAEe5Oxjtl+7Agx0NRRFdb7/bJ
   A==;
X-CSE-ConnectionGUID: OIC7Acs0TI6xwPU6rJPIrg==
X-CSE-MsgGUID: vDELS82qTo21il8kX/ED7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2053001"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2053001"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 08:25:29 -0700
X-CSE-ConnectionGUID: MDuDD1URQEWjvNZCZllP+g==
X-CSE-MsgGUID: Q5pIwnPGS1you6hQSWVD1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5475048"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Oct 2026 08:25:26 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMoTq-00000000bu0-2c8j;
	Fri, 30 Oct 2026 15:25:22 +0000
Date: Fri, 30 Oct 2026 23:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: Re: [PATCH v2] drm/msm: preemption aware hangcheck
Message-ID: <202610302317.4PKDvDwV-lkp@intel.com>
References: <20261029-preemption_aware_hangcheck-v2-1-be0056e1f02d@gmail.com>
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
In-Reply-To: <20261029-preemption_aware_hangcheck-v2-1-be0056e1f02d@gmail.com>

Hi Anna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d024361c631b3f020a26c07d683e5103404b0fbf]

url:    https://github.com/intel-lab-lkp/linux/commits/Anna-Maniscalco/drm-msm-preemption-aware-hangcheck/20261029-194101
base:   d024361c631b3f020a26c07d683e5103404b0fbf
patch link:    https://lore.kernel.org/r/20261029-preemption_aware_hangcheck-v2-1-be0056e1f02d%40gmail.com
patch subject: [PATCH v2] drm/msm: preemption aware hangcheck
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261030/202610302317.4PKDvDwV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c2ea4440d4b64c148de4fdfca1fc2c437a0701e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610302317.4PKDvDwV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610302317.4PKDvDwV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_gpu.c:660:6: warning: unused variable 'ret' [-Wunused-variable]
     660 |         int ret;
         |             ^~~
   1 warning generated.
--
>> drivers/gpu/drm/msm/adreno/a6xx_preempt.c:18:21: warning: unused variable 'dev' [-Wunused-variable]
      18 |         struct drm_device *dev = gpu->dev;
         |                            ^~~
>> drivers/gpu/drm/msm/adreno/a6xx_preempt.c:32:6: warning: variable 'last_active_ctxcycles' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      32 |         if (ring)
         |             ^~~~
   drivers/gpu/drm/msm/adreno/a6xx_preempt.c:55:37: note: uninitialized use occurs here
      55 |         postamble[count++] = lower_32_bits(last_active_ctxcycles);
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_preempt.c:32:2: note: remove the 'if' if its condition is always true
      32 |         if (ring)
         |         ^~~~~~~~~
      33 |                 last_active_ctxcycles = rbmemptr(ring, last_active_ctxcycles);
   drivers/gpu/drm/msm/adreno/a6xx_preempt.c:29:32: note: initialize the variable 'last_active_ctxcycles' to silence this warning
      29 |         uint64_t last_active_ctxcycles;
         |                                       ^
         |                                        = 0
   2 warnings generated.


vim +/ret +660 drivers/gpu/drm/msm/msm_gpu.c

   655	
   656	static bool check_ring_timeout(struct msm_ringbuffer *ring, unsigned long timeout)
   657	{
   658		struct msm_gpu *gpu = ring->gpu;
   659		u64 start, end;
 > 660		int ret;
   661	
   662		if (!gpu->funcs->get_ctx_timestamp)
   663			return !made_progress(gpu, ring);
   664	
   665		start = ring->memptrs->last_job_start_ctx;
   666	
   667		if (gpu->funcs->get_ctx_timestamp(ring, &end))
   668			end = ring->memptrs->last_active_ctxcycles;
   669	
   670		if (end >= start)
   671			return (end - start) > timeout;
   672		else
   673			return false;
   674	}
   675	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

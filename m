Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9252ABE5E;
	Tue, 20 May 2025 03:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747710947; cv=none; b=A0xdkBRlwQaK1VoLnnF7NSHZwWMNNyqLjzeMtk85zPQXyH/zDveSmQNzQ77IcorqfSY7qNmqqIPCyikljqfpe4OOg0WXgPzE432WPK705yM3ZdL0mqVwNdORMsfJs6EUGV8csUS7nQqJTcEncdInoQrRG7akXKAu5RL0lO9Vwpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747710947; c=relaxed/simple;
	bh=q51EOnqdejia0UPWxizJsJYHswGCudFJ4V+4N+eDIjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLDFSHogVYZodCmppISBvUJH9V3ESeCoDnxrrk6Fs+HphlKdlVCkyJ1HU3jmYEv0oDl9udozoHI9oXPDzdmODNFXWZqwSD7u9ymGQ7lDI3Zq0sdhBTMxOHy3S1cLv7kDMqQXQeeZSsTNKxeQjwCyhkM6uole6mYLjoeudli4Pms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dgee1RF1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dgee1RF1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747710945; x=1779246945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q51EOnqdejia0UPWxizJsJYHswGCudFJ4V+4N+eDIjg=;
  b=Dgee1RF1yeRFpFRDDFdQLriTESDgU+E/UsRU430HlgbhtddE5b7dkeER
   PXSnY11L/sD6nm9WVdNPqeBYvP0DgqvsRLhk9eVDlsIBiQq5tSOWxl2U7
   l9Xu6lNVJTiB7mOFP8a7gV/eLGcF1gbTouOKCI4lVHP+G5G02RgEVQ/AP
   im/7Ti/dSlAtErPcISV45NYw5wszOn0uqOXQfmfGYdqXWHGDnHlpEATNH
   M0fXj5kYLg89ZO5dbdUpEKNq2gDzuWPaQnXeEjwxMAX0cJTeBJtrq7dlE
   1sq4TSww2BqOuzuCehC9KntkX3mOAG2VRiDqmk/BK0SfUc3AtA3fFJHHd
   g==;
X-CSE-ConnectionGUID: hsuAPy0wQ1uSRkEAhAUpeQ==
X-CSE-MsgGUID: hSk6jo5cTB2yhqHDtj4ciw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60284649"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="60284649"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 20:15:43 -0700
X-CSE-ConnectionGUID: VFi0DubAS5KQfge3jMJGmg==
X-CSE-MsgGUID: 2gSptPPyRNy2GVyFe/Uu3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140064827"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 May 2025 20:15:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHDS7-000M7I-0W;
	Tue, 20 May 2025 03:15:39 +0000
Date: Tue, 20 May 2025 11:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: Gyeyoung Baek <gye976@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 7/9] iio: trigger: Add new API
 iio_trigger_attach_timestamp()
Message-ID: <202505201045.dS4OfoSM-lkp@intel.com>
References: <20250519-timestamp-v1-7-fcb4f6c2721c@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519-timestamp-v1-7-fcb4f6c2721c@gmail.com>

Hi Gyeyoung,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 43a9eee06bf8a8535d8709b29379bec8cafcab56]

url:    https://github.com/intel-lab-lkp/linux/commits/Gyeyoung-Baek/iio-buffer-Fix-checkpatch-pl-warning/20250519-222930
base:   43a9eee06bf8a8535d8709b29379bec8cafcab56
patch link:    https://lore.kernel.org/r/20250519-timestamp-v1-7-fcb4f6c2721c%40gmail.com
patch subject: [PATCH RFC 7/9] iio: trigger: Add new API iio_trigger_attach_timestamp()
config: s390-randconfig-001-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201045.dS4OfoSM-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201045.dS4OfoSM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201045.dS4OfoSM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/industrialio-trigger.c:305:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     305 |         int ret;
         |             ^
   1 warning generated.


vim +/ret +305 drivers/iio/industrialio-trigger.c

3138e8998dbd8f Gyeyoung Baek 2025-05-19  299  
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  300  static int iio_poll_func_register(struct iio_poll_func *pf,
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  301  				  struct iio_trigger *trig)
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  302  {
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  303  	irq_handler_t tophalf = NULL;
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  304  	irq_handler_t bottomhalf = pf->thread;
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19 @305  	int ret;
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  306  
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  307  	/*
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  308  	 * The consumer does not need timestamp.
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  309  	 * Just request raw irq handler.
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  310  	 */
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  311  	if (!pf->timestamp_enabled)
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  312  		goto out_request_irq;
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  313  
3138e8998dbd8f Gyeyoung Baek 2025-05-19  314  	/*
3138e8998dbd8f Gyeyoung Baek 2025-05-19  315  	 * The trigger supports grabbing timestamp.
3138e8998dbd8f Gyeyoung Baek 2025-05-19  316  	 * Just request raw irq handler.
3138e8998dbd8f Gyeyoung Baek 2025-05-19  317  	 */
3138e8998dbd8f Gyeyoung Baek 2025-05-19  318  	if (trig->early_timestamp) {
3138e8998dbd8f Gyeyoung Baek 2025-05-19  319  		ret = iio_trigger_attach_timestamp(trig, pf);
3138e8998dbd8f Gyeyoung Baek 2025-05-19  320  		pf->timestamp_type = IIO_TIMESTAMP_TYPE_TRIGGER;
3138e8998dbd8f Gyeyoung Baek 2025-05-19  321  		goto out_request_irq;
3138e8998dbd8f Gyeyoung Baek 2025-05-19  322  	}
3138e8998dbd8f Gyeyoung Baek 2025-05-19  323  
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  324  	if (trig->trig_type & IIO_TRIG_TYPE_POLL_NESTED) {
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  325  		bottomhalf = iio_pollfunc_bottom_half_wrapper;
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  326  		pf->timestamp_type = IIO_TIMESTAMP_TYPE_CONSUMER_BOTTOM_HALF;
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  327  	} else if (trig->trig_type & IIO_TRIG_TYPE_POLL) {
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  328  		tophalf = iio_pollfunc_top_half_wrapper;
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  329  		pf->timestamp_type = IIO_TIMESTAMP_TYPE_CONSUMER_TOP_HALF;
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  330  	} else {
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  331  		pr_err("Trigger does not set valid trig_type.");
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  332  		return -EINVAL;
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  333  	}
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  334  
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  335  out_request_irq:
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  336  	return request_threaded_irq(pf->irq, tophalf, bottomhalf,
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  337  				    pf->type, pf->name, pf);
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  338  }
b14e7f938a5fa7 Gyeyoung Baek 2025-05-19  339  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

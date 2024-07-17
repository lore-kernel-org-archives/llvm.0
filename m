Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D2417E8FF;
	Wed, 17 Jul 2024 11:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721216631; cv=none; b=KjV9hyBWjPum/AsFypiZvfkycok0l6UX6llJFHK9QuCL08nTWM5l4uoOT2fMD/b3y6zAYf+KvIUhdStjEG3nGlft5ZOviOdIPTGPoah9wuEclnzzc0hFkFEIkpCicZB1Sy3ypVmN7giAccNyXW6QEP0vV1IrpfyYPOlZc4FZI70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721216631; c=relaxed/simple;
	bh=4pGBLaVUdxkJUjKPJVohtmmrqGQumPWgEp0RcGinKkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2myj8x9uvAI5fBWa+mBRDvts4JxZEkGogjyHyqjeEHl+HwCzdccHHjf1Xx7mh4KXgA9+H5krhKUJE+CTUzrAnsAwWSugaMo+l2I7SexjBXJ5zx4vI/5niffz45aTmhnH8sKyS0Y0KlKmm7eKkEcly3FfOKpsCegO3KZpySjweU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hyo6bFlp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hyo6bFlp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721216630; x=1752752630;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4pGBLaVUdxkJUjKPJVohtmmrqGQumPWgEp0RcGinKkM=;
  b=Hyo6bFlpbe2Ldha/OfOKJxwkcls5eKFcvU0nNz7uExvfCIh0LEcgBoAr
   Y//8yITZFwbiC2+H5umA/QXqByKgJH5J7LoeWrGp+1vL6L258QeWnLedT
   98WP0fzkJPdoE1vHDeqPUpddjR1AoEhx1eMCIe/5Hi31Y+DTmVDxrwmXf
   rQmWru9h5+SfWbJmyRUnznY+rn8m80+or7ZYOuxZ11B77pAF6Z4W/rPpf
   tSnLWwi7xf4dXSJ75pvGkLi5mITgKAZ5GFdkwRw3e4+EtkO1gyeuftDHu
   On9Y0D4ABvw5eyQmde3X39w9Eg3J6Q0v0iAPKFkpTG2rupQd8EaijW5TV
   A==;
X-CSE-ConnectionGUID: axkd0zaNScuCy7d6B2objw==
X-CSE-MsgGUID: R3JbxtKrTcaomCKhP/ngLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="22526887"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="22526887"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 04:43:41 -0700
X-CSE-ConnectionGUID: Xd7Mz7UaR6C/EPOp0OUsMw==
X-CSE-MsgGUID: 5ydpkAkZSpCCHXd8SpIcAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="50157202"
Received: from sbutnari-mobl1.ti.intel.com (HELO [10.245.246.16]) ([10.245.246.16])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 04:43:38 -0700
Message-ID: <05954a59-2bef-4262-bd91-cfe21d2381f2@linux.intel.com>
Date: Wed, 17 Jul 2024 13:43:35 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ld.lld: error: undefined symbol: iosf_mbi_available
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
References: <202407160704.zpdhJ8da-lkp@intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <202407160704.zpdhJ8da-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/16/24 01:07, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3e7819886281e077e82006fe4804b0d6b0f5643b
> commit: 8d4ba1be3d2257606e04aff412829d8972670750 ASoC: SOF: pci: split PCI into different drivers
> date:   3 years, 4 months ago

This doesn't seem to be a problem on the latest code? was it intentional
to report a problem on such an old commit?

> config: i386-buildonly-randconfig-004-20240716 (https://download.01.org/0day-ci/archive/20240716/202407160704.zpdhJ8da-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407160704.zpdhJ8da-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407160704.zpdhJ8da-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> ld.lld: error: undefined symbol: iosf_mbi_available
>    >>> referenced by byt.c
>    >>>               soc/sof/intel/byt.o:(byt_machine_select) in archive sound/built-in.a
> --
>>> ld.lld: error: undefined symbol: iosf_mbi_read
>    >>> referenced by byt.c
>    >>>               soc/sof/intel/byt.o:(byt_machine_select) in archive sound/built-in.a
> 

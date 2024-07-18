Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7192A3BB30;
	Thu, 18 Jul 2024 09:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721293963; cv=none; b=H4rlWBEjNv/NRHQF8Z5+fYX34O5y3H3TQ9lm5W96yrqVUpK7MrfyR0GG6YLUJdR+91wGVdPrx0ayr6RxNb543jybPYK1iPfSFqrZr3FBE75JaNyRR+jj0rNzsaCuOHgVX9HQT0vhEaMQWowNmbNV9X7iD+RB7voq1+T8ylY/SFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721293963; c=relaxed/simple;
	bh=QYe0N5asl+jIDbTVeVE7d9My/QO1y/ezNH3N+O5/sw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRkQM+RU8TfwCRIzPdzu26TurdK48Sns3wDMbXkuG2v7EpY3hAlXfZEr263RveZXOpJySHiJWeXwe+m+90Gc5zR0+g+InjIJDKi92hXLl72bKNoxVjQJTQJjEUI5bIR8/k4G2DGiwvnbcThOD7MnmwWBuuqJcrFRxnvoiFzL9Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cnFHGrNp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnFHGrNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721293963; x=1752829963;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QYe0N5asl+jIDbTVeVE7d9My/QO1y/ezNH3N+O5/sw4=;
  b=cnFHGrNpXZFO/SY6KIUD8dXJvM4SOsuYc3WdT/DixghrYQBQU3HGk0FY
   2dR1VBwwNoAQnN5h5RjjJcdpsqGlQmPqoW3UdDjAmNr6ZAXpuCZ9aZ711
   fQru3ktSDTCQazI9nQzw/dfIp3zf6sOcwrQYv0uj9Ib/J4/j+qDcaCRK9
   P0fxcoS78CFOEICuRaQthEcTYfqtvb46Sns4n2p19uafb5R919ggfAe2r
   j6kd8Ok0szibdcqo5btjolCcyHx/irQy3R0Ue1Pqo9S8xPBXeZXvK8nkg
   eYf5pgewyws+B4190MNWCBDcemvKF/eE0xZjYjjeANVnk9C9zJ9MDIqwI
   g==;
X-CSE-ConnectionGUID: 9bmQd92GRO6NmDDdbDc4KA==
X-CSE-MsgGUID: G4CKY4dxRFi0kc5zkH3kYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18800802"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="18800802"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 02:12:30 -0700
X-CSE-ConnectionGUID: ceCJIchsQI+TWOPMFFF9/g==
X-CSE-MsgGUID: 2Dmhh3EmQWaE2ilNHYqILA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="50747716"
Received: from sbutnari-mobl1.ti.intel.com (HELO [10.245.246.71]) ([10.245.246.71])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 02:12:27 -0700
Message-ID: <9a0eba2e-9933-43bb-ab3b-0480bf1d34a4@linux.intel.com>
Date: Thu, 18 Jul 2024 11:12:24 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ld.lld: error: undefined symbol: iosf_mbi_available
To: Takashi Iwai <tiwai@suse.de>
Cc: Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
References: <202407160704.zpdhJ8da-lkp@intel.com>
 <05954a59-2bef-4262-bd91-cfe21d2381f2@linux.intel.com>
 <20240717202806.GA728411@thelio-3990X> <87wmljw485.wl-tiwai@suse.de>
 <d121ec31-0861-4324-8f53-6e06eaf60233@linux.intel.com>
 <87le1zvzw9.wl-tiwai@suse.de>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87le1zvzw9.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



>>> --- a/sound/soc/sof/intel/Kconfig
>>> +++ b/sound/soc/sof/intel/Kconfig
>>> @@ -19,6 +19,7 @@ config SND_SOC_SOF_INTEL_ATOM_HIFI_EP
>>>  	tristate
>>>  	select SND_SOC_SOF_INTEL_COMMON
>>>  	select SND_SOC_SOF_INTEL_HIFI_EP_IPC
>>> +	select IOSF_MBI if X86 && PCI
>>>  	help
>>>  	  This option is not user-selectable but automagically handled by
>>>  	  'select' statements at a higher level.
>>> @@ -44,7 +45,6 @@ config SND_SOC_SOF_BAYTRAIL
>>>  	select SND_SOC_SOF_INTEL_COMMON
>>>  	select SND_SOC_SOF_INTEL_ATOM_HIFI_EP
>>>  	select SND_SOC_SOF_ACPI_DEV
>>> -	select IOSF_MBI if X86 && PCI
>>>  	help
>>>  	  This adds support for Sound Open Firmware for Intel(R) platforms
>>>  	  using the Baytrail, Braswell or Cherrytrail processors.
>>
>> I don't think it's the 'right' fix Takashi.
>>
>> The problem is that we end-up using the iosf_mbi_read() routine by
>> including the soc-intel-quirks.h header file blindly for all X66
>> platforms - even when Baytrail is not used.
>>
>> Adding IOSF support for Tangiger doesn't seem right to me, it's not a
>> real dependency.
>>
>> We can be more restrictive and only use the helper for Baytrail, and use
>> a fallback if Baytrail is not used.
>>
>> diff --git a/sound/soc/intel/common/soc-intel-quirks.h
>> b/sound/soc/intel/common/soc-intel-quirks.h
>> index de4e550c5b34..ae67853f7e2e 100644
>> --- a/sound/soc/intel/common/soc-intel-quirks.h
>> +++ b/sound/soc/intel/common/soc-intel-quirks.h
>> @@ -11,7 +11,9 @@
>>
>>  #include <linux/platform_data/x86/soc.h>
>>
>> -#if IS_ENABLED(CONFIG_X86)
>> +#if IS_ENABLED(CONFIG_X86) && \
>> +       (IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL) || \
>> +        IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI))
>>
>>  #include <linux/dmi.h>
>>  #include <asm/iosf_mbi.h>
>>
>> also at https://github.com/thesofproject/linux/pull/5114
> 
> I'm afraid it's not enough, either.  It's included in
> sound/soc/sof/intel/atom.c, and this one can be built-in by selected
> from others while CONFIG_SND_SOC_SOF_BAYTRAIL=m.  And, the reverse
> selection is done from CONFIG_SND_SOC_SOF_BAYTRAIL -- so
> CONFIG_IOSF_MBI can be m as well, and this can lead to the unresolved
> symbol from the built-in atom.c.

Fair point, I was only looking at the reported failure where Baytrail
was completely disabled.

I am not sure though if it makes sense to split hair in N dimensions.
Building Merrifield as y and Baytrail as m is a corner case that
shouldn't exist at all. And it's only an academic compilation issue, in
practice using 'y' would fail at run-time due to the usual firmware load
dependencies...

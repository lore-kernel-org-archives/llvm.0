Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056C257C8D;
	Fri, 19 Jul 2024 06:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721371356; cv=none; b=FujI4cdY509q/Lk762WnyBpXSOFdgVo3zxrK+gU1tZ4bM5TI3XQs8j9aDHaNgGV/C4E5qakR4Bh3Acodf13NigxSmYVIlI42qQ5DajtLR2weOx2gotpzr157eo8KOLhvWN//dM0prJMp9VjHnnLY3AhBYnKWKLNO7vBTBZH++B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721371356; c=relaxed/simple;
	bh=lgmNqknytxacE99RbI3TXjlkwFUbqm0k9pkY8THZR0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgZp0ZeS46+02C9wvgaFxSDD7Ab0eoYBw9oWg9k6BbQU/kci5i/OhbtklQZhLBZ87lTMHllvB1av4ihk1bRf9YUtGzFQ8cTELv4/uaF5gbclI2BgfmW41bP9ba4VUBpGf+pO7L8q9igad1I8zkIyIJ2aTVELyRZ55qAkkOOXPjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2lAyzv4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2lAyzv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721371354; x=1752907354;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lgmNqknytxacE99RbI3TXjlkwFUbqm0k9pkY8THZR0s=;
  b=J2lAyzv4l9gskOi/O5Xz2lgjGE1yQGWBe2yXQH7N4y3G2QHU/0mYXDX7
   RMHxyWnjyDHwjmePkqkQMqsclyVME1d2hlk/SixS5PbH134FslDj0i7DD
   75O9s0kzxpZZ8EwopW/rVUiKjEP8LntZrCD6VCnWDYbVx8hSUYnlOCwgA
   7Tw6PgQPJya4HR+2LaiwoiNWJ9TgYLdjuEU877UsyCxI42jHkP05uJ4xK
   L2OJTCzFYRm8oqIpPMQ88X0DHYLbKUDU634oAd447P/RHG16Y3S8nomE1
   vEgORWS7bAfwK0L5mdp4SLZcIXn0r8soprW5FswUnhp+fNDGrrtwum8tv
   A==;
X-CSE-ConnectionGUID: r6nmk3xPTh2OQegBkDasMg==
X-CSE-MsgGUID: FPuae8utQI+/BQ1v2uIAwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19154312"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="19154312"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 23:42:34 -0700
X-CSE-ConnectionGUID: RakwmyYeTsamqguiG8vGwA==
X-CSE-MsgGUID: 9rz20AMaTL6vR1VJZ3EzcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="82056579"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.119]) ([10.245.246.119])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 23:42:31 -0700
Message-ID: <d074edda-79c9-44e9-bbd9-86dcb7ffe9ae@linux.intel.com>
Date: Fri, 19 Jul 2024 08:42:28 +0200
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
 <9a0eba2e-9933-43bb-ab3b-0480bf1d34a4@linux.intel.com>
 <87frs6vj4m.wl-tiwai@suse.de>
 <69dfb1e2-eac6-4cd4-a9d3-caaa7f36f9b9@linux.intel.com>
 <878qxyvhit.wl-tiwai@suse.de>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <878qxyvhit.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/18/24 17:36, Takashi Iwai wrote:
> On Thu, 18 Jul 2024 17:16:54 +0200,
> Pierre-Louis Bossart wrote:
>>
>>
>>>>>> diff --git a/sound/soc/intel/common/soc-intel-quirks.h
>>>>>> b/sound/soc/intel/common/soc-intel-quirks.h
>>>>>> index de4e550c5b34..ae67853f7e2e 100644
>>>>>> --- a/sound/soc/intel/common/soc-intel-quirks.h
>>>>>> +++ b/sound/soc/intel/common/soc-intel-quirks.h
>>>>>> @@ -11,7 +11,9 @@
>>>>>>
>>>>>>  #include <linux/platform_data/x86/soc.h>
>>>>>>
>>>>>> -#if IS_ENABLED(CONFIG_X86)
>>>>>> +#if IS_ENABLED(CONFIG_X86) && \
>>>>>> +       (IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL) || \
>>>>>> +        IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI))
>>>>>>
>>>>>>  #include <linux/dmi.h>
>>>>>>  #include <asm/iosf_mbi.h>
>>>>>>
>>>>>> also at https://github.com/thesofproject/linux/pull/5114
>>>>>
>>>>> I'm afraid it's not enough, either.  It's included in
>>>>> sound/soc/sof/intel/atom.c, and this one can be built-in by selected
>>>>> from others while CONFIG_SND_SOC_SOF_BAYTRAIL=m.  And, the reverse
>>>>> selection is done from CONFIG_SND_SOC_SOF_BAYTRAIL -- so
>>>>> CONFIG_IOSF_MBI can be m as well, and this can lead to the unresolved
>>>>> symbol from the built-in atom.c.
>>>>
>>>> Fair point, I was only looking at the reported failure where Baytrail
>>>> was completely disabled.
>>>>
>>>> I am not sure though if it makes sense to split hair in N dimensions.
>>>> Building Merrifield as y and Baytrail as m is a corner case that
>>>> shouldn't exist at all. And it's only an academic compilation issue, in
>>>> practice using 'y' would fail at run-time due to the usual firmware load
>>>> dependencies...
>>>
>>> Surely this kind of bug won't hit anyone in practical use, but it's
>>> only about the randconfig failures.  The original report is in the
>>> same category, after all.
>>>
>>> Maybe another (rather easier) workaround would be to use
>>> IS_REACHABLE(), something like below.  This should fix the original
>>> issue and the potential mess-up of kconfig dependencies.
>>
>> The simplest solution works for me :-)
>>
>> Do you want me to send a patch with your Suggested-by: tag or do it
>> yourself?
> 
> If you can send from your side, it'd be more appreciated ;)

will do, no worries.

Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5D128FFC8
	for <llvm@lists.linux.dev>; Thu, 22 May 2025 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926702; cv=none; b=RRswyv+83ySZ+idqnn8KfTVN/q9Wzd8O6nKe66hTLk/HxfP41aG4T9TG7Gwi7X8OJ9ZMawPSqC36IBqj4vfzKNesWCzlvciX5mE0fWSxz/TxLk2rF7LkI7yKhr/s08InVQCRTeC+sdEixPe+oBXEwu+RtxcYPfKgOj4w3pzPFfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926702; c=relaxed/simple;
	bh=lkhYoWliZo0qBG7HniWZomlKD5IPdKFN2EYTk1V74Qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pgsL1HaAVxgMtcpMWqAeWjuN1ZrN/mdi+xuGTbyTQB/GSUBLuQfgCfxz0ekENg6yVgXQd0GYNHd2rn4q4JzuqFTiYulHGbWfhbStrJeTQJCzFYdzI3RRTYrSxnCfXvq03mljmwEG3iZejhPCkkf/y3epDfgCyoXUL8Mvms/pKH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PrK1MBL1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PrK1MBL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747926700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yWmS2pGh+G6CpF0+2pE42XEqkrsgbtOMzRTxNibzaBo=;
	b=PrK1MBL1qq81qX5HXRDRp2HZaCHVFv01KXXWdKH6r8IQ6aNRNiqZYvxS9UMnWCuRm58RMz
	RB1ZV1D0yTPSasYY2gl3vV+kfU1EeMWe5suA4VoGopfUufkaIAStAcn3A6gblQBRKndFvr
	jWmVCfPJgVpw/YyaUHjW6wbTCQGqMJI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-E0s1MTS-PjmVu17RHTgCgg-1; Thu, 22 May 2025 11:11:38 -0400
X-MC-Unique: E0s1MTS-PjmVu17RHTgCgg-1
X-Mimecast-MFC-AGG-ID: E0s1MTS-PjmVu17RHTgCgg_1747926698
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ad5271a051eso707300766b.1
        for <llvm@lists.linux.dev>; Thu, 22 May 2025 08:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926697; x=1748531497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yWmS2pGh+G6CpF0+2pE42XEqkrsgbtOMzRTxNibzaBo=;
        b=j85C+e7oQVen/hIZEjtPuEQduCiBc+rSdCU741latmlW9LE37HrN1mZhaOH6rIip/U
         M05hQsGpsYe1DYqQ4d1f5cPTVcU5oAu3DceJob9VgROfSqfIivUg12Hd5YtfKb6JDHuw
         mXl3Q2/BfXEWVr1cT6/YOdr/at3tc+xhRWLz9sDpGx3Mekzxl5FZVqbn7PAp7Mi04rM5
         dOf33D2Ps3Y/hphwsfmFSk2+k4PZLf1x44a85hKyonX1N/mNNAQv62kA/hO1j0HFRMnz
         PguroKXTCu0Is+mdb5YCkEv5ViJkhXnxqsZP+CVVLqSu5rFsf+jOesxrSh4w11oTsTlL
         QMDg==
X-Forwarded-Encrypted: i=1; AJvYcCVN9Q0tKdERguXwr++GAFT7fFCxKc8mQhRWRzPKxbjg46t60s8qSJb6q14ykj/nRAjPJ0OP@lists.linux.dev
X-Gm-Message-State: AOJu0YyJzr+eQUks4g0KwWVWYWvAYu1epyufDRiNSCZMQrdnkANWGDs5
	/1Vj5Aazr9TCuDZP4IorgepSnwuochfLhju7l/cZsZnPt9vEcd5ngQtyTxNPUFvgGaMHvrlYq55
	z9M+U/Ak/quxPWT2XP1+XHwm+EsHsTF+YfYGdgELS7LRa6mNbCqCoQ3s=
X-Gm-Gg: ASbGnctb/q5e2e6AGU7AYGPtLWLM64AufA2VeZ8ACZUkO1I5+xGEaBfQ0uK8Fq60Gcj
	W+CeW6W6ewHkXqWyMR49Pzm6Lo60ybRN54UkwoB75HgMdxS82ioo7vG7cLGiB+WGEJGxzLmoKHy
	jXgj+rDxeJWiKNs39qS0AwGJQxt5mVys1ZxgADjcl/oFUXf0dL+gGu7UiavzLD+uiWTO75HEPgW
	zfZmi2AIIeYuIer4qHUd9OH123FQOD8pZ7UCGCQ2YMtyZajfLrgezh/KulUQm4ncgPM37JUnsSI
	/XxOCpNTGdVCGBqw0QN3mb3+GjKAt8B2TpltLKPCQ4VhCVYmNQvDZkHyIYoCc5lPFLHXHLngCK2
	APEyGHRBWRpdJ/mR/KMVuHAVESkDEo7t64M0p/V9dnJO+WcJFqV/SLdCgVwL29A==
X-Received: by 2002:a17:907:1c0b:b0:ad5:76a5:4970 with SMTP id a640c23a62f3a-ad576a54aa2mr1521642866b.36.1747926697263;
        Thu, 22 May 2025 08:11:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIN/KdD7jbH4+1Cd9TQM5JESCRP49ASteAuoMqOKFVgceWZVYB+UR2wUo2cbCQIiFDrq+BPg==
X-Received: by 2002:a17:907:1c0b:b0:ad5:76a5:4970 with SMTP id a640c23a62f3a-ad576a54aa2mr1521636866b.36.1747926696720;
        Thu, 22 May 2025 08:11:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04af13sm1102918766b.18.2025.05.22.08.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:11:35 -0700 (PDT)
Message-ID: <85091184-1d5b-4a11-a940-2d818d46afef@redhat.com>
Date: Thu, 22 May 2025 17:11:35 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next 109/109]
 drivers/platform/x86/ideapad-laptop.c:2044:3: error: field designator
 'charge_types' does not refer to any field in type 'const struct
 power_supply_ext'
To: Sebastian Reichel <sre@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
 Jelle van der Waa <jvanderwaa@redhat.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Armin Wolf <W_Armin@gmx.de>
References: <202505221051.khDhUKJ0-lkp@intel.com>
 <f981b9ac-41cc-489a-9f37-c9e87e748c99@redhat.com>
 <ba4bcvf3tjqunxncrqeire4j257px4plbk5eew7sfbmycscbys@xymzswpfmadw>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ba4bcvf3tjqunxncrqeire4j257px4plbk5eew7sfbmycscbys@xymzswpfmadw>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KSl3YOmt95RH9TwyQv6915p3GgocN9Da8Cb4Z3dY4cs_1747926698
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sebastian,

On 22-May-25 3:52 PM, Sebastian Reichel wrote:
> Hi,
> 
> On Thu, May 22, 2025 at 11:36:47AM +0200, Hans de Goede wrote:
>> On 22-May-25 4:39 AM, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
>>> head:   b2012b38080e2f92d43eca59e8249c174a27527c
>>> commit: b2012b38080e2f92d43eca59e8249c174a27527c [109/109] platform/x86: ideapad: Expose charge_types
>>> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250522/202505221051.khDhUKJ0-lkp@intel.com/config)
>>> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
>>> rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221051.khDhUKJ0-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202505221051.khDhUKJ0-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>>> drivers/platform/x86/ideapad-laptop.c:2044:3: error: field designator 'charge_types' does not refer to any field in type 'const struct power_supply_ext'
>>>     2044 |         .charge_types           = (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
>>>          |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>     2045 |                                    BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
>>>          |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>    1 error generated.
>>>
>>>
>>> vim +2044 drivers/platform/x86/ideapad-laptop.c
>>
>> Hmm, this patch depends on:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git/commit/?h=for-next&id=c1f7375a246e5f810191a6c3031d2fa2b80e9f5e
> 
> I should have merged that through an immutable branch :(
> 
>> I guess that that patch is not in review-ilpo-next,
>> maybe Sebastian can take this patch instead of taking
>> it through pdx86-next ?  Or it can be merged after
>> 6.16-rc1?
> 
> I will be on trekking trip for 3 weeks starting on Monday (more or
> less directly after sending my 6.16 PR), so I don't want to take any
> late patches as I cannot handle potential problems.

No worries, I guess we can just merge the patch after 6.16-rc1 then.

Enjoy your trekking trip.

Regards,

Hans



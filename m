Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C396F20E1
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 09:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652349184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+3Nztyld9eDHPSeSn0M3tTjhNNbITpLXi7y864KZCxM=;
	b=IoZihJj35FeI1f2rcW0ru2EvGnQSifv/FpDnGpOjUX9lFdYrnjalk2MVLkHUaY4cS6qkqU
	PYaXo8GPZw0Kmc6l7u0UwD3MeY7HlKjbtJzFdQj2HJQD5WJK4MtRkshddWH13/snF2YV0g
	7/jotkPLV/0LJxLRkwDu7e2ioiI60ho=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-w1EMxJ4YNombFxWCC4XayQ-1; Thu, 12 May 2022 05:53:03 -0400
X-MC-Unique: w1EMxJ4YNombFxWCC4XayQ-1
Received: by mail-ej1-f70.google.com with SMTP id hr42-20020a1709073faa00b006f4dc7f0be1so2562426ejc.22
        for <llvm@lists.linux.dev>; Thu, 12 May 2022 02:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+3Nztyld9eDHPSeSn0M3tTjhNNbITpLXi7y864KZCxM=;
        b=GFQIHPHC7rxB84HeOCGQwkhGi2a0Hi/kH3QYUPxmyjvE2AS5uPR4Ba7ojd9xaxXlNt
         TRmQubGaR2KmaCrvcewYzClnuPXOqeVFd6L82cBNruar1scAfuMLjIvzfSDKM/i3mk6k
         bB/BtLeEfyJ0qhcn0LBA1OA3aqhsH8b+iJS/Nwfl/wCHuwu4GQamhnl8WLNFbOMeUSBX
         e0ofDXW8thZy7iLuJlIeR+snJaTl+GmGdyqiF1eCVz6jCQNsWb9dJ/VH3Ldq9A/2AKTj
         kBnoW8Rn1taZOYMtimtbSK89w0HFYP5AISL8dVNbxA0kcgzdx6opWgnT8OUnYtrLNiml
         kdpg==
X-Gm-Message-State: AOAM531q1FOKFgmUzhdXlUzqMVaueKtRl+FDPngdhqUs8YcMB/8o91t/
	HsPQahjhhQKAyAdJQmERifIqamxa8c+TvS6X5vVOcT+2EvP/3rvctG8FMuA4RKogSQSTfMyZHiY
	NKxLwr9dQjvM5BQ==
X-Received: by 2002:a05:6402:26d3:b0:427:c57f:5333 with SMTP id x19-20020a05640226d300b00427c57f5333mr33933006edd.61.1652349182125;
        Thu, 12 May 2022 02:53:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxU+yiXPvmNwB30ImWEgmeuYovzHEke4htr7L1cgQhehQ+e+3Q/YNZ1VsfIH2fDixst6DQa1g==
X-Received: by 2002:a05:6402:26d3:b0:427:c57f:5333 with SMTP id x19-20020a05640226d300b00427c57f5333mr33932995edd.61.1652349181926;
        Thu, 12 May 2022 02:53:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id i11-20020a50870b000000b0042617ba63a6sm2532698edb.48.2022.05.12.02.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 02:53:01 -0700 (PDT)
Message-ID: <ce8e9601-f514-5227-f9f7-87594218f95f@redhat.com>
Date: Thu, 12 May 2022 11:53:00 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [pdx86-platform-drivers-x86:review-hans 46/59]
 kernel/stop_machine.c:638:35: error: call to undeclared function
 'cpu_smt_mask'; ISO C99 and later do not support implicit function
 declarations
To: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <lkp@intel.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, Tony Luck <tony.luck@intel.com>
References: <202205120904.Gr9HEY5E-lkp@intel.com> <87zgjnw1bg.ffs@tglx>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87zgjnw1bg.ffs@tglx>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/12/22 11:24, Thomas Gleixner wrote:
> On Thu, May 12 2022 at 09:29, kernel test robot wrote:
>>>> kernel/stop_machine.c:638:35: error: call to undeclared function 'cpu_smt_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>            const struct cpumask *smt_mask = cpu_smt_mask(cpu);
> 
> This warning with W=1 is not the worst of the problems.
> 
> The build will simply fail for CONFIG_SMP=y && CONFIG_SCHED_SMT=n
> because cpu_smt_mask() cannot be resolved.
> 
> The other issue is CONFIG_SMP=n. This will fail to build the IFS driver
> because stop_core_cpuslocked() is not available for SMP=n.

The IFS Kconfig already depends on SMP :

config INTEL_IFS
        tristate "Intel In Field Scan"
        depends on X86 && 64BIT && SMP
        select INTEL_IFS_DEVICE
        help
          Enable ...


So I don't think we need the non-SMP implementation inside
include/linux/stop_machine.h, we only need the #ifdef you
suggest in kernel/stop_machine.c  ?

I think it is best to just squash this into the original
patch, do you agree ?

Regards,

Hans





> Something like the below should work as x86 selects SCHED_SMT when
> SMP=y.
> 
> Thanks,
> 
>         tglx
> ---
> --- a/include/linux/stop_machine.h
> +++ b/include/linux/stop_machine.h
> @@ -156,6 +156,12 @@ static __always_inline int stop_machine_
>  }
>  
>  static __always_inline int
> +stop_core_cpuslocked(unsigned int cpu, cpu_stop_fn_t fn, void *data)
> +{
> +	return stop_machine_cpuslocked(fn, data, NULL);
> +}
> +
> +static __always_inline int
>  stop_machine(cpu_stop_fn_t fn, void *data, const struct cpumask *cpus)
>  {
>  	return stop_machine_cpuslocked(fn, data, cpus);
> --- a/kernel/stop_machine.c
> +++ b/kernel/stop_machine.c
> @@ -631,6 +631,7 @@ int stop_machine(cpu_stop_fn_t fn, void
>  }
>  EXPORT_SYMBOL_GPL(stop_machine);
>  
> +#ifdef CONFIG_SCHED_SMT
>  int stop_core_cpuslocked(unsigned int cpu, cpu_stop_fn_t fn, void *data)
>  {
>  	const struct cpumask *smt_mask = cpu_smt_mask(cpu);
> @@ -649,6 +650,7 @@ int stop_core_cpuslocked(unsigned int cp
>  	return stop_cpus(smt_mask, multi_cpu_stop, &msdata);
>  }
>  EXPORT_SYMBOL_GPL(stop_core_cpuslocked);
> +#endif
>  
>  /**
>   * stop_machine_from_inactive_cpu - stop_machine() from inactive CPU
> 
> 
> 


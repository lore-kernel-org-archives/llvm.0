Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACDC3232
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 13:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652362857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ipLA6o27mMNdolsjzCVS3xN+UeYHZCx4M/jYbye1DhA=;
	b=D+OqiSGXEG3Aptta5eUAr2wSBTKfrAag7vASPNUi1T9eTS20mBsOT+2enWbXIP327iuf77
	t1Ct94T4749EB/SnFy9CPWmxOX6b8PFEYylNgSr47bcy1W/zPVeWWCz/DNEBxatr950OU/
	C9tFI8lZVIoHQDgUZMkxbSpToPlIvRA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-OIbqhiIRPayQoWcBiemHcw-1; Thu, 12 May 2022 09:40:56 -0400
X-MC-Unique: OIbqhiIRPayQoWcBiemHcw-1
Received: by mail-ed1-f69.google.com with SMTP id f1-20020a50fe01000000b004282af18d8bso3153811edt.23
        for <llvm@lists.linux.dev>; Thu, 12 May 2022 06:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ipLA6o27mMNdolsjzCVS3xN+UeYHZCx4M/jYbye1DhA=;
        b=NO/AHJ57VpFdoeXrhImdEdwFJL2j3/hFJ3vzDUDK9e6YhvEuimjw8BxhnehXtEsvp4
         MwLfRPTr68+h1K/Jsi7gLUj9pThHYb2iQ22xVVDI0bWx0jnd1lQbuU3MW6ZiVPm3Yg33
         r3GSg7MKVks7HGcsYbcJzW1SnH7UJS3qoogT1odzw9I116MKe81TGW6Gvq00wk/cnSXg
         shLtG8uJXOgI2o+F243PQSntroC4F00JoYBttv05rhmndzb5lt/j3C1jCRSy1mTMORIx
         IG463m/AJ44Kqwn68LMMzexXsc6DTV6Vz4pdFNUYR+lAn65XbvH1Tw0XKxAZvkavC1l8
         +5Bg==
X-Gm-Message-State: AOAM533v6MZrQn/d3spU0utBA+TX+UZl5xX7JZ6Yz4JVCsxxm+58ptUV
	Dvts+WpboU7xmA8yACpzCemhkzPb16HNHkR5yldJ2wH7sqGSUK7z6BUVldVQs9zNACX4/FB/cx+
	UE2tuqr9vIQX7ZQ==
X-Received: by 2002:a17:907:338b:b0:6f4:6e1:ed66 with SMTP id zj11-20020a170907338b00b006f406e1ed66mr29728890ejb.341.1652362855525;
        Thu, 12 May 2022 06:40:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5M6ExkCTRcAYXS/sA6OpWE5bmPXUtBU66KAIisyMQX2UWEz4HMYllk5SPK1fTGQI/VoBFPA==
X-Received: by 2002:a17:907:338b:b0:6f4:6e1:ed66 with SMTP id zj11-20020a170907338b00b006f406e1ed66mr29728873ejb.341.1652362855323;
        Thu, 12 May 2022 06:40:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id cb13-20020a0564020b6d00b0042617ba639asm2601874edb.36.2022.05.12.06.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 06:40:54 -0700 (PDT)
Message-ID: <70616a41-fe5f-aff8-2aca-4cb827e8553f@redhat.com>
Date: Thu, 12 May 2022 15:40:54 +0200
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
 <ce8e9601-f514-5227-f9f7-87594218f95f@redhat.com> <87r14zvuxp.ffs@tglx>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87r14zvuxp.ffs@tglx>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/12/22 13:42, Thomas Gleixner wrote:
> On Thu, May 12 2022 at 11:53, Hans de Goede wrote:
>> On 5/12/22 11:24, Thomas Gleixner wrote:
>>> On Thu, May 12 2022 at 09:29, kernel test robot wrote:
>>>>>> kernel/stop_machine.c:638:35: error: call to undeclared function 'cpu_smt_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>>>            const struct cpumask *smt_mask = cpu_smt_mask(cpu);
>>>
>>> This warning with W=1 is not the worst of the problems.
>>>
>>> The build will simply fail for CONFIG_SMP=y && CONFIG_SCHED_SMT=n
>>> because cpu_smt_mask() cannot be resolved.
>>>
>>> The other issue is CONFIG_SMP=n. This will fail to build the IFS driver
>>> because stop_core_cpuslocked() is not available for SMP=n.
>>
>> The IFS Kconfig already depends on SMP :
>>
>> config INTEL_IFS
>>         tristate "Intel In Field Scan"
>>         depends on X86 && 64BIT && SMP
>>         select INTEL_IFS_DEVICE
>>         help
>>           Enable ...
>>
>>
>> So I don't think we need the non-SMP implementation inside
>> include/linux/stop_machine.h, we only need the #ifdef you
>> suggest in kernel/stop_machine.c  ?
> 
> For the case at hand that's sufficient.
> 
>> I think it is best to just squash this into the original
>> patch, do you agree ?
> 
> Yes.

Ok, I've squashed the #ifdef into kernel/stop_machine.c and done
a forced push. Lets hope that the kernel test robot (lkp) does
not find anything else.

Regards,

Hans



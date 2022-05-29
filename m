Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73287A
	for <llvm@lists.linux.dev>; Sun, 29 May 2022 07:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653809649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1FG3p87yRdwMZyqhPwypNiYHtUTF9im9QyhuQTto6bo=;
	b=dTh8qzExk3h8QaHcd9HsXxw7tpmfFM+XnKR/T+HblLLlOsxk5ZTkArvv5fM8FwpoZf8bPk
	RdD4gWHOhs80UflBNBCFSwbLTgpFcN/SyeB6eaWu8XjJCcpqjs4Jo1yJgSbm6bvWG+KCJS
	8jjBDJKsVyYsdGvoIVqwrAcQNZM7f6M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-jmeoSlsrOMeljseF081M5Q-1; Sun, 29 May 2022 03:34:08 -0400
X-MC-Unique: jmeoSlsrOMeljseF081M5Q-1
Received: by mail-wm1-f69.google.com with SMTP id i1-20020a05600c354100b003976fc71579so5054618wmq.8
        for <llvm@lists.linux.dev>; Sun, 29 May 2022 00:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1FG3p87yRdwMZyqhPwypNiYHtUTF9im9QyhuQTto6bo=;
        b=myTg+ppb9G7AbIgBJ0SMy2ns8aYTTPqeW7yFuPO0rSKIPV8RCxfC81Xgh4EREnACSi
         sPRNPpkufbYTi5uCwirGdu16CDU2JQKepFzu5g694saFVYKinSK3u8y3Nz9nWGrLkMH9
         ya2YcZYWNd0rgW/4h2N9xeSUUJHOm66AvYWypUMP/sewn4bnyfi7cumgrNW7e1yGppuL
         3CDNJA9xz6UCojUannpFnOTbPunMjJJRTMU/XpjyDi+azuWcI3rmyb2K5whFZu7jG7V+
         Ze6uOe5OYAr5C4TWmqBRe/TW5HzZ3B6gYTHe5Logxv49BFRFlS5LW1MkMIHUDgh1iUXQ
         tkYQ==
X-Gm-Message-State: AOAM533o+vIxau3a+vVFhTWQIoir1lAFGreAEHRjHF09m7I97bFYNuts
	bF8S3A8cTvsn3s3ujb2SodLeLbT9qKi4KTVXB/KiubpC3juJxkWykbXcsV8G2+OzjYbnrjsenE/
	2mHWv2oTFVRr/nw==
X-Received: by 2002:a1c:cc07:0:b0:397:b2f:ac59 with SMTP id h7-20020a1ccc07000000b003970b2fac59mr13935544wmb.157.1653809646586;
        Sun, 29 May 2022 00:34:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRag373JOG5N4kwlPDXmzRjvYhPV1T9/WUwtpuDCGDUUYfmVVLb162YDQ1ZkVczj0JZTC/BA==
X-Received: by 2002:a1c:cc07:0:b0:397:b2f:ac59 with SMTP id h7-20020a1ccc07000000b003970b2fac59mr13935529wmb.157.1653809646303;
        Sun, 29 May 2022 00:34:06 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c19d000b003973c54bd69sm7274011wmq.1.2022.05.29.00.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 May 2022 00:34:05 -0700 (PDT)
Message-ID: <0a3c11c7-2669-ca85-69d1-3b3faa2f7a3c@redhat.com>
Date: Sun, 29 May 2022 09:34:04 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: drivers/gpu/drm/solomon/ssd130x-spi.c:154:35: warning: unused
 variable 'ssd130x_spi_table'
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <202205290422.eoxGqDMR-lkp@intel.com>
 <607265eb-bfbf-4134-f2fe-d66cacd7bfbb@redhat.com>
 <YpLF9jdqiub98Nl/@dev-arch.thelio-3990X>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YpLF9jdqiub98Nl/@dev-arch.thelio-3990X>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Nathan,

On 5/29/22 03:01, Nathan Chancellor wrote:
> On Sat, May 28, 2022 at 11:23:04PM +0200, Javier Martinez Canillas wrote:
>> Hello,
>>
>> On 5/28/22 22:58, kernel test robot wrote:
>>> Hi Javier,
>>>
>>> FYI, the error/warning still remains.
>>>
>>
>> Yes, but in my opinion is a false positive.
> 
> I don't think it is a false positive for this particular configuration.
> MODULE_DEVICE_TABLE expands to nothing when the file it is included in
> is built into the kernel, as opposed to a module, so the variable truly
> is unused.
>

I know that is not used but my point is that we shouldn't need that table
in the first place. The only reason we add it is to workaround a bug in
the SPI core.
 
> $ curl -LSs https://download.01.org/0day-ci/archive/20220529/202205290422.eoxGqDMR-lkp@intel.com/config | rg CONFIG_DRM_SSD130X_SPI
> CONFIG_DRM_SSD130X_SPI=y
> 
> You'll see the same warning with GCC and a similar configuration:
>

Yes, I'm not saying that the compiler warning is a false positive but
that the reported error for this driver is. Since the correct fix on
a driver that support SPI platform devices would be to use the table
and set it to the struct spi_driver .id field.
 
> drivers/gpu/drm/solomon/ssd130x-spi.c:154:35: error: ‘ssd130x_spi_table’ defined but not used [-Werror=unused-const-variable=]
>   154 | static const struct spi_device_id ssd130x_spi_table[] = {
>       |                                   ^~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> At the end of the day, this warning only shows up under W=1, so take it
> as you will. The kernel test robot is a sign, not a cop :)
>

I guess something that could be done is to guard the definition of the
ssd130x_spi_table with a `if IS_MODULE(CONFIG_DRM_SSD130X_SPI)`, since
if the symbol is 'y' and the driver built-in, then won't be used indeed.
 
> Cheers,
> Nathan
> 
-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


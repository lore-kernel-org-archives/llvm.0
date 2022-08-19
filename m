Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69695CAD
	for <llvm@lists.linux.dev>; Fri, 19 Aug 2022 09:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660900502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=crbiBtjsZtdoFfEb0A4+Z1/J44HIJhRt+0Wri2R5qmE=;
	b=gomIo3ipHW35rqc2/Fv2nLqZSDQyQtHoXFtRclczPg4jxaTQ13yOSlJQ/y+lKhi3XJB9Tz
	FF015HaxHhXoy9gxE4FAni2ZW4oE+cfCe+Y7x+hsnMFSveCitJgvepaJgWdtO/ak7l6da9
	qrS9zCKp5u2K5SdnUr/19+496Ts8DUo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-232-p9DjDt9qPlqoEq888xQOIw-1; Fri, 19 Aug 2022 05:15:01 -0400
X-MC-Unique: p9DjDt9qPlqoEq888xQOIw-1
Received: by mail-ej1-f71.google.com with SMTP id gb41-20020a170907962900b00730961131a7so1302653ejc.1
        for <llvm@lists.linux.dev>; Fri, 19 Aug 2022 02:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=crbiBtjsZtdoFfEb0A4+Z1/J44HIJhRt+0Wri2R5qmE=;
        b=xiXT3DRvNnvOqTy1SZl7m/Cr0VN7mfu/DX0mFh5ShQoGJ8IJWonYVEZokwbU+Y/R/P
         HhHwFOEPWN35wta4Z8S2+FvleH9sYKZZHCz11TQZ1HhlvK+fA/3YSRmF5bAMOD5FdHMa
         ElY0cOHevoST9TGLuUNX6QvccHvHBX+w9FMVPnw6mpS3ZvYVeThq5E2zE5btg3HHEgBo
         KQBid6jx+zCsopB+/I5Dmp6E3UGb0rZO0Wtj3cwYkgfaurBho7NN4x26Nk4G4G93Ro3m
         sapCgvTxwcLa9yKH4BtXmQb10rJoWgLZ/J8DJluE6GPh/i0TigoQ0IvMT0//4Go/Vdf5
         027g==
X-Gm-Message-State: ACgBeo3CcAhujGSn1IkZ/qUcKnvbH/AoVFSR6dFJSP2cgTvRZ05rKyRf
	kasfOuZH3sDpw0LAq2v7kuCXq60BjSo+OI1TJmdJQYbH3I77cRcaCwKCX5XqQ41vLwfo8nrsEIb
	YbiFgJR695lJ+PQ==
X-Received: by 2002:a17:906:e9b:b0:730:a6a1:9fc9 with SMTP id p27-20020a1709060e9b00b00730a6a19fc9mr4300702ejf.601.1660900500368;
        Fri, 19 Aug 2022 02:15:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5lWTrAD7WfZTKhSacmedP1y0YrzdhAvP4gJJfHRYmmAjIO1IFqcCA8uMN3NW8TZMjQumuD7Q==
X-Received: by 2002:a17:906:e9b:b0:730:a6a1:9fc9 with SMTP id p27-20020a1709060e9b00b00730a6a19fc9mr4300691ejf.601.1660900500094;
        Fri, 19 Aug 2022 02:15:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id f13-20020a056402004d00b0043be16f5f4csm2722369edu.52.2022.08.19.02.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 02:14:59 -0700 (PDT)
Message-ID: <4782ff33-e8a2-135c-730e-52255b52d54c@redhat.com>
Date: Fri, 19 Aug 2022 11:14:58 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 03/11] platform/x86/amd/pmf: Add support SPS PMF
 feature
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Nathan Chancellor <nathan@kernel.org>
Cc: markgross@kernel.org, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, llvm@lists.linux.dev
References: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
 <20220802151149.2123699-4-Shyam-sundar.S-k@amd.com>
 <Yv7BmjjLtA3RaKju@thelio-3990X>
 <c515c207-5497-67ba-c0f4-c4d5ae46f755@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c515c207-5497-67ba-c0f4-c4d5ae46f755@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shyam,

On 8/19/22 10:58, Shyam Sundar S K wrote:
> Hi Nathan,
> 
> Thanks for bringing this up.
> 
> On 8/19/2022 4:17 AM, Nathan Chancellor wrote:
>> Hi Shyam,
>>
>> On Tue, Aug 02, 2022 at 08:41:41PM +0530, Shyam Sundar S K wrote:
>>> SPS (a.k.a. Static Power Slider) gives a feel of Windows performance
>>> power slider for the Linux users, where the user selects a certain
>>> mode (like "balanced", "low-power" or "performance") and the thermals
>>> associated with each selected mode gets applied from the silicon
>>> side via the mailboxes defined through PMFW.
>>>
>>> PMF driver hooks to platform_profile by reading the PMF ACPI fn9 to
>>> see if the support is being advertised by ACPI interface.
>>>
>>> If supported, the PMF driver reacts to platform_profile selection choices
>>> made by the user and adjust the system thermal behavior.
>>>
>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>
>> <snip>
>>
>>> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
>>> new file mode 100644
>>> index 000000000000..ef4df3fd774b
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/amd/pmf/sps.c
>>
>> <snip>
>>
>>> +u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
>>> +{
>>> +	u8 mode;
>>> +
>>> +	switch (pmf->current_profile) {
>>> +	case PLATFORM_PROFILE_PERFORMANCE:
>>> +		mode = POWER_MODE_PERFORMANCE;
>>> +		break;
>>> +	case PLATFORM_PROFILE_BALANCED:
>>> +		mode = POWER_MODE_BALANCED_POWER;
>>> +		break;
>>> +	case PLATFORM_PROFILE_LOW_POWER:
>>> +		mode = POWER_MODE_POWER_SAVER;
>>> +		break;
>>> +	default:
>>> +		dev_err(pmf->dev, "Unknown Platform Profile.\n");
>>> +		break;
>>> +	}
>>> +
>>> +	return mode;
>>> +}
>>
>> This patch is now in -next as commit 4c71ae414474
>> ("platform/x86/amd/pmf: Add support SPS PMF feature"), where it causes
>> the following clang warning:
>>
>>   drivers/platform/x86/amd/pmf/sps.c:96:2: error: variable 'mode' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>>           default:
>>           ^~~~~~~
>>   drivers/platform/x86/amd/pmf/sps.c:101:9: note: uninitialized use occurs here
>>           return mode;
>>                  ^~~~
>>   drivers/platform/x86/amd/pmf/sps.c:84:9: note: initialize the variable 'mode' to silence this warning
>>           u8 mode;
>>                  ^
>>                   = '\0'
>>   1 error generated.
>>
>> As far as I can tell, the default case cannot actually happen due to the
>> advertising of choices in amd_pmf_init_sps() and the check against those
>> choices in platform_profile_store() but it would be good to avoid this
>> warning, especially given that it is fatal with CONFIG_WERROR.
>>
>> I do not mind sending a patch for this but I am a little unclear what
>> the best fix would be. Removing the default case would cause -Wswitch
>> warnings because current_profile is an enum (plus it would make finding
>> invalid profiles harder if there was ever a change in the core). Perhaps
>> changing the return type to be an int, returning an error code in the
>> default case, then updating the call sites to check for an error? I am
>> open to other suggestions (or if you want to sent a fix yourself, just
>> consider this a report).
> 
> yes, you are right. We can just change the return an error code like the
> other driver implementing the platform_profile. Like below.

Yes returning  -EOPNOTSUPP is the right thing to do in the
default case.

Can you turn this into a proper patch/commit and submit
it please?

Regards,

Hans


> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
> b/drivers/platform/x86/amd/pmf/pmf.h
> index 7613ed2ef6e3..172610f93bd1 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -303,7 +303,7 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
>  int amd_pmf_get_power_source(void);
> 
>  /* SPS Layer */
> -u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
> +int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
>  void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
>                            struct amd_pmf_static_slider_granular *table);
>  int amd_pmf_init_sps(struct amd_pmf_dev *dev);
> diff --git a/drivers/platform/x86/amd/pmf/sps.c
> b/drivers/platform/x86/amd/pmf/sps.c
> index 8923e29cc6ca..dba7e36962dc 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -79,9 +79,9 @@ static int amd_pmf_profile_get(struct
> platform_profile_handler *pprof,
>         return 0;
>  }
> 
> -u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
> +int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
>  {
> -       u8 mode;
> +       int mode;
> 
>         switch (pmf->current_profile) {
>         case PLATFORM_PROFILE_PERFORMANCE:
> @@ -95,7 +95,7 @@ u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
>                 break;
>         default:
>                 dev_err(pmf->dev, "Unknown Platform Profile.\n");
> -               break;
> +               return -EOPNOTSUPP;
>         }
> 
>         return mode;
> @@ -105,10 +105,13 @@ static int amd_pmf_profile_set(struct
> platform_profile_handler *pprof,
>                                enum platform_profile_option profile)
>  {
>         struct amd_pmf_dev *pmf = container_of(pprof, struct
> amd_pmf_dev, pprof);
> -       u8 mode;
> +       int mode;
> 
>         pmf->current_profile = profile;
>         mode = amd_pmf_get_pprof_modes(pmf);
> +       if (mode < 0)
> +               return mode;
> +
>         amd_pmf_update_slider(pmf, SLIDER_OP_SET, mode, NULL);
>         return 0;
>  }
> 
> 
> Thanks,
> Shyam
> 
>>
>> Cheers,
>> Nathan
>>
> 


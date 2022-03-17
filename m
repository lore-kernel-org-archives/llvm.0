Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EBE2F38
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 10:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647513398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VhGQgg69D/W2UH6So3aOmkQBD1nBD2QYvTDiVp5TQb4=;
	b=HmDigwkLB8zVxL81wlC8ardA1Y+aQzVaMkRu8NDzBigH/x8WCwwVmiQ/uIf4K0S3KOAx0l
	C3bOS7nBheHLQ0TCsKAC9s2GbfNXyqjrDHC976epGToyhAnqkQts3YrirQs7Xw0AZhVPcg
	OQC7/wrdy8AqRJQpHuTVETPBUx1XuqI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-penxXtIWOY-QXl15hJ0PVA-1; Thu, 17 Mar 2022 06:36:36 -0400
X-MC-Unique: penxXtIWOY-QXl15hJ0PVA-1
Received: by mail-ej1-f69.google.com with SMTP id i14-20020a17090639ce00b006dabe6a112fso2663753eje.13
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 03:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VhGQgg69D/W2UH6So3aOmkQBD1nBD2QYvTDiVp5TQb4=;
        b=Rd2UsTkrefFjqCE28zMb6tTq5R/DQeLP3SlU7lQkySEzV2tcAXG3cWlxp4/aExRJPK
         0dREU4Y2dUCjOP8ww66Mdi7aeYat4FDWUz0WFShDAxhmrvcRCY6wOjqf8yZRlC3UNcP/
         17rDE/6KTwzAFO3K9cyLZKYaAuMGt0DRRhg3pEysSrsq2Skap188raRFjd79q+YwdT9Y
         g1ClIkdPAUUT2SjMRoWoyywjbYTymr7y+aKDxCoeQUM0SvTvqYOZ7MVFsGdm2N1U19nQ
         WPwUNwZzarxY45ZSAXZstVpiVnvMs19snvf31O2RU1iBAAPQ4YAuzdbtIySbBBZD22Ct
         uSCg==
X-Gm-Message-State: AOAM533qOBr8lbQWlsPs9gmTt8YI2rzfwdAcmoTPZdHcbl81z4vtMz6M
	aLGpXsec3kOvWV7IKb6KOdlK+yXh4jttp10VjtCYjhmzGYd6YMQuEb9F+5YJZ6W8eXwCDWmvX7E
	PUW4FTeuZgZrR/A==
X-Received: by 2002:a17:907:7ea7:b0:6db:b3c7:95d6 with SMTP id qb39-20020a1709077ea700b006dbb3c795d6mr3684681ejc.480.1647513395739;
        Thu, 17 Mar 2022 03:36:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEoVZh3TzQ4lQTTV6YzBs9xVQBu2woIMRxvvWZk7+gMktZ4kAkGP6OY5baLJUzqEC21QSNcw==
X-Received: by 2002:a17:907:7ea7:b0:6db:b3c7:95d6 with SMTP id qb39-20020a1709077ea700b006dbb3c795d6mr3684657ejc.480.1647513395502;
        Thu, 17 Mar 2022 03:36:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id j11-20020a05640211cb00b00418572a3638sm2541794edw.38.2022.03.17.03.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 03:36:35 -0700 (PDT)
Message-ID: <a3f2a34a-1abf-76d5-967f-b41f4c135951@redhat.com>
Date: Thu, 17 Mar 2022 11:36:34 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: consistently check
 fan_get_status return.
To: trix@redhat.com, hmh@hmh.eng.br, markgross@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com
Cc: ibm-acpi-devel@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20220312145327.1398510-1-trix@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220312145327.1398510-1-trix@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/12/22 15:53, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis returns this false positive
> thinkpad_acpi.c:8926:19: warning: The left operand
>   of '!=' is a garbage value
>   (status != 0) ? "enabled" : "disabled", status);
>    ~~~~~~ ^
> 
> The return of fan_get_status* is checked inconsistenly.
> Sometime ret < 0 is an error, sometimes !ret.
> Both fan_get_status() and fan_get_status_safe() return
> 0 on success and return negative otherwise.  Change
> the checks for error, ret < 0, into checks for
> not success, !ret.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 708743ec9ae79..c568fae56db29 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8285,7 +8285,7 @@ static int fan_set_enable(void)
>  	case TPACPI_FAN_WR_ACPI_FANS:
>  	case TPACPI_FAN_WR_TPEC:
>  		rc = fan_get_status(&s);
> -		if (rc < 0)
> +		if (rc)
>  			break;
>  
>  		/* Don't go out of emergency fan mode */
> @@ -8304,7 +8304,7 @@ static int fan_set_enable(void)
>  
>  	case TPACPI_FAN_WR_ACPI_SFAN:
>  		rc = fan_get_status(&s);
> -		if (rc < 0)
> +		if (rc)
>  			break;
>  
>  		s &= 0x07;
> @@ -8843,7 +8843,7 @@ static void fan_suspend(void)
>  	/* Store fan status in cache */
>  	fan_control_resume_level = 0;
>  	rc = fan_get_status_safe(&fan_control_resume_level);
> -	if (rc < 0)
> +	if (rc)
>  		pr_notice("failed to read fan level for later restore during resume: %d\n",
>  			  rc);
>  
> @@ -8864,7 +8864,7 @@ static void fan_resume(void)
>  
>  	if (!fan_control_allowed ||
>  	    !fan_control_resume_level ||
> -	    (fan_get_status_safe(&current_level) < 0))
> +	    fan_get_status_safe(&current_level))
>  		return;
>  
>  	switch (fan_control_access_mode) {
> @@ -8918,7 +8918,7 @@ static int fan_read(struct seq_file *m)
>  	case TPACPI_FAN_RD_ACPI_GFAN:
>  		/* 570, 600e/x, 770e, 770x */
>  		rc = fan_get_status_safe(&status);
> -		if (rc < 0)
> +		if (rc)
>  			return rc;
>  
>  		seq_printf(m, "status:\t\t%s\n"
> @@ -8929,7 +8929,7 @@ static int fan_read(struct seq_file *m)
>  	case TPACPI_FAN_RD_TPEC:
>  		/* all except 570, 600e/x, 770e, 770x */
>  		rc = fan_get_status_safe(&status);
> -		if (rc < 0)
> +		if (rc)
>  			return rc;
>  
>  		seq_printf(m, "status:\t\t%s\n",


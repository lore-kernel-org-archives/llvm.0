Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6332C80
	for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 15:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634656853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWUsS1V9g+wCEnrKEW2P2nBdry4D/ofDOreqnNn0C2s=;
	b=M15241xOyotig3gvysBeL9ZswF2PcKJHY3LtLsCy2zOSISZbYFrBO+LM/up+/N/jfRWZDT
	mql3DyV7sCpI0UvaYX/OHG4uXFfs6hppQShNgGpK5CiHkVi4rDdvBVkTcKix3T1NGVqf5P
	W2MD7N/mTYhc6I9bH8zEbRClpGHmDEQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-7DTKHhLcNnSfyHVtB3hMFA-1; Tue, 19 Oct 2021 11:20:50 -0400
X-MC-Unique: 7DTKHhLcNnSfyHVtB3hMFA-1
Received: by mail-ed1-f70.google.com with SMTP id c30-20020a50f61e000000b003daf3955d5aso17946338edn.4
        for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 08:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZWUsS1V9g+wCEnrKEW2P2nBdry4D/ofDOreqnNn0C2s=;
        b=nLU7YtZ1YfossCU8VDvLlcHAt57L5dUkpNizO/4aLZ5o2TbiJ2B9Inw7f+TMB6RQJ9
         dN39vaRUTvMD7/X2+oZisIl110yTFjewRaKA9VLVMILkn9+7OlQyUa+q1Zp60AYtbBoV
         pcc8UrwrUIJD1LTCvt7OVWdLm2AWz1d6gdvy01U6qii+NGgRS4B9ap0+TwK6tBovWyoJ
         j1k/A/Ar9EnChCsWAZLBwt0hiPKLzxhxB81dtEG0xWLUicrLQNlEEOviRy4+JNO0aHbH
         1vdA1F+EEcy+030XND+aa2/0mR0rO7XD2YCr7QCDDFe2wJszzcYT2+JWTDTtPffk+m8X
         RaSQ==
X-Gm-Message-State: AOAM531jlexg4S1GQDtpEKUXklpn3gRzruSvN1FIyEXufxuEc9savpEY
	2ukVSHccl7gHo0IwdHSF7XpyfmojBV0eU6gBpzLojw6BP2Hvs2q8ZVLuUCtlBT5b/T//exe0v1e
	B6OxGJWXIir65UA==
X-Received: by 2002:a17:906:6149:: with SMTP id p9mr14323021ejl.362.1634656848836;
        Tue, 19 Oct 2021 08:20:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW6yXFO906BnyicHeJfsJ3U1p1KKs/jg69z8HMFssRbuPqqO7meXlrWwPYJVckb8fdiwjteg==
X-Received: by 2002:a17:906:6149:: with SMTP id p9mr14322995ejl.362.1634656848617;
        Tue, 19 Oct 2021 08:20:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s12sm3985147edj.82.2021.10.19.08.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 08:20:48 -0700 (PDT)
Message-ID: <21ebf31f-2f2a-2f5e-e731-a44ea178a6bd@redhat.com>
Date: Tue, 19 Oct 2021 17:20:47 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix bitwise vs. logical
 warning
To: Nathan Chancellor <nathan@kernel.org>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Mark Gross <markgross@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Tor Vic <torvic9@mailbox.org>
References: <20211018182537.2316800-1-nathan@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211018182537.2316800-1-nathan@kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/18/21 20:25, Nathan Chancellor wrote:
> A new warning in clang points out a use of bitwise OR with boolean
> expressions in this driver:
> 
> drivers/platform/x86/thinkpad_acpi.c:9061:11: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
>         else if ((strlencmp(cmd, "level disengaged") == 0) |
>                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                            ||
> drivers/platform/x86/thinkpad_acpi.c:9061:11: note: cast one or both operands to int to silence this warning
> 1 error generated.
> 
> This should clearly be a logical OR so change it to fix the warning.
> 
> Fixes: fe98a52ce754 ("ACPI: thinkpad-acpi: add sysfs support to fan subdriver")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1476
> Reported-by: Tor Vic <torvic9@mailbox.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

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
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 07b9710d500e..7442c3bb446a 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9058,7 +9058,7 @@ static int fan_write_cmd_level(const char *cmd, int *rc)
>  
>  	if (strlencmp(cmd, "level auto") == 0)
>  		level = TP_EC_FAN_AUTO;
> -	else if ((strlencmp(cmd, "level disengaged") == 0) |
> +	else if ((strlencmp(cmd, "level disengaged") == 0) ||
>  			(strlencmp(cmd, "level full-speed") == 0))
>  		level = TP_EC_FAN_FULLSPEED;
>  	else if (sscanf(cmd, "level %d", &level) != 1)
> 
> base-commit: 85303db36b6e170917a7bc6aae4898c31a5272a0
> 


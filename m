Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAD7107A3
	for <llvm@lists.linux.dev>; Thu,  5 Jan 2023 22:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672956548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=idk7zwMeN8Ms5ELQH7d2B6f/MLuOIPR3AtkkFMxBOP4=;
	b=WxsdcKEzoRuvf4DRT79vN2pF0Mp4E1Y47672tB95E4Dut0Tp9JW4OaXFOKCk3U1T4G2rBb
	MOORUvmk9k35z9vnJTIiUNUlf+7zYNXD/NvUoEJfTmCV1HS+bnsKRgTRexDcRl84IEsWDy
	pOr45HI+F2tP74UjVyKGfwNuKEMOSP0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-631-cDO8UNA0NJK_5v_04UZyZg-1; Thu, 05 Jan 2023 17:09:07 -0500
X-MC-Unique: cDO8UNA0NJK_5v_04UZyZg-1
Received: by mail-qv1-f71.google.com with SMTP id lp10-20020a056214590a00b0053180ee70f1so15325579qvb.13
        for <llvm@lists.linux.dev>; Thu, 05 Jan 2023 14:09:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=idk7zwMeN8Ms5ELQH7d2B6f/MLuOIPR3AtkkFMxBOP4=;
        b=jaM2MwQo6YcCRKeOUzWYl8vPICVL+plWvoSTuySLIOjVWw6xbTU3B9vJWm6tTFP/pW
         K5r1vxeXXik1b4e0jWeiLAfmNhyIRnSAqDemc28Y1nqQj3e4+/51c+MXoyqC8EUjYq5p
         Mnxu9O2rlP7UyjOOUNy+PIcnww0wz/gvBs1YH1Th2vzIkIreMoy238HqyQFJcsYBI5V0
         ot0JPopPAUbig0zf6A3evVSbE1sY0CnngpfB/UKXu0DAhu+izc085lIrwnbnbbYD49Uh
         91VB2Xasuz8OsNmZDEoSuGVVp17HmSFEbwX4FrzW77SZd4QQMTjRT3FeXN+KGusyVA40
         8Pfg==
X-Gm-Message-State: AFqh2krsNKVC7MwaPYv94pcRi84l8tN/onfvdRTgnrU7cD5qlYKZ9320
	PzeeujxPDpH5TXknQRRWaiuB7dS9h1MjrA+VpzNDe0pk3yrlnzLLYqIOgUrjjvSN7akxvBwK47w
	akMcAO0K+BR+ya7dp8+EqtIGnwSQQ0yBlbDraJz2kR798X8JsknfbPJ+1gvT4
X-Received: by 2002:a05:6214:2e81:b0:4b8:8a31:5741 with SMTP id oc1-20020a0562142e8100b004b88a315741mr71801212qvb.15.1672956547110;
        Thu, 05 Jan 2023 14:09:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXughyad3qrXR+35kG38zogh8DNxPC/6FgPkh/1kss3XlBPgAaxGNhEBt42C/e4ZtH94rv6pbA==
X-Received: by 2002:a05:6214:2e81:b0:4b8:8a31:5741 with SMTP id oc1-20020a0562142e8100b004b88a315741mr71801183qvb.15.1672956546809;
        Thu, 05 Jan 2023 14:09:06 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id pj8-20020a05620a1d8800b006cfc7f9eea0sm25787894qkn.122.2023.01.05.14.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 14:09:06 -0800 (PST)
Subject: Re: [PATCH] ASoC: amd: Return ENODEV if acp63 is not found.
To: Nathan Chancellor <nathan@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ndesaulniers@google.com, Vijendar.Mukunda@amd.com, Syed.SabaKareem@amd.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20230105211912.824250-1-trix@redhat.com>
 <Y7dF3VvQs6l7rr3p@dev-arch.thelio-3990X>
From: Tom Rix <trix@redhat.com>
Message-ID: <3921856d-7843-4206-f888-4ac48cdc97e4@redhat.com>
Date: Thu, 5 Jan 2023 14:09:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y7dF3VvQs6l7rr3p@dev-arch.thelio-3990X>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 1/5/23 1:49 PM, Nathan Chancellor wrote:
> Hi Tom,
>
> On Thu, Jan 05, 2023 at 04:19:12PM -0500, Tom Rix wrote:
>> The clang build fails with
>> sound/soc/amd/ps/pci-ps.c:218:2: error: variable 'ret' is used
>>    uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>>          default:
>>          ^~~~~~~
>>
>> When no device is found -ENODEV should be returned.
>> A switch with a single case is overkill, change to if-else.
>>
>> Fixes: 1d325cdaf7a2 ("ASoC: amd: ps: refactor platform device creation logic")
>> Signed-off-by: Tom Rix <trix@redhat.com>
> Thanks for the patch! I sent basically the same thing earlier today
> (sorry for forgetting to Cc you directly) and was told it was not
> correct:
>
> https://lore.kernel.org/6bb126b7-1cb4-0c4c-d357-fadc3ffdd3f9@amd.com/
>
> I am just waiting for some feedback before sending a v2.

Looking closer, the pdev_mask is only set to ACP63_PDM_DEV_MASK so the 
case statement can be folded into the above if-check of pdev_mask.

And the default: dropped,  it looks like dead code.

Please cc me on the v2,

Tom

>
>> ---
>>   sound/soc/amd/ps/pci-ps.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
>> index 401cfd0036be..cba8800ab4ea 100644
>> --- a/sound/soc/amd/ps/pci-ps.c
>> +++ b/sound/soc/amd/ps/pci-ps.c
>> @@ -205,8 +205,7 @@ static int create_acp63_platform_devs(struct pci_dev *pci, struct acp63_dev_data
>>   		memset(&pdevinfo, 0, sizeof(pdevinfo));
>>   	}
>>   
>> -	switch (adata->pdev_mask) {
>> -	case ACP63_PDM_DEV_MASK:
>> +	if (adata->pdev_mask == ACP63_PDM_DEV_MASK) {
>>   		adata->pdm_dev_index  = 0;
>>   		acp63_fill_platform_dev_info(&pdevinfo[0], parent, NULL, "acp_ps_pdm_dma",
>>   					     0, adata->res, 1, NULL, 0);
>> @@ -214,8 +213,8 @@ static int create_acp63_platform_devs(struct pci_dev *pci, struct acp63_dev_data
>>   					     0, NULL, 0, NULL, 0);
>>   		acp63_fill_platform_dev_info(&pdevinfo[2], parent, NULL, "acp_ps_mach",
>>   					     0, NULL, 0, NULL, 0);
>> -		break;
>> -	default:
>> +	} else {
>> +		ret = -ENODEV;
>>   		dev_dbg(&pci->dev, "No PDM devices found\n");
>>   		goto de_init;
>>   	}
>> -- 
>> 2.27.0
>>
>>


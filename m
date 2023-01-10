Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0586017DB
	for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673369320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lJePnZsKXnubDcGA3DYzaayBveLdWQPssGSlTfWc4l8=;
	b=TVodgAXQv+xTQHZdt2rKYeMfVOTOBMl1yTTiaHRGOz6fGYmsBvN0F8bCjlzvrEB4USFwEU
	iCWjVXInJFw+mSOzqBOoaa3uF64nNHPwXuqma9NQHeEXIKXrAEwaUSN2sF5P0RfhGyeX+m
	a0U5pCHXOPwICIhj2DrwEtF3ttPy1hk=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-172NYMdbPR-3ZgCqu1HTlQ-1; Tue, 10 Jan 2023 11:48:39 -0500
X-MC-Unique: 172NYMdbPR-3ZgCqu1HTlQ-1
Received: by mail-pl1-f197.google.com with SMTP id x17-20020a170902ec9100b0019294547b06so8766426plg.12
        for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 08:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJePnZsKXnubDcGA3DYzaayBveLdWQPssGSlTfWc4l8=;
        b=Lq+wqEZRfNPxWpL1nQoF8xvJEYnI5ad2k81z4FiL1bJNjteqhxEmQzXEmQbxBBLiU5
         Rv5NAUbyXr1b/n11MrEwlAEdjp7817rPdod9UPuSNlqZ/IQh9Y2hCubx2d974ij/B9W0
         qd7rYZYn3f5u/J6n3zAJljKZI+ryV06Yf3KGXEG0Cnx3knBSVzVJMeztbr8RCqiHdHls
         OVN7XRT0VCBX9IyMIBoETMNGucB1EbWnGg+IAUVXZdfvLtQ73PdLtwh0Cxs2PZzSkeoo
         o+B+7X5iPsqT85eQob4uqBzkOD9Bymux123T4Afpmjord+KEYW19i2KOEwRy4GYjSsPR
         Xhaw==
X-Gm-Message-State: AFqh2krmyBTtVplt6QkAAILK+FCHzGsNqk/LyQYhDR1V43L9gAqhYLW1
	BNpzF66g/YkGLR+agXzQB9y7Fq+H09lezKsRiINauZcUnWyu+BK5WRUtjinftv7ZUkHKjC8XyR9
	bPKS/nacozC7T5cYQl3YOdBuUcKctEh6zdEMwqm4AnnEANYbdrw07zdQUSi7R
X-Received: by 2002:a17:902:8c90:b0:192:a470:2c0b with SMTP id t16-20020a1709028c9000b00192a4702c0bmr36292915plo.49.1673369318632;
        Tue, 10 Jan 2023 08:48:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuNUHJUABqba3WYraNADndH3NP90X++/rRyazKN7bjjjbrXyT/4JMDE35Fof+hR07vv+79c1g==
X-Received: by 2002:a17:902:8c90:b0:192:a470:2c0b with SMTP id t16-20020a1709028c9000b00192a4702c0bmr36292883plo.49.1673369318177;
        Tue, 10 Jan 2023 08:48:38 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id l7-20020a655607000000b00477bdc1d5d5sm7061400pgs.6.2023.01.10.08.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 08:48:37 -0800 (PST)
Subject: Re: [PATCH] crypto: initialize error
To: Peter Gonda <pgonda@google.com>
Cc: brijesh.singh@amd.com, thomas.lendacky@amd.com, john.allen@amd.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, nathan@kernel.org,
 ndesaulniers@google.com, rientjes@google.com, marcorr@google.com,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20230110161831.2625821-1-trix@redhat.com>
 <CAMkAt6oqBH35=moST5nO_BXwc8k0M4h_8TvT9H6outR9vOw5qg@mail.gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <ecd0c7f2-f82c-845f-b1fe-a7d3bf495bb1@redhat.com>
Date: Tue, 10 Jan 2023 08:48:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAMkAt6oqBH35=moST5nO_BXwc8k0M4h_8TvT9H6outR9vOw5qg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 1/10/23 8:27 AM, Peter Gonda wrote:
> On Tue, Jan 10, 2023 at 9:18 AM Tom Rix <trix@redhat.com> wrote:
>> clang static analysis reports this problem
>> drivers/crypto/ccp/sev-dev.c:1347:3: warning: 3rd function call
>>    argument is an uninitialized value [core.CallAndMessage]
>>      dev_err(sev->dev, "SEV: failed to INIT error %#x, rc %d\n",
>>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> __sev_platform_init_locked() can return without setting the
>> error parameter, causing the dev_err() to report a gargage
> garbage
ok
>
>> value.
>>
>> Fixes: 3d725965f836 ("crypto: ccp - Add SEV_INIT_EX support")
> Should this be: 'Fixes: 200664d5237f ("crypto: ccp: Add Secure
> Encrypted Virtualization (SEV) command support")'
>
> Since in that patch an uninitialized error can be printed?

It was a bit of a toss up on who is at fault. This is fine, i'll change 
this as well.

Thanks

Tom


> +void psp_pci_init(void)
> +{
> +       struct sev_user_data_status *status;
> +       struct sp_device *sp;
> +       int error, rc;
> +
> +       sp = sp_get_psp_master_device();
> +       if (!sp)
> +               return;
> +
> +       psp_master = sp->psp_data;
> +
> +       /* Initialize the platform */
> +       rc = sev_platform_init(&error);
> +       if (rc) {
> +               dev_err(sp->dev, "SEV: failed to INIT error %#x\n", error);
> +               goto err;
> +       }
>
>
> ...
>
> +static int __sev_platform_init_locked(int *error)
> +{
> +       struct psp_device *psp = psp_master;
> +       int rc = 0;
> +
> +       if (!psp)
> +               return -ENODEV;
> +
> +       if (psp->sev_state == SEV_STATE_INIT)
> +               return 0;
>
>
> So if !psp an uninitialized error is printed?
>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/crypto/ccp/sev-dev.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
>> index 56998bc579d6..643cccc06a0b 100644
>> --- a/drivers/crypto/ccp/sev-dev.c
>> +++ b/drivers/crypto/ccp/sev-dev.c
>> @@ -1307,7 +1307,7 @@ EXPORT_SYMBOL_GPL(sev_issue_cmd_external_user);
>>   void sev_pci_init(void)
>>   {
>>          struct sev_device *sev = psp_master->sev_data;
>> -       int error, rc;
>> +       int error = 0, rc;
>>
>>          if (!sev)
>>                  return;
>> --
>> 2.27.0
>>


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABCD4C9E
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 21:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646082398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LYnovbPtGcgc9E/8oVMTSKgr3ODQnP2MrUjRdl+DpK0=;
	b=MtVjFSGlkt1CWwkaqwCvIJoj0kfEqMRm6ZPaDnYfMtErrFNlsz4RErz7vBHTM0QBjDPqk0
	rpmkJgUW+a6BQif3PFLKnF5h3Bx+pAev1n1wpV2XwCrrFWyeDDHyXr8Eykv0pkvAPW7GLz
	FsDGw9QeSS2YnQuHcTgJkl6MMNuKhAI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-EbZ1iRUlMRWR3SyhotcQ5g-1; Mon, 28 Feb 2022 16:06:36 -0500
X-MC-Unique: EbZ1iRUlMRWR3SyhotcQ5g-1
Received: by mail-qv1-f72.google.com with SMTP id fv11-20020a056214240b00b0043253a948f0so13469918qvb.1
        for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 13:06:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=LYnovbPtGcgc9E/8oVMTSKgr3ODQnP2MrUjRdl+DpK0=;
        b=L2LXsXfGC1er+tcwNun1HHml28biS0qnlNhVnI+6ToBmCh+Pese1pXB3QZXe2QDYlX
         2uunwfadVkjaa4/ibvUHg7UKPGQI8sMUeUQJzHvXxJj4tFqhXyiGENo0t06Ejvak0i3N
         ng9jWNmYO7aPZ2zXLtD11NWrfuVjzwTCn/6A6KoSht7MAwfI397fg1ZJbwb7Sy51zpF5
         Xupknr5Mo0AezAtiCYBS71vAgO0sZy9capm7xZQoT+XC4inIvkhJ6mLqVhb0T+t+OdKo
         PMlmZme1b1BKQwRrknC0PPXQKgz4P9oidrnMCVq9uJX72Fz344GhpAVM4PTHgeiZSq0X
         iwUw==
X-Gm-Message-State: AOAM533L+l4LtnQ3zziG18K0xxSUg7xTGzg4z7RTRK8rWRZByjSdZH+N
	sqgZd42FD/Q/m2wR1Gz9u4ZeIcBMm7P1XPK18YtkNmLih7nUvajkzAHuBR5wQCYJna63JVVF5VX
	fu70hQsJOhIiRBDY13c/BYmpZj4cFx/njlhlu7bspMCMVSjsxQGnXGvaeodj0
X-Received: by 2002:a05:6214:2421:b0:432:843f:b437 with SMTP id gy1-20020a056214242100b00432843fb437mr15149198qvb.102.1646082395715;
        Mon, 28 Feb 2022 13:06:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYR48coK6y+4ntjFW3gm3X78BcUfrEpCL4Q9kP1stQ4+ZmgiQnbNc7mm9sQd0BlLKJGiAMPA==
X-Received: by 2002:a05:6214:2421:b0:432:843f:b437 with SMTP id gy1-20020a056214242100b00432843fb437mr15149181qvb.102.1646082395416;
        Mon, 28 Feb 2022 13:06:35 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id n8-20020a05620a152800b00648e52be61bsm5437078qkk.37.2022.02.28.13.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 13:06:35 -0800 (PST)
Subject: Re: [PATCH] iio: scd4x: check return of scd4x_write_and_fetch
To: Jonathan Cameron <jic23@kernel.org>
Cc: roan@protonic.nl, lars@metafoo.de, nathan@kernel.org,
 ndesaulniers@google.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220227154331.80338-1-trix@redhat.com>
 <20220227174850.73520e39@jic23-huawei>
From: Tom Rix <trix@redhat.com>
Message-ID: <b13706f7-4a9e-ba3d-2828-8570c409096c@redhat.com>
Date: Mon, 28 Feb 2022 13:06:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220227174850.73520e39@jic23-huawei>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2/27/22 9:48 AM, Jonathan Cameron wrote:
> On Sun, 27 Feb 2022 07:43:31 -0800
> trix@redhat.com wrote:
>
>> From: Tom Rix <trix@redhat.com>
>>
>> Clang static analysis reports this problem
>> scd4x.c:474:10: warning: The left operand of '==' is a
>>    garbage value
>>    if (val == 0xff) {
>>        ~~~ ^
>> val is only set from a successful call to scd4x_write_and_fetch()
>> So check it's return.
>>
>> Fixes: 49d22b695cbb ("drivers: iio: chemical: Add support for Sensirion SCD4x CO2 sensor")
>> Signed-off-by: Tom Rix <trix@redhat.com>
> Good find, but I'd prefer a separate check on ret inline with what the
> other error checking paths in that function are doing.
>
>> ---
>>   drivers/iio/chemical/scd4x.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/iio/chemical/scd4x.c b/drivers/iio/chemical/scd4x.c
>> index 20d4e7584e923..b978330fb761c 100644
>> --- a/drivers/iio/chemical/scd4x.c
>> +++ b/drivers/iio/chemical/scd4x.c
>> @@ -471,7 +471,7 @@ static ssize_t calibration_forced_value_store(struct device *dev,
>>   	ret = scd4x_write_and_fetch(state, CMD_FRC, arg, &val, sizeof(val));
>>   	mutex_unlock(&state->lock);
>>   
>> -	if (val == 0xff) {
>> +	if (!ret && val == 0xff) {
>>   		dev_err(dev, "forced calibration has failed");
>>   		return -EINVAL;
>>   	}
> Prefer
>
> 	if (ret)
> 		return ret;
>
> 	if (val == 0xff) {
> 		dev_err(dev, "...
> 		return -EINVAL;
> 	}

ok and the next line can be simplified to

return len;

Tom

> Thanks,
>
> Jonathan
>


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC7C196
	for <llvm@lists.linux.dev>; Fri, 29 Mar 2024 00:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711670739; cv=none; b=OyF78RnuJiEKBhMSwZgpF5zuhnDBg3EqPdiOETU7LQbWBTmN6Vjk73sahe2J1CGuZqHOpDNfxu9UWXum3M9W1rx6SolML3Q46f8fZyb4aI7vHuc2dubK5PxmFXbkCfEBL5JjIoMefCEtninOX2DeoQ5UW8BMvKU1MNPCf7XmXw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711670739; c=relaxed/simple;
	bh=cjxm1Ryfb5Z9F4sbSdTRXRhffmjVd0tmVnxtg9IiFvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l+ymQwZeezIjWi5TkzIZLtrQ8WiLEsE/5zhTZYpN2/RJt8PKkvozojuJWWVk6Vhl+zlpVAwZCwjcmWM5cyEXm7Pa0KAsbwXe2lcNOCjpVXJ2qfLrOEbvq3Q5DG+85nWbJcnvehLlRthBWBvEZBMUKAA48u7jpsQvLIU20jzgaeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i3bTekP7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i3bTekP7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711670736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oquIsO/B8A2Gk2EwI1tx+d6zNaq8dTKXgOE1D72BOIw=;
	b=i3bTekP7uHuTkj6ouHBfEKGr8LYAO9pNQDW0BfyP/03t49V2PPgG25WWQDROoKbNz9xbCm
	DFBCsbYVKXopkWbFIIX1TaJ9JlwHkX1X/KXZR3qDwUvmcQwl+LaU+X+ruTLu0AWzRq3jr6
	U45UX+ggdQjXbK+mH5JLW4dYeW+8fAs=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-n1X65qTKMva-bY7YZGjn9g-1; Thu, 28 Mar 2024 20:05:34 -0400
X-MC-Unique: n1X65qTKMva-bY7YZGjn9g-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6e6c21dad26so1465614a34.2
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 17:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711670734; x=1712275534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oquIsO/B8A2Gk2EwI1tx+d6zNaq8dTKXgOE1D72BOIw=;
        b=Il1a2k+8Kw/YyIj54Lky5T2cv+++XgVs0CJJyms/Lfl1aBd8VvK7t9ZZ1WaMWxOOYb
         Tf7i1cseOo7DlPITfm5srRbK1uu5pG5+bZqE/eAEXm9vBfurTv2y406TFVppXh8HWylQ
         eK2V0cG81xnHedWvhVJFxvsVrpp4iKeVxl55xP4sP0T8y1SSmtC1LhsR1vwCK2JU5iHc
         vC/92Z9wViXkhYoeuf3ItmAen+pCtL0HCVx0k45D+x/Vq/RhLpcoVLaXWfQxARhwMtP0
         S66MLqTe6DGp3X2DVBFomJE+vGfWW09bF6PN6BqaFoVkIouGEdQf0B18wa0Q+b40QG4h
         fP/A==
X-Forwarded-Encrypted: i=1; AJvYcCU2+kdnfj6So9CyrsMG4Le71K4bFeRtGFvgRQSRzG2fF1HQDwB+R+qlNogIhQ2JBYPsla89fgFkblWEBm21xdNcYq4hUg==
X-Gm-Message-State: AOJu0YxrVE9nX4Srf9nCW32ojvyA827riIlfOrs4d5jpLesBhYyz2a8i
	X1s2msbXGtAXoG3yOnRsretS2JSw5+qS3g99qJVDOJe5bRBkZBsr/Ex0zjVjUmuPDswFBEmN0eD
	AYai2sssKuNVTDYY7X3unujdg6dvKKobaORlKe+s47khp93g8jEg=
X-Received: by 2002:a05:6870:9213:b0:22a:e91:2d9c with SMTP id e19-20020a056870921300b0022a0e912d9cmr744895oaf.56.1711670733970;
        Thu, 28 Mar 2024 17:05:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnEoQrZF39Z3vBtcbSJQo0k22y/TmSjLE13uEQmcKttgsZxV4Si5B4aokUcJRse8C4U5UT1g==
X-Received: by 2002:a05:6870:9213:b0:22a:e91:2d9c with SMTP id e19-20020a056870921300b0022a0e912d9cmr744867oaf.56.1711670733707;
        Thu, 28 Mar 2024 17:05:33 -0700 (PDT)
Received: from [10.72.112.41] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id j23-20020aa78d17000000b006e681769ee0sm2020583pfe.145.2024.03.28.17.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 17:05:33 -0700 (PDT)
Message-ID: <93fc9138-7498-4268-9bd2-d5b87f215963@redhat.com>
Date: Fri, 29 Mar 2024 08:05:20 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] rbd: avoid out-of-range warning
To: Alex Elder <elder@ieee.org>, Arnd Bergmann <arnd@kernel.org>,
 linux-kernel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>,
 Alex Elder <elder@inktank.com>, Josh Durgin <josh.durgin@inktank.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Hannes Reinecke <hare@suse.de>, Christian Brauner <brauner@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "Ricardo B. Marliere" <ricardo@marliere.net>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Alex Elder <elder@linaro.org>,
 ceph-devel@vger.kernel.org, linux-block@vger.kernel.org, llvm@lists.linux.dev
References: <20240328143051.1069575-1-arnd@kernel.org>
 <20240328143051.1069575-4-arnd@kernel.org>
 <b8e848fe-96d8-4f75-a2e9-2ed5c11a2fd7@ieee.org>
From: Xiubo Li <xiubli@redhat.com>
In-Reply-To: <b8e848fe-96d8-4f75-a2e9-2ed5c11a2fd7@ieee.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/28/24 22:53, Alex Elder wrote:
> On 3/28/24 9:30 AM, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> clang-14 points out that the range check is always true on 64-bit
>> architectures since a u32 is not greater than the allowed size:
>>
>> drivers/block/rbd.c:6079:17: error: result of comparison of constant 
>> 2305843009213693948 with expression of type 'u32' (aka 'unsigned 
>> int') is always false 
>> [-Werror,-Wtautological-constant-out-of-range-compare]
> w
>>              ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> This is harmless, so just change the type of the temporary to size_t
>> to shut up that warning.
>
> This fixes the warning, but then the now size_t value is passed
> to ceph_decode_32_safe(), which implies a different type conversion.
> That too is not harmful, but...
>
> Could we just cast the value in the comparison instead?
>
>   if ((size_t)snap_count > (SIZE_MAX - sizeof (struct ceph_snap_context))
>
> You could drop the space between sizeof and ( while
> you're at it (I always used the space back then).
>
Agree.

- Xiubo


> -Alex
>
>>
>> Fixes: bb23e37acb2a ("rbd: refactor rbd_header_from_disk()")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   drivers/block/rbd.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
>> index 26ff5cd2bf0a..cb25ee513ada 100644
>> --- a/drivers/block/rbd.c
>> +++ b/drivers/block/rbd.c
>> @@ -6062,7 +6062,7 @@ static int rbd_dev_v2_snap_context(struct 
>> rbd_device *rbd_dev,
>>       void *p;
>>       void *end;
>>       u64 seq;
>> -    u32 snap_count;
>> +    size_t snap_count;
>>       struct ceph_snap_context *snapc;
>>       u32 i;
>
>


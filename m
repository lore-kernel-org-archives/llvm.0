Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77EF136330
	for <llvm@lists.linux.dev>; Sat, 12 Oct 2024 10:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728727727; cv=none; b=sYhY6jP1yksqb6v5IE2IdXrdONA5ipDdfDzoxavSyJTmbwl5FoZWLfvmOWlrzVB/2EroS43yEpRmGbDi5dDfcJbqOey70G5k3md50ZGF35EiDMuxffCFLxT3+V6KfNRaOHX+1bj3KVYCKN9B85IIQbvVHOmzCSWVh6h41yi95is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728727727; c=relaxed/simple;
	bh=VejCG9SK11GPW4Puok5PFtfOa088c0k2EBQLahUazAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2p202u/LK9N6PaYncS7o08/WJxjoIPrg5Jf9Gxb6M0Ts6AFsQuYY2GXp+WbAswn9QsQiIc5a4P2E8hd//IScMtGTMQsbtDpnDDpUkOhPTeiBO/bwZruuFBo7wnqT/KVHcc2BCSUN7LzgZHQVf1OweggQM9KR6TFDiyM87aLL+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXmLHcmc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXmLHcmc"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-431195c3538so17383865e9.3
        for <llvm@lists.linux.dev>; Sat, 12 Oct 2024 03:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728727724; x=1729332524; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kX5mriekr5Ocrm8tWdj2wKvGlcuqBXp83tQmMuAVRsg=;
        b=ZXmLHcmcqvdrdbK7VFKk/cqt/xCPVlO7rWvaPgXvUUMlLVaD89u0f3xQWjYGet7aNX
         FwkKqFKLDVmNMo5hjIRKO7uY6zqgxc8BJCuHvGb20gd659iL4gnQdBvu659tO9AsNHN9
         kCDzUzztTUN+dq+PjWWfFjiPAwpXKcFGss5Gg423jKhLxv3C+OfVEqQV4ZbsQJ8kLszR
         yNS0hMdgEJVH6LfIS6h1r7xP0UurcZ4rUAOnKxz0q40/QY7BqguA2F1Tjte3HDrohCjH
         TH9aCHH5eRTnkLIZvF8fEPeXyo4ezglsjmVzjxfAHXJaEQawp29ZqIFQWeaB1nSkHDeS
         rwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728727724; x=1729332524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kX5mriekr5Ocrm8tWdj2wKvGlcuqBXp83tQmMuAVRsg=;
        b=tsYEgcP5zd1jg2F1ckStzLTwKXs9rM/ahDK+2hLzN3Hzk1EtEcOyQhCUh+fMryT9My
         ut1GXQ7Hp83BT737ks03nDEufd6h5/y9e+5+mxCwX6Y4msYSNXWaavQRlXUmRQkDEe/S
         bbEUAxSt7JTwyRyF/V0XWdTFkjM2Z5Ouvs2bK3skLAkjFQ1AjHUum0IBC/o3jYjxop9C
         Tndbk9GtekbtxMF/7NAIIyEDGrnqG1aNdoi7p2ouxVP4vFvwmJBnPkyY8X2Z7o+DqZGT
         SydGOmmu++HZpGOJ00Qe3ayD68QZZHYfBP/83MCECormYKjpznayRZoaWOz+ytt/k0Kj
         vgqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWggZXgAnGGP2OBT4b1W5nt2917W8degzFiV9KGKdEuoFSY9yPAxJfHidoEB/pPZE9HdjLy@lists.linux.dev
X-Gm-Message-State: AOJu0YycJx9+3qNGM6jkICW9mTtN1ZD9hK0xgP8xauK3chvld4w7H4wd
	0U1danqX135eWzvm4axil2hFvYrCjb4rTF9qdaKuJ450aDNQ9x4K
X-Google-Smtp-Source: AGHT+IEoTX29G0T+6mJ+CjZxCK4Y7mxjDZiy7ui8UQrpuf2+n2Os0JzsumpY0HDp6EIPHwreFfBdYA==
X-Received: by 2002:a05:600c:474a:b0:42c:a72a:e8f4 with SMTP id 5b1f17b1804b1-4311ded55e9mr44633365e9.14.1728727723755;
        Sat, 12 Oct 2024 03:08:43 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:143a:73ee:53ce:7dea? (2a02-8389-41cf-e200-143a-73ee-53ce-7dea.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:143a:73ee:53ce:7dea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf43da8sm96053475e9.11.2024.10.12.03.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 03:08:42 -0700 (PDT)
Message-ID: <e210f9c6-9070-4b6d-b938-9a35b7a16380@gmail.com>
Date: Sat, 12 Oct 2024 12:08:39 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: bmi323: mark bmi323_ext_reg_savestate as maybe
 unused
To: Julia Lawall <julia.lawall@inria.fr>, Su Hui <suhui@nfschina.com>
Cc: jagathjog1996@gmail.com, jic23@kernel.org, lars@metafoo.de,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, benato.denis96@gmail.com,
 Jonathan.Cameron@huawei.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org
References: <20241012083701.2189663-1-suhui@nfschina.com>
 <alpine.DEB.2.22.394.2410121110540.8471@hadrien>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2410121110540.8471@hadrien>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/10/2024 11:11, Julia Lawall wrote:
> 
> 
> On Sat, 12 Oct 2024, Su Hui wrote:
> 
>> When running 'make CC=clang drivers/iio/imu/bmi323/bmi323_core.o', there
>> is a clang warning as follows:
>>
>> drivers/iio/imu/bmi323/bmi323_core.c:133:27: error:
>> variable 'bmi323_ext_reg_savestate' is not needed and will not be emitted
>> [-Werror,-Wunneeded-internal-declaration]
>>   133 | static const unsigned int bmi323_ext_reg_savestate[] = {
>>       |                           ^~~~~~~~~~~~~~~~~~~~~~~~
>> 1 error generated.
>>
>> Mark bmi323_ext_reg_savestate as __maybe_unused to silent this warning.
> 
> Why might it be unused?
> 
> julia
> 
>>
>> Fixes: 16531118ba63 ("iio: bmi323: peripheral in lowest power state on suspend")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>>  drivers/iio/imu/bmi323/bmi323_core.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/iio/imu/bmi323/bmi323_core.c b/drivers/iio/imu/bmi323/bmi323_core.c
>> index beda8d2de53f..1167984809c5 100644
>> --- a/drivers/iio/imu/bmi323/bmi323_core.c
>> +++ b/drivers/iio/imu/bmi323/bmi323_core.c
>> @@ -130,7 +130,7 @@ static const unsigned int bmi323_reg_savestate[] = {
>>  	BMI323_FIFO_CONF_REG
>>  };
>>
>> -static const unsigned int bmi323_ext_reg_savestate[] = {
>> +static const unsigned int bmi323_ext_reg_savestate[] __maybe_unused = {
>>  	BMI323_GEN_SET1_REG,
>>  	BMI323_TAP1_REG,
>>  	BMI323_TAP2_REG,
>> --
>> 2.30.2
>>
>>
>>
> 

This issue has already been found and discussed here:

https://lore.kernel.org/linux-iio/AS8PR02MB10217F8B5827B69E6438488679C762@AS8PR02MB10217.eurprd02.prod.outlook.com/

where I got lectured by Nathan Chancellor about such warnings.

The fix was not marking the array as unused, because it should have been
used. The proper fix can be found in iio/fixes-togreg.

Best regards,
Javier Carrasco

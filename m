Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582C119AA66
	for <llvm@lists.linux.dev>; Fri,  7 Jun 2024 17:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717781014; cv=none; b=Z9X0SIzH6+fPk5h8UGdj0VC3pNfpwDUeRoz/UBXltqTMavk4L9GW6nCCIddz2ZJxgL5Y2haTsacfZbS9gzIQx9pc6hUxtId2AeenIoazlOjWyepLIT8qBHyr80ACNTHPSNp+rUq7Mw1hNFvSHMHZxbkWdS5ZfXUTvRgbBO2OtNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717781014; c=relaxed/simple;
	bh=14cB//h5KHUcUznPEaqXo2+YdWchHE+YGMb0lj7HDvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RW4mTfNhWe1Uk/LPBiYdcrvzeVMT39WKDOWreiMv7wiGW4rQ7Ig16leLNvE91OvAtx34373TJg6VVlwd+9HeNdve1TBOywLGnFw9gk5ps/Pb+AkE6KyhmLEThZ9MMC3gKaNVZH84NFCH8rhF2Bytt0VDHnNdB4O4tqPl/kQ6N/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g0uxnyJU; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g0uxnyJU"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3758a53133aso412395ab.3
        for <llvm@lists.linux.dev>; Fri, 07 Jun 2024 10:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717781012; x=1718385812; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Akc5Ty0GPAEauJkM0VeG3fjITUzHi1T4IgTHQZ9tmRo=;
        b=g0uxnyJUxVNBOx17xTkB25KQLvBoR5ZLg1FuEesyo95Y63XEeW5pcVammsITS6u/dA
         ehc2gHafAQVfH6espar5SB+EyUB4Iss+otwBDYSm2AT5Vjkj1yQXxnFOc4zMce2PqZMA
         8wMoN6D8ad0mMjL6W3NW+Qwku3AMRaLX+Y+Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717781012; x=1718385812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Akc5Ty0GPAEauJkM0VeG3fjITUzHi1T4IgTHQZ9tmRo=;
        b=siBvRL83Ty6jtH5QgjMFKqkIkNHBBDHvtRDh2AiVsr8hhSBGKLWaiBS/gg1ywG1mg9
         AyjhQXkSobhRRwLDUOCmNVwAYCjjAUST78aOi9ztcovZC4GuJQEdQuS08EG4dCCe7UvN
         xxKtKm+OZTffkk86l8SbnKC7Jn61rHfCPVn47JZLSePLKIdielm+nhD8yfRVzjwguOr2
         9mS1/ILH4A5lZcGXpzzH2scrpalK1xhFo8Wy6V2NDXsb9DdImh8E/tz1qgNEoAzsCdpr
         A45HHsBzBuLumUyI/YlDe92FtY0rNwTt4OTM86Ccb6DoSN0/fDFBeaz9kPG11KgDrl1I
         rhfA==
X-Forwarded-Encrypted: i=1; AJvYcCWmUCNihS3tmEPdDobMBzV96nssHbclOVA6G75oMYwPSk3FQyWNOgonvUys/Pg78VO2FIKk3gaXRepgQCjLXSoA/oYBAw==
X-Gm-Message-State: AOJu0Yww6Omlj9e2F3cpECM08iCw0nsOH0VFzIFVZmybZdwdNdoUHSWq
	KMq4wN363ArYUrd6yyAyFHEDqyir2/CqzWEJAvMBmFQA8tF6kyWqrvnDPl8xquU=
X-Google-Smtp-Source: AGHT+IFNYj0aUh3K6WMdox7HGSg/JSFoAobTlR/evYNDo4xsqmY6c685HkWmKmsYRynyfRTE2ZhAUw==
X-Received: by 2002:a05:6602:20c4:b0:7eb:2c45:4688 with SMTP id ca18e2360f4ac-7eb57247049mr338990939f.2.1717781012383;
        Fri, 07 Jun 2024 10:23:32 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b7a24d000esm941753173.164.2024.06.07.10.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 10:23:31 -0700 (PDT)
Message-ID: <b7de28bd-34fd-491a-9b66-9a37dc450e22@linuxfoundation.org>
Date: Fri, 7 Jun 2024 11:23:30 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] selftests/lib.mk: silence some clang warnings that
 gcc already ignores
To: Nathan Chancellor <nathan@kernel.org>, John Hubbard <jhubbard@nvidia.com>
Cc: Shuah Khan <shuah@kernel.org>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Beau Belgrave <beaub@linux.microsoft.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
 sunliming <sunliming@kylinos.cn>, Masami Hiramatsu <mhiramat@kernel.org>,
 Valentin Obst <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240531183751.100541-1-jhubbard@nvidia.com>
 <20240531183751.100541-3-jhubbard@nvidia.com>
 <20240603223609.GC1802995@thelio-3990X>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240603223609.GC1802995@thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/24 16:36, Nathan Chancellor wrote:
> On Fri, May 31, 2024 at 11:37:51AM -0700, John Hubbard wrote:
>> gcc defaults to silence (off) for the following warnings, but clang
>> defaults to the opposite. The warnings are not useful for the kernel
>> itself, which is why they have remained disabled in gcc for the main
>> kernel build. And it is only due to including kernel data structures in
>> the selftests, that we get the warnings from clang.
>>
>>      -Waddress-of-packed-member
>>      -Wgnu-variable-sized-type-not-at-end
>>
>> In other words, the warnings are not unique to the selftests: there is
>> nothing that the selftests' code does that triggers these warnings,
>> other than the act of including the kernel's data structures. Therefore,
>> silence them for the clang builds as well.
>>
>> This eliminates warnings for the net/ and user_events/ kselftest
>> subsystems, in these files:
>>
>>      ./net/af_unix/scm_rights.c
>>      ./net/timestamping.c
>>      ./net/ipsec.c
>>      ./user_events/perf_test.c
>>
>> Cc: Nathan Chancellor <nathan@kernel.org>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> 
> This seems reasonable to me.
> 
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> 
>> ---
>>   tools/testing/selftests/lib.mk | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
>> index 2902787b89b2..c179c02281e9 100644
>> --- a/tools/testing/selftests/lib.mk
>> +++ b/tools/testing/selftests/lib.mk
>> @@ -50,6 +50,14 @@ else
>>   CLANG_FLAGS     += --target=$(notdir $(CROSS_COMPILE:%-=%))
>>   endif # CROSS_COMPILE
>>   
>> +# gcc defaults to silence (off) for the following warnings, but clang defaults
>> +# to the opposite. The warnings are not useful for the kernel itself, which is
>> +# why they have remained disabled in gcc for the main kernel build. And it is
>> +# only due to including kernel data structures in the selftests, that we get the
>> +# warnings from clang. Therefore, disable the warnings for clang builds.
>> +CFLAGS += -Wno-address-of-packed-member
>> +CFLAGS += -Wno-gnu-variable-sized-type-not-at-end
>> +

Thank you for adding this comment block.

>>   CC := $(CLANG) $(CLANG_FLAGS) -fintegrated-as
>>   else
>>   CC := $(CROSS_COMPILE)gcc
>> -- 
>> 2.45.1
>>
>>
> 

Thank you both. I will apply this for the next release. I want this
change soaking in next for a bit.

thanks,
-- Shuah


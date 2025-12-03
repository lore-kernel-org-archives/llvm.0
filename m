Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA51323417
	for <llvm@lists.linux.dev>; Wed,  3 Dec 2025 15:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764777562; cv=none; b=bmjjfOmlI/vqMib4rI1Lv2qX7tN8jeOJHuOfr/044e/+kqMfzE1NMSeopNQZpj/T27CeIuEAtoQmCDAclxBVOqoyZMb1m26moOBmjHm6Nwgj/z5Fx767o6SRLJra6i+HC/hKLBZoBEtZORCKMMtqqtwEl5MevdJRxNmS6krEG4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764777562; c=relaxed/simple;
	bh=iakk/Jr76m1kJL5Np9IbPtoAP3+T1JvteiA3kLHZ94M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SYKDMguguSCL1qqLxY46s4HQcQiYYnsI4tPq2DxpvKg2mS1cOunLdxmUAxkH+NBR7asksAI+n6Z3ymlheYdiYpj3a6BzrG7GFJ1Dk5JSrZWAOkLjhOVKCpC+3vlb1TGxufChPPPHO6PCZNUfdtbVWil9qdvGdSz0T5l+IxNWZXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=fail smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Rc1gCzos; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Rc1gCzos"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7c7bfba3996so3811707a34.0
        for <llvm@lists.linux.dev>; Wed, 03 Dec 2025 07:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1764777560; x=1765382360; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V34xiYHMBhlRprMCQ3/uOloSz9kB9mYUn7HTGoE0360=;
        b=Rc1gCzosqHzGjQ3fqnI33a51Yt2ScL9yRDDXkEHTynOfacrtEcsxM2WdHAZy7DRjHH
         N9vYF5RD6ZC/DBxGOlG8FEvNozj7G0ZGJBoHmLdL4JQ5JlOm9HvRgKr+UvY/7p2DlwkZ
         I59u5CkxSijR7MsA1go5LVCmGQLVVh/KUBmCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764777560; x=1765382360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V34xiYHMBhlRprMCQ3/uOloSz9kB9mYUn7HTGoE0360=;
        b=mpE9kAEVaWs5s+sD66BXVO5wSZDpDQGNLCveRENfWXp/Cnu9ZeIjgnwJtZmsdK6W5p
         tKEXf8itNqFrr1JYpaeClC2m4rYPHG3/Mc1G3j+2PRDZMU8T24JwNiyDYbVYQZXLIEdz
         WSeLFcohaxeT6DgJKvtr8twcL4jqbQqj4R/rZhCVYw2C0dcCJ8mUV3yL98QqF6Xeq+AA
         YAuW0yzh5Ak2zDaMBFBeqlnlo3KJTd5vK6OvWPQrUFCjgpTSTyPQm3ppa+Dp61NDd9Ls
         GIzPkpzFNOebVjFo0fxOweqwvKhr0F1KQA/8WibkycrLl1bVx6MgUrSHwjMqymbedA0Y
         VEkA==
X-Forwarded-Encrypted: i=1; AJvYcCUX9OxmSe1TGtaD+33RIan7UFKA9KzSWzikKmqqqnkS18OLiXyydvM8cl0+wnVJM2yQQc62@lists.linux.dev
X-Gm-Message-State: AOJu0YwVlurarG2z6Mkjuhze+MS4AahHNzz1IWLh1TN1vWE4CJC83FU9
	NiGrJO9wFMRKrVZjwl/TmnVLY4vYg0z3ICibA9NsGFrF2WvnjpEoN74JY/b5RIz/m1Q=
X-Gm-Gg: ASbGncsfidSZLrRo77zETLml3Xrz91mL8r64a7AM68aj1MzhNcVR3wwx4B4hr0Em4w9
	POulixun+aJ8KjEtGrdMNgelrtjM2koKO6JvnrqUKhm3kwTeD6gPadnlQn8hFyJYr7lK++UoFYZ
	vDLy+5Mz18NOFcXkIhFUEgfRBRnwrKSSLiFkJZTZDmU6STsmtMCipHcprZIIH+7tiVULtqf4feq
	bEkVLBOFfsjcBIh90llQ6HpPdbQ1Lb7nQi+CExxJfH7dDFIkdoLBoj0T74kIf73RubarGueyZJp
	vBzD4rSsAuS1U1LPcEQWdHbTDOi+fPLH/jXhPEi5T46z0G/iniyBcsdYCikSoD3bx87aTFnsp8b
	LCvY5i3hbM+opsGQPazP9445krkOTlk9FNKO4al7RjZg+/9Xs79Eux9CIRsXM5NZ4qrbj3Ywgbf
	xsOvZVs3IYzGeMBW2qaqtFfAs=
X-Google-Smtp-Source: AGHT+IHZKqU6OwoL05VlFhrm59ANsB5LDQOaT2yu73WegIU0kb05V6z7peIr7y7gMgvG/jBK7FYjzQ==
X-Received: by 2002:a05:6830:4389:b0:7bc:6cc3:a624 with SMTP id 46e09a7af769-7c94dd09ab0mr1682360a34.32.1764777560172;
        Wed, 03 Dec 2025 07:59:20 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c90f5fedbbsm8945257a34.10.2025.12.03.07.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 07:59:19 -0800 (PST)
Message-ID: <a5a1d7bf-04b0-43fb-8f93-781c3534d8fd@linuxfoundation.org>
Date: Wed, 3 Dec 2025 08:59:18 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/seccomp: fix pointer type mismatch in UPROBE
 test
To: Nirbhay Sharma <nirbhay.lkd@gmail.com>, Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, llvm@lists.linux.dev, khalid@kernel.org,
 david.hunter.linux@gmail.com, Jiri Olsa <olsajiri@gmail.com>,
 sam@gentoo.org, shuah <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <aP0-k3vlEEWNUtF8@krava>
 <20251026091232.166638-2-nirbhay.lkd@gmail.com>
 <8e1ff2f1-b45e-4b1f-b545-d433e277607f@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <8e1ff2f1-b45e-4b1f-b545-d433e277607f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/25/25 04:20, Nirbhay Sharma wrote:
> 
> 
> On 10/26/25 2:42 PM, Nirbhay Sharma wrote:
>> Fix compilation error in UPROBE_setup caused by pointer type mismatch
>> in the ternary expression when compiled with -fcf-protection. The
>> probed_uprobe function pointer has the __attribute__((nocf_check))
>> attribute, which causes the conditional operator to fail when combined
>> with the regular probed_uretprobe function pointer:
>>
>>    seccomp_bpf.c:5175:74: error: pointer type mismatch in conditional
>>    expression [-Wincompatible-pointer-types]
>>
>> Cast both function pointers to 'const void *' to match the expected
>> parameter type of get_uprobe_offset(), resolving the type mismatch
>> while preserving the function selection logic.
>>
>> This error appears with compilers that enable Control Flow Integrity
>> (CFI) protection via -fcf-protection, such as Clang 19.1.2 (default
>> on Fedora).
>>
>> Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
>> ---
>>   tools/testing/selftests/seccomp/seccomp_bpf.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
>> index 874f17763536..e13ffe18ef95 100644
>> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
>> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
>> @@ -5172,7 +5172,8 @@ FIXTURE_SETUP(UPROBE)
>>           ASSERT_GE(bit, 0);
>>       }
>> -    offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
>> +    offset = get_uprobe_offset(variant->uretprobe ?
>> +        (const void *)probed_uretprobe : (const void *)probed_uprobe);
>>       ASSERT_GE(offset, 0);
>>       if (variant->uretprobe)
> 
> Hi all,
> 
> I'm following up on this patch that fixes the pointer type mismatch in
> UPROBE_setup when building with -fcf-protection. It resolves the
> incompatible-pointer-types error seen with Clang 19.
> 
> Please let me know if there are any comments or some changes needed.
> 

Hi Kees,

Is it okay to take this patch through my tree?

thanks,
-- Shuah


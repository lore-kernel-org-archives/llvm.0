Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CFE2F21
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 23:12:07 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id b12-20020a9d754c000000b0059eb935359eso931265otl.8
        for <llvm@lists.linux.dev>; Wed, 02 Feb 2022 15:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=t29/K+CRAzr2C0Y4zdBwQdSLvuEbGx2x0Uo7Ij6d/QU=;
        b=Yhr00QwTQbAUMNWJsy/noa8zs8PvkvEhkcRKUwFOldhEFckHStjC8Umi/SL/UO7KhW
         DapLyXfwOmf/TDHkE1Epqcwubwq446noAyYkpHoYuezANTYykUjGCI/LVwkQWz9NHi9e
         MhDf5gtyXZQIzVfmGvBabmOyQKVz2390HcKVBnwIfrhjhAVppCUj9YxrHUBwITJ9SuKp
         m/WGbSM+2hvciWYwltw+n9lkuXZsV7gVlxn67w5GxWh68cGI+zEYvfUKoFSE39i45nOs
         OY7WWIyVmssrr1jHC1aiZGAcmp8BRBkHr+7PFOy2AVDEYQbYq48EfBj+mYZ2Klf1Ix3H
         pSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=t29/K+CRAzr2C0Y4zdBwQdSLvuEbGx2x0Uo7Ij6d/QU=;
        b=GIK4GBeWk5D9zuu7TRY1fckq70/Vf/pRFKhtGTxdiCYAyDgtUGRF3QGLceY5UldGWB
         5SehgAZPwjq8WO4X6jCP6WZKdYUX27DdZmhpfW9/OnDmvND6O8jYvXWZXRoveDadkxSV
         jfE1L2/WX0bKDQ8KV6/FG7xcCcfL5hvqM3bQ3Kj/D0lj43Y0e2HGnc1uBz+QKCGbfLis
         hh+HaR0aXqAVGMrdzG3VXftiOCjXlCmdPz6ljmDkBGt3Re6fH6/kzl3sPnirRoGJv8wn
         RT8xxY08uONRa3WbKR0wWyKQ56WQDAgord6SNpF/Sy39q2WhRTGa78STn26RCa7xZQg+
         Y9hw==
X-Gm-Message-State: AOAM531l/62cnLnwZtK9D68o1CbuM2wJdSyaY554LmQSxWDTEGWTMkaS
	+2P6iCckAwePFRYfbnilSd4=
X-Google-Smtp-Source: ABdhPJzqeLBvSKmuB4xo8RTR/vfquflC7QfdejlXnWv02QOSZcxpWYEKEU1AN1+LL/9H1JXiGpPRTA==
X-Received: by 2002:a9d:62da:: with SMTP id z26mr17266586otk.26.1643843526905;
        Wed, 02 Feb 2022 15:12:06 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e92sm8413598ote.72.2022.02.02.15.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 15:12:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5ff18cff-6cfd-1f85-da74-1e5660a1a250@roeck-us.net>
Date: Wed, 2 Feb 2022 15:12:03 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Peter Rosin <peda@axentia.se>,
 Andy Shevchenko <andy@kernel.org>, Matteo Croce <mcroce@microsoft.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20220130183653.491292-1-keescook@chromium.org>
 <20220202160149.GA2322037@roeck-us.net> <202202021237.487D3DE73@keescook>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] lib/test_string.c: Add test for strlen()
In-Reply-To: <202202021237.487D3DE73@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/2/22 12:52, Kees Cook wrote:
> On Wed, Feb 02, 2022 at 08:01:49AM -0800, Guenter Roeck wrote:
>> On Sun, Jan 30, 2022 at 10:36:53AM -0800, Kees Cook wrote:
>>> Add a simple test for strlen() functionality, including using it as a
>>> constant expression.
>>>
>>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>>> Cc: Peter Rosin <peda@axentia.se>
>>> Signed-off-by: Kees Cook <keescook@chromium.org>
>>> ---
>>> I'll be taking this as part of my Clang FORTIFY_SOURCE series.
>>> ---
>>>   lib/test_string.c | 37 +++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 37 insertions(+)
>>>
>>> diff --git a/lib/test_string.c b/lib/test_string.c
>>> index 9dfd6f52de92..59994f552c48 100644
>>> --- a/lib/test_string.c
>>> +++ b/lib/test_string.c
>>> @@ -179,6 +179,38 @@ static __init int strnchr_selftest(void)
>>>   	return 0;
>>>   }
>>>   
>>> +/*
>>> + * Unlike many other string functions, strlen() can be used in
>>> + * static initializers when string lengths are known at compile
>>> + * time. (i.e. Under these conditions, strlen() is a constant
>>> + * expression.) Make sure it can be used this way.
>>> + */
>>> +static const int strlen_ce = strlen("tada, a constant expression");
>>> +
>>
>> This results in:
>>
>> lib/test_string.c:188:30: error: initializer element is not constant
>>    188 | static const int strlen_ce = strlen("tada, a constant expression");
>>
>> for several of my tests. I don't think you can mandate that a compiler
>> implements this.
> 
> Which tests?
> 

Some examples:

Build reference: next-20220202
Compiler version: m68k-linux-gcc (GCC) 11.2.0

Building m68k:defconfig ... failed
--------------
Error log:
lib/test_string.c:188:30: error: initializer element is not constant
   188 | static const int strlen_ce = strlen("tada, a constant expression");

Building mips:malta_defconfig:nocd:smp:net,e1000:initrd ... failed
------------
Error log:
lib/test_string.c:188:30: error: initializer element is not constant
  static const int strlen_ce = strlen("tada, a constant expression");

Building i386:q35:Broadwell:defconfig:smp:ata:net,rtl8139:hd ... failed
------------
Error log:
lib/test_string.c:188:30: error: initializer element is not constant
   188 | static const int strlen_ce = strlen("tada, a constant expression");

i386 and is defconfig + CONFIG_STRING_SELFTEST=y; mips is
malta_defconfig + CONFIG_STRING_SELFTEST=y. All use gcc 11.2.

There may be more, but there are so many failures in -next right now
that I may be missing some.

> This property of strlen() is already required by our builds (this is how
> I tripped over it). For example:
> 
> drivers/firmware/xilinx/zynqmp-debug.c:
> 
> #define PM_API(id)               {id, #id, strlen(#id)}
> static struct pm_api_info pm_api_list[] = {
>          PM_API(PM_GET_API_VERSION),
>          PM_API(PM_QUERY_DATA),
> };

I do not think that it is a C standard that strlen() on a constant string
must be compile-time evaluated and result in a constant.

Anyway, key difference, I think, is the presence of an architecture-specific
version of strlen(), or the maybe non-presence of __HAVE_ARCH_STRLEN,
or the definition of strlen() in include/linux/fortify-string.h.

Guenter

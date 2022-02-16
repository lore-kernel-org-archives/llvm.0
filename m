Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EFA1B9E
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 01:19:21 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id c3so780801pls.5
        for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 17:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=n3HlZeesmoig6AzcEvE+vVMKK5hAX/6KVNpJ5JEyVT0=;
        b=HErnWS27+ufQ8NMTJ7hAU5qJQcdOuUHum0wucqqZdIejgM4oVbYBv9dz7n+S+NgHgq
         CtO+qahqEdmzfiHlS/+L5kONAoOcQPK34qrMjCSBSnx49jUEUjcTKMUvz34S8GXpgtDN
         kSy/ZGxSksJWuYJrmv6TqoBU+iq2cpEZVDn+tl89zjItgRR5iEctXMiyMS1yILvLR9m8
         jd+bmOOXRfU62lUA4RABx557Fy4+mx9gJj7tA+C/5T8asdWmskTsV8p6Xl5ZlKhz/06L
         eRAX3Do2/AiPdqaFgKNmXaI3CXIe2qtvdc3MpACpVWFSBhucZGEaASa6D8aI7/03/FOX
         Qvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=n3HlZeesmoig6AzcEvE+vVMKK5hAX/6KVNpJ5JEyVT0=;
        b=mjSK7xswd1CgIKL5glwwNtXJTwgf3eg584rDCYt4zBPARLx/bLwvANZHXNldp5KA8Z
         dZJC5P+k0/B2IXiLj226mof4savF1sM0GVf7imbw4NoTpr4jF3jFYjj9D7oMMWVljr9F
         LLbHm9GjFXRsKlPdLXTk8Euro1+PgxMImTM1s0Ex0ogabXjhoDdEXakK+bM0UXI0+4+m
         Br5IZ2XEH/Vvcn2WFcWDqvvm8d0y9ildYJzQsrXj/eSnV8ONuWZd68HEXhhJbRlTyCF0
         Wt1z0TSfX7FihRYFponyWkUovphctZO3oP6buSQ56+h7mhe14S+4AH5e+KAtQgji9/pE
         R7KQ==
X-Gm-Message-State: AOAM530rjJgVf+ENdtvobCT3Rr0E/r0ciEOTozFJLaPfQvoEVwG66mdu
	kgypYEUX+ND4WJBsTzJ8JaExcw==
X-Google-Smtp-Source: ABdhPJz//7pCe6QfbeIQekjYzgNrs+uHEYNqvhn8Lf50/8/fqgE551gMWzpa1CMDZA/VAoZVPMfivQ==
X-Received: by 2002:a17:902:e846:b0:14f:4580:4f23 with SMTP id t6-20020a170902e84600b0014f45804f23mr185743plg.63.1644974361125;
        Tue, 15 Feb 2022 17:19:21 -0800 (PST)
Received: from [192.168.10.24] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
        by smtp.gmail.com with ESMTPSA id cu21sm17962188pjb.50.2022.02.15.17.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 17:19:20 -0800 (PST)
Message-ID: <8b1d0d57-0bf7-8ca5-8b08-cd5a12f7666f@ozlabs.ru>
Date: Wed, 16 Feb 2022 12:19:14 +1100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0
Subject: Re: [RFC PATCH kernel] trace: Make FTRACE_MCOUNT_USE_RECORDMCOUNT
 configurable
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Sami Tolvanen <samitolvanen@google.com>
References: <20220211014313.1790140-1-aik@ozlabs.ru>
 <20220211214722.4373ca83@rorschach.local.home>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220211214722.4373ca83@rorschach.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/12/22 13:47, Steven Rostedt wrote:
> On Fri, 11 Feb 2022 12:43:13 +1100
> Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> 
>> For whatever reason LLVM does not allow LTO (Link Time Optimization) if
>> FTRACE_MCOUNT_USE_RECORDMCOUNT is enabled.
>>
>> This allows disabling just this option instead of disabling all FTRACE
>> options.
> 
> What FTRACE options are you talking about?

LTO_CLANG_THIN => HAS_LTO_CLANG => !FTRACE_MCOUNT_USE_RECORDMCOUNT =>

FTRACE [=y] && !FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY [=n] && 
!FTRACE_MCOUNT_USE_CC [=n] && !FTRACE_MCOUNT_USE_OBJTOOL [=n] && 
FTRACE_MCOUNT_RECORD [=y]

A bunch.


> 
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>
>> Or disabling FTRACE is the right thing to do if HAS_LTO_CLANG=y?
>>
>> Came from arch/Kconfig:
>>
>> config HAS_LTO_CLANG
>>          def_bool y
>>          depends on CC_IS_CLANG && LD_IS_LLD && AS_IS_LLVM
>>          depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
>>          depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
>>          depends on ARCH_SUPPORTS_LTO_CLANG
>>          depends on !FTRACE_MCOUNT_USE_RECORDMCOUNT  <======
>>          depends on !KASAN || KASAN_HW_TAGS
>>          depends on !GCOV_KERNEL
>>
>>
>> ---
>>   kernel/trace/Kconfig | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
>> index a5eb5e7fd624..87d82d2b0b0b 100644
>> --- a/kernel/trace/Kconfig
>> +++ b/kernel/trace/Kconfig
>> @@ -704,7 +704,8 @@ config FTRACE_MCOUNT_USE_OBJTOOL
>>   	depends on FTRACE_MCOUNT_RECORD
>>   
>>   config FTRACE_MCOUNT_USE_RECORDMCOUNT
>> -	def_bool y
>> +	bool "Enable FTRACE_MCOUNT_USE_RECORDMCOUNT"
>> +	default y
> 
> I don't think this does what you think it does.

Sounds like it.

> This is not something that should be user selectable. What exactly are
> you trying to accomplish here?

I am trying to

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b779603978e1..91c122224f83 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -153,6 +153,8 @@ config PPC
         select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
         select ARCH_WANT_LD_ORPHAN_WARN
         select ARCH_WEAK_RELEASE_ACQUIRE
+       select ARCH_SUPPORTS_LTO_CLANG          if PPC64
+       select ARCH_SUPPORTS_LTO_CLANG_THIN     if PPC64


to get LTO working on powerpc64le with minimal change to 
ppc64le_defconfig which has all these FTRACE_xxx enabled.


> 
> -- Steve
> 
> 
>>   	depends on !FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
>>   	depends on !FTRACE_MCOUNT_USE_CC
>>   	depends on !FTRACE_MCOUNT_USE_OBJTOOL
> 

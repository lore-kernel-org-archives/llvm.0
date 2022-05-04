Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434B220E0
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 02:18:19 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id a191so66719pge.2
        for <llvm@lists.linux.dev>; Tue, 03 May 2022 19:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oRTJFa40kHEh7n+tr3P07b1F40qTa0npYYEBgfPr++w=;
        b=n/0q8ggAw/ULQhiaru0IV3uK2w+sdISkFouZ1TEhbqIcrsZxTnBxvgzZXKMtWCK5gf
         cRbvr41Ie/Dz1d6ZSbVSxXS8ghz15CLo7dmzdO1hR1aVz6BCDd9NLKdYbpXpySsPZ4yg
         +elIiZRfRerfPmK+ESdtpIxNLDywj4X4dwyW+IL69pF4x2fypmlL5aZycoCU8iSUSQ2j
         85xi7aRskoAA5rgZAQCgK06QjKUD61do2Qu28KqDLLKSLIJHksYlULKSMIJ6mG8WfUBd
         dtpHtYo5MmRbRA+k0o5YH6fp7dkQS2uhJQST9DN6bz/fts85PKiiPjse/lPOas8qsAt8
         2aiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oRTJFa40kHEh7n+tr3P07b1F40qTa0npYYEBgfPr++w=;
        b=gLQrC+fZSwnaG+geDKx8d2idoih0unDq4Q7BFtYXT6tQ5wimzXBn6vQHaOD6YDYR4s
         wxPqJQ5MjGC2GZJjOJoer7lDMXDdvik0+LCOpuo1xrDp67WwGUvgXRj8iQWPHeE4Qu2O
         qO+c4Chg4towd+aqlaMR5igBEV1+KFF5q6KO9KKZBsFZ+jXn6n+UbSlJPHMotAPof6a5
         LwZ4GsDNtWbtRC4oxu8V1UzstrapOdZ2vjr79f5y4ODb6QqJ1H3A3elZPMiRFaKRFwZA
         Hkcn6e2RiVDSdGpoqrD7yy35IDLwA47n0VyRzH/HqV5uZ4UFvppSrAq5UQqqPuVBApl8
         RJBg==
X-Gm-Message-State: AOAM532Obv8pXMuTj3vHGuKHPKGbOfG045yIdWRZBTWNioYizX1BeIrT
	rNKANY3iAln9GqoLXiR4baw1yQ==
X-Google-Smtp-Source: ABdhPJxU0wXZroQ6HfCO+s6K0BJhScDxfmzFomW6S3SzG3CgbjBZpzrMge6CMRgp7CAdqn4/FP3RXA==
X-Received: by 2002:a63:1b5e:0:b0:3aa:593c:9392 with SMTP id b30-20020a631b5e000000b003aa593c9392mr16086048pgm.470.1651630699497;
        Tue, 03 May 2022 19:18:19 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.gmail.com with ESMTPSA id q26-20020a63505a000000b003aa8b87feb5sm13968274pgl.0.2022.05.03.19.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 19:18:18 -0700 (PDT)
Message-ID: <0b2a1361-e0a4-35b2-c58d-ef4b913c025e@ozlabs.ru>
Date: Wed, 4 May 2022 12:18:13 +1000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [PATCH kernel] powerpc/llvm/lto: Allow LLVM LTO builds
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Sathvika Vasireddy
 <sv@linux.ibm.com>, Russell Currey <ruscur@russell.cc>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>
References: <20220429064547.2334280-1-aik@ozlabs.ru>
 <CAKwvOdmFhua9b4=DS4QYJmKg=0kT3CtEjXgfo8fnifU2t-ttPQ@mail.gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <CAKwvOdmFhua9b4=DS4QYJmKg=0kT3CtEjXgfo8fnifU2t-ttPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/4/22 07:24, Nick Desaulniers wrote:
> On Thu, Apr 28, 2022 at 11:46 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
>> index b66dd6f775a4..5b783bd51260 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -476,9 +476,11 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
>>                  .if IHSRR_IF_HVMODE
>>                  BEGIN_FTR_SECTION
>>                  bne     masked_Hinterrupt
>> +               b       4f
>>                  FTR_SECTION_ELSE
> 
> Do you need to have the ELSE even if there's nothing in it; should it
> have a nop?  The rest of the assembler changes LGTM, but withholding
> RB tag until we have Kconfig dependencies in better shape.


The FTR patcher will add the necessary amount of "nop"s there and 
dropping "FTR_SECTION_ELSE" breaks the build as it does some 
"pushsection" magic.


> 
>> -               bne     masked_interrupt
>>                  ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
>> +               bne     masked_interrupt
>> +4:
>>                  .elseif IHSRR
>>                  bne     masked_Hinterrupt
>>                  .else
> 

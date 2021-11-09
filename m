Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4672C68
	for <llvm@lists.linux.dev>; Tue,  9 Nov 2021 00:05:35 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id m26so17662570pff.3
        for <llvm@lists.linux.dev>; Mon, 08 Nov 2021 16:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jz2KzTNbXrHHsy+Pm9sqGOU2Ds+KEEkeTlq7Y20EBzg=;
        b=gmzpWCOl+6r+T6HSQ4AzKgWJcY5HnGQT0kvInRVUX0/RrFlRdXAZAPFfNgAeJeoiK4
         dt7v56DTua9VcTLMAk2twgFjEHSLr0T+2LGNOiBMSKAYeLgAAAPJWQT6WzUx1aXhhwx8
         HcNHbL04PQ0PcT+4K1NxRvQxY+bmJhlEyjlkX0txQ2xrUUMIUDO1pBVOzRmh+/yRi/Pr
         pyjPEHblICl9sUUhQ7HHXvzP7wFJRzq7LS7Z2ylIZszCarhlzKCT8Gtgyvb713CB3wFo
         Ujdf+OIE6D5XevhfkmHbm8eNgM/wdoZuqYn9dUzqZP31M5dtkOMXsqULfK87ij4DDElX
         sJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jz2KzTNbXrHHsy+Pm9sqGOU2Ds+KEEkeTlq7Y20EBzg=;
        b=lpHS41+Xu71CxLxlmMDRLOnPbJsSnog2JsDgfb7hD2eMB+4NjOgp8WDeyKEYWf4QeI
         34lOMqvz+lF6xLW1CtKZQMWJw81IKBCoBrXKwGJ/A2A5tgKeGKk+hGnoch0ija0lUrZk
         PnD7tn2yvklQS5YryoU/3xI2uLQMLR3HAtd3gBr0RlQWODTu2k+40byk0lD/M2ktqCwf
         DOtIizioBqRiT5ZlweSuF0vzhbPuPGx271jysWesU+B6bU4WV0AveaIgPYdIsX1oCIvI
         zAgXKZ/y5Q4U7Cy9eJGGWlU/JQITz/GJo5M/DfrOADB0YaXzlRjz2tACw9CKYRG+X411
         aNhQ==
X-Gm-Message-State: AOAM531/zb0hi/UTzIAwpyDkdwprMulnAOwklMGoJ8cD0vwcXnVGXxPe
	0ynINg7GZQk02PW3e+AQMD8PSw==
X-Google-Smtp-Source: ABdhPJxLNiLslorRQE+S4xoihyO5pNo7Y+BC5j67+KLinvlVZEQNYi/pgtMpEF+0n4/9H7Jkg0JrEg==
X-Received: by 2002:a05:6a00:8d0:b0:44c:26e6:1c13 with SMTP id s16-20020a056a0008d000b0044c26e61c13mr3121962pfu.28.1636416334478;
        Mon, 08 Nov 2021 16:05:34 -0800 (PST)
Received: from google.com ([2620:15c:2ce:200:1205:53ca:e5c0:1a50])
        by smtp.gmail.com with ESMTPSA id k13sm17859826pfc.197.2021.11.08.16.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 16:05:33 -0800 (PST)
Date: Mon, 8 Nov 2021 16:05:31 -0800
From: Fangrui Song <maskray@google.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	clang-built-linux@googlegroups.com,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] x86/purgatory: remove -nostdlib compiler flag
Message-ID: <20211109000531.k23mgrfjn5tomevv@google.com>
References: <20211107162641.324688-1-masahiroy@kernel.org>
 <20211107162641.324688-2-masahiroy@kernel.org>
 <CAKwvOdmCaXAMvouD7bsWqmgOUxQ9vpdt3LY7qWpzTVm-2gddEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAKwvOdmCaXAMvouD7bsWqmgOUxQ9vpdt3LY7qWpzTVm-2gddEw@mail.gmail.com>

On 2021-11-08, Nick Desaulniers wrote:
>On Sun, Nov 7, 2021 at 8:27 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> The -nostdlib option requests the compiler to not use the standard
>> system startup files or libraries when linking. It is effective only
>> when $(CC) is used as a linker driver.
>
>Is that right? ld.lld recognizes --nostdlib and has --help text for it.

GCC/Clang driver -nostdlib != ld.bfd/ld.lld -nostdlib.

ld.lld -nostdlib just ignores SEARCH_DIR in a linker script.
I think ld.bfd's -nostdlib is more complex than that which also has
something to do with its internal linker script location.
Anyway, getting of the obscure ld -nostdlib is a good idea.

>>
>> $(LD) is directly used for linking purgatory.{ro,chk} here, hence
>> -nostdlib is unneeded.
>>
>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>> ---
>>
>>  arch/x86/purgatory/Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
>> index 95ea17a9d20c..ae53d54d7959 100644
>> --- a/arch/x86/purgatory/Makefile
>> +++ b/arch/x86/purgatory/Makefile
>> @@ -16,7 +16,7 @@ CFLAGS_sha256.o := -D__DISABLE_EXPORTS
>>
>>  # When linking purgatory.ro with -r unresolved symbols are not checked,
>>  # also link a purgatory.chk binary without -r to check for unresolved symbols.
>> -PURGATORY_LDFLAGS := -e purgatory_start -nostdlib -z nodefaultlib
>> +PURGATORY_LDFLAGS := -e purgatory_start -z nodefaultlib
>>  LDFLAGS_purgatory.ro := -r $(PURGATORY_LDFLAGS)
>>  LDFLAGS_purgatory.chk := $(PURGATORY_LDFLAGS)
>>  targets += purgatory.ro purgatory.chk
>> --
>> 2.30.2
>
>-- 
>Thanks,
>~Nick Desaulniers

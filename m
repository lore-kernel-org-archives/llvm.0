Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B012919
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 08:50:20 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id v5-20020a17090a4ec500b001b8b702df57so11795123pjl.2
        for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 00:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b7z6iiw22lnHjci/Ii1/zt223km1527nVd9KogEQtMU=;
        b=seeuPptDfkero5sztHjnfTdR7kAX0RDQ+GXKIYPmD9/YMJP1s/q1+WUrOEvfXGR7S0
         2KDZBfbuc6AyrLHQr5yV8jEBMmXJXCcdZ5N6HivQXxMR5W6FVV5diWMQMLAIxpEhlG2M
         iY/M6jiEV7sn40uD+OfH0H7ZQiTGEqUek1GmoMXA9kc/fF7hsXGbhWqjVNgPvZJjifQA
         DlR8sjSQC5xn6p3QCtM9E8bfCsH6azPSSjjpUQD6UxKusGPR9G+UzqQ+OyI26qUJS5KO
         LaHkIN1dwzN66kfSzZnRnOUFkEa1mF6Raq1psC4+zvSNWD5cGF1C7c5lVCX4nCHaf22N
         dKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b7z6iiw22lnHjci/Ii1/zt223km1527nVd9KogEQtMU=;
        b=x8Gisae9DjOhkX3rImfUDOVe2l+IbMpS02raziB5VA69DELCQWfwjjtC9MjcwEr+GJ
         SaM5rlbHlhYSLdE+BxOVdorzpIkQ1q/rO8TukWb7rTTvdctZE3zvOEQNeTHST9LOnFZH
         CmmYyx9vvKEIWGhSyqaJXsJkI2vYE+Y50QeQWTmazQbz1reUfHn4NF++GYJ1QAkAsWqS
         XYL8nprvvI4/wKhJTybrLw2pC4Sh9gWPDE5nO1auxqhCS8FMI6U7PfkSyUolH6LvYsiK
         gpWTF1RtVhwhOyxqY6VR6GZp/jPKY02f6g9ZbfAEAtjkfy4UCBxvoP0mOoy0XXl6bQkr
         61CA==
X-Gm-Message-State: AOAM5322PvTuiotckCxWO1zXJNgX0dCSVP1ULesMEew4bDjDWTZlpkjE
	aEB1AkCw+wXUF13uPMrgjktneA==
X-Google-Smtp-Source: ABdhPJwpYaB42zV9cx7WtkoPcQKhcNvCEW0vB7/C4F6IE0jCZlGR4uQYV9WGq9VayBg64TbURiE0aQ==
X-Received: by 2002:a17:903:31cd:b0:14d:bb40:2a17 with SMTP id v13-20020a17090331cd00b0014dbb402a17mr6448398ple.1.1645174219918;
        Fri, 18 Feb 2022 00:50:19 -0800 (PST)
Received: from google.com ([2620:15c:2ce:200:bdb7:3728:9760:87c])
        by smtp.gmail.com with ESMTPSA id d16sm2192602pfj.1.2022.02.18.00.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 00:50:19 -0800 (PST)
Date: Fri, 18 Feb 2022 00:50:16 -0800
From: Fangrui Song <maskray@google.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH] arm64 module: remove (NOLOAD)
Message-ID: <20220218085016.jv4qcfaxav5fxhrs@google.com>
References: <20220218081209.354383-1-maskray@google.com>
 <CAMj1kXGZuOWOPEHv0YSM4GseG2PnTgS8mSLXQ+imo-TN7MmvaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAMj1kXGZuOWOPEHv0YSM4GseG2PnTgS8mSLXQ+imo-TN7MmvaQ@mail.gmail.com>

On 2022-02-18, Ard Biesheuvel wrote:
>On Fri, 18 Feb 2022 at 09:12, Fangrui Song <maskray@google.com> wrote:
>>
>> On ELF, (NOLOAD) sets the section type to SHT_NOBITS[1]. It is conceptually
>> inappropriate for .plt and .text.* sections which are always
>> SHT_PROGBITS.
>>
>> In GNU ld, if PLT entries are needed, .plt will be SHT_PROGBITS anyway
>> and (NOLOAD) will be essentially ignored. In ld.lld, since
>> https://reviews.llvm.org/D118840 ("[ELF] Support (TYPE=<value>) to
>> customize the output section type"), ld.lld will report a `section type
>> mismatch` error. Just remove (NOLOAD) to fix the error.
>>
>> [1] https://lld.llvm.org/ELF/linker_script.html As of today, "The
>> section should be marked as not loadable" on
>> https://sourceware.org/binutils/docs/ld/Output-Section-Type.html is
>> outdated for ELF.
>
>This patch lacks a SOB line.
>
>With one added,
>
>Acked-by: Ard Biesheuvel <ardb@kernel.org>

Ah, yes. Sorry, I haven't sent a kernel patch for a while...

Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Fangrui Song <maskray@google.com>
Acked-by: Ard Biesheuvel <ardb@kernel.org>

>> ---
>>  arch/arm64/include/asm/module.lds.h | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm/module.lds.h
>> index a11ccadd47d2..094701ec5500 100644
>> --- a/arch/arm64/include/asm/module.lds.h
>> +++ b/arch/arm64/include/asm/module.lds.h
>> @@ -1,8 +1,8 @@
>>  SECTIONS {
>>  #ifdef CONFIG_ARM64_MODULE_PLTS
>> -       .plt 0 (NOLOAD) : { BYTE(0) }
>> -       .init.plt 0 (NOLOAD) : { BYTE(0) }
>> -       .text.ftrace_trampoline 0 (NOLOAD) : { BYTE(0) }
>> +       .plt 0 : { BYTE(0) }
>> +       .init.plt 0 : { BYTE(0) }
>> +       .text.ftrace_trampoline 0 : { BYTE(0) }
>>  #endif
>>
>>  #ifdef CONFIG_KASAN_SW_TAGS
>> --
>> 2.35.1.265.g69c8d7142f-goog
>>

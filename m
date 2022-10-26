Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95709187D
	for <llvm@lists.linux.dev>; Wed, 26 Oct 2022 13:48:34 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id jo13so10508033plb.13
        for <llvm@lists.linux.dev>; Wed, 26 Oct 2022 06:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nj0TM5bO6CiXLXopRt7KzsGmWpYwV3SAG3uAWIAdKIc=;
        b=dEBWnydZB2sT2o4/CNd3AiCHQ6mNtjfUnxKUBT1v8gi915eWHCK4I81u51BH1455ei
         gaScWVm9I5F09VFuiQXdiaM940JpxXIKNrzST5eolWuK4RPmIWSzsQdMAR0ic+3Wohln
         9B0iDTimJV6LFwnANCXHhmoq10odAvZBvvOTaG+n3Jm/1lSnit96Y1UWxEPiYvL44zb9
         0SOT1icgGL3TSVwBZbK+8+NQdWk77UeFqXrtYnUTcw1JkxJzqssHPPFcHq2oHxwIG0ey
         ibFXRADG3hIWxSifwMHPrkcxFPp5Vr1CoFBQVLaAWea+9fbP+SyqLiJ/J436uUcxtXgG
         HWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nj0TM5bO6CiXLXopRt7KzsGmWpYwV3SAG3uAWIAdKIc=;
        b=YaeFDHlS8kzDNaIvnMqSnHGFeY2LDQk+xikYrdEnqferSG9Xzt94YW4IkwaHTaGH3/
         F3PiAm22WuUrkKQSszo0HGD01aVdNCNf0CBnm5OuNaz39qRbAOj6MLrngfOJ94hEitCD
         09ZF3nsN/zA4EvUQba34mGWqXnDZJtiAzlr8EZJb3iSlBjmT3jtZxOaqkLHcStZUjq8v
         sQuJluEd/PuevuzIXMZNayRdFTDGhOA/P7hbwpayqf0vqi/Q5wq64bSvC5+Es9yfpATe
         MS5iaLUsICcpNizISWZJhs1Z0/s/Bl5ynfYYSqEDYhgEsm0ZKBVvniJoh4NsDXm1uyoB
         47vQ==
X-Gm-Message-State: ACrzQf0SFX6n0K5wdAVyMFkN69EZ41p+7AmnB/AH9NOqiLNqb1Be4xi9
	lph59YYSy8lHR82G8MY4fLa4zw==
X-Google-Smtp-Source: AMsMyM6KCvcn+mv8QO+c1gSYr3stSYSsi3urpCrKbYoOp9HE9VUWT2Q/k4hrndAulZM/iqYiSab0Kg==
X-Received: by 2002:a17:902:b90b:b0:186:8a4d:d4b7 with SMTP id bf11-20020a170902b90b00b001868a4dd4b7mr22604604plb.129.1666792113800;
        Wed, 26 Oct 2022 06:48:33 -0700 (PDT)
Received: from localhost ([135.180.227.132])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b00186c37270f6sm2659038pll.24.2022.10.26.06.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 06:48:32 -0700 (PDT)
Date: Wed, 26 Oct 2022 06:48:32 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Oct 2022 23:50:10 PDT (-0700)
Subject:     Re: [PATCH 0/2] (attempt to) Fix RISC-V toolchain extension support detection
In-Reply-To: <20221006173520.1785507-1-conor@kernel.org>
CC: nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
  conor.dooley@microchip.com, daolu@rivosinc.com, heiko@sntech.de, guoren@kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-eb49b867-c5d3-45f9-904c-1726b1ce6158@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 06 Oct 2022 10:35:19 PDT (-0700), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Hey,
> This came up due to a report from Kevin @ kernel-ci, who had been
> running a mixed configuration of GNU binutils and clang. Their compiler
> was relatively recent & supports Zicbom but binutils @ 2.35.2 did not.
>
> Our current checks for extension support only cover the compiler, but it
> appears to me that we need to check both the compiler & linker support
> in case of "pot-luck" configurations that mix different versions of
> LD,AS,CC etc.
>
> Linker support does not seem possible to actually check, since the ISA
> string is emitted into the object files - so I put in version checks for
> that. The checks have gotten a bit ugly since 32 & 64 bit support need
> to be checked independently but ahh well.
>
> As I was going, I fell into the trap of there being duplicated checks
> for CC support in both the Makefile and Kconfig, so as part of renaming
> the Kconfig symbol to TOOLCHAIN_HAS_FOO, I dropped the extra checks in
> the Makefile. This has the added advantage of the TOOLCHAIN_HAS_FOO
> symbol for Zihintpause appearing in .config.
>
> I pushed out a version of this that specificly checked for assember
> support for LKP to test & it looked /okay/ - but I did some more testing
> today and realised that this is redudant & have since dropped the as
> check.
>
> I tested locally with a fair few different combinations, to try and
> cover each of AS, LD, CC missing support for the extension.
>
> The one that I am left wondering about is Zicsr/Zifencei. Our Makefile
> has:
>
>> # Newer binutils versions default to ISA spec version 20191213 which moves some
>> # instructions from the I extension to the Zicsr and Zifencei extensions.
>> toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
>> riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
>
> I'd like to also move that one to Kconfig rather than the Makefile so
> that, again, it shows up in .config etc. But as Zicsr/Zifencei do not
> appear to be emitted into the object files it's not a fix and can be a
> follow-on patch if my approach here is not entirely off-the-wall.

This is actually a different case: for Zicbom and Zihintpause the 
instructions were added to the toolchain at the same time the extensions 
were, for Zifencei and Zicsr the toolchain had the instructions before 
the extension was defined (as they were in previous base ISAs).  So the 
assembler always supports "fence.i", it's just a question of whether it 
also needs another extension in march.

I'm not opposed to adding a Kconfig for it, but it's a slightly 
different thing and I'm not sure the Kconfig really helps any because 
none of the kernel sources need to understand the "the assembler doesn't 
support the 'fence.i' instruction" case.

> I am not 100% on the LD/LLD versions that I picked, I went off of a
> `git branch -a --contains` of the first commits I found that with
> mention of the extension. Please scream if I got it wrong, I'm not
> overly familar with where to find this sort of info for the toolchains.

This LD version check is for the ISA string mismatches between objects?  
IIRC we stopped failing on those in 2.38, from that point on we just 
guess at a mix and allow linking anyway (largely because of that fence.i 
stuff).

>
> Thanks,
> Conor.
>
> Conor Dooley (2):
>   riscv: fix detection of toolchain Zicbom support
>   riscv: fix detection of toolchain Zihintpause support
>
>  arch/riscv/Kconfig                      | 17 +++++++++++++----
>  arch/riscv/Makefile                     |  6 ++----
>  arch/riscv/include/asm/vdso/processor.h |  2 +-
>  3 files changed, 16 insertions(+), 9 deletions(-)

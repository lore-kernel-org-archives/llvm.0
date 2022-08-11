Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9008D198
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 12:35:19 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id d65-20020a17090a6f4700b001f303a97b14so4985057pjk.1
        for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 05:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=5w/KsvKeDQNB0nymQYwJO1nJhxYwskiJAdbQrcwrrws=;
        b=Ql5TzwacX39R2Jd3F8nwCUw2umD0dCX30wm+NAMytxnOiFhjI29r2fh4KHIe8FbJA5
         sYz4E0PDwIJi2YWeIZGBi2iV+Kzj0DYdKG+N+MawTLJhdefhUsUcV0ClrlBQcf1+CfbC
         BhOcyvxJBYHt9jAR2olKMbE/rOdvH8kuymWFoAFCIdQ3O3rDei5TMFoybUL9zX6OoiC6
         zSf7+O9WlFtOrgZpMoO4efq2+dLIYo4s6604mDZQ2A9zMsGb4t2OqoPcdUh7yyzAL4B5
         4m2ConxAm3a5QZ2B5OUxbrnEPhFZedReRM5K3lF3hX3flUt9J1LLpTzaRYKOp4znfWwG
         qROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=5w/KsvKeDQNB0nymQYwJO1nJhxYwskiJAdbQrcwrrws=;
        b=QUAcUanRFC6KqWhpusFkV91L46FE7ZTcMoH3Fiv+Oo+yqtYZruCMcL9wg8/G61TGxj
         Nthckm3VYEcydKp558mVuJGqAxfcADdzcwg3txwEdoR3xr+4SqK+lrhzt20T7CVqD6S2
         b1xHnEohst9/Us1zupuaqHw3OM3DtNlxG+I6vD82ya81L2I6o9gYC3EdO1Cz9u5ZbZeZ
         1e0r5c/yUbZ12hllA2HSw1ifVpoyXIflr5KsGHQ5aSNUNog7LA425zS4qLeuiCG4GXYY
         wwFTficBVcSxJp+5/8Gcp83K65Latwisuq5M/WTa/m6tbzRYla/6jkTmVMKvuBrHcQdF
         jXAQ==
X-Gm-Message-State: ACgBeo1Zk6nyfERQDP5TbMFfvjapZkkiewhsOGk2RR4fT7JqsFFao00d
	BwzUpgKt2Eo9WBqJNfNQE9Cnn7NVY/7lXS7WYmCzqg==
X-Google-Smtp-Source: AA6agR7mxh4xlrHaACk8ACRbYeCnushTJX/xovc1OX340+zRR7qqgn2gIIKem8n7+e/FLEibg6QqXPbdXVxgjeL2ts4=
X-Received: by 2002:a17:90b:3805:b0:1f4:ebfe:558b with SMTP id
 mq5-20020a17090b380500b001f4ebfe558bmr8709936pjb.48.1660221318988; Thu, 11
 Aug 2022 05:35:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220810114318.3220630-1-anders.roxell@linaro.org> <87fsi3ce28.fsf@mpe.ellerman.id.au>
In-Reply-To: <87fsi3ce28.fsf@mpe.ellerman.id.au>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 11 Aug 2022 14:35:08 +0200
Message-ID: <CADYN=9L_Sgd8HTkhtM5t0eoN7ict8zX6fRCJsVvYcgp9H_QsSg@mail.gmail.com>
Subject: Re: [PATCHv3, resend] powerpc: mm: radix_tlb: rearrange the if-else block
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: nathan@kernel.org, ndesaulniers@google.com, llvm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Aug 2022 at 11:41, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Anders Roxell <anders.roxell@linaro.org> writes:
> > Clang warns:
> >
> > arch/powerpc/mm/book3s64/radix_tlb.c:1191:23: error: variable 'hstart' is uninitialized when used here [-Werror,-Wuninitialized]
> >                                 __tlbiel_va_range(hstart, hend, pid,
> >                                                   ^~~~~~
> > arch/powerpc/mm/book3s64/radix_tlb.c:1175:23: note: initialize the variable 'hstart' to silence this warning
> >                 unsigned long hstart, hend;
> >                                     ^
> >                                      = 0
> > arch/powerpc/mm/book3s64/radix_tlb.c:1191:31: error: variable 'hend' is uninitialized when used here [-Werror,-Wuninitialized]
> >                                 __tlbiel_va_range(hstart, hend, pid,
> >                                                           ^~~~
> > arch/powerpc/mm/book3s64/radix_tlb.c:1175:29: note: initialize the variable 'hend' to silence this warning
> >                 unsigned long hstart, hend;
> >                                           ^
> >                                            = 0
> > 2 errors generated.
>
> Which version & config are you building?

clang-13, clang-14 and clang-nightly, configs are cell_defconfig and
maple_defconfig

I'm building with tuxmake [1] like this:
$ tuxmake --runtime podman --target-arch powerpc --toolchain clang-14
--kconfig cell_defconfig

Cheers,
Anders
[1] https://tuxmake.org/

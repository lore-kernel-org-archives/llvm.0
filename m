Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0633A134A1
	for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 19:03:38 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3a7d7de894bso132570b6e.3
        for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 12:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692903818; x=1693508618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIOxOAbASEK1ExaxZknXwWWIX7BvuBO6qbXSqSkkplM=;
        b=in7SDO1nCpMs1pW6kZW2GONP33S6cr0Tzr+D5zoGf9HonygP8+Ho7kWZjEoOKA6s4g
         d45VlJ3vVhh4ACl/LqFkXaO6QnczQHQEIYYLcD8RA32+ejXBnWfwneKIsA51JyVJQXSx
         E13fyTljsypiqKlxyoOqjClb4wwL/+i2nmGAsnEFF51vn2E1vWxKyb8skn90GlH869CV
         zcxOC0fDSVNKJlZcGfzEkSIPtie6yKijQyiP9J6zUeRMAOhxKYaa6NaN36Ow6+1w8FAH
         oTemG/zutFjoDyqFV7AZLpo6aCZpB5ZtrdBkImv4isq7MqSEQZZriBzlnXmpSqan0vMF
         7zFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692903818; x=1693508618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIOxOAbASEK1ExaxZknXwWWIX7BvuBO6qbXSqSkkplM=;
        b=hq8/nny/vSfwTT0cFN3MWQtfRpb65zJbqStW7dE68Eotn169AWjI9+2QAf7QpGYCqO
         UCYdAPF+cgtXDBBITjRJ/r2KT1bS47EmgK21ERJ6qKW1JfphAlUbfhuyg+xLP/mbbbvB
         txdvklIg2RMSUif1no/KIJ8SAQmr7tFKT+RXZusvtLGLeneZz8ukun8NxhCUB5EcqxmD
         7No8v8O2B7UQ3fq0BAUdMrXHeFOPDPYCQWkt8HgEC3h4djx4tZgxyP268fewhK2yH2rQ
         ceYcPEGwbbVskh0/2+QyGkFp5uDqPDP236CASvQ/n5Ss6Emx8LTW/J/nlpeqe2Mm+gjH
         d/dg==
X-Gm-Message-State: AOJu0YzMVQmlq9yQ5865lg7+YDVqqG/jNFkRqi/FmwSDYScvqAppMSMX
	BmKhoJkgt/xDPly1uunUubGqcy2MAKCcJYD4UYtpbg==
X-Google-Smtp-Source: AGHT+IEXfuxs+RNxF7LKh6GmsWDesiSbOR2nqSO8VUt1beRy2Mdk4QadJhGLc+bzDHcxONvRodJuItf2jppA6SS8Bts=
X-Received: by 2002:a05:6808:10cd:b0:3a7:458e:3df4 with SMTP id
 s13-20020a05680810cd00b003a7458e3df4mr600019ois.56.1692903817600; Thu, 24 Aug
 2023 12:03:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230815203442.1608773-8-samitolvanen@google.com>
 <20230815203442.1608773-10-samitolvanen@google.com> <d3696b2a-3d21-4ab6-8cef-20b8ee21742f@rivosinc.com>
In-Reply-To: <d3696b2a-3d21-4ab6-8cef-20b8ee21742f@rivosinc.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 24 Aug 2023 12:03:00 -0700
Message-ID: <CABCJKud+24TGRX7b8Tb83HdWApC83adY=o2JpejRTHA4nkfpMg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] riscv: Deduplicate IRQ stack switching
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, 
	Guo Ren <guoren@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

On Thu, Aug 24, 2023 at 1:12=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> Some defines for stack frame offsets could be added in asm-offsets for
> the offsets:
>
>         DEFINE(STACKFRAME_SIZE_ON_STACK, ALIGN(sizeof(struct stackframe),
> STACK_ALIGN));
>         OFFSET(STACKFRAME_FP, stackframe, fp);
>         OFFSET(STACKFRAME_RA, stackframe, ra);
>
> And you can probably increment the stack at once (saving two addi in
> prologue/epilogue) for both RA and FP and reuse the asm-offsets defines:
>
>         addi    sp, sp, -STACKFRAME_SIZE_ON_STACK
>         REG_S   ra, STACKFRAME_RA(sp)
>         REG_S   s0, STACKFRAME_FP(sp)
>         addi    s0, sp, STACKFRAME_SIZE_ON_STACK

Thanks for taking a look!

I just copied the existing inline assembly here, but I do agree that
defining stack frame offsets and avoiding the extra addis is a cleaner
approach. I'll change this in v3.

Sami

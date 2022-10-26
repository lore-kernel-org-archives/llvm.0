Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18591C03
	for <llvm@lists.linux.dev>; Wed, 26 Oct 2022 13:48:58 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id y20so7166201uao.8
        for <llvm@lists.linux.dev>; Wed, 26 Oct 2022 06:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKFRv0zM9kMluPQ3+hHI7EIzkLtxGEc8lwOlSBqM7+8=;
        b=RPvo9GZ9F6TwIw7A0fjA6QSO9W3jcPv50/4lWroYKxeuCqonf/4q/oMdH6lzyQjbkR
         lcnpvxPLCNsCxJgGc34bD7+VVsaPhHFSMd26Go+hj1TtvQFd4s6yxPzn0BK8PUGFAFVj
         rrDI/HWdcXi90GzguqjpqrQsWonoNZR4iLg0m0IypxjIPcoRig5a2Sb1XFSBxMZ5EaW8
         KqIajKKdXwH8UhjdkhHpocjl8bOAMvozKyOozJ3U0Ux8rh8BlK5WRraxays1gWVtFnCt
         GvkCrX2lsF+ctvRabev0+wy3UJlze/MesBoJ2zpUb03SVjHKFRruOD3qHhLA1Ej/L+Rv
         NzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKFRv0zM9kMluPQ3+hHI7EIzkLtxGEc8lwOlSBqM7+8=;
        b=xEcJYnsI470fvp7R0WuciOZp2G/t70J5s+7+9b75j/4RDtflv+StVOCw6H6I+UmvhZ
         VzMa6ZmvIkF4bLAWLxJHBOgE9zzvIOHnq+qWt5ZYVRNBETaCxz7lA1Uh3FoD2P6Mdldo
         kdF4G3Ekp70mrqstt0T518ZC0TCG+9MlXhO64Fi1xPsNXW7yxfDn15/+hKAM/S5mj1Oe
         LFcxKD9bHdlZB/mpzvsZHhKiFnnmMC+zF5N1rhjrjp9GE2nBYAlbtf2WR7wVNhhAkOx9
         Jugplv7WNT/4PCwz16XM+bNg008IxUZPt40LQDcxNtUuPKLEAT8pWhp4utSVqPPRvutl
         buPA==
X-Gm-Message-State: ACrzQf2T0wRc06me3cqjaNX7+6x+1UhiVmBM6tnMtAx9xErEK36sYD5w
	LUqSG9gXWHX3Qp8anWx+9LkOOSQJjc6TDg==
X-Google-Smtp-Source: AMsMyM4Iwzkt6Srcrk4gx6gtg+JjdQxqOxgx2b6dNxZl9uzmX1WjFH0HKC1etqmNAoTPp+5pkSjkug==
X-Received: by 2002:a17:903:1207:b0:185:4042:23d2 with SMTP id l7-20020a170903120700b00185404223d2mr43403332plh.143.1666792127247;
        Wed, 26 Oct 2022 06:48:47 -0700 (PDT)
Received: from localhost ([135.180.227.132])
        by smtp.gmail.com with ESMTPSA id i129-20020a639d87000000b0046ae5cfc3d5sm2790473pgd.61.2022.10.26.06.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 06:48:46 -0700 (PDT)
In-Reply-To: <20221008145437.491-1-jszhang@kernel.org>
References: <20221008145437.491-1-jszhang@kernel.org>
Subject: Re: [PATCH v2] riscv: jump_label: mark arguments as const to satisfy asm constraints
Message-Id: <166679181922.18979.10448305327462266940.b4-ty@rivosinc.com>
Date: Wed, 26 Oct 2022 06:43:39 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-36ce3
Cc: linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>,
  llvm@lists.linux.dev, Andrew Jones <ajones@ventanamicro.com>, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Tom Rix <trix@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
  Steven Rostedt <rostedt@goodmis.org>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
  Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>,
  Nick Desaulniers <ndesaulniers@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
  Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>

On Sat, 8 Oct 2022 22:54:37 +0800, Jisheng Zhang wrote:
> Samuel reported that the static branch usage in cpu_relax() breaks
> building with CONFIG_CC_OPTIMIZE_FOR_SIZE:
> 
> In file included from <command-line>:
> ./arch/riscv/include/asm/jump_label.h: In function 'cpu_relax':
> ././include/linux/compiler_types.h:285:33: warning: 'asm' operand 0
> probably does not match constraints
>   285 | #define asm_volatile_goto(x...) asm goto(x)
>       |                                 ^~~
> ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro
> 'asm_volatile_goto'
>    41 |         asm_volatile_goto(
>       |         ^~~~~~~~~~~~~~~~~
> ././include/linux/compiler_types.h:285:33: error: impossible constraint
> in 'asm'
>   285 | #define asm_volatile_goto(x...) asm goto(x)
>       |                                 ^~~
> ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro
> 'asm_volatile_goto'
>    41 |         asm_volatile_goto(
>       |         ^~~~~~~~~~~~~~~~~
> make[1]: *** [scripts/Makefile.build:249:
> arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
> make: *** [arch/riscv/Makefile:128: vdso_prepare] Error 2
> 
> [...]

Applied, thanks!

[1/1] riscv: jump_label: mark arguments as const to satisfy asm constraints
      commit: 89fd4a1df829187d4d35f6a520cc531de622e6f0

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0BC1799E
	for <llvm@lists.linux.dev>; Thu, 21 Sep 2023 20:07:21 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-415155b2796so10451cf.1
        for <llvm@lists.linux.dev>; Thu, 21 Sep 2023 13:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695326840; x=1695931640; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kr0HDINOfnSGJvR8CBUjdsC1w8o7oheg4iDN7h3/HXE=;
        b=ZTM2QMxFYr199AEsgYG8AQeQG2f6LAt5hXOTjyiueieBD45T9178FIMgW9WOkiLL96
         tbKmsVmoJEMC1HJfad4H1j31B6M7ZaYf2qwGaGox/quTDOuAna2p3XB7V6zmhRZr40tH
         A/MrLns10yCvDFLaWQeesbgmQLSfGoJQD+fidyp7dmdlxAg3W04ltsLtzkc/5udYaazp
         Ijzc4fhHRXlGjjmN4vGslw2kd5CnOmHI1m2IAJO16Lnn7AmZ+rTx/w6K+90vWcfI/qB7
         cZM0+WtxGBrvP7nOIwWd5htCwyiRa2OzTs3amEo2R2tE5+xIKY/eD519bD+IfoPAYama
         6uoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695326840; x=1695931640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kr0HDINOfnSGJvR8CBUjdsC1w8o7oheg4iDN7h3/HXE=;
        b=NH4oOy2/SmIpm41NZIrTUdaWL2NMhQTqWEGiuT6w/weOOuWkemaSRoOocrl815ORuX
         Abc59XveFvMHcm+V8barutuEb+bSLA8aeFcGKqF3b1IDjU3OJEK2D+fVee9zv92Z4PFP
         sQe6HUAyon2i/TvJ/JQV0k4CZgcPXYL3hzH4U4OmmOu/oMLralFKgpfXQr55d7klyNkT
         8PJRvl8caddfNzqWxeZKBqe8lOaPkmbh3gbwJ9wNwXg+9cCmKQdVQ6lvLQO8U+EMRVV5
         xkCdkD6za8hSA/36lfLl39DB0pcLUanNvv/1kiTFy6J9xvXEvgEdG0S0/G8IALf3W7oQ
         fzRw==
X-Gm-Message-State: AOJu0YyZUz5D0pW0FexyfOdrfYjh+IrwAvgyXjA1PfcYQxaYnZHNCRVy
	7UPFsYAb0Y8kMDSfD5vs2Wn5qRchon4x6O55pg3eFw==
X-Google-Smtp-Source: AGHT+IH0gCAT1sAA8hGaX5ATILmSw1EKt7QL2mCymfDxgFKVwgUruuWjFLtvCDR/IJe5MiaSCavn7dCTsUM4ZMrt1Lc=
X-Received: by 2002:a05:622a:1aa9:b0:40f:d1f4:aa58 with SMTP id
 s41-20020a05622a1aa900b0040fd1f4aa58mr14332qtc.8.1695326840269; Thu, 21 Sep
 2023 13:07:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230920001728.1439947-1-maskray@google.com> <20230921072655.GA14803@noisy.programming.kicks-ass.net>
 <CAFP8O3+_8H+fetuoqwwcfqJLNtYmpsWZhY2arD7HMuPmcN+X_g@mail.gmail.com>
 <20230921153537.GG14803@noisy.programming.kicks-ass.net> <CAFP8O3K6Lgxe=Res9d2GKipRYdXqzv3wa_0PLtDcyn7g7H=z5w@mail.gmail.com>
 <20230921171900.GB29413@noisy.programming.kicks-ass.net> <CAFP8O3JpkWTXnxYxa45uANNMQ34g2VUPnfj7-oWn3oq9egUb-A@mail.gmail.com>
 <20230921192253.GA39480@noisy.programming.kicks-ass.net>
In-Reply-To: <20230921192253.GA39480@noisy.programming.kicks-ass.net>
From: Fangrui Song <maskray@google.com>
Date: Thu, 21 Sep 2023 13:07:09 -0700
Message-ID: <CAFP8O3Kmep3zXNk3=s5qpMQ3-TnfEYxeCkLi3e-DTqQc=Fs4TQ@mail.gmail.com>
Subject: Re: [PATCH] x86/speculation, objtool: Use absolute relocations for annotations
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 12:22=E2=80=AFPM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Thu, Sep 21, 2023 at 10:36:27AM -0700, Fangrui Song wrote:
>
> > Well, only if the clever assembler doesn't support 32-bit absolute
> > relocation for a 64-bit architecture.
> > I don't know such an architecture. In addition, as long as the
> > architecture intends to support DWARF32, it has to support 32-bit
> > absolute relocations for a 64-bit architecture.
>
> Ooh... my bad. For some reason I thought that absolute meant native word
> size. But you already mentioned R_X86_64_32 (and I failed to check) and
> that is indeed an absolute (S+A) relocation of 32bit (dword) size.
>
> And apparently we also have R_X64_64_16 and R_X86_64_8, which would even
> allow something like:
>
> #define OBJTOOL_ANNOTATE(type)                          \
>         "999:\n\t"                                      \
>         ".pushsection .discard.objtool_annotate\n\t"    \
>         ".byte 999b\n\t"                                \
>         ".byte " __stringify(type) "\n\t"               \
>         ".popsection\n\t"
>
> And since we only read the relocation and don't care for the actual
> result that would actually work just fine.
>
> Anyway, thanks for bearing with me.
>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Thanks!  I assume that the patch can be picked up without me doing anything=
 :)

Yes, x86 also supports 1-byte and 2-byte absolute relocation types,
which are missing from some other architectures.
If we want to optimize for RELA, we can use R_*_NONE by utilizing
`.reloc ., BFD_RELOC_NONE, .text.foo` (as mentioned in the commit
message).
(binutils 2.26 https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;=
h=3D740bdc67c057ee8012327420848eb134e1db4211;
I added the support to most LLVM targets in 2021).

However, this is just 4 byte per entry difference compared with the
large sizeof(Elf{32,64}_Rel), so not worth the trouble:)

--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF

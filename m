Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8611C10977
	for <llvm@lists.linux.dev>; Mon,  7 Aug 2023 15:27:40 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-76cb0d2fc9cso366256985a.2
        for <llvm@lists.linux.dev>; Mon, 07 Aug 2023 08:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691422059; x=1692026859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUwZAwY3w/DCovXOhpFaYpG5BJu/scVYyvQE2nkhLjk=;
        b=ZWONZDbN4DLl+GxuPDPb/kn5iUAK3wkJvTpyZc/I7t8nLVCDHq2ZUaCzaEQuUmk0Z3
         FFH5Jy/FCYU7NiHCsaWnsZTfgKzvSEgCW+jdZI978Hx3OIc+KK8BVtHtOAvxkmqsMAO+
         +BvlMicPvzgF/8u7YljscTAnlgLUHcQ8qY9ar/ixqFNLXc7BiPGedFRdgbGnXtY8aTOU
         sQ83vU/dSwG3USoQSXU6I1e4FCZvhGpYR3DDEGMJ00z1P8XCjSc5JZa00wGMNlQlKttO
         o2PoISTP8orIkHdyWKCib5MXsvGIo5oY8KQTKPPsPNLyS6LIxu8K+GCS4Qf45pyp750u
         VxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691422059; x=1692026859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUwZAwY3w/DCovXOhpFaYpG5BJu/scVYyvQE2nkhLjk=;
        b=O9braGgZNO0MVYYHa4pufkGZag+/TetJrRQlIGUMczUB95kvvPKwAwCNSa8xYBee1L
         /z/9JKDx+tiP21UGqC8+YoaRn+IAQZVNDCxH7n++T6WwHPczynkcRhaOVGsFl70ppUi9
         a8Et76lEW0W/n1CWtUUo2VFT96M3yUKkynSV3OLhroejhbR109CuNiqzXoOkoqzNgwQW
         +zVwHEfS6MU4ykc36+hR8WAK34YdLer96n2UAIrwSFrfaI8P4wgz8DIDqYvg7/cbMmf2
         FV5d4BIzflFV1JCt/1TDbfD76t8aCRwpvKlp6YImzhgvNjuqv4B94UOAHiS5AdwjW9sI
         4Gaw==
X-Gm-Message-State: AOJu0Yy4Dji90IXd3nOwtyMxHn8yJiPRuXOcDhoB418QwsimHtwgn+Il
	7GdBXh4VyjYhG5cEcSIUR9JH4B4JgwvxsSaq3dmobQ==
X-Google-Smtp-Source: AGHT+IGoaH+s4R0EmOFvCPGZkJiL5/BBp3MuHbjbOs5J/ajqWaKGRjUz2hwympLNGjtDR6ahbq+YlO+vvxuAv1fnkUU=
X-Received: by 2002:a05:6214:580b:b0:63d:36ab:93e6 with SMTP id
 mk11-20020a056214580b00b0063d36ab93e6mr9060294qvb.65.1691422059150; Mon, 07
 Aug 2023 08:27:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230804090621.400-1-elver@google.com> <87il9rgjvw.fsf@oldenburg.str.redhat.com>
In-Reply-To: <87il9rgjvw.fsf@oldenburg.str.redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Aug 2023 08:27:27 -0700
Message-ID: <CAKwvOdm7cTWmp-wAgePBQpa19=PLaYWh6WxJbNUcasSn87ecnw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] compiler_types: Introduce the Clang
 __preserve_most function attribute
To: Florian Weimer <fweimer@redhat.com>
Cc: Marco Elver <elver@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>, Guenter Roeck <linux@roeck-us.net>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Dmitry Vyukov <dvyukov@google.com>, Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-toolchains@vger.kernel.org, Jakub Jelinek <jakub@redhat.com>, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 7, 2023 at 4:41=E2=80=AFAM Florian Weimer <fweimer@redhat.com> =
wrote:
>
> * Marco Elver:
>
> > [1]: "On X86-64 and AArch64 targets, this attribute changes the calling
> > convention of a function. The preserve_most calling convention attempts
> > to make the code in the caller as unintrusive as possible. This
> > convention behaves identically to the C calling convention on how
> > arguments and return values are passed, but it uses a different set of
> > caller/callee-saved registers. This alleviates the burden of saving and
> > recovering a large register set before and after the call in the
> > caller."
> >
> > [1] https://clang.llvm.org/docs/AttributeReference.html#preserve-most
>
> You dropped the interesting part:
>
> | If the arguments are passed in callee-saved registers, then they will
> | be preserved by the callee across the call. This doesn=E2=80=99t apply =
for
> | values returned in callee-saved registers.
> |
> |  =C2=B7  On X86-64 the callee preserves all general purpose registers, =
except
> |     for R11. R11 can be used as a scratch register. Floating-point
> |     registers (XMMs/YMMs) are not preserved and need to be saved by the
> |     caller.
> |
> |  =C2=B7  On AArch64 the callee preserve all general purpose registers, =
except
> |     X0-X8 and X16-X18.
>
> Ideally, this would be documented in the respective psABI supplement.
> I filled in some gaps and filed:
>
>   Document the ABI for __preserve_most__ function calls
>   <https://gitlab.com/x86-psABIs/x86-64-ABI/-/merge_requests/45>
>
> Doesn't this change impact the kernel module ABI?
>
> I would really expect a check here
>
> > +#if __has_attribute(__preserve_most__)
> > +# define __preserve_most notrace __attribute__((__preserve_most__))
> > +#else
> > +# define __preserve_most
> > +#endif
>
> that this is not a compilation for a module.  Otherwise modules built
> with a compiler with __preserve_most__ attribute support are
> incompatible with kernels built with a compiler without that attribute.

Surely the Linux kernel has a stable ABI for modules right? Nah.
https://www.kernel.org/doc/Documentation/process/stable-api-nonsense.rst

>
> Thanks,
> Florian
>


--=20
Thanks,
~Nick Desaulniers

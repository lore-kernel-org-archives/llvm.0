Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65597A
	for <llvm@lists.linux.dev>; Mon,  8 Aug 2022 21:08:47 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id r4so12838802edi.8
        for <llvm@lists.linux.dev>; Mon, 08 Aug 2022 14:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=lv26Q3sNxfEifdTpne61U1pkeE4sDF6GrXRlpPg4PbU=;
        b=LEuzOqsKGBmJ9I+TFAOXTx5jZrMKvhNvc27x7c9WibTJn3ejHzbKIiP3uVAlx3xwYC
         k0Y6K/CFzU/4eefSL2CLYD2AAF9U816dVyBiD6KftXoBXJ9IFuGBBB5nIJ+1g/1rrLU1
         ER9CMr1EyMh1gtywDU+AMIlcocFVVxXErwWNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=lv26Q3sNxfEifdTpne61U1pkeE4sDF6GrXRlpPg4PbU=;
        b=ec5V6Mp5z2IdjR+r2zy6eSwcAT05XL8mm0X44+JuuKcnNLs/tPi4vUWtxvW9RIhywv
         VrGPHKuzIyO0QdXXqM08RCL2i5m8Ub56xrHfaBybk0okOSLAbRAuibvswMSDGVMurZ+z
         ++6PF/KSflQpYS/oIKOk5qWb61bqaXqhHa+A9S8T7VHzZF+90LO0ZN34QqZ50lvzhqPp
         +A+Sgxb8V/3RO0JcWBcwG15rSzf7kdfSBaDZALclCtxo9YGTIjM3f53MKZx/TBGacTSH
         0GPot1zgniQ5WXayB9A6IqM6sT2bayN4Y2xXNRsHHg5UvfoGD4Rl2ClL5kvN+k3MDe3c
         nAEg==
X-Gm-Message-State: ACgBeo2UcdjBllDJm7oDFiTUJ4KpTgnT249mjYWdaimQ4vmUs2i5t13k
	jj4U7SZlerarSIlU3E2dtvaRX7Fzcl+a4MOb
X-Google-Smtp-Source: AA6agR61/jlH/zD7CYA9Xko4hQ6rhJ0zXj6RYgvwKKmshYdYmmvywL37ZXn5IYaz6YnYXq4j4dlBEQ==
X-Received: by 2002:a05:6402:194d:b0:43d:8001:984b with SMTP id f13-20020a056402194d00b0043d8001984bmr19187830edz.327.1659992925633;
        Mon, 08 Aug 2022 14:08:45 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id x21-20020a1709064bd500b0073160d570aasm273898ejv.120.2022.08.08.14.08.45
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 14:08:45 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id v131-20020a1cac89000000b003a4bb3f786bso8017272wme.0
        for <llvm@lists.linux.dev>; Mon, 08 Aug 2022 14:08:45 -0700 (PDT)
X-Received: by 2002:a05:600c:4ed0:b0:3a3:3ef3:c8d1 with SMTP id
 g16-20020a05600c4ed000b003a33ef3c8d1mr18515437wmq.154.1659992913709; Mon, 08
 Aug 2022 14:08:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220808192321.3490995-1-ndesaulniers@google.com>
 <YvFkmfHTUYGzeeQs@dev-arch.thelio-3990X> <CAKwvOdk0q1G--S7JhxOdN4KtCgDETDbkMMnfRZoCERfOmVyVyg@mail.gmail.com>
In-Reply-To: <CAKwvOdk0q1G--S7JhxOdN4KtCgDETDbkMMnfRZoCERfOmVyVyg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 8 Aug 2022 14:08:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiFDPvKZORw228YFWX_QTc7D0EoMEDP58P2pCocRSnsHA@mail.gmail.com>
Message-ID: <CAHk-=wiFDPvKZORw228YFWX_QTc7D0EoMEDP58P2pCocRSnsHA@mail.gmail.com>
Subject: Re: [PATCH] x86: assemble with -Wa,--noexecstack to avoid BFD 2.39 warning
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Nick Clifton <nickc@redhat.com>, 
	Fangrui Song <maskray@google.com>, Jens Axboe <axboe@kernel.dk>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Rix <trix@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Nicolas Schier <n.schier@avm.de>, 
	Brijesh Singh <brijesh.singh@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Ben Dooks <ben-linux@fluff.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 8, 2022 at 1:32 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> Thanks for the link; I recall Ard mentioning the ELF segments are
> ignored by the kernels loader in another thread.

Yeah, the kernel loader is not some generic ELF loader thing.

> Perhaps we should be adding
> --no-warn-execstack
> wrapped in an ld-option check to KBUILD_LDFLAGS at the top level?

I think both the linker flag and the assembler flag are the "correct"
thing to do.

And yes, I don't think there is anything architecture-specific about
it, and the top-level Makefile is likely the right thing to modify.

I'm a tiny bit worried about "what versions of as/ld accept those
flags", though.

              Linus

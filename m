Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663098F60
	for <llvm@lists.linux.dev>; Thu,  2 Feb 2023 20:12:26 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id m2so9308030ejb.8
        for <llvm@lists.linux.dev>; Thu, 02 Feb 2023 12:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IHla39CiSn/iJKWSdMLdZQxGn8KNa71czZ//HIF7jnM=;
        b=b8S977PCJvYsm5/wWBBCuQu2MDqR3X3fUtF8X1r8mnXi8t+O+XjMQWNZFQCdwK3bQu
         bb2h40Lx6JiJTPlREK6y28ArbDlrecfcNjSuHQnO41A9KR2NvWMo8fBku8bWXW2ZsmOT
         3i1S7Ci7/Mz77ZbG9n+tgyGlxlIcHYfqwqElIshS4Q7ZnQdxZJwxp6hOfOB3IdRqQktA
         ly/hhMbpiYCBguunqDfA9g9Bu3cgo3d8McgbLXFFfupAu9Hqi1jppqaC0Qwjb+NRZC+h
         nOm8+qHMKnw3bcVXpH6k/6Y+ne2nkjuHiDVxYx23qm/zBpVknekHllYAtdJURLIsp0U2
         2E7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHla39CiSn/iJKWSdMLdZQxGn8KNa71czZ//HIF7jnM=;
        b=fyw8yS5V9Mm2sAFvhV1kzqHbYHvtuEdgajIXnqrkKex4XxL6lOSW6vCTkj+9GogGxG
         RcjQuyAK5uKj0zOZNzcLDcUiH5xctO+quNn9k/p+ruYMyJXgmc4vsQ3rd04qbqpSXq4j
         S0F+qiKAhhBsS3PegxWH3dOwSKuaD8CIjsYQQXV6GtNVFJL3oTp2B+kfXNWUq57PXmH4
         /M6TxoVltp7rArTseV+KuTfOsGze55FRjNrVC1yytxehCZj0XX1tkQyDdmziRsFxWBs7
         AywgGTWvEasYTkrsR/teVrZ2eGfvg3QBe/7gQNRfpfUQ1ZSvCWYPbKaGCEr2XeHVKCSK
         uOIg==
X-Gm-Message-State: AO0yUKXK7frihNuihNQkOrESDTcFz6afKEBbePbgnc+N3vkSbLd3pvef
	+a5Ps5+g0kuUCrYYUPtgQTaLI04/wG7vb2EplVk0Hg==
X-Google-Smtp-Source: AK7set9rIsutx+Ca2x+6Py7LpZCPwL53KUZH34ZDzhf5YBTLMNdyYbcMOhiSyZoKwKZW2sL2evQ4iBv7Bl6I/3PriEM=
X-Received: by 2002:a17:906:2c42:b0:88a:b6ca:7d3a with SMTP id
 f2-20020a1709062c4200b0088ab6ca7d3amr1942408ejh.1.1675368744381; Thu, 02 Feb
 2023 12:12:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221101222520.never.109-kees@kernel.org> <20221101223321.1326815-5-keescook@chromium.org>
 <CAMSo37W3gRkP02tSCxGX71ZDAt3WgPZrkTRTM6J1iQ4gvUS9vg@mail.gmail.com>
 <CANDhNCogJrvt=yEXFK-xVmGjkcRxSNGZUqUeNw2MV9bFRrwPdQ@mail.gmail.com>
 <63dbf04a.630a0220.2608a.0149@mx.google.com> <CANDhNCoJJs_jSAdr6uved=cK=-6+nzSJq3e_E3HgtiXHZXkVww@mail.gmail.com>
 <63dc0a89.170a0220.49507.0091@mx.google.com> <CAMj1kXHTwFH-OADZ5nZXfZyuH-x7XJL3DMyiz2Tr_nCuup+xFA@mail.gmail.com>
 <CAKwvOd=cuDb2NNK4uoUTYTLryFig47hvDQ08ta5XhjHsEhAG4A@mail.gmail.com>
 <CABCJKuc+GvTHXu-CVedZs6CvPKJ8ySrVztkP2V3dsWn70xf7hA@mail.gmail.com> <63dc14a2.170a0220.beb2a.0275@mx.google.com>
In-Reply-To: <63dc14a2.170a0220.beb2a.0275@mx.google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 2 Feb 2023 12:11:47 -0800
Message-ID: <CABCJKueSasiWQvO2jZ-8KUF+c-dNgf87pR45sfHHCQMyyTvL0Q@mail.gmail.com>
Subject: Re: [PATCH 5/6] driver core: Add __alloc_size hint to devm allocators
To: Kees Cook <keescook@chromium.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
	John Stultz <jstultz@google.com>, Yongqin Liu <yongqin.liu@linaro.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Thomas Gleixner <tglx@linutronix.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Nishanth Menon <nm@ti.com>, Michael Kelley <mikelley@microsoft.com>, 
	Dan Williams <dan.j.williams@intel.com>, Won Chung <wonchung@google.com>, 
	David Gow <davidgow@google.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Paolo Abeni <pabeni@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 2, 2023 at 11:53 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Feb 02, 2023 at 11:49:42AM -0800, Sami Tolvanen wrote:
> > A quick look at Clang's source code suggests that Intrinsic::ubsantrap
> > already accepts the handler ID (from the SanitizerHandler enum) as an
> > argument and the arm64 LLVM back-end appears to encode the value as an
> > immediate for the brk instruction. I didn't confirm that this actually
> > works, but perhaps we just need to teach the kernel about the possible
> > values?
>
> Oh excellent. Yeah, if that's all that's needed here that would be
> great. What are the values?

The arm64 brk immediate encoding seems to be "ubsantrap arg | 'U' << 8":

https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/AArch64/AArch64InstrInfo.td#L7571

The argument values come from the SanitizerHandler enum, which is
populated from this list:

https://github.com/llvm/llvm-project/blob/main/clang/lib/CodeGen/CodeGenFunction.h#L113

Therefore, according to the tests, for ubsantrap(12) we'll get brk
#0x550c, for example:

https://github.com/llvm/llvm-project/blob/main/llvm/test/CodeGen/AArch64/ubsantrap.ll

Sami

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657768F60
	for <llvm@lists.linux.dev>; Thu,  2 Feb 2023 19:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8BCC4339B
	for <llvm@lists.linux.dev>; Thu,  2 Feb 2023 19:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675365629;
	bh=GW+/PPknO/L/X81AhOAvMB1ckLEie9QjfLbxFOYKFMw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L9RriFUyhHNSgNTBVbcjd6+zFXyLzz7yN1Zlq+Q2ARDqm4ksa2lUHV5T5zsKNukIv
	 mA2K6J716HUbdKghV/vf34jCLzIwCDzmYYouNvgVOSZbnNh6GHCkUmPMZqO7FK/d2Z
	 fbWS5FRgL8pHlGKkTyuCwdPbhvq0lbwpH2R+pvyMs8y/ksDlZU4xT2yYqUEH0L9Fii
	 lw4OXPfDSoJGxa7R4u7D+AiH5JDXCWzuIi6mOwmHVaF+3CHWo8DpnDtDSkZ8wC19yH
	 neDOF0+KBjctrgbFT47Kl8U7eBwGoj5oMmdICoQwxgUEF+PDR2dJ5GIioEwVX9eCYg
	 Is+VHd9/3b9fA==
Received: by mail-ej1-f51.google.com with SMTP id bk15so8906567ejb.9
        for <llvm@lists.linux.dev>; Thu, 02 Feb 2023 11:20:29 -0800 (PST)
X-Gm-Message-State: AO0yUKWb6/Z98Zbl9zcnw6XSzx2Kxn4eD09qvCCUB0iyZwhNYEaY/NZE
	lrPcXKACObnPO6u79L2swEkIK9ag7x1OKmDgL7I=
X-Google-Smtp-Source: AK7set8f/y1tDqDb8um8dkpVuXWlMd7cPiWojFc/RDUlBXn9F2x4UAKk0tGsfdESMBoK9BDxmjY865izBQ0xCKgQYCc=
X-Received: by 2002:ac2:5b9c:0:b0:4d8:767b:8b6b with SMTP id
 o28-20020ac25b9c000000b004d8767b8b6bmr1440315lfn.63.1675365616510; Thu, 02
 Feb 2023 11:20:16 -0800 (PST)
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
 <63dc0a89.170a0220.49507.0091@mx.google.com>
In-Reply-To: <63dc0a89.170a0220.49507.0091@mx.google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 2 Feb 2023 20:20:04 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHTwFH-OADZ5nZXfZyuH-x7XJL3DMyiz2Tr_nCuup+xFA@mail.gmail.com>
Message-ID: <CAMj1kXHTwFH-OADZ5nZXfZyuH-x7XJL3DMyiz2Tr_nCuup+xFA@mail.gmail.com>
Subject: Re: [PATCH 5/6] driver core: Add __alloc_size hint to devm allocators
To: Kees Cook <keescook@chromium.org>
Cc: John Stultz <jstultz@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Yongqin Liu <yongqin.liu@linaro.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	Thomas Gleixner <tglx@linutronix.de>, Jason Gunthorpe <jgg@ziepe.ca>, Nishanth Menon <nm@ti.com>, 
	Michael Kelley <mikelley@microsoft.com>, Dan Williams <dan.j.williams@intel.com>, 
	Won Chung <wonchung@google.com>, David Gow <davidgow@google.com>, 
	Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, Guenter Roeck <linux@roeck-us.net>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Paolo Abeni <pabeni@redhat.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Feb 2023 at 20:10, Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Feb 02, 2023 at 10:56:29AM -0800, John Stultz wrote:
> > That said, making sense of the error message isn't completely trivial
> > either. I've been seeing a few cases recently of some of the new
> > compiler tooling (I pinged you earlier on a CFI one) causing errors
> > that developers aren't really sure how to address.  I know sometimes
> > it's not easy to surface the errors with context to what was wrong,
> > but at the risk of intense bike shedding, is there some way to provide
> > something like "Likely array bounds error" instead of just "BRK
> > handler: Fatal exception"?
>
> Yeah, this is a result of the size trade-off that resulted in config
> CONFIG_UBSAN_TRAP -- there ends up being no message about what went
> wrong. I'd really like to have cleaner handling of this -- perhaps what
> was done for KCFI could be applied to UBSAN as well, though this is an
> area I don't know well myself. (i.e. encoding "this was a UBSAN trap"
> in the trap itself.)
>
> Sami or Ard, is this something that could be improved for arm64?
>

-ENOCONTEXT, so I am going to assume this is about runtime
instrumentation that needs some kind of 'panic' function which it will
invoke if some condition is met that should never occur?

We already use brk with different immediate values in the opcode, so
the arch layer already has what we need. Is this a limitation in the
compiler, perhaps, where it always emits the same brk opcode?

Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC3D4F8B6
	for <llvm@lists.linux.dev>; Mon, 11 Dec 2023 20:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h6237ZiI"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-336221efdceso1092843f8f.3
        for <llvm@lists.linux.dev>; Mon, 11 Dec 2023 12:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702327675; x=1702932475; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNFFKTdQ4QRGU3jiDsgZw6qRsjpUS+kZ+xjPJ/qMrTI=;
        b=h6237ZiIRtpZDeOVE64TAoIedwCEFhXq6xSLnzEqYRwcbQvfcf5+oGLug3JJ6R4b4Q
         /sp+GTWNST45xEn/5kB/6pvaR1ipoIiZd89ip5YoigMPdyeO7QBBV2wyqgwtEuqZpkil
         Pea6b6VseYms2EjLE5Ug898Ccj9ZGekipnu6J1zB90CMELftXaQZzm4MuC1rvSGRgVxg
         64bjet1XxaI5gneM4CjTtI2+D2SQZ18UYxJsuzifFRjDVDL2wVf2J28OhazFvquT8nR4
         cGC9QWv8YUy6ptrU59ZY/9w+SIlh2OQaMXEuifaSBanm3kQWBFMbN0zkayKYik8jzv6d
         RifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702327675; x=1702932475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNFFKTdQ4QRGU3jiDsgZw6qRsjpUS+kZ+xjPJ/qMrTI=;
        b=BVBFJwW5gkeACHgwcdJog5+Zkl6tZDs69OQTH++XCfLL1HWX3rmohILPedXsPvAf1L
         6wJXla87B7Js+5KgYsGRfWhsrzAtTAGDdYiyzBP+3ZgVntdisPel1H96g1vAg8QIH5x1
         ghsSmlXkJrdZGXXWwgT/u4mcysFF4tJYUuFY/dYdhqgo+5AC+WSHX5Zkk8uuFhoafQd5
         ZKWDkGXtvr1NMCiDIBdCJA6e2siJG96OCutz0OestJlXua/zSjMotc9qafbJc6Q2ylZa
         He8I5of5Fx2O3yOyQxg42vEUGUQ6RSxVOXf/yr4gexVrBL2a1AAX1e3EPH8KXQqXdDKm
         FEkA==
X-Gm-Message-State: AOJu0YwLeO2z+6+Y0SokSYeiLNnpVwkPKgyF7D+bqD1jDWuUHRW27cZ6
	ugooECb76z6Nn9ufhS/3FxevuThxq+R4f6Sh/zFUQw==
X-Google-Smtp-Source: AGHT+IHwCiI9a280gfixWHYnlXadu2DnALRqwi1TkFx8Su2VU6cZ+QOy+Dz/bbRdlhSki6Dni8BtYfJKHIclqEDVHoc=
X-Received: by 2002:a5d:604d:0:b0:333:2fd2:7692 with SMTP id
 j13-20020a5d604d000000b003332fd27692mr435092wrt.131.1702327674923; Mon, 11
 Dec 2023 12:47:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231205-libstringheader-v1-1-7f9c573053a7@gmail.com>
 <20231205130449.8e330a26ecbed1f7b5ad5d7a@linux-foundation.org>
 <CAKwvOdn+VTM+LY6ALcgaZTL57JpiKt5rBPMSPNXsgS3MCENhDQ@mail.gmail.com>
 <20231205132452.418722bea8f6878dca88142a@linux-foundation.org>
 <CAKwvOdn=og6h5gVdDCjFDANs3MN-_CD4OZ9oRM=o9YAvoTzkzw@mail.gmail.com> <20231205214359.GF1674809@ZenIV>
In-Reply-To: <20231205214359.GF1674809@ZenIV>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Dec 2023 12:47:39 -0800
Message-ID: <CAKwvOdkC0oHWKGJ1Z6k_U9cwkjdcf=iweG-G78jXSJgWFk86Jg@mail.gmail.com>
Subject: Re: [PATCH] lib/string: shrink lib/string.i via IWYU
To: Al Viro <viro@zeniv.linux.org.uk>, Greg KH <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, tanzirh@google.com, 
	Kees Cook <keescook@chromium.org>, Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 1:44=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> wr=
ote:
>
> On Tue, Dec 05, 2023 at 01:39:47PM -0800, Nick Desaulniers wrote:
>
> > The tooling Tanzir is working on does wrap IWYU, and does support such
> > mapping (of 'low level' to 'high level' headers; more so, if it
> > recommends X you can override to suggest Y instead).
> >
> > arch/nios/ also doesn't provide a bug.h, which this patch is
> > suggesting we include directly.  I guess the same goes for
> > asm/rwonce.h.
>
> See include/asm-generic/Kbuild:
> mandatory-y +=3D bug.h
> ...
> mandatory-y +=3D rwonce.h
>
> IOW, sh will have asm/bug.h and as/rwonce.h copied from asm-generic.
>
> Still, includes of asm/*.h had been a massive headache historically
> and breeding more of those shouldn't be overdone.
>
> More painful problem is arch- and config-dependent stuff, though...

Ah, it looks like include/uapi/asm-generic/Kbuild also makes use of
this pattern using mandatory-y.

So I think we can handle this as a two step translation. We can tell
the tooling to 'nevermind recommending X, always replace
recommendations for X with Y <for raisins>', so:
1. any recommendation to use asm-generic/foo.h should be replaced with
asm/foo.h (always, based on those 2 Kbuild files, could autogenerate)
2. some recommendations to use asm/foo.h should be replaced with
linux/foo.h (not necessarily codified anywhere; depends on if there is
a linux/foo.h, will manually curate this list for now)

Orthogonal but some places in tree can be cleaned up to include
linux/foo.h rather than asm/foo.h.

Does this sound like an improvement to my mental model of the
conventions used for kernel header inclusion within the linux kernel?

Tanzir nearly has the above done (for 1, 2 we will probably need to
iterate on more).  We've also beefed up our local testing to test more
architectures.  I expect Tanzir to send a v2 of this patch (as a
series, with the fix for ARCH=3Dsh) later this week, if the above seems
correct.
--=20
Thanks,
~Nick Desaulniers

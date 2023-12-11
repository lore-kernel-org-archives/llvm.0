Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76265380E
	for <llvm@lists.linux.dev>; Mon, 11 Dec 2023 20:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMCFwGsN"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-679dd3055faso30764486d6.0
        for <llvm@lists.linux.dev>; Mon, 11 Dec 2023 12:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702327886; x=1702932686; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuKB0tiRMyjq3zqgkwtMyPd6sd/CFmnAl3rOjtlfa4Y=;
        b=UMCFwGsN+Ni22fdPMZ7J4GBRfamLdXNKRhgtq8Z4dD/VOPrvrgdXXj6xHhCUAJdwrj
         wrUfYC7l4pMjSUV3UblmugBzFWtekx/TpUog1p8cYxbQtWkqey4+vbaBvAo5IWOi6cFc
         A6LuBbY8vTyyCTSkEKFrkHZnF6a3BrPpZ710XIHRwPg9ueFyt1/SHmL9XQbL1ROOBBBh
         FT74DIvqEzqex7NIAqETljY30alv7QPwN3Hu9RczRPzPa26kMo3NLAm74u5WYjrhbVi1
         lIS1pM26A8t2IQRX7SnwLwOufp8IUp8M0DnTVJtQ9X6hLDIM7ch3K6T+KgegdfwCkEqd
         5Dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702327886; x=1702932686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuKB0tiRMyjq3zqgkwtMyPd6sd/CFmnAl3rOjtlfa4Y=;
        b=bpPnlXBFo89Z8CqY4WTvNGzJnfYjULWyTcmnV0pJvmNW3c0KF5UHsNgvn6OVYvnXDr
         QepFG8TYpEby4VVuVgPTa1UIwc5K90EcG6dDTv7UhVl19q6Nm1fyPJ1EXUeEGzHd4vHM
         W4OGGnxZ6dQn9KQmdSzPHFSCrDQ1KMtnGG5ZZsJIj6pR1motFEHISnhpQQRu0G9TbcIE
         UwtGGBCAfrU0pzhq6E9x4paATz/CY3DalD1mdwZN8XqUYN2DI1bJamSXydCVG9jMpWsa
         7ssolq3KWX2pcBBDt8LP6EOSFRShv+0omFNXIvzI633IlVNZEZLjRhU3qn6Wql7OnKyO
         w/qg==
X-Gm-Message-State: AOJu0YycF86ebTmuPFj4F1/ssPgnJKklxfEDZlnJyUl5ZODmKTM6r57x
	hQsTUAy4BL+d5uYT2U4ClZm2nI+wID9BeFHIpNI=
X-Google-Smtp-Source: AGHT+IEA228JMjM/VLsHZ915V9UbK6f03W9ktXAMmg3SwRsG2mOK7pzB/x28D2m6o+77RCPh7w7+VYTc3YWxTeCaMDE=
X-Received: by 2002:a0c:d684:0:b0:67a:a721:9ecc with SMTP id
 k4-20020a0cd684000000b0067aa7219eccmr5100260qvi.125.1702327886385; Mon, 11
 Dec 2023 12:51:26 -0800 (PST)
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
 <CAKwvOdn=og6h5gVdDCjFDANs3MN-_CD4OZ9oRM=o9YAvoTzkzw@mail.gmail.com>
 <20231205214359.GF1674809@ZenIV> <CAKwvOdkC0oHWKGJ1Z6k_U9cwkjdcf=iweG-G78jXSJgWFk86Jg@mail.gmail.com>
In-Reply-To: <CAKwvOdkC0oHWKGJ1Z6k_U9cwkjdcf=iweG-G78jXSJgWFk86Jg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 11 Dec 2023 22:50:49 +0200
Message-ID: <CAHp75VeQzjdo1z8-bKSnMNgxvwTzjypADiBu-NJopia9h-YYLg@mail.gmail.com>
Subject: Re: [PATCH] lib/string: shrink lib/string.i via IWYU
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Greg KH <gregkh@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, tanzirh@google.com, 
	Kees Cook <keescook@chromium.org>, Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 10:48=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
> On Tue, Dec 5, 2023 at 1:44=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> =
wrote:
> > On Tue, Dec 05, 2023 at 01:39:47PM -0800, Nick Desaulniers wrote:
> >
> > > The tooling Tanzir is working on does wrap IWYU, and does support suc=
h
> > > mapping (of 'low level' to 'high level' headers; more so, if it
> > > recommends X you can override to suggest Y instead).
> > >
> > > arch/nios/ also doesn't provide a bug.h, which this patch is
> > > suggesting we include directly.  I guess the same goes for
> > > asm/rwonce.h.
> >
> > See include/asm-generic/Kbuild:
> > mandatory-y +=3D bug.h
> > ...
> > mandatory-y +=3D rwonce.h
> >
> > IOW, sh will have asm/bug.h and as/rwonce.h copied from asm-generic.
> >
> > Still, includes of asm/*.h had been a massive headache historically
> > and breeding more of those shouldn't be overdone.
> >
> > More painful problem is arch- and config-dependent stuff, though...
>
> Ah, it looks like include/uapi/asm-generic/Kbuild also makes use of
> this pattern using mandatory-y.
>
> So I think we can handle this as a two step translation. We can tell
> the tooling to 'nevermind recommending X, always replace
> recommendations for X with Y <for raisins>', so:
> 1. any recommendation to use asm-generic/foo.h should be replaced with
> asm/foo.h (always, based on those 2 Kbuild files, could autogenerate)
> 2. some recommendations to use asm/foo.h should be replaced with
> linux/foo.h (not necessarily codified anywhere; depends on if there is
> a linux/foo.h, will manually curate this list for now)
>
> Orthogonal but some places in tree can be cleaned up to include
> linux/foo.h rather than asm/foo.h.
>
> Does this sound like an improvement to my mental model of the
> conventions used for kernel header inclusion within the linux kernel?
>
> Tanzir nearly has the above done (for 1, 2 we will probably need to
> iterate on more).  We've also beefed up our local testing to test more
> architectures.  I expect Tanzir to send a v2 of this patch (as a
> series, with the fix for ARCH=3Dsh) later this week, if the above seems
> correct.

Whatever you choose, please make sure it gets documented, so we won't
go another round in the future for something similar.

--=20
With Best Regards,
Andy Shevchenko

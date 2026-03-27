Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678A8332ED3
	for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 08:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598522; cv=none; b=ett5rp408d60c986BsynzLsosrrbrZRupO4/5TQtTUxnkKDkmcjxOKaBeVWkQPrZ2JFMOwgkUWlTaBZdtT4HPaj3JFtxfIgAynlf8HorNyEejpNg2p8zHyQkEKdAWtPi/kS1m5yGbqlgVVIU8QJSRVb9o5mDaUbMFuiP2nIxhTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598522; c=relaxed/simple;
	bh=u5VEHiJyZVoFEpzPp8IWhx3oSssO/QYrmWzaVG0pNx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRxFrpzN1tP456l35fhQnz947u87wRSi2mBwDbIN3JerR0fWcHVLNrUKlQtb76p2Jew/3tZBN4Sc+gADSr2oF29mvwHGqYoFbnbSQImBwBMNiI2M8JJ5nAcTHLJG2dm+0lSOHZdDPwW/I/zwnFBAf3p5W5AOXdo47QTeQvwYy6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-467fd082ffeso1172510b6e.1
        for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 01:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598515; x=1775203315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qJSO1Jy8gXJ3q0SyUcqZkfXUbxuRHoGqVtwy0Y1kZfY=;
        b=ioWie3uL+fj8oElNINrpamN8Gjw7SIBUPyjYgmLBQJ91mtN6VJqSArSrePE5kIOVOv
         L61vPh2igBPX9o1Ysne+q5jRkLKIfQK+F+PeWaTPEbZCrMHw0C5+u8VYL/nBYmf4VNx4
         SXEWT5MkqlrlNqQV02imAYbgKGLdKGKpVHMDZzgQlljyoh20F+0JoaEQCLCQYakAnvoH
         SEqG490cevunmrafR82tPxSIsGkNfdfcytGfxGPukNrN/Bg6/dT8DevQ7lNd6jL0cfOc
         6e8qti7ZX+hWdgXiqHElMq2DtWd80IdHuglsOvSvSerG8CTJxjyGFGIARKEZZc6YWi+f
         43CA==
X-Forwarded-Encrypted: i=1; AJvYcCXIVP3tXqbJcgZnJE1sXw/98lkR3oGEstL4dJg0eH1DX+j5Z8SJXk8q/w0Pp9dtRD5rQJRE@lists.linux.dev
X-Gm-Message-State: AOJu0YxuOrNS5XnVIdrYybSaWoL1A9Y8cre93NqVXZYU9kW8FdigUVU0
	CJnIiBqU7S/Sf4ozQoP+94TtctjYECP9Vjxec1KDhdazL6UljFXhAAq9O98LCJsUCZ4=
X-Gm-Gg: ATEYQzyZOOU4Yi6moiclsF572rp+Y4HCV/oyHau/foFGoHpNIOSMf8aDoqjH+uklVJQ
	/Ylvu0sdRWF2/nTKQ/dx1whbZu3no0fCAeNg3O0zi9XeucLtaksT0UAd8AfkjyHgtX1k99u2FCb
	l7U6LbLC/+U3fV1SKIlrlxjNmc5wNQewNvxLKRcvXVN3Yn3c5c+lZaXKsMu5uB5ldRNp9CJb4zC
	rM5aB9WTfNojKgO7DhRWsw8CRLbx3fVYYPSefjYuGHr/QwmCYMkvZMPx/mhSayYr2bNDcvQSFpV
	v8PZVn4VyGqN+L/pk5EXNkBgBMlUGOUW8qFwgH7B0LXnvTimzyEGJXmmoLOiwgH9JQH4kk9A7EE
	hJXLfiO2M1hzsY8AAtZ59/AfN8Kxq2fEjNIxkqbs9QevnRXiSija3hJpxp3QHrIMtVUFr5iPL9p
	aukPtNple9RRzLrz7GQizsMiDWIwrRLsiHcRNbDb2gnmkJT730o4LkI2xsugBc
X-Received: by 2002:a05:6808:1a15:b0:467:e5a2:a9e6 with SMTP id 5614622812f47-46a8a62f919mr682144b6e.55.1774598514839;
        Fri, 27 Mar 2026 01:01:54 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41cc7b6312csm4312791fac.15.2026.03.27.01.01.54
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 01:01:54 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d4c383f2fcso1711147a34.0
        for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 01:01:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWuCuIhw6MtUO7qDQp+JN/zhl9Ju0Aykzc9xSpVXRBtTDfUIj9GnXgtaYcNk8hABUoOx1tu@lists.linux.dev
X-Received: by 2002:a05:6123:132:b0:56b:5e7e:d3fb with SMTP id
 71dfb90a1353d-56d4a619a98mr460290e0c.12.1774598183104; Fri, 27 Mar 2026
 00:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com> <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
 <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com>
In-Reply-To: <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Mar 2026 08:56:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
X-Gm-Features: AQROBzCIA8XVkhuOJBqaPSt4vzM_veS-eZVPLLLcWDFZykO6P_Bu4uSiQhzQA0w
Message-ID: <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, acourbot@nvidia.com, 
	Andrew Morton <akpm@linux-foundation.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>, David Gow <david@davidgow.net>, 
	Gary Guo <gary@garyguo.net>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	Benno Lossin <lossin@kernel.org>, Mark Rutland <mark.rutland@arm.com>, mmaurer@google.com, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nicolas Schier <nsc@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, rust-for-linux@vger.kernel.org, 
	Trevor Gross <tmgross@umich.edu>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Thu, 26 Mar 2026 at 22:34, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thu, Mar 26, 2026, at 16:18, Russell King (Oracle) wrote:
> > On Thu, Mar 26, 2026 at 03:31:26PM +0100, Christian Schrefl wrote:
> >> On 3/26/26 2:47 PM, Miguel Ojeda wrote:
> >> > On Thu, Mar 26, 2026 at 11:10=E2=80=AFAM Alice Ryhl <aliceryhl@googl=
e.com> wrote:
> >
> > I'm not sure if this is still true, but I believe it used to be the cas=
e
> > that the -linux-gnueabi target has one behaviour for enums (fixed size)
> > whereas -none-eabi, the size of the type depends on the range of values
> > included in the enum.
>
> I checked Debian's arm-none-eabi-gcc, which indeed still has this behavio=
r:
>
> $ echo 'enum { A, B } x =3D sizeof(x);' | arm-none-eabi-gcc -xc - -O2 -o-=
 -S | grep -A1 x:
> x:
>         .byte   1
>
> and I see the same thing for the hexagon target in clang, but none
> of the other targets that Linux runs on. In particular, clang always
> behaves like linux-gnueabi even when targeting plain eabi.
>
> $ echo 'enum { A, B } x =3D sizeof(x);' | clang --target=3Darm-none-eabi =
-xc - -O2 -o- -S | grep -A1 x:
> x:
>         .long   4
>
> I noticed a similar issue with m68k-linux, which has a bitfield
> alignment different from anything else on gcc, but uses the normal
> behavior on clang.

Ugh, I wasn't aware of that. Adrian, did you know?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A242F531B
	for <llvm@lists.linux.dev>; Mon, 12 Oct 2026 14:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815900; cv=pass; b=rqTebjhYlK5lzfqDUszjRxxHBVWMU+GA8wcvQQXasok2Ad3JA7R3dwK/oAQCoO/jo9yer9ezMuuZW/fy51I/bFK8gck1o1lgzbN6RxIPIfddqdJfhPZBk2WO5ApYv7bzNVhPNv6Y86kEoYPlUo6kUB/xDp+JnoLpt3Hldh+Wwhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815900; c=relaxed/simple;
	bh=Jxmt9KjzM1tHZnS+/rDQVag7Gv7qwGz5Mz0R33A9/8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSJ/X9hoN+2/5KnvKjL014amcX097tIgCFhpfIb/j/ot+OAx/UTDRCdBYdmJnXjlGQouzX4s9k9SbyENJlQrRBE3Eq/Q2R3+KGEm2ysj7veSa5VSVwwhIQqm32kI50mYoY6YGscHO0JL6ozOfvudv7YOHVxCBabDzfLx4s9PAz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pqvd6yCN; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pqvd6yCN"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6767d92cde6so1551128d50.0
        for <llvm@lists.linux.dev>; Mon, 12 Oct 2026 07:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791815897; cv=none;
        d=google.com; s=arc-20260327;
        b=ZJogIXBxe6Xb6wQ6t6Pntu3/PayKkA91OUub5uOXFrz9pEYwLcb46ErL4hOpr28YaK
         MXkDuRMwbFxSG2w5YFybusfNoRNyG6tVl+1LUAqjE3T67XbGddUlem9NP2KDmcNq0XRE
         YbyT9vPEQdybcE/T63jUKoPw5U9IJdQSiQdBgzOCsCHigrvo7EFwk7/4DTK98aV9qc3d
         yvowvGFlvxVNwJEteUeTaPkrvtjObzALe3nKf+0CBsXsSSMwdmsdZZjoV0pSw3eeuhmg
         pV4VoYGHEmcwy/8S9FE+mNQqE7V12rYzlTmY9Cq2Hjx9iyjqmlkySgROlCWDHsasc4Cp
         GzJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cVL8xl8gBi6bftcNOZS9JlnRpMYOODIaKFnti92zlBA=;
        fh=a1G6OR9VGNvBVU/aoz+qwvOWmAilO9vq2wkeCK/CBqg=;
        b=IhubYsFcjbl7qc3rxt29B+B9U1J2kCvm3swEy4lciOr+WH8zmjvVf5PMkO6C5bpe8R
         7UBupFFSv1u50yv++mYSXWF90J1bB6bEWlH01MFQYAO6ikUzPgahqOqtcAE6gYHCy7nk
         /KfMKFxH9JBal01GoQpw9VpQQrWjb4eCxEpWQ3wl6kkuVjMBOO4E2PIiHdiuJ5//I/mp
         ZUBgP/AdF0cLJtvhOdouARc+9y0Boc3c04EmkZVf7ZF4JXz4urzsYM9J65GbPPCKHXwW
         R60C9B4OKBQ4wFuGv7VE9+wjtyoSEknt0BKC5ax+MjP7UKzR/XQTIGY7IlOdjlHdYQi/
         jvYw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791815897; x=1792420697; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cVL8xl8gBi6bftcNOZS9JlnRpMYOODIaKFnti92zlBA=;
        b=Pqvd6yCNS4cCZM3L8eobC0IXeFVJD7fYBN+yl/MnpyLgklIr7aJv2tO7tEMc3tHxKp
         oZ7xmpDoY0xIAsmSlzPRANQPR6yrKL978w77R4kG8pTeQI6IFRBwxHA5EbMhtjilOaiS
         pJkQ1Zh7MFW1tpvdIJLNMYX58Z0GrwNX5gA1At4u+cFIYoAv6n5HMw6Tlh9b5n01Q19k
         fgC4xyrKXBrAu0lhO1ZM7EPSgfys6BlXDI/8bau6zPR1mfPLbYr05j3AP+K1e1trntkM
         /JsGOfslmNc2/rcM9r746b3xLWwwYdKbxkrW5BR5brl58Gp2JyyIb6tULiAv+ajDvKpQ
         GxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815897; x=1792420697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVL8xl8gBi6bftcNOZS9JlnRpMYOODIaKFnti92zlBA=;
        b=AV0uY1V0MWGsUD9kUCTPYUIxYx19rR8AAvbrZbRex97g/RhUHjLCAEqmBltPoKtckO
         bslz/8tbmPLRbMJjvjsajK3dVT3wUjdJI7cVn8GrhSgMZkvTXsz/GUzVTPskxicRCfYY
         FqsCZRfqC8+c8NqNCe1oYu1a3hnrJPHEQd7zqYvbCURmyOPwjMAyuNzb18+YAQV/ixDJ
         4x8mK4P5DormwB8ho5E4zmEvm1al89hPWQfz/ILt0u3xB8YxAEB9GZtxoEAEvWFCabF1
         qY1i28i0K8enuUHUT+kz+90ZXH77YsWVdjLKfTM0Clo5SqIRSxwvOSK52VW5irTnDVBK
         qPPg==
X-Forwarded-Encrypted: i=1; AKwUvBx2aKWQNRTuErgbjiSn+XNWMlIAv/m0RQv+sk/DKbq9UnrnBoSbwW+OeGYOpfK6sWiti+4V@lists.linux.dev
X-Gm-Message-State: AFq9FYLk9rdBUlyVLidF8l6M5BU1JxDioLBEcc5zRO2V72+UIfYMLs5i
	Z7996ixc2jp4Bt3IlK5xY/pkxMPTYmvlESd9A4zxGQ8buXzFb3SJO4OoCkYj23s+yylFj/DkQpR
	ZcAiyVrZvSE3r1gvYtBjCaKXRMGB4Oq6XXES7I871
X-Gm-Gg: AYBFou35Sl1+Zn4Nj6lnlx7FvVdcRdYbEhgbILHX+fcy50viue4hOvnchCOUdx2ZZJC
	w5i3vbO4g57jOJxteekouen/maCdUkgE7Lt2inF/470qwkiloxhxM+GKNxCWqaczDAuIgXDqTNA
	XC1sTwTObX4CsyJk3w/mJ0X6X5YQMSLgAbWrOjIUI8qMLMjqghDOvB03VQR2B54/p/E3RAhZ8JA
	S/81VK7GYAhGs8az0Wwk0qrRHbz08KTaTFwmZFPmvaZf66vEc4sUDx9Vwzk6Aagz2sfBXNv+Uz9
	e5/wkRdZJrSryNrt6Av2xvXDyaRsFy7xr9PCAesltcmKF5mn1D8KQ1fIsMWpywHC5+EzgfDmYFt
	fCurqsLj0fw==
X-Received: by 2002:a05:690e:4852:20b0:677:ae5f:927f with SMTP id
 956f58d0204a3-6793630f86cmr2427106d50.106.1791815896536; Mon, 12 Oct 2026
 07:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <CANiq72nsJw25w6sFbLKKSaWog5_2cpmBmJMat-zQW1rcveJA_A@mail.gmail.com>
In-Reply-To: <CANiq72nsJw25w6sFbLKKSaWog5_2cpmBmJMat-zQW1rcveJA_A@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 12 Oct 2026 16:37:39 +0200
X-Gm-Features: AclHuK92MyXxJeDrxPQQFA26o80Qq00iYKL0aWA4ivRbmQNLUfwOPJLz7iq1CKA
Message-ID: <CANpmjNPRtT6PLf6qAiuEaX4hG1GBYD-=w1A4y_-i8vSv0e7Q-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Oct 2026 at 16:18, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 12, 2026 at 3:42=E2=80=AFPM Marco Elver <elver@google.com> wr=
ote:
> >
> > +Rust code is instrumented as well on architectures whose Rust target s=
upports
> > +it (currently only x86_64; see ``CONFIG_HAVE_KCSAN_RUSTC``).
>
> Maybe we can omit the x86_64 bit, to avoid maintaining the list in two
> places, although it is convenient to know in the docs (but risks
> getting out of date, of course).

I think any future patch that enables more architectures, can also
update the docs. We have historically maintained the set of supported
compilers + architectures (if that set was still small) in the
sanitizer docs. Once that set grows large enough, we can omit.

> > +  Note that ``rustc`` rejects linking crates built with and without KC=
SAN
> > +  instrumentation, so ``KCSAN_SANITIZE`` and ``KCSAN_SANITIZE_<target>=
.o``
> > +  cannot currently be used for Rust code.
>
> Would `-Cunsafe-allow-abi-mismatch=3Dsanitizer` work? Not a blocker for
> the patch (and in fact I don't know if we would like to actually
> support it even if it works), but perhaps in the future we can relax
> it using that.

If rustc's sanitizer instrumentation is similar to clang's, and rustc
doesn't introduce other ABI divergence due to sanitizers, then it
should work. Same with KASAN + Rust, so this would need to be a
general Rust + sanitizers decision.

The only exception is KMSAN (which I think is not yet enabled for
Rust), which does affect ABI.

> (If it doesn't work for some reason, and we want it, then we can ask
> upstream for an "escape hatch" as we usually do, since things like
> this should normally have one...)
>
> > +# The minimum supported rustc's LLVM supports all of these options.
>
> Just to double-check: does this refer to the LLVM version of the
> upstream `rustc` binary (LLVM 19.1.7) or the actual minimum they
> support in that minimum `rustc` version (LLVM 18 major)?
>
> I think all the options exist for a long time, so it doesn't matter,
> but just to confirm...

Whichever minimum we could ever see the kernel compiled with, which
looks like LLVM 18 in some custom setups? But yeah, all we need is at
least LLVM 12...

> In any case, this sounds all reasonable:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

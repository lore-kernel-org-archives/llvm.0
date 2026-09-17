Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2934D0CF0
	for <llvm@lists.linux.dev>; Thu, 17 Sep 2026 18:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669267; cv=pass; b=G3rct3BZGHIs2K4Cqqh2l5WVTVxDAGf8G48kwtEY6yGZPiBOX2vWLaxdpL/iwHqjQ5C0P5OZCFd3+4UlGiesGmfu22z7KAlvwdu26enJrqC+Cz7yxDErQjfj/CNIlf6VFhJQkiLnQRbMok1eJz1fZO6oS/VaPZWIqJ1vYVeBaw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669267; c=relaxed/simple;
	bh=MtIc2pB2Y3s8wxjv1B3d5i62dl3x9sVZ6Pg311mYCdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dS0Yarc5IuBhIlkn+vUwT3oPyo8OehG/6VsyjPXfqEXEdJR2vA2N4BGG0iICF2krLi/UCU/sThNyWEWM+W/+SDRl40Of42y3JU+Z9UvAykExXjY2DuNBaZUXq/W5cZ3TNhjR2TTtQvaSgIGC7jTAy30x3MXZ0Daa2VBPFMaJDjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ifUR+9Ao; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ifUR+9Ao"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so6539605e9.2
        for <llvm@lists.linux.dev>; Thu, 17 Sep 2026 11:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789669263; cv=none;
        d=google.com; s=arc-20260327;
        b=Q+v2479AhdQ4CJ0hJ8NXq63ZD3gkk5jx7fsxg0DYXY+OVcaeWqap8zY/rW9H5bvEYl
         tOI6ZrPsaEgT+JHu1CxUdbT4xqPZI97G3CuNACkFcS+8Z6ByOKrXKGiSyhsnBAKkbih9
         2mrnw2FZiI5FaFWKzWKpLjQMVM/4fHfFtk/ouEtOB+5J9y4s4jceVlNOHYWAIHoRvO2h
         ZiCyjoU/csLyapRPVB0t9sj4TsXFaVpXycvIqMWe4w0/RGwM0xxmD+kS6XiQQZgbfCcE
         LLcK00bEJsdC+A6vTQLlaIYjksjmzh5o5Ih+q8TN8hkvJuYDIdrw9q8o7xp6ZpKTMNZp
         kelg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zeUanOFQMGLva+Wv/HlVlWxsHp1h2Rik1mRUDrRwu58=;
        fh=DuzO9vIeNbyH4KojlqHrwyGT6VQ4HoL7O3XtgYQPXQU=;
        b=BiPmyXZn88Nfjjso8Q3gOpaEWauvnkC2zAw3M+OXx5NnO4YvP0HpEsNSKxy8Kr/k48
         tl3HcEK6rcceUXNhd6shO4431BGewrxugKOVAo6CLFeORgNC1ypJ+z/qEJwujFtMiqmB
         Hwb/7FcWcDCCXOzrexD9XaJ6zfOlZPigCNLefx/ADZXgJL6CSDaByqUCCJtDEhNj3+km
         RqrNVZcNfBilt9Z5MSqDjuiQ4P8RnGX2Mk9SJmO7guLO65cJqRzP8/PgZNh5XnrLjlyp
         PIaJUj0W1O9p0Fli4Tp7NckLRY26ivvHFZp+aeEunxGuU/PL13tVPJiDXpZzfV2X4BDr
         J95A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789669263; x=1790274063; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zeUanOFQMGLva+Wv/HlVlWxsHp1h2Rik1mRUDrRwu58=;
        b=ifUR+9AoiOFVPAFwP44Uk1A8FoIA+syMOsXQsmP8TQeXPjJ39ZE/EGDkK4woa5w7yD
         nFcRhfXw5pyLHXndzjnad7ZqgwkORg2vwaz9x6C35e7VLXZa4WBn3idMt8jXom6mWfll
         WVpqb2AMbWPT3MochCVSk9FbMvON0FX3oAEIqN8VSUuqp96Qm8ik79YSAhRxNZRyNzDZ
         u0/lCJMYT73tstuOe7c7tKi18EKU4IZQA6fM396FpjIz3Um2qqjG60xhr7AxZDsOfyKB
         rDFr2esc1g+idt+V8P7sEUXYvrXgTx3e7XSEBRZt6tHmVR0BCGIaopiHaGAz3oXGrSyD
         0LyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669263; x=1790274063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zeUanOFQMGLva+Wv/HlVlWxsHp1h2Rik1mRUDrRwu58=;
        b=pfSb4uqfXs25xPwE+74dJbx1Ag3951U2admQVfGi21PM31843/eZgYY99fQlr3rAx+
         JkaZVOnENNlTW01rsevTPMRhdPGQP0BosMvuMN84SZTNhCg5CoSsKRZ/TeHMDeTU/QqA
         4WB9HlQujZn9qOBk6aYJ0GEVzOSzVbdsSu3+XDFFi7jvnu/55e9kJDtvGbJ6b01alqXD
         kD1WgO2NZnZGRsExZ3lwMzj3YXbVHSNYy4RC2CSQaJyGoxWuZbd6sDhEGvW2ymsqjecr
         bXALxqUE1deSgvr1mqAzTOzCu9hPvzt79VZeJMx5Y0/rdPQVST0L8nyBckeC3O+r7Edk
         O4RQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrgWN2tdOCa2IgKsY/RdFzpr7nmN+ivX7qUkgaV72HB6yUc+sCo+m33Dr4uJ+rgkIAGWRN@lists.linux.dev
X-Gm-Message-State: AFuF++nF3b1IgtSoHnxRhK3pl2c9CLqLKm/FnucELYdqAwjxl+DcTfef
	mOZhbC5MConCgJYQhOOTEwlG4g6tQHiMOOGA23502DbWOfZ/mjYzTBNfYIbEgR/ziRo/rjiYuNR
	YWijogtTIo6MUaNQzZFQjUk6ShIjH9cqhtnTAfIQa
X-Gm-Gg: AYBFou3s7x0ekr3Xg/b/hQTCk/J6hZk9TXOyhaDrjHTo3Rups5S9uwDNzN9SC57M+bX
	/GhRixIxTj5+zozVTTdFivLGF1YOiFmG9csRRe7G3sVioLR5x+HlT5OFSc2RiQbzxmNNqzJtg3B
	ymnqr3pH85QNEns5e2ozodTxvCgK3im0qN/Ulgo2Boh51lmixGHLn5/P/I399WP7ZNE3EZw/vdC
	2JEYg13q7nD5UUTf2CSKvgvFStE6umsyHk3rjeTtFsSl06Op84BpdbJeIkjYHva8OEMGrVC2hVr
	R3y4P3ZHHeJgmTwTAh0H/ejPKMc1fjAyohOSGbQZOFpy/QRJirdq5z4538+Q98vbNwzKWMMRVJT
	AQXxOpNWazewLJ4dH+IyApeQKuGv7Ih42ogHgFeyyI91CVIQOLwCZl5E/abQajtlwbeZHyw==
X-Received: by 2002:a05:600c:4708:b0:49d:93c:d903 with SMTP id
 5b1f17b1804b1-49eb7322de3mr97138325e9.20.1789669263065; Thu, 17 Sep 2026
 11:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com>
 <CAKwvOdkCGEYWnyJtWT=jArXkA47X==G0PU4UNV=s8htpA3Dg6g@mail.gmail.com> <aphc5Xf0HU0SWcTI@redhat.com>
In-Reply-To: <aphc5Xf0HU0SWcTI@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 17 Sep 2026 11:20:50 -0700
X-Gm-Features: AcwNN1Wnnc2Ja2BVU5SbTKTHMtdnYNybRfE_8sC9RSapHxQS6CIO6M07Qcg-v4o
Message-ID: <CAKwvOdkQ1OL8Uu+wBO-RtVr_sPTWJBYpM9PEDcec8CvLF64FdQ@mail.gmail.com>
Subject: Re: [PATCH] x86: uapi: ptrace: guard register offset macros with
 __ASSEMBLER__ or __FRAME_OFFSETS
To: Oleg Nesterov <oleg@redhat.com>
Cc: Elliott Hughes <enh@google.com>, linux-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 10:29=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> On 09/01, Nick Desaulniers wrote:
> >
> > On Fri, Aug 21, 2026 at 3:46=E2=80=AFPM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > The register offset macros in <asm/ptrace-abi.h> are guarded by
> > > `defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)` for 64-bit, but
> > > were left unguarded for 32-bit. This causes havoc for userspace that
> > > happens to use identifiers colliding with these short macro names
> > > (e.g., EBX, ECX, EAX, DS, ES, FS, GS, CS, SS). Without this guard,
> > > userspace is forced to be super extra careful with include ordering t=
o
> > > minimize the chance of collision.
> > >
> > > Wrap both the 32-bit and 64-bit register definitions under
> > > `#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)`, and ensure
> > > User-Mode Linux (UML) defines `__FRAME_OFFSETS` for 32-bit as well.
> > >
> > > Assisted-by: Gemini
> > > Link: https://github.com/llvm/llvm-project/issues/217413
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> > + enh (who pulled this into android for testing)
> >
> > Oleg, can I get an ack/nack here?
>
> Oh... there is a little problem, I don't understand the usage of
> (magic to me) __FRAME_OFFSETS ;)

Yeah, my Assisted by tag is from asking Gemini to triple check my
patch before posting, and it pointing out to me from a local review:
"did you intend to break the arch/x86/um/ C uses of these macro
defines?"  So I'm just matching an existing pattern in arch/x86/um/
for 64b with the __FRAME_OFFSETS parts of this patch.

The patch started off as "why are the 64b macros behind the
__ASSEMBLER__ preprocessor guards, but not the 32b ones?"  I went back
through the pre-git history tree, and FWICT, those macros have always
been guarded for 64b, since the introduction of x86_64 support itself.
Dunno if anyone remembers anymore _why_ the 32b macro defines don't
have that guard (chesterton's fence?), but to me, IMO, it looks like a
mistake.

Hence this patch.  PTAL

>
> > Or someone who knows better the
> > history of UAPI headers?
>
> Certainly not me....
>
> OK. I'll try to read this patch tomorrow with the clear head after sleep.

Thanks for taking a look.
--=20
Thanks,
~Nick Desaulniers

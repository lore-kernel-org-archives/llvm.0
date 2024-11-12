Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3536219C9E
	for <llvm@lists.linux.dev>; Tue, 12 Nov 2024 20:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442418; cv=none; b=uIc3Xu85bYfTZLmjcTC/tSRiNLc/1HkVy2Uw5d2PkNoDRYUnqoT3ms2ENgqP+K3l1dU/4vcFBzdL/qkx5UORTeLS6WJpR5LFv7QZh8i5yiSIud1RD7MIQf+9I47oFPPlh5VMfhFzCS487roXNu3PwXN0omYQchD/u8gdjn/guSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442418; c=relaxed/simple;
	bh=QY+lZkSp4pEMsOH5ViLZZ71ACCvNupC89gqwzm36rVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdZII2hXgieTY/6M8Tw1ugnevzFNl2/z0EmtolwI6/bJriLzTQpGFNmxrv+bQajgSZUlH4g5WXFb3c8dCqfFiNbYOV7x5bmnbW4kD6Xx39NracuT1ilqyYE1L/LZI9t2tGIaWCgNpJ2Q5tTHjNdM83F+RBdsE0y0ME0BmJ4gDgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ibpYzf6m; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ibpYzf6m"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4608dddaa35so50591cf.0
        for <llvm@lists.linux.dev>; Tue, 12 Nov 2024 12:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731442415; x=1732047215; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ok3qcHy+me2Jj8oTM9OE18MgpCpWLeklNFe0Xu3psIY=;
        b=ibpYzf6mxp4JV9ihAO1fSoDYz+Nu85egSDMePZtIXbOrCg5fsom4eURWcFmHhzCOxF
         nnMw28cCyODmKRh1Ep/m+rJgGQxzIno84u4lpAA2ceVxK9K/t49ijibGxqT6fZY7b2aM
         vh2iD9OT1bPXMlgvKJDrt3/HAw//eE0RsTNO24NtNV7fScp5xm30ZYBHWTOTmTOXO57Z
         rGmrNfyVFq4G527oDwznn5KG1OxCeVdIArvBqVMkFxhJH+mzA9KpfBgKecA+XXr3I3uj
         qBCweJKKF9r45GaKPIDMNK6SjzVCl917zJa526JTxcj2LYA82YjRVhuT3VB/UKmewo+a
         MkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731442415; x=1732047215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ok3qcHy+me2Jj8oTM9OE18MgpCpWLeklNFe0Xu3psIY=;
        b=eOFOOqvBIwrD/GvCh+4Ewcva9qvNndp9e/yOim+e96R4yZAW5G93Ci06i2t6p7VG6x
         j0PVrRgluW3DkIFWxH+lbH2Giz60CQ9fmRjGdRRA545DVTyAf8KcMOlXyfwTQSzooZwL
         dEjTVbWVgZrx26m+9RdrM73z2GXhyIzHT5Yz98cZ10/gSx7A4uV5p8vg5TxmPItO2hpC
         JbtVg2JDhR0cR8I7UWPOlamTNGL1jHorDjfhDmbmf/hHKPbhE0sqCv8UEGUqKLmOg8I9
         BH8rk3O2CWuiI1z7VsIloG+Z8gUlCBBp1VriN/6f2OlgqK6F0FbDmfqfd8/cIgK8YFg/
         GIQA==
X-Forwarded-Encrypted: i=1; AJvYcCU0pinqIGx4tkf7o75VKu4r7t4bxHyUDrmD+0DHR0EDTH23YZ7J6yPVaCVcoGND7TRJCAjj@lists.linux.dev
X-Gm-Message-State: AOJu0Ywjcu04bmPTEQr5+dgrezUVHnx7Yy4FuAt6+1SKKHUyLyFVG8zp
	G4SUBz8ya8Zd6Y7DxLKgMt8EFRnbBcd/SNz9UuDB8o0Mw0snaBWpYm7hVh88eOiPh6P//udb1Xk
	yqMvmhsVxckR8Y7PqOChgPeBQSfFJtGEvNYft
X-Gm-Gg: ASbGnctrA0eOKqaUK/dvMsg0avwN4hvZBpV1Qu64uOxVGBzu1jMh7ZgURSjrRvqeGwn
	2WIxPNMGcy3YyKwvPFqP/TsElZioYKZ+RzYpdOzlL3ugZ3XpRddtmEQtYhf5U
X-Google-Smtp-Source: AGHT+IHEhri+khloSfLyc9f+kn+S0I//KWGpBCIikR491QgXS5ZsJTa+TGjEAvCX7DRA5b9a6+qU8vYdidxIcZgIBaA=
X-Received: by 2002:a05:622a:47c6:b0:461:679f:f1ba with SMTP id
 d75a77b69052e-4634bca4e56mr371601cf.20.1731442415109; Tue, 12 Nov 2024
 12:13:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com> <20241026051410.2819338-4-xur@google.com>
 <44193ca7-9d31-4b58-99cc-3300a6ad5289@gmail.com> <CAF1bQ=ShjoEQZGPjDoy_B6wZdD_jr-RevVXwEDPA_-o-Ba0Omg@mail.gmail.com>
 <e7cd2746-0ad8-452f-aa12-e3a37e8a9288@gmail.com> <CAF1bQ=SYeeKLUTfbqw-KH1rHJCj_CfJBuk+mZUrnnb7aDjRV2A@mail.gmail.com>
 <CAF1bQ=R18HLC2vjCGj+M=VYidrVzz3RT=U8cckXgpgrxc0kG0Q@mail.gmail.com> <70772ce5-9dca-418e-9714-80ba4ae28959@gmail.com>
In-Reply-To: <70772ce5-9dca-418e-9714-80ba4ae28959@gmail.com>
From: Rong Xu <xur@google.com>
Date: Tue, 12 Nov 2024 12:13:22 -0800
Message-ID: <CAF1bQ=QycziM6GQoTWSMQCGWPkZEDmAHMLfokoJ6k-vn7rCA=g@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] Adjust symbol ordering in text output section
To: Klara Modin <klarasmodin@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Wei Yang <richard.weiyang@gmail.com>, 
	workflows@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Maksim Panchenko <max4bolt@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Yabin Cui <yabinc@google.com>, Krzysztof Pszeniczny <kpszeniczny@google.com>, 
	Sriraman Tallam <tmsriram@google.com>, Stephane Eranian <eranian@google.com>, x86@kernel.org, 
	linux-arch@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I sent the following patch for review:
https://lkml.org/lkml/2024/11/12/1565

Thanks!

-Rong

On Mon, Nov 11, 2024 at 11:45=E2=80=AFPM Klara Modin <klarasmodin@gmail.com=
> wrote:
>
> On 2024-11-12 06:38, Rong Xu wrote:
> > I compared the System.map files from Klara Modin. The linker script is
> > doing what I expected: relocating the unlikely executed functions to th=
e
> > beginning of the .text section.
> >
> > However, the problem is with the _stext symbol. It belongs to the
> > .text section, so
> > it is positioned after the unlikely (or hot) functions. But it really
> > needs to be
> > the start of the text section.
> >
> > I checked all vmlinux.lds.S in arch/, I found that most archs
> > explicitly assign _stext to the same address as _text, with the
> > following 3 exceptions:
> >    arch/sh/kernel/vmlinux.lds.S
> >    arch/mips/kernel/vmlinux.lds.S
> >    arch/sparc/kernel/vmlinux.lds.S
> >
> > Note that we already partially handled arch/sparc/kernel/vmlinux.lds.S
> > for sparc64.
> > But we need to handle sparc32 also.
> >
> > Additionally, the boot/compressed/vmlinux.lds.S also the TEXT_TEXT
> > template. However,
> > I presume these files do not generate the .text.unlikely. or
> > .text.hot.* sections.
> >
> > I sent the following patch to Klara because I don't have an
> > environment to build and test.
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.=
lds.S
> > index 9ff55cb80a64..5f130af44247 100644
> > --- a/arch/mips/kernel/vmlinux.lds.S
> > +++ b/arch/mips/kernel/vmlinux.lds.S
> > @@ -61,6 +61,7 @@ SECTIONS
> >          /* read-only */
> >          _text =3D .;      /* Text and read-only data */
> >          .text : {
> > +               _stext =3D .;
> >                  TEXT_TEXT
> >                  SCHED_TEXT
> >                  LOCK_TEXT
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > If Klara confirms the fix, I will send the patch for review.
> >
> > Thanks,
> >
> > -Rong
> >
>
> This does indeed fix the issue for me.
>
> Thanks,
> Tested-by: Klara Modin <klarasmodin@gmail.com>

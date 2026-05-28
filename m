Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5D1314A8E
	for <llvm@lists.linux.dev>; Thu, 28 May 2026 19:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779995114; cv=pass; b=nDU9NsuGGX8358TwGkPUL2+9RFv6QXK55B9PP7xl89B9+9+FwQoe00zEtC1d72/74UYQyDBQhc433PiXExD93ViMdtLE42LpsaDeNL5keEvikI0SDItlV3EHDK/clYKahY4RmrfK9QkAyJz82tsna5MGGltSNGoNQl3MSAusqcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779995114; c=relaxed/simple;
	bh=y4Bbb4J8lASYOK52zh5o+m5RzeLvKudKDuTc0Qn4b38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhuHogHIHu2BPVA0Hw4qARGuKnCBzImNiE9Fj6q/XWIKPmk13c7VgFBDF+XcWnJc4rx1Ft1cVbbXDT1Flbed/QONdCovoohm5MmkAxqxysUNXRKi6pidelwqGQ/e3AFKZfJCNb9cVVf9eEw2sh2GDR6ipulkO+xa82Pf8UeNQGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FskkeXJo; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FskkeXJo"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-516d1ddcdf4so12941cf.0
        for <llvm@lists.linux.dev>; Thu, 28 May 2026 12:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779995112; cv=none;
        d=google.com; s=arc-20240605;
        b=QrrZinEPSIfaUMe03AVOh84ICNQGYQ+IIoXfsWECzFjmeEPcNxZIk6tkkBOEcMsoZ8
         S6KqZ4MoNPTAvWEn6cBVK/+tsIf2Lhe14O0vM5EavTb3lAdw5s2r1WP6J+h3e7ELsJ+N
         yE4m6hrNtVOUfB2JsPDQbe7ky7BqXx2xuiXqYKvXAAcDbgPcWMfLXGmTiddQIeH5mi6+
         /u9iRIdAE2y6GP9Mtc4zIvl3EIFzzIPp9GQnqEOnGLAj54ppdESCFcUgPN4YMGdg6n5P
         X7H6IHiyjf+xQ4I4JD021EP9XmhDqOnL7BtzUG/sFZ9hDXwsMYUsk7/LDRopTjRyDgz/
         hkPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Fbsmv+6O7TS0nAIvm3pb4iiGQVOKjsqXhBEGEcBbPQ=;
        fh=Vxw7CLn+yLwr8Fw7/+o7sxEOQ/4lYpQttlqnwHuT/OM=;
        b=lnIyiHYemJhsE+gmKgK+0Pl+qDQmgMyFp43FNdtS2zVRltzMbafLhqN8ao0DH/YOX2
         pDd5527IXniwBq9ohuRPBadfVqjJhoJdiibYRMH99zG2YhdXFadvnOTUfHhFlTuMj6YP
         G1zYT7LrWDbAgURffkyg2EsS+T92yvJ7crd1WrnNK7DHGdYLqb1HEaiu/JgdSh6rEtf7
         pJSx9ZzuHidyZ1j7kXyTjYySoaYuDtj9EgdJgjuKJfUcbK0W/opUSbjWAkQ0zF1Xd5Rx
         NS3JaBi6+xgqvGwL55WM/LpZ+fO9xQLUCOdVQesBR9rdjseM+wxbrTb6hcmqH0FvHs+l
         TWoA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779995112; x=1780599912; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Fbsmv+6O7TS0nAIvm3pb4iiGQVOKjsqXhBEGEcBbPQ=;
        b=FskkeXJoY7cUVABlVCDA3bAieWCVI/FDocU+uhbFqfozrwsw96eNoSag3jpQW90jA1
         SkgT6LNSr8D3pPTwAFaTh+FtbxOysoqEJ2obzdqplDyHS0KpCaP2Wxzy6pS/FCmCNr4E
         YZrcBgVH0A+qW28SYrHy++yHLjqDTFpvyoP8TOv4WDDOxB4v4ruJY8JLQUGPfPj0jGYv
         JYOvpVVpjmhSN/yhTk6vTCv1EwNMhhwS2wfMmMD78ZkKZuwNVjLw0S1SQUM3evv65LSJ
         RdZSdm+ShXr2vwqNVyApB1+76jIuZTzzMXf8dsxd09AzCjJytQyCg8g2NF1Se9x9staX
         IluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779995112; x=1780599912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Fbsmv+6O7TS0nAIvm3pb4iiGQVOKjsqXhBEGEcBbPQ=;
        b=HM7YEMDcsFxjg9Ewrbbswu31tuICmEBkmsST6Z6j6JPUANikVE23amL5r/5YLB7YHB
         dsr/r9j9z8k8u2t7xO6gMp5srDVWKM0kEkZaWj3yIckGiIwCYnGL+zUdEiWtafffpPmb
         auSvGjAU9bob6lKxZfcV1Hh6gaeQ7f2gIbhFumam/mOQUnx502J7AdMHOmCEf8r2X5Lp
         RpEGUCKR15AZ+LWXtNJxmjOcl8hYoo0IZJBl9M0vyGjzOPLq3xioU8WbljFqjpfq5aoh
         SJrlYPivC3id0bQwMl3a7U2f9dbR6kH26i4IfYL0Bqb04z5FsH8vgSGgJ1jMVxr8P9Lv
         UT1g==
X-Forwarded-Encrypted: i=1; AFNElJ+A2w5P8OMOlFf19OdFrntJBMGtwL8pIP0EPsvCoCJE4apnlEYnXg1IYXQGUmXRDtUDci+g@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/sYAniU5KWMjqfE+7YWYQ9LNS/5VEu2FEAq0Bn1ytiRWPZk1e
	IEp163fkz0Syf2CBqyZaDXazOZrYrOAs/1LpQKJbPYvmWyw2l2ATsfQDaEupoanU+1td1lXrEXd
	wZPRTQwkZ8VW1d3MUtr53BBrS79pQ3GJtbPihx0tl
X-Gm-Gg: Acq92OElGCmQ8qVL9tP1jJFdZNhxxyyGfmU7huNwlqCTTC3jR5wsGPFtCN5RFMovxsl
	q6Cpx6CcERc52pf8aPHrzZxFDRjCBIZMnqrVPpjyFGEEeX47xQMtMHp9SSIjR5/3ubGVY7HbvE2
	lu9GnAFl2ppAGs7ZrqXJwMtkYFnDZQdbPBfRX3vqJJoZhDBZwmq2xq0TgM9CXLNyK5TXvW3wEF8
	xBS+G3K8PdttjtIMo4F45Ju9Qo8B+l+Kwtmi/tYzdgXTvifN+oWoP+mXnqk4NcyGU691zS7bj4C
	ebdb7YMW2dm+cDEo6GAeB58e1dJPjgKeOK2jqRtNV5x7jXPz
X-Received: by 2002:a05:622a:8c14:b0:50f:bea3:9485 with SMTP id
 d75a77b69052e-5172cc5dbedmr441831cf.2.1779995111825; Thu, 28 May 2026
 12:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526172926.2717929-1-xur@google.com> <20260526172926.2717929-4-xur@google.com>
 <177992962862.1361033.11249653355160017674.b4-review@b4>
In-Reply-To: <177992962862.1361033.11249653355160017674.b4-review@b4>
From: Rong Xu <xur@google.com>
Date: Thu, 28 May 2026 12:04:59 -0700
X-Gm-Features: AVHnY4Kpzs0qh2r1fVo7N5kE04LZemrV5UvvFNp2x8zXNTtJzeAxmD36VHtf_ME
Message-ID: <CAF1bQ=Syrnb-wEfXmHpcDg3u7JVXQnDExhjWFzDAzA3paZD7mQ@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] kbuild: distributed build support for Clang ThinLTO
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

Thanks for sharing the AI review findings. Please see my responses to
the comments below:

On Wed, May 27, 2026 at 5:54=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Tue, 26 May 2026 10:29:26 -0700, xur@google.com <xur@google.com> wrote=
:
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 0718e39cedda..b36c7c6817bd 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -249,6 +249,12 @@ ifdef CONFIG_LTO_CLANG
> >  cmd_ld_single =3D $(if $(objtool-enabled)$(is-single-obj-m), ; $(LD) $=
(ld_flags) -r -o $(tmp-target) $@; mv $(tmp-target) $@)
> >  endif
> >
> > +ifdef CONFIG_LTO_CLANG_THIN_DIST
> > +# Save the _c_flags, sliently.
> > +quiet_cmd_save_c_flags =3D
> > +      cmd_save_c_flags =3D printf '\n%s\n' 'saved_c_flags_$@ :=3D $(ca=
ll escsq,$(_c_flags))' >> $(dot-target).cmd
>
> Sashiko notes that we might want modkern_cflags here as well, which
> seems like it could really matter for LoongArch?
>
>   https://sashiko.dev/#/patchset/25040?part=3D3
>
This is a valid point, as users have the ability to add new flags via
KBUILD_KERNL_FLAGS and they are likely needed to pass the backend. I
will update saved_c_flags to include modkern_cflags.

> The other comments might be relevant too but I did not look too closely
> as I am wrapping up my day but I wanted to bring this to your attention
> sooner rather than later.

The second comment concerns using a shell script to get _c_flags: I
opted for this method instead of $(saved_c_flags_$(<) to avoid loading
$(<).cmd in the Makefile. Note that I only load $(@).cmd at the end of
the file. However, if we would rather use the latter approach, I can
make that change, though it will require loading $(<).cmd file.

The third comment concerns file name matching: That is a fair point; I
should have implemented a more precise matching criteria. I will
address and fix this.

I disagree with some of the comments regarding compile times. We have
tested this build mode extensively and observed no compile-time
regressions compared to the existing in-process ThinLTO build.

I will send the updated patch shortly, after I tested the changes.

-Rong

>
> --
> Cheers,
> Nathan
>

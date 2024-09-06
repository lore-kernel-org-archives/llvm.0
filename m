Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29CF1D1F69
	for <llvm@lists.linux.dev>; Fri,  6 Sep 2024 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635212; cv=none; b=TcW04PusDQL6vY/KGikHzQlESnwk5f6TgleiQ7T+SvaVzD0uqRsXt5waMnCTHDd48GKCysXiWKfoHiYk+e0sChkr4VVNgcL/ju9v/GiYrrBwTMcgVit9Zl1+4v3wc6SSuTvbu2fIRniSoofKVuvbu55RTkEqyHgMTe+N2DZJrv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635212; c=relaxed/simple;
	bh=aQLKfK6IyeVlvPZdEpJhpjuD9yzE9AaUJBwaw3oLa4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=umSIs7J7LwxfioH+biDAZS85Ps4AU3vcPM5wemXZtn9lH/Kc9+g3FCf1RKlt8tknkiotUSwVR0U+qqyg4/cfErqPeY/GAceOe0ll6E26pgUdvlclEyW+Ez2Eqfny9Q/N651cyOLX8oMKS7bAHbnFVACQMH2qjUorm0D2v+bO84c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kruces.com; spf=pass smtp.mailfrom=kruces.com; dkim=pass (2048-bit key) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b=D0N1Kpxh; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kruces.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kruces.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b="D0N1Kpxh"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a8ce5db8668so57311966b.1
        for <llvm@lists.linux.dev>; Fri, 06 Sep 2024 08:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kruces-com.20230601.gappssmtp.com; s=20230601; t=1725635209; x=1726240009; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9ZAlMwEyYD75XfvfcvFROEESwWLuQ5Z/p2zffJIs9s=;
        b=D0N1Kpxhpia0LS9+gQ1s8tqAU3atdqKIbkzCsKd7AnUYLMLBLBkUnKcX9w0BgRhYnI
         ZP8C8VFoSvUMSjocOdT/8fv2abZzBFdHvMr5dmikc0xFXMINMcEPZaVbwVCxsJY7M35j
         3yap+t7gdtcgsVDBH9pI7wcZOmip/wPZbVh0kpzI9YClvrkLUATeL0ArMSD8kW2Dh0L5
         NS9eire9Jzs91PYe4ck5u4VtEhiqKbLWeBMP6oKVLPZMSDloRLUzKQ4ourNof4ev6sTM
         KWK2Z/D7e9jjlEjcGzHLLDbm1f2dEj04GdAnRFQHzcnUd9hA3CYfWZ6iUzn+XLzuuq46
         vu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725635209; x=1726240009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9ZAlMwEyYD75XfvfcvFROEESwWLuQ5Z/p2zffJIs9s=;
        b=YhL+mV7HCZelWkldmzkmiXaVOkez9K9rpVz2zJ8sU8TgsZ4rTqFAfUDOQ7gIav6FDc
         eNC62d/Om9qfg8RGl63WcExFcsjCJU1q7lrH/GZissl7HJkgDHx0qqUVEp284y4I6nuk
         WLgDkxz88G4sZCfRUMpM0YTByVLWORdwi7Z0fejiGdZqgx1ij4TzOHYTjoda4B+AYm6F
         176VNWu3IgRKXC29kK4l/bqMvnKDd1mEz23X1QgDbe/MfeongwfFV2/yrSS4v0rMdHpZ
         6bkpRmklB2KBJarhm3jYZzUW11zXs+8+6re8kBAg6S9KMQvnEMnk+0ZmvHHDR58i7kVG
         a7Yg==
X-Forwarded-Encrypted: i=1; AJvYcCW9/9O7T0FLpVcvjb3Y0fjftZ2ltQ9CghfbERKsB4tj6N748bQnnsrc9Ze09yI+L+74cKFv@lists.linux.dev
X-Gm-Message-State: AOJu0YwnZI9i8ES+usCxqzXvvKnA1jFsOkuJa/7xOrl0Eb6hmwOSU19r
	Ag+EHFn2lo71asm96fVHS58xSTJa87QtV0orkbRgnKB1ScZsbalPch6COLZ4xl2N+K35OH8aQRx
	qzMggx48RKEz7A2jNf+3lC1f5ZF+MzpVCD6AiWA==
X-Google-Smtp-Source: AGHT+IE5oYDSfTzIe6hHUgUBH7wdkZoXXSF0xeHeSRG+IYdoi10a74SFm4+xUjHqeOxdrh5qK7III9nawL/szJxa908=
X-Received: by 2002:a17:906:c141:b0:a8b:ddf4:46f1 with SMTP id
 a640c23a62f3a-a8bddf45606mr100660666b.63.1725635208952; Fri, 06 Sep 2024
 08:06:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-7-06beff418848@samsung.com> <CAHC9VhQkstJ8Ox-T+FLU34s9U0gezRba6bMA-tUPs80u6sVh2g@mail.gmail.com>
In-Reply-To: <CAHC9VhQkstJ8Ox-T+FLU34s9U0gezRba6bMA-tUPs80u6sVh2g@mail.gmail.com>
From: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
Date: Fri, 6 Sep 2024 17:06:22 +0200
Message-ID: <CABj0suCtCfd58+i0s5LzsTUwwd=1o1nMRvmqsxsraJcTiX2mSQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] selinux: move genheaders to security/selinux/
To: Paul Moore <paul@paul-moore.com>
Cc: da.gomez@samsung.com, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	speakup@linux-speakup.org, selinux@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
	Finn Behrens <me@kloenk.dev>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 4:54=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Fri, Sep 6, 2024 at 7:01=E2=80=AFAM Daniel Gomez via B4 Relay
> <devnull+da.gomez.samsung.com@kernel.org> wrote:
> >
> > From: Masahiro Yamada <masahiroy@kernel.org>
> >
> > This tool is only used in security/selinux/Makefile.
> >
> > There is no reason to keep it under scripts/.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >  scripts/remove-stale-files                                    | 3 +++
> >  scripts/selinux/Makefile                                      | 2 +-
> >  scripts/selinux/genheaders/.gitignore                         | 2 --
> >  scripts/selinux/genheaders/Makefile                           | 3 ---
> >  security/selinux/.gitignore                                   | 1 +
> >  security/selinux/Makefile                                     | 7 ++++=
+--
> >  {scripts/selinux/genheaders =3D> security/selinux}/genheaders.c | 0
> >  7 files changed, 10 insertions(+), 8 deletions(-)
>
> Did you read my comments on your previous posting of this patch?  Here
> is a lore link in case you missed it or it was swallowed by your
> inbox:
>
> https://lore.kernel.org/selinux/3447459d08dd7ebb58972129cddf1c44@paul-moo=
re.com

Apologies for the unnecessary noise. I=E2=80=99ll review your feedback and
revisit the patch accordingly.

Daniel

>
> Unless there is an serious need for this relocation, and I don't see
> one explicitly documented either in this patchset or the previous, I
> don't want to see this patch go upstream.
>
> --
> paul-moore.com

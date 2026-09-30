Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34D34B827E
	for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 15:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781422; cv=none; b=cHAPw+2uY7g5y8jZ16bzOp+uusdy+HrAaprC97Kraa7N7VIt3DcEfCiZEJNRqC9ZD766UcMM4Jt1rvmc65jFYmhQWT+Mcqnv4Uou4p09xwkSx0hhjSRCqySEEFwuUvXRcDZqE3+aZByGGkMl9j7eeGWC6Kxh5Op0WzakLW0wLqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781422; c=relaxed/simple;
	bh=yDrsOb4hwWXIN+T6cItrahv2HmKPc/RBpYKbK6q2uSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MBnU12L2KtM5a2efkPDrbHeS4mOu+gbRZKLRHETmKXN/NSjKchJjpLzS2XWOpogI7Hub8YBAML4cbtorramQ4wDMn80rmGhsCzjl5ourOpFl4LB9V8E3zjEF56qR8Amv+A/ExK/0dt3B8N1BVhoY6y8+ASTcBJMsRrQNazvnCA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=lif9OX7R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="lif9OX7R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212FE1F000FF
	for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 15:16:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=lif9OX7R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1790781409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3YhJg/Vg0kUrlQnIKq6WPQNTQH9OtFetyfT9AbDxDuA=;
	b=lif9OX7RWafdyPA2vmfDWOKBdoGlxav5sM0R59juNsSHRGOJ3cLGwIQADccYOr0Es7uHaM
	U2JHgEuRoM4HW2gbTSyzrG61iftYLSVR+tHEfiptGXjcTCXFxk1AM8v9PuFV6tI2DiwHi2
	rpAspPBUZghSjKDFVGIGFAwuxgjbmY0=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id eb04c6bd (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <llvm@lists.linux.dev>;
	Wed, 30 Sep 2026 15:16:49 +0000 (UTC)
Received: by mail-ej2-f32.google.com with SMTP id a640c23a62f3a-c2e27d11f43so35406066b.0
        for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 08:16:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByn7aU7t83YnexZpNnkujSJ9LdkuX6tUNua2rpLrO8rgDpS9KJfA0BazptlETkl8itl9qo2@lists.linux.dev
X-Gm-Message-State: AFuF++niKlJCnTUhoZQBBBo2LrPRxCpUhdzkqrOUP8tZoCYWrliKEmrp
	fQJtYwnV4nZdw/lkG/CpUMj+lOFEhlTi5gK1rlbbXl52dvBUF+9UYoFNUbvPSMQeXnBleHPMlIo
	t9MpD90ZkMv3cMykx0Uy0Vy7dKjmZd/A=
X-Received: by 2002:a17:907:6095:b0:c29:c575:de84 with SMTP id
 a640c23a62f3a-c2e240ee3f5mr135965366b.8.1790781405942; Wed, 30 Sep 2026
 08:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
 <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
 <CAKwvOdmNZL3eFvV3v77GXDzL+XLgz+BT9TA=my0yTnbsHqVeSg@mail.gmail.com>
 <areYMjNcaqe86ds4@zx2c4.com> <9d1c338b-368f-4ea2-a12e-c28d49adff5e@kernel.org>
 <are6s5e6On3hpD3M@zx2c4.com> <CAKwvOd=BrMfFT88jsvBPhh383qqk5G+J07CsofNu0MVkziyhCg@mail.gmail.com>
 <20260930133813.GA3142230@ax162> <ar0a4b9CjL2YHCkY@zx2c4.com>
 <ar0gTS71qxnx9AkW@zx2c4.com> <20260930151337.GD3142230@ax162>
In-Reply-To: <20260930151337.GD3142230@ax162>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 30 Sep 2026 17:16:34 +0200
X-Gmail-Original-Message-ID: <CAHmME9pA+AntJ6hWoFYpTVjh-NUSd0ZGXp5XiUuhQcq3HjQT3g@mail.gmail.com>
X-Gm-Features: AclHuK-3j-Oh9f_5JCjhD5NbddIhsNHXCyGk_sGVp-iO-7Ny0UWZ0eR4ti5Aiu0
Message-ID: <CAHmME9pA+AntJ6hWoFYpTVjh-NUSd0ZGXp5XiUuhQcq3HjQT3g@mail.gmail.com>
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:13=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, Sep 30, 2026 at 04:44:29PM +0200, Jason A. Donenfeld wrote:
> > Nathan, would this be okay with you?
> > https://git.zx2c4.com/linux-rng/commit/?id=3Dd216701724b7d8209ff4215065=
8ad5c712bdb503
>
> Can you stick
>
>   Cc: stable@vger.kernel.org # v6.12+
>   Closes: https://github.com/ClangBuiltLinux/linux/issues/2183
>
> on that? Otherwise, looks good to me, that's basically what I had for my
> v3 locally.

Sure, done. Also removed the now-unused array_size.h include.

Jason

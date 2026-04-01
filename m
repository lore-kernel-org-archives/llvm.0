Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70CC3EF67E
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 23:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775086987; cv=pass; b=ew8baLVpvapDpBIAHim91REVm6rjsoFlfC30xlVthNPEfnRQu716iq71XsW6AMewOwke8arEhBYolxJW/iZ8t22zH+uu0Ft32aTnaoZ3TYUj5t33Jr9CocQlqqswZ5lfHE58h9TOf48F71e/v+he6nfY6PAvq2CEmwzz6nM9oGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775086987; c=relaxed/simple;
	bh=vb8ZZRP0AUsWH7D3wGTnRXL9a0COAZFzJBs4dfJtueY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MggNX+uAVCbR30uTMRGiHEhFULkkhrN0EcV72xuMiZSeFabwvDspYHV1BgTo4Z7ahJ7dEfy46b/hnBVJZ0btylPDzN1LvO2YN1dx5gl015tUM5SYwxPUK0rXH2sthSd3Md59ytkmo8mjM2j5uV6ArgeESfqUYiKaGVXz/v8nEkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MZxqRc0e; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MZxqRc0e"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94ab69af6c8so1003669241.0
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 16:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775086985; cv=none;
        d=google.com; s=arc-20240605;
        b=lIVp2fYCYy+fz8tGBmyCAKNQrfq8+EGLtSwfpDnR2avQ+EntIwsx/9R9ca+wOOLYeV
         XZCl+ZsVm3xwLWTb3czchHJhwdp2o1+o7kLykpZJu7S/hzD/xsc15vYzNP0xzy223f5J
         dGtQK1oN99ZeT8q9kwm68R3jz/edQb5Q6Y/gIoR7IUgiqogUy820i8AmiOXoTnCnhICv
         us2AycyW+Q/3BVakLRIuLUkhljMraQH+xkycrPMiPIH+7HD5b4l4G7mqMbNYcGnDgy/H
         FvWnXkR4uBT64xmTqYVREeGb/C4iD7TNkUPUEWoA9Y4jxmOtmOXJ4+k8uZut3onmvLJA
         OdDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vb8ZZRP0AUsWH7D3wGTnRXL9a0COAZFzJBs4dfJtueY=;
        fh=i+o7QH6XH4MJgtfNc/3/shuNXTtWW4ko1BSDJEIitpc=;
        b=BJYzYl+5y/+tNZo3KHGObH9n+T1kj9hjGnOJpz9jvKpC5k1IfipG9fqrt3wjVQNbTZ
         2s3d7OaYPCUHfkUmgeOvgbsSzoLOtd8c34dXVAswaMp4jXu3jZA/JlrpDsM258U9euyQ
         F7ggRjLW0UHbQNgdAdIpc07lRCNO1a131uucVGyuZH/fxl2RmY+1thSOeEy2BlWmf+SB
         HZT4IQtomaAdTt0rcodXJ7+QrD4jDTuFzA1M3Q51ZmAv+/CC3il3d2rPfmcMAvuoy77v
         0BYYq/4PNgRkyRW1HMDQPp0zV7DXfk9Yr3WVMU1t+mfHHS2j7OOLfpMoFmXSxcTLiHa0
         7PmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775086985; x=1775691785; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vb8ZZRP0AUsWH7D3wGTnRXL9a0COAZFzJBs4dfJtueY=;
        b=MZxqRc0e9yRBpcVSLwgCiH01voOcVYlspHM4RSbaVgegTo9wE3myGH30HF/FoKfaei
         JYERF5SWCju80Ka872JI33Sp4tp/t+gjRcDSH4+KgRIqVMrO0rikpxpCarpDm5IL/qMt
         YxyVOVHYvF+92jCiltRPTcy59cfngcbYKGT0g4ebHG7honC119njUovGPWOJmtmTaT+K
         AQoC4RuZKQT0h9Kb7EkazFaBUB2arEfjwcViLuOmAtYXVFwtUv+Lm2/kNhs9IgHv8xYf
         bSTSxS/KzDvgh636w70ulK58z5AIJ+ck4lVY9HenWgh9McXE2C3z+lPDNFbh1DFRXLf4
         dwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775086985; x=1775691785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vb8ZZRP0AUsWH7D3wGTnRXL9a0COAZFzJBs4dfJtueY=;
        b=QpotTB6nX7QAuHEH0bny7Kb3GpUJM2YhEz6zD6FtKoG5zZ9wotRDeNexGN0ZEXM43V
         SFq35NKQZUnd3YxjKHMJeduRqY7rLdNivZQAZRrylsgCAp1NOCrIngLrXYOaLDJbOnQL
         GtJ9oUrP5Gva3cSVMZNTetuau83BjHGfZ6rQCttQbSXZseaWd9XnFKpngIvYYJLlCVqN
         P/cNUIjWTLRTCLBCEaJjbYFlysv2QFQGKZ8ZbbPIqvFtsiIjVUXIFNctSnEmtCwDmDMk
         tyUK6kKxXRzMoymesL6B1nmt+DAGW00ELGU39as+Vg4+nhUoQvHRekMyruOwOUpzI6VL
         XftA==
X-Forwarded-Encrypted: i=1; AJvYcCV00KfqNW5tfjuTPf5ef8zXJz9UCYjYds1DrCcz1TjCgp+3gZcvT1odYoKFZG/7PQPhGAID@lists.linux.dev
X-Gm-Message-State: AOJu0Yww1XpFlLEtkMyP37KRATIBXK/sFFpWzrS5SoAAMwnIRZdAysOC
	XNUDYj/IrZDJzNrHeARKolVAeBWkvQvyfsl3ijlDAw3eubBECjcn/iVcWbBgGjjdNvcFvF8N4Hu
	ZwcH+MyVa9p64SZgc6WSudSGrl9SbaHIeM2wmCfTv
X-Gm-Gg: ATEYQzxXyruQLaG8khmwhlyC4eQ22NduMLx+6yeUlY/bejVp0dqCekstBR4+xYDJxIE
	x43JyE6KfZn42DIwEvCvGOU9IVkqmNO/7DRrmwxEt+mERwt77BTlmhceOcqaLoM4IrnTyW3m71V
	ie/Bj7WuO3iG1LTjTQnIqmyrAcA7cGxsbgbVcgDdDr54W4zlyMnufFnYs5Z+2Ho8GHN3xnvvqs4
	VVNJtg5Smeqq7sNTmbQjzbhapXmiKBtwKaK4LxzbRS9SlOzFazkNMDpHJ4rERr7GtwExAGAofOz
	O3pFGYs=
X-Received: by 2002:a05:6102:3e19:b0:602:70ca:64ff with SMTP id
 ada2fe7eead31-6058a9eb523mr128831137.20.1775086984541; Wed, 01 Apr 2026
 16:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
 <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
 <202603311249.30B44C66@keescook> <20260401090815.GV3738786@noisy.programming.kicks-ass.net>
 <202604011313.AD471BC8@keescook> <20260401203053.GC3254421@noisy.programming.kicks-ass.net>
In-Reply-To: <20260401203053.GC3254421@noisy.programming.kicks-ass.net>
From: Justin Stitt <justinstitt@google.com>
Date: Wed, 1 Apr 2026 16:42:52 -0700
X-Gm-Features: AQROBzD_rcuI-ARbXbMVr7h8U1mc5_5HGF_2wM-4PZhtBnHiHxrvNEdk_0yl788
Message-ID: <CAFhGd8opNwwqjU35TqkbxRvHgwSb8KZ3+wa0Tr4KWumvjfRVTg@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 1, 2026 at 1:31=E2=80=AFPM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Wed, Apr 01, 2026 at 01:21:17PM -0700, Kees Cook wrote:
> > On Wed, Apr 01, 2026 at 11:08:15AM +0200, Peter Zijlstra wrote:
> > > On Tue, Mar 31, 2026 at 12:52:10PM -0700, Kees Cook wrote:
> > >
> > > > I think for this series, __ob_trap/__ob_wrap is what should be used=
.
> > > >
> > > > And for other folks, the background here is that we originally want=
ed
> > > > to use macros for "__trap" and "__wrap", but the powerpc C compiler
> > > > (both Clang and GCC) have a builtin macro named "__trap" already. S=
o
> > > > I switched to just using the Clang-native type qualifier. We can us=
e
> > > > the attribute style too, but there was a lot of confusion during th=
e
> > > > Clang development phases where people kept forgetting this was a ty=
pe
> > > > qualifier, not an attribute (i.e. the attribute is an internal alia=
s
> > > > for the qualifier, and the qualifier is a new type).
> > >
> > > Since you mention qualifiers...
> > >
> > > What is the result of __typeof_unqual__(int __ob_trap) ?
> >
> > Hmm, it seems like "const" doesn't get peeled off. That can be fixed, i=
f
> > that's needed?
> >
> > 'typeof_unqual(int)' (aka 'int')
> > 'typeof_unqual(__ob_trap int)' (aka '__ob_trap int')
> > 'typeof_unqual(const int)' (aka 'int')
> > 'typeof_unqual(__ob_trap const int)' (aka '__ob_trap const int')
>
> So how can something be called a qualifier if unqual doesn't strip it?
>

Within Clang internals we call it a "type specifier" keyword with the
closest analogous thing being _BitInt. Even the attribute spelling of
OBTs boils down to a type specifier being applied to a base type.

This hasn't been clearly externalized in the documentation -- we can
work to improve that.

> (We might already have had this discussion, but I can't find the answer
> in the LLVM documentation page and didn't search our previous
> correspondence on this).
>

Justin

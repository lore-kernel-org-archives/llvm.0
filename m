Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D41361670
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 03:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787023723; cv=pass; b=OhHMn7h9viGTjYXkQyblNvEQeXidDYOGPmFYAVaPbnWSu2+3cyn60sR72Fnsf6v5ALKbQM+YtVHkX8y1lbCSofzWMLmcc8Z3J6+gg6Ft/5x9iW/amtc7UXaVZzL8YYHoPfKwymIN9eknEAe7hCFmgk1IP0VyqARSi25rVfti0RU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787023723; c=relaxed/simple;
	bh=r5Zdltp6LAiYTHO3zsA88inj2HBXb4iZZpW73+FezSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAX+YNnNI3l3k3qW4rb0aN1CsQSBc/9JyW9KFcQY6Ia3bVMLx3ydcjwzJetpJN1q/prRCQ5hXxzQy3I37j0YUBMpW8eUAdM7uSZW8+L2tKPmEkkHqoVyK5q5UIx4U2ZqgUDGYxPpaBNdcm1q7qioR9OseAiqMzJJyub+VlYSZ6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZO62jHLY; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZO62jHLY"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so4200352e87.1
        for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 20:28:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787023720; cv=none;
        d=google.com; s=arc-20260327;
        b=UNvgppD7cIEUdTa4cqM15XplUvlHulOWPtmWOzM9IjQ05rYRQpCcES1iOzhBEX3oMl
         kYgzRaPEuloYiV/HmOPWLQy81CCMz8/igln86tLBln1tNo9nHdOe3Jb/rlZ75YlGU3T2
         hsu0vcpfNVTtH8PoMK/OvjvdnzMwL5Z2lZQxNdMjuPYHSY6PIaBpa9o5ZB0dDqPVCv2U
         /B5VcfLQncbmNRKthGTjJXwFbpDO7FPufKyYrm7tQR9Fp52NPHbqEl90d6bToxJklt8Z
         bCRdlSFprWniCVCcuqEnjNRHrIObEsLlSO/rYDkyCDgnSYzlqV2d8nb11Bfx58f+/nLJ
         jMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6z3l6JiM3xD5bZ85VYSBuxGVuvcg5CMcHjaAX+UkSSo=;
        fh=eLJb5xl5JurwhwBAQBvh3TtIX5Ydz1WETVIRYIl0gtA=;
        b=Y0u1sjiOebC8kI9Vw8Xovx6FTJ4+/H7qEQ4xe2W4F+oITzgbcFWuaZUEWGE3+7hrRg
         2+wXpcx/19+ZDg+QdTCxd2WoUno9DNTQmGB3AGjaey+YfpCKN19zNDBae1McJAewpLJ6
         xUW2TX2zXUtl80I//pl7nTYxYJNLGf6sMbe4VDNq/5PRnllau43GOV4iajsdgoBuCOqe
         8UXC9WrrmqlvpdIxSj5JxiPTnKtL1oJc5h3CgMeLj6VGLIJR6m8+Z2tv3naypwjKS4b2
         ayt2BCagAN4H5vZ0P/jL/F0XQMpDSelpLJzMSbDhKuGHAnz7VByi2fbmw4VpUWiSdgui
         qfIA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787023720; x=1787628520; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6z3l6JiM3xD5bZ85VYSBuxGVuvcg5CMcHjaAX+UkSSo=;
        b=ZO62jHLYwGTCK/UZVYwNT36FwMY9/u74GXEUNHK955glA9C2b77nD+zwULbycId6oe
         Qk90WwNTJKIB2Hbat0ggNgDRBt6fy+71Z4mgtoowdR7HkMpXz57uCBnd5P4A7OS1+aMt
         +ZlAodDZK3+Oo+eSTLK9XDzVwrJZVrH57beuaP3P1w/Ci1tTd8LBN7hPJn6on/ImVCNj
         IaZDIi8ZgwmDQQTyUz1i9hbeAmvZwjNn54kfboxYTN5IedxCxGNqMIeSzpdTIl7Drvip
         txscC6tjg/DDKym4afex3tttIdNTCv2WKcFASneGg/53bCosbOeRwZHmixflMST7QCjr
         g0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023720; x=1787628520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6z3l6JiM3xD5bZ85VYSBuxGVuvcg5CMcHjaAX+UkSSo=;
        b=O4k8ffg95VvBodY2hsFjq5H4GQNqFev7hgkjfO8nJtJssSXKDiuM6xzCeh3PxwqRzq
         oPlbnrDk+AjVUbuWHh8Tg6CGlPsg2PaMaiYiCaAT7b/qP7V2LM3H3/dxM/bXGaXH2W2e
         hk2rCUmdijuqWsb1lzbfGRR2KmBR/i0F0dp8CsHBHOrPiXUedkz0gdZlDqSpxkLlDtIU
         2iAm60MrnybZOIeI6OVmBJ5XxsVZU+LqmzoepjhxWZpKiKKfK32VgNVbN1GDNNJ7KJrF
         uH/mQPPgNbjw2XMFe5psAozOLLaAYoQUd0+pbKbIiMgv29pPN+wY/uZOUl8IZ2WmXBGF
         GUJg==
X-Forwarded-Encrypted: i=1; AHgh+Rpz3gGWPO9BbYnH4XJwPxMjykAubns7OFuoF0J4/ymGkB6Bd2n6qgx9weYeNR1OrLsrrePR@lists.linux.dev
X-Gm-Message-State: AOJu0Ywft/WMWkmv272jZPcHR9s08AFO8VrOQ5rYPosQEVM3ECiNusUA
	EMdcBfRWEsCZeV9DAjuKJMfqjrqOXrvxCvDAVP1/2abUn1lvV1bI52QwBxuYgYZ3kwdb/XIQXeh
	aSpoSLx0h5ACwhTflxmfrB6RVz3xkQu8=
X-Gm-Gg: AR+sD11w/GTNCW7EuZz9Gkirmnn5L8+t+WwkJ77VMxuJR5/6JlXLhR9aw/izL2EeSQD
	5LNfZgK7/ZVxRwNBdGr2nrWjs1TuxrI5K5z8HQplgSa8FCqDGreneJTH1qFLmRMBF8IrKjIHp/v
	FHj+BdFyKcmqYY5iPkWDvLjuhvYhbbadysvatR3HzPADVheuOBQgpHsPsFwPYzHgsVrlBgi2bUA
	FsRnA98Z5fLOs2uFXfUV5fT/zc1BFwJ9NfRKGvziNVxhh7l43xYN9lGDDlS/9zzRPXci8tHCFSD
	Xb7QgHN7YMv+bQxAi6LjCQQMcTtKgBVngyVpaux0MyS7GbRsgVoLi7r/YDf+Dsz7qO7fHbEePJm
	sDETdXXYT
X-Received: by 2002:a05:6512:8384:b0:5b2:a353:e4bb with SMTP id
 2adb3069b0e04-5b45910e12dmr3433140e87.3.1787023719369; Mon, 17 Aug 2026
 20:28:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
 <20260803195135.GA1083357@ax162> <CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com>
In-Reply-To: <CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 17 Aug 2026 23:28:27 -0400
X-Gm-Features: AcwNN1VO344mKCA8QMRP88i0pSnKKcGvbPVE5XDaO1o6Xs5HQ_NMVQdUDXtu7kI
Message-ID: <CAEdQ38HhVk0rmq5ZRHbQABgLix8hq49QjzxNDodk_++DmA5Thw@mail.gmail.com>
Subject: Re: [PATCH 0/2] alpha: enable building with clang
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 7:16=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> + John Paul
>
> On Mon, Aug 3, 2026 at 12:51=E2=80=AFPM Nathan Chancellor <nathan@kernel.=
org> wrote:
> >
> > Hi Matt,
> >
> > On Mon, Aug 03, 2026 at 01:08:40PM -0400, Matt Turner wrote:
> > > Two small patches to let the alpha kernel build with clang.
> >
> > Nice!
> >
> > > The first registers the clang target triple and stops passing -Wa,-me=
v6
> > > when the compiler is not gcc.  That flag exists to keep gas from emul=
ating
> > > instructions it believes the target lacks; it is a gas-only option an=
d
> > > clang's integrated assembler does not emulate instructions, so it is =
not
> > > needed there.
> > >
> > > The second fixes two uses of local register-asm variables that clang =
does
> > > not honor.  clang treats `register unsigned long x __asm__("$N")` as =
the
> > > named register only where the variable appears as an inline-asm opera=
nd,
> > > so reading one to get the live $gp or $sp yields an undefined value.
> > > trap_init() passed that to PAL_wrkgp and load_PCB() stored it into th=
e
> > > PCB for swpctx, either of which wedges an early boot.
> > >
> > > Note that the alpha backend is not in upstream LLVM.  It lives in
> > >
> > >   https://github.com/alphalinux-org/llvm-project
> > >
> > > and is a work in progress, so the scripts/Makefile.clang entry has no
> > > effect with an upstream clang today.  I am sending this now because t=
he
> > > second patch is a real bug in its own right -- the register-asm reads=
 are
> > > only guaranteed to work by gcc's implementation, not by anything eith=
er
> > > compiler documents -- but I understand if the kbuild side would rathe=
r
> > > wait for the backend to land upstream.
> >
> > Yeah, I am not sure how I feel taking the target triple part of the
> > first patch. On the one hand, I want it to be easy for you to test
> > against upstream Linux but on the other, I do not want people to read
> > this Makefile and assume that ARCH=3Dalpha will work with an upstream
> > clang.
>
> Right. It's cool you have something building. I'm curious if the
> resulting image boots? (That's the next major milestone).
>
> I'm curious, since we've yet to have such a case of an out of tree
> llvm backend, what's your plan, if any, to upstream your backend in
> llvm-project proper? Perhaps as an experimental backend?  We have bugs
> filed in our issue track for m68k which is experimental (but upstream)
> in LLVM.

It builds a kernel that boots in qemu and on real hardware.

As of two days ago, it's capable of building itself and the 373
packages of a Gentoo stage3 + a few other things. These include glibc
and other core components (in a qemu-backend container on a fast
multicore amd64 system).

I would very much prefer to have the backend upstream, and I plan to
start a discussion on discourse.llvm.org this week. I think an
experimental backend is probably the limit of what makes sense for
Alpha?

If you have advice on going about this, I would welcome it (privately
or in reply to this thread).

Current diffstat is

461 files changed, 29735 insertions(+), 88 deletions(-)

of which {llvm,lld,clang}/test is

266 files changed, 9871 insertions(+), 4 deletions(-)

Currently reviewing and cleaning up, so the numbers will change.

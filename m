Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5F9391855
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 16:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787070292; cv=pass; b=PW4CDt+WWd4h/7hTjssr2UzhKC23P/Uq4GdCfErb/6JvW24VVmeXAs9j6IX+cjvDOzT8izZG7wuwLuZi4OEROWSaY6lXwqKDDknS4QrAxZVhIlcQOJv7VOqJqa8N7nrhtI5g7N8o/3Ew2l19cysUJyI338C/kDeo9QpWIUBVLWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787070292; c=relaxed/simple;
	bh=33DXvXlll0HyJTxrb78h3DqOrjFtADo0DfT3EHT2Gmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dF92WHaW6RiM+LfLRzCSVaA+a2NRXC4ebFzPrGZFGPaf2PIJCwz1Xh2WVulPJVsA2JXK4Qv3U7krjTaWSD/715nZB83VOA0s6FRJRHOifGGRkiFUFOra/xJWBNHaZJHcJTnuxL/dOzRwJ12S4mAKveNqnVQqbg3Aobi+kOEcwJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tyrogbb1; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tyrogbb1"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47fd66a094eso1905053f8f.3
        for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 09:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787070289; cv=none;
        d=google.com; s=arc-20260327;
        b=mURwu3LRnc6OElfCkY02BELdpbwtNITOziQNl3W8thrNOJzGSsJhOflcBzn0/ijubo
         /VOEcJhWe/5oXFzri3ywtCnvHse96pP/sBO4YFYp0Ca4gvnpn36krDmAKP48K6N9AgA2
         rt3pbLSc/JaqO6kwaQjrOuDByB8wd1zvhcGf2ui3QgZduPw2T3Z7K2jyxF/YYZBF4Qrw
         h7BtTQbIdnPHAStqk2BPAJNxlpx1deav5Odhta4adYKGUtto8xHpuCcw9KZ42I6ZTM58
         fuS5BYXajpZTq6Tb2Zm40Xaz0QPJj0f/1zwRNkegr9s9Zbd4FwHLuZ/Lx0JVbwdPUXsz
         iIVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ig4ZJ5ec863N27eKcdbfitdKOwnVM6xhItPYCP368+k=;
        fh=6c3LOGRrgZLQ7BA95AJbXMfWPdKu2d767nlaYjmpeGE=;
        b=GmsQcWYnrU469BdeA6zSlSPh1OXBYnDrc6FDu2IFYQmLGsWJKy5WxqgB1/aaaDDWXA
         2qrtyqwcR4yIgCT9R1Ji/GQjGDvZyKnHtu1lLqhi70pjvTJ0ikO6vvmuw/d7AGIE/cWi
         gVqLiIMg/+BZBfso9ckCx0d5JdzA5yop/WaRwJ10cB5S/FHV9I/y7Ad15KcsXepAuwho
         iOZz4X4MqB0+CpJwmk5+jWvhVI+yDDHmeVEzFEE821lXLCLuj+bW2MumbKD7JV2d5Ivy
         tFPAUWxs30dGmfVVajZMruUMYH37xvE+S/Zf10iCkrO5NpCxN+wqHoknFW8+YQR0LzR/
         Etog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787070289; x=1787675089; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ig4ZJ5ec863N27eKcdbfitdKOwnVM6xhItPYCP368+k=;
        b=tyrogbb1vj8rNppj912sRz9DO8YDE9cF6/Izgo4d3a940Lo4/YimghUs4k0Lhci3Yn
         6VG/3OTn3QSaGaJebRcNhU0C5YEfGvwHFiZFofo1yjQn7Z5ls10/FmTshSDcqgh7DNgk
         yODNxZbvkvi7KVeTOBkDVP1D4s1PaFzFvGnpCpBBBSgg3KYC9jBQEkOTklfhQr/7hMWj
         3uUAECL4qWjIgYDrRqns7UM9hlKl7Rb6v+yhkFpnXg+quf/qPM4M34RIx5E0xgnpwmNk
         tOsPl8/imNrnUSk0Vtqy11V1POUY7wkHhpnzrXgBocskDccla+K2GjknQu8/+7Nnwj1c
         ev2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787070289; x=1787675089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ig4ZJ5ec863N27eKcdbfitdKOwnVM6xhItPYCP368+k=;
        b=EZ9sQf75zhOX9S6kvqMPMeCRcvmiWv0wdwnVcW6Ey7CPRincxYkBP//HzVwCwAj8Dq
         OT036DHPkSX+QQ5+G5ZDcWlc56h6nAxKcSt+vzCGjO52CwY3ZUaISwBfvyHl2F/uXV0L
         idpurN6PAvcHLoou6CpX4pTEIrj59ssGs+R5J6mKQPAeoaJoYPkJnmf8zaPfQBcCUuDE
         Lll8DQLHUCpX/S365PmAURBCh6/Rmbs6K6PHSD7NtFobfzGrbxhNN+a9gACif8J0p0Sg
         xy76SchHGHTWlzYCZqRU8eO9RbRPm0JTjNGWpsv7CIxErsrVcavUueI5AJ57MPKFE8g/
         QJvQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro48rm82hyOJi30pgT8ZcAo4Pzr0sr5dJOdZdF4POsTSmIysndSOW3wyBf0z5KZB4AwTnRE@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr3G26zFuNkzKlDb06gJBsJNgJ+kT5daqqGlXoMPwK9QBG2hhA
	+pzgnzgSEmjGqqZfJrMIinr/SspU7npzCc1or6foBg2Ycb5TnvfFOwuzHvur4I19DSwYg1IV0N5
	v3XHNbaNXnnwWuO3e8iSs7Fek0nkahXPHKXviTrV/
X-Gm-Gg: AR+sD138ON4/OPBWcgrUaHvyNAfIY+beWAZ2ZsQsRdjtcfLpHTz4xlc4w/K7HpOBDTa
	9Kg5UmTGO8TNgZEqvrIwpgPxbqVUZpbSBUEKgoFLe41jPB63jBEQbtoH/LtC84t76/fHPBVOgdw
	hHtyTmttaqM1Zx+mqZ4sld4Rdv1ul1UYb5QNfWtkuS79qa2BpFF4cpkyL4flfFLpPRY3ECBdfZZ
	22Szciyu4Hn7T+6jrhVfUHNW1L3HxnXz1iZcIooZpQKuaejzR/v8JFAViLxzpkVzHaDf+Me/s5T
	+56jYzesO4yB4JXp0qQg4xCGhMcGZi8xxuDnNnB4shLJtLdT75jcU4qKw8HiUFoQtLL0yyRA5rp
	d2eL6KGiZT9Z46aDocV6xpcKzuN43BPcvZp00iQQF8QmF2EgUZdshfhAgQ3ToBtC5qg6M
X-Received: by 2002:a05:6000:4919:b0:47f:e877:641b with SMTP id
 ffacd0b85a97d-482a8ff751dmr18513986f8f.11.1787070288729; Tue, 18 Aug 2026
 09:24:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
 <20260803195135.GA1083357@ax162> <CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com>
 <CAEdQ38HhVk0rmq5ZRHbQABgLix8hq49QjzxNDodk_++DmA5Thw@mail.gmail.com>
In-Reply-To: <CAEdQ38HhVk0rmq5ZRHbQABgLix8hq49QjzxNDodk_++DmA5Thw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Aug 2026 09:24:37 -0700
X-Gm-Features: AcwNN1U2F_9yv474aYoKrxgqvJJ_fOFHnGq3BGDcA7pmQq1T0vy1kWNlSniCBGI
Message-ID: <CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
Subject: Re: [PATCH 0/2] alpha: enable building with clang
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 8:28=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Mon, Aug 17, 2026 at 7:16=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > >
> > > On Mon, Aug 03, 2026 at 01:08:40PM -0400, Matt Turner wrote:
> > > > Two small patches to let the alpha kernel build with clang.
> > >
> > I'm curious, since we've yet to have such a case of an out of tree
> > llvm backend, what's your plan, if any, to upstream your backend in
> > llvm-project proper? Perhaps as an experimental backend?  We have bugs
> > filed in our issue track for m68k which is experimental (but upstream)
> > in LLVM.
>
> It builds a kernel that boots in qemu and on real hardware.

Wild.  Where did you even get real hardware? I know very little about Alpha=
.

>
> As of two days ago, it's capable of building itself and the 373
> packages of a Gentoo stage3 + a few other things. These include glibc
> and other core components (in a qemu-backend container on a fast
> multicore amd64 system).

I haven't kept up with Adhemerval's work on building glibc with clang,
but pretty wild to hear about glibc building with clang period, for
alpha no less.

>
> I would very much prefer to have the backend upstream, and I plan to
> start a discussion on discourse.llvm.org this week. I think an
> experimental backend is probably the limit of what makes sense for
> Alpha?

I agree. An RFC on discourse is the way to go. I'd use m68k as an example.

>
> If you have advice on going about this, I would welcome it (privately
> or in reply to this thread).
>
> Current diffstat is
>
> 461 files changed, 29735 insertions(+), 88 deletions(-)

Only advice is that if any of that was AI generated, please do take
the time to review LLVM's AI policy.  Reviewers have been getting
crunched by low quality AI commits recently, and are a bit salty all
around.

https://llvm.org/docs/AIToolPolicy.html

>
> of which {llvm,lld,clang}/test is
>
> 266 files changed, 9871 insertions(+), 4 deletions(-)
>
> Currently reviewing and cleaning up, so the numbers will change.



--=20
Thanks,
~Nick Desaulniers

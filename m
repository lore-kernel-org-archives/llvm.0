Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652CD34166B
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 17:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977521; cv=none; b=YCARcR5QYT2C8hs0hyfnWLHR96YNtlLJLnW110Be1hl/rqW/LxhRrlXvwaBS+cf3DMxs0Lpf8su7927TtBYrInsenpA1dmstbiSX63cG01g63BlCR76X4egaTTey5J4RdEZeH3cA3iZnNZBVkOUVFGED7YpJU/7kUczuGZgVJU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977521; c=relaxed/simple;
	bh=fvOPupQEnVmV/NcMv1g9ULLTpQ2SLYsqRQYOCWOIjsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LSAiP06YYi2w41SqmYE4sj3dAXuvyqufbAXShB1VLejbSI+E0DMSLi08y0P8tycTTJWf8dYk8fUG5BQqmwMLAYXsiII/k5UOd5X4BHstS1j/t5Q84NtRB6WVHpnsufAps7aNK8+2Eggx+f+xxNVQuKqXFt2GhwfRUVpVHxtWFos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=E2lYD4Wt; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="E2lYD4Wt"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9358dd7f79so54607366b.1
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 10:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774977518; x=1775582318; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5+4YPeQId4Y1cXleVK3wn4GXPFCaXiKdSrMa6qJPwN4=;
        b=E2lYD4WtckIOOIif+nn96jEFDHNBRsSkUhCXJZU8RrsvxJsABoibXJLNcv4iuxQ10X
         gLFEGVi6B4oKenEUkH0MKj49jDlSZFvpcJXHmKCL9hWblnv5Unab0t+Mwb4LmbU7rfee
         gpNW6JVq4ZAc9W4BxJG9Jik45S3R5YoL9Dr2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977518; x=1775582318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+4YPeQId4Y1cXleVK3wn4GXPFCaXiKdSrMa6qJPwN4=;
        b=Put+kwPac7fn89LJadD4ZjcMZonWXLeoj92Om3ax/JlKVrwdqzKVt9/J68NoRUB76N
         TAbDOuNbPsj8R/HsKk3tVpL3sE+rD0G85vXGT/QmENvyDQNvM5mLhv7alg7mXM8PeFwD
         UIrVAmyox5fnOYxOpu9K9resGwlsrT86YNijvey1iQUAKScHkR3fKzMCS9B0ZP8HcShM
         tZHODbGepP3E/YgwNjCLD7OEtsDd74DjbrTnNauBax9wwI7NDtQN/jNRys5w1XOfqUfW
         mqUD+Nt/ATZdBjywRhjzuPq8wuuj15CojzgoSD2aflG7Rsub/BfYC3e8VF/KGLYVwDQd
         hpbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIFDjZ6b7PkvTNuPB7cbo/dA/KkH04SiYmP/9LBq5rofVAYyjX6kdxF9y3aCiUFVIxKLPc@lists.linux.dev
X-Gm-Message-State: AOJu0YxFxIMTGVF30QIQaC6wkZk8krnD/kgMSDdW89rZnLlw2WjCrZyc
	l1eaETyUl8u22wxlJTvqs08V81+spr3MwyBjUJyyUftyMOozBQE3CYWgShyH03/vAWe08ILQmLN
	CeUQFmqJ9Sw==
X-Gm-Gg: ATEYQzzPM6UVyKP1ey8ec4aRr3a6PK884dt7bs3dDiO5Je6uQRdT8grFoWXLzgS2abh
	5FQqkugvUQfcHROKxr0JMe8AFjmr4yiN3UxU2E4FdkiZJVGekv2r9z2HVVdM8fgjBl8yoHPUMG+
	v+A47iv9Ix/vXCfPlelMNAH2M1p6MpQqmRH+dB1ZI9cTAQvE0irT/fwutLylMm1ee485iaS7Q6N
	j2IcefGdezgIkWaUeVI/6Ionx64vcLTM4hjTMWY6bhtPZjkiuoZt7a7RKt6z8PEkdJAA8fWzFaG
	IFdC3Oc1G0DLY3GYiy0cE49nr0BjYTAGHo3pTVHBbNPmLD2RIs8jk6pizkGySnIZOojbNpOmABz
	/2jKs2KWjyXOzbJyHAUEXbC4UbaXJwMNn3zELWYWualR99VsU4oI9rIFG63W2O9zkn7i3tEueRV
	ZaWyeJ23CyXpRYrNZvxdSOojxORFyJndoChvrmXIkKtjlW6rzpECUjnq+vo3u8nx85h/m5TWTsz
	PdZLgStb0I=
X-Received: by 2002:a17:907:c205:b0:b98:4d6:8c9c with SMTP id a640c23a62f3a-b9c13af0ef2mr39463466b.32.1774977518393;
        Tue, 31 Mar 2026 10:18:38 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae52032sm432570666b.20.2026.03.31.10.18.38
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 10:18:38 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66ba9dfe83bso4431685a12.3
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 10:18:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUU3SBy2zytnZ7WDMXnJdL1XQmr26/t/Xy1REF87PPYq4dpfvVPePPZdtozXVznMTu8tsiB@lists.linux.dev
X-Received: by 2002:a05:6402:320a:b0:66c:2ab4:1c17 with SMTP id
 4fb4d7f45d1cf-66db02ab9fcmr248797a12.9.1774977068945; Tue, 31 Mar 2026
 10:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
In-Reply-To: <20260331163725.2765789-5-kees@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 10:10:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
X-Gm-Features: AQROBzDm3gEHu3WZ_nfCrD45b6_U9t89WHlDWMoUx8NfrAs9jBI1Qm6jv38zdhA
Message-ID: <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Finn Thain <fthain@linux-m68k.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	llvm@lists.linux.dev, Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nsc@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Mar 2026 at 09:37, Kees Cook <kees@kernel.org> wrote:
>
> Current straw-man proposal is single letter suffix because it vaguely
> felt like the least bad of all choices, and they should be short or
> everyone will just continue to type "int". :)

Violently disagree.

I'd rather have people continue to use other types than have somethign
that isn't visually obvious for *VERY* subtle semantic changes.

If somebody starts using explicitly trapping types, they need to say
so. Not just *say* so, but scream it at the top of their lungs. No
hidden subtle behavior changes. This needs to look _very_different_.

No stupid one-character things. If we go down this path it would need
to be "wrapping_u32" or whatever.

That said, I think the trapping behavior is unacceptable unless
there's some way to recover from it. An dno, that "some way" is not
the broken C++ style exception handling. That thing is pure and utter
shit, and fragile as hell. Anything that requires trying to unwind the
stack is just a complete no-go because it's going to be buggy and
untestable (sure, you can have test-cases and the unwinding will work
for *those*, but...)

I don't actually see any sane interface. The "unsafe_get_user()" thing
with actual labels and exception tables works very well, but it would
require wrapping all trapping operations in a macro.

Which is maybe not a bad idea - it's almost certainly better than the
overflow builtins - but might also be disgusting. Hard to tell.

              Linus

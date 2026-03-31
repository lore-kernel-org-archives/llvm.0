Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DB12D46CE
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 20:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774988328; cv=none; b=BZt6tKk0viNizYc2LoL6xhltQU/VZvaH2XkYwxw6EngC6grDU0hFpGce5vfmwnXhEBdH6VlKDLlMgYFBuAkZhEQXJWDYFj/aJfzJJnkTqMpcG2hpvlvQvLb+LPNvC6XElbh3nG+GsB6br9g7bB5XGH4HvmoVr9EXUSbpuTe7fAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774988328; c=relaxed/simple;
	bh=MXnPS0QnV07SSDgjwdHCBKIla0I+UMjxd6c/XOBUKPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJddn5G3oC4b6cVworhuJezlN81lT97US7LvYxNAMPrRgaiBHQ9tj1IQnymyv9pnihmKEa+hyqnDc+UWf+nIUMs69q4jWiLmAl2VEuquzVQfYzs8GNpnrVZ3ubFmA8viB3AzDt5v/ypmyPH7rdI+MPx5sYn6+oSQD+v0DhYJBCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DkfKDCqa; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DkfKDCqa"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b93698bb57aso50773766b.0
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 13:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774988325; x=1775593125; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c2ktyrPBG7CFlGMbOR9QYSgdZ9nvYimpNIw5oGP8BII=;
        b=DkfKDCqaV14VpLzWXNd/eo1PW0mfZqLgaoGTPWevUuJqgXZf3XRo3C/bPqpftAQHCw
         2Hst/ZkTWnErmewKb9eoh/UnQ8gHrMK1UHUu72vBOnoXtBNM+PAGBfUM4eumr14aj/50
         NhtQytlCB6FfS3/o8OIzAVOkrP+/hya+XF0y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774988325; x=1775593125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2ktyrPBG7CFlGMbOR9QYSgdZ9nvYimpNIw5oGP8BII=;
        b=pcPMEZ4VMxPef1HlYxE++d/t/8clkGfVobnFH6gXcLHMTkljgDWapGzOr5jRGq+e/F
         eVA9dgppRbw+SE6nwKQW19ckMpR1M0l8lgQVCkouFXazPBQx8T4Rs0Drs5SSQPSxwCWK
         K/Jeo5cXTZoHBwntzURIE1xY3cjOWwE9TjdJCjpFFmM3ZIE8h2Rn9/O6Ffmt61fqs0P8
         ikCt3UGqwhNJKeIfFMZ6RDnvuTK1yGrlSD7Py9cD4OoljqlCt6/QwGwSELncdqnP+76+
         R8SKKPMHJ7eEx9R5965sGdRc9yKMx4FiH4aMNnExeM44ajdHBcqcTPVYn80031DYStiM
         o1ow==
X-Forwarded-Encrypted: i=1; AJvYcCWp41WPa7oJFrQ2AqPhceA3mdoJEqODi+8BQwq5sqgXEvrVLFHAMY8IfpwEF9KDiINO13Ui@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/zlktbtTnfXPgvExHkB3VMb9r9qANDECTSatX0cT/9u6u2DBq
	Hxo2FDXz9m18uzjFd0tdiqEVLVZttkrtSKJTYAgLpJ1AfJLkyiH/L4856XoifaJWYeTgzAUqNNX
	S0ZHAUYRuXg==
X-Gm-Gg: ATEYQzzRma4KMzx/J2V42PCTDqfytguNe9zJ9+SnUEwakBX2vXjvK/o2Ntx++1yIcPy
	8DH0S4z9sGnNS0SmACQyGJH+k8o88DqAoRd6LKXROMPOxF0lBKTSN8DXr5GJoPgGGLOp2mwAYw4
	RLtHkdAdYehD7BJjm9wPWPDMhw/i2RSMYGrleKUrGLXfghZAwHgIPngtFIM8pRDwBYSDm8Z3aEP
	0YMAkzasUhUK8Lm8FeXM7v3q1GWZfs5zLKpoCso3f4eXcXe8j18J9bNkdpV7PEgQqRxKGNv1hQl
	3dVOAGRCyYMS9a7IaRqO+7iBe7x9wEb1WRthlkM+7L/3WhfkzAweEs+znirOou/DoJTAhq/kScF
	W+RlEl1jCBFjDRViHDxf7mnucrHoYjIyJHTkl++jJpJA6/FhqhMCr51bYgGYxSJ08i4gvLVpLGX
	I1Z073vmbJDqNrkdsPezEib1bzk9sfl1vCvg28KOdAsbV/vCMyjObQRlXXzIDmInnPjaOM2uuP
X-Received: by 2002:a17:906:fe0e:b0:b98:654:d9eb with SMTP id a640c23a62f3a-b9be88c0daamr265121666b.22.1774988324715;
        Tue, 31 Mar 2026 13:18:44 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225327sm436256566b.58.2026.03.31.13.18.43
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:18:44 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66d65646c65so589004a12.1
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 13:18:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdzFQnBSa91tw0Qt+bIGGQMw655o1IjqQuQojFu7HwC1l5J5dySJnTtALt9IXImYhRsOcp@lists.linux.dev
X-Received: by 2002:a05:6402:4489:b0:667:f151:2efa with SMTP id
 4fb4d7f45d1cf-66c338618b1mr3066306a12.12.1774988323206; Tue, 31 Mar 2026
 13:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook> <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 13:18:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjo0gB6jVdRKj310atcM9jmmyr3t3VDut=FW0S9+v467A@mail.gmail.com>
X-Gm-Features: AQROBzAUONdaqkEjwnLXeyVn7Wp-adEWlZELPlH8sCIkK0YvCJHIOwC67Ju1r6A
Message-ID: <CAHk-=wjo0gB6jVdRKj310atcM9jmmyr3t3VDut=FW0S9+v467A@mail.gmail.com>
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

On Tue, 31 Mar 2026 at 13:11, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> We have a few years of experience with "unsafe_get_user()" and
> friends, and a few hundred places that use it, and while it's common
> to have several cases in one function, I can't think of a single case
> where we actually had more than one error target.
>
> I tried a quick grep, and nothing jumped out at me.

And the *moment* I sent that reply, I went "Wait a minute", and looked
at strncpy_from_user().

So we do actually have at least one case of multiple exception labels:
the first one in that function handles the "potentially unaligned word
access causes page fault, fall back to byte-at-a-time" while the
second one is final and fatal and results in -EFAULT.

But that case could have been written with the byte-at-a-time case as
a separate inline function, so it would all have worked fine even
without explicitly named exception entries.

In some situations, the explicit names may be very useful just to
document things: in that case the 'byte_at_a_time" label does do that,
but I don't think it's a very big issue.

And it's likely even less of an issue for arithmetic overflows than it
is for user space accesses.

So yeah, with better compiler support, I think that whole trapping
behavior would be great.

               Linus

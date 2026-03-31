Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37B7423A91
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 21:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774993854; cv=pass; b=dVCSt1W6ipr8GaYeJ77bTlMvBoViEm+6L0LRCPvmy8yHli1Gl0fF5UnnX4n5Re/2sC8vXaKJrvQ2Q1lyyliDjiTG+kot3FBwrK53W+pdd1PPLWgZUOHdTsgV2wL6nZbc+5Ia5VSaH2xh5hBrUmUv4TB61xLAKSwEK+MgvOcnA+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774993854; c=relaxed/simple;
	bh=wV2XHf4d1mRiH6xWNqUuoF9pM1xd5tcDK3VA/1dQDZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUJsg19P7u1nXqXxJKfxCHrdXB6v5BeC7qr4MecJ0n9a4fwpcXvPGs/Xo4sdK4CIeXcJgEX9mY0+1wXdgjcawS+Imci+hrtMQ8sWe9GtHXYKWZxcisPM1/GJzNvocsOG1z5ZRfs+KxDcw695n8yr/al18mMG1shnv+vnUHumTyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jm14ynI7; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jm14ynI7"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-951c5ac6253so1888523241.0
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 14:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774993852; cv=none;
        d=google.com; s=arc-20240605;
        b=FIGgmgyyAm+46U8R4rmakPyfcdIicrECJA5QRoxgaXCNWT5g+KBplfmQMbsUYwWBFB
         xTWczt7vxsi8opOM/26wmAT32mxTRjm55/1SeNC/gU7RYLPrF9c6Vv7vryLdii7wgywt
         ZpmnWav4v9nOz9tMb9swhTe86kuDSivCPVUi9a7zUoSmptNiecTMPNmbwRBW3RVwUBAq
         XQHo7X/lqHl+ZUDBbave3YApbRjk8KzqsK3kPzDxZbPmFiTYbtTqCjTrVh4YbXm5LQes
         zuLT+AqhC5Z55CpetF+MQKkPrkfXfetZN/oMe/Xg8ioeT+Y//nkqjL9TGqzIb76q4Gam
         Im4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fvGGAAIkJYXYlK2HRa+mui/7ZxP8IFY7+ERdHeXnYJQ=;
        fh=qM8cfzsMC9DYApSNAKEByFAsF/vkbgBjow+lq4PvvCw=;
        b=KZzVvEF4wpdOr6qi7kT+F6MyFV5tPA8weMEcrqWzqfsFmWJNpkISEj9DawYKFPWqcF
         mf41KgreZk3LLfZSeJcgdqPhU0e27f0OvIbL6dyV4VwSCxfRzsmxxQRAs1Heju1DGTOl
         Er3FjBmcptc1YK9cXBou9LKybuHy+crx0EtHwdE4sKyWf7JtQ1b+nodytWsjwwlkDepC
         X//hbG192DIEuHGgiEgeopIs9PXhF+4W3B9gyzlgCYPkPcvIKvdTkT53MhDb71594Xeb
         2plOHxP+6YARFKngGYkhbt+mfo1NND+66CJDnxXit7J7Qv3ZB/AaLF7L53M4SGvi81uU
         Za6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774993852; x=1775598652; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvGGAAIkJYXYlK2HRa+mui/7ZxP8IFY7+ERdHeXnYJQ=;
        b=jm14ynI7wni/ji3JZWt8wipj6ncuGnU0VMvUdI53vIUXjn/97GDq4ed9RqGxTd6Pix
         ImYRQCvbdkTjoeoRXJsTNJoweiq11XB5PfZyzgmzvQxRhGjYzHLq2jttUtb930E0wfun
         g5NPPaKpuzNZr4XqfCOtVBMpYpZn3BrfuH455Mqbw9M5VO80mz/47VKach3XC1u6OW1u
         A1pMtLZkZhayfxJV3OTeAQVRifPxVW+B8QzMbzw69+lV9q15f5XPEb9ubx9nrCZM7Su6
         OD2UeH0QdS5/spxbl3PNjfJlux2tpgpc+40u2nHQvyB+drgnsRhWRHv16f+wTtGCDneb
         IE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774993852; x=1775598652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fvGGAAIkJYXYlK2HRa+mui/7ZxP8IFY7+ERdHeXnYJQ=;
        b=W4tej1S88z/B6Fo04EFXnDl6LTzwEZGGG/80nvFVoJZOYpxg71eWbH0qqj38Y0pQCa
         uyUv6PPky0NtNW3CfngZeawKumBzvwIcfDA+AiapjYqjEGX0yNS9muzGNhdG33p1YO6e
         RDYlqsIcLJJ+c1QHG5FJcL3PK+WlqhmuNUoX7kd9VxcQGUrNSJ4OV8E5jgVZriqEYPfS
         THsqNsWWQGTLeUatZpo36v7vlylbG4WnVhQOhRnfgysXxu6vzH+SMQMS3aEaCqFSnhEG
         cSOserQIyF46D7lYJKeCO+AtIGDK9c3DPnHzecExNSp6nvy31J3yzyKKyZz/IIyVY4t4
         HaQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFSSSV4dcAFElNGKyn9EHnXU4YVNRu/B5BrYI8+dhCakNeYVH9a4+fpm7JNckD8+FyVADz@lists.linux.dev
X-Gm-Message-State: AOJu0Yzyp9EhSBukSyhCv9ii7WN9LlS+TXWeZFT2upTZLe+agSgPqhTU
	e+FNCfwrBFgZx+ONrpRjtb2KlWUVfU0WYNeXwu+bGjXf82URl64PXAD/2fJtnWwXU20OZuox2Vl
	KlO0IxnifT9pjsA+HzCuSFadIJlsc+SlpxH4P7psn
X-Gm-Gg: ATEYQzzVtBzxtuDJnAXbyEI1c3308QFXKtAhkYWEb9/8cn9uUWQVQsrM4CnUfSwtEij
	Nbyy3wf6sF/virR4p0dbCDifkQlDYOoy8aoxfvZ0KHiYryeNfzaxkQ7aWUWg40EdRUunCO7wHGT
	DA65yex2Y8yTsu7C2ubP1PdNE0NARlwxeb4rIzXhZEM0RfHUk8MKBbNMm0xjAcPL2T5k5XTu293
	VOK9pD4Gg/RaawizQwqzQkpLeCADSFert/JboT41mVDByjt9k/anMoTwDqIGyadexZeh1t/L9QG
	tWiwRIY=
X-Received: by 2002:a05:6102:2920:b0:5f5:40ab:2d65 with SMTP id
 ada2fe7eead31-60567fb080emr381935137.22.1774993851331; Tue, 31 Mar 2026
 14:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook> <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
 <202603311321.4EE9FEA@keescook> <CAHk-=wj9pWsgsbrLDOk7ipKnHbz3JvuqsmQ3DhGg-OKgKS9DUA@mail.gmail.com>
In-Reply-To: <CAHk-=wj9pWsgsbrLDOk7ipKnHbz3JvuqsmQ3DhGg-OKgKS9DUA@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 31 Mar 2026 14:50:39 -0700
X-Gm-Features: AQROBzCZD3X4CkUD9sEd-qirDA1mrMa-OH7YNrOM0p4tLkqwVMQeCLGoKwyIRLE
Message-ID: <CAFhGd8rE+ggYghcwUphSRc2ftQMaX7LbKKPwQZzsw43bg9VVmA@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
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
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 31, 2026 at 2:05=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 31 Mar 2026 at 13:31, Kees Cook <kees@kernel.org> wrote:
> >
> > (Isn't this just an implicit "try"?)
>
> Yes. And I think that's ok.
>
> I think try/catch is broken for a few reasons, but the fact that catch
> and try are tied together so closely is the main one. You can't "try"
> inside a scope without having the "catch" inside the same scope.
>
> So then the solution is to just move the try to the outermost layer,
> and I think that's pretty much what everybody does.
>
> But at that point, why not just move it *all* the way out, and make it
> implicit and invisible?

How do we feel about type-defined labels? We can specify sane default
handlers where we define the types:

        typedef int __attribute__((overflow_behavior(trap, __handle_me)));

... and define specialized handlers later on

int func()
{
        ...
        u8 __attribute__((overflow_behavior(trap, __BOOOOM))) product =3D 5=
;
        ...
        product =3D a * b; // if store is truncated, goto __overflow
        ...
        return product;

__BOOOOM:
        pr_info("%u\n", product); // shows "5"
        return -1;
}

We would then probably want a kernel shorthand to avoid long type definitio=
ns.

        #define __TRAP(handler) __attribute__((overflow_behavior(trap,
handler)))


At least this way the label is always defined somewhere in-source
rather than by a magic -fhandle-my-overflow-at=3D__overflow


>
> Which is kind of exactly what your suggestion is all about, and that's
> why I like it so much.
>
> It *literally* fixes try/catch. It makes the only really valid usage
> model just work better.
>
> (There are other reasons I dislike try/catch too, the whole
> "exceptions across function boundaries" being another one that your
> model avoids).
>
>                 Linus

Justin

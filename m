Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795548737;
	b=mVbdZiURMFsmYyE47RI5nsDyuyXw7DxCE+vf5AknTUMeyhiRa7H4ZDzdwQuma7WjtHZp
	 /0DbokZ4eGL93Tdx1wrrg5I5oJH/9b8pXS2XUUWGjcthHSuOxy6Ox7iArBQzSJGnTHM1v
	 e9EJMmdi6ekZ1CiTctm6gmPfbeE4BsLXfjlu/S/KWDcaBC/O4/YBqASG4b/hfUVra7jwC
	 SBokVwlqw1BT2myVsuse0kuXCUC7SQCZEjgLElOFRZ3MlF8HEZjPOdEJa9vDr/RP+c6wV
	 HUeQ8yXEHhV3/E/HqIdl6jyhQ7ONDIEJjvPc1gDnmMicH33FuwPTDZqm4xPDfgOMFGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZAxiOHywnX9WGKbU6OO6shBw5Z7J4sNZ2Iv1jEEha2M=;
	b=cMH/Rf8KyH/BXlzRj/1uABxj4/swoor9KxGb1mW9ahbfF9RU9qE6kOcu7g5zXKQk8msN
	 j+L9+XScUmO5FupfF7NsX3FB4jp4vNPi3GujCFx8df44RTR3DixMUfL6JXdSwdQViGyKT
	 laIJj071hoeQg6YjpMARLNulF9pQQ+4t8JeOAyVqxRDTH4Myqav2YJ+YvWUFwaXv0aHu8
	 naQhChnWuRvzgLw58Ax6RQaTwg0QaKj3bFpZZImV6rVKllsxz+qUatqJdtP0dRxYI2MEP
	 7vwduxHziQpWxxJIlosX659PP45jKhS11Lxs/s5tHnX3SS/6krpmjEiX8JyCtg+XTBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XVE73WTg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A56606A321
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 19:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A56606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XVE73WTg
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e47347279so2945311f8f.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 11:32:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795548735; cv=none;
        d=google.com; s=arc-20260327;
        b=L/UFfrPsuOWpwlGNvJ1cE7uK0KwmHkQKb5XKSeTez2BhzXgrKIqm5MKxS2MFslIEXS
         CzJE7wfm5jwODod4nfL3HkGa+pS6s2tKZVIESqFSzUhopgtNaZqfdClzxvfeq+QwUf/F
         x+bi463UQmFx6S8PD6LxBr52yzqgzKw7n8Q1rDwv2L2WtLFY2kCh2zcpNNzWu/D3jFva
         uL9JwNJe5Ql0i/yJgJDXszsrLB5gUlemqTHys8lLY9XqelVInGHlt4m87BOecPNTpYLT
         RoGqGGfX5O8RnltYsWkA3Lo60e8N/SnRrM3QnlL/LO4ZPDmC8bfvL84He7Xv4ZjZw/+h
         sOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZAxiOHywnX9WGKbU6OO6shBw5Z7J4sNZ2Iv1jEEha2M=;
        fh=6n6SpzLfRHtlpUjngloaCwAna6CzGtinYSs4A017jqc=;
        b=cf5vWvOcKV3X88vQrxriZblJAC8hbPXdz/I6hLF8Y+/1+Xu5VrrGIUvZmEy5sdBZxa
         P44iaZZqhk8iTLhrkDqIXjSlFiEKzWRUipifmF7NzE4zdBQdww7x+jYinb6Cz53pqLr4
         9GQ2v7wlrxRv5EVay7cFQ5UDDC+aW/kCLfwIxKpXBidVcWofxElXiygWJgdqK2aJc7vo
         b9o4bb/8ayycDRv1Mr0OWhvYZKA8pWNNfq5chPf2OljXxJpzYE4em1m/1Jm24A/fYO7E
         zAKI24UAP7AeVnOv6ysejTc/pEyISh2b7M4daR4bBjDUibKR5PElVeK6VZbVxXeHXQxB
         7QzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795548735; x=1796153535; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZAxiOHywnX9WGKbU6OO6shBw5Z7J4sNZ2Iv1jEEha2M=;
        b=XVE73WTgBDqRGm34X2wZn8VihoK57bF9IWLlN924IpnkcriPZ3TJt8cz9stlvMZZFm
         ie5/8rYljOaHBory3VQvQbGjGBRQuNgeq/gUdSgXUxKFtvzJpdNTVRAbwHDAZBvrk58w
         gBqJ5HKzYZqj2iUspIiztG24QZcplul1PsXIIuIq2TyVmQ3FFqY6/LZS0bqaE0dsaTD3
         awYbeRJIoTJiGXGSOiQJu5MNKp0JJz0zdzRSwUT6kmh7ypWD7MdCfJkNYW8Vvu4Mrxbd
         SGYt1abVcuhhOZaQ7vJIwRflQ9uADv7YG0/neySp8jPexiPHSMv0puSmeJG2G+CUZ7WG
         QmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795548735; x=1796153535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAxiOHywnX9WGKbU6OO6shBw5Z7J4sNZ2Iv1jEEha2M=;
        b=MPcDjxIkuhtyqKDNgPY0fjpxJygDgU7FUXydQHzguoiXKSivEYPgVl6c4tH1uV8zWC
         wq2HoOEIwgagpJvRbtCiKlh4JYIKvRg5Xah/LVaEEJeGp7VHENHM6kvqijEhRLeHnUCv
         qRGIvPUodE0iLTSCgJYUFxG6EsV6CcQ598sljvdgBbvwNWZtsVD3kDNuQRy/EE0yWHMB
         I7e5jX3upDv+yFhEJX0JZRIyA27aYEs276hYId/JrJNKJ/6BYvXsaw3JYF9Yn2wk6YQt
         QHXhyP8Fklg5W+zVvgc8OVqHpBMyAcfHqPWcP45vq79lH+7znHRw0o7U9FQwOKwPVOKF
         VlGw==
X-Forwarded-Encrypted: i=1; AL+hErHIxRJq9I7wG8I56HNySdSQbQZXgDmCE5qolUnvUh7MTDfxv7PRtEkGKbFscjLvii2XJ4tF@lists.linux.dev
X-Gm-Message-State: APuU4Z/3dn8Vsa84IIxDRJLDB91DzYlOnsg8mIQ76u3s4ivYrH0hEc2d
	7WwgLaPxoIcCgEB72l34iAUOm8901rkQzTXbyX8xkV6t1O1VpGFpfX2iZPcI5xOxkeJ3YyD9dM3
	gUwCq5KACZt8tEQLN4RbwbvqZjXU7V32pc+QyWdDP
X-Gm-Gg: AZFdTZdbEEoM76Vh9isMYOmcoi/wwl8Dj5qrhqKis3g6cbbNyCbc3aQccex+ciqanuY
	3XxcxnmnKzQCXwhEfPGfCGGzTgfPo6XS8C5lY1vpT7q6mgYeDgF7fD3rxzCSNJjNCfL474YKwhy
	+crdQx+8pOjG9ITJkollyNwZ7UHpiWGEC8+qEyXnr9nYBky4gjQkKLSW845Izsd8KMmx8u3wCOd
	ioo0xBJdxBt8n8ToKmfgVdVcgA30ut6/OdRKFEdIF6PJGtM+me5abSnwUcX2wRN0C8xFyGebSUu
	OV+PftRmWdM1vLSHapQB9hPZP66J43E00VYwagJT7el/abAeYJYc3AOuzLHRDSMpsCKf0oGmPjJ
	KUGxWnS5CoZ2Jm+gk1fNp8GI2ieYptT/EE0dmDDo/WOpO+qw6hdJE7UIuri+bkMOV4j277yfzaY
	eq2EDPQdoKO/54swMcdodHXGcQg9MinDloBmOlU1SzUzE3U+pNa2Yj4j+k8LZN3BWO1iE8AEfaF
	X8v/p4VI3p3CvvvjefSR4I/LVVD0IAuX6eIzw==
X-Received: by 2002:a05:6000:26d0:b0:4a6:8012:197 with SMTP id
 ffacd0b85a97d-4ad5d5f9320mr28719033f8f.2.1795548734442; Tue, 24 Nov 2026
 11:32:14 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122105646.2223131-2-ardb+git@google.com> <CAKwvOdkOjGkGajGMKtqcHpRSrpXC9UZrH9XPsiv5Rpcdte5tJQ@mail.gmail.com>
 <73d50ff0-36db-4dcc-ad1e-c34bf3ebbce6@app.fastmail.com> <CAKwvOdnh-0nOBdU=J+R-yDE7wrP_K2BZ7mY1icrL-nOQ3Bk=og@mail.gmail.com>
 <20261124163905.tkkaLhJ2@linutronix.de>
In-Reply-To: <20261124163905.tkkaLhJ2@linutronix.de>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 24 Nov 2026 11:32:03 -0800
X-Gm-Features: Aa3M54ouZRguUQR9nG6q7UO6lOaHzISYR95FpQ6HF3qArhsy-wx2-5UKaW59wuk
Message-ID: <CAKwvOd=KbZgizb1VhD-zq4S1jRGCxUaLM+VHeRNhTFQf+KMrRQ@mail.gmail.com>
Subject: Re: [PATCH] locking/local_lock: Don't evaluate the per-CPU lock
 pointer if unused
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Bill Wendling <morbo@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 8:39=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-11-23 13:52:09 [-0800], Nick Desaulniers wrote:
> > On Mon, Nov 23, 2026 at 1:23=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org=
> wrote:
> > >
> > >
> > > On Mon, 23 Nov 2026, at 20:12, Nick Desaulniers wrote:
> > > > Very detailed commit message, but you kind of bury the lede here on
> > > > what the actual problem this patch is fixing *is*.
> > > >
> > >
> > > Apologies. I'll trim it down,
> > >
> > > The TL;DR is that non-volatile asm() statements with memory input
> > > operands are not elided by Clang if their output is never used.
> >
> > That's not a bug; both Clang and GCC behave that way.
> > https://godbolt.org/z/sEhec4oae
> >
> > (perhaps there is a clang bug somewhere, just trying to suss out if
> > there's something we need to fix here; forgive me for being pedantic
> > here)
>
> I see a
>         movq %gs:this_cpu_off(%rip), %rXX
>
> on x86-64 with clang-21, not with gcc-16 for local_lock() and
> local_lock_nested_bh(). Are we hunting a clang bug or considering this
> patch?

Both; I'm just trying to better understand:
1. what is the actual point of the patch (see my "burying the lede"
comment upthread)
2. what issues on the clang side are outstanding and conspiring here.
I think a v2 with a revised commit message is good to go, though I
don't know if Ard saw (or ignored) my questions about the temporary or
casts? Ideally v2 adds git trailers for:

Link: https://github.com/llvm/llvm-project/issues/93449
Link: https://github.com/llvm/llvm-project/issues/245738

(Since if both of the above were fixed, this patch would be moot)
(I've assigned the second one to you, Bill, since you're "in the
neighborhood" (touching lots of related code in LLVM recently))
--=20
Thanks,
~Nick Desaulniers

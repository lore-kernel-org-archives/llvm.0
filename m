Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373B6364EAA
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026882; cv=pass; b=UhNZgqHY1IQpLiOcKadGhqqfCgkjvQSBxIpz3wA682/dTWsTkbU1rrIAieh7kHJHZFepVGYbk/M7ts0Ar+fCXtQd9mdSgyzfM8OlpKCFDUWGNj4rci8pKu/Ggs6kSC2kpSGa1Rwi5laIjMMlbr96AmAHdABxXx61+POzX05Tz18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026882; c=relaxed/simple;
	bh=yTJizOE+aTFx68oE3PlVDChTaWYKzRYowl6JulRmua4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6n7vxJRmh4GWFEHRvW77aGASjK8mqp46EEAmzSYB72WHVuyD6Eaas/07joe7uQDDtioud7O5OKFvF5mPAaj71CNL6JMk5ZQVLSPKRE+c9dZwOLPLd+1ts6kyXh39vI4zeqo2E5/kFSd37eS/TOP1ksmjT5coV+5nXmOcU/D8hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+0BIALC; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+0BIALC"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bda3b4318dso995233eec.1
        for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 03:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777026880; cv=none;
        d=google.com; s=arc-20240605;
        b=gHvdi6k5oEjlWPGLdxH8hXLrF+eCjWq5dWJVCx19eyvn3FNS3Ux2Y5PYxU3YcgP2vK
         +a3mWDpWESsd1c7LqqbvQo9WrTqiT2+6wVtfiMnz7zVnVVK1f0BznZtwlt9s3Pqk+bi9
         aPJIiiafyR8vjKkTFL9mQua5JKGXnQi1PSzevvvSZWrgwWXagg/VqNKXvHRfvcXJrqSH
         HkTwGkd7EPIEEIoHDB1b8zLNk9WEztB7qQvGduQeHUmhUvesnm4a3wn5MnUsqfFUXKxT
         oZnEolit9pPd9WgsI1x1pGjXyQag7sXu4aXWepNeqQte4sGP1DIMfrp1unwVUCS/FHfs
         4Ekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yTJizOE+aTFx68oE3PlVDChTaWYKzRYowl6JulRmua4=;
        fh=RJarqMI1B3/FdwLR6WC/Suw+/g26Ve8DUwv7/H6bElQ=;
        b=jWqiHg+L/hErprmA1Hrt+1p2wydHdH4pNZsE1cV/wXwHEOGgI6GcvrIglaFmxMiZfx
         3YnvQWzpChjA8ZVIB8MUABiubQBh5RF7tZ6XIc4c5JrKgioJCQQEEVpaQG3KtqnJbIrK
         dpg1UiHX72nrkXyCpanE0GITItY0dYFa19iaYEJ/gDJ21Kvq3KynjxNdEtu/D9k3TUjH
         Cklb5uL0JbElF7jpRvTP1UtEjvlrGai7lNhgJIYqU8PC6qZwsTkA6y81XvQ5Ow44iIfV
         cUU7QiSmGeMIaDyTFXsNXTYgkc9k5Ep2hoXDjxeO8i63ctiLYdkvHYFSGXspXANaV4xR
         ka1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777026880; x=1777631680; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTJizOE+aTFx68oE3PlVDChTaWYKzRYowl6JulRmua4=;
        b=J+0BIALCZ4jogRb4kl2SFbDpimWy9Z4Y0HbszINcydxI3R575Zhbf52FOCffGHz96F
         WdYTrkzHsm+eiMAPkevH7nCAlDr8bP7f/ktWI39+xZvZjuFopvtINLqp7MO0mZ361ik7
         92c0xh5XWT9x7iQE6prA7oWrwsyDX4P0Y6dIFtMiYOjqkJKsxN1ndgRK2TZfj14wXGi4
         aFhG+o5AaC7MDs0nByTdLc1KPFZcveQSrSGYEUbzmZ5gqDOGqKiFl++U5O6Y5++gnYsP
         C+JGHdJyrGRMLIoEtAcErKZgxHLZ57sx2dlGNHgHgIzuKJYR0u+Txli3KjSOFiEwgcPD
         VHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026880; x=1777631680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yTJizOE+aTFx68oE3PlVDChTaWYKzRYowl6JulRmua4=;
        b=gcrxixo7WSDpgdkH/lS/Yb/2TpyjQxZlkV+N8n5ssUsMJMQDjQOaIEUqvXF4IoqdUi
         Rf+N9RW3zpaRUEjWAn1AROuUoxuT34vea77JMtelA4SRY3G1byoNE5y3doNJH8f/3v7c
         uA4AdgC2RI3B+nV9+emUxgZofsHZIhEP2f8YKHLsALCp96CmNkjSf7vJZx19i1Ymk1Gz
         fiuakY8l3o+8qfg33xocWxaK05lWdIFAX5XVYxNQONAJGYamMc6WOMRkjbpIb9D6RswP
         RpR69q3JihSh3Wdq3mlx2Wd6VNoQp0rYSdHE3xaYrG8kJDB0yZUDAoSBgaipm1w9UbFp
         U5Fg==
X-Forwarded-Encrypted: i=1; AFNElJ/xN1fWvt0PCyLl96X24IMDzFDLCHpi9jXrSfqf7vAK62MVaRNThyIvl5aPaz/oRsE4o3mX@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg9xNAv1LhQEpumbeGbAGCUXthyFwLRM076klyzjNUxKtO2owP
	pWCbPshRAe/pA4TcAHM8D8DieKRRokXDfSjCUWTroCHKVNT5qWFIowqCBJsTX5ASy1Vi5sbPwkz
	lZjjTudgX/JZBXp0T2yzoEFEN/2bxWMg=
X-Gm-Gg: AeBDievN4mrVTbMjRtnlymlL5OrePM/tA2T2A5WgzyHvGa2YdCr+ilEl6a5dskR8EhI
	E+qfpkY+umFtIQYT9afQNmjg4PbpTEw6CYNIrlbvZvNOnUDoKJfDypEhpgCLPubBJUHJ2Rir6/0
	bfANHg4xr/sG86h15vCKCsbL9tB+dAhV31REEjwMktW/w/L9loBatXPRPpDQjNE0sikokOgbyT0
	DEy8kFpLtQFCXemVKGXFw7dcI9NAPaxgAD4QrV69uxvglI4VK80M0zeAP2qoLTftPB31SFkL0cu
	eeOmwhRmtdxXEAEDu2v+sZXwrEFqBIp9GxyKJ4m7sLGcf6ca0kuHJrKepRgeGhLLxwaj4nhr+qW
	NB48gvTypemitqQWlOTdf0CY3+YQtL9/dgw==
X-Received: by 2002:a05:7300:d50e:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2e478936a32mr6682650eec.3.1777026880251; Fri, 24 Apr 2026
 03:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424054742.45832-1-mkchauras@gmail.com> <20260424054742.45832-6-mkchauras@gmail.com>
 <20260424101425.6bde0e17@pumpkin> <aes7L3M1d_LvvGKa@luna> <0a81f510-7b49-4879-b0bb-3b24dbfc0788@app.fastmail.com>
In-Reply-To: <0a81f510-7b49-4879-b0bb-3b24dbfc0788@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Apr 2026 12:34:27 +0200
X-Gm-Features: AQROBzBsdDZLB2GUpMgvGgFgU1KPjXwk3TMpDFKjffQGyp1lulncbpRBZafhAFU
Message-ID: <CANiq72mZGb+mTwP-8pTLe81oM0QnK-WtQeVjKPiP5m8zK_tOnw@mail.gmail.com>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
To: Arnd Bergmann <arnd@arndb.de>
Cc: Link Mauve <linkmauve@linkmauve.fr>, David Laight <david.laight.linux@gmail.com>, 
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Alice Ryhl <aliceryhl@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Miguel Ojeda <ojeda@kernel.org>, boqun@kernel.org, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, tamird@kernel.org, 
	Nicolas Schier <nsc@kernel.org>, simona.vetter@ffwll.ch, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 12:21=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> How hard would it be to have a private copy of the parts of the core
> crate that the kernel actually needs? Since Linux is neither quite
> hosted (using a full libc) nor entirely freestanding (still using
> some library interfaces), the C implementation on most architectures
> has a small subset of the libgcc that we ship with the kernel.
>
> I assume the core crate is larger than libgcc, but I don't know how
> much of it is actually needed here.

It is fairly tied to the compiler version, so it would be a
substantial effort to support across a bunch of versions. Instead of
that, initially we asked to have some `cfg`s (i.e. conditional
compilation) to customize it in the few places we need. We already
pass `--cfg no_fp_fmt_parse` for instance.

There were concerns about combinatorial explosion of `cfg`s, so we
suggested `cfg(linux_kernel)` or similar instead, though nothing
happened so far.

The other option is to at least lint against certain operations, but I
think it would be better to have a way to tell the compiler we really
don't want them generated to begin with.

Cheers,
Miguel

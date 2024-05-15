Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB12E4CB4B
	for <llvm@lists.linux.dev>; Wed, 15 May 2024 17:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715793155; cv=none; b=AWP7Bdy7areaiOWc2XXF6/m4bNH/IEJvPl28eQdetbntybAWz92ExfJPUJYWL2IbwA+mqzeeEzaBq0Gz1GMp1R3QuD1BSWCsyzYQb3q/Bzzkp0Jpx3FNiMl20I4jBVZmC+lluAStwusbKKINobS9KT+FZVOEW+CUqU/VHANkWJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715793155; c=relaxed/simple;
	bh=sFdFO/3PseRV0I24tfvAl/Tu3SeNdZ+dYLb3bjXAJu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWsRfcOTdRbYBOt/Wpm2rd1qyrE2qlgshoE8CZ+Cw4q4hnM8aS+LkbLDw1KxjoshcXwhjzo6tpf07MugOVsGIug1lUOf7f21Z2NMm0WnDWwXXAX9JmzWSNKuWr0nTbKAmH1STV/gbH01Wu5GnrF2jcqxCeKonOYhPuvPbBIofjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zXG45UhG; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zXG45UhG"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-24157800275so3395567fac.0
        for <llvm@lists.linux.dev>; Wed, 15 May 2024 10:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715793153; x=1716397953; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFdFO/3PseRV0I24tfvAl/Tu3SeNdZ+dYLb3bjXAJu8=;
        b=zXG45UhGxuwrDHRmAurYSwijgZ9rtNqFsd+sICHtOfzWJUFASCoI+96oKc8Gf5DCy0
         PobvCR2RDMkIIlZxHUiJnjQjozB2+/LibtxR+ruuqSzm6kA7fCyTPZcPzOP+cLmmvytc
         3z4pC1jMREG/grp7T7a9jmnfWzn13zeWs8Q8ufqSVLgw3FRRvRwEw5kK3QMhpt7ZaW/z
         6VrCrP/HiH22bTYVFAEW6z6wsaQ5u9KP5wJUYGcydWo3KfgEMqtH1xlz8KuS4x5i36+w
         npqKUIdcZNpD1/jveZaUmAzfWuwgvQn/IH4m7a/wFzzzHnqhLTT4c2jmLti3JusFwfwR
         f/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715793153; x=1716397953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFdFO/3PseRV0I24tfvAl/Tu3SeNdZ+dYLb3bjXAJu8=;
        b=duEeyyaCZQdh68d/F07+rOkuG51Uua4N8r8BzRhX7+x3oVYFT9WhFOP3B7ikD6557T
         /RA1wBi8EygcJupu+wKbq+FI88y5hpnFR5n7AdMgiXDkrdzMs+F3K+8lUQgIpuC6COVj
         IeWIjwqb+hcnpPjLWoHI8x6HStDEGCCr27yUgBcIvE/sXW1VpP98V5QqP9f0GksEtP2y
         u/8vYScD5L2bJjTK+BKpswrV9HwcTphSIy9tFl7CE3OJ1yu+6PJDKvYcrc3Wu7gVE7Fa
         3W7O6XxrwYp5P1DRVZWMrYWJK/D53e/W86Xjp0zovjeElYujIk5FsnBdsq1MRydOrYtu
         ZTNg==
X-Forwarded-Encrypted: i=1; AJvYcCVAkrrc3bRS7XO8UJ/06aBVgxixjN04kX/7R1E+dj6L9k5LbSukMiWLdL53cSFsSEUlg9HdWAYSVX8CTydxzhoRe+D3Jg==
X-Gm-Message-State: AOJu0Yz7z8zcEICjQoEDV30x/IPeLMOIcnFrUcJoqqNFniq1O0Qq/b5s
	CzsLJwH4ls5r8GSgZWsU6EQ1Ab4HSHidXjQ4lZamMApFEvCgCbFAUjo1am1tF3P7vtvX1IsYQRO
	kQc4tEshjJyhGyGhjGRkwZftzKI+evSlnpZ5gG8KekTVfdh9pBHjMfdM=
X-Google-Smtp-Source: AGHT+IHdPnCg97tJxWZG1Gb/DpWshKQCgosn26p/oXEI08Q9kC9bnAhNtdBzk1KnL1lvOIiK1jkJOT92D0YO6qHuMVs=
X-Received: by 2002:a05:6870:1690:b0:23c:ee0a:260f with SMTP id
 586e51a60fabf-24172a23552mr18594820fac.3.1715793152544; Wed, 15 May 2024
 10:12:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404291502.612E0A10@keescook> <CAHk-=wi5YPwWA8f5RAf_Hi8iL0NhGJeL6MN6UFWwRMY8L6UDvQ@mail.gmail.com>
 <202405081144.D5FCC44A@keescook> <CAHk-=wjeiGb1UxCy6Q8aif50C=wWDX9Pgp+WbZYrO72+B1f_QA@mail.gmail.com>
 <202405081354.B0A8194B3C@keescook> <CAHk-=wgoE5EkH+sQwi4KhRhCZizUxwZAnC=+9RbZcw7g6016LQ@mail.gmail.com>
 <20240515073636.GY40213@noisy.programming.kicks-ass.net>
In-Reply-To: <20240515073636.GY40213@noisy.programming.kicks-ass.net>
From: Justin Stitt <justinstitt@google.com>
Date: Wed, 15 May 2024 10:12:20 -0700
Message-ID: <CAFhGd8qKObvqbLJWvkG+Wfuy0gpWiTsSmFrBO-NzC-akB6bhzA@mail.gmail.com>
Subject: Re: [RFC] Mitigating unexpected arithmetic overflow
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Kees Cook <keescook@chromium.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Wed, May 15, 2024 at 12:36=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Wed, May 08, 2024 at 04:47:25PM -0700, Linus Torvalds wrote:
> > For example, the most common case of overflow we've ever had has very
> > much been array indexing. Now, sometimes that has actually been actual
> > undefined behavior, because it's been overflow in signed variables,
> > and those are "easy" to find in the sense that you just say "no, can't
> > do that". UBSAN finds them, and that's good.
>
> We build with -fno-strict-overflow, which implies -fwrapv, which removes
> the UB from signed overflow by mandating 2s complement.

FWIW,

Clang-19 allows -fwrapv and -fsanitize=3Dsigned-integer-overflow to work
together [1]

And the sanitizer was re-introduced with Commit 557f8c582a9ba8ab
("ubsan: Reintroduce signed overflow sanitizer").

>
> With the exception of an UBSAN bug prior to GCC-8, UBSAN will not, and
> should not, warn about signed overflow when using either of these flags.

[1]: https://clang.llvm.org/docs/ReleaseNotes.html#sanitizers

Thanks
Justin

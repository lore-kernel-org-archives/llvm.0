Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B2E41E6C0
	for <llvm@lists.linux.dev>; Tue, 15 Sep 2026 17:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494977; cv=pass; b=o7BrDSU8ix/v2ftSrnShUQx+km0obu/fgGQddxYC75F+/ik9mtrnEmMSt+dmR+QaWBPV/ZFh38HVr81MWYHK53XORibY5K23ZvWtftZZaAkKqbQVplHcRe8s2csteG9H96x8Q5IX2laowWAyD0a7BV8LmTFLpPWEFJWkMJ+t/Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494977; c=relaxed/simple;
	bh=P7a2zFFMvnl7AMMV9J8HoSFvOnO26MuCDolXpy7oTxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=brygQHRPp00YjfJh2QVFxN6raT1WFBwnrnKkgdJzLR03YtX8YfIK5Af4knF9cej+mQbfY13AiXZMa40CKxNq1qMbULOlNPs7URTo8EF9s1XoUdiG1d1JCIXm1rgt8yvuaaHUU44YQBTUa1F7lLFKIOUarVdrv8lbqc1zeMMwnn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QSfRZJub; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QSfRZJub"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48586861639so537849f8f.0
        for <llvm@lists.linux.dev>; Tue, 15 Sep 2026 10:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494972; cv=none;
        d=google.com; s=arc-20260327;
        b=GrgfXqoC/3zp/12GFigLbcmJse2Cr9wOLrnbDxg0RJf74koGZ6TA3uTkyWlevXEj0N
         uDvvvFm40pfOxPKsuoTTK4uwkFIClR0Ujh9Wl3cEQOM0J25V6G1Wg5kz2DAS0KByvs/i
         288O8NJCj9X6XsohgHZCoSuM3u37tiQl7Imnp3G+DVklVXnFf47zWCG7DRqBLNc9vYD+
         GyIJkuNve2AQbWlE3vuncmwnLb5SCl1FJ0hd+fSVx6OmffLCQ1Dc4yhItY+63mzQBo57
         fdMfv2SuqPeoFXhZ30+0zgH8uDZpXahQojPpf30kNwH1ejYsjh6oLFUH8tZN5OyQXwcB
         E/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        fh=ltIFACg5vS2p/1sFh1ojJ7dJP/Zd2oZCnxQwfV6plNo=;
        b=QHTjjc0AQpCG5cktO56lW9JFTBs325diyXE9nCnAdby0OtQh0zk+vXgjNgLTjt54ay
         zx9klg5rABJrWbpqPw5UrcsXuX931OKgO1G6yAzwLHiwK7s5w9Vk6Ihx4gvSVSLynN9E
         7Hp5hYAlQAohHi+hlSnRyu4ovFrc/pJtlX1y06UxmdNby6PeqITHh5iH3IokHR649DSc
         ETDc+9BA4cqE7pDGzY136E7IBZJG1f6yV6CGzPiX8CXOuYaU1NW89xnrw0LgjZ8Z7RlU
         Mr2E9SoHv9mCEYQ8tPNUoY6XPyMxow0pbcNUFFlG2xDAamSThMkTbpG5rkCDdJADbV1r
         VScw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494972; x=1790099772; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        b=QSfRZJubt+qg4kt8RCZSkiT4XgXnsBEgc9dADrjH+Nb+sKTWc5dUqMmuANwIP/7knJ
         RQfoXhLCLfjkQncQJVnZKZIhg8NhVUypArxJLQu04XaNR+A4ioX1JmZYl0aqMN19EnWh
         VvljpfExZfVFxBwgOMKVwUllwVSFZJdUK+FvUnq9Xl4MUdFsNevu8MOUcvB4fZe0J57c
         2hViPdxY4RnOM9DE7WL+akgoVKtR7RxhT8jKNUbDs/RGem3mGh9F9UCKtKEsCpBdEncU
         +DEAt0nFZI2xscPRJo6a5OaV51QwciKQM+lJpfKEFTsya/7+Dmca15sjoZxlBv7DKXvA
         LQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494972; x=1790099772;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        b=HoVGCuHE9xypmKe4qRbrLNDRiic5WxMOsqklRoZYL31qsf6W8ONauk52mLo0SbTCP/
         yKS7IWZdRF4GjWkyW0YBeuMO7S/7Nd09P0lGFa8BBpiF+Dr3joHuej55dkwn3AOmHlr9
         Hf4FMSG8PPQcywYdv8ABT5jh/ALDOTCxAXVHutmBth0oAL5CzJqc3q8BTPlMFBf7SIgY
         BCM4JybRlEeKrxWFLAbFG2QCjBzYsEyOkySO9OMXDtarTDIAwH3sl/nHnwO644mhhoat
         vP6Jr2tYJ4aUCOwF6qcCQcFFyf+BxfV7y4xjlhjCNBP4yrNnqOO5xfbBqky1LwNkljpa
         kNaA==
X-Forwarded-Encrypted: i=1; AKwUvByFysEB4vo9aHh4if0r7Bjm7FbzBHKXz2nh/pUk6c8Upfee982CdT/CQqF4DEjFtn6WjSrn@lists.linux.dev
X-Gm-Message-State: AFuF++kQJgPNQY6r9wb6KKoBpFYOXJPVQPCezVlSrYqHk8tYPqWKg+Jv
	yQ6lSL8Einxf6fJWe81V6EiFKHYMAtxBSSej5kQRt+Bs1ms3tRzvO8Azn05cr0RjkoukJJWJaZY
	CMPSai6/0we0wLPMqhtdeKGXod0q+ZjxMliO0XgKN
X-Gm-Gg: AYBFou16+WE8KV72bnfHvNKP0hGQ1rHTecsBr3lf1ZZoQbeU1tpX6ItyILD7q7BXkJ/
	LXuwkZiYOrSFM8XHj8Q7/UNiYEKIKKYUrdQ5TxTLsfeDT6MkNcPImpWa1nNNX8ANe1gx+GUVB+o
	Fa2mtz/7ZlvIZxuMRShCF9PV7QQktm6vsDS9AkaasTBB5TpRloPtQp4LOQVN4Hc51PXOMoM9WKP
	N/doD8inDijbBM2EXNEsKI36i5LZZvID3YVx/IrnrUEx3HsintQbgKOH8cJd3iSCKq2yM4uXIix
	CLee98Hi2N4PbiyEDJwF0xfKU+K1193z8zNczk5lxR9NXwTkZU5EXxbIozxDwIZU1sOie/Rsq8v
	GmaXmHBoTGb8ZXLHPZum9/h+XHQORXdZPvl1vPVqvk32Q2OvU04705OAfBHlEWuS7cAU=
X-Received: by 2002:adf:eec3:0:b0:487:13f:4968 with SMTP id
 ffacd0b85a97d-48705b5d792mr5756089f8f.11.1789494972051; Tue, 15 Sep 2026
 10:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-14-39817ec5db23@kernel.org> <202609141056.6AE2C82E@keescook>
 <aqkZvtAKWYf9-1ZW@gremlin> <202609150943.000EC9277@keescook>
In-Reply-To: <202609150943.000EC9277@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 15 Sep 2026 10:56:01 -0700
X-Gm-Features: AcwNN1WPMMWK_d5_qt02ICUH5UNGl72dPPgrM0zv_mQxUiZh6yRKMNR6HBnx31I
Message-ID: <CAKwvOdms6QWc7RMW6hJb3qzgmpK+aw40C7b_h7eG161ie_Y8ZA@mail.gmail.com>
Subject: Re: [PATCH v2 14/21] kbuild: batch module finalisation
To: Kees Cook <kees@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 9:49=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Tue, Sep 15, 2026 at 11:44:01AM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Sep 14, 2026 at 11:00:27AM -0700, Kees Cook wrote:
> > > On Mon, Sep 14, 2026 at 10:22:13AM +0100, Lorenzo Stoakes (ARM) wrote=
:
> > > > Module finalisation on allmodconfig builds consists of a large numb=
er of
> > > > very short-lived jobs, and the make job dispatcher cannot possibly =
dispatch
> > > > jobs fast enough.
> > >
> > > This "cannot possibly" sounds like a weird LLM language intensifier. =
I'd
> >
> > Again that's my writing actually, probably best to stop assuming LLM no=
w ;)
>
> Apologies; whatever the opposite of the Turing Test is, I have failed.
> :P The AIs are winning: humans are suspicious of each other now. :)

Is there a term for this yet?  Cylon paranoia?

--=20
Thanks,
~Nick Desaulniers

Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB97655409E
	for <llvm@lists.linux.dev>; Wed,  9 Sep 2026 14:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964907; cv=none; b=DrnindSyJUS1c7QEijiUfEiUa5z+T2lKQ6UQLqtlCN6JRVe0hMUJ4U12q9xFX7eiTbIwtu1mU4e5zFypk7VlmLR32kWQgF2ko11urREBWs9jXPpNx6qWOzr4wTUsgspgzUnmUqJNSvWieBWMafvVKVXye0uMs/mkoN/BfEfWqW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964907; c=relaxed/simple;
	bh=C8wlVunptoThlz2K9sFX5JRkjNXNpZt+isVUJZEm52E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8QwkGhmO8MMcBTNr6esfhkQwhr3hxZeQ+xUq3WxRC28iD6oolhjnCOX7l4AzOd8CFWL2KvWfaA86K2LPadRJzSKQnaGJ/lIzu2sUvgkm5+711rsqVScKQQ3uWqBeaOW5Expn93jEZcamu5rZ/oeMNrE7DtGb4Kh4kMLhhLlcNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GdvIdpa2; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GdvIdpa2"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a4a82aa383so5347001fa.3
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 07:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788964903; x=1789569703; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG9J5Co/VVYH+Cridb4B9lUnRMf0qj5TUZQIt0oEj84=;
        b=GdvIdpa2j141Ar4aFRB+dQ9Y7MiIoFqSGbDcrwkrgwyzvyjh9MTE13sZ6u7kTYTVTV
         FgcYGlxjzkC7+VQdunjqziiroUfMOHUgAFQcPadPGyp2SP6Q3XnALhi5lKGUjJWph+jG
         4XcaboXaUPf9uQuZER7nEUYCz88minaOFoyUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964903; x=1789569703;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tG9J5Co/VVYH+Cridb4B9lUnRMf0qj5TUZQIt0oEj84=;
        b=swvfsLUZ/jEersEg8SZfli2lCxZjtIwNva1mP+l1A+CTzBI/R9F1uzLh99caXoYrJs
         M6u+8U764Y1XZxc3bWZ+lK7lrOWQpwQR40GscGlzIwOgq0BBpoyDHG5AyZxQ3pEZJOFJ
         yn0eQINEHUFpseOG9Xj6CHYM5m/74XVI3w1iZ2+XFr23NHRvT+8Ax4/Tk5TrBol0SKdn
         KM8wRDew12Nq6kJj+EG24PXhdLLR5k76IrBefhkb9+AvELbii6Uw4nKHYnA9C5dGPOmK
         SBBjcF6UoLTZyCxMIt55kAFoJY17QQwLT3Rq2VF7EnGw44j1K56Rk60+aJ3T+gk8DHEA
         iz0g==
X-Forwarded-Encrypted: i=1; AKwUvBw0uB3uql4G++mNhnsXq1h0wWEjMuoHyW2hY7HXJLk1B1Fh5Ov99UzH0hFwqfqbyr+XjVmG@lists.linux.dev
X-Gm-Message-State: AFuF++mn3nPfiY3wfCs4HAT4LtSaSExnkZi2s9zAJX+V8MAEtM5Ejyw1
	IjSQx2dENY+K63SM1hRMPdiuq7/QEN+TJzGOKI//Sb/j8aCgAqkDKjP7P48nYhASQigojB1hyQX
	cDcMJbWw=
X-Gm-Gg: AYBFou0X2gjnKo8iNvt8ld2oIHz5+bvzuvOw57/LlEMq/iRp/Dvc99WmUuH/qM07bWR
	5GCDdzLItedIJsLRMfe/19JCtNFnUoekpGDR0fOuUkQ2xTkE3WyDpZkC+/Qyh/4n5EzhsaixSQJ
	+nhjE/qjLrYUTOdr9hsMQCWWftIXIN6z1amrOGIA7dOYZgjQrL4Pb2c7U7ue5EZ8Dm/0godr9CA
	8dqUaArfGHFuXH130qlktYA9+GVOYmixIr0tYbRsRCLyZhdQ32YJSj+Ljze7NYLv1J5KALXccVP
	sjOrQ2ECz4A5JjWRO4cSLQhGoU0N1P/6wPF9q0tFI+goSNtQsw0hNYFHloUDSKy0qeDrE3aM4/v
	9jtRLAoAaTnKN0owkR9ULnyOwAvv2XjUEwDyr0pTXrLdDfcABMvwKu0y9prm7IQNdptds5Hu6hX
	VqAc8U5sJW3G2sWRulv7GK9INKHsq4w5ElEyrAmiJG5ich5RzEp6gIjlmKIJhpT45Lf4D2ifmrj
	koxRUBi+aAbPV9MtZYN0h6YY4fW2DKcOvNr0wh7hfuFwGuE
X-Received: by 2002:a05:651c:4407:10b0:3a3:364:f797 with SMTP id 38308e7fff4ca-3a371b52947mr30509731fa.8.1788964902524;
        Wed, 09 Sep 2026 07:41:42 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705f37f0sm42521521fa.41.2026.09.09.07.41.42
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:41:42 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b7a9882e19so621284e87.0
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 07:41:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwnPpGDXMTHtJt/eagG1xkeLcZs3129kF8x0TULpW7p+vWw+UMdzUrtz3EW8wbuWWRrC1T3@lists.linux.dev
X-Received: by 2002:a05:6402:208a:b0:6a7:ee56:615d with SMTP id
 4fb4d7f45d1cf-6a7ee5662fbmr12667373a12.31.1788964533277; Wed, 09 Sep 2026
 07:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-4-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-4-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 07:35:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgryL8XqjFcO=EQwKdqNn51BANiv16QiqYKCUdXxDQBmg@mail.gmail.com>
X-Gm-Features: AcwNN1VOdEagBQA5D63IF5vfBaLV4II6ehpTsThafIib6q5kHaeURBrIxknkBpc
Message-ID: <CAHk-=wgryL8XqjFcO=EQwKdqNn51BANiv16QiqYKCUdXxDQBmg@mail.gmail.com>
Subject: Re: [PATCH 04/23] kallsyms: output binary data to speed output and
 kallsyms assembly
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
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
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"

I'm finally going through this series, because I do care about build
speed, so I love the concept.

However, I haven't actually applied it and tried it, I'm just reading
the patches.

And this one triggered something:

On Tue, 8 Sept 2026 at 13:56, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> kallsyms generates an assembly file that consists mostly of .byte entries
> containing compressed names, token strings and name-sorted sequence
> numbers.
>
> For an x86-64 build with 158k symbols that is a 37 MiB .S file which takes
> 0.57s to assemble each of the two to three times it is built over a kernel
> build.

It strikes me that this is clearly a bit faster, but it still seems to
be not really fixing the underlying silliness of that code.

Wouldn't it be much better to actually create an object file directly?
Afaik, the *only* think we ever do with that kallsyms-generated file
is to immediately assemble it into an object file, because the actual
asm file is useless to anybody.

And we already require libelf as part of the build, and we already
kind of do things like that with gendwarfksyms.

Don't get my wrong: I think going through an asm file was very much
the right thing originally: not every architecture used ELF in the
first place, and when scripting things like this the current situation
makes 100% sense.

And no sane human wants to deal with this kind of grotty detail and
spend the effort on writing an ELF file writer.

But when there's a LLM that was used to find these things and help fix
them up, and it's something this mechanical and the result really
isn't ever human-readable and never has been, I feel like the obvious
step would be to just ask the little helper bot to switch the whole
kallsyms to using libelf-devel and writing an object file directly.

I don't think anybody has any deep emotional ties to the current
kallsyms code and that horrific step of the kernel build, do they?

               Linus

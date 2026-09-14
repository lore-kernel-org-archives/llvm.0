Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3A24915B5
	for <llvm@lists.linux.dev>; Mon, 14 Sep 2026 22:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789425471; cv=none; b=jboW6PK7tBC5Q6iBSZmgqrvyz8iZGiiM7KANSx2VacW5yun9krQZ1xIX0p8Tb8X4ennie26u3FR6rFAmS99lMJIK7m+DmWkZIF6sgC8BJ74oVKuKBjz2LT+bLV3ITQh45g0YZZivQLWFh2EF+QSGpr9k0rSW5cJr201qzkWVh2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789425471; c=relaxed/simple;
	bh=3pbB/cdA2n+mw9ojxn7xAJ0JjyYJsv3yomOKFEBUOog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YLJc68cqyQ0M7fHzFITDOnC5xqd7E6LLIT1SZ4e/vFaz4m8gFwgd/X06OS3ezold+GU49RfxJEqFEXUmBnIlcZab8zkhUSM23oIF2dV+8yE9HCeoerFHubZ/0IP0g7J0KybJWuY17IQqkRf0y00TNxuaOe2mPnUESQY5LTh9eFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=P0Rr5gyL; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="P0Rr5gyL"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f70553dso453405366b.0
        for <llvm@lists.linux.dev>; Mon, 14 Sep 2026 15:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789425467; x=1790030267; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=doHeCbdvroV7mGBSmqv1XRXXxfYTXe+sNzLZzLwqdyM=;
        b=P0Rr5gyLdF4kVYJOSjeWQw1UXsi43RKrmiSLS88CEdYwdaAe6dl2Iwx5tkV0rRAMRr
         BzPSiTBbFpsXKmAhMP92f42+Or8D6wb1ZQ/CnKtcONnyQ6DYxCji1lGaxFBD44ZrI/t4
         XhEn/rnLT9WXNs6KZr7/DKchr53foqt3fn+Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789425467; x=1790030267;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=doHeCbdvroV7mGBSmqv1XRXXxfYTXe+sNzLZzLwqdyM=;
        b=uXjYkbUitfUWYnIEqx9UETV8apdMjanzHNZ925EN3qiJBPb3J/HhLtlIi8BWaGxFAJ
         adGATpCKF71qPFx0GxnvBYcLawnEYRbyvrkbHgl3WolijCe3UJzgTnfFncfQV7HvmEKy
         dRtC4xw7zirg50F2k4qWyzOPxc+KtVUEpzA7zBzJe+HsyfigiC0o/Jfe7brJAwykRlKg
         yUb7b3AnBMODUYYYqI0CTN42U2dm5btJDj0x0iDJJyx87RCbsM7L+72e3HfdZHPczTaa
         Yr+7Z3nCoulZfMkwRh0FZp/bpjVJcmPHYfSHVrquO3ubVUKhk7d8YSN/ho7wihv4qYyb
         CxUw==
X-Forwarded-Encrypted: i=1; AKwUvBzcoA46eNwKdFMNEvmjOTs0eZNCaMhuxdy2hbAMQPF4U5++H6u0Nl9flVlBjCgjc+rPzi9m@lists.linux.dev
X-Gm-Message-State: AFuF++kUX1lHU84aJeDNaH9GgTzXT4hRFIIWZwgE/AsjcTrU0ysTuc+w
	UeGz8gcohX67p1e+TNGYgTcd0vtiiVMXxGrOCK0LOYgzA+ZX7mXTpilDZaC8QzakXjwm3x94lez
	e6CfRWuC3SA==
X-Gm-Gg: AYBFou14kXpDDipLs8yvPEmB0bs9rmjJA0Leef5RxvSzoGwcm74R+6oAIrP2YWobLoN
	kjQZN6j+SxwsV7IZRqy0dr3SNT7T8H65NFrFNGqLCUqYI1XL7w+ax8nCHFnMI96dQM+N2VYexEx
	AqffGiUHHBELvipoRT5Q/ufGe2CKfnYRPTc2R0AK4rKk89hvQQnnLLIJCkX0jVJx0/kVGuT1ehD
	Dgt/d57tPul9L7GMdCZ95JYDlRpSNfSHnQgBeVM0RFF3TmFVce9w5MF94eKg1MjA1WxVKk2+QsQ
	040Rh+XsRnlGpc7zoRHwrWUBI3DLFTJOzRfeoIkGblsoYUZZsaQDscQ3Un86Y3vYtg3A3/Nrhet
	Sf+ZBvWAEOEJgsA/0xH6LdSvXZzP90Pz/vbodN1Wtj68GJ9LtMpjdJRcY6qtIfbvOwhh8siuPLz
	Ej9JVIelptirGJI0fGjiM2qAJE82LSFHcNBsFV5uR757bH5MV3mvOSvD19aWNR0Uj5owuEA7h2l
	mtIjsjmwke2lojwcMc7u6rCpX4HXVYYanJntwJKEOR8S3fdyg==
X-Received: by 2002:a17:907:94d0:b0:c16:5cf0:3aff with SMTP id a640c23a62f3a-c29b8650376mr315187666b.18.1789425467343;
        Mon, 14 Sep 2026 15:37:47 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966147b46sm487589466b.60.2026.09.14.15.37.47
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 15:37:47 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f70553dso453404766b.0
        for <llvm@lists.linux.dev>; Mon, 14 Sep 2026 15:37:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzJJYq+Xi2+TZoJNKgSF55s+rSmwl2pyb8ipV2nAN6c9WFScVLfW9qDPxUtGt+EIHXEBe2W@lists.linux.dev
X-Received: by 2002:a17:907:97c9:b0:c29:4415:2ebb with SMTP id
 a640c23a62f3a-c29b860109bmr315536666b.8.1789425035842; Mon, 14 Sep 2026
 15:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-15-39817ec5db23@kernel.org> <aqhLhVMkNzf_4oJw@jpoimboe>
 <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com> <aqhmhmgrnN3Mw8yG@jpoimboe>
In-Reply-To: <aqhmhmgrnN3Mw8yG@jpoimboe>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 15:30:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj3BKkCYtmfs5sORF_+Oumv2Gc8D+YxkMp9W2-mvLS=Ug@mail.gmail.com>
X-Gm-Features: AcwNN1UnWAKTndckmaJ94decAtfrWRGA6P58dk0oXtHcS9ajgGc6O7ZKSXjYJOY
Message-ID: <CAHk-=wj3BKkCYtmfs5sORF_+Oumv2Gc8D+YxkMp9W2-mvLS=Ug@mail.gmail.com>
Subject: Re: [PATCH v2 15/21] objtool: cache relocations, do less work
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 15:23, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> There might be more efficient ways to structure the considerable amount
> of data, like replacing "struct instruction" with "struct basic_block"
> or so, but it's hard to know whether that would be a net positive.

Yeah, I was thinking that you'd only hash instructions as you find
them if they are obvious "I need this instruction", and then try to
hash them *again* if they are branch targets (and just have a "already
hashed" flag).

That way random number instructions would not be on the hash - unless
they become branch targets.

And you wouldn't ever really have to track any complicated decisions
(like that whole "basic block" thing - I agree that it's painful,
because the shape of a basic block will change over time as you find
branch targets).

But not a big deal. More an idle thought brought on by that other
patch that changed the hash table size, and this discussion that was
talking about the hashing - or not hashing - of sections.

So more of a "if it is easy and straightforward" kind of thing.

             Linus

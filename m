Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C27556853E
	for <llvm@lists.linux.dev>; Wed,  9 Sep 2026 15:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967626; cv=none; b=MGjWYgI6+B0sJ9Oq9q4hrT9a7dlSoGWAjEfL021zdkXYW6kX1JrojsrHhQ+As9A4XVDoBEv1jYfC4wbZh3Ru7eWDCh1jASPLd+LnpdXP4MqIK35BtX1xYBWdVMj/oqSbuEpPZo/S492TB9LPeVJLrPW9ygrGDJl/BdveBNKCTHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967626; c=relaxed/simple;
	bh=t3yqbvSqtFoLUHow+WwPXXOfeaEh7bClm80fMM9rQTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h493stHHu4BvbUX8dJ8WF14nuhwhM1wcjYcivfd974V2/WOqzy9fppvLjhrSS1LTMfOqAr07n7WkW8xuvG3ibhsqHO675+ShsDndtpwcHuNw17RICKFD6vhCJLVFGesDoaS0QhUi5YJFESriRjvxyLMAZAojf0JbLDnx1hxatoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Mmis8OxF; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Mmis8OxF"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a99776ff70so1081833a12.2
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788967622; x=1789572422; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/FowYqhA2IUhImtOTNUOvZbuU0tnu+Lv5LcROnzCHgI=;
        b=Mmis8OxFY56bvBuuUct1+ETKaoCR4K1CUTt3EctqeGfDjBOEHh9DKzpqEjyfIGPflk
         HLYc8hxnmh147Io8wb0L/Bok9Ow/X7UWM+COW+f1s4sSU2ROVW1M4S7m0F49T/Ie/TnE
         t05oUhuY9E1Tpi7SBjh5aXrPIodRRuuuJCrsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967622; x=1789572422;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/FowYqhA2IUhImtOTNUOvZbuU0tnu+Lv5LcROnzCHgI=;
        b=ZfiOpwU/ebmDSfCLDLyarZJKl1DXO5KRhpkn0pJ8HthnOHtTzFTFFEAXNnP0xeWLlB
         UKJ5tbWAPzmJy3w1R644/f3SAQ3ePfpx54H5AZqnMsaVeQlPgG1VIvXg6mECiMRc3H7e
         XDSkdRqKQfX/k2zjTwMzRqYvhSqnY5XID2iPclIhugmYdRikhtfzLzPJAJSWOzPwIDc+
         PAGyTLFwxN126dnj3eRFKLLUPTrrP0vvSmYkUNSYhjrFAP0TZUh4v+GeCRMcNCJtlzA9
         W0O40HvOaW5Mb7p7V0x5zKwIa9mKBI53ACC4gzz3VFOSU9xtMbrwGwzgv6g8/tigiz74
         Zntw==
X-Forwarded-Encrypted: i=1; AKwUvBzEV6trkQbxCzdnsW3/J1RqmyeXAE7nSXEtKNsXjGBthEuiN9g0tlLW91ah7J4OgSWOBuLL@lists.linux.dev
X-Gm-Message-State: AFuF++n9+FsICVYADjuVFvwxdU6fl2t3aVX68dPxNCeRVh0VAszuipoZ
	yH0BXYNvJ43V193nGVSL6LDKgSCUR0DlvBDHXqxyceK9w0PgNLUMtXThjs2oSElzlrK3VWo9IWh
	iPanl5hwnjg==
X-Gm-Gg: AYBFou0ULKfsqWJhyFmIyBjwE38XVMOaf5qh+A7r/KtuWczzDaFeduotw54BlHkyXCR
	+Fdrpk72BWmwIB/rlZRjCrwfaIKMDv9NTU/aIZ+F8ABQWQWcvdMZtv5S6ZUJU0A3Wm/2ayc0vHz
	O3u8BbBPJpaahQFLvth8kO4A6gV8Q2iIxw3bmuSQMXFcXCsTBUuX060Id83VRnvwjOsZGbS+M7r
	WtUIpNCSuey1wYiK++Vm50X/G7aq570iBRJVDB/1iWjvSZIU24oma8onKFKyYEDMaZMuqPs8pCn
	OtR9GYRuIHcHycTnK/H3v/m+VQTk3D4hqyP8UNXpHrzk2pe2JiyjzU+ow86eMbA/9V7/2aahcBp
	bF73I5Uj7W4VFtuzYRykrWeWNNSeBON6pSkXTYD9wah5WD7gjbrGXSUhk5jnJmgysotkRnA/2TR
	2clp98jhGp2zfUs90VsBYXdb3DSUl/i+OUeo7D+NsvLIHIZORYyjGBJI4NGArU9HnJYOXp3Xl90
	fh8Asmj3SWMSDo7k/3ZICsrYeq/ycL3c13VjJz81544amQKYKwy+/V0LrM=
X-Received: by 2002:a05:6402:20c1:20b0:6a9:850d:bb6f with SMTP id 4fb4d7f45d1cf-6a9850dbf9fmr2466325a12.8.1788967622136;
        Wed, 09 Sep 2026 08:27:02 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9857ce120sm1795629a12.4.2026.09.09.08.26.59
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:27:00 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2637dd37c1so551311466b.0
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 08:26:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBykeun2mRvY8B1d32WDJ2n0oyJbhY6eTH38Tj5Ievn4zzDM0Fffl03eDiSinXUNvqpJ7imF@lists.linux.dev
X-Received: by 2002:a17:907:da4:b0:c26:1649:47af with SMTP id
 a640c23a62f3a-c26164955fcmr1368813666b.37.1788967618809; Wed, 09 Sep 2026
 08:26:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-11-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-11-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 08:26:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiA_UJbKiu8fOezKV=MfEcaFuzZiuk8Fto-Bc1KrA=43Q@mail.gmail.com>
X-Gm-Features: AcwNN1UWYYtk4z7iDc5cI-l9BNT1_XTZBZ1EzZVT-QGEk4RrzSdK76DVFXE4iKE
Message-ID: <CAHk-=wiA_UJbKiu8fOezKV=MfEcaFuzZiuk8Fto-Bc1KrA=43Q@mail.gmail.com>
Subject: Re: [PATCH 11/23] kbuild: implement and use depcheck to check
 dependency timestamps
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

On Tue, 8 Sept 2026 at 13:57, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> Each object's .cmd file lists its header dependencies, which often
> consists of over a thousand dependencies.
>
> When little has changed in the tree, this is what make spends most of its
> time doing, spending over a second, single-threaded when parsing larger
> directory trees.

Side note: from some kernel build profiles I did long ago, I have this
memory of it being made much worse by the fact that we use

    "$(wildcard xyzzy)"

for all our config header files in those .cmd.o files. That then
causes extra work for 'make' for all of this.

And we do that 'wildcard' thing not because we want to actually match
a pattern, but because that was the only way to have 'make' not
complain about missing config headers.

I'm not even sure the original reason for it is relevant any more -
this is all a very dim memory from years and years ago when I actually
tried to look at profiles of 'make' itself (normally when I do kernel
build profiles I only look at the what the kernel part of the build
is, not user mode).

I just tried removing the 'wildcard' generation from
scripts/basic/fixdep.c and the kernel build didn't care about it at
all. The whole 'wildcard' trick goes all the way back to the original
commit that added that whole 'fixdep.c' phase.

Maybe the whole thing is entirely stale now and should be removed. I
probably just didn't trigger the situation where those extra
'wildcard' things matter. That whole thing is from a quarter century
ago, and nobody has dared look at that code since..

Or maybe 'make' is better at those wildcards these days - or other
things have shifted.

From those dim memories, make spent a lot of time doing filesystem
lookups (directory reading  and 'stat()' calls - the wildcard thing
triggered more getdents calls), but even more time just in string
handling.

               Linus

Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DD5367B8E
	for <llvm@lists.linux.dev>; Mon, 14 Sep 2026 16:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401673; cv=none; b=D4InaYQ1zisojkdPmVilH7ydTu5cNCzA8+RyVPIqJLw67I/h9GZoD4aNx5xLKa6SnkpJn4yX2Bx+yIS6qhO8E86/4J3N6dLVAGbPjZlS8WMfov+boTVtXEJ71IxmOVBFLbXb1MFh9Nnzi3AdheNuwRuJFfvNyl3Tjvn3+FfooSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401673; c=relaxed/simple;
	bh=xMRNGFwT5MG/tN2Z4rVlgZAaGoxD3wGYA7E+SDFQua8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VsHOEhhCZ9KlQcsWVVCfhlepUCEwQORhJwzkpBuGvdnV4RqkxgKXVdI/K95y6wg9LMLzp1elSu0abbXTEWrVbhCmUbwojwdqNVmsCgZHZMx5T8v9ZO6V2tDTBLct+zpAYHJevj/12vT6GVhwZQnOBMujhd1Tw3Scb40JkMLkCks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LkI3e2Vd; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LkI3e2Vd"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so409431466b.0
        for <llvm@lists.linux.dev>; Mon, 14 Sep 2026 09:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789401669; x=1790006469; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lW3GLwaZtw2SQDM2dpduYrEemaWK0EaPlBH9/B8yf6k=;
        b=LkI3e2VddyBbn7JWENa0Iumo/wxaEX9Yy3CTrgRAixSmMEgGT65naeVs+noGnQWYwb
         BMnH3uxyXfmatj4fX97q3jahg8nUvNIAssOUm4BSDs5sgnhUAW0GcDzfDWkmGbboiIP5
         UCBLcFrNd/BbtxVRkDO3HkCfJeAru9ev6w+eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401669; x=1790006469;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lW3GLwaZtw2SQDM2dpduYrEemaWK0EaPlBH9/B8yf6k=;
        b=Wk8N3Ped+8y0NnTGfQ5s56VOi2mSMHQMzxiYFjbLiNLZnRvpk/BcPzx8QyhzSy2eRW
         5LCtvHaDrLsHnXV63Ozv0miS4fndeHFzNlEO2E7yvOzi3EJdly7sT2lfS9tVDgLfQtYY
         YfGskz0Kk4EEvHG7apC4mNU1Zsq1+FCbhk7uT68bO0aeLpl7Mp6Cws0PaS6thhImNfRs
         hw2vWyA6hrmtC1xrUPVo98xhZGMY397sD2I32a5iKxKPVFVnjwGrV4mpMpv1hlp1nOQR
         UKvhgQuTjC7iPPdCgzloFMHoj+58Lo7oJr5O3PcfqTKKyoZLl5xLjMojLFOdf43ugstN
         ZGsg==
X-Forwarded-Encrypted: i=1; AKwUvBxys4cMuAsO2HXTazFQcgT9qDzFLTaQhv7hiOSiIFtJ+N+tncXIEdbWVqjzNv1ZNUyZl1sG@lists.linux.dev
X-Gm-Message-State: AFuF++nU2aDmcTFcZlBCZ356DY+74nuO15b9i4q5H6/Q+yp+fVJgvbcP
	sebMQ5/xH4FROb0g4+/jyZw9pwC7nr9FAfAc5P0zJV0ovuKu1hZ5IrXy0Sxkh+YDrGdJcjs+ECO
	Alg6wAoE=
X-Gm-Gg: AYBFou01j0vOzPgaK9nJ9L59dQuSAeVUG/cL3ygf2uA0HQd57SJbErwbNZNUJNOcoxT
	vjvcoJD7oP2FDLIzmoyOHwFSC5OTvqu1SCHf3SA8BEG+sUOJn0moX40GflePOx7czyeDqWQhIHh
	K9dBlBVXIpgV/18coZUYb7V3Zvv1shYjIbsfFfVIzUfgMnK0QONl/Npycs67NPNUQ8S13z5qZvw
	JSmtMvHq0In9XGWx7bT2UHEz4IMnXdVJ15EqQT5Q35jhx1BFJFqibBUbgkFOAGX5idNYLqJFYL4
	Ciajv/cFh/VF3WvAemNKopA1Bk4jzFvByexEPTtz/AOPKaDCKpnAS2G70dgpZFrQ6/N3Sirybyp
	4g2+nxG7jNBNlvh2/hnOGH4+CUrsKElQ99gWa+TKXSRd6BiqaNnz7Lsgg+RXjn5XtV8cfNEb7/L
	40OuTrWIrO6sYc/25duUEHkn774MscJnyEk6rN4FovNS1QD9UL5P5IGtU5G76IARY5RjaB8uWN7
	O1pL2wd4Ftq9vv6WcjdAmF6D/j5CC/JHYO1zNW9sD+ERCZU9Q==
X-Received: by 2002:a17:906:7950:b0:c29:4147:f4e2 with SMTP id a640c23a62f3a-c29b86f3fb0mr370399566b.15.1789401669012;
        Mon, 14 Sep 2026 09:01:09 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608dc91sm452233166b.39.2026.09.14.09.01.08
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:01:08 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so409426866b.0
        for <llvm@lists.linux.dev>; Mon, 14 Sep 2026 09:01:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzTzTQpzKjYXqoXX2nE4xE3I/wlIsVqa8epcMFY7sfaeVjRVtD0xNmwInswu5Ib9vN5p9FN@lists.linux.dev
X-Received: by 2002:a17:907:3f9f:b0:c29:444c:8f28 with SMTP id
 a640c23a62f3a-c29b84c2597mr415053566b.5.1789401247404; Mon, 14 Sep 2026
 08:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org> <202609140833.88C0E16E50@keescook>
In-Reply-To: <202609140833.88C0E16E50@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 08:53:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=whB0X28MNAg71it=1SfFyV7rB+PK3qajpRyWoxXHW81fw@mail.gmail.com>
X-Gm-Features: AcwNN1VyLYI7E7T_24gtwZZHDPdmXi1EUi9s9xthPRH35xQepEwWHVnUZ8r6fdo
Message-ID: <CAHk-=whB0X28MNAg71it=1SfFyV7rB+PK3qajpRyWoxXHW81fw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] kbuild: significantly speed up kernel builds
To: Kees Cook <kees@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 08:41, Kees Cook <kees@kernel.org> wrote:
>
> One area I think might solved via an LLM is the 3-pass kallsyms stuff.
> If we could get a deterministic kallsyms build in 1 pass, that would be
> very nice. A lot of people have tried, but it has eluded upstreaming.

Even the three-pass one hasn't apparently always been entirely
deterministic. We've had random reports over the years of it failing
in some circumstances.

Maybe we've fixed it all, or maybe the failures just go imperceptibly
rare. Regardless, it has definitely been fragile.

               Linus

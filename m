Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC4F3CAA51
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 21:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902000; cv=pass; b=eG/VRpbFX0gKu2g3ta4X+x+oqn+cdJ+jUIXaFUBkOUX0QHMJEz8v3LIF2aKK1zFgKJVUHJwfXA35enNNC6Si2RiGM9z8jwW/A8QmMjDBjh7zxdyDVqzZgmpxKotPWqWJFoSHm6U/Y2Z71/MogRqWttPLZu9T+K2lOGWjyjTigMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902000; c=relaxed/simple;
	bh=ABcg7txfjreOEvrgYloSz7dmSAX99sKg32JTqnOhFhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iG4oPeo+i/wdEa01HkpvOoMycK7a2yr+zEVBLETRc0XoEpEnLDRhsJhMgvmP8O1QdL6tpLYSKDaWBN04qcIZd2AKrbHokaMYwMvlL5K/rmjPd4EDqgyn+h6ak6kpxzP4L93roh61PEla1EvTJjKdqzFNeCElf3axe1LUJu3KXUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVjv8VQ0; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVjv8VQ0"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed444so566550a91.1
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 14:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788901998; cv=none;
        d=google.com; s=arc-20260327;
        b=ljN5TjB/T7FAzyozxPv6Ge9EsRVqBihuo4wJkmc+GSwZnFxfaRAk66l/0YdVn+j34+
         loQZZsNK+tMZjVt2ZYFS6ys2K0SgiEQTylu0LU6+i5hvZxRNb5elB2W0sKbCM3nrfCDp
         gUyFTExElCr3TKWmlMjjnvjU4UPqmFJJjyFXmzgbuaxnWjZ9Qt5aQa64vm7rvsrurbPR
         xv1LuocaQSqWKXGhbV4AMMlBK7qZwWI3vzcV7p1DyIsYq478bAfXQKo5BGfT86yYptX4
         +8YDDaIWUJsHTmj2GBqOSgKLDcwUalFWQF25rG5/3AruuN1e7f7zAXCuybQqiGd5d+jD
         0cuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        fh=eA8BTC4FjvCnCwTtZ8KBDJ70X8L5COTDDEFfZIPqOnI=;
        b=gf4C4vWm8T0l+DDIWQWAUklKKypovRH1tGqI3+qsQgkX3v0ERyNwCBPkfB1fZsXgmk
         0aQrUX461fVnoKfTVE/voJkGdQ3cVDpq9DuEgh5gXNFTFT37SGSuNtOq9MpqQ4M053fK
         vWjBYlJCM/hlO8vZO+rfuleDZ/HYy9Xfd2q4K4fycL8fTtrOI/V6p8lqNEMmPRAy1vaD
         InH61chgwJmEsedwQZFroeqcTaBnjlGgTtzaaqUiRW7umq+o5fU9vz1C2c/q43w5CnFj
         wonYa0bffras7SInjBc5EkIl2mtW1nYqGGgYxCnM8U2ADa/MiOsOoaFohne7wslVyQ+H
         /bMg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788901998; x=1789506798; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        b=UVjv8VQ0zqKCcRybd5ocTDOB15L0ly2fuXdZIkPkkBd65xRMZpBgqY6+cMY6xGwE/j
         N29wpwF2VJijaeDJJ/kU8lTKwjcAvXPXFvIBksX21AiqWbwTLzGzeCJ29V8eEMRb4YJo
         rTifenLmutXut9T13QnysRaYsm0Jsx5L3jlSo0oQOnURMc1xOyneWCYCV9eXxZRQ077w
         8VrtJgCKcUAPna77qXGGA9K26Fp4QUvaG9dMJApF2ahKqQPJ5auIx0HuAkpXE3HcvX+J
         IzfzFIxdeN+QxkFri9kcLq9GBReUiZ71uk7H+Tty7IFsBJmcvrEDUCscFy6TxUtn+ctz
         Vl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901998; x=1789506798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        b=MwA+SXhcS7+PTiFDRft/NRXclF4D/nSALYX4A76dFkFrF3k2E202A4PfQWb/PrqKwN
         Do83wycQ8ly/0mhLQmslM5yhWJU8b8FyAG/XP97ysQud6SvWZFdLI0o6RLuFm29jKj2U
         7Hj5bK/ubU7BqMPFChvNUlDoPsw5Ksp2fUpUGdHkXyxmNUCuxTgew1Ey6ZlplQaDv/P2
         wxbIN+1fAfV3b+7h7Rx0HXj6XN2jEGH7xtVOSjYnewpOjsTeyb75ER7hJGQXEEYnSN1t
         D0O87KeOsqyb9ZynyrbSZXqbgCp3eZ99I1Qk1QLygUAJmtRKl1GfAZPjZuP0t2ksPxCY
         PkvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxF6eghTaaGLk9U8kw9Vb8iuTj2fuz5qSI4tDhE9nWJpx2EJzHy1X5DPJCl8Eb9ldJ9pDN@lists.linux.dev
X-Gm-Message-State: AFuF++lx/KasRdhoUoN3ng7XawbYJC1JSrVledzsFMiGr2x6kX+nJCcn
	ZoD+Hwq3R9AQZFjC/2cExFFGjpjnpjFmXBLvlAl5Lt+UgYfygak4Hzg28FXGJkVwB2mXVoYrPm1
	Tr/YILvAMvoItAhJ8welA/+BFtt16IWs=
X-Gm-Gg: AYBFou3wFlvD0C/FwDH0iihblg320PcT03ikOM9RNMQDiLfcQV7zk0tDiMjEfjv7fxa
	2YLDiWYQVrTFOAPPQTqGrZa0Go4v05VCRPcOTNjY/EKjbHRmqWHl5K2FPhUqkajckBjgFYd8+e7
	Sxd+IDC3PStEeWP8z/QmL7nkXArjHkXrq1GPXfgJvRHNea/r1WpWpK8GNkOxFOwSZRHLKkV8zUT
	vy4vySDGvGk6p+pVN1f2rjIaCDkjWHI3rss17OO5lVEALYUir8yl719CnDktU8SaFbUyReqkEIw
	+byXDvUmPfrzuroSSAkXDXsvfK7mcUMcL2wy4Zy7I3ocIdMsTtu6oYnM4qDsBWpESwpi3SmVUdK
	yDXycLyPxM5DHCMFFahQP9JZNDNDNY1rOiewsG44I1vY+nzdhXL9NVASruDtCNO5IRGNTOPPW6o
	esRxuYMIyZV0aaTezKD6VJzNNZuWH5ayi17Qd4rpJ3CJGr9n51NMs=
X-Received: by 2002:a17:90b:3882:b0:396:a47f:d38f with SMTP id
 98e67ed59e1d1-39b268ce386mr30178901a91.3.1788901997757; Tue, 08 Sep 2026
 14:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 23:13:04 +0200
X-Gm-Features: AcwNN1U58TdOwuasMFef5tH_3N3xyJMe8mAu14nPZtzZCuWKC0n_7MgG3XQZVuw
Message-ID: <CANiq72m5C5tNKUWTYYerBt81KtqRLgr-S4c5XLUN1uY5n7mqiQ@mail.gmail.com>
Subject: Re: [PATCH 20/23] kbuild: rust: parallelise rustc front end
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 10:59=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> A future -j/--jobs option is planned for
> rustc:(rust-lang/compiler-team#1005), so check to see if this available a=
nd
> if so use it.

This is already implemented in nightly as far as I can tell. If it
weren't, we shouldn't add it, even if planned.

(By the way, could you please add Link tags for those URLs?)

> +config RUSTC_HAS_JOBS
> +       def_bool $(rustc-option,-j8)
> +
> +config RUSTC_HAS_ZTHREADS
> +       def_bool $(rustc-option,-Zthreads=3D8)

We can simplify using `RUSTC_VERSION` for these like we do elsewhere.

Cheers,
Miguel

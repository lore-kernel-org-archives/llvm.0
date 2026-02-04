Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549B33E8C52
	for <llvm@lists.linux.dev>; Wed,  4 Feb 2026 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770201696; cv=none; b=FoZhVd8iGjX08FEdBW+YcI+AJZAZIPJK4g+aKK9c6sDJSRZFEXDyu3ETAumDz3TpL77XOuYOUWb46xM/rffRLzp4LNMsnXjI7Lz8XBq4sTRpdFKZsrX1s5PKyD2N4m+XC04iCcX5KDeDf4Rj1k5vZ5OwkhhDa4ZEUvBMuQsBffg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770201696; c=relaxed/simple;
	bh=n+KFMIEg7ILgHSBVi1DF/IeBc2dZ8C9nEfF1T5o6KA0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Pi8xp+SKgNIEt+Ax8USlGyBH8OjCnJQGglpuwihlG0V67fbilv035cWc9g+ca+Qp/GTHg5DsUtehKeGJ19+pLSaF0YDo+EPjlMEjtduLH7ktyOEEia7kW2nL95Y1RjW8KKoZurTFueTOH4VXX6pppUwdk4TfQSgNxGZWF/bRkJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NBsOWaOd; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NBsOWaOd"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-480711d09f1so85663345e9.0
        for <llvm@lists.linux.dev>; Wed, 04 Feb 2026 02:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770201695; x=1770806495; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pRwouiQfEMsoda5YPwBCj431swMzELp5kqTN2koP4hQ=;
        b=NBsOWaOdUeU0Xffo5qarxHluxso6aHa10h7UJu+wI2nWSkeeDyXg8JXm64VLAlKmnU
         Pnywi0rWBtoHiZaJWsx5BEAWzdNxbZRgtpNzOApbELoEmOYB7ScVMwojAsLfrWKN5AOB
         rAcr0YOZROCpGSz2l1XaBYjncJ7F8O1ERtXbFjgn4x+E5s2HIiO4ihHMgWm67a9GAcqc
         T1uw8zRrd1OhP2itp2yp3JDJtUV2UOJsgwaFUPYCsqQnSoFhQ3waZNcoPc9/yJoHfrVd
         EeXa2SeVjfTMtKULKW9BNb6+j4FNWfyDcBOhCBfKAYfKup+jahm7yzcy9GTdMWZm0ADr
         ScKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770201695; x=1770806495;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pRwouiQfEMsoda5YPwBCj431swMzELp5kqTN2koP4hQ=;
        b=UWnSvgNMK8qyY6IoQAfvK8dlJDroDB+wwqp18MpKqpPeOoTopOkMAd/tPPIbYBlXqc
         rAFKP3mvuBycTbhPHOYsetxqGHLo+RYuUovrzGYvD6n9RQzyFgxXdG4/y56XKDhOJ6UC
         +mXHX5bRD+fjnTZELS4MTN4jowGrdGkAerrW90XhsBV6eBccr0CCBE8y9bkTPyK+GMMJ
         +nmtQ+NfMtOyApEwrt5LfSv1cwI97cfW5nLXtRU7k+bqvvBEn1CUki4XpNl8RMUD4Vvo
         x0hs+oFBUuvteLictl8GKYj7lJ4nNQrZVuJzk6Y6pt+QgWYHiUlJ5ZQ5BC0js+KYPtrV
         DALQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmWmklIfKH31Q/vTMusjJyGmBZVg+LtFkVh7WbCzmNbRcCcS5pn4ECiPse2pQvq6io9VzZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3vu6vQE9Cp7f1MCoNmpy1jqQeqwxqQFGK07qw/mxHyu27yKV3
	W1fKWwRMwK4MOe1p0br7byYBokUC5qPS17PIT0vhJ97kqhIwJ8jIgylI1mws7Is18JyfBCQHmF2
	/CWD1SGvzidoOZ4Acmg==
X-Received: from wmbgz9-n1.prod.google.com ([2002:a05:600c:8889:10b0:480:6c9b:592])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:680a:b0:480:6c75:ddce with SMTP id 5b1f17b1804b1-4830e9a9b17mr35223645e9.33.1770201694753;
 Wed, 04 Feb 2026 02:41:34 -0800 (PST)
Date: Wed, 4 Feb 2026 10:41:33 +0000
In-Reply-To: <20260204030507.8203-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260204030507.8203-1-linkmauve@linkmauve.fr>
Message-ID: <aYMiXcy33YEVkgYM@google.com>
Subject: Re: [PATCH] rust: Add PowerPC support
From: Alice Ryhl <aliceryhl@google.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, officialTechflashYT@gmail.com, 
	Ash Logan <ash@heyquark.com>, Roberto Van Eeden <rw-r-r-0644@protonmail.com>, 
	"Jonathan =?utf-8?Q?Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026 at 04:05:04AM +0100, Link Mauve wrote:
> For now only Big Endian 32-bit PowerPC is supported, as that is the only
> hardware I have.  This has been tested on the Nintendo Wii so far, but I
> plan on also using it on the GameCube, Wii U and Apple G4.

Super cool!

> These changes aren=E2=80=99t the only ones required to get the kernel to =
compile
> and link on PowerPC, libcore will also have to be changed to not use
> integer division to format u64, u128 and core::time::Duration, otherwise
> __udivdi3() and __umoddi3() will have to be added.  I have tested this
> change by replacing the three implementations with unimplemented!() and
> it linked just fine.

Uh oh this seems tricky. How is this not a problem on arm32 too?

Perhaps we should just be providing __udivdi3() and __umoddi3() in
general?

> diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include=
/asm/jump_label.h
> index d4eaba459a0e..238f0f625a36 100644
> --- a/arch/powerpc/include/asm/jump_label.h
> +++ b/arch/powerpc/include/asm/jump_label.h
> @@ -15,14 +15,18 @@
>  #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
>  #define JUMP_LABEL_NOP_SIZE	4
> =20
> +/* This macro is also expanded on the Rust side. */
> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
> +	"1:\n\t"					\
> +	"nop # arch_static_branch\n\t"			\
> +	".pushsection __jump_table,  \"aw\"\n\t"	\
> +	".long 1b - ., " label " - .\n\t"		\
> +	 JUMP_ENTRY_TYPE key " - .\n\t"			\
> +	 ".popsection \n\t"
> +
>  static __always_inline bool arch_static_branch(struct static_key *key, b=
ool branch)
>  {
> -	asm goto("1:\n\t"
> -		 "nop # arch_static_branch\n\t"
> -		 ".pushsection __jump_table,  \"aw\"\n\t"
> -		 ".long 1b - ., %l[l_yes] - .\n\t"
> -		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
> -		 ".popsection \n\t"
> +	asm goto(ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
>  		 : :  "i" (&((char *)key)[branch]) : : l_yes);

In case this patch takes a long time to land, it may make sense to split
this part out in a separate patch that can land now.

Also, consider pre-emptively updating arch_static_branch_jump too. We
probably need it at some point in the future.

> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_targ=
et.rs
> index 38b3416bb979..0054880ba0ea 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -188,6 +188,16 @@ fn main() {
>          panic!("arm uses the builtin rustc target");
>      } else if cfg.has("ARM64") {
>          panic!("arm64 uses the builtin rustc aarch64-unknown-none target=
");
> +    } else if cfg.has("PPC32") {
> +        ts.push("arch", "powerpc");
> +        ts.push("data-layout", "E-m:e-p:32:32-Fn32-i64:64-n32");
> +        ts.push("features", "+soft-float");
> +        ts.push("llvm-target", "powerpc-unknown-eabi");
> +        if cfg.rustc_version_atleast(1, 91, 0) {
> +            ts.push("target-pointer-width", 32);
> +        } else {
> +            ts.push("target-pointer-width", "32");
> +        }

Is there no built-in target we can use? I think we want to avoid adding
new targets if at all possible.

Alice

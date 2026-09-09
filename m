Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBE8559CA5
	for <llvm@lists.linux.dev>; Wed,  9 Sep 2026 15:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966447; cv=none; b=RQPj+VjX1T3Ec+lXd43nHuKj6ZMy4ZlOr6CXmVVjuowqH/Alzk+P5gT9Hkwq7Pp6+M2sju9+NxYO5XLokvTD5iSbSl6uvatInqOChV+bXi/VQQi4tb0ijbnQ6e1bxdqetNw9daeUDWRfur95lraRwghOGnw/uKhOLgr5H21k2PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966447; c=relaxed/simple;
	bh=qF8PC9Ug90yk/PrOmZBC0YqOzOPUdR+ADtjc56MP5mA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=koHS49bIlD5u8Ax1tgkGWK8ifhNYBGC+xQizqrhjXAz3yVf/IVERYImbjRFNYT9Gy6gvrVDg+bWQlQG877Vt5qy0sEdNdLzl8KSmSyRavmOgdEtYdbhUvAXXEOpiQa636YRZNpwDFnjYkg4v5lMr5s4lB8ZRucsgekDd8u2gewg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=K5aevTm+; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="K5aevTm+"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso517158a12.0
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 08:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788966444; x=1789571244; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JHU6Yr48iRYl83IyQpODgW1j4SilTECHHS/aRaqSbs=;
        b=K5aevTm+9pIMf44LcMQALNJqiYTw6P7lKkuHhI65GATw+3iKb88jcET2FsEj65a64J
         L90RzRCX/8mg/miU6O/cnzVhnOIVzkIbdACHW1h2OdPboOQf0t9v8gkhWCrwZ2G+lpTz
         yUy7UHhbx5ereb1rcL0JXgovA8vGgknGbgMW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966444; x=1789571244;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9JHU6Yr48iRYl83IyQpODgW1j4SilTECHHS/aRaqSbs=;
        b=NmN2D30Uf0yrFrAcq9zxy+wc20wGyTC+ws3rvvZJ5MjChBc/Mfbe2YenGx3fju/hrv
         T9Yao7vBwYTrrePWDyBTVPeYD8M5Vqs78DO54qEynPCTKBV7CN2vdfakAkwznjs5q4gQ
         bI5DIvT7OyHc/8rsHmmpIGJwklrcwyUfI2wMDC9WLQ1zH/u2Asj7h9aheWi3I5PGe8x+
         BXE9exxG3XUZZoOHpxhbkkETECEsKsLImfiW3k4nqXtu5La+JyHplHtbvUy+JWlBfL+1
         UrJEUoONvhVis4KbyZnJc1Jov6rQEmK9prcdd0X55ODrml1Klwd7bjClSLBMGBmG2FLB
         mu3w==
X-Forwarded-Encrypted: i=1; AKwUvBy1ozk0ZQJauAChTVN0r9NH1Xix3jOV/G9WNPRGa+P51YC1mEjR3Jy7kec78M6sjlEomOLM@lists.linux.dev
X-Gm-Message-State: AFuF++ldl7raOsEYsrE8rkeLUggCJM6Y1psN2OAxdCgaLaZOx1sTY4LM
	5YlqZDZS+fXqROwBtoygKVF1Sy+zpij+zUo1q0W1abUBGO0IJiD6eLNodG0zS310HKnu6rZHmdP
	Q3LdkPvcXLaCX
X-Gm-Gg: AYBFou19lbyVbx/xohk6atdwzdDki/gYDuIQnPW4TNK5dR35pVm4rXA24D/MUjnxU6E
	pCTnW3jbYOM2YvfqHEB8X+KHygGOvLciodoFzbtPne4l0PEzGMklCdLJTd8WXkaBPfYeK+JteeL
	GvasfkEarUmtlzNsKfIY8swhSzN0G9xNvFsTGVYstP2rWX+ztQuzO0odn1EIuw0aL+H37oOD+v4
	vgZznpma2/1Xk0HQaBXjD6YqU54QS4Wap0Y7FA+g8Tn9v0xrjmeR8fOAB8iGMfQBX+/1iqJ2WsV
	M73drpVo6jX4pfpJpXOAmtBDnEjkB0tIlTJ1c1+c/xdNW2A1TajwpPiINPPHJcEyvMHGicmPgxM
	1U59Msz7Cy1cuhtO8wQ0FXNpkOek6eUulYzOzWRR9RoqXSJpvzPX+r7eiecu+7zfBXwxca0VeT4
	dbEa9dAgH53pXLwod5QbQ5JIcrvcLpdtUduSLgixIradn4uPUiKdUoHZd5EJeMH8OPqnd0fGLW2
	2PwWZh/rYtkG3hFLvVX/dO6CmtfkYeVBvEJvElfaZ7Xob6T
X-Received: by 2002:a05:6402:3708:b0:6a0:ffb0:273b with SMTP id 4fb4d7f45d1cf-6a99ca2ca59mr633545a12.0.1788966016447;
        Wed, 09 Sep 2026 08:00:16 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9882a8510sm1424617a12.21.2026.09.09.08.00.12
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:00:13 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6249b76a8so504254a12.2
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 08:00:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw2yMadncZn4e0rzcvQPX2pcomCuYb2qhc/gsINh13bgpBu8YEDYAex9b53ruEcZLBudNGB@lists.linux.dev
X-Received: by 2002:a17:907:728f:b0:c25:8e4f:6d84 with SMTP id
 a640c23a62f3a-c2941868b12mr66185066b.2.1788966011712; Wed, 09 Sep 2026
 08:00:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-15-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-15-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 07:59:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgAWpVHmR74jC7sbSJGQEHyaaN0awNfSz_SjPv3VGSYYA@mail.gmail.com>
X-Gm-Features: AcwNN1XmVo334b1UP-lcj3CPx7zvteJ2HddEJqKkfbem-zQh2qUu9HycJHabLtk
Message-ID: <CAHk-=wgAWpVHmR74jC7sbSJGQEHyaaN0awNfSz_SjPv3VGSYYA@mail.gmail.com>
Subject: Re: [PATCH 15/23] modpost: emit module descriptors as assembly
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

On Tue, 8 Sept 2026 at 13:58, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> modpost generates a descriptor for every module in the form of a
> <module>.mod.c file with .modinfo strings, the __this_module descriptor,
> exported symbol tables and (with CONFIG_MODVERSIONS set), the CRC of
> imported symbols.
>
> These files are compiled like any other kernel C file with all of the
> -include preamble, as well as including linux/module.h, header dependencies
> generated by fixdep of a few hundred headers, an objtool run and if LTO is
> being performed, a link is performed to generate native code.

This kind of triggers the same reaction as the kallsyms code: I think
not including <linux/module.h> is probably the biggest win in this
all, and precomputing the offsets of the (few) structures that modpost
uses then makes the whole end result fairly trivial in raw asm.

Fine.

BUT.

You end up with things like this instead:

> diff --git a/scripts/mod/module-offsets.c b/scripts/mod/module-offsets.c

where it generates a header file for those asm scripts so that the asm
generation can do things like

        buf_printf(buf, "\t.size __this_module, %d\n",
MOD_SIZEOF_struct_module);

etc.

But I - again - get the feeling that this is all going through AS as a
silly way to generate an object file, and that there really isn't any
obvious advantage to that side quest.

Becuase no human ever wants to see that asm file, and it's no more
legible than generating the object file directly would have been.

So I get the feeling that it would again be more natural to just
generate the object file directly when all those files really end up
being are a few symbol definitions and a couple of fixed structures
(is there anything but the magic "__this_module" thing and the modinfo
unique ID thing?)

And again - I feel like nobody sane would want to write that code. I
certainly don't. But if this was at least partly automated anyway,
going that extra step might not be all that horrific.

I'll also be honest: part of why I do these suggestions is that I do
think it would be faster to skip the intermediate assembler step, but
a big part of it is that I don't love the random turds our build
creates. Getting rid of the *.mod.c files would be a cleanup of our
strange build.

             Linus

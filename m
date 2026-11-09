Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242748;
	b=fcVQgQ9YmzzxzbGw1wVVsGPDFDnW1in2+w0HVvMiV5uTSKpkyBExRqotoziedt5+M+Ok
	 xgw58IN/ytGG6J/XCPf6PaQvKWIdtyC0RdmuYhG7amZXSd3FkYia8ep2p8casppKXwkFa
	 aLXtxL8hp+YM+0nUdJAmmXBoDTW15DTKP7Fg7bDPNUAX1HSew4/9djG3PhCYydzV+dqLH
	 1Dj2udHfijQV/ax7UgsXAJwkX3YCJ4/XNTWqPpJQELAA+TrI5ey+HC6wHS+eF9iNZPnR0
	 rwouBIZLn8NH/ACFgEALTvOf03aZO8nGHKbmmrFBPG/BPLOWNu73dhlDEx2FYVm/TrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=KaxLEDS88ItrKwFFpF3PUgaqHFKPv05h6XZaeYQUHW0=;
	b=ers3oTjXk+H1QJJAsnQudgAUBkWiIbTxfh+K35ZFUZwtZG0UVIYI5sRYI93ZEryIMIK1
	 0GyZaOP3VCdXHwl3ttQWC1yhwcYAfCUbCyos548Hi19YDc4ylz3EKDsCQfSwnfqPcmc9V
	 ZJGGgmtBo7X3Zi+3eFJt6Runm7FIQkXB4ul2JPqdHJSvD7IgTeQEFfNCDOd2KJ0YO1Z6i
	 2GcSL2F8aTfAw7W9JBwhtCHWtahipQby0P6gUKPee3V01a5uLNYpMCGgUjmzUDBVGz1xO
	 s9XRQBEQMx7d+z+c1aLxmFle3ff/d9ZQjc4K2/Luqpk8r94odbENQtq3Qvbn3MpKomw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eJwqqEco;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9812C60A2602
	for <llvm@lists.linux.dev>; Mon,  9 Nov 2026 16:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9812C60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eJwqqEco
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4922523d1afso622213f8f.0
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 08:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794242746; x=1794847546; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KaxLEDS88ItrKwFFpF3PUgaqHFKPv05h6XZaeYQUHW0=;
        b=eJwqqEco1Vw09hGb39ZkOUO64W2HqS5YvCoEGjvBBikvbKAK9W4QgFQHbCTPP1KLYl
         IxfffXLEZHY4yub7lM4nCNUtqiRRGNL7zF6E4Y9YKOW6Cn7LXmlfnjs3iqTt6yuJb+1K
         +qpa0cgN9q7yM7SyGKy0OTldFVOpV876kwvQtf6mvujUru8PHGDy1Ya5W6jtBiOpjzCz
         Y2ojzt6P0VNuMVQTBuk32/XYjTGKx+paA6evFydk191RYgMsPCF9L0AKSVaz3cgsThN3
         0H8cuzEMDjmB08pHoIYAE/XWJbYe/gS3wdp3CJPU3xlCDPVojx1EuNNRMpSq1N7xI5iK
         N+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242746; x=1794847546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaxLEDS88ItrKwFFpF3PUgaqHFKPv05h6XZaeYQUHW0=;
        b=2Ary1hen1ahQZ8ojufMH/tT3usCHnTyHLQ3naYlLH2vuF77yEDIiywXnmIpLCYd9Yo
         nA2rR8qb557s6K0aPBtqnehFlnX/jnmgEKeFncVCaC2upjm1XEsBuEJ9mNYbCgMjUOqv
         +X0+3o6rPSHlsigihkGIbVe1knu564+AxXeKkrCgdi/FpipNZzRVRbyqM8XmnRqxUDO3
         Z8mfp1dMh8zpb9tU9OnkKyn9YtzESFBpTJJiFgI6c5nUWLW8Jc+EXtdGK10p3Di8HAqn
         I5IcLKRUYE5gRQget36P7KzvhERpJEjJVi3Z+YKCYoA/kIF0uq3yMKZYHIwjpRzC5rMK
         9fdQ==
X-Forwarded-Encrypted: i=1; AL+hErFc6YmPDIRTHxF9wad43zruBR+7njeCq07CW/u8q6rkmuhKj19e32tAJn2cm1OEE7nQNEUB@lists.linux.dev
X-Gm-Message-State: APuU4Z/ktp0m2jIYVBMrlvyE2lj46eFVRC65J8XFXTH3x8MWdQoD4O+L
	fH58CXGpkwYXJd3khpV2NW8U1i5pGekTtMTh828fJ7Gp09lzuLKb5OO8xkLfrYx4cU8=
X-Gm-Gg: AYBFou2lZ0Pqv11rqpNvLNRvOpDJlWeu96p2ltgUGfMOh5jExOYXVK7atFITp0JXbbA
	JKCsS52QG4cZDhoan8vZfZj5WfOVVUhyFx8FrFohXoQq+pOhvjqagkABDD9joUWsI4N2jUyBvCe
	+EuYAHsjsx5y4gFpkkocGI62eQz2b+sYssEfBucNL6v/5FNlcqr4/hcuZJmNrCwjGkppIA32aJO
	O+qVPlwIYqzK9nhO9c/erhRXlT4kaja3x7CJC8ZGTNTTZhVZKGzQtMFLJXJ40WwTe3IQ8LE5T8x
	Z+7teswNFTraB+YrWOMQyfupEH8/G/07RH3bJcn2CKaQYCiGaACBFQn9GWkAmF8hh+zm3v+ElmL
	CvqtwtBvUtkZmI+0kqAQFQBGtzHVYygRiAS3P9lo4dzRuK3vkhoFMIF3MvJThlGYf45IxEag0eA
	9atIlgKpWCzCJy2MaBee5p1PWe1NYTKLW70QvuAO+YV95bghehTdtvWqYQYeIM0tKJXNneZkrug
	dS5rQF6HJMDbL9WzFqJNb/MyB+gfAPh8stfaHNhT91PVAUcmUYmyu0dATsl9lJ9evPZYFQTlZNX
	Xz7wRw1ICV67oyQArFeBSBgsVfCKb06RSvGVUAdZetIg/+wNWPMNAKTbn3R2j30V
X-Received: by 2002:a05:6000:2389:b0:491:8462:20cc with SMTP id ffacd0b85a97d-49830d8186fmr7425f8f.37.1794242745831;
        Mon, 09 Nov 2026 08:45:45 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597187162sm11283249f8f.34.2026.11.09.08.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:45:45 -0800 (PST)
Message-ID: <b5abb55f-202d-458b-ba6d-92af16f80137@suse.com>
Date: Mon, 9 Nov 2026 17:45:44 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/11] modpost: emit module descriptors as assembly
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
 <20261104-build-speedup-v5-4-0f6018be8dae@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261104-build-speedup-v5-4-0f6018be8dae@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 7:20 PM, Lorenzo Stoakes (ARM) wrote:
> modpost generates a descriptor for every module in the form of a
> <module>.mod.c file with .modinfo strings, the __this_module descriptor,
> exported symbol tables and (with CONFIG_MODVERSIONS set), the CRC of
> imported symbols.
> 
> These files are compiled like any other kernel C file with all of the
> -include preamble, as well as including linux/module.h, header dependencies
> generated by fixdep of a few hundred headers, an objtool run and if LTO is
> being performed, a link is performed to generate native code.
> 
> On an x86-64 allmodconfig build 11,189 *.mod.c files are built, each
> taking ~0.24s of CPU time to compile, and module finalisation as a whole
> 6,300 CPU seconds, or 64 seconds of wall time when run over 128 threads.
> 
> It also generates ~1.3 GiB of *.mod.o.cmd files that every subsequent build
> has to read back.
> 
> Avoid all this by emitting the descriptors as assembly instead.
> 
> The layout required (size and alignment of struct module, struct
> modversion_info, the module's name offsets, init, and exit fields and
> whether the architecture uses PREL32 ksymtab references) can all be derived
> from scripts/mod/module-offsets.h.
> 
> The fields of __this_module are emitted in offset order rather than
> declaration order, as CONFIG_RANDSTRUCT shuffles struct module so the name,
> init and exit fields can land anywhere.
> 
> An assembly file avoids all of the issues previously mentioned so this
> conversion results in a very significant performance win on kernel build.
> 
> As a consequence of this change, since module-offsets.c includes
> linux/module.h, scripts/mod is now built after the generated headers in
> prepare0, rather than before.
> 
> Also update .gitignore and make clean to handle .mod.S files, but keep
> .mod.c files there to ensure that users do not end up with untracked
> changes/dirty trees after the change takes effect.
> 
> The sections were confirmed to be byte-for-byte identical to the C version
> produced - each of .modinfo, .gnu.linkonce.this_module, __ksymtab*,
> __ksymtab_strings, __kcrctab*, __kflagstab*, __versions,
> __version_ext_crcs, __version_ext_names and their relocations - for all
> 8,135 modules of a clang allmodconfig build with CONFIG_COMPILE_TEST off
> and CONFIG_MODVERSIONS, CONFIG_EXTENDED_MODVERSIONS and
> CONFIG_MODULE_SRCVERSION_ALL on, and for a sample built with gcc.
> 
> What differs is what the compiler added around them: the __UNIQUE_ID_*
> locals, the KASAN constructor for the .mod.c globals, and on x86 a
> .note.gnu.property that the linker already drops from any module containing
> an assembly file and the loader never reads.
> 
> None of these have any impact on the build, however.
> 
> The assembly carries no debug information, so in order to keep describing
> __this_module in each module's debug information, define it weakly in
> module-common.c too, in a section which the module link discards.
> 
> Nothing initialises struct module::arch from C any more, so
> MODULE_ARCH_INIT is removed from include/linux/module.h and from m68k, the
> only architecture that defined it.
> 
> x86_64 kernels built with gcc and clang, with CONFIG_MODVERSIONS,
> CONFIG_EXTENDED_MODVERSIONS and CONFIG_MODULE_SRCVERSION_ALL, were booted,
> every module and an external one loaded and unloaded, and the srcversions
> checked against modinfo, i386 and arm64 defconfigs (gcc and clang) and a
> ThinLTO build were also built as part of testing.
> 
> An x86_64 CONFIG_RANDSTRUCT_FULL build with clang, which places the name
> field after init and exit, was checked the same way and produces the same
> .gnu.linkonce.this_module sections and relocations as the C version.
> 
> On the x86_64 allmodconfig with clang 22, "make modules" with every
> *.mod.o and *.ko deleted goes from 64.5s (6,306 CPU-s) to 28.5s (518
> CPU-s).
> 
> A consequence of this change is that the make jobs are now so small that
> make cannot dispatch them quick enough, however the next commit in the
> series addresses this issue.
> 
> This impacts clean and no-op builds with a large number of modules most
> noticeably.
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 allmodconfig, no-op make, gcc        12.7s     2.3s    -10.4s (-82%)
>   x86 allmodconfig, no-op make, clang      13.9s     2.8s    -11.2s (-80%)
>   x86 allmodconfig, clean, gcc            342.6s   306.6s    -36.0s (-11%)
>   x86 allmodconfig, clean, clang          340.1s   290.2s    -49.8s (-15%)
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Looks ok to me from a modules perspective.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

> +/* The equivalent of KSYMTAB_FUNC()/KSYMTAB_DATA() and SYMBOL_FLAGS(). */
> +static void add_asm_ksymtab(struct buffer *buf, const struct symbol *sym)
> +{
> +	const char *name = sym->name;
> +
> +	/* The name and namespace strings the entry refers to. */
> +	buf_printf(buf, "\t.section \"__ksymtab_strings\",\"aMS\",%%progbits,1\n");
> +	buf_printf(buf, "__kstrtab_%s:\n", name);
> +	buf_asciz(buf, name);
> +	buf_printf(buf, "__kstrtabns_%s:\n", name);
> +	buf_asciz(buf, sym->namespace);
> +	buf_printf(buf, "\t.previous\n");
> +
> +	buf_printf(buf, "\t.section \"___ksymtab+%s\", \"a\"\n", name);
> +	buf_printf(buf, "\t.balign %d\n", KSYM_ALIGN);
> +	buf_printf(buf, "__ksymtab_%s:\n", name);
> +	add_asm_ksym_ref(buf, sym->is_func ? MOD_FUNC_PREFIX : "", name);
> +	add_asm_ksym_ref(buf, "__kstrtab_", name);
> +	add_asm_ksym_ref(buf, "__kstrtabns_", name);
> +	buf_printf(buf, "\t.previous\n");
> +
> +	buf_printf(buf, "\t.section \"___kflagstab+%s\", \"a\"\n", name);
> +	buf_printf(buf, "__flags_%s:\n", name);
> +	buf_printf(buf, "\t.byte 0x%02x\n", get_symbol_flags(sym));
> +	buf_printf(buf, "\t.previous\n");
> +}
> +
> +/* The equivalent of SYMBOL_CRC(). */
> +static void add_asm_crc(struct buffer *buf, const struct symbol *sym)
> +{
> +	buf_printf(buf, "\t.section \"___kcrctab+%s\",\"a\"\n", sym->name);
> +	buf_printf(buf, "\t.balign 4\n");
> +	buf_printf(buf, "__crc_%s:\n", sym->name);
> +	buf_printf(buf, "\t.long 0x%08x\n", sym->crc);
> +	buf_printf(buf, "\t.previous\n");

Nit: add_asm_ksymtab() and add_asm_crc() emit unnecessarily .previous
directives.

-- 
Thanks,
Petr

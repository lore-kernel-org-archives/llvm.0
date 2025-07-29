Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C812586E0
	for <llvm@lists.linux.dev>; Tue, 29 Jul 2025 23:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753832827; cv=none; b=m9mLIZSJUJeG30aEkAUEm2zi1gHPhbjXjJufyX6EY4HpTBfO9ekjuYCf3uK6Y06WOO1s+JqvFk6q6cFUTl1F52H/FpQKv55rMcyLJmKv+O/NffkVW8FHv0HGSyutUkf8xsIvCfFO5++HH0dk9LqP5lC/kw7J23Oco4QMr8Ykrn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753832827; c=relaxed/simple;
	bh=J0UexsktNSqCM9oZLpEk47OgaAxXlbfBFz7je7XQr2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qie9rtZ+q/h6TRoi2HXiMLKikuVHrN/kI5Me7EKEPhaNveT/ccOhoObz6uQONsvFt+sn7itdrHrnV+OL1dC6ASWQWrlnnQhz1Rle3aCK8yPg2DcDvAWQx5AJxfzFIVpUV2OYOIIhEWSLV9OuFOzLuLJ7p4pR0kbIGOK0fhnxPgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Umu7FTsG; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Umu7FTsG"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-31ee880f7d2so2900417a91.0
        for <llvm@lists.linux.dev>; Tue, 29 Jul 2025 16:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753832825; x=1754437625; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D5t7MDT/jSpU+9EuuhzwQmjAC64RK3pa7YGAopoG6Q0=;
        b=Umu7FTsGzkAYyZdfIJUFf29ufRdzSu6sJaRh1tlPiaHDsNk1ea4VQut5yJCveKskKj
         fH+Qgw2oaQsDN0u1hUI1qPVzBJbuCvb5eR++/HAB1MBVoV4rMxaHL1cGwF4izNT+0zDl
         tR12xon/Vxf37FUGy77vl8iqTUNrBIwu92k0nWr0A2dYAxNLk/siHsaO0KCJ69oUhZsK
         3BKSxKL35vG1j9veYms5MjZCiy91e+NZIsOjHDdGyUlZCN9TBuuUtpXNdk/ovUf726Lh
         HGuRmP6EpSVRq/wp3ADRipf8l5S/by4kO70oKv/s5lhsbYF5VBI2wmlkC7Sdzp2wNr2S
         eePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753832825; x=1754437625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5t7MDT/jSpU+9EuuhzwQmjAC64RK3pa7YGAopoG6Q0=;
        b=ci9OmXKlCQOHga6+9ZxD2chWtBRQajl/Ak+46Bq7DQV8+20iKMSXYSg5OUHk6DnXQ+
         8gvHRJdliOXAqVCKSlrcV42mK5R45GDLfz8cmuEbljaVb5d9lANtdPf8QJb+m0mbYA6H
         H9nfPuCh1+8+lLuePE43jQr6iwNSm+/ORK/KlxJ73myl7/xdpZDqECi9BjeVryEImGV3
         fH6+elXlAY+Bk7NK3KzglPX9Dc4yKVkJ3gZjvZAg8un1vgdpkJVoXjjgRbqBozPcqQod
         N4FyN1XdxjXJHgXtyfa1vzafFlxQ+ey7Vo3Q8muBGtdRLcGH2Ob2AYkYL6TPyM+D/Rbk
         He3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgHBWBEe56qix7LIgvW7NM2c3ReuiyDtJYh+gu6YB9HOJQ4ndln8diOO6TuKL0xtVb+O5h@lists.linux.dev
X-Gm-Message-State: AOJu0YyACiUuwM10G2uYoiYzL+ZRN+Wz13kuZC1q+KPf9uf/eO1EBuEa
	9FQqX9GQp15KH6o5v/pCdjSRS2a84ye21JsbzaQOlU5X+KrtewCYImtpflA7X22vTF7H/nxdNxU
	c0oOXrtMWHeUkhksOU0vnCcdQWZ3wKb4GxjkWhQWZ
X-Gm-Gg: ASbGnct1TFy6ZDEvtO6AILnC1rHDmnnAAQbyX5iJtnKzbDodmyp2J+ZnJKZnrfMluYC
	4sYZp2w1gWyOn54zy8uXf+44pDUpLtyDI08mrRVWE6daTPJszs7x+XzhhNRSa/i/EpfGVchdRZi
	GCDMPvtCOlv/Kjjq0dM9TtThl5rc8ZhWO/e2kVBmIFKjl9nRnflSznAHQ1j5eqN/C8RFvGXDRg4
	VU/VIPiUKRokpe6++iRjI7oaZYduadQh4jBFQA=
X-Google-Smtp-Source: AGHT+IFatYHgbdkljf2uPOkFYPjGqRSd5VZTTw5Hl+NajdqJb3Z+1Xk7PfcV2apzyvJWSR0lq7DZY2BZw1y0sfbpKyg=
X-Received: by 2002:a17:90b:540d:b0:311:df4b:4b81 with SMTP id
 98e67ed59e1d1-31f5de555ecmr1560173a91.25.1753832824572; Tue, 29 Jul 2025
 16:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250729234055.it.233-kees@kernel.org>
In-Reply-To: <20250729234055.it.233-kees@kernel.org>
From: Marco Elver <elver@google.com>
Date: Wed, 30 Jul 2025 01:46:28 +0200
X-Gm-Features: Ac12FXx5J_uI5wvGiwYtgZvEifeHFoZvdN3qjvmiKrjmEOPX9wOpmjCSn_Ig6-A
Message-ID: <CANpmjNOrerXn9DyLyazQPhg4JDEBm+NfNhR_zua04TcwQO76yA@mail.gmail.com>
Subject: Re: [PATCH v2] compiler_types: Provide __no_kstack_erase to disable
 coverage only on Clang
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, kernel test robot <lkp@intel.com>, 
	syzbot+5245cb609175fb6e8122@syzkaller.appspotmail.com, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, "Kirill A . Shutemov" <kas@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Wei Yang <richard.weiyang@gmail.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jan Hendrik Farr <kernel@jfarr.cc>, 
	Uros Bizjak <ubizjak@gmail.com>, Marc Herbert <Marc.Herbert@linux.intel.com>, 
	Yafang Shao <laoar.shao@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Jul 2025 at 01:41, Kees Cook <kees@kernel.org> wrote:
>
> In order to support Clang's stack depth tracking (for Linux's kstack_erase
> feature), the coverage sanitizer needed to be disabled for __init (and
> __head) section code. Doing this universally (i.e. for GCC too) created
> a number of unexpected problems, ranging from changes to inlining logic
> to failures to DCE code on earlier GCC versions.
>
> Since this change is only needed for Clang, specialize it so that GCC
> doesn't see the change as it isn't needed there (the GCC implementation
> of kstack_erase uses a GCC plugin that removes stack depth tracking
> instrumentation from __init sections during a late pass in the IR).
>
> Successfully build and boot tested with GCC 12 and Clang 22.
>
> Fixes: 381a38ea53d2 ("init.h: Disable sanitizer coverage for __init and __head")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507270258.neWuiXLd-lkp@intel.com/
> Reported-by: syzbot+5245cb609175fb6e8122@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6888d004.a00a0220.26d0e1.0004.GAE@google.com/
> Signed-off-by: Kees Cook <kees@kernel.org>

Looks good:

Reviewed-by: Marco Elver <elver@google.com>

> ---
>  v2: correctly split compiler-specific stuff out of compiler_types.h (Miguel)
>  v1: https://lore.kernel.org/all/20250729224325.work.019-kees@kernel.org/
> Cc: Linus Torvalds <torvalds@linuxfoundation.org>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: <x86@kernel.org>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Hou Wenlong <houwenlong.hwl@antgroup.com>
> Cc: Kirill A. Shutemov <kas@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/x86/include/asm/init.h    | 2 +-
>  include/linux/compiler-clang.h | 3 +++
>  include/linux/compiler_types.h | 4 ++++
>  include/linux/init.h           | 2 +-
>  4 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/init.h b/arch/x86/include/asm/init.h
> index 6bfdaeddbae8..5a68e9db6518 100644
> --- a/arch/x86/include/asm/init.h
> +++ b/arch/x86/include/asm/init.h
> @@ -5,7 +5,7 @@
>  #if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < 170000
>  #define __head __section(".head.text") __no_sanitize_undefined __no_stack_protector
>  #else
> -#define __head __section(".head.text") __no_sanitize_undefined __no_sanitize_coverage
> +#define __head __section(".head.text") __no_sanitize_undefined __no_kstack_erase
>  #endif
>
>  struct x86_mapping_info {
> diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
> index 4fc8e26914ad..fa4ffe037bc7 100644
> --- a/include/linux/compiler-clang.h
> +++ b/include/linux/compiler-clang.h
> @@ -89,6 +89,9 @@
>  #define __no_sanitize_coverage
>  #endif
>
> +/* Only Clang needs to disable the coverage sanitizer for kstack_erase. */
> +#define __no_kstack_erase      __no_sanitize_coverage
> +
>  #if __has_feature(shadow_call_stack)
>  # define __noscs       __attribute__((__no_sanitize__("shadow-call-stack")))
>  #endif
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index 2b77d12e07b2..16755431fc11 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -424,6 +424,10 @@ struct ftrace_likely_data {
>  # define randomized_struct_fields_end
>  #endif
>
> +#ifndef __no_kstack_erase
> +# define __no_kstack_erase
> +#endif
> +
>  #ifndef __noscs
>  # define __noscs
>  #endif
> diff --git a/include/linux/init.h b/include/linux/init.h
> index c65a050d52a7..a60d32d227ee 100644
> --- a/include/linux/init.h
> +++ b/include/linux/init.h
> @@ -51,7 +51,7 @@
>     discard it in modules) */
>  #define __init         __section(".init.text") __cold __latent_entropy \
>                                                 __noinitretpoline       \
> -                                               __no_sanitize_coverage
> +                                               __no_kstack_erase
>  #define __initdata     __section(".init.data")
>  #define __initconst    __section(".init.rodata")
>  #define __exitdata     __section(".exit.data")
> --
> 2.34.1
>

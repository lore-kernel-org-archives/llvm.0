Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25971DC05F
	for <llvm@lists.linux.dev>; Wed, 19 Feb 2025 23:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740007900; cv=none; b=HZ96WAnqnLaggPiSmOD25aCfyHw81j7StH6tg8sbnAH6p6OKeegVVz+irIx6Z0H2813nnOEbC+j9cQxe3tg99avuXf+EbP8qEj/gvjOEsoruRj8Vgk0PGh0CfRuKCEu2JCWkd6Mr4ZlFUhbaCnwwI+MZW7I3X90po70O/ujtjjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740007900; c=relaxed/simple;
	bh=kZFF/UGapITVALZqnqj0yQm4FGUA/GNIjxqdzKNT9gE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pHg/4+Wb3WI5viPliE+JdHMHzTu1iyQ6bTC++JbEuj9lUP6G6ax8rywB7OUNhz2G0k0svTliMzKPhGfGQBHKQEdVaVko9Idw7hajrhEpIqh59ZsHQe5k9gXofqm+QJr71ceNkSTaOdxQFgC8a6NGt/ctOx/68qXikxeCcEWCzrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXh2orrY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXh2orrY"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f26a82d1dso169106f8f.2
        for <llvm@lists.linux.dev>; Wed, 19 Feb 2025 15:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740007897; x=1740612697; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmA3kpoVqZacttI/kLsBWuEw55LbtbyDIck2OB1DMsE=;
        b=NXh2orrYHBSUMpJwFRrqmrP6wCpatAAr2WnSu8KGgR7+Yp9l6QXbmIAT9M8Dw0lM45
         RO/fYwj/uQZWeIqPEIAJ3F7VOxSVYIDCUAx4ofNRP6tvU9nb+mj8dtskD8eQQa6kANu9
         tzoB/mY+u8/A3JMPhX2O1hq26YhBAPPVum9YFOfK5uxrrbEzoe5vWa/Wn+rdosgMo6SP
         bgNk4Fl9pY2yUjHLo4dhkzWFbASRXHtqKTVXo6F17XFE+9Mj6FRkpxmzjUvYqjUGaGHK
         Q8UDF6Qx+mwDN02nMoI0W/8WZWB8R/4M4fyvEl+XUXHK6nN2y4d9X91/r9mjmqAfj75v
         YQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740007897; x=1740612697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmA3kpoVqZacttI/kLsBWuEw55LbtbyDIck2OB1DMsE=;
        b=CLa5ySJnL4LMeVu7r5FFKwU4ourcx7qy3wkMDlFJZC/24ec/VV0y/IwQcUS+NR8NmE
         jBk0WpqOw1QYH6eq5oag0grdXtcOHB6cqMpYgzTWPzDVLge9qb8PGro06q81AxDEb3Ud
         mEXdXTznmyZ09o+np+5U626EL/6eCKQHlaOpFxZNb5titYDHdv/ssZ80tvWjnbxeEcye
         i1G7/xwAck6aJcsRqWO4wfqOeEG9Iu85zh5jmr2xHnjDQ3GW2H7B/lJpjWsovEI1s2yM
         hLrUtSUJM6Mc6TNnDd5hIZBA34Qm1s41duldGtyDqHr71Z4p+O3EdT31uIUuSKz+RMsC
         hCfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW93vLSWGf1y5JcQ7vHrYtGHMqoHJtHxRPgb6N3JIYbGlB/rYjm5bJ14Yo2TtPFDHvnY+29@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr+ktimg4pEOw/rCp6pKV7uBULPGVV0A4rWZpg9Cc+RfikIySJ
	vv3Bf51JAHz1gS7qXOj5qB+l+d/1sh022LRYr/yLwCArTY2SvJvawd6+y0suGczdDsjrmuwlkD/
	D1IDHLt+drL0SU4XJrxswbVA80BQ=
X-Gm-Gg: ASbGncuAwp58vlmzkCmGoTGhJHxhGJP8+jaMm1tQcj4IO71ExfGRyvBKjDV1NVwvIXn
	SOxLPRAeZgiIB1t97WkrwZfRGX7XNgnihTF9queswGTAK5uZGKCLsgN9cjwz3uUJaZhskN3Jqej
	A=
X-Google-Smtp-Source: AGHT+IHZfSzvxjzwwqUfoRfSbt1O6bww8e/f91PrR75G5joTfFDT2SujsALHP/CGMVLShEI4KvhD5J4ptOHfp9wh9iE=
X-Received: by 2002:a05:6000:1fa7:b0:38f:4cb4:b822 with SMTP id
 ffacd0b85a97d-38f4cb4ce41mr9832739f8f.26.1740007897194; Wed, 19 Feb 2025
 15:31:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1739866028.git.maciej.wieczor-retman@intel.com> <d266338a0eae1f673802e41d7230c4c92c3532b3.1739866028.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <d266338a0eae1f673802e41d7230c4c92c3532b3.1739866028.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 20 Feb 2025 00:31:26 +0100
X-Gm-Features: AWEUYZnqbVnkwo7RUnRvKpv13p7_X9As-mP0O1dDctMW1ycjuPipkHqXbxnM_MQ
Message-ID: <CA+fCnZezPtE+xaZpsf3B5MwhpfdQV+5b4EgAa9PX0FR1+iawfA@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] x86: Make software tag-based kasan available
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: kees@kernel.org, julian.stecklina@cyberus-technology.de, 
	kevinloughlin@google.com, peterz@infradead.org, tglx@linutronix.de, 
	justinstitt@google.com, catalin.marinas@arm.com, wangkefeng.wang@huawei.com, 
	bhe@redhat.com, ryabinin.a.a@gmail.com, kirill.shutemov@linux.intel.com, 
	will@kernel.org, ardb@kernel.org, jason.andryuk@amd.com, 
	dave.hansen@linux.intel.com, pasha.tatashin@soleen.com, 
	ndesaulniers@google.com, guoweikang.kernel@gmail.com, dwmw@amazon.co.uk, 
	mark.rutland@arm.com, broonie@kernel.org, apopple@nvidia.com, bp@alien8.de, 
	rppt@kernel.org, kaleshsingh@google.com, richard.weiyang@gmail.com, 
	luto@kernel.org, glider@google.com, pankaj.gupta@amd.com, 
	pawan.kumar.gupta@linux.intel.com, kuan-ying.lee@canonical.com, 
	tony.luck@intel.com, tj@kernel.org, jgross@suse.com, dvyukov@google.com, 
	baohua@kernel.org, samuel.holland@sifive.com, dennis@kernel.org, 
	akpm@linux-foundation.org, thomas.weissschuh@linutronix.de, surenb@google.com, 
	kbingham@kernel.org, ankita@nvidia.com, nathan@kernel.org, ziy@nvidia.com, 
	xin@zytor.com, rafael.j.wysocki@intel.com, andriy.shevchenko@linux.intel.com, 
	cl@linux.com, jhubbard@nvidia.com, hpa@zytor.com, 
	scott@os.amperecomputing.com, david@redhat.com, jan.kiszka@siemens.com, 
	vincenzo.frascino@arm.com, corbet@lwn.net, maz@kernel.org, mingo@redhat.com, 
	arnd@arndb.de, ytcoode@gmail.com, xur@google.com, morbo@google.com, 
	thiago.bauermann@linaro.org, linux-doc@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 9:20=E2=80=AFAM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> Make CONFIG_KASAN_SW_TAGS available for x86 machines if they have
> ADDRESS_MASKING enabled (LAM) as that works similarly to Top-Byte Ignore
> (TBI) that allows the software tag-based mode on arm64 platform.
>
> Set scale macro based on KASAN mode: in software tag-based mode 32 bytes
> of memory map to one shadow byte and 16 in generic mode.

These should be 16 and 8.

>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v2:
> - Remove KASAN dense code.
>
>  arch/x86/Kconfig                | 6 ++++++
>  arch/x86/boot/compressed/misc.h | 1 +
>  arch/x86/include/asm/kasan.h    | 2 +-
>  arch/x86/kernel/setup.c         | 2 ++
>  4 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index f4ef64bf824a..dc48eb5b664f 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -195,6 +195,7 @@ config X86
>         select HAVE_ARCH_JUMP_LABEL_RELATIVE
>         select HAVE_ARCH_KASAN                  if X86_64
>         select HAVE_ARCH_KASAN_VMALLOC          if X86_64
> +       select HAVE_ARCH_KASAN_SW_TAGS          if ADDRESS_MASKING
>         select HAVE_ARCH_KFENCE
>         select HAVE_ARCH_KMSAN                  if X86_64
>         select HAVE_ARCH_KGDB
> @@ -402,6 +403,11 @@ config KASAN_SHADOW_OFFSET
>         hex
>         default 0xdffffc0000000000 if KASAN_GENERIC
>
> +config KASAN_SHADOW_SCALE_SHIFT
> +       int
> +       default 4 if KASAN_SW_TAGS
> +       default 3

What's the purpose of this config option? I think we can just change
the value of the KASAN_SHADOW_SCALE_SHIFT define when KASAN_SW_TAGS is
enabled.


> +
>  config HAVE_INTEL_TXT
>         def_bool y
>         depends on INTEL_IOMMU && ACPI
> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/m=
isc.h
> index dd8d1a85f671..f6a87e9ad200 100644
> --- a/arch/x86/boot/compressed/misc.h
> +++ b/arch/x86/boot/compressed/misc.h
> @@ -13,6 +13,7 @@
>  #undef CONFIG_PARAVIRT_SPINLOCKS
>  #undef CONFIG_KASAN
>  #undef CONFIG_KASAN_GENERIC
> +#undef CONFIG_KASAN_SW_TAGS
>
>  #define __NO_FORTIFY
>
> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
> index 4bfd3641af84..cfc31e4a2f70 100644
> --- a/arch/x86/include/asm/kasan.h
> +++ b/arch/x86/include/asm/kasan.h
> @@ -6,7 +6,7 @@
>  #include <linux/kasan-tags.h>
>  #include <linux/types.h>
>
> -#define KASAN_SHADOW_SCALE_SHIFT 3
> +#define KASAN_SHADOW_SCALE_SHIFT CONFIG_KASAN_SHADOW_SCALE_SHIFT
>
>  /*
>   * Compiler uses shadow offset assuming that addresses start
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index cebee310e200..768990c573ea 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -1124,6 +1124,8 @@ void __init setup_arch(char **cmdline_p)
>
>         kasan_init();
>
> +       kasan_init_sw_tags();
> +
>         /*
>          * Sync back kernel address range.
>          *
> --
> 2.47.1
>

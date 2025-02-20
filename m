Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1AFDF58
	for <llvm@lists.linux.dev>; Thu, 20 Feb 2025 16:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740069148; cv=none; b=nFb4qkewb9rHl1PXW2lXVS4zCX/ESp+tv8fXjAqJWEuFldPfIlKHmsRYdIzbf1PoPdNfbeXA9qo695n783Uc0F8H6hx/WVI/mppw65HYBNtg1vNNZoO5rl7PNjq/sLcZIUcvYBvqjSLjwWKroCq4HHdUqJtIQmWzIQYc0/1squ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740069148; c=relaxed/simple;
	bh=/xxoPVQV9rAqO9i3BY7Z44Jp9+qGzPSNQzg74YT7fO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i/SwZK+Rd6dgCxTSouBEaRjAsb2tH7qZDG0kXgDHoXwk5JGTKTWRnocgDaqMHADM8u5+xk93B5E8Gp1YlxH5O71ixmqvb1BB+1rG29to1lTfOV0MAIxQ3RSqBO9e3L2afULWV8G08Nlcbzfl0V9MdGPGtah5bsFWqwCvxanonvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkozMCCL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkozMCCL"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f2b7ce2f3so918966f8f.0
        for <llvm@lists.linux.dev>; Thu, 20 Feb 2025 08:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740069145; x=1740673945; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djJ6cJLCBX31nVMQXMRyTslZq1heGpJZhHxgGn2SThg=;
        b=OkozMCCLWHa8Mmsy00Ns8T2wRzDHu7ad3Zz4zB3yUkwie+zvlaAi2mxI41MZKwMHQi
         2t7tkFCqaKEhVNsFZxkaC5ycad6R+v13HPhVK74tk0HpjxZAVtA+OImltzICY5ApFCBl
         OHyOb7j1KQgOHpkRhpmEwrpSbJJ0ikmFQ2udHCpwzxrQTtf6uNIjtQ1NrmVx9MHyU3aE
         kPrrqi7plsD+CI5avf9fvCaNVDGStvLaHA3u75qTd8BOezx2C56IYk1v4ASGCyCe4820
         7RXP8QDjw+8P+HXvKPqTGbdVKMHQQww2BfgDCyiVKvZlhZXziiB4PA1VY0cCw8BA8nbX
         LHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740069145; x=1740673945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djJ6cJLCBX31nVMQXMRyTslZq1heGpJZhHxgGn2SThg=;
        b=dUuVF2hxYzbLUgNYlhM7XRm/w3+VudXbdrYaHYqHv8RPWUYVKfY8Vd9Q1fDf/jRJoP
         M/eswXuwY4Ik2AE1WyrWTKFIlNAcBxzBcPY9BmcppkFroV9Si4IT8MDUqoiAYt8G8m0P
         ABGmlJ3h6Dkpio+QHNWEKa3TFjB/bJpPP80IIINfC9g2HUMg16ukfWt4Z1glJITjAb7x
         ajg+e2B9QOfQyY/dbi+iqYfi6jLLchWNpa31RTmOMljISzquq9Ar+KMsmntw+YUOBczW
         20yD6H6M6ATJtWULTgepcQi97WRJRrSHe92lZkQwxBdouMPi33RGXMxzAuW7VhB6Gv11
         I4jg==
X-Forwarded-Encrypted: i=1; AJvYcCVrE8DMgfTEHKj0XGhaTtFucOuI095EKkHcTgeMwWXdX3GQSK17z36shBnZFqOElpcnacNt@lists.linux.dev
X-Gm-Message-State: AOJu0YxQW+8K9GcImp5OYGPcXdNPDbRv0DUsuIv8LZG6LH+vehaEuyjK
	1ccDmcDqX+YhOIOtxdQOND8D+TYC6JtnGRQxTF4kIsoDVzM6igjcVf4dQCq5/ia5mH8Jmk4a10V
	xI1obiIfYWRyGRiPItIhA1LsmfMM=
X-Gm-Gg: ASbGncvHGq8o2RwNClymbU2+FarUsZVhp2JVdqx/DEJJGJs+a4Tys5zkzlq69E+Aptw
	P5FtIMyyJ+IqgpSTKY6sD5X6uyNpbSqw8QLQLk1X4YIJTCl3MXzgO/Vgj7+VvoDRZ3hdfJd0pcq
	Y=
X-Google-Smtp-Source: AGHT+IE+fb/qSiQgDRutZeDBlmq5JYRBHFh6IjwYk9fKzL4B9g9ZxsaVzW96bSH5p8ymUhr7jbVsfdyuK+pmPd2y9mA=
X-Received: by 2002:a05:6000:10c:b0:38f:2111:f5ac with SMTP id
 ffacd0b85a97d-38f33f51088mr18279347f8f.31.1740069144731; Thu, 20 Feb 2025
 08:32:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1739866028.git.maciej.wieczor-retman@intel.com>
 <d266338a0eae1f673802e41d7230c4c92c3532b3.1739866028.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZezPtE+xaZpsf3B5MwhpfdQV+5b4EgAa9PX0FR1+iawfA@mail.gmail.com>
In-Reply-To: <CA+fCnZezPtE+xaZpsf3B5MwhpfdQV+5b4EgAa9PX0FR1+iawfA@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 20 Feb 2025 17:32:12 +0100
X-Gm-Features: AWEUYZlJk8i1PGeryrJoWL6O3cLwlGsfEZG1iYKTI3r7jC586Nd1JaZw47VvF2U
Message-ID: <CA+fCnZfHAEP08xwUM5TXAihtFzrVG_kJMVXBD1U2Z1BoqkM1gA@mail.gmail.com>
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

On Thu, Feb 20, 2025 at 12:31=E2=80=AFAM Andrey Konovalov <andreyknvl@gmail=
.com> wrote:
>
> On Tue, Feb 18, 2025 at 9:20=E2=80=AFAM Maciej Wieczor-Retman
> <maciej.wieczor-retman@intel.com> wrote:
> >
> > Make CONFIG_KASAN_SW_TAGS available for x86 machines if they have
> > ADDRESS_MASKING enabled (LAM) as that works similarly to Top-Byte Ignor=
e
> > (TBI) that allows the software tag-based mode on arm64 platform.
> >
> > Set scale macro based on KASAN mode: in software tag-based mode 32 byte=
s
> > of memory map to one shadow byte and 16 in generic mode.
>
> These should be 16 and 8.
>
> >
> > Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> > ---
> > Changelog v2:
> > - Remove KASAN dense code.
> >
> >  arch/x86/Kconfig                | 6 ++++++
> >  arch/x86/boot/compressed/misc.h | 1 +
> >  arch/x86/include/asm/kasan.h    | 2 +-
> >  arch/x86/kernel/setup.c         | 2 ++
> >  4 files changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index f4ef64bf824a..dc48eb5b664f 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -195,6 +195,7 @@ config X86
> >         select HAVE_ARCH_JUMP_LABEL_RELATIVE
> >         select HAVE_ARCH_KASAN                  if X86_64
> >         select HAVE_ARCH_KASAN_VMALLOC          if X86_64
> > +       select HAVE_ARCH_KASAN_SW_TAGS          if ADDRESS_MASKING
> >         select HAVE_ARCH_KFENCE
> >         select HAVE_ARCH_KMSAN                  if X86_64
> >         select HAVE_ARCH_KGDB
> > @@ -402,6 +403,11 @@ config KASAN_SHADOW_OFFSET
> >         hex
> >         default 0xdffffc0000000000 if KASAN_GENERIC
> >
> > +config KASAN_SHADOW_SCALE_SHIFT
> > +       int
> > +       default 4 if KASAN_SW_TAGS
> > +       default 3
>
> What's the purpose of this config option? I think we can just change
> the value of the KASAN_SHADOW_SCALE_SHIFT define when KASAN_SW_TAGS is
> enabled.
>
>
> > +
> >  config HAVE_INTEL_TXT
> >         def_bool y
> >         depends on INTEL_IOMMU && ACPI
> > diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed=
/misc.h
> > index dd8d1a85f671..f6a87e9ad200 100644
> > --- a/arch/x86/boot/compressed/misc.h
> > +++ b/arch/x86/boot/compressed/misc.h
> > @@ -13,6 +13,7 @@
> >  #undef CONFIG_PARAVIRT_SPINLOCKS
> >  #undef CONFIG_KASAN
> >  #undef CONFIG_KASAN_GENERIC
> > +#undef CONFIG_KASAN_SW_TAGS
> >
> >  #define __NO_FORTIFY
> >
> > diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.=
h
> > index 4bfd3641af84..cfc31e4a2f70 100644
> > --- a/arch/x86/include/asm/kasan.h
> > +++ b/arch/x86/include/asm/kasan.h
> > @@ -6,7 +6,7 @@
> >  #include <linux/kasan-tags.h>
> >  #include <linux/types.h>
> >
> > -#define KASAN_SHADOW_SCALE_SHIFT 3
> > +#define KASAN_SHADOW_SCALE_SHIFT CONFIG_KASAN_SHADOW_SCALE_SHIFT
> >
> >  /*
> >   * Compiler uses shadow offset assuming that addresses start
> > diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> > index cebee310e200..768990c573ea 100644
> > --- a/arch/x86/kernel/setup.c
> > +++ b/arch/x86/kernel/setup.c
> > @@ -1124,6 +1124,8 @@ void __init setup_arch(char **cmdline_p)
> >
> >         kasan_init();
> >
> > +       kasan_init_sw_tags();
> > +
> >         /*
> >          * Sync back kernel address range.
> >          *
> > --
> > 2.47.1
> >

Also please update the descriptions of all related options in lib/Kconfig.k=
asan.

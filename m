Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D321D25E462
	for <llvm@lists.linux.dev>; Wed, 19 Feb 2025 23:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740007848; cv=none; b=TFkZVGXIP8Lcy232oHwJqTcjTMmQ9mEmLbw8RtPMnTn6QxH8z5u6v17dsYWFg18PXtjG/1wiZ4vlXmMJfArewDe19e2zGPEOwKydTOUBdr3SuwMGINR/+PfI/16ZPh/tECZIp6aAmq1SNJyRFwEvdvMv9I7n+bU3lic9EM4GXPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740007848; c=relaxed/simple;
	bh=tcH227GyjKJ5hX9Pf/elTGU/np5lpy2A5toqwS89S8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7INmG3bezhdls5+vs4DXHK8+1yyOjIYW3szu0Wmdkv4Sp2LZWa7CM/HuDHoPN2tj5Uz4gKehTFXuuY5pLotoNEWyCwGDqzHCqVFcWKz8BcSTWg6W4H3kDvX6M524T5c+T2G7QFlEnpcAr3yHJo3HVLnz47QPKVvmk6w7fiaCPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gn8Z4aV7; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gn8Z4aV7"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38f3ac22948so173544f8f.0
        for <llvm@lists.linux.dev>; Wed, 19 Feb 2025 15:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740007845; x=1740612645; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyvyq2lJRxuQLrIeQSGTnuwykD7l8YgAhKyJ7T0zXzs=;
        b=gn8Z4aV7Qx+4TgmXCG+9BpmUOghVAlQSW8jWGr7QQdh74ImUUdJX6siAu6XPFqNXLn
         E4oY/25bA6aviD8G730GuC106Agwlyn3oM47GBLLVq3Q59OLZTrDQU6Vl+/Tm3mnlhLB
         j6gv2+CA6aW0lvccZF454iFncx4uQkORK4pPakIKtKps3QW4chRGCg+GB1+X5lLqk9T2
         kZyikLB4KDLg5evDfKtFJcTALKklm4bpAC38KFicYjHODJepfTCTN0TxH2H4XEJmzraI
         hK3vRjykDZgoZ11wm6AQnXKduXk1Y0BS+te3ZcN6k8AKaMcgepZcKdLs6eIt3vXZoqbZ
         asfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740007845; x=1740612645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyvyq2lJRxuQLrIeQSGTnuwykD7l8YgAhKyJ7T0zXzs=;
        b=gph5yGcbQy5IepO6KzeJcThGHL0zGd6i36kimqcxDhtCSZGrVmstJO6QC9g2mjpl9N
         iOUjomauGSxZA0tZ3vkNGeGMoMZtbBxiuN1PVMgQBKLyI2XTVSwPynVPWp0uUbBAu/Lq
         ZQzitq/YbEoxbX36FoBpKC0WVGST+tee5VqVQ6dZrohXFZ4hc4IlpymublOyavALWN1f
         j+abHeU79+ECSXCkmezBxyjjqmVdTRfKeOX7gbuXTGP475kjviGjTlFZ4d0IEK1PLkro
         +mw2x9KDZB+WHCQRXJeG1MwLPLj3q1xnKEebOndvH0VASbxBDPUSdVdJ2eFBC03pjKPy
         M1Xg==
X-Forwarded-Encrypted: i=1; AJvYcCX/gXokUdlsfSlD2lD0oZd5IlsUTxnsoMrQU1LZanya0IZuKHJxeoQCmQz9WIoWv4bGpK1u@lists.linux.dev
X-Gm-Message-State: AOJu0YwBZMlIqRp8OR81wwGwvI4rMvk8+4UmMGTKfVhNM2f9lXlhTSPR
	ZidhA90ryrnUkxVsawO8oFj9EG0LklgetYve0owQdfcruejtb4PuCg3sa5CpmaDMHSxEOHniOv7
	kE1Ymp+dwKjRs60teqXqbelKkpKQ=
X-Gm-Gg: ASbGncsDXvpYyZcpZXxtu0uEBph+qOuMLgLT1/5JitqynAr0DNMVQb5ChUJj3ol5yZw
	3sAPYdeP4OaIyUtupaJV+bACFELODklpOtmzTpQhyMz68LOUltA/hnybxlLNkXkfFk5PBevd6uk
	E=
X-Google-Smtp-Source: AGHT+IGseMQ09wMlftf0S31IcDCmvH/2XCIbgKJZ4vMRGW1oprX1xhCTfYNu+V/QxrTLfB/+OtK8LLpcPdlzuT7FUW8=
X-Received: by 2002:a5d:64e6:0:b0:38d:e092:3ced with SMTP id
 ffacd0b85a97d-38f33f1193cmr15640895f8f.7.1740007845049; Wed, 19 Feb 2025
 15:30:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1739866028.git.maciej.wieczor-retman@intel.com> <7099fb189737db12ab5ace5794080458d7a14638.1739866028.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <7099fb189737db12ab5ace5794080458d7a14638.1739866028.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 20 Feb 2025 00:30:34 +0100
X-Gm-Features: AWEUYZn8UfE_qbgWwdI_ZYXhFInJYUvvOaq2gnq6N0Mq2Y5hHq0QKSqyoBFpmX4
Message-ID: <CA+fCnZf16dzSjOLSeWXMaJLUR-b9x9_CY0JunaRaet_O_XNcsQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/14] x86: Add arch specific kasan functions
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

On Tue, Feb 18, 2025 at 9:18=E2=80=AFAM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> KASAN's software tag-based mode needs multiple macros/functions to
> handle tag and pointer interactions - mainly to set and retrieve tags
> from the top bits of a pointer.
>
> Mimic functions currently used by arm64 but change the tag's position to
> bits [60:57] in the pointer.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
>  arch/x86/include/asm/kasan.h | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
> index de75306b932e..8829337a75fa 100644
> --- a/arch/x86/include/asm/kasan.h
> +++ b/arch/x86/include/asm/kasan.h
> @@ -3,6 +3,8 @@
>  #define _ASM_X86_KASAN_H
>
>  #include <linux/const.h>
> +#include <linux/kasan-tags.h>
> +#include <linux/types.h>
>  #define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>  #define KASAN_SHADOW_SCALE_SHIFT 3
>
> @@ -24,8 +26,33 @@
>                                                   KASAN_SHADOW_SCALE_SHIF=
T)))
>
>  #ifndef __ASSEMBLY__
> +#include <linux/bitops.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +
> +#define arch_kasan_set_tag(addr, tag)  __tag_set(addr, tag)

But __tag_set is defined below. I think these need to be reordered.

> +#define arch_kasan_reset_tag(addr)     __tag_reset(addr)
> +#define arch_kasan_get_tag(addr)       __tag_get(addr)
> +
> +#ifdef CONFIG_KASAN_SW_TAGS
> +
> +#define __tag_shifted(tag)             FIELD_PREP(GENMASK_ULL(60, 57), t=
ag)
> +#define __tag_reset(addr)              (sign_extend64((u64)(addr), 56))
> +#define __tag_get(addr)                        ((u8)FIELD_GET(GENMASK_UL=
L(60, 57), (u64)addr))
> +#else
> +#define __tag_shifted(tag)             0UL
> +#define __tag_reset(addr)              (addr)
> +#define __tag_get(addr)                        0
> +#endif /* CONFIG_KASAN_SW_TAGS */
>
>  #ifdef CONFIG_KASAN
> +
> +static inline const void *__tag_set(const void *addr, u8 tag)

A bit weird that __tag_set is defined under CONFIG_KASAN:
CONFIG_KASAN_SW_TAGS (or no condition, like on arm64) would make more
sense.


> +{
> +       u64 __addr =3D (u64)addr & ~__tag_shifted(KASAN_TAG_KERNEL);
> +       return (const void *)(__addr | __tag_shifted(tag));
> +}
> +
>  void __init kasan_early_init(void);
>  void __init kasan_init(void);
>  void __init kasan_populate_shadow_for_vaddr(void *va, size_t size, int n=
id);
> @@ -34,8 +61,9 @@ static inline void kasan_early_init(void) { }
>  static inline void kasan_init(void) { }
>  static inline void kasan_populate_shadow_for_vaddr(void *va, size_t size=
,
>                                                    int nid) { }
> -#endif
>
> -#endif
> +#endif /* CONFIG_KASAN */
> +
> +#endif /* __ASSEMBLY__ */
>
>  #endif
> --
> 2.47.1
>

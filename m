Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4E64086A
	for <llvm@lists.linux.dev>; Sat,  6 Sep 2025 17:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757179078; cv=none; b=l+5wRsYRxkd9rD9x2kvt2FYqli8ao7G74ViiOOsR1SQfeJ0HxFVwEYgi/PZ+JFNABiPUWc09OUq7m3vscmixZ4eQNZva03hz7mhRRFjaSWH2wnSwzidQU1Jj59H+bWT/kgM6Ry8TKFgh5JFli6HgYnwRYDdA7ijHNlYD1xvnFT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757179078; c=relaxed/simple;
	bh=okqMJmQM18DFt0EJcZLNQqQ31vImauwlrNbsv0Z8scA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dE80liNgaMpUQ0lB+cY+auPKQ+LwNA67GaKRKu49fJ+PlnXcUNy0O8dIENM7lP15XWsn9yDGALGLgeQYBomJ9mb5rSlX7JFzGnYsp9BM4cTykGQclTGI1hKeHSViTdkaAQ7CDyns3G+eSAyMa9YhIyiNCrAwIOh1nRIQ8AT4hgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/yOOjCl; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/yOOjCl"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3e537dc30c7so1144787f8f.3
        for <llvm@lists.linux.dev>; Sat, 06 Sep 2025 10:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757179075; x=1757783875; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8m7gNbOiJ7wFumA8eH5KhxcoFHJTBnL28AX35/mxZ5k=;
        b=d/yOOjCle7v2j7NnkLHJbhBuLRTSRvbE3sPnHYxBnn9B4a0f0WmKJpzs+EYytI4otA
         bWGX9Qf0G57/Zl9WHmilwKGcOuPpXGkts9QfXgyjNV+uEUESA6YxyCfk2bLaYsAhFeuc
         Wg9lcSL6Zg4A7My3cbSotn36CcKiwGpVClb8oLJKSMS57h49i3+AgUewSx8nHNqu2nPa
         Uu37F4rzO/8GEn3WdHQzHT52DnQHQ3zS+wULTYZfOq8DMeejyIpVGrYi8y7yk1XIXLwh
         h2rzk8gl3tWXvQ6Iipzl0xY121CEAaDgogUAm4Du21IY7uICNqjf2c1Cl2KRraCG1zNi
         pwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757179075; x=1757783875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8m7gNbOiJ7wFumA8eH5KhxcoFHJTBnL28AX35/mxZ5k=;
        b=VtNWAZWiYd2Wp7UjHg2UNG4GCM+uvuqy0M4xU7NhfA+D/wBwnPfESGB7VGgWItUmI/
         VTMrMqTAMF7DxHdOCfLOkwZUlnhEpyWfEP++FsjJQ4gi9Ce9smbWZYcUvWOvvqRaMfHl
         YJOVJlh4oUZ+qAuuaAl/CSbt1eMAgs20czp7ayZInuEZQlK878v+MFEBTRstQHoxrWeq
         Ayutg9IDl8UCQQ3GLF/zYEVrrDW1Hk7z8jBhIR2l+lS7SduIyE12JkG0rEb+WMUpOQ9l
         N5a3JYUwBzVaxkSJIF5+ft68KDdnWxA+i9ZUh4AllB2eJUntveOre/LqXVUE1B+k7bbu
         jyYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbFftpD7pBL8UOa4xqCDBo8U4CLDt5uJkmiuYOAhjjnrsto230ZWBsEw5XfkpNl0BuuHPt@lists.linux.dev
X-Gm-Message-State: AOJu0Yw27g6H4YyTuG/XyCo7+y2yNSiAIpJAMrsPUn5VvG6nv2duvye0
	bzDEcVGdhKKyonY/6fGzk0ZB1DpKVcX47ZxHLcNLaQDQG4vc6BvOrg30JYYKAebzYPs8YzPjs9q
	OY86CtoPsFRemDinVtzNrUov6R8/9l5I=
X-Gm-Gg: ASbGncv3T5W/HQXGDj0OVDG9q/+L1KivVVn1pBN/Wd2qFRmt83o1M4YERyT2RrOeY1s
	QcjZYcCXZObeuIsPvZsxv9/idep+6KzQDegCgq0GHsZdv6r5ythkHhWOXrPTlDjrX7zIFTYEdBJ
	jDHAYXeupiPLG70C03kEZ/Q180kcr1Aq03oRxKMVL5bhJ3wng5Vy+exJ3RZ1w79zoHEZ6QaM5DJ
	sjJ3t7T
X-Google-Smtp-Source: AGHT+IEVaxv1flhMNQ21ny8HzxKdUksbjU1IsnfWBaLSu+i+o5RQBFuNsHWY/aKwSfi08c9LffaO8ru3O0fOtcOI6wM=
X-Received: by 2002:a5d:5886:0:b0:3e4:64b0:a760 with SMTP id
 ffacd0b85a97d-3e642026e72mr1764739f8f.18.1757179074706; Sat, 06 Sep 2025
 10:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com> <7cb9edae06aeaf8c69013a89f1fd13a9e1531d54.1756151769.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <7cb9edae06aeaf8c69013a89f1fd13a9e1531d54.1756151769.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 6 Sep 2025 19:17:43 +0200
X-Gm-Features: AS18NWAccC9JiiN3oBmxBjTrrK8-6qYxZFkRTV1lkD1J_h60FmCfpfZ83r4hey8
Message-ID: <CA+fCnZd7tM5i5jOriaYyR1GgjgREv0PhyxpFuEC5506FkndzAg@mail.gmail.com>
Subject: Re: [PATCH v5 04/19] x86: Add arch specific kasan functions
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com, 
	kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com, 
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com, 
	trintaeoitogc@gmail.com, axelrasmussen@google.com, yuanchu@google.com, 
	joey.gouly@arm.com, samitolvanen@google.com, joel.granados@kernel.org, 
	graf@amazon.com, vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org, 
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com, 
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com, 
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com, 
	justinstitt@google.com, catalin.marinas@arm.com, 
	alexander.shishkin@linux.intel.com, samuel.holland@sifive.com, 
	dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com, 
	dvyukov@google.com, tglx@linutronix.de, scott@os.amperecomputing.com, 
	jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org, 
	lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com, 
	kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org, 
	jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com, 
	ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org, 
	peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com, 
	ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com, 
	ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, rppt@kernel.org, 
	pcc@google.com, jan.kiszka@siemens.com, nicolas.schier@linux.dev, 
	will@kernel.org, jhubbard@nvidia.com, bp@alien8.de, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 10:27=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> KASAN's software tag-based mode needs multiple macros/functions to
> handle tag and pointer interactions - to set, retrieve and reset tags
> from the top bits of a pointer.
>
> Mimic functions currently used by arm64 but change the tag's position to
> bits [60:57] in the pointer.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v4:
> - Rewrite __tag_set() without pointless casts and make it more readable.
>
> Changelog v3:
> - Reorder functions so that __tag_*() etc are above the
>   arch_kasan_*() ones.
> - Remove CONFIG_KASAN condition from __tag_set()
>
>  arch/x86/include/asm/kasan.h | 36 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
> index d7e33c7f096b..1963eb2fcff3 100644
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
> @@ -24,8 +26,37 @@
>                                                   KASAN_SHADOW_SCALE_SHIF=
T)))
>
>  #ifndef __ASSEMBLER__
> +#include <linux/bitops.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +
> +#ifdef CONFIG_KASAN_SW_TAGS
> +

Nit: can remove this empty line.

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
> +
> +static inline void *__tag_set(const void *__addr, u8 tag)
> +{
> +       u64 addr =3D (u64)__addr;
> +
> +       addr &=3D ~__tag_shifted(KASAN_TAG_MASK);
> +       addr |=3D __tag_shifted(tag);
> +
> +       return (void *)addr;
> +}
> +
> +#define arch_kasan_set_tag(addr, tag)  __tag_set(addr, tag)
> +#define arch_kasan_reset_tag(addr)     __tag_reset(addr)
> +#define arch_kasan_get_tag(addr)       __tag_get(addr)
>
>  #ifdef CONFIG_KASAN
> +
>  void __init kasan_early_init(void);
>  void __init kasan_init(void);
>  void __init kasan_populate_shadow_for_vaddr(void *va, size_t size, int n=
id);
> @@ -34,8 +65,9 @@ static inline void kasan_early_init(void) { }
>  static inline void kasan_init(void) { }
>  static inline void kasan_populate_shadow_for_vaddr(void *va, size_t size=
,
>                                                    int nid) { }
> -#endif
>
> -#endif
> +#endif /* CONFIG_KASAN */
> +
> +#endif /* __ASSEMBLER__ */
>
>  #endif
> --
> 2.50.1
>

Acked-by: Andrey Konovalov <andreyknvl@gmail.com>

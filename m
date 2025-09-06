Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71014086A
	for <llvm@lists.linux.dev>; Sat,  6 Sep 2025 17:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757179135; cv=none; b=vFrmCOskQqtQY+10PAd7WwCiB31BXyL9Vzm4TVk2q+V5DcTonRLAfRCQAaY7KLV10j5H5OVmMkZwdttAllgdGczF/zQt43l/GPoXfntaFel4jiBhQnuysa/SX+9WwnzbZ4fu3BfH53Oe0pQ9syGrs3AlUapQSC3bOIilHBxRJVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757179135; c=relaxed/simple;
	bh=mxDBO5qa3GGN7XPNHYXzxxDrs+cKVmCs/FaGHSo+vTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z78Gv4IpbMoIsz6NzX6kQyAn4+qBSvKUKeW2WlbGwYujxylB6vakLdeKi4C3RdLn2+s0nkr5iKU/u5C8d1kUxcEw4a0NE3Q8iQ8GAU8e5ygitbqw7kLHhWRRKTqaXasfqOtyQExaNHlDvppOYpLt05eXKuVq23M0xT0bBmMC9V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8I4wXxY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8I4wXxY"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so7104085e9.1
        for <llvm@lists.linux.dev>; Sat, 06 Sep 2025 10:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757179132; x=1757783932; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvnXgjkKA1Pp2ZMyBbTXIoHx/IW3dCtqfz+u+Yq42DE=;
        b=W8I4wXxYcCkHrRuR9zDrvEYIjifxx7YFdinF3odlw4+Z1qdd4tU6IhfCA5IS1xErBb
         hRKCIPEU83zqAtyCH8PhUMruX/uzdfyo5Hu+vS6mbwo0TvFEXv6IzR1Lehz97aSN1HXq
         WhIfhvOpGZ3XAgaZcxwvsmHaAwonhd+w5UEhiEN133DH9QGuIXMjPXTjiLD+EMHKmgdI
         wJLW/3SW0i4ke+VAGV9ccAC4SJ6MZhlXidp1EEGboBCoTaxpovY8llPHxArqi1h3aQdw
         1FIfiliyG77Hsw5V5O0DHqvj9CLZQ+sfKFKypLdC6Ke9L45CbuYC6hRdl4emkzxb2RQM
         dcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757179132; x=1757783932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvnXgjkKA1Pp2ZMyBbTXIoHx/IW3dCtqfz+u+Yq42DE=;
        b=jYUZ7fY11IWmGfY2f1PtoEzVfAH2I+1/z2xlAVrrTQRVaijCH1IFYmFLhxBFPKcS0u
         WzHUF3qfxgTy4yGlqJ7/tCISJlXoitEFWKxUDXbO2YPIda1znbdMw54RZXlPxuuWxa+E
         JXYu1gjftaZUd5j8RGiW01YNgNvBcryTxN71x1EoR/WbvzXvkAVpYyQPhuk8S7IvfHEe
         PyJ6V9icjvOSy8l/VdPNJ/FYzNQWg/ud0XIKFyTNYi3zz1IWDumb6FixVgOPAKEaOxrM
         dYntxKwPFX02PrySnppek0G85N/dSAVMfFZJT/3925H6Cm34eykER58CVp57bS36BdGN
         0CLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEEgAcEk7Tea0Qq5ewC/T5VHwP1sPt1RQ0vEIk9BCDg00Ooc4Ei5kJsRYXHUIJed+TkTNL@lists.linux.dev
X-Gm-Message-State: AOJu0YzqX/L0jw+B7COWwoDt+xldchLnM2VFycSAey4ASS006e6QySD2
	Zu0DceJFh82x5Zu2b6EzT7hM8rnPmG+DjQPq/NcKBan/RrztwBuwCyBKCywN+Y9EsqRMd+5Mrr6
	ObE/KNcqG0eFCcG0bkDlSMkZOCH/SarU=
X-Gm-Gg: ASbGncufkFbH8oTFwNvw+QeUU9NkloyGMOKDXVUgaaCdBDH1FcyAL1qYizjVFNe7aLT
	EqaRqxPK7MkGomZlYF1AZWCeXihc8itpYP0yScXTkV0gPEh1eI+gqYpZWyCh760vCjGXnUKVXXG
	qPp7ixzPpQP1TDy0mmQ770lygXkZHw84igeFCuFH0Ena4KT5zNzVOQlHoPK9DVl7H2GcOEsDgH3
	JvCRt1U0arxeVzE+FQ=
X-Google-Smtp-Source: AGHT+IFd67uPTqVPfMc7bozbMZ5rB/KKiiv3rdrmWYBThjYpOYSQHAfLhZfyUhJZKRt6LAh3XOHhPqNJnibRne/x5dE=
X-Received: by 2002:a05:6000:2910:b0:3e3:f89:ea31 with SMTP id
 ffacd0b85a97d-3e643c1e706mr1880888f8f.61.1757179131893; Sat, 06 Sep 2025
 10:18:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com> <c9dfcee8bd04161394f41a21f78fc3e01a007ddb.1756151769.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <c9dfcee8bd04161394f41a21f78fc3e01a007ddb.1756151769.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 6 Sep 2025 19:18:41 +0200
X-Gm-Features: AS18NWAE44l-F8fxYkxmWh2eLEtrt0fldHS7j-JrDWBIap-lKzv70eyY1F7Ln-M
Message-ID: <CA+fCnZcBGhToB+pOhn+ACahyqVLWJ_7cnqBNZC5ob77wZD5iJw@mail.gmail.com>
Subject: Re: [PATCH v5 12/19] x86: Minimal SLAB alignment
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

On Mon, Aug 25, 2025 at 10:29=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> 8 byte minimal SLAB alignment interferes with KASAN's granularity of 16
> bytes. It causes a lot of out-of-bounds errors for unaligned 8 byte
> allocations.
>
> Compared to a kernel with KASAN disabled, the memory footprint increases
> because all kmalloc-8 allocations now are realized as kmalloc-16, which
> has twice the object size. But more meaningfully, when compared to a
> kernel with generic KASAN enabled, there is no difference. Because of
> redzones in generic KASAN, kmalloc-8' and kmalloc-16' object size is the
> same (48 bytes). So changing the minimal SLAB alignment of the tag-based
> mode doesn't have any negative impact when compared to the other
> software KASAN mode.
>
> Adjust x86 minimal SLAB alignment to match KASAN granularity size.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v4:
> - Extend the patch message with some more context and impact
>   information.
>
> Changelog v3:
> - Fix typo in patch message 4 -> 16.
> - Change define location to arch/x86/include/asm/cache.c.
>
>  arch/x86/include/asm/cache.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/x86/include/asm/cache.h b/arch/x86/include/asm/cache.h
> index 69404eae9983..3232583b5487 100644
> --- a/arch/x86/include/asm/cache.h
> +++ b/arch/x86/include/asm/cache.h
> @@ -21,4 +21,8 @@
>  #endif
>  #endif
>
> +#ifdef CONFIG_KASAN_SW_TAGS
> +#define ARCH_SLAB_MINALIGN (1ULL << KASAN_SHADOW_SCALE_SHIFT)
> +#endif
> +
>  #endif /* _ASM_X86_CACHE_H */
> --
> 2.50.1
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9A01F542E
	for <llvm@lists.linux.dev>; Sat,  6 Sep 2025 17:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757179167; cv=none; b=cf7gSia+bpAEEnwTWC90DpIrMcLPMipt2n+loq8Ka1nvhyE0R+B10ubjKEMuDrN5i32wSY/8ETTQCc/KTFrU82hj+MX9PzpE3oPBbfMLAZsdwW6MJIiV0m2hehzLsKSakmI7CBElkQFAM9GNM2hpVYX6EmfBhyY0mp+gkbZBITo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757179167; c=relaxed/simple;
	bh=Sl3sNp9u3l9/VwrUVrMZnvXHXzeQd6V3+jebM+bRp74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gcQgzp/WOfVPAfBoyY7j4JoIY8HK05a6fXSRuyCzbQOKFjIpg9v+uYWu1cutl2oo0SUYYIyTi/wgEyzs+HS8EmOa9F7Jd1HB5asVDbJRICTK0dD6jz5NuBp3T+Z1w7caUbYQU1vNdxHNmDqEp/QqQwYmksfH1ze/XQ3KAS7qqhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LaS3PPlE; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LaS3PPlE"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3e537dc30c7so1145598f8f.3
        for <llvm@lists.linux.dev>; Sat, 06 Sep 2025 10:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757179162; x=1757783962; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/VsaAZE8BZZcz6ps/gV/vx/aBIFb7Atd0DyuiuXeeQ=;
        b=LaS3PPlEYo+CCdGg30ojCAzc6UfHkKz/MwW2jsc8WU7ebYNOwsosd+/wMIXFaOeF6l
         i/urq4OXilM2CEBYykf2qPoyu2rAUx7F1ID5+Z0gOug45VFZZW0VgBW/GPj3Fnl/+tIl
         YT6bRSBK6tIJ/HS2Ubq0bSPFAEyd5TSv1vaj8n4/8KZLZ2VRuxNRlyy0a7Jyt7FBldLJ
         EGHPhmRudDWyhCH0wB9NwL2cZW+MuHFYo3Oe43uRR7QnfUTauxC+5Ot43m7xnALQl/lg
         dVIwgwImvohyPAxllwDJOOOa2X0o1aytcaQnTcNftsdZrCuxMNzoPvhKR+BESGnRxIou
         O21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757179162; x=1757783962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/VsaAZE8BZZcz6ps/gV/vx/aBIFb7Atd0DyuiuXeeQ=;
        b=mmQLyVJ5wpNwPTg2wymH8XwFHDw4DeU3czkzgoi+VwTrvHshWu2EPsW93NW1G2Us5V
         m5gvwIvsWa3k91+Tm+7Ctp8UjsLHRkzJdz6PbFX+2x5dIriu8ZJTM+KOSYI8Ap8TCvHo
         WppLjZCkb11Ak6sstgfXR6ZyzcjVSm5VS2BDMvDrdA+SsdEzSEedPNNKoGsXQRertuF4
         OCBmMfSrdoOnFYVHZPApsTawuYhU9FYEFM5JHAzRPGKX2QxZuS6MzoXmntCiOcnjK8pM
         0oLaqBshmY634wZXGZC5WMaOFUJ7ZI2VaZ+ox1uSPJTL+5p3o13+hTFc1wC019W6CLB/
         ssMg==
X-Forwarded-Encrypted: i=1; AJvYcCWPkIiWLBOwWkuFygSRu3xo1r0qOcZMn9tAzuudQsrzAxAwPJlRbdgev3A8nPuzEeoULE91@lists.linux.dev
X-Gm-Message-State: AOJu0YyPLWehcTPLjssbMZzGPifVG1KO1kqQCMwkl0NjagdzO3Vtb23Z
	sXHuVCvNhFArgx8Z9ZuNbJz42Z2OQRMZAAZMyhLcRzBPEqxWK1EbMs0/sX2hbcWInwM9GM1MeIU
	MHxvimkrL2WSIUs+FruVQ4GBMI+fUHnk=
X-Gm-Gg: ASbGncua7K3gs0U1Ouj6ZjEguUuXE+HNGswhUjKh1pVNdKnkLef8taqcKzn1pJEotyo
	PFm1O6F9k8LJZoc1JaAEK+28wU0s3JbPAb24wQDMNbFkmn0p7KLAatamVbLxFCf2TfLC+ACVKFF
	U8m7g/hySwscQ0yyX1RPU210eEB8LbEAQ2PEVV2snz6xEeqPy/DWnkuukcFS03g4AgZVV+ly6z+
	NgCWFwZ
X-Google-Smtp-Source: AGHT+IHwMXVmgCNboW6n0WZeFTHhba11a2SFsS8Zt9OQUQAavArl8kiQY3QwMXTXdNAssOnQ/PiGObbIRc/kxueWvOY=
X-Received: by 2002:a5d:64c5:0:b0:3e5:47a9:1c94 with SMTP id
 ffacd0b85a97d-3e645e858b9mr1560400f8f.49.1757179161926; Sat, 06 Sep 2025
 10:19:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com> <3339d11e69c9127108fe8ef80a069b7b3bb07175.1756151769.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <3339d11e69c9127108fe8ef80a069b7b3bb07175.1756151769.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 6 Sep 2025 19:19:11 +0200
X-Gm-Features: AS18NWDcebDXZ0CncnyAGPmg6m7DGHRQKjrUi3A45HP3A_5pPACdVmuNY1mdCAs
Message-ID: <CA+fCnZedGwtMThKjFLcXqJuc6+RD_EskQGvqKhV9Ew4dKdM_Og@mail.gmail.com>
Subject: Re: [PATCH v5 18/19] mm: Unpoison vms[area] addresses with a common tag
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

On Mon, Aug 25, 2025 at 10:31=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> The problem presented here is related to NUMA systems and tag-based
> KASAN mode. It can be explained in the following points:
>
>         1. There can be more than one virtual memory chunk.
>         2. Chunk's base address has a tag.
>         3. The base address points at the first chunk and thus inherits
>            the tag of the first chunk.
>         4. The subsequent chunks will be accessed with the tag from the
>            first chunk.
>         5. Thus, the subsequent chunks need to have their tag set to
>            match that of the first chunk.
>
> Unpoison all vms[]->addr memory and pointers with the same tag to
> resolve the mismatch.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v4:
> - Move tagging the vms[]->addr to this new patch and leave refactoring
>   there.
> - Comment the fix to provide some context.
>
>  mm/kasan/shadow.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index b41f74d68916..ee2488371784 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -646,13 +646,21 @@ void __kasan_poison_vmalloc(const void *start, unsi=
gned long size)
>         kasan_poison(start, size, KASAN_VMALLOC_INVALID, false);
>  }
>
> +/*
> + * A tag mismatch happens when calculating per-cpu chunk addresses, beca=
use
> + * they all inherit the tag from vms[0]->addr, even when nr_vms is bigge=
r
> + * than 1. This is a problem because all the vms[]->addr come from separ=
ate
> + * allocations and have different tags so while the calculated address i=
s
> + * correct the tag isn't.
> + */
>  void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
>  {
>         int area;
>
>         for (area =3D 0 ; area < nr_vms ; area++) {
>                 kasan_poison(vms[area]->addr, vms[area]->size,
> -                            arch_kasan_get_tag(vms[area]->addr), false);
> +                            arch_kasan_get_tag(vms[0]->addr), false);
> +               arch_kasan_set_tag(vms[area]->addr, arch_kasan_get_tag(vm=
s[0]->addr));
>         }
>  }
>
> --
> 2.50.1
>

Do we need this fix for the HW_TAGS mode too?

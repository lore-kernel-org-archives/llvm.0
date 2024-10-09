Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF57E15E8B
	for <llvm@lists.linux.dev>; Wed,  9 Oct 2024 02:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728439759; cv=none; b=PFXKlXU1OCk1Nu29VFHD+AJraRz3iH1JOKxNWKiFtBcv+DZmeaBGX9XQJgjLw9YKSKw3Y5eZ10mHwedlngXYSqqTOFAC/+Z728GSX9G9MDoB09WVPT1kbGHAeFmtFikdeQeFALwFwSoSL3VHEkdOcaJjkQxNHToeAMGxI9y2ogc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728439759; c=relaxed/simple;
	bh=A99ew9gZR5pmHUG8WxOzLSgHb8WnT/ZsItTFDnJ2YAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wr+h1UOAxPXZKAUNWhP/sBWLjykH02VxbE8Bm4I8RsBQ8PliM09C+BN8JpvdPk/f5N/ywVxtj82EyasWRHYwkeQMVRb7lMq3tdCp801sknQw2AYzmPRqvBKXC0CwvZTqJbBL3X4FQwVfBZFXv0xVQMaV6EG81Tud215sLlDAMbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQt9Hhsx; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQt9Hhsx"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-50ca34282c4so1024324e0c.0
        for <llvm@lists.linux.dev>; Tue, 08 Oct 2024 19:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728439756; x=1729044556; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qb1GBUE5bd79oRRfoU1wYzeVHp7KyK+orebRrydrldU=;
        b=cQt9Hhsx6Fu1tRDlkCvTZZvAI/IdnESGkhzSpA89/kKuBvqnDAj6GsWHUCrmKePjUj
         LiZPCvKjScAYLyVW7y6NKMv9Bl5SiM6+djb2KfWQ/K9yYZYptKK03kO4OmclQji7djXV
         4Sbqt8adHBZKyu+4HUSSoWdXC8d4yOpjKWBstk2cxgEEL5pRqkmJvOQLOAr4eFvNbh7l
         ZHYXu55zmtMuBafMpJ9p5NMZ4WRlDPkF2/+/A5sPQDG6TQiyyv0MM7zD/mHhc/AcVlx7
         u2uML4aWjJll8YaceMY0BNVTNBL5ZkUR5+fVhiT1+UXO0yHe4V7OBsWk6mNRK8lwHWWd
         S0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728439756; x=1729044556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qb1GBUE5bd79oRRfoU1wYzeVHp7KyK+orebRrydrldU=;
        b=Oq/84VCrSy03yk5AfMAFFdT/qxx5PDaXP2pWV5qsf6+OpbwkLlM6DWpQfKmDcE/YCa
         Rdlgp/NkPuQiGMSpql7bNiy0DXHLNVM+sZQvHoPANDH5aK8+deouUPCAWRgm0ubrk9Kl
         MfGaN8afCCEjzw907EIAj25jRixx/1hXZPdPC3l5Ip1j6sswe/2W1VN+oIMLAuT6zjGc
         A6k0+qRaFvO/IXT6pmXPZ+loSi24hMzSnlbi/L9L/mFYydEHO68B58VZhMpXTBR/rLsM
         TRu2ZeXwUi25TzRyvYRCbipa7I6tvV+zWgsXjdW5fSBv9Qp+/vFAfJwAw7JKpNZgNo9i
         FyrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu3pUr8jts984B7w24FAKhsxxFqLq7liDWsSSQCL7uAMag/syr30EMApwMayLGh52NpwVh@lists.linux.dev
X-Gm-Message-State: AOJu0Yxqcb5i/axc5sDUrAFs0HpezDeMh9/blM2qne6t0yNwz1eWVSVV
	ppiaTGzDn+YMyq2lj5En7tUFGLN0/HK+AxbbLjiAig6wumLlIyytYcvvJd643u5WVc0bV4EyeX2
	css4qGuuK9bQNQ9X55yMxT+PLiUk=
X-Google-Smtp-Source: AGHT+IFu39wHmH+QO6CWG2Nv6HuHj1Qac8nNN58a1in00REEJe3X0XIxdNjzyUdLEZls7XOWPAn3Cnyf1yghCNWk3tQ=
X-Received: by 2002:a05:6122:2a42:b0:50a:c73e:b337 with SMTP id
 71dfb90a1353d-50cf09d1e41mr496087e0c.6.1728439756402; Tue, 08 Oct 2024
 19:09:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008191329.2332346-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241008191329.2332346-1-andriy.shevchenko@linux.intel.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 9 Oct 2024 10:09:05 +0800
Message-ID: <CAGsJ_4w3wBG7SvmoAFsnOBbNihAO+ioiNJmU1tEObwFNq5nnQg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] mm: Remove unused stub for can_swapin_thp()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Chuanhua Han <hanchuanhua@oppo.com>, Barry Song <v-songbaohua@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 3:13=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> When can_swapin_thp() is unused, it prevents kernel builds
> with clang, `make W=3D1` and CONFIG_WERROR=3Dy:
>
> mm/memory.c:4184:20: error: unused function 'can_swapin_thp' [-Werror,-Wu=
nused-function]
>
> Fix this by removing the unused stub.
>
> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=3D1 build").
>
> Fixes: 242d12c98174 ("mm: support large folios swap-in for sync io device=
s")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Barry Song <baohua@kernel.org>

> ---
>  mm/memory.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 2366578015ad..c0869a962ddd 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4181,11 +4181,6 @@ static struct folio *alloc_swap_folio(struct vm_fa=
ult *vmf)
>         return __alloc_swap_folio(vmf);
>  }
>  #else /* !CONFIG_TRANSPARENT_HUGEPAGE */
> -static inline bool can_swapin_thp(struct vm_fault *vmf, pte_t *ptep, int=
 nr_pages)
> -{
> -       return false;
> -}
> -
>  static struct folio *alloc_swap_folio(struct vm_fault *vmf)
>  {
>         return __alloc_swap_folio(vmf);
> --
> 2.43.0.rc1.1336.g36b5255a03ac
>
>

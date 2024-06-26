Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE96D51D;
	Wed, 26 Jun 2024 01:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719365211; cv=none; b=H32T9r7sJR1DpFx45+upacYUz/Mtz1xXIJQYDYVYbmRYToAMvpajOPwKWIT0X7MmmCfTgmjAFxx2ir8aEMH2+LNLejaKaur14rn9RdmaLUOK50xJSfYO8/HuwQ0wETyAnPjACYUtL/6JGspEHbQFFNyIRJj0KW5/N34tE7k0SCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719365211; c=relaxed/simple;
	bh=zDNg0nPNxG4ENOO8Lxnnyf3g9QrlizOcC1M+9OwgOWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhcI2qt4dktEHVAuTDL5YxOdUyykxA+5aoHnwFeCKQqg+6mllYlIiQ20bBH/MT2gxZlfmxPnRzwksJH25Qznx3sl8/zS6FOVPJNkh0DTr+blQ9IwIDlMZbZqjtjInEZkdx9RTfaTXC2DvSNfbNaJPxAw0WlLnnOWNkmMYaQt/fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEHWbhLp; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEHWbhLp"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5295e488248so7058224e87.2;
        Tue, 25 Jun 2024 18:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719365208; x=1719970008; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tANEY+M56yiD7hSog1hj0C9LymtYDipW0j1BMyxicPw=;
        b=AEHWbhLp9n2KlUY7yujjf3dEGkJJMyOZ9e6NMsSa3XJMdR4hMixMWYkPlpD6YUl+Hi
         xKYoZy/zVysPCzMWdItb5ygjV+H9de/l1wBaSf6xm3GbZ9kmIJsNf6RfzUcamzEyCrFj
         Na8WxAuT4zsuNLI15Ncw/idvHnRUpHl3p0wZ3k95vvmm++jGcMd9fbgALyPC0/XO0Tu8
         p6UvCutDOE7rXtxK5/Yd9na97NnXteTsO86kPecbhIJmD+sVqiEIuTQ3LmsX+z4SF4/2
         VZyMp7+oUwzUr+5rYmsFPLcn9yLw5ZQo5/fc4z71xriDuwIa3f2E1DgeRlD9pXP1dxPS
         u2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719365208; x=1719970008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tANEY+M56yiD7hSog1hj0C9LymtYDipW0j1BMyxicPw=;
        b=Gfpc8Vwc8WqX8Wj/dedXr6C8X+okQIv9vd9BaSl0EHUhVwM/KejswjFVGUCSmm/a30
         juvlAIlmRPFs1pbVz32qg58AGmtC71i9gDw9bqZ9e8FRnjUeMSexav5ERiqcI062iEQa
         vuIkg7xYNf/8NUyZh1uSAKghafUkjQ0D5TG8qXyXjvuHV3Ck18AEWtr1ebbItcZUKzq0
         xlIirkVmVqIO2zDscSqrx/AP74d+dXG/XVucbL7L9b6WN4QlsoBy1muazC0BgfXjl/Zc
         OCVFNQXAjg2iXJJM95Hbh4wGelgEYC/jEnu6vjJgDB11nvG2Yb1eu5iPYOAGjEBPLtNn
         2F3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQw9AeaoJvy2MRlNoKyCw2fjvGvcSnlh04HdOwOkSUr4NSWCuw2Br+bQ7KHMsuiJKmPceKE8Md3QMvPUP0dVf5felHWzpy3E56r2u1ka4w9cf4w99IsQR5CQH+Utjt7Wopmvs=
X-Gm-Message-State: AOJu0YyVnaZRto++F1hqsfTAGoHFL6bBxp/Bx6gqBShOvLyDrjSBhq/Y
	WOUZd0aoFHEweLWpo2R/zi8YVV3PA4n1g1sxMoKUvjSSQdcg/0aUKwmzVCgwHN0RIqC7nvlU9Me
	wx9bltIl2UY4mSqcXQXhJ6WZzLgY=
X-Google-Smtp-Source: AGHT+IEETQh2pfp7G4EtPUAG4zfYaOcqG4MrmB8HSsZzqNVtmys/DMhBHIIqOctT8mteNfPrcq1X0+Bn/gHiO0U9f90=
X-Received: by 2002:a19:e046:0:b0:52c:e171:ba2 with SMTP id
 2adb3069b0e04-52ce1835617mr4892289e87.17.1719365208080; Tue, 25 Jun 2024
 18:26:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406260514.SLhNM9kQ-lkp@intel.com> <20240625145252.d78d18a109cb6bf84eefb5f7@linux-foundation.org>
In-Reply-To: <20240625145252.d78d18a109cb6bf84eefb5f7@linux-foundation.org>
From: Lance Yang <ioworker0@gmail.com>
Date: Wed, 26 Jun 2024 09:26:36 +0800
Message-ID: <CAK1f24nd1x61d+gukjMTRom+wPuanuC=yGBUXaPGe5Z-RK-vLg@mail.gmail.com>
Subject: Re: [linux-next:master 7701/8232] mm/huge_memory.c:2735:31: warning:
 variable 'page' is uninitialized when used here
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 5:52=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 26 Jun 2024 05:39:54 +0800 kernel test robot <lkp@intel.com> wrot=
e:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
> > commit: 4627108658d68fad359600dbe667b88b501cee71 [7701/8232] mm/vmscan:=
 avoid split lazyfree THP during shrink_folio_list()
> > config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/2=
0240626/202406260514.SLhNM9kQ-lkp@intel.com/config)
> > compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 61=
7a15a9eac96088ae5e9134248d8236e34b91b1)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240626/202406260514.SLhNM9kQ-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202406260514.SLhNM9kQ-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> mm/huge_memory.c:2735:31: warning: variable 'page' is uninitialized =
when used here [-Wuninitialized]
> >     2735 |         folio_remove_rmap_pmd(folio, page, vma);
> >          |                                      ^~~~
> >    mm/huge_memory.c:2699:19: note: initialize the variable 'page' to si=
lence this warning
> >     2699 |         struct page *page;
> >          |                          ^
> >          |                           =3D NULL
> >    1 warning generated.
> >
> >
>
> um yes.
> https://lore.kernel.org/all/20240622100057.3352-1-ioworker0@gmail.com/T/#=
u
> removed the initialization.

My bad. I could have done better :(

>
> I'll do this, because I'm about to push a tree out:
>
> --- a/mm/huge_memory.c~hack
> +++ a/mm/huge_memory.c
> @@ -2697,7 +2697,6 @@ static bool __discard_anon_folio_pmd_loc
>         struct mm_struct *mm =3D vma->vm_mm;
>         int ref_count, map_count;
>         pmd_t orig_pmd =3D *pmdp;
> -       struct page *page;
>
>         if (folio_test_dirty(folio) || pmd_dirty(orig_pmd))
>                 return false;
> @@ -2733,7 +2732,7 @@ static bool __discard_anon_folio_pmd_loc
>                 return false;
>         }
>
> -       folio_remove_rmap_pmd(folio, page, vma);
> +       folio_remove_rmap_pmd(folio, pmd_page(orig_pmd), vma);

Thanks a lot for jumping in!
Lance

>         zap_deposited_table(mm, pmdp);
>         add_mm_counter(mm, MM_ANONPAGES, -HPAGE_PMD_NR);
>         if (vma->vm_flags & VM_LOCKED)
> _
>

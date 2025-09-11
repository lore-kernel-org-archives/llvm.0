Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B7914A0BC
	for <llvm@lists.linux.dev>; Thu, 11 Sep 2025 02:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757558146; cv=none; b=gwesu0sdRsWZCC0GfeGmtltE38/egoQ1mi5JOFjqn7kFh9/UHDugZ19Uai1jc3J/VmukZjCdtqCqCcg1fl4xnjY8O9bhH4lwnJgXmEQi3jD1vAM7IF8txQSS3UhsXZ/X1HA0eEUQy1wUR88cTmaxBPqnIwvNhu53frTRTlbSsyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757558146; c=relaxed/simple;
	bh=WSPjJ7rv/Wurgp+6YWtIISAYDxL8zA2TbLbbZ+nc5T8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i1PBAelyiT2olKzgTGtKALXuHfq/cicg8p7p+nQId5N/nfYNrWTkAp2r1AUcD/FfKECVaXVOyoFfm8kbeV/Q5AbiqA8Humxy3zabF+wAkeV5q2nPe7kcMAmqCVVtCIjQpMiu/jclAdydK1f/Y15pePYFmoaTLKuLGWFR7dzFgIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ceo2EEbr; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ceo2EEbr"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-754f16d8feaso1272096d6.0
        for <llvm@lists.linux.dev>; Wed, 10 Sep 2025 19:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757558142; x=1758162942; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vb0qYaqmVSkWJUt9xOeYowmF68E2HlHjMlrygJw5Ps=;
        b=Ceo2EEbr9grAiZkm+2aZEB771mTPxYN4Q2Tf20YhWjO9Dz2QNxVQmXSAc33MZtyNpZ
         ukjCMGJecHSP2h4I4PrRtBLxgYuPl6OBol34krKFnOJ0mllBiwWWzqXTZdNBS3dQJAmq
         iOyCz2T1BpYUBp6zLGmqhsdW6Hpp1PpoEid8X+X/2HA2xfld1eIAo2uDeEDXM02Xdr49
         qCjfHiCpS3O8czZY9MAcJhhVGHgX9jl2FSzLr9y+bY4XJsi3CoxG8abKhB+X5viqlx0Q
         FzN//MeDhsafU+3yqcSik3CvXuMicKWfOJmp9DdUxPSFsRp7+ApX2C3BeyHVLFGLiEDc
         XVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757558142; x=1758162942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vb0qYaqmVSkWJUt9xOeYowmF68E2HlHjMlrygJw5Ps=;
        b=BMy8aw5V+RoKw9oHUOKoBOO5dXMsUDgT0Q7RB2NVtrJebd3A5m6sS0qmURxo2Tn+aK
         cfMYIaRXIiPe613xe2u9kceDJu9KE0TnoZG/WVVM8pqx0vQKkkTazS0h0qZdFSscDPoK
         WFZ3p1VgcVwLmSyo59fSX83/DlCtDaPYjDawREfMZ72hssQqlJHj2+OBtnljZvtTHR9q
         JPx2lXhCycRdRrAtRaAEcC3C3ulwXrY+d70cRWMDt+eEQcEuESojdnvWm5EXIFEG/RCC
         vgT2/t1X3IXre0M2AcBYasr0OcJXGTp9KiDg7ZeosvWLFF58wCz/1x/SfMr30mLE6ySz
         DhBw==
X-Gm-Message-State: AOJu0Yzu5HGazCzIjflbP35ksyFhfc0tFsZYreasK6TXMO0LA68NHTG1
	uGg5jCx0d6NIobV0a1c/7gmI3riouxv6W+UqSseAisOxSDG9+UjjexUbiLFc0m+Y2ffPetkDSVb
	d2c9a5XfyplSe7IaeTbeQXKASRTx9yGU=
X-Gm-Gg: ASbGncs1iKPv9w/GdGyIFwJDLkDuz6f+gKdSwKLv9JYDwFy00ufidAnvICUz+fKd0DR
	xjI8GF0ztZy/uKSaOu1+J2dvGEw7C9j2b9XriXc4q0cnkeKuaDMLCFTDfsD94jKPc9cCc8td6Xm
	An2ZFQNg5XRRHEbHTWY9jCVvAXHUhEYBQRsQg6dMjorfgGASD9O5VlIoxTEGsE4psbOx86sMOf1
	Us0LAYbZ+5vXTaDEY5dvliXL7SojRxjwAWyfC8inRCN8Bn/PAk=
X-Google-Smtp-Source: AGHT+IEQuOALHNasxHg4cvt9OwSYb+br0tjCphBPeNs06MifOpRvuGmCrw3mRabXyOespOL+oB9+DxVIm2bQo1YAM1M=
X-Received: by 2002:ad4:5aad:0:b0:721:ae2c:599f with SMTP id
 6a1803df08f44-739431f1ccdmr178704756d6.46.1757558142442; Wed, 10 Sep 2025
 19:35:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910024447.64788-2-laoar.shao@gmail.com> <202509110109.PSgSHb31-lkp@intel.com>
 <49b70945-7483-4af1-95ba-e128eb9f6d7e@linux.dev> <DF4CA2C0-25AF-462B-A6D2-888DB20E0DFA@nvidia.com>
In-Reply-To: <DF4CA2C0-25AF-462B-A6D2-888DB20E0DFA@nvidia.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 11 Sep 2025 10:35:06 +0800
X-Gm-Features: AS18NWCT1WMJgiNa7kbBl9p5Ko8LuUJHHLo5A82nBykaRI1tVPLVfUPD6miHkHg
Message-ID: <CALOAHbAWwX2Y50J=H8=ahXk0t9fWh=61gd82E7LJd_k5jWg3EA@mail.gmail.com>
Subject: Re: [PATCH v7 mm-new 01/10] mm: thp: remove disabled task from khugepaged_mm_slot
To: Zi Yan <ziy@nvidia.com>, Lance Yang <lance.yang@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org, 
	gutierrez.asier@huawei-partners.com, rientjes@google.com, andrii@kernel.org, 
	david@redhat.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, 
	ameryhung@gmail.com, ryan.roberts@arm.com, lorenzo.stoakes@oracle.com, 
	usamaarif642@gmail.com, willy@infradead.org, corbet@lwn.net, 
	npache@redhat.com, dev.jain@arm.com, 21cnbao@gmail.com, 
	shakeel.butt@linux.dev, ast@kernel.org, daniel@iogearbox.net, 
	hannes@cmpxchg.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 10:28=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 10 Sep 2025, at 22:12, Lance Yang wrote:
>
> > Hi Yafang,
> >
> > On 2025/9/11 01:27, kernel test robot wrote:
> >> Hi Yafang,
> >>
> >> kernel test robot noticed the following build errors:
> >>
> >> [auto build test ERROR on akpm-mm/mm-everything]
> >>
> >> url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/mm-=
thp-remove-disabled-task-from-khugepaged_mm_slot/20250910-144850
> >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm=
-everything
> >> patch link:    https://lore.kernel.org/r/20250910024447.64788-2-laoar.=
shao%40gmail.com
> >> patch subject: [PATCH v7 mm-new 01/10] mm: thp: remove disabled task f=
rom khugepaged_mm_slot
> >> config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20=
250911/202509110109.PSgSHb31-lkp@intel.com/config)
> >> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 8=
7f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> >> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20250911/202509110109.PSgSHb31-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202509110109.PSgSHb31-=
lkp@intel.com/
> >>
> >> All errors (new ones prefixed by >>):
> >>
> >>>> kernel/sys.c:2500:6: error: call to undeclared function 'hugepage_pm=
d_enabled'; ISO C99 and later do not support implicit function declarations=
 [-Wimplicit-function-declaration]
> >>      2500 |             hugepage_pmd_enabled())
> >>           |             ^
> >>>> kernel/sys.c:2501:3: error: call to undeclared function '__khugepage=
d_enter'; ISO C99 and later do not support implicit function declarations [=
-Wimplicit-function-declaration]
> >>      2501 |                 __khugepaged_enter(mm);
> >>           |                 ^
> >>     2 errors generated.
> >
> > Oops, seems like hugepage_pmd_enabled() and __khugepaged_enter() are on=
ly
> > available when CONFIG_TRANSPARENT_HUGEPAGE is enabled ;)
> >
> >>
> >>
> >> vim +/hugepage_pmd_enabled +2500 kernel/sys.c
> >>
> >>    2471
> >>    2472      static int prctl_set_thp_disable(bool thp_disable, unsign=
ed long flags,
> >>    2473                                       unsigned long arg4, unsi=
gned long arg5)
> >>    2474      {
> >>    2475              struct mm_struct *mm =3D current->mm;
> >>    2476
> >>    2477              if (arg4 || arg5)
> >>    2478                      return -EINVAL;
> >>    2479
> >>    2480              /* Flags are only allowed when disabling. */
> >>    2481              if ((!thp_disable && flags) || (flags & ~PR_THP_D=
ISABLE_EXCEPT_ADVISED))
> >>    2482                      return -EINVAL;
> >>    2483              if (mmap_write_lock_killable(current->mm))
> >>    2484                      return -EINTR;
> >>    2485              if (thp_disable) {
> >>    2486                      if (flags & PR_THP_DISABLE_EXCEPT_ADVISED=
) {
> >>    2487                              mm_flags_clear(MMF_DISABLE_THP_CO=
MPLETELY, mm);
> >>    2488                              mm_flags_set(MMF_DISABLE_THP_EXCE=
PT_ADVISED, mm);
> >>    2489                      } else {
> >>    2490                              mm_flags_set(MMF_DISABLE_THP_COMP=
LETELY, mm);
> >>    2491                              mm_flags_clear(MMF_DISABLE_THP_EX=
CEPT_ADVISED, mm);
> >>    2492                      }
> >>    2493              } else {
> >>    2494                      mm_flags_clear(MMF_DISABLE_THP_COMPLETELY=
, mm);
> >>    2495                      mm_flags_clear(MMF_DISABLE_THP_EXCEPT_ADV=
ISED, mm);
> >>    2496              }
> >>    2497
> >>    2498              if (!mm_flags_test(MMF_DISABLE_THP_COMPLETELY, mm=
) &&
> >>    2499                  !mm_flags_test(MMF_VM_HUGEPAGE, mm) &&
> >>> 2500                    hugepage_pmd_enabled())
> >>> 2501                        __khugepaged_enter(mm);
> >>    2502              mmap_write_unlock(current->mm);
> >>    2503              return 0;
> >>    2504      }
> >>    2505
> >
> > So, let's wrap the new logic in an #ifdef CONFIG_TRANSPARENT_HUGEPAGE b=
lock.
> >
> > diff --git a/kernel/sys.c b/kernel/sys.c
> > index a1c1e8007f2d..c8600e017933 100644
> > --- a/kernel/sys.c
> > +++ b/kernel/sys.c
> > @@ -2495,10 +2495,13 @@ static int prctl_set_thp_disable(bool thp_disab=
le, unsigned long flags,
> >                 mm_flags_clear(MMF_DISABLE_THP_EXCEPT_ADVISED, mm);
> >         }
> >
> > +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >         if (!mm_flags_test(MMF_DISABLE_THP_COMPLETELY, mm) &&
> >             !mm_flags_test(MMF_VM_HUGEPAGE, mm) &&
> >             hugepage_pmd_enabled())
> >                 __khugepaged_enter(mm);
> > +#endif
> > +
> >         mmap_write_unlock(current->mm);
> >         return 0;
> >  }
>
> Or in the header file,
>
> #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> ...
> #else
> bool hugepage_pmd_enabled()
> {
>         return false;
> }
>
> int __khugepaged_enter(struct mm_struct *mm)
> {
>         return 0;
> }
> #endif

Thank you, both. I will address this in the next version.

--=20
Regards
Yafang

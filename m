Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70637274B2B
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 03:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774927008; cv=pass; b=reEyc1C/JtBmBjs7HZrBBOdME5zpU0t4qGQP/mC7RCGS5lHe4ZEY6IK2hcfmEZkVjmQe0C7ZM9vbrstX/2GmUh92Ank02nzJtydLp9DUVbj2+5/6ZBq7ffxotwHAKMZweEV5QgziNoYklP2ggfy4RvoGSOkeeJ6b6BaUNADsFt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774927008; c=relaxed/simple;
	bh=OZUfCm20mnU6SRCc5qYIeU7TSznn5TljyuLEeUld9aI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NkMxKdAdU+6VSysBEcHmG3L3W4Sr9uHtHMacJp0M98+bQ47i1yMe/v9ZaCWU/pDy9B46ecAb9OuSWRMiQQvBXwkshrgtlDQu0mNoq4B5hjxOrtI205bDYcZjOj46SrVKz10mg7W5IHm2DR/5LRdISVXIkr1BsqgqMMZjjK/XcAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3mo8O8E; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3mo8O8E"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-829781b2b01so2610703b3a.2
        for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 20:16:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774927006; cv=none;
        d=google.com; s=arc-20240605;
        b=c4ggd3Iy6jYIjsFWokioukVLqxsqvf9FcPMg+tTe2vX52pQtpoc+YoA4qF7u+J/p+H
         rNGzcN5sS0bob4MgqOvgzBW0ArZjzi4gQ4u8MFcMQk/qF1O4RZpzsWskRjEmYD5dmM+B
         UIrjsY0e0sCum9tEV0imOL6P5H7JYoyERlr90gmSfJBEyfMeNUeC8o9rO0QtsGXePz4c
         i4m0PirbfUI13YEAvHdR35v/4iUOuuP/WFntX0ez++QDjI8WahdRNjl01hCTx4upAmem
         qMvoh5la1dltpmkF4Az0FgfFUAWZGrhH6qlNxXdq/D0nCBPKRYToNL/i6kFv/JsgKCsr
         GFRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jjkCSJGTx0kYz2G9Pyleds319xKwqsILqbgvz8ReooQ=;
        fh=IKFic9F8J/hIHiUTpBzVkNOxEUPxzgeSg/kjGGQtQGA=;
        b=eNnYyQiUrJVExzL75ObT8dqS2EALWtrubcWO32Hh47KYwcmiB+svDRw8/nupub3Qfh
         HgNu1NCvblpWFQO2v/HLoZ0Fi0M2nx7nfwMTmXK2g41bA3fBkxPio7IHKQwrTx154oT3
         CZPWJNkvx6Zg5M4pI5HIwCXJNSRd4lD+0u87DYw17YsrY1uDw+JBwzz4846FCHTaM2G6
         kPgk5FF5o2+Wd8RVqlEhfYtB3Uo74SEyOuwngv3aIDKCHQzv93X1p6xSRMdE0iSjgIgi
         bYho2CxPJNMHIdUR8aQxA+3T5gKLb9zZ1pwsVhwM8JQC8Z+eQGcW8Un+O8KpbdXdiCy1
         8flA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774927006; x=1775531806; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjkCSJGTx0kYz2G9Pyleds319xKwqsILqbgvz8ReooQ=;
        b=S3mo8O8EFdZjmR9/imIPVn+IQD2sOcR/JaX1EzORzZdqcbEywALi0BZwBUZc4A/XAu
         QY/iU+GgmPkqtJsyZ1tj2PmRO35X8Fjzt80vLJcWuQzCfl6jVg2xn2/CfJDXbfQgfTPu
         ZeDy/iQFjwyzIDBjKZ7V4lTAsmdW5vNLgBHyoc469pddln6mydShDL/DbQBOJc0kui3w
         PgmjFynnklV60H66bbyy2LJ7eAZ/4op+U6fsiAv0g2/oYxqCAtPsdtxlANq8y84Eir06
         Uep34OKDWOmv7PoXF4BtzwyP4ZeZ1UeIUu8rf2GifwYFv+5PX0Ti3YesTAb8BAtJsmCK
         banQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774927006; x=1775531806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jjkCSJGTx0kYz2G9Pyleds319xKwqsILqbgvz8ReooQ=;
        b=nDhk75dlEsZVhsqMRRZjaWRkVY+UgZFEuY/r82TF76f9bPb5FFZCUJmb0QliIJT7P0
         YFV9qLap9n7dNjox/1h0UvfrwFWt06a1Iyvk4cjdFcBtpQzhN0+vs6i4tIE49qY/z6EZ
         /+YpFV2hDIeE20F01LXi8H7WUt2YfZ3a0B1EoKmS1toDMZBAyu0M9u4N+JjjGISku2Lm
         LEL0WygbN4wfUO5RZFSgIOndt12PCJ2XVmMctiu2F3OhgN5ym9Oyc3OISMAwiMe7jAze
         4JkhT2/S1x/KTuzgTJJnAWh6z+py+Sb0Op6AEaWGK5Qk5uqQONQGfc4xWO2azAQBpKhz
         34Hg==
X-Forwarded-Encrypted: i=1; AJvYcCU8iuvjvBIQ9JGCWmEB3KiHVP2XCUZa5rJpsv7i5K9eHotWYWggzl+UxEketp+ajRpxAaMu@lists.linux.dev
X-Gm-Message-State: AOJu0YzsxMJbpiEJg7SWMJCH4q7j9UHXkqMsaXn1YID03tPMXc6XzbBv
	P8cYhFR1rrzxxK8kQt2LOjeeMrUSSqb6VXDKiIWqHhfAT/lzJiK01W5vSllTGFfVdoBA7pwVp+X
	3QhKTXQwDLacRjsWq64KYhe19d134+Tk=
X-Gm-Gg: ATEYQzycDt+I4RkO6f5GpitczBw1CkAKBk1LxCAewPhpsYOJgA+PAnofYUiTjpAn/9P
	OC/qJ27Lx/RiHzpc6+dVs208wMc97tx9PTKAVSZkm4MqEhiwajzoW9U/ufYPZCgBIhWiuG/Ig4b
	BwHcbRbwADinI9jNPESh96LV19qbSFeWlR29KU3lb9EbOuX/Z7jXH0aXnRVKdZ13k7ombn0Rowv
	XR6pis0g3C87Cqao5TbRBT8r6F/m7CvaqGu/ZPxQJxkc+wctdoi7yGz6Ne5PWHgBKZSYJ/hdYW4
	xbvHSSj+ur1G9fWG
X-Received: by 2002:a05:6a00:3699:b0:82a:6167:b1ae with SMTP id
 d2e1a72fcca58-82c95d465c0mr13377941b3a.24.1774927005577; Mon, 30 Mar 2026
 20:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260201063532.44807-1-pilgrimtao@gmail.com> <20260201063532.44807-3-pilgrimtao@gmail.com>
In-Reply-To: <20260201063532.44807-3-pilgrimtao@gmail.com>
From: Chengkaitao <pilgrimtao@gmail.com>
Date: Tue, 31 Mar 2026 11:16:33 +0800
X-Gm-Features: AQROBzBAxGIDAH3ts6Ui9lBm3gfklFisQpwjANMscsN6aLMHkfss2YVM3lRECS8
Message-ID: <CAAWJmAaOL_NUtJZfHguSdPUsNVCSU0U=GWnTeVAKhnGgwSKeEg@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] mm: Convert vmemmap_p?d_populate() to static functions
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org, "David Hildenbrand (Red Hat)" <david@kernel.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew Morton=EF=BC=8C

I noticed this patch was dropped; the failure report is here:
https://lore.kernel.org/all/202603251338.grra8xt7-lkp@intel.com/#R

Could this be a false positive? The series has two patches: the first
one already removed references to vmemmap_p?d_populate() on sparc; see:
https://lore.kernel.org/all/20260201063532.44807-3-pilgrimtao@gmail.com/T/#=
mefaa36aeff173d08f0508cd44be46e830c067fe9

Might the build error be because only the second patch was applied,
without the first?

On Sun, Feb 1, 2026 at 2:35=E2=80=AFPM chengkaitao <pilgrimtao@gmail.com> w=
rote:
>
> From: Chengkaitao <chengkaitao@kylinos.cn>
>
> Since the vmemmap_p?d_populate functions are unused outside the mm
> subsystem, we can remove their external declarations and convert
> them to static functions.
>
> Signed-off-by: Chengkaitao <chengkaitao@kylinos.cn>
> ---
>  include/linux/mm.h  |  7 -------
>  mm/sparse-vmemmap.c | 10 +++++-----
>  2 files changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index f0d5be9dc736..10a0664b4ce2 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4238,13 +4238,6 @@ unsigned long section_map_size(void);
>  struct page * __populate_section_memmap(unsigned long pfn,
>                 unsigned long nr_pages, int nid, struct vmem_altmap *altm=
ap,
>                 struct dev_pagemap *pgmap);
> -pgd_t *vmemmap_pgd_populate(unsigned long addr, int node);
> -p4d_t *vmemmap_p4d_populate(pgd_t *pgd, unsigned long addr, int node);
> -pud_t *vmemmap_pud_populate(p4d_t *p4d, unsigned long addr, int node);
> -pmd_t *vmemmap_pmd_populate(pud_t *pud, unsigned long addr, int node);
> -pte_t *vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
> -                           struct vmem_altmap *altmap, unsigned long ptp=
fn,
> -                           unsigned long flags);
>  void *vmemmap_alloc_block(unsigned long size, int node);
>  struct vmem_altmap;
>  void *vmemmap_alloc_block_buf(unsigned long size, int node,
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index 37522d6cb398..67f9a08c2376 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -151,7 +151,7 @@ void __meminit vmemmap_verify(pte_t *pte, int node,
>                         start, end - 1);
>  }
>
> -pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, i=
nt node,
> +static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long =
addr, int node,
>                                        struct vmem_altmap *altmap,
>                                        unsigned long ptpfn, unsigned long=
 flags)
>  {
> @@ -195,7 +195,7 @@ static void * __meminit vmemmap_alloc_block_zero(unsi=
gned long size, int node)
>         return p;
>  }
>
> -pmd_t * __meminit vmemmap_pmd_populate(pud_t *pud, unsigned long addr, i=
nt node)
> +static pmd_t * __meminit vmemmap_pmd_populate(pud_t *pud, unsigned long =
addr, int node)
>  {
>         pmd_t *pmd =3D pmd_offset(pud, addr);
>         if (pmd_none(*pmd)) {
> @@ -208,7 +208,7 @@ pmd_t * __meminit vmemmap_pmd_populate(pud_t *pud, un=
signed long addr, int node)
>         return pmd;
>  }
>
> -pud_t * __meminit vmemmap_pud_populate(p4d_t *p4d, unsigned long addr, i=
nt node)
> +static pud_t * __meminit vmemmap_pud_populate(p4d_t *p4d, unsigned long =
addr, int node)
>  {
>         pud_t *pud =3D pud_offset(p4d, addr);
>         if (pud_none(*pud)) {
> @@ -221,7 +221,7 @@ pud_t * __meminit vmemmap_pud_populate(p4d_t *p4d, un=
signed long addr, int node)
>         return pud;
>  }
>
> -p4d_t * __meminit vmemmap_p4d_populate(pgd_t *pgd, unsigned long addr, i=
nt node)
> +static p4d_t * __meminit vmemmap_p4d_populate(pgd_t *pgd, unsigned long =
addr, int node)
>  {
>         p4d_t *p4d =3D p4d_offset(pgd, addr);
>         if (p4d_none(*p4d)) {
> @@ -234,7 +234,7 @@ p4d_t * __meminit vmemmap_p4d_populate(pgd_t *pgd, un=
signed long addr, int node)
>         return p4d;
>  }
>
> -pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
> +static pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int no=
de)
>  {
>         pgd_t *pgd =3D pgd_offset_k(addr);
>         if (pgd_none(*pgd)) {
> --
> 2.50.1 (Apple Git-155)
>

--=20
Yours,
Chengkaitao

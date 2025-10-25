Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E62302CCD
	for <llvm@lists.linux.dev>; Sat, 25 Oct 2025 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761406843; cv=none; b=CRlVFPVR/kCGFoNw0ae71z39piMZfTbmWepAnULR9A1jLZQthpMNZFGpTrf+OOZwjBfzBEaHHhxqH6T85y6khLlO1Qn90SgEwbSs+iH+LUE36f0M0wjNqbFBDQ6iVEO4iBmpazD4CKQKyeFGe4//KL/TorAEyTkgZ8LOMu+TYLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761406843; c=relaxed/simple;
	bh=0HY16VFXZq4Fs4AqSUpKJwWPQq433JoGDwf5zAVL/Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pEEc5MwNq3uDrDLdD6mvwVjld0tKJ1VCq6aqBrIMg7nRnThTXx0J75C4IkHd4dZnYVO3LlKlcNlvZBq63G6BIKngwkGRwZxMovcFP6sx76/gcc49GbTN4MH64l+Eky8nP7lR9Q0ntt8CtETEiEqdYtj1fgmj3p64K1fMSKgVr/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Er46V1n6; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Er46V1n6"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63c0c9a408aso5056484a12.3
        for <llvm@lists.linux.dev>; Sat, 25 Oct 2025 08:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1761406841; x=1762011641; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HY16VFXZq4Fs4AqSUpKJwWPQq433JoGDwf5zAVL/Es=;
        b=Er46V1n6Fw6/BPk9iMgnmBgWni2LuJKZB2sAPWxSTGpy86AZ1P1+iLSbSP9CDq4i3O
         4YiHrUj4/+P1ZceZA8X0Wd4TF2PZ/cBT4myv2/ZjLaUVEs6G9mVjdua3KZML+k8v7UTw
         ck+XQQ4VOlX5t8C2Xhere1g2ZL2IfATPRj9k0VlKmdj2gHSHpJcmTxrJj9dUNADzsqxM
         /OneHyvqQKx7uWMTAdLdXVxC89WMfhhuiBhR5i61dUT2+0uPq8D5cDU9jjPD1V6nRP6s
         x+YSYAnWWmUOwsESA8prd3L/kPqVzNP7bZek0gVAgZ+scO/y6aZRH/3+Pu5cvOi20Q8/
         1v0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761406841; x=1762011641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HY16VFXZq4Fs4AqSUpKJwWPQq433JoGDwf5zAVL/Es=;
        b=TUCVBq6nuNowMxakj6KD6h9izbQf5le9OGihe9lTIxlsyOHXRSZZxcUOjBIIUr/DkA
         kZxfSOs0lc34NJRGFAOq+OtGfKdbc3ww7TJNjX1hAB4fZQwhdmXufbX5leGU2hwvVpY5
         ADP3cASu/OQqkT6DO5BYA4okKx5pXSd2MWaiu9wu7ud7aDYwHjqqU2Pxmhwj45fWGbbU
         c+kSV01B7aPLrjaUMp0s3J+GPZh2rNp7tbEEyZuqllfOdksiUgdUKy8FkD+Zqe5qS2ty
         5Auo8SbS2pLu9vECd+SAMfFeee+LElUIZG1RRSfgc5CjxlWdlNQzi17GcveFN19vLrvN
         yZNw==
X-Forwarded-Encrypted: i=1; AJvYcCWq+KT6U040a9JWTTnDWu+mwCuEg8IoxgxoYgV/l3ZrD0EqdA8VyfNg3a0I54rXOsCy8MPF@lists.linux.dev
X-Gm-Message-State: AOJu0YzvuBUKPS7RAobxV/WEvVH5lPhbY0dEJlL2FL4CU4Cjynplq1bx
	d3p+09glfxQ0S43Lf9rx/x/tX2NaA1LQ0WsbIouMRzTP8L3waNo4VtgCluxrGCTmirzKWZKsrUM
	Z6hiTlhu65x+IIasAhJKPk9xt0O9FIdy3i6+ypNtiBA==
X-Gm-Gg: ASbGncuqW/ktf5CBJISKgnbBuAipk+wJ6WXH2DK/wOgKbVTTQ8q9Rvkvm6g8LZ19fUn
	rPvNRnmgt0lXNMchgneQIHgShR5OXyIjUVVNbikay5t7ocI3xi1MSYSMoHXZpcLuB8XjthpUrJY
	Elab24ao36V052ubxtCLqVdiWLIEOSYklyGW2j4I6NkZLXySezWAfnefkIpxQlNE+TDc1/m6/yQ
	O8zWIS2vfTGGt/h3KYvUSJXzCZ5gkGFYKUXRnSliaSrOLWenBd1430yZ4VZa52o69kFctQD355x
	rk6BneG3ztVuLSgjBQ==
X-Google-Smtp-Source: AGHT+IHusR3pR0UReEeTXHeTWS5omMas6c+gaYiIEsLmjRg06Miw4AMQcuQX3fi9PVgOyyAmpc1NpRtLuc0jLuFpHKE=
X-Received: by 2002:a05:6402:4504:b0:63c:103b:e1cf with SMTP id
 4fb4d7f45d1cf-63c1f584283mr30192670a12.0.1761406840700; Sat, 25 Oct 2025
 08:40:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com> <6-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
In-Reply-To: <6-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 25 Oct 2025 11:40:04 -0400
X-Gm-Features: AWmQ_bmCjfexrZLPPfdt56XAonJ2DbSa1CpJkmBpIfIxbAsyN_ouXa6sCMuBecc
Message-ID: <CA+CK2bDZ1RX9o80x2+HTshix0zxLcruzDfW--NMS8CjWo1PfUg@mail.gmail.com>
Subject: Re: [PATCH v7 06/15] iommupt: Add unmap_pages op
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Will Deacon <will@kernel.org>, 
	Alexey Kardashevskiy <aik@amd.com>, Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, 
	James Gowans <jgowans@amazon.com>, Kevin Tian <kevin.tian@intel.com>, 
	Michael Roth <michael.roth@amd.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 2:20=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> unmap_pages removes mappings and any fully contained interior tables from
> the given range. This follows the now-standard iommu_domain API definitio=
n
> where it does not split up larger page sizes into smaller. The caller mus=
t
> perform unmap only on ranges created by map or it must have somehow
> otherwise determined safe cut points (eg iommufd/vfio use iova_to_phys to
> scan for them)
>
> A future work will provide 'cut' which explicitly does the page size spli=
t
> if the HW can support it.

Are there plans to add "free" when a table becomes empty on an unmap?
Not sure what would be an efficient implementation for that, maybe a
refcnt for # entries in table?

> unmap is implemented with a recursive descent of the tree. If the caller
> provides a VA range that spans an entire table item then the table memory
> can be freed as well.
>
> If an entire table item can be freed then this version will also check th=
e
> leaf-only level of the tree to ensure that all entries are present to
> generate -EINVAL. Many of the existing drivers don't do this extra check.
>
> This version sits under the iommu_domain_ops as unmap_pages() but does no=
t
> require the external page size calculation. The implementation is actuall=
y
> unmap_range() and can do arbitrary ranges, internally handling all the
> validation and supporting any arrangment of page sizes. A future series
> can optimize __iommu_unmap() to take advantage of this.
>
> Freed page table memory is batched up in the gather and will be freed in
> the driver's iotlb_sync() callback after the IOTLB flush completes.
>
> Tested-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316AC303A33
	for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 21:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760132589; cv=none; b=WkRpGYsRr4gfXxM7IXe0MDg0fn9nrg+1l+e4pIk65FPaTgd6IFrJSecoirddylJRZTuZXUb0H9BfNm2v3o/0esYKB7UavGe3vf88xUrrQyDrhD9S+leZYqUsXQqYUStCYGzq13VV2ub+6nBPqW1QOIq9q+7liV0KUWu1tFuRLhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760132589; c=relaxed/simple;
	bh=fwjcVIiQrqDfhLwRQIz7WRB+b/8kgGHlcJpHFwbz7Bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f9PQD6YN2WpXU+gSXvqQBwq4eUYl7vOLa5vFEn6uYkyWDBznL9WzCqL/fOPwypNFtlDg2Oc37lct4aXkBM1jiyORSqNavHTX+uVBdFS6m2+bU4UGVJnlE4mDsh7MPiN+kjnmv7GFX7Q0SZFKbaWi1Vu3OFdHAiuhqv/h6n/ZS3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jSBcHQoN; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jSBcHQoN"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-42f8e736ecaso175495ab.0
        for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 14:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760132585; x=1760737385; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTEdXIM9TCGjTEQmnu4q5KwtmIgjop26pFrSD5vSjaM=;
        b=jSBcHQoN08Q8eOP+ETGGtiKFVbzIRWpPhPlZJ6/anKBCnxUq0X7q51n3iAAjrYc2on
         YiiRfvLsRGT4sKuc8aCGfoz48pY6MrYgFDSdmAumv7zT3ZZPZjX5J+TokbdUx9RtucXL
         ZgcKZzORIVbI6DfiZda3Wxss4+k0F0/sgqAXDOgaSURC3aWdl+CZoeABfsDzfGWE7AjK
         UCDMU+5RrQsD+WhS30fRHR3RER5qZ/XFkFQC8IdWGnc5Kw5HwvcMNiQCx5w25YXfp0X2
         LFVlgNdcrOYGtNwQFoYcC+a9rfapLt7B5JC+79BdIKvOLIDSWYdE/0JGNmQ2yczSpU5b
         xSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760132585; x=1760737385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTEdXIM9TCGjTEQmnu4q5KwtmIgjop26pFrSD5vSjaM=;
        b=dcjMHCpaA13Ulu5ENvfCdPbOs9Q+NtL0KZ8p1/GZxgnb0DQBGAuuqxvHPb5ThiNysI
         AgN2Mi2NXO9XLJFU3tQVQp8AJPzGwmmPRxukL5YWDsM0jWDFFdW2jO0CpsxmTizocrmT
         QZJw2VTCsi8D1Ef3brZH0twE+X2veoTzM8NaURmMIqIVO8diBKkL4UDXGiGQpIPs2BKf
         K+xayzzWSxCnA+CxnyPUji8FkPOGI5VS5nOAB3HWJDIA+7LQxRTz773vqpmRRplaFL01
         182+3YdDtUt3EztljK/x/DjKbaZDVTu6b7IQ/POLYWXT2dfl2/SCpvpP5jjYD9ECKNxc
         ghFA==
X-Forwarded-Encrypted: i=1; AJvYcCV42TtF+/P3RfM12TcN2kAtHznrXq7+qhXt+Cd49tWrwjc3xs77hFLMsNpJZiLx1avZ+1Dw@lists.linux.dev
X-Gm-Message-State: AOJu0YwqeJrKZpuGsIcTujV973FFts+w11068rgOOA+NyY1UpHSC7x1A
	vrKpM7j+4+vXxa1brV/sX47pE3TPRuditVDuXlOQ6IkYeicAZJtufzYIF3hofE/EhQz7Yr6OU5B
	YLA61ddyEemgGNlzES0vUTGg8An+zbVPyFPz5U2cJ
X-Gm-Gg: ASbGncsFLkfWAnpxERxU7fuPEpDFN6X6A/DYy9zTleSbBMsQ8aIjvh5jIoilmarIGoG
	b3vAD9dT1qV3DKxGnvuE06PpYKqnjBt46LlHRrp34txhvqx3Un6yRh3nweUCcG6vgXqkOYWATzV
	3cyrHbiUep8jd/PDzk6xjKM1s4lknuTubG2of0+6JIRB/xczm+91Z28T1lBK4jDhrT2ACkRXn1/
	gfm35TLNHNcDR+b45kU1CUbgtvafb+9HK+LmVXJBQ==
X-Google-Smtp-Source: AGHT+IFYO/m3ZokqgLgfZFSBuJ8vQyfm/3HMocIoflB016BCepHu8r9v6klK4bxjJEyMNFam7jZJfb7DI/PhTm+ebno=
X-Received: by 2002:a05:622a:348:b0:4b7:a274:d54b with SMTP id
 d75a77b69052e-4e6eac0ca05mr25279901cf.12.1760132584434; Fri, 10 Oct 2025
 14:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251010011951.2136980-2-surenb@google.com> <202510110501.92Srmvgx-lkp@intel.com>
In-Reply-To: <202510110501.92Srmvgx-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 10 Oct 2025 14:42:53 -0700
X-Gm-Features: AS18NWCwzOb_Fs69JrpmWw3AQRynK9NMKzj3B1QDKKaakj7u0qI0Eoy3eq_sHTw
Message-ID: <CAJuCfpEa2rdLuu81SJ807M1vuGd1eY4GMO2CrrfU8gY=VRtPcA@mail.gmail.com>
Subject: Re: [PATCH 1/8] mm: implement cleancache
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, david@redhat.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, alexandru.elisei@arm.com, 
	peterx@redhat.com, sj@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	corbet@lwn.net, axboe@kernel.dk, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	hch@infradead.org, jack@suse.cz, willy@infradead.org, 
	m.szyprowski@samsung.com, robin.murphy@arm.com, hannes@cmpxchg.org, 
	zhengqi.arch@bytedance.com, shakeel.butt@linux.dev, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, minchan@kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 2:18=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Suren,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 70478cb9da6fc4e7b987219173ba1681d5f7dd3d]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan=
/mm-implement-cleancache/20251010-134501
> base:   70478cb9da6fc4e7b987219173ba1681d5f7dd3d
> patch link:    https://lore.kernel.org/r/20251010011951.2136980-2-surenb%=
40google.com
> patch subject: [PATCH 1/8] mm: implement cleancache
> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/2=
0251011/202510110501.92Srmvgx-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd70=
8029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251011/202510110501.92Srmvgx-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510110501.92Srmvgx-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> mm/cleancache.c:119:13: error: casting from randomized structure point=
er type 'struct address_space *' to 'struct cleancache_inode *'
>      119 |         *ccinode =3D (struct cleancache_inode *)folio->mapping=
;
>          |                    ^
>    1 error generated.

Matthew's suggestion to use unions for members with multiple uses will
remove the need for typecasting and should solve this issue.

>
>
> vim +119 mm/cleancache.c
>
>    113
>    114  static void folio_attachment(struct folio *folio, struct cleancac=
he_inode **ccinode,
>    115                               unsigned long *offset)
>    116  {
>    117          lockdep_assert_held(&(folio_pool(folio)->lock));
>    118
>  > 119          *ccinode =3D (struct cleancache_inode *)folio->mapping;
>    120          *offset =3D folio->index;
>    121  }
>    122
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

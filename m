Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1876763A
	for <llvm@lists.linux.dev>; Fri,  3 Nov 2023 00:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=shelob.surriel.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from imladris.home.surriel.com ([10.0.13.28] helo=imladris.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <riel@shelob.surriel.com>)
	id 1qyiUR-0006V8-14;
	Thu, 02 Nov 2023 20:56:47 -0400
Message-ID: <32cb089b2afec5dc3bb96234753cca4b22cb9ccd.camel@surriel.com>
Subject: Re: [PATCH] mm/hugetlb: fix null ptr defer in hugetlb_vma_lock_write
From: Rik van Riel <riel@surriel.com>
To: Edward Adam Davis <eadavis@qq.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,  llvm@lists.linux.dev, mike.kravetz@oracle.com,
 muchun.song@linux.dev,  nathan@kernel.org, ndesaulniers@google.com, 
 syzbot+6ada951e7c0f7bc8a71e@syzkaller.appspotmail.com, 
 syzkaller-bugs@googlegroups.com, trix@redhat.com
Date: Thu, 02 Nov 2023 20:56:47 -0400
In-Reply-To: <tencent_164A247533766D667C3D873798968236C409@qq.com>
References: <3382634358afa9b95dc4f6db8a53a136d4b9e9cb.camel@surriel.com>
	 <tencent_164A247533766D667C3D873798968236C409@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Sender: riel@surriel.com

On Thu, 2023-11-02 at 20:58 +0800, Edward Adam Davis wrote:
>=20
> +++ b/include/linux/hugetlb.h
>=20
> +#define HPAGE_RESV_OWNER=C2=A0=C2=A0=C2=A0 (1UL << 0)
> =C2=A0static inline bool __vma_private_lock(struct vm_area_struct *vma)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return (!(vma->vm_flags & VM_M=
AYSHARE)) && vma-
> >vm_private_data;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return (!(vma->vm_flags & VM_M=
AYSHARE)) && vma-
> >vm_private_data &&=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0is_vma_resv_set(vma, HPAGE_RESV_OWNER);
> =C2=A0}
> =C2=A0
> =C2=A0/*
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 1301ba7b2c9a..97ea782dfba6 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1033,7 +1033,6 @@ __weak unsigned long vma_mmu_pagesize(struct
> vm_area_struct *vma)
> =C2=A0 * bits of the reservation map pointer, which are always clear due
> to
> =C2=A0 * alignment.
> =C2=A0 */
> -#define HPAGE_RESV_OWNER=C2=A0=C2=A0=C2=A0 (1UL << 0)
> =C2=A0#define HPAGE_RESV_UNMAPPED (1UL << 1)
> =C2=A0#define HPAGE_RESV_MASK (HPAGE_RESV_OWNER | HPAGE_RESV_UNMAPPED)
> =C2=A0

Moving just that one define is less than ideal, and the
kernel test robot seems unhappy, too.

It may be cleaner to just move __vma_private_lock into
hugetlb.c, where it has all the dependencies it needs.

It isn't being called from anywhere else, anyway.

Hopefully that will keep the kernel test robot happy, too :)

--=20
All Rights Reversed.

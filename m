Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E17101EC
	for <llvm@lists.linux.dev>; Wed,  1 Nov 2023 14:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=shelob.surriel.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from imladris.home.surriel.com ([10.0.13.28] helo=imladris.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <riel@shelob.surriel.com>)
	id 1qyCCL-00084w-04;
	Wed, 01 Nov 2023 10:27:57 -0400
Message-ID: <3382634358afa9b95dc4f6db8a53a136d4b9e9cb.camel@surriel.com>
Subject: Re: [PATCH] mm/hugetlb: fix null ptr defer in hugetlb_vma_lock_write
From: Rik van Riel <riel@surriel.com>
To: Edward Adam Davis <eadavis@qq.com>, 
	syzbot+6ada951e7c0f7bc8a71e@syzkaller.appspotmail.com
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,  llvm@lists.linux.dev, mike.kravetz@oracle.com,
 muchun.song@linux.dev,  nathan@kernel.org, ndesaulniers@google.com,
 syzkaller-bugs@googlegroups.com,  trix@redhat.com
Date: Wed, 01 Nov 2023 10:27:56 -0400
In-Reply-To: <tencent_2A675773C6D47370E36A4966A3BA2444F705@qq.com>
References: <00000000000078d1e00608d7878b@google.com>
	 <tencent_2A675773C6D47370E36A4966A3BA2444F705@qq.com>
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

On Wed, 2023-11-01 at 14:36 +0800, Edward Adam Davis wrote:
> When obtaining resv_map from vma, it is necessary to simultaneously
> determine
> the flag HPAGE_RESV_OWNER of vm_private_data.
> Only when they are met simultaneously, resv_map is valid.
>=20
> Reported-and-tested-by:
> syzbot+6ada951e7c0f7bc8a71e@syzkaller.appspotmail.com
> Fixes: bf4916922c60 ("hugetlbfs: extend hugetlb_vma_lock to private
> VMAs")
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
> =C2=A0include/linux/hugetlb.h | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 47d25a5e1933..1a3ec1aee1a3 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -1265,9 +1265,11 @@ static inline bool __vma_shareable_lock(struct
> vm_area_struct *vma)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return (vma->vm_flags & V=
M_MAYSHARE) && vma->vm_private_data;
> =C2=A0}
> =C2=A0
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
=C2=A0=C2=A0=C2=A0((unsigned long)vma->vm_private_data &
> HPAGE_RESV_OWNER);
> =C2=A0}

This could be cleaned up a bit by moving the HPAGE_RESV_OWNER
definition (and its friends) into hugetlb.h, as well as the
is_vma_resv_set() helper function.

Then __vma_private_lock() can just call is_vma_resv_set(),
and open coding a duplicate of the same code.

Not having duplicates of the code will make it much harder
to "miss a spot" with future changes.

I am still struggling to find a place where we might leave
HPAGE_RESV_OWNER behind on a pointer that is otherwise NULL,
but if your tests show this fixes the issue, I'm all for it :)

--=20
All Rights Reversed.

Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCE01FD8
	for <llvm@lists.linux.dev>; Tue, 14 Nov 2023 02:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=shelob.surriel.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from imladris.home.surriel.com ([10.0.13.28] helo=imladris.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <riel@shelob.surriel.com>)
	id 1r2iqM-0007BR-2R;
	Mon, 13 Nov 2023 21:07:58 -0500
Message-ID: <74c9d165c2e09f962467364319c2a2a4e05583a7.camel@surriel.com>
Subject: Re: [PATCH] hugetlb: fix null-ptr-deref in hugetlb_vma_lock_write
From: Rik van Riel <riel@surriel.com>
To: Mike Kravetz <mike.kravetz@oracle.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: eadavis@qq.com, nh26223@qq.com, 
	syzbot+6ada951e7c0f7bc8a71e@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, nathan@kernel.org, 
	ndesaulniers@google.com, muchun.song@linux.dev, akpm@linux-foundation.org
Date: Mon, 13 Nov 2023 21:07:58 -0500
In-Reply-To: <20231114012033.259600-1-mike.kravetz@oracle.com>
References: <20231114012033.259600-1-mike.kravetz@oracle.com>
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

On Mon, 2023-11-13 at 17:20 -0800, Mike Kravetz wrote:
>=20
> Mask off low bit flags before checking for NULL pointer.=C2=A0 In
> addition,
> the reserve map only 'belongs' to the OWNER (parent in parent/child
> relationships) so also check for the OWNER flag.
>=20
> Reported-by: syzbot+6ada951e7c0f7bc8a71e@syzkaller.appspotmail.com
> Closes:
> https://lore.kernel.org/linux-mm/00000000000078d1e00608d7878b@google.com/
> Fixes: bf4916922c60 ("hugetlbfs: extend hugetlb_vma_lock to private
> VMAs")
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
>=20

Reviewed-by: Rik van Riel <riel@surriel.com>

--=20
All Rights Reversed.

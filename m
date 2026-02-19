Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A4B1E0B86
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 07:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771484783; cv=none; b=M/cTWe4m1Nu+OdYKI/yu5hWHsaEksslR/mNgNUh20n23iMnzxoT2k6GvLYat3PpQ0yeXS0sHjAZlbUufpyX0+Rp18nm1lU4oBK3+qvHxfsEX0Bk3IZnmL+Fzx0SiSo9N5Rsk5OK9FGSrjy1GgcP6SZ0xNdPwo4Q0PkYtppaGTaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771484783; c=relaxed/simple;
	bh=ZdFSLJvL4NcVHf+sUxnxeOrGUy4j4aIn1TnvUv6XzIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rQRuFiL+cjlLe7DHam7j45vYAHYc4coxIArl+FSmWNx6xNJm2+XermiAdrSKhjtptl3to+eeNWOeNOrQ6N+yw9tA8Yn8c0W33JeOD+TRNwbLbgOZ7xnp0/bmvMsx30Od8+vIR8dJTkuZPPyKRBMvOZfTT0CIcOoeavBA98f2J+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRCkoCF2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRCkoCF2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A142C4AF09
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 07:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771484782;
	bh=ZdFSLJvL4NcVHf+sUxnxeOrGUy4j4aIn1TnvUv6XzIM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sRCkoCF2cVyRR/wHVVO+OTEYKfSJ0ryR6aAp7qpJz+kBdKYuNn/7LTKyMuYWVICkJ
	 YlI2lJbi7N5vBcUAoZAfGh7mQLGL5yotmE3Xs8mPqxcXk20JeACbEj5qSkBDdaiK9u
	 yufJxsqBOJK7uTMyWnALPSIb3xoMQAjjqhHFbZmnI+/egGUGzz3VDxlOqYdFzK3j1E
	 yIeV3FMu5kPSNXDpTe8VqZGQKk81m26Vcf2ipTsmF+ESVgSw1Qrx+bX/O+65LzRPvQ
	 b1jBL1Vf3kTX10GCEfMkiox7lodiRzxJMGnPEnmUa4OSoACFVCGIoG0b144I3zwYSf
	 PexzjNeIaZH+g==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-790992528f6so5700007b3.1
        for <llvm@lists.linux.dev>; Wed, 18 Feb 2026 23:06:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVqNQgq1c/acTDKCs/Oysif+8HocyEiq+TjwGnN5wTiy6XJH/o2cWnS3N69jZjdc/gUijf@lists.linux.dev
X-Gm-Message-State: AOJu0Yy76UNF5iAuLFdLI363NOpsH0nkjCo4NXeZQDdL/mbGiGxh3bfZ
	VkxM60RhWqVTV/2VL4MXQxPmtQndhGFiV2S3JekTRPfC6BjjZIYaOeGoqB5UFqhsIMVDLmPap59
	0VeGfVwGCtnvb27YmWLZfm/toCd0B9QD5avNUw5Ts3g==
X-Received: by 2002:a53:b177:0:b0:649:58b6:ea81 with SMTP id
 956f58d0204a3-64c556c964fmr2478396d50.73.1771484781785; Wed, 18 Feb 2026
 23:06:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260218-swap-table-p3-v3-9-f4e34be021a7@tencent.com>
 <202602181835.58TEynxc-lkp@intel.com> <aZWuLZi-vYi3vAWe@KASONG-MC4>
In-Reply-To: <aZWuLZi-vYi3vAWe@KASONG-MC4>
From: Chris Li <chrisl@kernel.org>
Date: Wed, 18 Feb 2026 23:06:11 -0800
X-Gmail-Original-Message-ID: <CACePvbVZH45zO0T716ru=voZVSoJbor0TYdqiT=LPmUc7rpCLg@mail.gmail.com>
X-Gm-Features: AZwV_QiSFOXwJ3UV6YDn1vcgaPkFq9WmxMcNj-RL3MGWvhZKm_Rc1O0W9z_CMU8
Message-ID: <CACePvbVZH45zO0T716ru=voZVSoJbor0TYdqiT=LPmUc7rpCLg@mail.gmail.com>
Subject: Re: [PATCH v3 09/12] mm, swap: use the swap table to track the swap count
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org, kernel test robot <lkp@intel.com>, 
	Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Youngjun Park <youngjun.park@lge.com>, linux-kernel@vger.kernel.org, 
	Kairui Song <kasong@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 4:23=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Wed, Feb 18, 2026 at 06:40:16PM +0800, kernel test robot wrote:
> > Hi Kairui,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on d9982f38eb6e9a0cb6bdd1116cc87f75a1084aad]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song-via-=
B4-Relay/mm-swap-protect-si-swap_file-properly-and-use-as-a-mount-indicator=
/20260218-040852
> > base:   d9982f38eb6e9a0cb6bdd1116cc87f75a1084aad
> > patch link:    https://lore.kernel.org/r/20260218-swap-table-p3-v3-9-f4=
e34be021a7%40tencent.com
> > patch subject: [PATCH v3 09/12] mm, swap: use the swap table to track t=
he swap count
> > config: i386-buildonly-randconfig-001-20260218 (https://download.01.org=
/0day-ci/archive/20260218/202602181835.58TEynxc-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260218/202602181835.58TEynxc-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202602181835.58TEynxc-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> mm/swapfile.c:1627:6: warning: shift count >=3D width of type [-Wshi=
ft-count-overflow]
> >     1626 |                 VM_WARN_ON_ONCE(ci->extend_table[ci_off] >=
=3D
> >          |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >     1627 |                                 (BIT(BITS_PER_TYPE(ci->exten=
d_table[0]))) - 1);
> >          |                                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
> >    include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
> >        7 | #define BIT(nr)                 (UL(1) << (nr))
> >          |                                        ^
> >    include/linux/mmdebug.h:123:50: note: expanded from macro 'VM_WARN_O=
N_ONCE'
> >      123 | #define VM_WARN_ON_ONCE(cond) (void)WARN_ON_ONCE(cond)
> >          |                                     ~~~~~~~~~~~~~^~~~~
> >    include/asm-generic/bug.h:120:25: note: expanded from macro 'WARN_ON=
_ONCE'
> >      120 |         int __ret_warn_on =3D !!(condition);                =
              \
> >          |                                ^~~~~~~~~
> >    1 warning generated.
>
> Nice catch from the bot. It's a new added sanity check in V3 just
> in case the swap count maybe grow larger than UINT_MAX, which should
> never happen, but just in case.
>
> I really should just use the existing helper macro for that:

With this fix up.

Acked-by: Chris Li <chrisl@kernel.org>

Chris

>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 801d8092be51..34b38255f72a 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -1624,7 +1624,7 @@ static int __swap_cluster_dup_entry(struct swap_clu=
ster_info *ci,
>                 }
>         } else if (count =3D=3D SWP_TB_COUNT_MAX) {
>                 VM_WARN_ON_ONCE(ci->extend_table[ci_off] >=3D
> -                               (BIT(BITS_PER_TYPE(ci->extend_table[0])))=
 - 1);
> +                               type_max(typeof(ci->extend_table[0])));
>                 ++ci->extend_table[ci_off];
>         } else {
>                 /* Never happens unless counting went wrong */
>

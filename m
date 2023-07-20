Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB31B2FA47
	for <llvm@lists.linux.dev>; Thu, 20 Jul 2023 19:03:22 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-635d9e0aa6dso8329536d6.1
        for <llvm@lists.linux.dev>; Thu, 20 Jul 2023 12:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689879801; x=1690484601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4r0G41HIiGcQMHB4pEZiHr5BAGtm82arbVI+LgNPL4=;
        b=RaiDUPvR+vvyd1OyTp20JMJCSJvrT0S6zGhWxDNzZMzS0AGy8SJBsyyhckBfm5nRE/
         K959Kw6uN6SafOVgbBVZ+Oid0aF4pL3At4mcK4EYDh2N0ahdN4oxnvkMxXbT00+CocPB
         /HjuM6QjdsPfWVRr2V+eaIs7pkDvmDgkgh7d/Ym1sn6HWGhCcBKB0DjUUSFo9YDCmmj1
         +oTy23pA1nrzKlp5cOpJCHtIu479n28nKBoerhiWnRrAbNKK2lvX/4i92s6Aqo54Ahca
         Dq/TtIbjm5Z2285umaAaxnlGBq18gt9npli7BW0C7g60kmtT/Dk9l9hoWtaFFjKxcuUL
         fgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689879801; x=1690484601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4r0G41HIiGcQMHB4pEZiHr5BAGtm82arbVI+LgNPL4=;
        b=ilsSh3tO5DZQM/OLadKX69wKg84kmj4+mJ1ao0KEO3GwPmY6us33mdVwUViJDhCjnv
         tb9M2SxpFpnqAu+ZLN3cGHqNlGJKQUnIDOk2xJmlflc5eQE7HPPDHzFBbSAxwhMhQCMh
         0HlE508QhCFBPG4DUsEwdugg635STc6DZ3lohk/5uIpmDHZZm0yCY1Us07wbMiaRoITW
         DDgPcyU8lAISZ8L4LDfnsV97iRwXC404YbqhiHwahx496YJ1Bqus783oA1MkZkfPsKy1
         Tiyr/UoZhpML115cI66hTwH403bJ+44v+FNd+EUUhZGVX8YuRHiMybw4OOGJRHlNy6nU
         GJ3Q==
X-Gm-Message-State: ABy/qLZRgpCHR1ouePxsPyr7W0jcGXEPwmKGVJjkt067TNwJZkr0oOfx
	Gm+a0nTM+UtFouieW6/UcMwHl2vn7wCQYHigebXmCQ==
X-Google-Smtp-Source: APBJJlHkLrHgRt203UkLUnU1mzzoW8tKVTFkDinsOgPBv+ELiQhdC9JCY+rvznAKn+8iCDefYEeSZshxr+gK8Y2fwW8=
X-Received: by 2002:a0c:e306:0:b0:635:e528:5213 with SMTP id
 s6-20020a0ce306000000b00635e5285213mr3710654qvl.23.1689879801348; Thu, 20 Jul
 2023 12:03:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <tencent_C2D6865561F23A8141BB145149ACC682B408@qq.com>
In-Reply-To: <tencent_C2D6865561F23A8141BB145149ACC682B408@qq.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 20 Jul 2023 12:03:10 -0700
Message-ID: <CAKwvOdmMUMpPOWoUZYQ1Mr=FmdVQYQ6XrDzPsEmuV=bSqDFvow@mail.gmail.com>
Subject: Re: [PATCH v3] hugetlbfs: Fix integer overflow check in hugetlbfs_file_mmap()
To: Linke Li <lilinke99@foxmail.com>
Cc: linux-mm@kvack.org, mike.kravetz@oracle.com, muchun.song@linux.dev, 
	nathan@kernel.org, trix@redhat.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, dan.carpenter@linaro.org, 
	Linke Li <lilinke99@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 7:50=E2=80=AFAM Linke Li <lilinke99@foxmail.com> wr=
ote:
>
> From: Linke Li <lilinke99@gmail.com>
>
> ```
>         vma_len =3D (loff_t)(vma->vm_end - vma->vm_start);
>         len =3D vma_len + ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
>         /* check for overflow */
>         if (len < vma_len)
>                 return -EINVAL;
> ```
>
> There is a signed integer overflow in the code, which is undefined
> behavior according to the C stacnard. Although this works, it's

typo: s/stacnard/standard/

I think the commit message should explicitly mention that the Linux
kernel is built with -fno-strict-overflow, but IMO that kind of makes
this patch moot.

> still a bit ugly and static checkers will complain.
>
> Using macro "check_add_overflow" to do the overflow check can
> effectively detect integer overflow and avoid any undefined behavior.
>
> Signed-off-by: Linke Li <lilinke99@gmail.com>
> ---
> v3: fix checkpatch warning and better description.
>  fs/hugetlbfs/inode.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index 7b17ccfa039d..326a8c0af5f6 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -154,10 +154,7 @@ static int hugetlbfs_file_mmap(struct file *file, st=
ruct vm_area_struct *vma)
>         if (vma->vm_pgoff & (~huge_page_mask(h) >> PAGE_SHIFT))
>                 return -EINVAL;
>
> -       vma_len =3D (loff_t)(vma->vm_end - vma->vm_start);
> -       len =3D vma_len + ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
> -       /* check for overflow */
> -       if (len < vma_len)
> +       if (check_add_overflow(vma_len, (loff_t)vma->vm_pgoff << PAGE_SHI=
FT, &len))
>                 return -EINVAL;
>
>         inode_lock(inode);
> --
> 2.25.1
>


--=20
Thanks,
~Nick Desaulniers

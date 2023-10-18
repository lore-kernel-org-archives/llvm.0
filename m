Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82A5134BF
	for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 20:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hLF7tobi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-405497850dbso68099325e9.0
        for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 13:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697662507; x=1698267307; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aM7Lcg58eaICcI7n9hqCMKVzpyeJKHwBAKrGqarbnys=;
        b=hLF7tobifZfVJS/VWPMLTgSUdH3dT/yxUb2SysFNiYQMyOwFs2Y8dJwdTL+TqpgJDG
         /byX45YlLnn3n6KfBS8WBsH9fESZ+4ceQ4/u4hqDebTmQQNv578DkNZ8wM9yaUFlViEj
         kQv65iSyINzrP8za4UqwXgb0/JW67qhn+8hwEgzGMwqNkuN/nzAkaranazAKkvTk0xKo
         keDb6SiyT378M5vHiOaeLIz37Sgz6iUNO+hPPSl80Rdrv4HXxr4xX9AWQkHThQvn7EKg
         BIAxb/HdFlA/wVXspmya3g5PMGTZOc5l9FTY3ITvc34WAinFcWwB68K7ba5z5lRR2h5d
         FaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697662507; x=1698267307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aM7Lcg58eaICcI7n9hqCMKVzpyeJKHwBAKrGqarbnys=;
        b=Z1uQQwEknchQ82P6IzPl+5KUg8j9AtPCI6luqFVKwJfxDlLBN84sGECkO813Dy/Mxo
         BuJApikcP1QhWXf5LrgwmTTgl5uAsIia4k4KFTSv8TJDJZdlhqzwMkxRI0mm7Tvj/XaO
         bz4ceFT76CFeu8DJpcmIQHhS3SCQU/UgUfwnLmo5fhqq9rnDWfRL+Ot0hmIgCxSChtf6
         PozwfD27zJHY98fsV4pVgJLgIyf38/eD1QEI/713Ge+RG+UGxIVg6yA9GgvMzH4VDe/P
         FcYpHi5gqnHg+LtDKcrWroX8w3JUgQ5TPJdOTXoR33avJ7+GoYiV8bnB/yp3zdi6Lg+X
         jdOA==
X-Gm-Message-State: AOJu0Yx44Jkw6oKPjYeBcLCMzyC5M2b6nI8VhpR4h0U9Q3K29DhEttW2
	WMgbHSDtJ1w91Fcb2mYTDpOBF6fMgFRt9nUsq1Q5Qg==
X-Google-Smtp-Source: AGHT+IGMqUrVfV+dz/gW9YaHJqOGThqNoUvNg3dX8yRlXQiXmYJ84aNlFY5GFAPOcqrTuilhkUJIA1J5zqNQf0x+Iq8=
X-Received: by 2002:a05:6000:45:b0:32d:96a7:9551 with SMTP id
 k5-20020a056000004500b0032d96a79551mr137837wrx.36.1697662506602; Wed, 18 Oct
 2023 13:55:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231009145605.2150897-1-usama.arif@bytedance.com>
 <20231010012345.GA108129@monkey> <20231012000327.GA1855399@dev-arch.thelio-3990X>
 <20231012145318.GA5127@monkey> <20231013001203.GA3812@monkey> <20231014000450.GA253713@monkey>
In-Reply-To: <20231014000450.GA253713@monkey>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 18 Oct 2023 13:54:52 -0700
Message-ID: <CAKwvOdm9xKGQzi6_j=gGZCEmKJe6b9o8+jen1oEeAhyjcaSnxQ@mail.gmail.com>
Subject: Re: [PATCH] mm: hugetlb: Only prep and add allocated folios for
 non-gigantic pages
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Usama Arif <usama.arif@bytedance.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	muchun.song@linux.dev, songmuchun@bytedance.com, fam.zheng@bytedance.com, 
	liangma@liangbit.com, punit.agrawal@bytedance.com, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 5:05=E2=80=AFPM Mike Kravetz <mike.kravetz@oracle.c=
om> wrote:
>
> On 10/12/23 17:12, Mike Kravetz wrote:
> > On 10/12/23 07:53, Mike Kravetz wrote:
> > > On 10/11/23 17:03, Nathan Chancellor wrote:
> > > > On Mon, Oct 09, 2023 at 06:23:45PM -0700, Mike Kravetz wrote:
> > > > > On 10/09/23 15:56, Usama Arif wrote:
> > >
> > > Thank you Nathan!  That is very helpful.
> > >
> > > I will use this information to try and recreate.  If I can recreate, =
I
> > > should be able to get to root cause.
> >
> > I could easily recreate the issue using the provided instructions.  Fir=
st
> > thing I did was add a few printk's to check/verify state.  The beginnin=
g
> > of gather_bootmem_prealloc looked like this:
>
> Hi Nathan,
>
> This is looking more and more like a Clang issue to me.  I did a little
> more problem isolation today.  Here is what I did:
>
> - Check out commit "hugetlb: restructure pool allocations" in linux-next
> - Fix the known issue with early disable/enable IRQs via locking by
>   applying:
>
> commit 266789498210dff6cf9a14b64fa3a5cb2fcc5858
> Author: Mike Kravetz <mike.kravetz@oracle.com>
> Date:   Fri Oct 13 13:14:15 2023 -0700
>
>     fix prep_and_add_allocated_folios locking
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index c843506654f8..d8ab2d9b391b 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -2246,15 +2246,16 @@ static struct folio *alloc_fresh_hugetlb_folio(st=
ruct hstate *h,
>  static void prep_and_add_allocated_folios(struct hstate *h,
>                                         struct list_head *folio_list)
>  {
> +       unsigned long flags;
>         struct folio *folio, *tmp_f;
>
>         /* Add all new pool pages to free lists in one lock cycle */
> -       spin_lock_irq(&hugetlb_lock);
> +       spin_lock_irqsave(&hugetlb_lock, flags);
>         list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
>                 __prep_account_new_huge_page(h, folio_nid(folio));
>                 enqueue_hugetlb_folio(h, folio);
>         }
> -       spin_unlock_irq(&hugetlb_lock);
> +       spin_unlock_irqrestore(&hugetlb_lock, flags);
>  }
>
>  /*
>
> - Add the following code which would only trigger a BUG if we were to
>   traverse an empty list; which should NEVER happen.
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index d8ab2d9b391b..be234831b33f 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3294,11 +3294,21 @@ static void __init gather_bootmem_prealloc(void)
>         LIST_HEAD(folio_list);
>         struct huge_bootmem_page *m;
>         struct hstate *h, *prev_h =3D NULL;
> +       bool empty;
> +
> +       empty =3D list_empty(&huge_boot_pages);
> +       if (empty)
> +               printk("gather_bootmem_prealloc: huge_boot_pages list emp=
ty\n");
>
>         list_for_each_entry(m, &huge_boot_pages, list) {
>                 struct page *page =3D virt_to_page(m);
>                 struct folio *folio =3D (void *)page;
>
> +               if (empty) {
> +                       printk("    Traversing an empty list as if not em=
pty!!!\n");
> +                       BUG();
> +               }
> +
>                 h =3D m->hstate;
>                 /*
>                  * It is possible to have multiple huge page sizes (hstat=
es)
>
> - As you have experienced, this will BUG if built with LLVM 17.0.2 and
>   CONFIG_INIT_STACK_NONE
>
> - It will NOT BUG if built with LLVM 13.0.1 but will BUG if built with
>   LLVM llvm-14.0.6-x86_64 and later.
>
> As mentioned in the previous email, the generated code for loop entry
> looks wrong to my untrained eyes.  Can you or someone on the llvm team
> take a look?

I think you need to initialize h, otherwise what value is passed to
prep_and_add_bootmem_folios if the loop is not run because the list is
empty.  The compiler sees `h` is only given a value in the loop, so
the loop must be run.  That's obviously hazardous, but the compiler
assumes there's no UB. At least that's my limited understanding
looking at the IR diff Nathan got me in
https://github.com/ClangBuiltLinux/linux/issues/1946.
--=20
Thanks,
~Nick Desaulniers

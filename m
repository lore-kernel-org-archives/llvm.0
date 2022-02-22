Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732267E
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 07:50:58 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id d11so16161331vsm.5
        for <llvm@lists.linux.dev>; Mon, 21 Feb 2022 23:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uzFl6sqnppLbE/reSAw0Z5UcOZ1BcsboAOECKBIl91c=;
        b=a5Xuu8aA+xACIZl3B7LWvPIlbuhmt8vIyo1mz/GH3brKs0JizVcUTzmv1gQTT5Iin6
         YrdNLDg2lBUZ9srG4BI/EDO45xLd2v6rUtqD1R5Nh9Xw9DqnJ+PhEclWzGdVv40daqPU
         RkGgdc1v3DfbQHPx8rB1EV4i7YLQGQSkPttx0meFhXJhA42rgK+XGl3CAW/LqFX4nzpo
         g+3m9nXNPC3YKj0507M7//7Hg6mln+Y1UhYFA/7POLikvUd0mz6g5VF5plkog765RCiT
         f3pUlGVT+hRIEoY5L2/S+HvSgl45GLQBndPIu9m7vgDyOw3FUpAuYTZFyRGKZ5kDCxc8
         QwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uzFl6sqnppLbE/reSAw0Z5UcOZ1BcsboAOECKBIl91c=;
        b=M2w3sftk0t+FrDGkLWs+28RE/OCrWsMxrmgRqD/1IWqcpZ6vuHw+uQMhNlEasgyx02
         0lt9x0bInet25PvLAt6CqGAlDtm+ySYRRp5FzYkptMLRX/1uRy//I1ZCptFBggBIpwbD
         uHAiFTJscl0NHxIBs1KIyveVI9Z0xYGkyqwBYfPS2QWEpTOwWYH8YkH5EaKS/odSKAbY
         eat7ie68LBeFKLmILF/cCwbNR60ZO5zrCXjVoDUqOcEY2RoOalVIz++EjccO0R0Qxd2F
         OWYeK/47fd3DyHvjT16hsuzqTKUEya7U4UfvqDIpQDi7s6Ljwb1TUVahW1XSTQbW/2EK
         3ZPA==
X-Gm-Message-State: AOAM530/615Yj8vGBXgOfCKFASluIZ9RURx5Dqcquz+BBnHubnY0vtN1
	4rWSTQ9MgSasW/rscmDXSCf0RA79QWrlgsOjc0M=
X-Google-Smtp-Source: ABdhPJzocCr94zTr+ZAkP6jgRQmORnoaN5tSWsl5OKqascjV1wkde9J5Fpxth9MD5BMsQ4o3FzhOKRbu7zx2QdnUrnA=
X-Received: by 2002:a67:eb9a:0:b0:31b:db46:4c82 with SMTP id
 e26-20020a67eb9a000000b0031bdb464c82mr8999722vso.38.1645516257285; Mon, 21
 Feb 2022 23:50:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220220144606.5695-1-jrdr.linux@gmail.com> <0a2e57ad-2973-ea01-ceda-3262cde1f5aa@gmx.com>
In-Reply-To: <0a2e57ad-2973-ea01-ceda-3262cde1f5aa@gmx.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 22 Feb 2022 13:20:45 +0530
Message-ID: <CAFqt6zZsv+bMwbdqrcOMCZE08O_q7DGa0ejVAbokLybsSch5fw@mail.gmail.com>
Subject: Re: [PATCH] btrfs: Initialize ret to 0 in scrub_simple_mirror()
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, dsterba@suse.com, 
	nathan@kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 21, 2022 at 5:46 AM Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
>
>
>
> On 2022/2/20 22:46, Souptick Joarder wrote:
> > From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>
> >
> > Kernel test robot reported below warning ->
> > fs/btrfs/scrub.c:3439:2: warning: Undefined or garbage value
> > returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
> >
> > Initialize ret to 0.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
>
> Although the patch is not yet merged, but I have to say, it's a false alert.

Yes, I agree it is a false positive but this patch will at least keep
kernel test robot happy :)
>
> Firstly, the while loop will always get at least one run.
>
> Secondly, in that loop, we either set ret to some error value and break,
> or after at least one find_first_extent_item() and scrub_extent() call,
> we increase cur_logical and reached the limit of the while loop and exit.
>
> So there is no possible routine to leave @ret uninitialized and returned
> to caller.
>
> Thanks,
> Qu
>
> > ---
> >   fs/btrfs/scrub.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/btrfs/scrub.c b/fs/btrfs/scrub.c
> > index 4baa8e43d585..5ca7e5ffbc96 100644
> > --- a/fs/btrfs/scrub.c
> > +++ b/fs/btrfs/scrub.c
> > @@ -3325,7 +3325,7 @@ static int scrub_simple_mirror(struct scrub_ctx *sctx,
> >       const u32 max_length = SZ_64K;
> >       struct btrfs_path path = {};
> >       u64 cur_logical = logical_start;
> > -     int ret;
> > +     int ret = 0;
> >
> >       /* The range must be inside the bg */
> >       ASSERT(logical_start >= bg->start &&

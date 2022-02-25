Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7585184D
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 05:16:56 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id d11so4448992vsm.5
        for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 21:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YI624CeWI9F1Un2gJZmusBAPR0ogE5tqYAS2WUpf0us=;
        b=XRI0iJIbBg7tzwGHoTgZsR3OUpqvwYSFs8egTL3gP7sw4HWbPbxiQW4nv8iVLLjbyR
         PKKBUbSL84TbBdsbzxtuu28tlAOhxXdc3avwEgM5F6WAg/fnCTy41Vy4jbcQSSuFoXYq
         cFKZbE/fPcNllnQKHSUJgD4KW4ckkFwgFxkpfpYV9PEFi/BsmU3ON4aBT4zbP8SdHmCb
         NV5hpn4ps1DDaYiiXUDhi5j0C9P8AuGDtwzBpplkq0o/euqPodCq1MP1vigMhpjV49Vk
         nCdB9/rOY0tZy35gAvkPYCoPdY/CAesYiJQDZaSpwe3xAnKTxj7GcD/E7LvWNBVfBJG8
         kpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YI624CeWI9F1Un2gJZmusBAPR0ogE5tqYAS2WUpf0us=;
        b=MXyB5jaFP/r2dOsPq2dv4NTikmNFm3o3WtCtT2e5vesIgAOo/enwBD3ljuBKueHZiO
         5XNjuJFmjCmvXaw0MnrLhf5fyrm96IlVwoN+fNWq5WjVyQqAVTlcNNYZNvSJspAvnd9g
         U9oa/aHq7YHaTqlNRdQANuRvaZMX64YVo3Mq3gGBtFchcgG3AwYQC2X6pQisXhgAZfxE
         hR61HFiEKOHOQ8+KEk6TGrphwhoNxUbq68ajJmuWdZjCLgQulTl7BUVF664VdI2//xQU
         2Ki6jk6XuKhQ2usYByRpMZGt5cGnPQs8EDh7891mT37CB916MsAtpjmQNXov6MTv/Og5
         FUYQ==
X-Gm-Message-State: AOAM5319f524H5/D8TifkLesds0mFwDBP2rSpDUeGHUW1imuy2XJhwAn
	2ojENKQaLZrwIh4ndeqZH0GN5susJqsoxklAQPg=
X-Google-Smtp-Source: ABdhPJxRToTIe0juJIqTwtdLyel6cMUDMaMZd/qiWhRmTkjAwvw6Ofk/GDYWuDZ6PG/E+x1zOVqWOheP4e4HIHiWmBI=
X-Received: by 2002:a67:e14d:0:b0:31b:9356:40ff with SMTP id
 o13-20020a67e14d000000b0031b935640ffmr2740966vsl.51.1645766215755; Thu, 24
 Feb 2022 21:16:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220220144606.5695-1-jrdr.linux@gmail.com> <0a2e57ad-2973-ea01-ceda-3262cde1f5aa@gmx.com>
 <CAFqt6zZsv+bMwbdqrcOMCZE08O_q7DGa0ejVAbokLybsSch5fw@mail.gmail.com>
 <a1d126df-a5ee-d47d-bfaa-95b3b221e41a@suse.com> <b2536c4b-bf0f-a2ff-58cf-ef7d17acaf48@intel.com>
In-Reply-To: <b2536c4b-bf0f-a2ff-58cf-ef7d17acaf48@intel.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Fri, 25 Feb 2022 10:46:43 +0530
Message-ID: <CAFqt6zbCootaOTU3hGXZ0cBcMHoiNtXynzzG8oGw8R6fO4muhg@mail.gmail.com>
Subject: Re: [PATCH] btrfs: Initialize ret to 0 in scrub_simple_mirror()
To: Yujie Liu <yujie.liu@intel.com>
Cc: Qu Wenruo <wqu@suse.com>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, dsterba@suse.com, 
	nathan@kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 24, 2022 at 3:18 PM Yujie Liu <yujie.liu@intel.com> wrote:
>
> Hi,
>
> Sorry for the noise of this false alert.
>
> For clang analyzer reports, usually we do internal check firstly. We'll send out the
> report only when we think that it is highly possible to be a true alert.
>
> We scanned our report history and found this report was produced on 1/26, but it was
> still in the internal check domain and was not likely to be sent to Qu or mailing lists,
> so we are kind of confusing about this consequence.
>
> Souptick, could you help to provide the original report by link or attachment?

https://marc.info/?l=linux-mm&m=164487037605771&w=2

> Then we can do some check to figure out whether we have any flaw in our process.
>
> Thanks,
> Yujie
>
> On 2/22/2022 16:04, Qu Wenruo wrote:
> >
> >
> > On 2022/2/22 15:50, Souptick Joarder wrote:
> >> On Mon, Feb 21, 2022 at 5:46 AM Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
> >>>
> >>>
> >>>
> >>> On 2022/2/20 22:46, Souptick Joarder wrote:
> >>>> From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>
> >>>>
> >>>> Kernel test robot reported below warning ->
> >>>> fs/btrfs/scrub.c:3439:2: warning: Undefined or garbage value
> >>>> returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
> >>>>
> >>>> Initialize ret to 0.
> >>>>
> >>>> Reported-by: kernel test robot <lkp@intel.com>
> >>>> Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
> >>>
> >>> Although the patch is not yet merged, but I have to say, it's a false alert.
> >>
> >> Yes, I agree it is a false positive but this patch will at least keep
> >> kernel test robot happy :)
> >
> > I'd say we should enhance the compiler to fix the false alert.
> >
> > Thus adding LLVM list here is correct.
> >
> >
> > To me, the root problem is that, we lack the hint to allow clang to know that, @logical_length passed in would not cause u64 overflow.
> >
> > Unfortunately the sanity check to prevent overflow is hidden far away inside tree-checker.c.
> >
> > Maybe some ASSERT() for overflow check would help LLVM to know that?
> >
> > Thanks,
> > Qu
> >
> >>>
> >>> Firstly, the while loop will always get at least one run.
> >>>
> >>> Secondly, in that loop, we either set ret to some error value and break,
> >>> or after at least one find_first_extent_item() and scrub_extent() call,
> >>> we increase cur_logical and reached the limit of the while loop and exit.
> >>>
> >>> So there is no possible routine to leave @ret uninitialized and returned
> >>> to caller.
> >>>
> >>> Thanks,
> >>> Qu
> >>>
> >>>> ---
> >>>>    fs/btrfs/scrub.c | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/fs/btrfs/scrub.c b/fs/btrfs/scrub.c
> >>>> index 4baa8e43d585..5ca7e5ffbc96 100644
> >>>> --- a/fs/btrfs/scrub.c
> >>>> +++ b/fs/btrfs/scrub.c
> >>>> @@ -3325,7 +3325,7 @@ static int scrub_simple_mirror(struct scrub_ctx *sctx,
> >>>>        const u32 max_length = SZ_64K;
> >>>>        struct btrfs_path path = {};
> >>>>        u64 cur_logical = logical_start;
> >>>> -     int ret;
> >>>> +     int ret = 0;
> >>>>
> >>>>        /* The range must be inside the bg */
> >>>>        ASSERT(logical_start >= bg->start &&
> >>
> >

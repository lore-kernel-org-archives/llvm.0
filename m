Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA20420E1
	for <llvm@lists.linux.dev>; Sat, 24 Dec 2022 06:19:53 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so10521025pjp.1
        for <llvm@lists.linux.dev>; Fri, 23 Dec 2022 22:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZjVYIeHaHMd41xXC10DzHW2hRZWYF7bxDRwc+vDs0I=;
        b=g3DrVUAAex7F3ExnETfKs+s6TyLkShJvfDX0EeO1IaFoKq78t49mTmXJj/hI6mgJ1l
         JhYRtUSxDoEAF8JV6j7PKZC3XP+z2q6S8BF8mxF9j6RdSwl2gsXrObmYtZpiCorqw/kP
         4blGxUSxCLW6Eyy+trrHqZ8V3/L9QQS3WJOccH1FcwRXfbjfCZhi8UQuUZTpkuTImgvV
         aIyedRZPW/Dq7QQfbfOMVZUPiLupsewoW7WHT73XvFt76t+3weVQ/4uagLSeN/i/NZVm
         2wvttBZ4hzFrUyDp63LUrf3RXgMdSzrx0P/4g2t9EBBsvk1WBHmWXqPYVyvsYRnRNEeR
         VthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZjVYIeHaHMd41xXC10DzHW2hRZWYF7bxDRwc+vDs0I=;
        b=f09MW+C8IAZaEEKHrRlLYroR0zdjUEUTdktqxi0rkRuYH/72zfCeGzdr4gNNH6QrxI
         waSncWToxlLM75Ki4E+Fgf9YaAUm9xovDLZMVE/uKVQFA+u7CW0WfLXJtXhpZkAC/YBk
         ozGyecYx5vWjyHjd+sYHGGtWtAheWnrbFYq+fvKWu1eALushRnEDFRkfZyv5Nd4cNwmT
         FiM7lORjrWPMFRLdCHdfUY9q1myiCYddfTtmLmiPBkNRK6kN+M/R0zDySNP9iuVgswdC
         6uTbAfYsjsSmIeV0hUXD3QbWbYgpj9bJDnBqNd8WJAh3rN89v4Ov/P3ZiT2/f80zjISb
         gzrA==
X-Gm-Message-State: AFqh2kowcaqsgaxBjHlPPTZwIwHQE14udR6ME9GK2ir5UpdqEZSN6leT
	FEVC172Qs6+L9JZglR/bfxFIoaotUB67gxeLMkA=
X-Google-Smtp-Source: AMrXdXvmD9eq/sY5pNRC9hDGCSd+LhNGfX+dnzIG/iApKlAPkbb5sMuq1Q6H4XEtOJLLuEwcP0T3LBHzuAx2krgxO/I=
X-Received: by 2002:a17:902:e886:b0:189:80fe:b483 with SMTP id
 w6-20020a170902e88600b0018980feb483mr751359plg.20.1671862793109; Fri, 23 Dec
 2022 22:19:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221224050640.64427-1-zhouzhouyi@gmail.com> <Y6aVA9M/wxsi/KKh@dev-arch.thelio-3990X>
In-Reply-To: <Y6aVA9M/wxsi/KKh@dev-arch.thelio-3990X>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Sat, 24 Dec 2022 14:19:42 +0800
Message-ID: <CAABZP2xojYo+gtvFz9MtfPp4xJ=iha-tuRR3x-TRkKUqTYDUjg@mail.gmail.com>
Subject: Re: [PATCH linux-next] lib: Dhrystone: initialize ret value
To: Nathan Chancellor <nathan@kernel.org>
Cc: ndesaulniers@google.com, trix@redhat.com, akpm@linux-foundation.org, 
	geert+renesas@glider.be, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 24, 2022 at 1:58 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Sat, Dec 24, 2022 at 01:06:40PM +0800, Zhouyi Zhou wrote:
> > Initialize ret value whenever 'if' condition is false in dhry_run_set.
> >
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > ---
> > Dear Developers:
> > When I invoke make bzImage LLVM=1, clang complains followings:
> > lib/dhry_run.c:61:6: error: variable 'ret' is used uninitialized whenever 'if' condition is false
> >
> > Fix above complain by initialize the ret value.
> >
> > Thanks
> > Zhouyi
>
> Thank you for the patch! I think this has already been fixed:
>
> https://lore.kernel.org/20221219221045.0ABAEC433D2@smtp.kernel.org/
Thank you for reviewing my patch ;-), I see
>
> -next is on a break so it won't be there for a bit:
>
> https://lore.kernel.org/20221220112148.64f183ce@canb.auug.org.au/
Thank you for your guidance, I think I should stop working on -next
for awhile ;-)
>
> Cheers,
> Nathan
Cheers
Zhouyi
>
> > --
> >  lib/dhry_run.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/lib/dhry_run.c b/lib/dhry_run.c
> > index 31a1d442e4a0..be86e5126c29 100644
> > --- a/lib/dhry_run.c
> > +++ b/lib/dhry_run.c
> > @@ -64,6 +64,7 @@ static int dhry_run_set(const char *val, const struct kernel_param *kp)
> >                       return ret;
> >       } else {
> >               dhry_run = true;
> > +             ret = 0;
> >       }
> >
> >       if (dhry_run && system_state == SYSTEM_RUNNING)
> > --
> > 2.34.1
> >

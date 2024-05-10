Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D30417279F
	for <llvm@lists.linux.dev>; Fri, 10 May 2024 16:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715358081; cv=none; b=GTpghOIdhu6PfKG/B2Pyr8HBMtueeURnozcn+reymbpsh3i1TLVDRKmjEjlNcApIeGXSASQLQNWrM5jTRnEYxp6Ppip/sk3vHQ8U3lwAmTLaUoQQ3XtFs2/V9CMkYHz9VSD6/OKpT5tHPcn6GXIOjr0Cg7R9QCLByUpDeeW+lNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715358081; c=relaxed/simple;
	bh=8aU0aZOb2y9DUg+lZw8BCNxpFVehcs41OsBX/b+s5tA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdvpAe8HKxr2P3Z1llVj6RwAkIejPItWiE2ExsYZhOxyEldV0407XJ42AvjiNa7ThptmkG0cZs1r8doYzZhnb34knOSHvdBR3wghYJvsvl/aBYMhB38di4Mx7+M0AYDgWyiVav9uDcog7o8ma8irtLDZUlngjRYFEFoazlDWMQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pWNH25nG; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pWNH25nG"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-de46b113a5dso2086058276.3
        for <llvm@lists.linux.dev>; Fri, 10 May 2024 09:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715358078; x=1715962878; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFE3n+MZyxeo0bNjBIjsCbl4GDn+4HbpNAkc84Q2m38=;
        b=pWNH25nGVFTNGWYAmDo3sJMn7FYOh5dzShWyNGJK40kuXwQC5qKT3zD9szk7PsuQww
         feJQSM/X2xkICsN/KJjUkNoY8H4KYLIwaTCEjNOaEZliKYA/+wvUR+A7kORYd04q6pYx
         V8Y1cwTpvJj20CuzfsD5nQlFIPXzBxWOi91VOV3OUZDoHQ9/dED/fNwC+JlclBMFSMwU
         AMvjj/5749LGb8qKogWmU04kH0c7ycaUU1pmvtf/gFxwJzYQ+mrrhUrOOpOxjsyXABNR
         10gvMOGVIKsx1TY/DVQv0VI0tbv4nNdY6aebVFzfImEb+3AUtsysowv+9xnrBoNyIA4w
         HuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715358078; x=1715962878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFE3n+MZyxeo0bNjBIjsCbl4GDn+4HbpNAkc84Q2m38=;
        b=Hx8OXRPQOB6HquRqULQLqawC7uQLUzh0nKYoAviofh8tOqCxsylNcOPcMB53tmtARA
         Lacdp7rTetjsq/H2YT6Cw/WzVwSNQncfCh3q5U77mVDuFKW//iFwpdXIq1ly099T8yLg
         mFe74o1pVhMhQst25olRr5nwNHOsc5V4yog6FKNAmHt1BdxpFwP/+ttpHop/Yk5gVcQw
         J2b8bmobhfHIm/ErBh2Grz32k6D89Ofbm0e0ZFv0wiwdWA5NEFvf7s+vJ2YNlyOyUGbV
         WkpsRCS1CGkpy3brPQBz2g/1KSbNm+yDs0pBx30NUiOb13UsOO/0j+kJfWOGyh4ekc3N
         BPIw==
X-Forwarded-Encrypted: i=1; AJvYcCXC1HwmZoXAygUie8RdKVJ+yDwLf5XvwHUwTldwntxY1ZepggL/b8/ZEpFoVHFzPPysxm/BfXrY1fNHXVNMazB/oprumg==
X-Gm-Message-State: AOJu0YwCUccw1JgHmYwzAzizPMsjoApJ0IWwRDaR5kf3lhGWXzV8Zq7P
	56ylfrfqWQ8rhetvsRLTGt9FL/vJjZtGRRWBZbctuhwSMKviHL5QEsOiM7OGk2w4ALO5wTGixV2
	w6b0bQ07YOVWAUjPr8aDwT/ZRwMMQTt0W7Mkd
X-Google-Smtp-Source: AGHT+IG1DyUD3fKZKxA634315t5oE5P95Q7TTzvjl87/l/KT7ajBuikVKoMlofkpK08Ducvn1mCsxmnORAB/OPa4VDU=
X-Received: by 2002:a25:bc8f:0:b0:dee:6346:b856 with SMTP id
 3f1490d57ef6-dee6346bbaemr42235276.34.1715358077724; Fri, 10 May 2024
 09:21:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240509-b4-sio-read_write-v1-1-06bec2022697@google.com> <20240510151508.hajqjxsn7rghk3dj@quack3>
In-Reply-To: <20240510151508.hajqjxsn7rghk3dj@quack3>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 10 May 2024 09:21:06 -0700
Message-ID: <CAFhGd8qbUYXmgiFuLGQ7dWXFUtZacvT82wD4jSS-xNTvtzXKGQ@mail.gmail.com>
Subject: Re: [PATCH] fs: fix unintentional arithmetic wraparound in offset calculation
To: Jan Kara <jack@suse.cz>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 8:15=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
>
> On Thu 09-05-24 21:34:58, Justin Stitt wrote:
> > ---
> >  fs/read_write.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/read_write.c b/fs/read_write.c
> > index d4c036e82b6c..10c3eaa5ef55 100644
> > --- a/fs/read_write.c
> > +++ b/fs/read_write.c
> > @@ -88,7 +88,7 @@ generic_file_llseek_size(struct file *file, loff_t of=
fset, int whence,
> >  {
> >       switch (whence) {
> >       case SEEK_END:
> > -             offset +=3D eof;
> > +             offset =3D min_t(loff_t, offset, maxsize - eof) + eof;
>
> Well, but by this you change the behavior of seek(2) for huge offsets.
> Previously we'd return -EINVAL (from following vfs_setpos()), now we set
> position to maxsize. I don't think that is desirable?

RIght, we shouldn't change the current behavior. This patch needs rethinkin=
g.

>
> Also the addition in SEEK_CUR could overflow in the same way AFAICT so we
> could treat that in one patch so that the whole function is fixed at once=
?

Yep let's include that one as well. However, I'm going to hold off on
sending a new version until the discussion about how to handle
overflow comes to a conclusion; as suggested by Greg [1]. I made too
many assumptions about how folks want overflow to be handled. In the
case of this patch, a simple check_add_overflow() should be okay and
match the behavior, but let's wait and see.

>
>                                                                 Honza
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR

[1]: https://lore.kernel.org/all/2024051039-bankable-liking-e836@gregkh/

Thanks
Justin

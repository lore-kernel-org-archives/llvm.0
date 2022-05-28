Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732A43FE5
	for <llvm@lists.linux.dev>; Sat, 28 May 2022 23:31:42 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id 68so7549438vse.11
        for <llvm@lists.linux.dev>; Sat, 28 May 2022 16:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZHkspVi7hYgWPjrkicA2Ka1cNGl3qopvOnZQ16mob5o=;
        b=Gg3IQ+lg74QPdhRPZFKypPilx6JqlFfPJ+wKJjuWc7dfiDeqz7Ej4ejDTuBIvmfY8K
         hOPfs9pNrSleU0crFRqa6VRLjFrpYl9twi0nfDuxYmDDujG/2/5YXwGWAjuH8NoAXpxO
         4KwH2a3MSZ8Oy4R4BPM9eeIVbbVnkOYgnWq5DycK3dnUzRosv8FiZBFGZhP7eatjkt1N
         Lh8kNIipt6Smw86Rqn42AIjJVfoxqkE024CI1V3uE2nYTV284vfqkAU+yx1kvh2R2KPh
         TyVQMuWvodkAsmpi/mx3igk3w0kIrCQP0XviVaAwqzUtZHJOv94NUnqWo3/gvHpaLGXf
         R4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZHkspVi7hYgWPjrkicA2Ka1cNGl3qopvOnZQ16mob5o=;
        b=o59tVpwZf717OtOGULkv5FrnnIdqBeFXG+1yZVuFYAjrabwf+SsLGnc9shZ9bDye4n
         NOIoa9KpW+MmccUFb812aPwhbGK+pHNkxFdS99VLjbNUQO8LBA0ykpqDJZbiZvSbp071
         m/bEMBhsSFDlUwaNEu+As/DKJZVWPCNb1fXh4AcfWqC3UUSXwmxsdHDA4NcGCakrcwoW
         JdnDzVOzPprEqkHm18Klz7Cksma6w6VZYGt3eCQrEjHgBdJuNUsPf3+1+P48UOU4gIQw
         cJQT0AE3YzTOMUvf1EQ1avgfr71Wk0ElDl2N6ub6z6eQjBZoiZWrLAQxALoCgkVoEe60
         6dmA==
X-Gm-Message-State: AOAM532jA00TdC+2gTq/thxMjdK07nkI1qmhpqivXhyaCoCpM9sD7uKX
	cC49CZreRRiXZrCSjub1ZwA6S6qPnkbAE6euE68=
X-Google-Smtp-Source: ABdhPJy0Acb1c3xSDsjiqAa+wurlHniC7DTliHnSjCHwZc1KOpXXeNt8sWJjTYXpw40/HtDl5zk/Uq4lxuGzoAoQ188=
X-Received: by 2002:a67:b607:0:b0:337:b5b7:adc9 with SMTP id
 d7-20020a67b607000000b00337b5b7adc9mr13395803vsm.17.1653780701218; Sat, 28
 May 2022 16:31:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220526140226.2648689-1-trix@redhat.com> <CAKwvOdmPZXiMZRKyMfZVMmw-95XVocSZn3VVi3yJh0Bx1ONbJQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmPZXiMZRKyMfZVMmw-95XVocSZn3VVi3yJh0Bx1ONbJQ@mail.gmail.com>
From: Steve French <smfrench@gmail.com>
Date: Sat, 28 May 2022 18:31:30 -0500
Message-ID: <CAH2r5mumSyxP8XUJjKwv9exh__NkCtG2HSiO-USqGo_7ZTb0yQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: set length when cifs_copy_pages_to_iter is successful
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Steve French <stfrench@microsoft.com>, Nathan Chancellor <nathan@kernel.org>, 
	David Howells <dhowells@redhat.com>, CIFS <linux-cifs@vger.kernel.org>, 
	samba-technical <samba-technical@lists.samba.org>, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev, Tom Rix <trix@redhat.com>, Steve French <sfrench@samba.org>
Content-Type: text/plain; charset="UTF-8"

Presumably this was in Dave Howell's patch set which we took out of
for-next to restructure in some of Al's feedback and some things found
during testing. So nothing to fix in current mainline or for-next ...
right?

On Sat, May 28, 2022 at 3:40 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> + Steve's @microsoft.com email addr.
>
> On Thu, May 26, 2022 at 7:02 AM Tom Rix <trix@redhat.com> wrote:
> >
> > clang build fails with
> > fs/cifs/smb2ops.c:4984:7: error: variable 'length' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
> >   if (rdata->result != 0) {
> >       ^~~~~~~~~~~~~~~~~~
> >
> > handle_read_data() returns the number of bytes handled by setting the length variable.
> > This only happens in the copy_to_iter() branch, it needs to also happen in the
> > cifs_copy_pages_to_iter() branch.  When cifs_copy_pages_to_iter() is successful,
> > its parameter data_len is how many bytes were handled, so set length to data_len.
> >
> > Fixes: 67fd8cff2b0f ("cifs: Change the I/O paths to use an iterator rather than a page list")
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >  fs/cifs/smb2ops.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> > index 3630e132781f..bfad482ec186 100644
> > --- a/fs/cifs/smb2ops.c
> > +++ b/fs/cifs/smb2ops.c
> > @@ -4988,7 +4988,7 @@ handle_read_data(struct TCP_Server_Info *server, struct mid_q_entry *mid,
> >                                 dequeue_mid(mid, rdata->result);
> >                         return 0;
> >                 }
> > -               rdata->got_bytes = pages_len;
> > +               length = rdata->got_bytes = pages_len;
> >
> >         } else if (buf_len >= data_offset + data_len) {
> >                 /* read response payload is in buf */
> > --
> > 2.27.0
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,

Steve

Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D621F185
	for <llvm@lists.linux.dev>; Thu,  3 Aug 2023 16:45:39 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-63cf4827630so6336016d6.2
        for <llvm@lists.linux.dev>; Thu, 03 Aug 2023 09:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691081138; x=1691685938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFCXH3mOUSq8MqtZtOkQkRghp8S2GIqMkOlbsQ4LQ88=;
        b=wfeHYOHqmHJelbVa+gQR2GNMF3c7du1yNFbQnLx+lyJh7yqP9ritrv9FPFxzAeYXPg
         8B7AtnMU3r1Dn4wIeAoo198vyCUdPH4ORPUiSoKuyZGSp9CAp3s+Lu1bwi7+5yUtVjng
         QrmJfckWzDEu25adx7RQealFqD+elITU5E0XQ1RsVvD7Q7pM0N1A1WgXqbPnHpUmiNhP
         Sx9xRu7EAwfgWardS1x8jk5u3pOUqJLXa8lj2Ftajf6hRM/Jl1mUv0StYqeIce51dYXc
         W1bhpBh1H20IOuYNJclN1E9blwfW9ssmMF5Y+nyJSdig9lbTYtL7P1uJ1dEbvMR0MztN
         TVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691081138; x=1691685938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFCXH3mOUSq8MqtZtOkQkRghp8S2GIqMkOlbsQ4LQ88=;
        b=HtT/uQlPRTZcPmN/5tnRabt6Blm2sVh0CTDLWEnGeMztoyQJXFtwXAoRmOEPjxHc+r
         lljliqeViFrDpkS6Akz6amTxsGz2/E6jtE97MOR9abJngD4GokRmLMeEwJGTJkmoMySs
         axhxZ95w1byWrcBcPPAAEpY4qYXGutgpVbKnt8ZZ79O0f+Ee4ok4oOB5TbWI1SUBO7Cx
         jz/vzbED9E3jc6AW4MzbTMm+siyBWU7beM7k54dZW8UFO95PHJg6yCD7Hg4T4ZSbNPbX
         I7iasgt9N+l4uYq0G0yhi9LighNt6uvw5Fo6D0POEwGjUFXElLTOGSmyzHINAuyj8tob
         hpdw==
X-Gm-Message-State: ABy/qLYs7g/nllDwBmT/v50uaUJ33S5vHAZ+nvXTtFShdR7xOW+25tOy
	VPQSGzAVoxLxPMcfBzKSpb9uhr3MkNMqN7foPq9s8g==
X-Google-Smtp-Source: APBJJlEcCFgjfRr1EdUfBbKP0P3BUkZYFIfhXUreDbb22A4nsuS+4fUvEhOfBF1s9aXjsXcKsTSP757Bg0MoXBc12FQ=
X-Received: by 2002:ad4:4149:0:b0:63c:fbe9:6837 with SMTP id
 z9-20020ad44149000000b0063cfbe96837mr15576127qvp.11.1691081138436; Thu, 03
 Aug 2023 09:45:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230724121934.1406807-1-arnd@kernel.org> <ZMBDWbHiJVOt03u5@google.com>
In-Reply-To: <ZMBDWbHiJVOt03u5@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Aug 2023 09:45:27 -0700
Message-ID: <CAKwvOdm9CS0FRrWA9LaWw74enydbTMFUk_WYWXJvNxgLwQBzOQ@mail.gmail.com>
Subject: Re: [PATCH] btrfs: remove unused pages_processed variable
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>, 
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, Qu Wenruo <wqu@suse.com>, 
	Anand Jain <anand.jain@oracle.com>, Filipe Manana <fdmanana@suse.com>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Arnd Bergmann <arnd@kernel.org>, linux@leemhuis.info
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 2:49=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Jul 24, 2023 at 02:19:15PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The only user of pages_processed was removed, so it's now a local write=
-only
> > variable that can be eliminated as well:
> >
> > fs/btrfs/extent_io.c:214:16: error: variable 'pages_processed' set but =
not used [-Werror,-Wunused-but-set-variable]
> >
> > Fixes: 9480af8687200 ("btrfs: split page locking out of __process_pages=
_contig")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202307241541.8w52nEnt-lkp=
@intel.com/
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks for the patch!
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Link: https://lore.kernel.org/llvm/64c00cd4.630a0220.6ad79.0eac@mx.google=
.com/
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Friendly ping the btrfs maintainers to please pick this up.  Our CI
for linux-next has been red over this for longer than I like, and it's
giving me nausea, heartburn, indigestion, upset stomach, and...well...
https://youtu.be/d8InOVEsMlU

>
> > ---
> >  fs/btrfs/extent_io.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
> > index c0440a0988c9a..121edea2cfe85 100644
> > --- a/fs/btrfs/extent_io.c
> > +++ b/fs/btrfs/extent_io.c
> > @@ -211,7 +211,6 @@ static void __process_pages_contig(struct address_s=
pace *mapping,
> >       pgoff_t start_index =3D start >> PAGE_SHIFT;
> >       pgoff_t end_index =3D end >> PAGE_SHIFT;
> >       pgoff_t index =3D start_index;
> > -     unsigned long pages_processed =3D 0;
> >       struct folio_batch fbatch;
> >       int i;
> >
> > @@ -226,7 +225,6 @@ static void __process_pages_contig(struct address_s=
pace *mapping,
> >
> >                       process_one_page(fs_info, &folio->page, locked_pa=
ge,
> >                                        page_ops, start, end);
> > -                     pages_processed +=3D folio_nr_pages(folio);
> >               }
> >               folio_batch_release(&fbatch);
> >               cond_resched();
> > --
> > 2.39.2
> >



--=20
Thanks,
~Nick Desaulniers

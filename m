Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795201366;
	b=Q6jLW5Miij0xQ2u3164NCxU5B5c+JPbNUehDvu9Vvbe6jS5ieq8FkIX0ckCZSTXSiI32
	 /1fLdq77kyJWHOGRM7zQW1sy7V7ByKjB1ps6BT2kPCZnuhqELCybIBh45LcNuCesq0d/a
	 MZ41HiXww1J/uLGxoFVqnPZmEPSniZWO1GZkt1CWGhoeqhkrMebVv5eeWYPDt/ePL4Q2D
	 TKr09BYklA80xwtVj/CcOuNd82OOBQEFES4gAAvDJ4je1z8rDjDLpKbwJJLh+v4621fsg
	 506gzp8QANxZXv7IB4YWYzzm7k5YxYT+9KT/+SxMUdx23b+IbHNkIu54EErvpWxpOyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JLwTVbVtVOeJcS/bCak+vN2ywHKVICw4UVTcz51JnCg=;
	b=d72SXAxQ9xtDbX9rFt6Dg368J6MaTMio7/paXpr8iselH5OgCwQFqB6p0M+b5hJMJLb8
	 GJkaB78nxn0XaGCOXy62bGVk6s8BmSO8Xig123mZR/rtIVz9tLnJY5H6FWyKaDlw23jYt
	 uWPrN4PuZywxzC+cZ2pYi/Hi7qaELQihUidMpQNksOOV/8wAtqU5T4SijdXam6QN/vqaw
	 GrY2TQeoLd4DQtaqE7TMhFNJYnfC/qh95A6lZ3UVj87vY2ZKK3Z0TT2oAKzp+xoYmFhV6
	 wsFAe/v8YawEjT947H+LTsuwbNXaG0nBxRxjh9+0MVv52luZUExM8/xO7ZdL8Zbk3rw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RTjTJBtD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B617B60A2630
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 19:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B617B60A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RTjTJBtD
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533202fe429so29111cf.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:02:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795201362; cv=none;
        d=google.com; s=arc-20260327;
        b=qCs8d79Ir9UAQB0AuMcezlh4E74KZMu1RoRiwmHlgakGXBO4ZtDsscBu+h/ImeQMdw
         O8uupJkUJowu35S/fJXQLdQMx9s+1jnoDVgFrFPFe6VeP/Pqbb5JXCyzy8e0+Cc9v0wm
         ZloDFELThnIPa1Czn4tsP6iXUGttDhlyds7k601d111W2V4/FQIdcT/A1wf0l3kSN9Pi
         bMgsmKNDjwm6jm+zM++kFRywURwr3uuTEAQUhG6AFMxQ+fm7l9UqOd0KIpAat9CVNPAO
         Kk3Nc2UBL1wV8Ws+BWhkbTtIS5EvAredAQDNPVePS9ResTffVjNWupIlNW0k4QSHFqoA
         Iw0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JLwTVbVtVOeJcS/bCak+vN2ywHKVICw4UVTcz51JnCg=;
        fh=sW9HNlO1wJSdsDlUyxS5hAbxfyfe83/nKTj2afzlteQ=;
        b=gLG08IOzvFKhtYockr2Uz3lsyMnzAawQQruiGBiVB/UJlp5ehGCVnW8gphqEC7SS1m
         JrcrTGccUJItaTXYDzey3d39s9LbCEPD9FNoVsahKJqGeY+qZuK9GjEz+AOTGP/YOy0I
         4ZPsPAsLxtRDHxxIZKD8szWEvMDCCD/MGVcgpFJaVVXG4n2I2yB9wsAB8kv6TTdhKwCd
         I13G9z+DKbdI4MhSuzRf4ltFbxHX3G8smaPb5XRbxt3XxtK8h5abg+FqeQD32TG2z5h8
         gTxK7/Ac+QS8lC0FinZpWtLvMPHMLJUBxgdaQ+6vV8eAEcWfN3RCPf+S/qcxJ+GJ3ZEh
         G0zw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795201362; x=1795806162; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLwTVbVtVOeJcS/bCak+vN2ywHKVICw4UVTcz51JnCg=;
        b=RTjTJBtDzinPPIvbSBOw+dvTEQ/hbDFMotg6ZtlqLh6rkKH4k4HrP/vmM51bTepzTI
         EallsVveF9UuCk1L7d4295vrvbq3HlOX2pzz9O0IXBcLw1WpG1cNsUOmhk+tUwCsbh/i
         SVuFJH6X1LKBx+/+kCx9Eu3XN0vnL1L2c8kYQM049wn306zIU9FdwzkCwAJVhkdsdMrU
         +VyVTKzuf3Rr5bfuOl2Hig1jclFpISRN9yyGfynfP4b6WRVukPwwf3reqPlhh6qdeb+N
         MzWFQJgrdjyjNLUX26cy99rDkl8OhVryuBSXaDyz6DO63JuymQvUb8uPtYgleGk9mhlU
         LuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201362; x=1795806162;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLwTVbVtVOeJcS/bCak+vN2ywHKVICw4UVTcz51JnCg=;
        b=iW4lX6ypISFDYq9lFxG9V4znNOx/pFUlstahlGAXqwikIvpbld0/hVCd6Q3pS0mrFl
         Rv1K32TNlMFtxU51VwxfFZBo9tdpelpVEpCqHLNmWf7eapiVjW6g6PAMyeaf/BAGQGgv
         //pOkDGB4ey4TH7jGOcPBgnttcaXi9m8CC4QHJvvsup0IqXiJZFnE3XmIBP4oqitOkv+
         IrGOScFBOzvMHJpAyiHxn+mAmwCnAEBgHPn75ZV0Y/yt44nyzQf5EUK4/GUHxIrHasQR
         5W9yV1DayN6n5FaS1Dry1NWeKd+G3Jh30gixtC+iBOHYgb0wN9c9YZaAIARtf42HTgw+
         nZkQ==
X-Forwarded-Encrypted: i=1; AL+hErFtV8T17gMIpweoHnxVRPRf8JfQnHT6a9g1SNpbsukd+w0m+XSsQU0oXqh+GProS7C34kja@lists.linux.dev
X-Gm-Message-State: APuU4Z/PuccgPDx340ukVUiBgTzMT/nbOiZh8KDl81Ph3+mCcP5OD7vd
	81NSPIRysLJ+PHuWOZkH7KDDqD0RLYBMtDMdwax+GcAOx3NXebw394RAjyT/pasQWJ+rbGjkdL+
	6Q3tWK8ZIyAcRxktLeQLhXEKspoJjJV8+uguDS0OD
X-Gm-Gg: AYBFou3R2CVTVvEV731clnFUcwEtYbDHv3CjftXLchekff5aSbd6SFMjnJ0KrQYYxAs
	FpueE2T9dTLsL/gI9N00qgY2dZO4/lXCnMLPML3Ppiz6RCjH+NlbUn0UFXTarv/gTAZCcRBdkJU
	fPq8Q3kkFvwvQMssGDKvfYiVy55jnx+/A4F2MQQWYCqszVyzcL+a1AhRNHjwcWGi/xndRI3NDg4
	Rg7owmA0j0twSX0h8WBr92g8/2ygOsXmLRNKNt/fg53vwrUClWIkuQkVla67FO9A5ku+Hg1mwRS
	sLUOfG7WvqC9pS6J3HokCRHPIGNME6oK0DApfITwToxy1ealGybNjIUOdeYIvbofnst18daOwZe
	eKbnzCprOHRkg6aCjlSddme3GQti7sOC6GHMm
X-Received: by 2002:ac8:6f05:0:b0:55d:74e6:e03 with SMTP id
 d75a77b69052e-55d87eb573emr1166431cf.0.1795201360598; Fri, 20 Nov 2026
 11:02:40 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119170900.1530138-1-irogers@google.com> <89162d17096ddf7d4ca98a087f1517bcfb935869.camel@redhat.com>
In-Reply-To: <89162d17096ddf7d4ca98a087f1517bcfb935869.camel@redhat.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 11:02:26 -0800
X-Gm-Features: Aa3M54oI2wn1Zq1y_YwA95tqPlgwH8uHMtOUcLs4MBBagTy1yGSsQ0Bt2Jz0IBg
Message-ID: <CAP-5=fW5G+oybsfuUf2zLkHakC+Gddd6-JR94pHz+OnS8POo9w@mail.gmail.com>
Subject: Re: [PATCH] scsi: mpi3mr: Fix start_time and error return in mpi3mr_bring_ioc_ready()
To: Laurence Oberman <loberman@redhat.com>
Cc: Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>, Kashyap Desai <kashyap.desai@broadcom.com>, 
	Sumit Saxena <sumit.saxena@broadcom.com>, Sreekanth Reddy <sreekanth.reddy@broadcom.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, mpi3mr-linuxdrv.pdl@broadcom.com, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 10:10=E2=80=AFAM Laurence Oberman <loberman@redhat.=
com> wrote:
>
> On Thu, 2026-11-19 at 09:09 -0800, Ian Rogers wrote:
> > mpi3mr_bring_ioc_ready() has three bugs in its failure and retry
> > handling:
> >
> > 1. start_time is only assigned after MPI3_SYSIF_IOC_CONFIG_ENABLE_IOC
> >    when retry =3D=3D 0, after three earlier 'goto out_failed' paths. If
> >    soft reset, reset-state polling, or admin queue setup fails on the
> >    first attempt, out_failed computes elapsed_time_sec from an
> >    uninitialized start_time, and if a retry occurs (retry =3D=3D 1),
> >    start_time remains uninitialized for the ready-polling loop as
> > well.
> >
> > 2. In 'elapsed_time_sec < (mrioc->ready_timeout - 60)', ready_timeout
> >    is u32, so values below 60 wrap around in 32-bit unsigned
> > arithmetic
> >    before zero-extending to u64, spuriously retrying past the
> > timeout.
> >
> > 3. After mpi3mr_setup_admin_qpair() sets retval =3D 0 (or on entry
> > where
> >    retval is initialized to 0), controller fault/reset-history
> > checks,
> >    ready-state timeouts, and early unrecoverable or device-not-
> > present
> >    exits return retval =3D=3D 0 (success) to mpi3mr_init_ioc() and
> >    mpi3mr_reinit_ioc() even though controller bringup failed.
> >
> > Initialize start_time =3D jiffies at function entry for pre-enable
> > failure
> > exits, reset start_time =3D jiffies the first time
> > MPI3_SYSIF_IOC_CONFIG_ENABLE_IOC is written so pre-enable waits do
> > not
> > drain ready_timeout, rewrite the retry window check as
> > 'elapsed_time_sec + 60 < mrioc->ready_timeout', and ensure retval =3D -
> > 1
> > on all failure exits.
> >
> > Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
> > build. Verified by building drivers/scsi/mpi3mr/mpi3mr_fw.o with
> > LLVM=3D1 W=3D1 (-Werror) and -Wconditional-uninitialized, and with a
> > standalone C logic reproducer under ASan/UBSan; not runtime-tested on
> > physical MPI3 hardware.
> >
> > Fixes: 59bd9cfe3fa0 ("scsi: mpi3mr: Code refactor of IOC init -
> > part2")
> > Fixes: 0a319f162949 ("scsi: mpi3mr: Wait for diagnostic save during
> > controller init")
> > Fixes: 9634bb07083c ("scsi: mpi3mr: Enhance the Enable Controller
> > retry logic")
> > Fixes: 4616a4b3cb8a ("scsi: mpi3mr: Improve wait logic while
> > controller transitions to READY state")
> > Fixes: fb6eb98f3965 ("scsi: mpi3mr: Handling of fault code for
> > insufficient power")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  drivers/scsi/mpi3mr/mpi3mr_fw.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/scsi/mpi3mr/mpi3mr_fw.c
> > b/drivers/scsi/mpi3mr/mpi3mr_fw.c
> > index f0d3cd398dd0..b92b2467e995 100644
> > --- a/drivers/scsi/mpi3mr/mpi3mr_fw.c
> > +++ b/drivers/scsi/mpi3mr/mpi3mr_fw.c
> > @@ -1582,8 +1582,9 @@ static int mpi3mr_bring_ioc_ready(struct
> > mpi3mr_ioc *mrioc)
> >       int retval =3D 0;
> >       enum mpi3mr_iocstate ioc_state;
> >       u64 base_info;
> > +     bool enable_started =3D false;
> >       u8 retry =3D 0;
> > -     u64 start_time, elapsed_time_sec;
> > +     u64 start_time =3D jiffies, elapsed_time_sec;
> >
> >  retry_bring_ioc_ready:
> >
> > @@ -1595,6 +1596,7 @@ static int mpi3mr_bring_ioc_ready(struct
> > mpi3mr_ioc *mrioc)
> >
> >       if (!mpi3mr_is_fault_recoverable(mrioc)) {
> >               mrioc->unrecoverable =3D 1;
> > +             retval =3D -1;
> >               goto out_device_not_present;
> >       }
> >
> > @@ -1621,6 +1623,7 @@ static int mpi3mr_bring_ioc_ready(struct
> > mpi3mr_ioc *mrioc)
> >               if (!pci_device_is_present(mrioc->pdev)) {
> >                       mrioc->unrecoverable =3D 1;
> >                       ioc_err(mrioc, "controller is not present
> > while waiting to reset\n");
> > +                     retval =3D -1;
> >                       goto out_device_not_present;
> >               }
> >
> > @@ -1654,6 +1657,7 @@ static int mpi3mr_bring_ioc_ready(struct
> > mpi3mr_ioc *mrioc)
> >                               if (!pci_device_is_present(mrioc-
> > >pdev)) {
> >                                       mrioc->unrecoverable =3D 1;
> >                                       ioc_err(mrioc, "controller
> > is not present at the bringup\n");
> > +                                     retval =3D -1;
> >                                       goto out_device_not_present;
> >                               }
> >                               msleep(100);
> > @@ -1690,8 +1694,10 @@ static int mpi3mr_bring_ioc_ready(struct
> > mpi3mr_ioc *mrioc)
> >       ioc_config |=3D MPI3_SYSIF_IOC_CONFIG_ENABLE_IOC;
> >       writel(ioc_config, &mrioc->sysif_regs->ioc_configuration);
> >
> > -     if (retry =3D=3D 0)
> > +     if (!enable_started) {
> >               start_time =3D jiffies;
> > +             enable_started =3D true;
> > +     }
> >
> >       timeout =3D mrioc->ready_timeout * 10;
> >       do {
> > @@ -1731,7 +1737,7 @@ static int mpi3mr_bring_ioc_ready(struct
> > mpi3mr_ioc *mrioc)
> >
> >  out_failed:
> >       elapsed_time_sec =3D jiffies_to_msecs(jiffies -
> > start_time)/1000;
> > -     if ((retry < 2) && (elapsed_time_sec < (mrioc->ready_timeout
> > - 60))) {
> > +     if (retry < 2 && elapsed_time_sec + 60 < mrioc-
> > >ready_timeout) {
> >               retry++;
> >
> >               ioc_warn(mrioc, "retrying to bring IOC ready,
> > retry_count:%d\n"
> > @@ -1739,6 +1745,8 @@ static int mpi3mr_bring_ioc_ready(struct
> > mpi3mr_ioc *mrioc)
> >
> >               goto retry_bring_ioc_ready;
> >       }
> > +     if (!retval)
> > +             retval =3D -1;
> >       ioc_state =3D mpi3mr_get_iocstate(mrioc);
> >       ioc_err(mrioc,
> >           "failed to bring to ready state,  current state: %s\n",
>
> Hello Ian
>
> Thanks for this. I checked it against current mainline and all three
> issues are real. Some comments below.
>
> > 3. After mpi3mr_setup_admin_qpair() sets retval =3D 0 (or on entry
> where
> >    retval is initialized to 0), controller fault/reset-history
> checks,
> >    ready-state timeouts, and early unrecoverable or device-not-
> present
> >    exits return retval =3D=3D 0 (success) to mpi3mr_init_ioc() and
> >    mpi3mr_reinit_ioc() even though controller bringup failed.
>
> This is the most serious of the three. Both callers only check
> "if (retval)", so with the !mpi3mr_is_fault_recoverable() exit we can
> set mrioc->unrecoverable =3D 1 and still report success, and init then
> carries on against a dead controller.
>
> > 2. In 'elapsed_time_sec < (mrioc->ready_timeout - 60)', ready_timeout
> >    is u32, so values below 60 wrap around in 32-bit unsigned
> arithmetic
> >    before zero-extending to u64, spuriously retrying past the
> timeout.
>
> Agreed that the arithmetic is wrong, but note the fix changes behavior:
> today any firmware advertising a ready timeout below 60s always gets
> its two retries; after this patch it gets none.
>
> Sathya/Sreekanth, can you confirm whether any shipping MPI3
> firmware reports a ready timeout under 60 seconds, and if so whether
> dropping the retries entirely is the intended behavior?
>
> > Initialize start_time =3D jiffies at function entry for pre-enable
> failure
> > exits, reset start_time =3D jiffies the first time
> > MPI3_SYSIF_IOC_CONFIG_ENABLE_IOC is written so pre-enable waits do
> not
> > drain ready_timeout, rewrite the retry window check as
> > 'elapsed_time_sec + 60 < mrioc->ready_timeout', and ensure retval =3D -
> 1
> > on all failure exits.
>
> Would you consider splitting this into three patches, one per issue,
> each with only its own Fixes: tag? The retval fix stands on its own
> and is the one stable and distro kernels will want first; the
> ready_timeout change may need to wait for Broadcom's answer above.
> Five Fixes: tags across different commits on one patch also makes
> backporting harder.
>
> > Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
> > build. Verified by building drivers/scsi/mpi3mr/mpi3mr_fw.o with
> > LLVM=3D1 W=3D1 (-Werror) and -Wconditional-uninitialized, and with a
> > standalone C logic reproducer under ASan/UBSan; not runtime-tested on
> > physical MPI3 hardware.
>
> I have access to mpi3mr hardware and can run normal bring-up,
> controller reset and host-reset reinit on a v2 to make sure the good
> path does not regress, and will send a Tested-by.
>
> With the split, for the retval and start_time fixes:
>
> Reviewed-by: Laurence Oberman <loberman@redhat.com>

Thanks for checking all three issues and offering to test on hardware, Laur=
ence!

Splitting into three patches with individual Fixes: tags makes total
sense. I've gone ahead and posted the 3-patch v2 series now (with 'if
(!retval) retval =3D -1;' moved to out_device_not_present: in patch 1/3
so a single hunk covers all failure exits cleanly for stable
backports, and noting in patch 3/3 that commit 9634bb07083c's "510
seconds" message reflects a 570s firmware ready_timeout minus 60s).

Thanks,
Ian

> Regards
> Laurence
>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111854;
	b=vY5APFEC1/MEKHCq6hySD5ydylA4xl8z9Atc1v4ZDEiT3faoxf7u/kuc7fhIOwl+SKra
	 /UmH9Umy07Ne8mYSJWVrTmH3vzRd81ovkM7VpZUtVzAHZiSy5dtx1lBmGcCuwjOJ/DnhN
	 scmQDQqc6vme4iFyEUK9On8vHC1RVZWLjC+K390qP7wSBCdjHRHf2UTekO783RaNoo48p
	 NvnR4V5HfX/2JVNMawsugSTaQuKbVCBMoVnetUIjFdQlbah2aCPQn1fA2NpST4mofC+xm
	 k4w0CN0Mxy4epLmqFUbou3kMSvDbgmB6Xs5sXr3m6pOFM2El42NoBjCB8vIsEozAoig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111854;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:User-Agent:MIME-Version:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=YeDQdBHpcdwKETThYZXGZ+Cgqf+vlqnxAgT7wTtyXPg=;
	b=EhfpGRbXslE88EGHLOLzk0nkP5RVYHoJydjvBaqCgL//+b623Bc7FNAS3fQcbk+qojbW
	 CeY91E9BX5PLmyMLCeT0I01tmiUSKjj+Vi/AXwlAhayZc9oM7IonP2fiJxZE6Tb6gGm3C
	 DY3oJxE6wFxy2EwIjjQQ7V95I06vfRpddRrAO1TqGGyxxepbEFm54MWDyXoN/veR+cTjy
	 6UPqxM3IkeSn40v24ayLeup75dvrLZfp8iVZsMwWqZoCf8NIqoCbJuGOhllfhQ+WldGsC
	 XyfWAu0AyuFXzApcmDWgj/4w8UsJMlzxyXcPHSfVgrUOLWnnDK1zb5cqxgGWy0Srm6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XP+hbSIZ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48D0606A324
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 18:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B48D0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XP+hbSIZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795111851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YeDQdBHpcdwKETThYZXGZ+Cgqf+vlqnxAgT7wTtyXPg=;
	b=XP+hbSIZPsuMBSqo1G8mBnPDBzrNaFrSom/0DZJG7+1oGZ7TW48j5oOLdKRNaRFaELIvrm
	jy5w4JNIV9HyBNTFIxdXTG6v57fqr8wbN1YQOcwDkPpHKMaUdNpzVaRMLAo+s3fs+MpDS3
	wMulZS7wY9lxeMGQ69XMyCkaS6v6OB4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-HcUxkhbiOu6XOf97zrdN7A-1; Thu, 19 Nov 2026 13:10:50 -0500
X-MC-Unique: HcUxkhbiOu6XOf97zrdN7A-1
X-Mimecast-MFC-AGG-ID: HcUxkhbiOu6XOf97zrdN7A_1795111849
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92106c98714so1667996d6.3
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 10:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111849; x=1795716649;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A7bqVXK9mc0vEANhbyypwW4ZooF+kXFAyHaNlh/JpOQ=;
        b=PN6d+rnbLMdTfJuK4Jhz1YkbfmhoN4VPKZ29T4SUahiSrzAzQUPix2pB1A7RypyXKY
         bpZLVQlau+rYmkf3norAdWY9tfAap4mKr3/NG/C0gu522G//H4yAEg1iUnR3pkl3wNMx
         /U4QHPAiWmEiwennO2Li2BC8DxXdvlSiUaDHsuTFNdeygwP9gefSzl0CFPEb4w2jteWd
         U8BL8+u2WkhVRNIfPsI4/4Q8/Knzo6Ldi5qYDzX+pL2/T08nu4yuLwDPnvEGirn6B3Yw
         zfuUXB/gqq6lNXiksZzL224kReXPtAJI4gFujmhe2ttdg+L857aS1ShRkxWFmwrSlQjD
         J3FQ==
X-Forwarded-Encrypted: i=1; AL+hErEfgSX+70X3YnQ5soYVdTYP+5WS1YOjdK9vcV64cDKr5rQYXhgTM8weQTkbq0zgn/ngPY4x@lists.linux.dev
X-Gm-Message-State: APuU4Z/Xbjmb7+mP3+S088sdTBxsfSopxJamZWCpaTpozxrHLB0cvgY7
	HIkxvh8/MPEyn8Jy7YWTz0EL5mGtx+SQIwriJGAIoSVFiGw2ZEu0sr3LaY5xRPgcoiqFy6pg979
	Cj8UVdNIp6J/mF8Q7QVTneKmAvPZEOfwwExQjE7d3UkZkB+9uP6Zp12g=
X-Gm-Gg: AZFdTZfGlgtm9MEuMR3St9hkiUaSprwXmBOAy0aOkha63mPptr2+AXwIgJm85HtjVEW
	yQgevUmlIq4ehhQAJykW/5FReAdjKTjUAeZeTkIbzDFtjsAYMAZDboGZJtKVJcxC41d4lHClcze
	ZsFajwutxfT3Z23NvkkTOVC/cTCkOrfzUiI9QDt+i6LaMOqS9GwMGhLKZSXhpOgeoeggeCeI38M
	NJCLrwz3xjqjR0juF0JNTUgc0ENR76thX+Dw7umGaIZ1gkNve1vVFAvy/bcnUIfukP8x27CGfb4
	njcYyTGvwxVe9MjSR6Drj+8kd675LR/JYimZTwNiiklihbkkLDbC8xd3wvdy3sPSvsUACQl3djf
	g2yCM8Vo8gwaSVHpFZ4F+QdkNWR2v5yP65DbqPjnvai3Cxu+R0Xn0wYfbHK7WGE5seENwIsuRMy
	eFJZuSAqvxjjM9ytg8dB88bjDNqijkbk/hFKeFs7F6Ms1Jop9AVac362rNecanNbiyp1AFbfA=
X-Received: by 2002:a05:6214:6014:b0:921:2e2d:2a7f with SMTP id 6a1803df08f44-92134aaeb70mr5411536d6.14.1795111848990;
        Thu, 19 Nov 2026 10:10:48 -0800 (PST)
X-Received: by 2002:a05:6214:6014:b0:921:2e2d:2a7f with SMTP id 6a1803df08f44-92134aaeb70mr5411016d6.14.1795111848224;
        Thu, 19 Nov 2026 10:10:48 -0800 (PST)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349f8c34sm5127806d6.32.2026.11.19.10.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:10:47 -0800 (PST)
Message-ID: <89162d17096ddf7d4ca98a087f1517bcfb935869.camel@redhat.com>
Subject: Re: [PATCH] scsi: mpi3mr: Fix start_time and error return in
 mpi3mr_bring_ioc_ready()
From: Laurence Oberman <loberman@redhat.com>
To: Ian Rogers <irogers@google.com>, Sathya Prakash Veerichetty	
 <sathya.prakash@broadcom.com>, Kashyap Desai <kashyap.desai@broadcom.com>, 
 Sumit Saxena <sumit.saxena@broadcom.com>, Sreekanth Reddy
 <sreekanth.reddy@broadcom.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <mkp@kernel.org>
Cc: mpi3mr-linuxdrv.pdl@broadcom.com, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Elkin Cruz
 <elkin@google.com>
Date: Thu, 19 Nov 2026 13:10:46 -0500
In-Reply-To: <20261119170900.1530138-1-irogers@google.com>
References: <20261119170900.1530138-1-irogers@google.com>
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3f3ijS5WWG9-1y5iVwnUmu89ZRaVVbP2T2p7ghCRN-0_1795111849
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-11-19 at 09:09 -0800, Ian Rogers wrote:
> mpi3mr_bring_ioc_ready() has three bugs in its failure and retry
> handling:
>=20
> 1. start_time is only assigned after MPI3_SYSIF_IOC_CONFIG_ENABLE_IOC
> =C2=A0=C2=A0 when retry =3D=3D 0, after three earlier 'goto out_failed' p=
aths. If
> =C2=A0=C2=A0 soft reset, reset-state polling, or admin queue setup fails =
on the
> =C2=A0=C2=A0 first attempt, out_failed computes elapsed_time_sec from an
> =C2=A0=C2=A0 uninitialized start_time, and if a retry occurs (retry =3D=
=3D 1),
> =C2=A0=C2=A0 start_time remains uninitialized for the ready-polling loop =
as
> well.
>=20
> 2. In 'elapsed_time_sec < (mrioc->ready_timeout - 60)', ready_timeout
> =C2=A0=C2=A0 is u32, so values below 60 wrap around in 32-bit unsigned
> arithmetic
> =C2=A0=C2=A0 before zero-extending to u64, spuriously retrying past the
> timeout.
>=20
> 3. After mpi3mr_setup_admin_qpair() sets retval =3D 0 (or on entry
> where
> =C2=A0=C2=A0 retval is initialized to 0), controller fault/reset-history
> checks,
> =C2=A0=C2=A0 ready-state timeouts, and early unrecoverable or device-not-
> present
> =C2=A0=C2=A0 exits return retval =3D=3D 0 (success) to mpi3mr_init_ioc() =
and
> =C2=A0=C2=A0 mpi3mr_reinit_ioc() even though controller bringup failed.
>=20
> Initialize start_time =3D jiffies at function entry for pre-enable
> failure
> exits, reset start_time =3D jiffies the first time
> MPI3_SYSIF_IOC_CONFIG_ENABLE_IOC is written so pre-enable waits do
> not
> drain ready_timeout, rewrite the retry window check as
> 'elapsed_time_sec + 60 < mrioc->ready_timeout', and ensure retval =3D -
> 1
> on all failure exits.
>=20
> Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
> build. Verified by building drivers/scsi/mpi3mr/mpi3mr_fw.o with
> LLVM=3D1 W=3D1 (-Werror) and -Wconditional-uninitialized, and with a
> standalone C logic reproducer under ASan/UBSan; not runtime-tested on
> physical MPI3 hardware.
>=20
> Fixes: 59bd9cfe3fa0 ("scsi: mpi3mr: Code refactor of IOC init -
> part2")
> Fixes: 0a319f162949 ("scsi: mpi3mr: Wait for diagnostic save during
> controller init")
> Fixes: 9634bb07083c ("scsi: mpi3mr: Enhance the Enable Controller
> retry logic")
> Fixes: 4616a4b3cb8a ("scsi: mpi3mr: Improve wait logic while
> controller transitions to READY state")
> Fixes: fb6eb98f3965 ("scsi: mpi3mr: Handling of fault code for
> insufficient power")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
> =C2=A0drivers/scsi/mpi3mr/mpi3mr_fw.c | 14 +++++++++++---
> =C2=A01 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/scsi/mpi3mr/mpi3mr_fw.c
> b/drivers/scsi/mpi3mr/mpi3mr_fw.c
> index f0d3cd398dd0..b92b2467e995 100644
> --- a/drivers/scsi/mpi3mr/mpi3mr_fw.c
> +++ b/drivers/scsi/mpi3mr/mpi3mr_fw.c
> @@ -1582,8 +1582,9 @@ static int mpi3mr_bring_ioc_ready(struct
> mpi3mr_ioc *mrioc)
> =C2=A0=09int retval =3D 0;
> =C2=A0=09enum mpi3mr_iocstate ioc_state;
> =C2=A0=09u64 base_info;
> +=09bool enable_started =3D false;
> =C2=A0=09u8 retry =3D 0;
> -=09u64 start_time, elapsed_time_sec;
> +=09u64 start_time =3D jiffies, elapsed_time_sec;
> =C2=A0
> =C2=A0retry_bring_ioc_ready:
> =C2=A0
> @@ -1595,6 +1596,7 @@ static int mpi3mr_bring_ioc_ready(struct
> mpi3mr_ioc *mrioc)
> =C2=A0
> =C2=A0=09if (!mpi3mr_is_fault_recoverable(mrioc)) {
> =C2=A0=09=09mrioc->unrecoverable =3D 1;
> +=09=09retval =3D -1;
> =C2=A0=09=09goto out_device_not_present;
> =C2=A0=09}
> =C2=A0
> @@ -1621,6 +1623,7 @@ static int mpi3mr_bring_ioc_ready(struct
> mpi3mr_ioc *mrioc)
> =C2=A0=09=09if (!pci_device_is_present(mrioc->pdev)) {
> =C2=A0=09=09=09mrioc->unrecoverable =3D 1;
> =C2=A0=09=09=09ioc_err(mrioc, "controller is not present
> while waiting to reset\n");
> +=09=09=09retval =3D -1;
> =C2=A0=09=09=09goto out_device_not_present;
> =C2=A0=09=09}
> =C2=A0
> @@ -1654,6 +1657,7 @@ static int mpi3mr_bring_ioc_ready(struct
> mpi3mr_ioc *mrioc)
> =C2=A0=09=09=09=09if (!pci_device_is_present(mrioc-
> >pdev)) {
> =C2=A0=09=09=09=09=09mrioc->unrecoverable =3D 1;
> =C2=A0=09=09=09=09=09ioc_err(mrioc, "controller
> is not present at the bringup\n");
> +=09=09=09=09=09retval =3D -1;
> =C2=A0=09=09=09=09=09goto out_device_not_present;
> =C2=A0=09=09=09=09}
> =C2=A0=09=09=09=09msleep(100);
> @@ -1690,8 +1694,10 @@ static int mpi3mr_bring_ioc_ready(struct
> mpi3mr_ioc *mrioc)
> =C2=A0=09ioc_config |=3D MPI3_SYSIF_IOC_CONFIG_ENABLE_IOC;
> =C2=A0=09writel(ioc_config, &mrioc->sysif_regs->ioc_configuration);
> =C2=A0
> -=09if (retry =3D=3D 0)
> +=09if (!enable_started) {
> =C2=A0=09=09start_time =3D jiffies;
> +=09=09enable_started =3D true;
> +=09}
> =C2=A0
> =C2=A0=09timeout =3D mrioc->ready_timeout * 10;
> =C2=A0=09do {
> @@ -1731,7 +1737,7 @@ static int mpi3mr_bring_ioc_ready(struct
> mpi3mr_ioc *mrioc)
> =C2=A0
> =C2=A0out_failed:
> =C2=A0=09elapsed_time_sec =3D jiffies_to_msecs(jiffies -
> start_time)/1000;
> -=09if ((retry < 2) && (elapsed_time_sec < (mrioc->ready_timeout
> - 60))) {
> +=09if (retry < 2 && elapsed_time_sec + 60 < mrioc-
> >ready_timeout) {
> =C2=A0=09=09retry++;
> =C2=A0
> =C2=A0=09=09ioc_warn(mrioc, "retrying to bring IOC ready,
> retry_count:%d\n"
> @@ -1739,6 +1745,8 @@ static int mpi3mr_bring_ioc_ready(struct
> mpi3mr_ioc *mrioc)
> =C2=A0
> =C2=A0=09=09goto retry_bring_ioc_ready;
> =C2=A0=09}
> +=09if (!retval)
> +=09=09retval =3D -1;
> =C2=A0=09ioc_state =3D mpi3mr_get_iocstate(mrioc);
> =C2=A0=09ioc_err(mrioc,
> =C2=A0=09=C2=A0=C2=A0=C2=A0 "failed to bring to ready state,=C2=A0 curren=
t state: %s\n",

Hello Ian

Thanks for this. I checked it against current mainline and all three
issues are real. Some comments below.

> 3. After mpi3mr_setup_admin_qpair() sets retval =3D 0 (or on entry
where
>    retval is initialized to 0), controller fault/reset-history
checks,
>    ready-state timeouts, and early unrecoverable or device-not-
present
>    exits return retval =3D=3D 0 (success) to mpi3mr_init_ioc() and
>    mpi3mr_reinit_ioc() even though controller bringup failed.

This is the most serious of the three. Both callers only check
"if (retval)", so with the !mpi3mr_is_fault_recoverable() exit we can
set mrioc->unrecoverable =3D 1 and still report success, and init then
carries on against a dead controller.

> 2. In 'elapsed_time_sec < (mrioc->ready_timeout - 60)', ready_timeout
>    is u32, so values below 60 wrap around in 32-bit unsigned
arithmetic
>    before zero-extending to u64, spuriously retrying past the
timeout.

Agreed that the arithmetic is wrong, but note the fix changes behavior:
today any firmware advertising a ready timeout below 60s always gets
its two retries; after this patch it gets none.

Sathya/Sreekanth, can you confirm whether any shipping MPI3
firmware reports a ready timeout under 60 seconds, and if so whether
dropping the retries entirely is the intended behavior?

> Initialize start_time =3D jiffies at function entry for pre-enable
failure
> exits, reset start_time =3D jiffies the first time
> MPI3_SYSIF_IOC_CONFIG_ENABLE_IOC is written so pre-enable waits do
not
> drain ready_timeout, rewrite the retry window check as
> 'elapsed_time_sec + 60 < mrioc->ready_timeout', and ensure retval =3D -
1
> on all failure exits.

Would you consider splitting this into three patches, one per issue,
each with only its own Fixes: tag? The retval fix stands on its own
and is the one stable and distro kernels will want first; the
ready_timeout change may need to wait for Broadcom's answer above.
Five Fixes: tags across different commits on one patch also makes
backporting harder.

> Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
> build. Verified by building drivers/scsi/mpi3mr/mpi3mr_fw.o with
> LLVM=3D1 W=3D1 (-Werror) and -Wconditional-uninitialized, and with a
> standalone C logic reproducer under ASan/UBSan; not runtime-tested on
> physical MPI3 hardware.

I have access to mpi3mr hardware and can run normal bring-up,
controller reset and host-reset reinit on a v2 to make sure the good
path does not regress, and will send a Tested-by.

With the split, for the retval and start_time fixes:

Reviewed-by: Laurence Oberman <loberman@redhat.com>

Regards
Laurence


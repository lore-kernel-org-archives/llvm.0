Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795206659;
	b=UKgDlppqjzTM12LsG3S2+ojtGBgHvD7K4jsOrYfh5zun76mYYxM8CO9eOy/a2qEexbhs
	 OBwqF/kpceOE8iM8UzOLDU/QHakyc6bq0gqSCTTUSJzYKZAaH/oXtTZ8dyd0ky3zFh2w2
	 UUizOV9c6+N3iEPO5gpO19whE9EzGEeeD0GUsdsqcnT+ATYlm/iLhLOZwlDqmqRO0k2we
	 rJeoQ2XI0qC6Dkppe3kwNoQMGYnjLSL79FUG80AwAWoZ/aUcXJaJHbtw+QbdKG8mtA1NC
	 h1EErSTZtUl9D0/lpNnXi2MOUa+tyTTrOJrijpekVQWZNvnKrpeD33dCw6d0Mk770bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206659;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:User-Agent:MIME-Version:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=mx8lv7UCTvTnaJ2WerqoFZH52wwM+hfy6gTfkRrFF10=;
	b=Qg8CVwWKnA5zey6q9yUNtbVNnaVETNaNAJw2ooGLUC0oVSPHSwbYN2txb5dk2jPWG75z
	 iUtHpAD3GaczUVyeJWK0fMxMMpS80CZI63NBAs8BSBkQm7ykh8Pfu1DOO12Llj/anbswP
	 mL3O3/uAxoHhnVpL0s2+8vROfuCHJ4a+n6uWYVStfm+SMo8ZFQi+SqLT0e34jYgoux7yR
	 Glxm8Eu6347Gy79bySMHXHohQyPEvPXc6MS9uN6AJE+39QmpAPjFBwu2KtFWBw8OYHoXn
	 yzXVLf4lprNhGLfgKzYP9GDgMsuvSk4LusNd/Oddt/kcMpUHXofmg435kpFbnts11uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L2uoEwzH;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BB8606A6FD
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 20:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64BB8606A6FD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L2uoEwzH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795206647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mx8lv7UCTvTnaJ2WerqoFZH52wwM+hfy6gTfkRrFF10=;
	b=L2uoEwzHjf/t2WhpJEO71ibUbxoEcxEEIxYLwyiTfxZ6qTnO0txlJMIONLr1ccSBKkKSa3
	+IpUPV5yo9XuY3AG//IuWEO+jrFt7PwudWXSFETSddOul8CbBTurYSGncGv7FnUBFPLCmA
	RIXaCu3wt4+UvTYUpdjDjoPvRc6Khyw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-NmFVsZXLNvCgKtwkQz6ejA-1; Fri, 20 Nov 2026 20:30:44 +0000
X-MC-Unique: NmFVsZXLNvCgKtwkQz6ejA-1
X-Mimecast-MFC-AGG-ID: NmFVsZXLNvCgKtwkQz6ejA_1795206644
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-544019b1831so26373481cf.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 12:30:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795206644; x=1795811444;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mx8lv7UCTvTnaJ2WerqoFZH52wwM+hfy6gTfkRrFF10=;
        b=mplxIzVAUwUjRKyTAIyrxXIj/o/5Z7yehuylLKJVkYm5a6Vg1RU6MRbmrTGI725LI2
         fBDDirB46/elbfAVSWrbKOk3yHBuiRAFpTXBRajvSWOa0yQJnA2VGwtg+N1NIR0Yfq4k
         tGXRCtHUe4D3ebVoRmqC6WLjMFB8kUzCvXQFRsjJjIGChXuu88jYagvtpki/6SMMOT8d
         KoKJ2busWY0DE9z0lCXpqA65oS1qbgNmltNrhO9UZ0MKhU9n318t3VeBfOiBp8yO1wnp
         qGx7jtjbqiJCAkYBnmVqLFB0ZjrG8Ybh2K6tYshkppmvNb73GvFJmqa0hK05gdoKxNb8
         kH2Q==
X-Forwarded-Encrypted: i=1; AL+hErFzlxp933e+DNjVRD87sNagNnjGJjxJ08jUvWXSwlANbK7pDj9goaBnG3KIuxnp0xLkloB6@lists.linux.dev
X-Gm-Message-State: APuU4Z+hLXjQ3NNyyBMz1dp1Z2JvLGJdIuJWGOX2DBdCzH2KyJPeHekz
	CKLG66CIRKuORiJJHRDkJ+MQOup4jnavvJTT2jG1pRF2TavypOMgkW0lzPQ22ogpLvivHyhVeOl
	uy8dfgsT/ddNRNwaNFwkdajCLtV3b8V13eGG4xguP1cpRxzvRDrzDMfE=
X-Gm-Gg: AYBFou33y0ZtdOO5ykoywhRAHl55KE6sqKmLOLPYKb3s4qMIlXeoVpCav9lIVvTyjXd
	ruySMgJanVdd37Z1T8wEA3tWrIANohtgxXdbnDwmtcVXdGITJLJvH/9+M2YRq+GFP9SskxmJrWT
	quOkawF8PxzBrMldouIDArbTArDcDNKIXnyyRLb3YwvxZPqoBwpF1btpHdtFY1gYuCCpxhDcp+p
	gNTems2CN/oEfS7FsUsfj7VZsCt6RMY/RbXk2BLaaucQCV07Khu0nYKM9Xqav0k5ZMAQscqzwiI
	q8+2jYQlYhyOv9sJvcjbIroX3JjIMXWGnkDezq10z0/QzvEpS6hI9nhmqRJhxdSE6Qdr/naF32Q
	HltuMnPRvKjQ2DvXRtwho+gYygGrRLQzMrUieiEpMS0JKHGEOMJI53KCZVZi2g2bmdW2bwrwJCp
	AxRK+0PiGup2H/6tH51Dvvnm/ojZdExuPrVtaJu09s2+eWmEIohhgXeIoGKFLe124S8a9asfA=
X-Received: by 2002:a05:622a:4d93:b0:55d:2e93:ffad with SMTP id d75a77b69052e-55d76ac5898mr77806231cf.37.1795206644047;
        Fri, 20 Nov 2026 12:30:44 -0800 (PST)
X-Received: by 2002:a05:622a:4d93:b0:55d:2e93:ffad with SMTP id d75a77b69052e-55d76ac5898mr77805261cf.37.1795206643352;
        Fri, 20 Nov 2026 12:30:43 -0800 (PST)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm34804246d6.1.2026.11.20.12.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:30:42 -0800 (PST)
Message-ID: <4569fb5f7f3d7c65263d4154d7cc3350d9cf8330.camel@redhat.com>
Subject: Re: [PATCH v2 0/3] scsi: mpi3mr: Fix error return, start_time, and
 timeout check in mpi3mr_bring_ioc_ready()
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
Date: Fri, 20 Nov 2026 15:30:41 -0500
In-Reply-To: <20261120190031.1587531-1-irogers@google.com>
References: <20261120190031.1587531-1-irogers@google.com>
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
X-Mimecast-MFC-PROC-ID: 1YePdFBC1ZCPtSCCyaxiWfutf2ToXQYYoAmDejhLLO4_1795206644
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-11-20 at 11:00 -0800, Ian Rogers wrote:
> Split the mpi3mr_bring_ioc_ready() error-handling and retry fixes
> into
> three independent patches with individual Fixes: tags as requested by
> Laurence Oberman:
>=20
> 1. Return -1 instead of 0 on failure exits in
> mpi3mr_bring_ioc_ready()
> =C2=A0=C2=A0 when retval is 0 (such as unrecoverable controller faults, h=
ot-
> unplug
> =C2=A0=C2=A0 during reset/diag-save waits, or ready-state faults and time=
outs
> =C2=A0=C2=A0 after mpi3mr_setup_admin_qpair() sets retval =3D 0).
> 2. Initialize start_time =3D jiffies on entry and guard the post-enable
> =C2=A0=C2=A0 timestamp reset with a boolean flag so pre-enable failures a=
nd
> =C2=A0=C2=A0 subsequent retries never read an uninitialized start_time.
> 3. Rewrite 'elapsed_time_sec < (mrioc->ready_timeout - 60)' as
> =C2=A0=C2=A0 'elapsed_time_sec + 60 < mrioc->ready_timeout' to avoid 32-b=
it
> =C2=A0=C2=A0 unsigned underflow if a controller reports ready_timeout < 6=
0.
>=20
> v2:
> =C2=A0 - Split v1 into three patches, each with its own Fixes: tag
> (Laurence
> =C2=A0=C2=A0=C2=A0 Oberman).
> =C2=A0 - Move 'if (!retval) retval =3D -1;' to 'out_device_not_present:' =
in
> =C2=A0=C2=A0=C2=A0 patch 1 so a single hunk covers both out_failed fallth=
roughs and
> =C2=A0=C2=A0=C2=A0 early out_device_not_present jumps cleanly for stable =
backports.
> =C2=A0 - Add Laurence's Reviewed-by tag on patches 1 and 2, and note the
> =C2=A0=C2=A0=C2=A0 510s (570s - 60s) firmware timeout math from commit 96=
34bb07083c
> in
> =C2=A0=C2=A0=C2=A0 patch 3.
>=20
> v1:
> https://lore.kernel.org/r/20261119170900.1530138-1-irogers@google.com
>=20
> Ian Rogers (3):
> =C2=A0 scsi: mpi3mr: Return error on all failure exits in
> =C2=A0=C2=A0=C2=A0 mpi3mr_bring_ioc_ready()
> =C2=A0 scsi: mpi3mr: Initialize start_time on all paths in
> =C2=A0=C2=A0=C2=A0 mpi3mr_bring_ioc_ready()
> =C2=A0 scsi: mpi3mr: Avoid ready_timeout underflow in
> =C2=A0=C2=A0=C2=A0 mpi3mr_bring_ioc_ready()
>=20
> =C2=A0drivers/scsi/mpi3mr/mpi3mr_fw.c | 11 ++++++++---
> =C2=A01 file changed, 8 insertions(+), 3 deletions(-)

Hello Ian

Thanks for the quick v2. Tested the series on 7.4.0-rc1 with a
Broadcom SAS40xx/41xx (FW 8.5.1.0.0.1), two SAS disks attached.

Firmware advertises "ready timeout: 510 seconds" (ioc_info
0xff000000), before and after the series.

Tests, all with mpi3mr_bring_ioc_ready() reaching ready on the first
attempt and no "retrying to bring IOC ready" or "failed to bring"
messages:

 - boot probe
 - modprobe -r / modprobe (mpi3mr_init_ioc path)
 - sg_reset -H under fio 4k randread QD32 (mpi3mr_reinit_ioc path);
   host reset completed in ~45s including diag save and port enable,
   fio completed with no errors
 - PCI remove/rescan of the controller
 - 20 iterations of reload + host reset under fio: 40 successful
   ready transitions, no retries, no failures, no fio errors

The failure paths themselves were not exercised, as they are hard to
trigger on healthy hardware; this confirms no regression on the good
path.

Minor, 3/3 changelog: the IOC info timeout field is 8 bits in 2s
units, so ready_timeout tops out at 510s and the retry window at 450s;
the "510 seconds" in 9634bb07083c most likely refers to the maximum
ready timeout rather than the retry cap, so 570s cannot be advertised.
Doesn't affect the code change. Martin may be able to fix it up on
apply.

The question to Broadcom on firmware advertising ready_timeout < 60
is still open for 3/3; on this controller it makes no difference.

For the series:

Tested-by: Laurence Oberman <loberman@redhat.com>

Regards
Laurence


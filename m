Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE50F329C45
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 20:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762804824; cv=none; b=RJEwz7E/pFnkj+7ko6oEoDqSHP0TIDGI8rzp9hIu6d3u/NpY3AOIxduLHAX9vXrJB1/1+iQSCtIsnlfjcPcAxNTr3BwSDssSixllCmGCjr6TFty7X7TtN5StBhwpC0mK3t4h4+NzEJwVfWAmu126dURJSnN8VbFWhAsjTjD4vlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762804824; c=relaxed/simple;
	bh=zcdFR4zEaHAMDLPFj+HUILSwXKAEiJgNobQnWMf90EE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNTetKsF2iNDbk+rrLl+bJe5jtyhjv8ye7juqUdJS1d2dNN1PC1Ywl1TJmIX5C6jjdZFT399FY2BAveILt0sanaQosdAYW9mtCS5uKMlmo1/ahftuGbvYQHRFzA++LmmtK1JM4seaY+HKXc8PHirXHga8T40vkx1iX39WunGFuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HSyY5wen; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HSyY5wen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762804820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LPlXcM2TXZ28oMJMDNj38NBq4Bia9yji9rEj+Y+MXL0=;
	b=HSyY5wenAfljeVtE6i8lJ1FZd/MfivJkwDipDnXx/52/7nWDSZZuJ7N0ciQHhr686v/9Sq
	i7n7DevMs2OFSzSpgSftVaNlnL/reVTKmhqYDFVnaJC0UpcPqReX/YOFrbYH/rc8MQeIgA
	0SCA4nd6ZXSRhMjB2syM0CyTR5Tlxj0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-zu2X95JKP0KqSvcEh7L3pg-1; Mon, 10 Nov 2025 15:00:19 -0500
X-MC-Unique: zu2X95JKP0KqSvcEh7L3pg-1
X-Mimecast-MFC-AGG-ID: zu2X95JKP0KqSvcEh7L3pg_1762804818
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3416dc5752aso8348272a91.1
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 12:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762804818; x=1763409618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LPlXcM2TXZ28oMJMDNj38NBq4Bia9yji9rEj+Y+MXL0=;
        b=TMDggFrtICATpzFpXp921Y0TWoDIe1jBrTtjzC0epBXF3mK/fs/Q+9+Wx3BupFtxMt
         lxRLAkRIanXgCe4f7BNcbUe5ofI2BWY/7EfAZzTnym9oP/Pusk29TA5G5YoPn+xb+qt9
         lT5hB+3+t1bJBJFSM4DgiLpJg4jdqOXakUNcigc+An1Blk0cdum5/3jR4kMd/AII8NWa
         GNLURfxjPRW9oVAKXS25HIR7a8ws8SU2Z87VORuwlWuznhTjP3U6rpRutqbVhM4nVDcg
         8n8lciX+VP+6f9l3QQmZP62XvHr6D71HcbC79WaqdMSZibFu3BP5iJxuVagQYIN5hJIp
         vL7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWf2euRiyTZXQUTAlnTJkx4yAEwn0toR09gi+vdHGwoPjSEoECCngf1GRHAEZNncI6FWPch@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3/ETug/0F2MgzaTgKTIu6QxzRCJv69G7yUHZ35ob+BwIr2eAf
	qQDnvx1PfJSYbNX7H/y1h50E3b/6Fy1DwH1u4wywkCjQK2P+vaaJDYmd2YeFxbStd+MFQvaRJ4l
	N3AELn7bbT6sFXkequxECqgGxY8h8kNz/p076IHx+9QeOH2N3hw4/e9NkP70a+uZhHx4Kxw7xuM
	E8o+dUp0Uv/3tw38LpQS2Io8swEzhLbSYa6Q8o8Q==
X-Gm-Gg: ASbGncswpPvxbR/m8UDf8/cr/9668sfwCWmMr5VJnvLSGoWN2KE9K2DycH77g4Ct7vA
	OtwXm7lwN8OKCNdvj04MJmnMIUSZku9tOm9qzu0WwUg+HrZB4FbNIY+VTqt59EX/218M0Vk+Ltc
	NtOpobgEAJPcUY2YfUnKKmrCsfivPGdCMZ2A4w27Ip7ECWXVn/rT7/EtM=
X-Received: by 2002:a17:90b:35c6:b0:340:dd2c:a3f5 with SMTP id 98e67ed59e1d1-3436cb22be6mr10884383a91.3.1762804818122;
        Mon, 10 Nov 2025 12:00:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb+bxxFY9OWpl3OFV8BnoluTx7SV2gRJxCLgMj57gkggbCR2gb9gdx/qVop9Ke2skamLq294H1NixnZqF8zVQ=
X-Received: by 2002:a17:90b:35c6:b0:340:dd2c:a3f5 with SMTP id
 98e67ed59e1d1-3436cb22be6mr10884348a91.3.1762804817633; Mon, 10 Nov 2025
 12:00:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251110144404.369928-1-andriy.shevchenko@linux.intel.com>
 <9f7339a71c281e9f9e5b1ff34f7c277f62c89a69.camel@ibm.com> <CAJ4mKGYPoxPS62yFigmqFPPTHOSwgtj+WKwEtdpNGsu3BJya3w@mail.gmail.com>
 <01593a9ca971421a39c483819855d41c251da905.camel@ibm.com>
In-Reply-To: <01593a9ca971421a39c483819855d41c251da905.camel@ibm.com>
From: Gregory Farnum <gfarnum@redhat.com>
Date: Mon, 10 Nov 2025 12:00:06 -0800
X-Gm-Features: AWmQ_bkLhINwAMY_PPv_LXya3jPoLyDARUiNgeAe2clS2vVBulPodTBPVrixOB4
Message-ID: <CAJ4mKGbrXjC=kX5YDsX=RZUw6mK0PVPiinVsujhp+XfPVsrVVg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ceph: Amend checking to fix `make W=1` build breakage
To: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Cc: Xiubo Li <xiubli@redhat.com>, "justinstitt@google.com" <justinstitt@google.com>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nathan@kernel.org" <nathan@kernel.org>, 
	"morbo@google.com" <morbo@google.com>, "idryomov@gmail.com" <idryomov@gmail.com>, 
	"nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>, 
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PDzPn5WraZ8PiEF36L-EhCQhxOGHtJNLDt8LCSAckRA_1762804818
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 11:57=E2=80=AFAM Viacheslav Dubeyko
<Slava.Dubeyko@ibm.com> wrote:
>
> On Mon, 2025-11-10 at 11:48 -0800, Gregory Farnum wrote:
> > On Mon, Nov 10, 2025 at 11:42=E2=80=AFAM Viacheslav Dubeyko
> > <Slava.Dubeyko@ibm.com> wrote:
> > >
> > > On Mon, 2025-11-10 at 15:44 +0100, Andy Shevchenko wrote:
> > > > In a few cases the code compares 32-bit value to a SIZE_MAX derived
> > > > constant which is much higher than that value on 64-bit platforms,
> > > > Clang, in particular, is not happy about this
> > > >
> > > > fs/ceph/snap.c:377:10: error: result of comparison of constant 2305=
843009213693948 with expression of type 'u32' (aka 'unsigned int') is alway=
s false [-Werror,-Wtautological-constant-out-of-range-compare]
> > > >   377 |         if (num > (SIZE_MAX - sizeof(*snapc)) / sizeof(u64)=
)
> > > >       |             ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >
> > > > Fix this by casting to size_t. Note, that possible replacement of S=
IZE_MAX
> > > > by U32_MAX may lead to the behaviour changes on the corner cases.
> > > >
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > ---
> > > >  fs/ceph/snap.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/fs/ceph/snap.c b/fs/ceph/snap.c
> > > > index c65f2b202b2b..521507ea8260 100644
> > > > --- a/fs/ceph/snap.c
> > > > +++ b/fs/ceph/snap.c
> > > > @@ -374,7 +374,7 @@ static int build_snap_context(struct ceph_mds_c=
lient *mdsc,
> > > >
> > > >       /* alloc new snap context */
> > > >       err =3D -ENOMEM;
> > > > -     if (num > (SIZE_MAX - sizeof(*snapc)) / sizeof(u64))
> > > > +     if ((size_t)num > (SIZE_MAX - sizeof(*snapc)) / sizeof(u64))
> > >
> > > The same question is here. Does it makes sense to declare num as size=
_t? Could
> > > it be more clean solution? Or could it introduce another warnings/err=
ors?
> >
> > Given that the number of snaps is constrained over the wire as a
> > 32-bit integer, you probably want to keep that mapping...(Though I
> > guess it's the sum of two 32-bit integers which technically could
> > overflow, and I'm not sure what happens if you actually hit those
> > boundaries on the server =E2=80=94 but nobody generates snapshots on th=
e same
> > file in that quantity).
> >
> > All that said, it'd be kind of nice if we could just annotate for
> > clang that we are perfectly happy for the evaluation to always be true
> > on a 64-bit architecture (as snapids are 64 bits, we will always be
> > able to count them).
>
> So, are you suggesting to declare num as u64 here? Am I correct?

What? No, the whole point of this block is checking that it can track
all the snapshots and allocate them (on a <32-bit architecture, which
are the only ones at risk), isn't it?


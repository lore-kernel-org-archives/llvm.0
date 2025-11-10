Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C238933B6DC
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 19:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762804154; cv=none; b=k2ffGJRWEdsBOM0wWPYJVkzIIDJI0lVh9JcaQCYvljuHowulZboQ9R55JkVK6n81If1ULfbhSjKCwQ/Z8bYogcam17h5cOA27hdDcSW+z+kinwXakXwA3UBZ+9vosANuAKOLberHJlGqrcU6lL4Nd9FOZOnaQ1+r1NP/HwsMDdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762804154; c=relaxed/simple;
	bh=xKxyNxQEbkwLV73VAK1IAAduVglv/ftuHSgoRB72B3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbWrWJ1UV7dg+TZvro/UwuIdh6oZatc8ZRXTLzeM/I6Y4vxBlHajnF+/u8g3FR36a6/pSXQQhoqqf1KsuCgPpP7iBhrUzcJE9t4QNQ06veWqu/LhnShzMOTXaBJOGWLOlA3v5dNM+8IqrVVK/a2bukbkOJIn+alNyHWgbetRzQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UqGRM6j3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UqGRM6j3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762804151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OsC4OIMe3gmRmvlNNFpXstoVUqeEj0XTO2Zj29ABnBo=;
	b=UqGRM6j3cScTX3dZCCqvGUeHhsKN0uahJVGNJdsuRUnRejKI2kIdYAdVCFpV62grt3oDSX
	lhxsRVnslvSNN92NT671c/Kjgtg9GLUXr8VCpONshEhWLHvxKFTuQAX/hOm5qj8eJtcEs4
	9l32huQpRW89p4optjuX7HbIiTGfRWw=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-p64fO8j3M56flRLBvCVeqw-1; Mon, 10 Nov 2025 14:49:10 -0500
X-MC-Unique: p64fO8j3M56flRLBvCVeqw-1
X-Mimecast-MFC-AGG-ID: p64fO8j3M56flRLBvCVeqw_1762804149
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34378c914b4so2501561a91.1
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 11:49:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762804149; x=1763408949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OsC4OIMe3gmRmvlNNFpXstoVUqeEj0XTO2Zj29ABnBo=;
        b=E1yrI+2BmY3+s1ZgqnfmAs2EwloUGov/VQJy8nH9eaCRnW5UTf5biI1mwfhOPRQ8VG
         o79f2c3obyOuyv7FEoK4mCbpzDgZH2JW2GpA+6Y/D8MdWq3TUwt2bPaumDVHBuzKsv6i
         ijY279Xhz/40Q/iCm7CZuGuwEZB4CEEyd1vuOVxSjkJp3iKENC7FfjVG998KBxov7QiF
         /3f4WMqc9gpbqED/Kuk6IfG4w1TPEfLtKMvrRG9ryF6MtoySYjDZpp2QmPKqIQCkntwC
         X/KbVCjoTitfEqLF6S+GucO6fnNMvaIvM7DT/lKL0F4nt7q2d05AQn4dfZzUe9Uh36q9
         whQg==
X-Forwarded-Encrypted: i=1; AJvYcCXMpIGTd6VjuiHonvfTm5rBBBGBEEvl2XV5kNHGh01qDmeTDhf2d55mw3kG3JCJ+weBUkDm@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8SNUEsi4DSK+pB/fyu3UoVI8NA4UG2tX7k5BHEZNNOv2DLUny
	v4IDiUn2c6U3rt9PuFTqR/KvHoos3kgnDHeYdu6hf7wlQOW61SB7OL8HfvwACpeIf7VCaeBHeYD
	+vum+2hbCBGIJCJbpy1Jlg0Lz/4vX6+nNtcEfdDIIlOBg4JiOnhrklS1YgBBx8GD+9BtMLf1rKp
	m6nan1hLkeLkK8iUas4DcGDtrTPFV7Mg==
X-Gm-Gg: ASbGncvp1CrfremGCSjW0MAtRh52A/H2rXGKk6J8xP+NS8KFJ3nLHZdT5BE1O4JHK8+
	89vbGyg8sVFrdbxHNMo4ctO7ypPnz39hELR530zqX15bj7xGei1I0+9kEuqXrwbz3XOUMueOMhD
	dmCbBxjsB9sZgZWd2aR2DtSQNUe2T0GoHt6YMLMjkHvCZz8Owm1hXs4Bg=
X-Received: by 2002:a17:90b:1809:b0:341:88ba:bdd9 with SMTP id 98e67ed59e1d1-3436ccfe206mr10197970a91.25.1762804149254;
        Mon, 10 Nov 2025 11:49:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDDdLvizeyNG51jHfQSI5Ft2PD8gmaHQ8j7PSR+JdRkj+cOLe0GAfm6pJ08Cn2rdWSSBdvGCzHpukYt7r3jWQ=
X-Received: by 2002:a17:90b:1809:b0:341:88ba:bdd9 with SMTP id
 98e67ed59e1d1-3436ccfe206mr10197957a91.25.1762804148890; Mon, 10 Nov 2025
 11:49:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251110144404.369928-1-andriy.shevchenko@linux.intel.com> <9f7339a71c281e9f9e5b1ff34f7c277f62c89a69.camel@ibm.com>
In-Reply-To: <9f7339a71c281e9f9e5b1ff34f7c277f62c89a69.camel@ibm.com>
From: Gregory Farnum <gfarnum@redhat.com>
Date: Mon, 10 Nov 2025 11:48:57 -0800
X-Gm-Features: AWmQ_bmfM-1dFi4Eh7we5WOp65_WNqiXfsYaelXYRaQCm5VKfJ5DFu_8_7vlU-Q
Message-ID: <CAJ4mKGYPoxPS62yFigmqFPPTHOSwgtj+WKwEtdpNGsu3BJya3w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ceph: Amend checking to fix `make W=1` build breakage
To: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nathan@kernel.org" <nathan@kernel.org>, 
	"justinstitt@google.com" <justinstitt@google.com>, Xiubo Li <xiubli@redhat.com>, 
	"idryomov@gmail.com" <idryomov@gmail.com>, 
	"nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>, "morbo@google.com" <morbo@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zcgzUYFLhfHuSn7R_dl9mdByVyoX_Cpfy9_EHyHoOrM_1762804149
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 11:42=E2=80=AFAM Viacheslav Dubeyko
<Slava.Dubeyko@ibm.com> wrote:
>
> On Mon, 2025-11-10 at 15:44 +0100, Andy Shevchenko wrote:
> > In a few cases the code compares 32-bit value to a SIZE_MAX derived
> > constant which is much higher than that value on 64-bit platforms,
> > Clang, in particular, is not happy about this
> >
> > fs/ceph/snap.c:377:10: error: result of comparison of constant 23058430=
09213693948 with expression of type 'u32' (aka 'unsigned int') is always fa=
lse [-Werror,-Wtautological-constant-out-of-range-compare]
> >   377 |         if (num > (SIZE_MAX - sizeof(*snapc)) / sizeof(u64))
> >       |             ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Fix this by casting to size_t. Note, that possible replacement of SIZE_=
MAX
> > by U32_MAX may lead to the behaviour changes on the corner cases.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  fs/ceph/snap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/ceph/snap.c b/fs/ceph/snap.c
> > index c65f2b202b2b..521507ea8260 100644
> > --- a/fs/ceph/snap.c
> > +++ b/fs/ceph/snap.c
> > @@ -374,7 +374,7 @@ static int build_snap_context(struct ceph_mds_clien=
t *mdsc,
> >
> >       /* alloc new snap context */
> >       err =3D -ENOMEM;
> > -     if (num > (SIZE_MAX - sizeof(*snapc)) / sizeof(u64))
> > +     if ((size_t)num > (SIZE_MAX - sizeof(*snapc)) / sizeof(u64))
>
> The same question is here. Does it makes sense to declare num as size_t? =
Could
> it be more clean solution? Or could it introduce another warnings/errors?

Given that the number of snaps is constrained over the wire as a
32-bit integer, you probably want to keep that mapping...(Though I
guess it's the sum of two 32-bit integers which technically could
overflow, and I'm not sure what happens if you actually hit those
boundaries on the server =E2=80=94 but nobody generates snapshots on the sa=
me
file in that quantity).

All that said, it'd be kind of nice if we could just annotate for
clang that we are perfectly happy for the evaluation to always be true
on a 64-bit architecture (as snapids are 64 bits, we will always be
able to count them).
-Greg

>
> Thanks,
> Slava.
>
> >               goto fail;
> >       snapc =3D ceph_create_snap_context(num, GFP_NOFS);
> >       if (!snapc)


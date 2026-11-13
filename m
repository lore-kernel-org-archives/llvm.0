Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587743;
	b=epY+yBOQ7BMJfV2MFoDe9U8+60pk5GN/zo9ryya95SzULpCZqmuCCBse/UVJDXdjx0AG
	 EHes1CCbI/xfFwtpqkO17lvtFLrwHdUHPzUzSzC0whzP4nnK3+sonPxwjkRjfkbSk/caS
	 qDfsYWbLNMIGlaci1QXS4qElqgTa0xZJrw9eGCFEcWLQZXt2C+wUkJ5pu+VsaodXBhwSV
	 4ymoxZ3eGSwIBBHhq1mg7Vvu6GIOjKtC4naF76e6rpX/MFdzYVFUF8FqC0iBsRjkQHy/M
	 mYd8zCRaQ0zgtor61wsJTnvilKR4dm9Uvb3XaSXqN3GZXX+1DRcoa5IKebsXEUGFEDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6Wvtz9D6vgbM+u/1wpqOZ954b+KYcK1dv6Mh68QSbho=;
	b=H5dQakdPuU7T2jUZioO6U/EPhNf6EmMmJrUWQO+StOudSxowQaSj8N0WbMM3E5VIvZ1p
	 OK0AFXWLF9l7mIGS39d6iX+9UD7zb54KaO6dck5p255nV4FXyPC8p+IixTxQoMRRGJgDa
	 OjaKwd4xjDIsHzacZ72Mr/q+xea4MF6rNHgdQV+a05WuJjdIG3WyA5RBIQPKh3gum/sIN
	 jPVnmNsbizhpKh6XCgAegT3DiOYZe0W7O0vAprPVL1aXIq3vI5omeMXp9W25GgCYUgck7
	 Y1WYAz9FAqsYyeSNJO0QYsYgv22gvU38xRHRrGuNwRB+GCA4E92Y9ZPT/ScAzqowNHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="L/ET/ct9";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D80606A323
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 16:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8D80606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L/ET/ct9
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-533202fe429so426061cf.0
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 08:35:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794587742; cv=none;
        d=google.com; s=arc-20260327;
        b=JCvSmikxw8sIgTaktQKJsYXb6WZrRr9l4UUrhmr6shP1+NDa/bFO2aTWYR2yHIg+O1
         gw/PKR6e9lVKjXEsYdQ8RV+DD94zExfX3+bmFqJg8Tqour0pXc2a4ctMFsWBDMm61mCw
         mMEuqHK7Jj7K/qIc4QpSxgEc5xfLRtE+BlCfcE3xUjjanhZbCVtQDQ/J3sWvHi3TCu3U
         PpC4tL1X8QtmgZ1DkKFojg7cab50P+LsiO5eYJRNLbb7gm+uh6swndOGC7ntfg7TLL2u
         MODfyyJlzgQjiAvf+hkpJLKLyRtzRv7lIrCWU4h6rD2JmoPpj0ag3HVcKB4hJvE6hUUF
         1fFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Wvtz9D6vgbM+u/1wpqOZ954b+KYcK1dv6Mh68QSbho=;
        fh=lEoQUlZLZHaYr0u8/Rf4f4zle28L/WGeA4fRtl57vcc=;
        b=FJ4WEly6QOkjvRH/rY0QSU6mCxefoD+YgDdUb91/xdFh4H/z4DsQzODS/EhX3NIydf
         VGs0oghvkgfljgQYeWhwJwdFio4WVn/TIm15jrD6elkAt+NyLrYa3ed2EU0SlTpNuoHT
         3cQql6IawrXBbCsJDfPfRZ5EZSNa3p56wGtoQLNNPr2/YSQQx8Usft2+7cLzOwLBLVbU
         p//cFR5TTw92+t2h+xiPQdu27+1j8WVbc8U/VT6+iZktFLxaTsrSdFuNuCBNn2M4Hjw/
         fij+/wBuogiIAakm2UuMim4LJHqvzpFEhT8YgWYEEHDy06NHg65uwcLS+iIEXKtGa1LI
         iJBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794587742; x=1795192542; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Wvtz9D6vgbM+u/1wpqOZ954b+KYcK1dv6Mh68QSbho=;
        b=L/ET/ct9ojGq/uQZt8DHMJ8xJU0vD3od0qcnYBxRuMBZmQSdMcjRyJrzYzyfGdTFF7
         NAE4S6N7aCOhKtSdWbQ70f+30uPpr7B8SD+6TiT5DjdzarlAWUKU/db1uFIo5EXDZ7k+
         ap51jJPU1furM7jJBQD32ghxCBo7uXpVXEHt2jkSD29HmJmFav4yJH2GFHRt0tobXNQY
         1VuA/BcdbssdEhCLAHmCGMmOBFvF7OHOaDPd7vL4SCXX0gKBKUrtaIgX9obrAltqXxXE
         YhB8ogxfyAFNNIyeO5wlxl3N8JXX9RM3UtYxLa5bCSFUbYcIoKvqgGqTR52Yv5doZhdm
         SHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587742; x=1795192542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Wvtz9D6vgbM+u/1wpqOZ954b+KYcK1dv6Mh68QSbho=;
        b=wrAuJKY2vN4GJWl3HyWp2RwO32Uz1ukSqS9HEPniUWBcsh5wAqunCDr1dX6nHjhLrf
         PFnKfMH8CUMZE1IHT/Frgyc+I/kh3U8G08GS7alXoH0ZEdojIG4yeZ3kqzZtAjQloZAP
         uFJVOwRHth6+ICbBbdqsXC2jTlYOl/pMbsRuw0KOqXr6XEMT2DJEmMpJRzkcVLEnHCA7
         tDq+3M568DNgFA7wvttSgFK7zXfj8vyhg9MJlq/RX1JQD6wlhfGjs++Az6a4W/r8OepK
         2O5U4McNQg8OjpCaIDfb2RhHKRswEmFl3RNO/98GrHehN2IlijeR5brSvE81qrMLT7rf
         KZGg==
X-Forwarded-Encrypted: i=1; AL+hErEIm55n+PTjc49RaNAIDswrKgHeccOGbZB1kn+BY0GSosx4xOae2f3gZBnB9u80FvC9yPlB@lists.linux.dev
X-Gm-Message-State: APuU4Z/yOzkvuflEp5AwILZ8aw7ROqln25K04mlA9KonOCUm0Mkg+bs1
	WbK7Eudj45VZU4I7QHGYOjGe+zDxzi9gulnx3xCOw8uafU6HsNzUK7RO4yiOhqOC9eXcd/ebxD1
	SdhAgXcdw5WcKn2Sp5slYuL9coDVsAhpiKWu+/kT0
X-Gm-Gg: AYBFou2bUgaK9c4zz1pujtDi2S+zbnKbyk99DEAnubwwKnabJGIQWNZimnKN3RwFneD
	Pm0dimmjKE+zMj+3WGGpMSwOGP04RzgsamkmeZ5dT6SgwoGlbNkdHcA0UkFjL3uAJ6cTkTxsJlF
	1lJs0OoXmugKCUUTJ7hGBYHaOYKyYC3DdRcfn0QQa7uzmTjfpHEz//oQZ6YlaSqEk89xO2FAnGb
	0bWU2wIJ0p6dR6QpFDmj8gI2rnCc6QnagdFtwhm2VH1mTXgdVrCsd0zTTiejMAwpI4sZMg2fDOr
	piLEMFnrLRQfluKMT0+T1OpaTnCJsnnWYJpY69OxjGUsbCPWHynkcSCrWwXjAISir/8eMw01X5p
	UF0UGyOHJz+x8VO4nBbOwITWxr32F4FRSRWomTv6OevyT/dBPefKjDPA1BR9hks4cEL4WtoA5oz
	DFKaDLeZ4V++SY
X-Received: by 2002:a05:622a:4d9b:b0:536:78de:775f with SMTP id
 d75a77b69052e-55b44e0a79amr14925261cf.15.1794587741025; Fri, 13 Nov 2026
 08:35:41 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com> <20261111174213.3526604-17-irogers@google.com>
 <avVl_JNcFqq7sZvd@google.com>
In-Reply-To: <avVl_JNcFqq7sZvd@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 13 Nov 2026 08:35:29 -0800
X-Gm-Features: AclHuK8PfQbklhmPM2_Vg84I7H9O-DXLd-KLmS3zmzOFzPck-cWzjRORBggtnwY
Message-ID: <CAP-5=fXFBqUgsC2Uug0BDBLg2Cg6O8C9ULF95j7kd7npeUhG5g@mail.gmail.com>
Subject: Re: [PATCH v12 16/20] perf intel-tpebs: Use DEFINE_MUTEX for tpebs_mtx
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, bvanassche@acm.org, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:08=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Wed, Nov 11, 2026 at 09:42:08AM -0800, Ian Rogers wrote:
> > Replace tpebs_mtx_get() and its pthread_once() initialization helper
> > tpebs_init() with DEFINE_MUTEX(tpebs_mtx) and static initializers for
> > control_fd and ack_fd.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/intel-tpebs.c | 91 +++++++++++++++--------------------
> >  1 file changed, 38 insertions(+), 53 deletions(-)
> >
> > diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpeb=
s.c
> > index 5cb090b27fbd..2edd8297fa1b 100644
> > --- a/tools/perf/util/intel-tpebs.c
> > +++ b/tools/perf/util/intel-tpebs.c
> > @@ -38,12 +38,12 @@
> >
> >  bool tpebs_recording;
> >  enum tpebs_mode tpebs_mode;
> > +static DEFINE_MUTEX(tpebs_mtx);
> >  static LIST_HEAD(tpebs_results);
> >  static pthread_t tpebs_reader_thread;
> >  static struct child_process tpebs_cmd;
> > -static int control_fd[2], ack_fd[2];
> > -static struct mutex tpebs_mtx;
> >  static struct cond tpebs_cmd_cond =3D { .cond =3D PTHREAD_COND_INITIAL=
IZER };
> > +static int control_fd[2] =3D { -1, -1 }, ack_fd[2] =3D { -1, -1 };
>
> Nit: I think it's better to split the line when they have initializers.

Done in v13 (along with folding in the __guarded_by(&tpebs_mtx)
annotations from the next patch).

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> >  static bool tpebs_stopping;
> >  static bool tpebs_enabled;
> >  static bool tpebs_cmd_in_flight;

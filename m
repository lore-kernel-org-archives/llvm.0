Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B414F23E34D
	for <llvm@lists.linux.dev>; Fri,  2 May 2025 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746187608; cv=none; b=hpvPfIIaE+flMvH8r2oQPXKiwMeKwQrS52faXI2v0i4kQfnAo/NJacrIMYiEAbn1jv0kyU2DKBznPi/sPaYCrN+FZFld68YWIsTJSnmp4qXun1mD7dv37DhozVRr47+fhR3D2JWf6cafqTW//+B6dL71ra7nDb//PUfG3+G/4LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746187608; c=relaxed/simple;
	bh=VIiENbdDB2JwUhcI2xcDSEB/mg732gTkvnNfrNikiAI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LSJxWOdQfuhxkDMdpPSE1dNRm6YQzbDmsnewyq8HLiTn/+4GURqyKpCXbyQPrATU1WlZXQC+/CexoCqP8SWzuxsHEdD+7srh8sf6OBDgwQVcGIPELTvaK9DaOIu+U7t5/5eu0a/3aVWfimNf+K7Y9qulBakL3bOnNygnqhDYnxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WY+KaWDf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WY+KaWDf"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so14994225e9.3
        for <llvm@lists.linux.dev>; Fri, 02 May 2025 05:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746187604; x=1746792404; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3V73705bvr6jBRGxONET/Lnah1PbBZsX8gJ3s70qtfs=;
        b=WY+KaWDfKaPI+YWoJtW6//r3gyukIwOhzKWmveugfIpRqixUbFJ7M0Yd9MyE4VMu2F
         /ZsCMF1S/VcKOoPAHSkQTcEV/lGgAKHJUYJjofZnycLUR3BULOVOEaR3N335B9YzBrfu
         QfV9cckKbD37fKkpdiGC3cz4XtT1inoMAIIoiGIClUvTNjRndm47sPvgBI27395Un2Sn
         +DMtQ0Iow2FFv/r5NaxULEcCTZsS3Le7C48mJsnHCnAtku+yvonmuT3DVJBvYAJvW4/J
         VUDDIyxtztaP0NhHCibPzkwmCZC3MLtTbIYKlQaDbjyzL5Bui4nexjJv3vNkNxYLHlsr
         LUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746187604; x=1746792404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3V73705bvr6jBRGxONET/Lnah1PbBZsX8gJ3s70qtfs=;
        b=Q2rXebgd8e4VLqBLa4Hc7rh5k/WKuEwYyVmdOYpkTzDe5jeHnHhIBvHCANgw87y0Oz
         pWuOIoaRxhEt30vKIuScN63qFfmr1v6Apg/hD2MrVHL/OHDcEXysuNYsQUy8GtsMDALa
         M+Nh2IKkyQYLlZQsyrNKVNwcHDOmPwZN2p4N1JkI/rHEjGR7whXgGwsQOpatySRP+ewW
         LPwcUugCmC/5D6vh0wvXX8l+rtbR6qukFxeGAi8t0U4RP+stfVkaWZhmaG0FWZ5XX79O
         6OzgjwA4rsTaupSFlPSFMTJS/AGxfVYvGgxnsiQMLiLJIAGcG2YeBJAslv0JuokArnGP
         pWUg==
X-Forwarded-Encrypted: i=1; AJvYcCVUDuNCE4TZ7/HzR1t7y7mU0o520FltPcbpu35bz2aERloHR0mVq+eLWeVhB8eC9gzMaG3L@lists.linux.dev
X-Gm-Message-State: AOJu0YxjuTaDWL0RxEs8rFnIKMy1GMZS624x2gDt5u7EwRNTJX+TknFy
	xvUMf8moIWXq/YIkUlz+PmFIBKlTI7jsONP4VodKKrENDX53g971
X-Gm-Gg: ASbGnctZzfiiyAYuMFf9jWbjafIWrbXwGn9KqyuNH0VX2nvQoSSiW/tFB8WfbQA4lfy
	7sAKEDNEAC6rORSOg+3UCaB0Ue8GUZJWQDn6O35hKpxRJk70BrisqpCKVBRCqGkxNjHUAlGTODn
	MA6LDf1kanP+qL851kinA7FUS/YnT9ZR+hXGBDjgWAGfAOvLJdX1us4hG8hm7ULvqmQC1viN25r
	pIJ8K7PfNMq1Ifgz5kldI5cdqeyWWoyzRshxnt5QHQZ3PpeHQAHMm0nZo+8hSiP7VTvdId1hBUj
	mGW4DpG6lwimcE7QhTwMIWqObxbrNBslBqnYqmdcK8usX4UJPt+EjdNFntgWEJZsl0TWpg/tdw3
	si7E=
X-Google-Smtp-Source: AGHT+IFh2JoJgMUXNCEsxIU7sFr9ZKrk9uzl/gj68SDvvgkmdXJHvwZfMJbNBkXkaIN5STEA3H1Rgg==
X-Received: by 2002:a05:600c:1c26:b0:440:68db:a013 with SMTP id 5b1f17b1804b1-441bbf2cb29mr17733935e9.25.1746187603660;
        Fri, 02 May 2025 05:06:43 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc469sm43027435e9.6.2025.05.02.05.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 05:06:43 -0700 (PDT)
Date: Fri, 2 May 2025 13:06:35 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Dirk Gouders <dirk@gouders.net>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
 <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Kan Liang
 <kan.liang@linux.intel.com>, Yury Norov <yury.norov@gmail.com>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Thomas Gleixner <tglx@linutronix.de>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, John Garry
 <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, James Clark
 <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, Leo Yan
 <leo.yan@linux.dev>, Yicong Yang <yangyicong@hisilicon.com>, Jonathan
 Cameron <jonathan.cameron@huawei.com>, Nathan Chancellor
 <nathan@kernel.org>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Kyle Meyer <kyle.meyer@hpe.com>, Ben Gainey
 <ben.gainey@arm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Kajol
 Jain <kjain@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, Eder
 Zulian <ezulian@redhat.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>,
 Kuan-Wei Chiu <visitorckw@gmail.com>, He Zhe <zhe.he@windriver.com>, Brian
 Geffon <bgeffon@google.com>, Ravi Bangoria <ravi.bangoria@amd.com>, Howard
 Chu <howardchu95@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>, Colin
 Ian King <colin.i.king@gmail.com>, Dominique Martinet
 <asmadeus@codewreck.org>, Jann Horn <jannh@google.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Yang Jihong
 <yangjihong@bytedance.com>, Dmitry Vyukov <dvyukov@google.com>, Andi Kleen
 <ak@linux.intel.com>, Graham Woodward <graham.woodward@arm.com>, Ilkka
 Koskinen <ilkka@os.amperecomputing.com>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, Hao
 Ge <gehao@kylinos.cn>, Tengda Wu <wutengda@huaweicloud.com>, Gabriele
 Monaco <gmonaco@redhat.com>, Chun-Tse Shao <ctshao@google.com>, Casey Chen
 <cachen@purestorage.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, Li
 Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>,
 Levi Yun <yeoreum.yun@arm.com>, Weilin Wang <weilin.wang@intel.com>, Thomas
 Falcon <thomas.falcon@intel.com>, Thomas Richter <tmricht@linux.ibm.com>,
 Andrew Kreimer <algonell@gmail.com>, Krzysztof =?UTF-8?B?xYFvcGF0b3dza2k=?=
 <krzysztof.m.lopatowski@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Jean-Philippe Romain
 <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang
 <xu.yang_2@nxp.com>, Steve Clevenger <scclevenger@os.amperecomputing.com>,
 Zixian Cai <fzczx123@gmail.com>, Stephen Brennan
 <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 04/47] perf bench: Silence -Wshorten-64-to-32
 warnings
Message-ID: <20250502130635.0eabb190@pumpkin>
In-Reply-To: <gha57xgs8b.fsf@gouders.net>
References: <20250430175036.184610-1-irogers@google.com>
	<20250430175036.184610-5-irogers@google.com>
	<gho6wdh00l.fsf@gouders.net>
	<CAP-5=fUdpa40MDNu0aDBO7o8H3YMe-cYsg-YfqUUZUY4M4XLeA@mail.gmail.com>
	<ghecx9guoj.fsf@gouders.net>
	<CAP-5=fXJpD_f6dUqroVpqe-OX5kyOPc1zpbyOZoQtqvQWBGr=Q@mail.gmail.com>
	<gha57xgs8b.fsf@gouders.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 01 May 2025 01:11:16 +0200
Dirk Gouders <dirk@gouders.net> wrote:

> Ian Rogers <irogers@google.com> writes:
>=20
> > On Wed, Apr 30, 2025 at 3:19=E2=80=AFPM Dirk Gouders <dirk@gouders.net>=
 wrote: =20
> >>
> >> Ian Rogers <irogers@google.com> writes:
> >> =20
> >> > On Wed, Apr 30, 2025 at 1:23=E2=80=AFPM Dirk Gouders <dirk@gouders.n=
et> wrote: =20
> >> >>
> >> >> Hi Ian,
> >> >>
> >> >> considering so many eyes looking at this, I am probably wrong.
> >> >>
> >> >> So, this is only a "gauge reply" to see if it's worth I really read
> >> >> through all the commits ;-)
> >> >>
> >> >> Ian Rogers <irogers@google.com> writes:
> >> >>
> >> >> [SNIP]
> >> >> =20
> >> >> > diff --git a/tools/perf/bench/sched-pipe.c b/tools/perf/bench/sch=
ed-pipe.c
> >> >> > index 70139036d68f..b847213fd616 100644
> >> >> > --- a/tools/perf/bench/sched-pipe.c
> >> >> > +++ b/tools/perf/bench/sched-pipe.c
> >> >> > @@ -102,7 +102,8 @@ static const char * const bench_sched_pipe_us=
age[] =3D {
> >> >> >  static int enter_cgroup(int nr)
> >> >> >  {
> >> >> >       char buf[32];
> >> >> > -     int fd, len, ret;
> >> >> > +     int fd;
> >> >> > +     ssize_t ret, len;
> >> >> >       int saved_errno;
> >> >> >       struct cgroup *cgrp;
> >> >> >       pid_t pid;
> >> >> > @@ -118,7 +119,7 @@ static int enter_cgroup(int nr)
> >> >> >       cgrp =3D cgrps[nr];
> >> >> >
> >> >> >       if (threaded)
> >> >> > -             pid =3D syscall(__NR_gettid);
> >> >> > +             pid =3D (pid_t)syscall(__NR_gettid);
> >> >> >       else
> >> >> >               pid =3D getpid();
> >> >> >
> >> >> > @@ -172,23 +173,25 @@ static void exit_cgroup(int nr)
> >> >> >
> >> >> >  static inline int read_pipe(struct thread_data *td)
> >> >> >  {
> >> >> > -     int ret, m;
> >> >> > +     ssize_t ret;
> >> >> > +     int m;
> >> >> >  retry:
> >> >> >       if (nonblocking) {
> >> >> >               ret =3D epoll_wait(td->epoll_fd, &td->epoll_ev, 1, =
-1); =20
> >> >>
> >> >> The epoll_wait(), I know of, returns an int and not ssize_t.
> >> >>
> >> >> That shouldn't show up, because it doesn't cause real problems... =
=20
> >> >
> >> > So the function is read_pipe so it should probably return a ssize_t.=
 I
> >> > stopped short of that but made ret a ssize_t to silence the truncati=
on
> >> > warning on the read call. Assigning smaller to bigger is of course n=
ot
> >> > an issue for epoll_wait. =20
> >>
> >> Oh yes, I missed that ret is also used for the result of read().
> >>
> >> Some lines down there is also a combination of
> >>
> >> ret =3D enter_cgroup() (which is int)
> >>
> >> and
> >>
> >> ret =3D write()
> >>
> >>
> >> Just confusing but yes, because ret is also used for read() and write()
> >> in those cases it should be ssize_t.
> >>
> >> I'm sorry for the noise. =20
> >
> > No worries, I'm appreciative of the eyes. I suspect we'll only pick up
> > the first patches in this series to fix what is a bug on ARM. I think
> > I'm responsible for too much noise here ;-) =20
>=20
> A final thought (in case this patch will also be picked):
>=20
> Why not, in case of read_pipe() and worker_thread() just cast
> read() and write() to int?  Both get counts of sizeof(int) and
> it would clearly show: we know the result fits into an int.

This is an obvious case of the entire insanity of these changes.

	David

>=20
> In case of read_pipe() that would mean to just change one line in
> contrast to:
>=20
> @@ -172,23 +173,25 @@ static void exit_cgroup(int nr)
> =20
>  static inline int read_pipe(struct thread_data *td)
>  {
> -	int ret, m;
> +	ssize_t ret;
> +	int m;
>  retry:
>  	if (nonblocking) {
>  		ret =3D epoll_wait(td->epoll_fd, &td->epoll_ev, 1, -1);
>  		if (ret < 0)
> -			return ret;
> +			return (int)ret;
>  	}
>  	ret =3D read(td->pipe_read, &m, sizeof(int));
>  	if (nonblocking && ret < 0 && errno =3D=3D EWOULDBLOCK)
>  		goto retry;
> -	return ret;
> +	return (int)ret;
>=20
>=20
> Best regards,
>=20
> Dirk
>=20


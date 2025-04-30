Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB929224B15
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 22:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746051776; cv=none; b=ssHlfSoJPCXpwn0SQD+nUTc2deJ9nsyvHg/pZZFtEckFnr6UzPFUK/8588v1oMdkEr28vx0WELYkIHxNWH91QRcB7NUhOyvfB3RRgU+Y2TStiiZ/NxxvxdfwffR82hoSPkFNRlqS/WmcsM4AvrMucddhAaSi9l2WtF11/RFPfRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746051776; c=relaxed/simple;
	bh=0YUWkd6wJtLdo5B/APnSVNXh0AfY+OdZbGmGhS8uFUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q7WV7oV17N0bKqwbXIkPNKfgGC1Rt3vwTxhHQuK7lMNgslW5xNcp0982zUUsGCMHgaUpuagoZ5gQWGhS9n2bvbLI/cIX5TOG+bXmwWOkDxgCIyRmIlEjZE3mu+8UCJwaGPaV99/1oKUOR5XIdBAyXvRnJQCzqFS3XSoSOB0ohNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WpibyEKF; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WpibyEKF"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d91a45d148so16795ab.1
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 15:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746051773; x=1746656573; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YokCi7aKrZdv2d/dyamRwVJ1e6HinNxOv5p5IIA6cT8=;
        b=WpibyEKFENmhTJGJk6eLznRoFRP1+rU672RwRe5ns5sgnIPbvLN5vYZP6uGT0eBiJr
         xgU97OvwlVN6SeIrBtYJs3N64+QturR2rQIiaU4iyAUxoZqIHrrSGnwn+rABb/znqIaN
         a8KNRnO2inLoTxhuVFODRurp7Fa17v/ZpEly4MkxzB7mj3lz+f89s2rxThooryUdkPme
         8JX7KjxG633DzVrlNQ+HZswuWzdeLYw/unaoSssa7deEI29RQqeMjhj5vTXGxehbEfi0
         UNEgrVawgBJyVpdX+uUA9oA+x6UU8O560Y0hhIdIGOFG0uq14MZLUGNta3e9ReLVFhSe
         OpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746051773; x=1746656573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YokCi7aKrZdv2d/dyamRwVJ1e6HinNxOv5p5IIA6cT8=;
        b=F6Blv55GgBbQClVHe3b60ykbOm5zJF58gSQPg7/H1dnusOCVaRSS5ATf+kTSIOGpDC
         qfw69L4t2uOcA/MWrmN2kywzhhpBKb6rwMBuIS0bgOefrfxtBG6tT09EKY7J/jvSq4BU
         MIjBCKJJbMa8TVx1Pb66BGDbJI0fWXcdwtMawF2DAjbT7lEn12BpPNDkXzL3cv4e2LGW
         qqq8kOLC7KSKGGFkBBhtJYkI4ULkTPz4O1il9jDMqz5uDDcnun7cSCt5QUFC30T05UyZ
         u/OGSUww/2vf5KRMztRgN8TaQzAwdV9sAkRojnrtEV8V7xZyIM/dMOFXakyenkuuHQ37
         bPNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1FVzkp3NszzrNcpRW8NqhFJf9XTU4N98huNLGxx2VODrXl/AmGrqc9ctnUaMi7bcPl81k@lists.linux.dev
X-Gm-Message-State: AOJu0Yzej4G80NutIp049DBTkPf8NljEXbZNJBd6n4wqXTDDQob/7JYR
	zklMz98IBWYCji/79NGl/P0qxpbdo9ixVd0sPYjU7+4buJ4hPQUgPOEdk9BpR2Zf5Rh9nLXnJJk
	7RnU32tpTpPL8i5XsPVf/dNYm6gijmw+Ta7ya
X-Gm-Gg: ASbGncvMPpogTuibZz5UllplBd1ys/BXd40bJX4Am7ay7ELn/s/shtp/CDsWkQeW5DZ
	0Yz7+VqpjaV5v6LDCKQraDmTeTf45txyfEAPi5RlBLJtvG54jOCoGBuq7W8g1wOB1IMrhxiMSdn
	k0PBvB0axppggFk9Kb3ZjLDYHRYCsAbDe2om+aR53vpZ+7feCa+7Y=
X-Google-Smtp-Source: AGHT+IHSQaroTYiAKLjNKynIk1WDzmR3Kvw4OqXhrt1MM3RYIj7IDWhIjIeLOR6Hj4qFR9501YVJsa8ofHBiWHdno8s=
X-Received: by 2002:a05:6e02:18cf:b0:3d8:18f8:fb02 with SMTP id
 e9e14a558f8ab-3d970170ff3mr413755ab.17.1746051772386; Wed, 30 Apr 2025
 15:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com> <20250430175036.184610-5-irogers@google.com>
 <gho6wdh00l.fsf@gouders.net> <CAP-5=fUdpa40MDNu0aDBO7o8H3YMe-cYsg-YfqUUZUY4M4XLeA@mail.gmail.com>
 <ghecx9guoj.fsf@gouders.net>
In-Reply-To: <ghecx9guoj.fsf@gouders.net>
From: Ian Rogers <irogers@google.com>
Date: Wed, 30 Apr 2025 15:22:41 -0700
X-Gm-Features: ATxdqUHF8bnMs2FUVX3_M8TTVB-rXwmAk4JR-eMpMw8Ws6gw_TrHiVv3n6ePWHA
Message-ID: <CAP-5=fXJpD_f6dUqroVpqe-OX5kyOPc1zpbyOZoQtqvQWBGr=Q@mail.gmail.com>
Subject: Re: [PATCH v2 04/47] perf bench: Silence -Wshorten-64-to-32 warnings
To: Dirk Gouders <dirk@gouders.net>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Yicong Yang <yangyicong@hisilicon.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Kyle Meyer <kyle.meyer@hpe.com>, Ben Gainey <ben.gainey@arm.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, Eder Zulian <ezulian@redhat.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Kuan-Wei Chiu <visitorckw@gmail.com>, 
	He Zhe <zhe.he@windriver.com>, Brian Geffon <bgeffon@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Howard Chu <howardchu95@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Jann Horn <jannh@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Yang Jihong <yangjihong@bytedance.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Hao Ge <gehao@kylinos.cn>, Tengda Wu <wutengda@huaweicloud.com>, 
	Gabriele Monaco <gmonaco@redhat.com>, Chun-Tse Shao <ctshao@google.com>, 
	Casey Chen <cachen@purestorage.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, Levi Yun <yeoreum.yun@arm.com>, 
	Weilin Wang <weilin.wang@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Andrew Kreimer <algonell@gmail.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 3:19=E2=80=AFPM Dirk Gouders <dirk@gouders.net> wro=
te:
>
> Ian Rogers <irogers@google.com> writes:
>
> > On Wed, Apr 30, 2025 at 1:23=E2=80=AFPM Dirk Gouders <dirk@gouders.net>=
 wrote:
> >>
> >> Hi Ian,
> >>
> >> considering so many eyes looking at this, I am probably wrong.
> >>
> >> So, this is only a "gauge reply" to see if it's worth I really read
> >> through all the commits ;-)
> >>
> >> Ian Rogers <irogers@google.com> writes:
> >>
> >> [SNIP]
> >>
> >> > diff --git a/tools/perf/bench/sched-pipe.c b/tools/perf/bench/sched-=
pipe.c
> >> > index 70139036d68f..b847213fd616 100644
> >> > --- a/tools/perf/bench/sched-pipe.c
> >> > +++ b/tools/perf/bench/sched-pipe.c
> >> > @@ -102,7 +102,8 @@ static const char * const bench_sched_pipe_usage=
[] =3D {
> >> >  static int enter_cgroup(int nr)
> >> >  {
> >> >       char buf[32];
> >> > -     int fd, len, ret;
> >> > +     int fd;
> >> > +     ssize_t ret, len;
> >> >       int saved_errno;
> >> >       struct cgroup *cgrp;
> >> >       pid_t pid;
> >> > @@ -118,7 +119,7 @@ static int enter_cgroup(int nr)
> >> >       cgrp =3D cgrps[nr];
> >> >
> >> >       if (threaded)
> >> > -             pid =3D syscall(__NR_gettid);
> >> > +             pid =3D (pid_t)syscall(__NR_gettid);
> >> >       else
> >> >               pid =3D getpid();
> >> >
> >> > @@ -172,23 +173,25 @@ static void exit_cgroup(int nr)
> >> >
> >> >  static inline int read_pipe(struct thread_data *td)
> >> >  {
> >> > -     int ret, m;
> >> > +     ssize_t ret;
> >> > +     int m;
> >> >  retry:
> >> >       if (nonblocking) {
> >> >               ret =3D epoll_wait(td->epoll_fd, &td->epoll_ev, 1, -1)=
;
> >>
> >> The epoll_wait(), I know of, returns an int and not ssize_t.
> >>
> >> That shouldn't show up, because it doesn't cause real problems...
> >
> > So the function is read_pipe so it should probably return a ssize_t. I
> > stopped short of that but made ret a ssize_t to silence the truncation
> > warning on the read call. Assigning smaller to bigger is of course not
> > an issue for epoll_wait.
>
> Oh yes, I missed that ret is also used for the result of read().
>
> Some lines down there is also a combination of
>
> ret =3D enter_cgroup() (which is int)
>
> and
>
> ret =3D write()
>
>
> Just confusing but yes, because ret is also used for read() and write()
> in those cases it should be ssize_t.
>
> I'm sorry for the noise.

No worries, I'm appreciative of the eyes. I suspect we'll only pick up
the first patches in this series to fix what is a bug on ARM. I think
I'm responsible for too much noise here ;-)

Thanks,
Ian

> Best regards,
>
> Dirk

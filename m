Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CFF1A8F98
	for <llvm@lists.linux.dev>; Sat,  3 May 2025 10:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746266746; cv=none; b=mvVPvhmxRmhkcyiyBJeDbWTZuvQnj7Ve6TZI7lMsbvEFCLMdD50w6br/6cqk6D/9GPkb1s1k9z9y4mXlc4qTN4MlOaeL5D0W98QvCWjvr71U75saltO3EtRSV84GUYft1Sww0V7LXARs7DUEGhKGmXGkU2SVi5+SL0D6VfYOYlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746266746; c=relaxed/simple;
	bh=uF2T2BIyw+/xcyCGJDU/6x2DZb941ZpmFA/Q3XtBUSA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JHwhYYpqiwvR7enYThpGGtPDkWqFwXZpe5a2BE8n/XTI0my92gF60afxNwfLqCYDJXB1UFqSZScF93yFroz4MZZ5GsQ1qNDEA0IofbR9uYkrHB/8cWNEeGkzalihwIIZSV48X1zoRrXafuWYGir4AYoKERxVhcjAcvUvpiZdssk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjRgPkaA; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjRgPkaA"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c30d9085aso1884391f8f.1
        for <llvm@lists.linux.dev>; Sat, 03 May 2025 03:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746266742; x=1746871542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMtY8QqPx6OiDjuqDLYhvMGsySH/FA5PX2dXiSgpBl4=;
        b=gjRgPkaAnD+R3jn7pqhNwe9FcsOK2Ik+m0VgJhvU5vkcKRV1LX3e0d3nx05UuPR7ed
         lEhCM8Ytj9tgi0aZa/suJSzJ+tmXw79YUgcWNP0vUMbWz2bEcJmQAALBOF/EesPHG4gd
         w+sjJjbwdvJuKR6nyyTxBd1mzVKORBgCV8MevoVzkaiq90BfDAJgOWO2M+4UbWaQvp+l
         4f8pIyq5SCGYSeNGcsmKjgYIQa+wqi2REVu6PTLENf/29Ab9J+rDsNlDhuWInhJr4gHn
         yNUTALWSr3XGG8fKhbEMiG5oFwuiOnZvZTASkONaRO2sUhVB0VcWNY6d4VOpraVQGe5g
         TifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746266742; x=1746871542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMtY8QqPx6OiDjuqDLYhvMGsySH/FA5PX2dXiSgpBl4=;
        b=qV7aRG17HPi6FG2GDftyO0JnzzzBl0ip4VBQivBa5VmT0ycrM9RHTTJ3NILj+DWrd6
         tRR1iic3ERwISn3AxT4U7PF7xYuM7DBR68RhCu0B0Uz/k2u11pzFKDCwh0sh0JDb+0eb
         P5nt2cEcQrC3uhwLEE8uNf94Ls1qY1jnzTkzOPELqqE6aB51RWuFgqPd8Iminv9vFio/
         iwZWhQmIr69WJ4n5b34MA0gNRjWBce+TSEidQdyDthOdK6Zcrnvjfjiz323XE+PhfZ71
         cgSFvS4NqcM1SEYcMLOODA8YvTcWwPJlMzFdryKbZU4/nsT6v1goaWpiD98dl3+XZnXz
         oJRw==
X-Forwarded-Encrypted: i=1; AJvYcCVza6X0IjQ5I+UiYSdRZJMsIqeOyJCXKPpJm/pw2GnIHICKG0uNtXPlQbMdMa4ODl18iuq+@lists.linux.dev
X-Gm-Message-State: AOJu0YyXxNk+V86Ab40Nf64aCvkTkULHZbA6fSrpxFfu+EBkc1vVvpPl
	51g8a0A9h4C11VjD/LLXT3Ywj5l4pUYqLIg9SdFIUEsWbAhWE9vQ
X-Gm-Gg: ASbGnctP3P5yihIIiWdQV6n8eET/bbAExk0Qrwc33wlKDKboTbBbPP5tk1m3IGk1hYv
	iC27Z6ncN5HRnLVf/WZ+lpywTkDrX9dmZFxyzfPvJ8hMOu+sfZX4YZ0oepvGLSYTH7TBOYbFpWT
	gKBQErIGsZ2G0Q6wE4PmjyaqKZnwEjFZtJA/SA0ib7js0QDEuFc0VbETJfiKnBexh14okYdBq3I
	4JEv6x6saK8TqkrKTdweUtUu8O1TrG0yQzXA+7O44XqKvOk/x9g729DoTuuPaeKfcvWK9is7PGG
	SipVV0al0tpIf2RCK94+fEfYwRZ3XxuiVdDzlJkJiOlBQEj6dd3dEab8SOdCs42skvRfianzVux
	lEdE=
X-Google-Smtp-Source: AGHT+IGQyKlOxBSM7B2+EZ2eft7OAT912MJRMXi8G6uxK9ya5aWgGaesS68wg/MSidCEfv4CFqh63A==
X-Received: by 2002:a05:6000:2484:b0:3a0:88e1:5e18 with SMTP id ffacd0b85a97d-3a09fd6f850mr641212f8f.1.1746266741727;
        Sat, 03 May 2025 03:05:41 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b10013sm4449634f8f.65.2025.05.03.03.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 03:05:41 -0700 (PDT)
Date: Sat, 3 May 2025 11:05:38 +0100
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
Message-ID: <20250503110538.0d264e4a@pumpkin>
In-Reply-To: <ghfrhnaypq.fsf@gouders.net>
References: <20250430175036.184610-1-irogers@google.com>
	<20250430175036.184610-5-irogers@google.com>
	<gho6wdh00l.fsf@gouders.net>
	<CAP-5=fUdpa40MDNu0aDBO7o8H3YMe-cYsg-YfqUUZUY4M4XLeA@mail.gmail.com>
	<ghecx9guoj.fsf@gouders.net>
	<CAP-5=fXJpD_f6dUqroVpqe-OX5kyOPc1zpbyOZoQtqvQWBGr=Q@mail.gmail.com>
	<gha57xgs8b.fsf@gouders.net>
	<20250502130635.0eabb190@pumpkin>
	<ghfrhnaypq.fsf@gouders.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 02 May 2025 16:12:17 +0200
Dirk Gouders <dirk@gouders.net> wrote:

> David Laight <david.laight.linux@gmail.com> writes:
>=20
> > On Thu, 01 May 2025 01:11:16 +0200
> > Dirk Gouders <dirk@gouders.net> wrote:
> > =20
> >> Ian Rogers <irogers@google.com> writes:
> >>  =20
> >> > On Wed, Apr 30, 2025 at 3:19=E2=80=AFPM Dirk Gouders <dirk@gouders.n=
et> wrote:   =20
> >> >>
> >> >> Ian Rogers <irogers@google.com> writes:
> >> >>   =20
> >> >> > On Wed, Apr 30, 2025 at 1:23=E2=80=AFPM Dirk Gouders <dirk@gouder=
s.net> wrote:   =20
> >> >> >>
> >> >> >> Hi Ian,
> >> >> >>
> >> >> >> considering so many eyes looking at this, I am probably wrong.
> >> >> >>
> >> >> >> So, this is only a "gauge reply" to see if it's worth I really r=
ead
> >> >> >> through all the commits ;-)
> >> >> >>
> >> >> >> Ian Rogers <irogers@google.com> writes:
> >> >> >>
> >> >> >> [SNIP]
> >> >> >>   =20
> >> >> >> > diff --git a/tools/perf/bench/sched-pipe.c b/tools/perf/bench/=
sched-pipe.c
> >> >> >> > index 70139036d68f..b847213fd616 100644
> >> >> >> > --- a/tools/perf/bench/sched-pipe.c
> >> >> >> > +++ b/tools/perf/bench/sched-pipe.c
> >> >> >> > @@ -102,7 +102,8 @@ static const char * const bench_sched_pipe=
_usage[] =3D {
> >> >> >> >  static int enter_cgroup(int nr)
> >> >> >> >  {
> >> >> >> >       char buf[32];
> >> >> >> > -     int fd, len, ret;
> >> >> >> > +     int fd;
> >> >> >> > +     ssize_t ret, len;
> >> >> >> >       int saved_errno;
> >> >> >> >       struct cgroup *cgrp;
> >> >> >> >       pid_t pid;
> >> >> >> > @@ -118,7 +119,7 @@ static int enter_cgroup(int nr)
> >> >> >> >       cgrp =3D cgrps[nr];
> >> >> >> >
> >> >> >> >       if (threaded)
> >> >> >> > -             pid =3D syscall(__NR_gettid);
> >> >> >> > +             pid =3D (pid_t)syscall(__NR_gettid);
> >> >> >> >       else
> >> >> >> >               pid =3D getpid();
> >> >> >> >
> >> >> >> > @@ -172,23 +173,25 @@ static void exit_cgroup(int nr)
> >> >> >> >
> >> >> >> >  static inline int read_pipe(struct thread_data *td)
> >> >> >> >  {
> >> >> >> > -     int ret, m;
> >> >> >> > +     ssize_t ret;
> >> >> >> > +     int m;
> >> >> >> >  retry:
> >> >> >> >       if (nonblocking) {
> >> >> >> >               ret =3D epoll_wait(td->epoll_fd, &td->epoll_ev, =
1, -1);   =20
> >> >> >>
> >> >> >> The epoll_wait(), I know of, returns an int and not ssize_t.
> >> >> >>
> >> >> >> That shouldn't show up, because it doesn't cause real problems..=
.   =20
> >> >> >
> >> >> > So the function is read_pipe so it should probably return a ssize=
_t. I
> >> >> > stopped short of that but made ret a ssize_t to silence the trunc=
ation
> >> >> > warning on the read call. Assigning smaller to bigger is of cours=
e not
> >> >> > an issue for epoll_wait.   =20
> >> >>
> >> >> Oh yes, I missed that ret is also used for the result of read().
> >> >>
> >> >> Some lines down there is also a combination of
> >> >>
> >> >> ret =3D enter_cgroup() (which is int)
> >> >>
> >> >> and
> >> >>
> >> >> ret =3D write()
> >> >>
> >> >>
> >> >> Just confusing but yes, because ret is also used for read() and wri=
te()
> >> >> in those cases it should be ssize_t.
> >> >>
> >> >> I'm sorry for the noise.   =20
> >> >
> >> > No worries, I'm appreciative of the eyes. I suspect we'll only pick =
up
> >> > the first patches in this series to fix what is a bug on ARM. I think
> >> > I'm responsible for too much noise here ;-)   =20
> >>=20
> >> A final thought (in case this patch will also be picked):
> >>=20
> >> Why not, in case of read_pipe() and worker_thread() just cast
> >> read() and write() to int?  Both get counts of sizeof(int) and
> >> it would clearly show: we know the result fits into an int. =20
> >
> > This is an obvious case of the entire insanity of these changes. =20
>=20
> You mean, because there is still the -1 case where the sign-lost can
> happen?
>=20
> I guess your reply is in combination with your replies to another thread
> to this subject.  As far as I understood, Ian also has problems with
> full understanding and I wonder if it helps to talk about a real
> example.  As far as I understood you say that code like this
> (from tools/perf/bench/sched-pipe.c) is simply wrong:
>=20
> static inline int read_pipe(struct thread_data *td)
> {
> 	int ret, m;
> retry:
> 	if (nonblocking) {
> 		ret =3D epoll_wait(td->epoll_fd, &td->epoll_ev, 1, -1);
> 		if (ret < 0)
> 			return ret;
> 	}
> 	ret =3D read(td->pipe_read, &m, sizeof(int));
> 	if (nonblocking && ret < 0 && errno =3D=3D EWOULDBLOCK)
> 		goto retry;
> 	return ret;
> }
>=20
> And from your reply I understand that casting the read() explicitely to
> int is insane.  And now, I wonder what you would suggest -- honestly, I
> am expecting to learn something, here.

If you look through pretty much all 'posix' userspace code the return
value from 'read' is assigned to an 'int' variable.
If the compiler is going to complain that the return value doesn't fit
into a 32bit int, it better have a pretty good idea the return value
might exceed 2^^32.
That requires knowledge of what 'read' does and analysis of the domain
(not just type) of the length passed to read.

Now if you add an (int) cast, you won't get an error (on 32bit) if
the value is a pointer - and that is an error you always want.

I'm pretty sure that it is also true the linux limits read (and write)
to INT_MAX - so, for linux, the return value from read() always fits
int 'int'.

The underlying problem is that if you start adding unnecessary casts for
integer type conversions you end up with so many casts that it is far too
easy for a 'broken' one to slip into the code.

If you scan the kernel for min_t() there are plenty of very dubious ones.
They've been added to 'fix' a compile time warning, but there are plenty
that cast to u8, u16 or long (where there are u64 lurking).
One of the u16 ones I found was a real bug and found/fixed separately
from my scans of all the min_t().

	David=20

>=20
> Best regards,
>=20
> Dirk


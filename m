Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E100A241698
	for <llvm@lists.linux.dev>; Thu,  3 Apr 2025 15:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743695139; cv=none; b=TVN9eCIUgiZ9II0mwELEggyR4CFlsCJtTHywZ3SB+a121+1kj5E+ztqKuNMkVJlnd3IO8itMAtyzFLbiTuXXg28+MvK2XoHZzSEhgv0cr9NnGPdhj/9Q7SiIciuKSn/kgQvMZeS2N7CBuP2Z7+Vak/N/zYOirdoLQH3KJheYE14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743695139; c=relaxed/simple;
	bh=u/aG4oB4WNkCPegsHCQT8qPz5be8pp+UKn8cULcgptQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGajpYJ/8Dm/X3VeNmLDOa9olTwNBakXScUn0DFDJafs0qweoRpGRjS7+LkRa6HpUXmNV5o7POfzHvyvOxrohiTr4VpGKJWLbi17fwSGEx8GZDo6X3F3lBVObVk9HRpIXzcXFBtQEdEbWRbk1811NurQ0l0s7QJe8lUzNbQF6Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TnkA0T20; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TnkA0T20"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2240aad70f2so553215ad.0
        for <llvm@lists.linux.dev>; Thu, 03 Apr 2025 08:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743695137; x=1744299937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Srpqp3Kkq7aM1ElMtJ57gn3uv8NzgjRwS641tTGIuk=;
        b=TnkA0T20ZLzSBe1uMChz04WulXiflgTVeXBQnXG/YI8JsoiY0uBp47sIeVocCnZlxi
         jbtlxkUXKDOLRxL9EtH8lu9pmmI/L39TaPxwzQn+X0CyBYs0XPJ/3B9FpnXyjwarEUDB
         /4j4wopL0l6yngkXy3Y3xvGUQB45BXPeq1ObZWO2r94XpRf93g2x5jEdTASU3eiPQbI5
         /5UXMaakjQdJWPXgWlFKUEoqwRSi44tZUnyKqCWAM46ohc2HccmaxKpiw5sDKuy/s3MI
         A/E8026OtnPoWLMWNn/7ahedMlZP3VaRbKFcZA8q8tiakscIg2ivfBiGhF7Ne59pkoRG
         rEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743695137; x=1744299937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Srpqp3Kkq7aM1ElMtJ57gn3uv8NzgjRwS641tTGIuk=;
        b=XWI6MEVtt+M3qciVYS7EW2fdBy1AT9ud2qf6UrjCGnZ1z/b7cDu5RAREP0myzaU2zu
         6cKNCPS6m7nW/o3MEirQY6kcw3YTzWI9lxnTLp+HejWoYcTPnloEXOCNUKBNKtsVB47U
         37baAK25krBvbKTOYupZcWeRx1F2dQ0Ju1VqdQVRKYgqkzCreMJJDSukUxydozgwZMFQ
         6GY8VC8qfJcAyG1WxeblrV2wsBJjfTbh8MUrwzwHVi9uwE/66HavCUCt3IMD4gCAmJnZ
         VNuR7iJoSbmOwdLyy3sa83iZzkmReCMAuEp/yHmVXTfVzsCFFgxybPI2vZHxuQK5CmrW
         wwDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAu8tFjA2KO2ixZsbopcRmYoYsxUwGdHVmrZyRhKA7RqgC+zgy9XXLqyhzoQjiQk7m4G3e@lists.linux.dev
X-Gm-Message-State: AOJu0YwTFqdf9XFToCP5K5y0b1i+VBb9C+KSU7+KeSLgKXD3K65j0Yrh
	uv5K0a4HqJLVTP432QAdi4xF/SB/1cwmRQhFtFgv22qs/knXCRkFxbXiLUmu5Mi3EAVZsGt4+Fc
	V0Yyf6tgFfO4n/S+Zy9fV8uFleo3W7nEi/9/2
X-Gm-Gg: ASbGnct1ZLouuM8w8aKeRLfGAO8Ykw2PyGI9rvAgBUS6VCTblX0P5gLLAytT4ahBait
	wn9FC6+WjnLz7SGw/ywsfAS13SwO4yUAUlJhuNvfFIivHFCIWde/LpaOtveAUSaXDsgmpezI5Zz
	CkggbV545d7tZVAuvarzPrLOQwW/8Eob3AtFIJ6Ak89dd9hSnBDwwf
X-Google-Smtp-Source: AGHT+IHW6nGaJK74SRBwA1bEQWxGyMKWr5SaCImBnz01lgMdAkUcmfcALa1DgHQFm485K0C7UQeGP0LAZ2+5H5afAMc=
X-Received: by 2002:a17:903:440b:b0:216:21cb:2e06 with SMTP id
 d9443c01a7336-22978359fcemr3125475ad.19.1743695136832; Thu, 03 Apr 2025
 08:45:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com> <20250401182347.3422199-3-irogers@google.com>
 <Z-6WY4a6RV1bEbNU@thinkpad> <Z-6aoJ3ohVHPsF0A@thinkpad> <CAP-5=fU6E1_8Vzki1dVyb8hDEYOXaSNSrJJkR6AOU8xqvknT8w@mail.gmail.com>
 <Z-6n-3ObiNNLQzFw@thinkpad>
In-Reply-To: <Z-6n-3ObiNNLQzFw@thinkpad>
From: Ian Rogers <irogers@google.com>
Date: Thu, 3 Apr 2025 08:45:25 -0700
X-Gm-Features: AQ5f1JrvLgsW_OKeRNs6sWWnH602UWUPGZj5MuooiHzsiee4XKI7LVV70957jQ0
Message-ID: <CAP-5=fUg_QmWBRUM4tc7zF-rCP9D5+=AqP_FPPYiFEybhcvbhA@mail.gmail.com>
Subject: Re: [PATCH v1 02/48] tools headers: Silence -Wshorten-64-to-32 warnings
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
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
	He Zhe <zhe.he@windriver.com>, Dirk Gouders <dirk@gouders.net>, 
	Brian Geffon <bgeffon@google.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Howard Chu <howardchu95@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Colin Ian King <colin.i.king@gmail.com>, Dominique Martinet <asmadeus@codewreck.org>, 
	Jann Horn <jannh@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
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

On Thu, Apr 3, 2025 at 8:23=E2=80=AFAM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> On Thu, Apr 03, 2025 at 07:52:45AM -0700, Ian Rogers wrote:
> > On Thu, Apr 3, 2025 at 7:26=E2=80=AFAM Yury Norov <yury.norov@gmail.com=
> wrote:
> > >
> > > On Thu, Apr 03, 2025 at 10:08:39AM -0400, Yury Norov wrote:
> > > > On Tue, Apr 01, 2025 at 11:23:00AM -0700, Ian Rogers wrote:
> > > > > The clang warning -Wshorten-64-to-32 can be useful to catch
> > > > > inadvertent truncation. In some instances this truncation can lea=
d to
> > > > > changing the sign of a result, for example, truncation to return =
an
> > > > > int to fit a sort routine. Silence the warning by making the impl=
icit
> > > > > truncation explicit.
> > > > >
> > > > > Signed-off-by: Ian Rogers <irogers@google.com>
> > >
> > > I'm the first person in the To list, but only a couple patches in the
> > > series are related to my area. If you want to move it with me, can yo=
u
> > > send bitmaps, bitfields etc. separately?
> >
> > Hi Yury,
> >
> > If you think it is worthwhile. I did the series to see how prevalent a
> > bug was in perf's code - inspired by Leo Yan fixing an instance of it.
> > I would prefer not to be on the hook for all the kernel warnings :-)
> > Perhaps casts to avoid changing bitmap_weight's type. Unfortunately to
> > get to where the perf issues were I needed to clean up header files.
> > In the bitmap cases the change is just to make implicit casts explicit
> > and I don't know how much value you see in that.
>
> Your changes  are technically correct (except for non-synced kernel and
> tools), make the code cleaner, at least to me, and address pretty valid
> compiler's concerns. To me, it's worth to apply.

Ok cool. I'll make a separate patch series for them. Sorry for giving
you such a long patch series with limited signal to noise.

Thanks,
Ian

> Thanks,
> Yury

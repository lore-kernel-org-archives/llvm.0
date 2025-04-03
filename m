Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A220D2528ED
	for <llvm@lists.linux.dev>; Thu,  3 Apr 2025 18:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743703965; cv=none; b=sjcjLmtLyG90LcqpqgroeIGqG1w6O+fdBbgoDnfzIq+TFw+aGKftLmXcfQyVkMOZmUc3n/Vocayi9CVtk5f2kr0uS3njE6nmVyL+lA/KPBW7/EDUEJtdjJIWAmw29utfXQxYhRrLTvwn7rwuItfB6cZpqflgzuhMcI9LtoM/JmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743703965; c=relaxed/simple;
	bh=xqmZIdIHJa6CMtzPsjIfg+cOQUO+/dCkkINkrtFyZow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2wiiz7YWSjkhamKvjhlz5+2TK6GvChiFGb3b2RPIKWsCXN6jS7iFXGJJ0aRO8qGY3r20x1E5NMDBpSOIPQ/ghjw2UELgjKPDevlGLbl2xktFa+s4jT/XwrNdpnf2/MVZGuC3G4z3Q8XDyNvnzaqw1YADXGvq48AOqP2Ny+yXgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0H4VQzQ4; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0H4VQzQ4"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2264c9d0295so28455ad.0
        for <llvm@lists.linux.dev>; Thu, 03 Apr 2025 11:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743703962; x=1744308762; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aLP0XLlIdOnfz+6gWQTE3JCu4R0hFMgWBr7Hokz1iU=;
        b=0H4VQzQ4ovm+caJDDZDKMoFWZcRcz43A0eTphiZ2s70heh7YLqqkLNqLuthFWxRcWp
         hU3kB0mdvRcbOdTthlGMkRgh2aZk2Fwbw9eJNwj0yYK/fdCRDr1sZVPqZPHo1enGsXXt
         jqml75f5h/5p90J6ArMSvVS7G/peb5+klRyOFiInbcA70ica+65O7KN+RUkY0u0Y8g2b
         tJtQrLhPDwFJun9L9zwBlLuTRVI7b+GIZflT4tI55lVk/xKJtPPClEMs+RkKzqXZL9Oc
         426LqzI3xkXPuJM5eJEi0ptPQjXuB3K2mJTmXLqoJXStHbfGQKADsEGn1Wi7VVQYsUzb
         9zpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743703962; x=1744308762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aLP0XLlIdOnfz+6gWQTE3JCu4R0hFMgWBr7Hokz1iU=;
        b=WFEpuGqkH9t1JW3qTqHV+wMXOBn3+p+Ts/UBZR6shmHIs5LYBFIzZt4erMRW/WpAry
         87ax0SV43wvsqrscal0eciUGmcmfD7q2PM4Nf0JVSaiaZQ78mCouwGuyXj99p+/aEUrx
         DKkzRa5LfeKGeTHo3yuaCJjVmngaDCLe/iDshKQfON0RYWZa0RCKY+oaw+pSq2Wr2wlQ
         vbupLh1jMtrNnXUIgeDARDzPanCSd+Qg/w+3fLR6K0YL4bfhYRkvAyyqu3V9IWA4xYNg
         yifKwVvuJc0pnY44LoZ28t4ShKUolwJ8vBBkxnsgL1GQLxHQJzfS6qHVyN7y7+mgiCzd
         3CXw==
X-Forwarded-Encrypted: i=1; AJvYcCWbeMYteHmC9ZWMjKGjpnxp4pGcAz4XajAsDBZXbTIKxY0Og9w4udeSJSp9fhvPm3xCuZ9O@lists.linux.dev
X-Gm-Message-State: AOJu0YzO1i00Efi7NsKJIARm2RWArmaTWnuZ9a/YnmNnBO0HTzTDl9wi
	JYA2nJoEJ4WjiRMAjR0eO4hV0yjF0o7rQZMVr7pCoPAx/CuKx7PxKUk1/DMY7r0dyrcXmOWLoOk
	uwTYBhw7r1h9ukRCaxYwVF/qNwbkRQU+Vypqz
X-Gm-Gg: ASbGncsihnPvbctKNdpxcQsit+o/ri/u2wqhoGGXQNi1zCQm4iwyBqUbtdgimS66LYk
	2IGy5keCAFLO+vSgLIAGzqOhMk3HXinxhkJEdGS/J+9dmXwDGDpTThNVTCne/HJqpDzVpnqABBP
	5tOvDRt/8ilK6GRsWKUi6yn7tzMkMTVL/ydOaAnItUjZ0QsRaKsPxdoZwH1kqDwiE=
X-Google-Smtp-Source: AGHT+IFmS4SSl/bqVH8xj8Ga3H3gxrU9ep4gALw80cbCtv3Re7uJHItC77oB0uDI52Su41KeNV8B0zO5PSa27BbQYG4=
X-Received: by 2002:a17:902:b117:b0:223:5696:44f5 with SMTP id
 d9443c01a7336-22a89ea9b2amr232425ad.12.1743703961391; Thu, 03 Apr 2025
 11:12:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com> <20250401182347.3422199-3-irogers@google.com>
 <Z-6WY4a6RV1bEbNU@thinkpad> <Z-6aoJ3ohVHPsF0A@thinkpad> <CAP-5=fU6E1_8Vzki1dVyb8hDEYOXaSNSrJJkR6AOU8xqvknT8w@mail.gmail.com>
 <Z-6n-3ObiNNLQzFw@thinkpad> <CAP-5=fUg_QmWBRUM4tc7zF-rCP9D5+=AqP_FPPYiFEybhcvbhA@mail.gmail.com>
In-Reply-To: <CAP-5=fUg_QmWBRUM4tc7zF-rCP9D5+=AqP_FPPYiFEybhcvbhA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 3 Apr 2025 11:12:30 -0700
X-Gm-Features: AQ5f1Jq6jyhFEA6uwJS18mW1i1oQqxvGXhODTfWOqlCuAbO-N4Tt_U86tEKeiKg
Message-ID: <CAP-5=fUkoiZXL3J7A_pjP07fY+vv3Gs0BHXMXxpo1NOngXKtrA@mail.gmail.com>
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

On Thu, Apr 3, 2025 at 8:45=E2=80=AFAM Ian Rogers <irogers@google.com> wrot=
e:
>
> On Thu, Apr 3, 2025 at 8:23=E2=80=AFAM Yury Norov <yury.norov@gmail.com> =
wrote:
> >
> > On Thu, Apr 03, 2025 at 07:52:45AM -0700, Ian Rogers wrote:
> > > On Thu, Apr 3, 2025 at 7:26=E2=80=AFAM Yury Norov <yury.norov@gmail.c=
om> wrote:
> > > >
> > > > On Thu, Apr 03, 2025 at 10:08:39AM -0400, Yury Norov wrote:
> > > > > On Tue, Apr 01, 2025 at 11:23:00AM -0700, Ian Rogers wrote:
> > > > > > The clang warning -Wshorten-64-to-32 can be useful to catch
> > > > > > inadvertent truncation. In some instances this truncation can l=
ead to
> > > > > > changing the sign of a result, for example, truncation to retur=
n an
> > > > > > int to fit a sort routine. Silence the warning by making the im=
plicit
> > > > > > truncation explicit.
> > > > > >
> > > > > > Signed-off-by: Ian Rogers <irogers@google.com>
> > > >
> > > > I'm the first person in the To list, but only a couple patches in t=
he
> > > > series are related to my area. If you want to move it with me, can =
you
> > > > send bitmaps, bitfields etc. separately?
> > >
> > > Hi Yury,
> > >
> > > If you think it is worthwhile. I did the series to see how prevalent =
a
> > > bug was in perf's code - inspired by Leo Yan fixing an instance of it=
.
> > > I would prefer not to be on the hook for all the kernel warnings :-)
> > > Perhaps casts to avoid changing bitmap_weight's type. Unfortunately t=
o
> > > get to where the perf issues were I needed to clean up header files.
> > > In the bitmap cases the change is just to make implicit casts explici=
t
> > > and I don't know how much value you see in that.
> >
> > Your changes  are technically correct (except for non-synced kernel and
> > tools), make the code cleaner, at least to me, and address pretty valid
> > compiler's concerns. To me, it's worth to apply.
>
> Ok cool. I'll make a separate patch series for them. Sorry for giving
> you such a long patch series with limited signal to noise.

Posted here:
https://lore.kernel.org/lkml/20250403165702.396388-1-irogers@google.com/

Thanks,
Ian

>
> Thanks,
> Ian
>
> > Thanks,
> > Yury

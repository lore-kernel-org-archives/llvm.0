Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AAA27A930
	for <llvm@lists.linux.dev>; Mon, 28 Apr 2025 16:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857792; cv=none; b=IagLV0NEQH8J7/avL2I+b76we78lSItZmH84auBtqlm+5B/hmgMA6H8dJ8TlzZ6kwMe0+Xt6FvlBptSFjCfyXvsDSajbVm1Kp8Keqis/0GG5QVBbmyk7un27OE1+7lmZbi6r4Yc8fkOQFDPUhyWsM3QQ2AQ4f23InjLvJqXWtL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857792; c=relaxed/simple;
	bh=1C95W2/fwHyRHtk+JHGiXWsNxXt0GtsvL7KIBD8kVKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NF074sGyJCC3Owhk3PbqyxKPwiIq2vG504xkJnvcaUcqkbu3J8RQZJtq5NRZ9B3yVZRAQERSEhVouGQa4QLd5TY/KsLPkAmM3wq7UTvZw3T99G1c5SeB7CovCMMHVy4NlMoPObP7D4RibbOgC9r2JdeMtb9dzrUL5SJ33SWK0fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1h4ORn/Q; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1h4ORn/Q"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d44cb27ef4so364435ab.1
        for <llvm@lists.linux.dev>; Mon, 28 Apr 2025 09:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745857790; x=1746462590; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wh+DRrWbqOmIJ5njoJ2wjPW5CmA60O8YuWuF+JN+TBY=;
        b=1h4ORn/QBOBEeq6pnBI/1kFmCv3TuPqt1SimWXkC///zqAw0QvFq1JrsNuUWUEGZ9d
         AgoPCFWO0RgLEODyCzbEZzA5p4BDStslNnR8KozpbGIj26XEhtxLHvV53/UYcG8+RZzG
         aiR4xkvKjncbXpWYgpuDZGJAJ55gLzsfdMvyma0d/ftWmrCSh4FmUaNBz30XWy5MRQCw
         T34NRFa2qz5OTb5AvWWTJWTq0PEFgTctvbceXN8r9K4yaoJTWmYSj4aHSeoDeilxxCAu
         AuDu2pLGyEUzEmvj3kAjyVVRi6Nvqv4i2135FjMmCHd50LarAGYi0ZX8+3E8o24caX9j
         6f4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857790; x=1746462590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wh+DRrWbqOmIJ5njoJ2wjPW5CmA60O8YuWuF+JN+TBY=;
        b=mV0bb9EU8JRfEtvp1FVb7vCF3g/TMVuTUIHel6RpIUuD9ctvdxwxrEAh4TqW88TDeF
         lymynhiaeyFExGiYoXbUwlHQEIt1gjApyOIonSg1QHYbjLWkW/jWm7ZMeU42cYKpBFBw
         0+vw5u2lmds9TSqAGb/MbVJaxvPVlWI8Txmqyi0rCOZMifWpWR1Ocq+S7ADyE0zVWzd5
         towZlpd6NjFrQghGPAuZIeLBx0pIUc0Ff1pKL7loKI2SFfPhRayx2Hmb7S5CQqeJH7vY
         oqj6BJVRPUpFZVMWkanoqXLUY0lYi15tmk8kDkkppxg6qqZAnIJCiqtB3BO495amRgwr
         bYvg==
X-Forwarded-Encrypted: i=1; AJvYcCXnRdFjQrKoXaImKufeYQ43nl2bzjlG/Tf+F1HcrSyDWmPZ3g3WFztrOoiwN4XvaCnrD+Kz@lists.linux.dev
X-Gm-Message-State: AOJu0YzyG/5agGNg7TAd1VQph/TXIupWVQx91Ev1ygrDgP5xP6mZ/Rqb
	ZwsEiC8b2cCfXftmm8A42JuCxg5dPmuuReqJ/JZ4dHbiBitBearjB2l6Jc+/5Iz0cgsg3ZGKDoh
	OSZyUTEJnn2Ykm9PUtS8daUzrUvCGDaelwOrR
X-Gm-Gg: ASbGncv/vLt0GG2aZGYPnNmC3/Lr35hi0omQIOR93J0ZdfUIzDiFkqOs1WRRxTMaK+p
	XT7P9Us8KgWID5S8E4ByEqBJSwaxoHigIt7TsoBhiSJyyg682kNzOI/wioo5m26piWaHZAME9Fk
	dWdWddLh7TwHWiXylXEvXVGBrPL0tfEhee7/5KN0G7i67yQkdC5oA=
X-Google-Smtp-Source: AGHT+IFgni9S3EbldkBFy+UaV2PGINeyU7XHMyTvnEqm962Opij8z4ZbWegad0NVAIeYhQ5KVDq9OkArcBx8RVmrN4I=
X-Received: by 2002:a92:c262:0:b0:3d3:d954:d3f with SMTP id
 e9e14a558f8ab-3d95c9b72e1mr504055ab.26.1745857789426; Mon, 28 Apr 2025
 09:29:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com> <20250401182347.3422199-10-irogers@google.com>
 <20250402143541.GM115840@e132581.arm.com> <CAP-5=fVqax8cxdZ4HLBP4AMxL6jADfYNrORC97T6F23mjf3N1w@mail.gmail.com>
 <20250402163807.GP115840@e132581.arm.com> <CAP-5=fVJkJ39_qx2T9ZHn-fdxjECP_2G+cyfRRAjLvZZt5vz2A@mail.gmail.com>
 <Z-4URXOzsVHTY7zz@google.com> <CAP-5=fXwAA0PNYAOLNLdHY8g+AyEB0UxmzgX5w-gGj_DZqUxtg@mail.gmail.com>
 <20250428111003.GC551819@e132581.arm.com>
In-Reply-To: <20250428111003.GC551819@e132581.arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 28 Apr 2025 09:29:37 -0700
X-Gm-Features: ATxdqUGFjH4q5v7Uk07WHlS_ccOT0RLSXjfxw6By-jFHE3jlf4Ygq-0h-8TAKBU
Message-ID: <CAP-5=fX3jn=ff9itMemKB22ACnHtU_cO6YUcx=uYYWX4=QaLJw@mail.gmail.com>
Subject: Re: [PATCH v1 09/48] perf tests: Silence -Wshorten-64-to-32 warnings
To: Leo Yan <leo.yan@arm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Namhyung Kim <namhyung@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
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
	Jann Horn <jannh@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
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

On Mon, Apr 28, 2025 at 4:10=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Namhyung, Ian,
>
> On Thu, Apr 03, 2025 at 08:20:02AM -0700, Ian Rogers wrote:
>
> [...]
>
> > > > Anyway, I don't have time to do such a larger refactor so
> > > > somebody else is going to need to pick that up. I did refactor the
> > > > cases where I thought it mattered more, but as you say that does le=
ad
> > > > to a feeling of inconsistency in the series.
> > >
> > > I'm curious there are any actual errorenous cases other than the retu=
rn
> > > type of comparisons from Leo.
>
> I am just wandering if we could give priority for errorenous cases.
>
> Could you send fixes for these cases firstly and leave out refactoring
> for later merging?
>
> [...]

Hi Leo,

So I sent out cleaning up the kernel headers separately:
https://lore.kernel.org/lkml/20250403165702.396388-1-irogers@google.com/
Arnd commented that it would be nicer to do larger changes, but my
concern was breaking printf modifiers, etc. It looks like those
patches have lost momentum, not sure what's going to happen about them
being merged.

On the fixes vs refactoring. I'm not sure refactoring is the right
term for the other things in the series. It is basically trying to
make implicit casts explicit, without doing some boil the ocean
exercise. I went through the issues in the email this is a reply to:
https://lore.kernel.org/lkml/CAP-5=3DfXwAA0PNYAOLNLdHY8g+AyEB0UxmzgX5w-gGj_=
DZqUxtg@mail.gmail.com/
Do you want to send the bits you think need prioritizing to the list?

> > There are lots of cases like:
> > ```
> >                 case ARM_SPE_COUNTER:
> >                        if (idx =3D=3D SPE_CNT_PKT_HDR_INDEX_TOTAL_LAT)
> > -                               decoder->record.latency =3D payload;
> > +                               decoder->record.latency =3D (u32)payloa=
d;
>
> This would be fine.  Since Arm SPE implements a counter with a maximum
> of 16 bits, there will never be an overflow when storing the data in a
> 32-bit unsigned integer.

The payload was > sizeof(u32), should record.latency be a u16? My
point wasn't so much to complain about adding a u32 cast in the SPE
code, but that having the cast makes it clear that truncation is
expected. Adding the casts isn't fixing a bug, but it is making it
clearer that the code will truncate the payload value (imo).

Thanks,
Ian

> Thanks,
> Leo

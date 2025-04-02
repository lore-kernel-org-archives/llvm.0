Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6715F1F428F
	for <llvm@lists.linux.dev>; Wed,  2 Apr 2025 22:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743633190; cv=none; b=NJrAsXF1XAoqvXGbUKbGuaPrX7iAbsc/di2842+bDueP0NIbQKD1fEIhs+iligTFDfS94hhcJiVyKXbd/VVJteIQMbWDedUWlXzDwqj+Dwqz9Y5gKH1fftgAoC6KiVlEsZ2K0DRYmbuvjQqp1qlCLrS1/MWxeXRhN+px6zN3tFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743633190; c=relaxed/simple;
	bh=vpL5MYiXWzk/TTfDMt9SK1ICgCeny9hniT1+NGgwpEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlUsUOMQdyPFro7CRTpaV+mbDgodTZd3DP7ysIGh90y8Cr7O/LYNpivTp4Ips+iK5p8/wvnNQ9QUA59M6pR7VrBj77hDvrP9GJnrXywQkSW7jeLwN/txgKlVf0GiXyDWAZLpK2XD7cKvIe7Tg62NiQyPlSy5UCtBnRv1Z1oRb98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NKYhEzIW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NKYhEzIW"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2240aad70f2so373845ad.0
        for <llvm@lists.linux.dev>; Wed, 02 Apr 2025 15:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743633189; x=1744237989; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFoV6Jzg/d3+puQvt+e32UWddq8Y5WjF4RLVz5wXa1A=;
        b=NKYhEzIWcgChnyoEkRnQCtt1igiD3rhAig+tZGjuXC7PR2lawwqc+d4QcgdfnfItoV
         agwqjfu48hEr0JKsmxIwGBS+5WR1gydXIHlCfGXlECRArKJMU794Z5GchSZEZ+Vmltdv
         agTNAe7/novL2VBbrCK6d8SczQ3053XXAALDvh/yIGvEjbBWTJG0fI3mT3mOz4gToxJq
         LiQbpwcP+VfcUvHI0tdTl7dHjlWzWFLbJJyiLhdR83t+0NpqXKM7noaTvE5jUdmdMU8K
         HzvfpSwRWM7dmjtiJgQqnYgbfAKDsCCvimiGMvrtPvvwdv5VjP9l3TolTzW7Qu5+eQsM
         91AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743633189; x=1744237989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFoV6Jzg/d3+puQvt+e32UWddq8Y5WjF4RLVz5wXa1A=;
        b=inBCMuLIuv0FnUqjaKvGhX6XgKbeWnBpUF7O6eko2L/zetkCPhk7N/WhrZl4DVXndw
         zCaXqQeLR/tMhpgzlrZgcb6eKF1dmk/AuKRXoZa6BsnuMNMsognZQpxuUNoLGo/4rLsv
         BtIUS3ND/WXyZAiCy5JrgwEGovpwRRfd7OC5XmxUN6erlyk+tMC6aQHtTsiqaaYlSCVO
         bWT6mW1oaVA+MU1xLAU0PdxPEEC1wNvv48O3KG4KYb+CEXUTsO6w5KKOGcop77+cGAXX
         xp/mjPRMoRClyppQ+XVXqlKFgl0eS8uy91N/ygy7lNxM1genEqWMkEsMrPmJjk9biUk9
         75Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVdo9i0mCvxHle/v1xfV+N1DM1s8LV1/Q1JgZbtUzjyqbOBqa4HCm/Cut/asIAJhO/4e2NZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxVj26twpSfr3AdCgu2/FICtbRV9EB0dCZUfmKYEAKhA4IJAh8u
	N0/CCzz8smi97D/Hhh0p0fKsMX95YSPyXeYhMQYY0AOhNiOAZ4s6tu4o+46FjeNisPN0vlCGXPD
	ydELEKaFLahU0bHUxUDalBFscCH7CeGdYj12N
X-Gm-Gg: ASbGncvyJpSqPgF3/gtaaaL1KcD1rpP9a0xz/qzenM9K5qRe3ZKV0H3cE9THV8cpTau
	MlWhu66ZO1KN6k7NAkAh/hfEWs4H9cYOjVIXyAyhol5QLsDoVegt0IjahXLk178UdHo+eIVWZP8
	mJQdRB4B89Ckj43UGDLsTGQFYZMneJnKNTstmaYpmyGGdfdxRsIaKH8l+1m7sP2I0=
X-Google-Smtp-Source: AGHT+IGeD+R7itL1TPM9ELId2uzX7pKMbUUuKfNfuvM39HjMgfv4HNBG65B/Era82HmhwK2fm9Jftl72TclUySUeWKE=
X-Received: by 2002:a17:902:ecc5:b0:215:65f3:27ef with SMTP id
 d9443c01a7336-22977502490mr1273235ad.12.1743633188346; Wed, 02 Apr 2025
 15:33:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com> <20250401182347.3422199-10-irogers@google.com>
 <20250402143541.GM115840@e132581.arm.com> <CAP-5=fVqax8cxdZ4HLBP4AMxL6jADfYNrORC97T6F23mjf3N1w@mail.gmail.com>
 <20250402163807.GP115840@e132581.arm.com> <20250402230125.366ac21c@pumpkin>
In-Reply-To: <20250402230125.366ac21c@pumpkin>
From: Ian Rogers <irogers@google.com>
Date: Wed, 2 Apr 2025 15:32:57 -0700
X-Gm-Features: AQ5f1JoGDdvG3SyzAeolredX1Q4rcDlM_rn1uPkwDSeBGYU8h0-XIsAUN3GlKck
Message-ID: <CAP-5=fVMk+1+Jv3OavMwHmm1b0YNZPnmETOW7nTbW9-7tS4MNw@mail.gmail.com>
Subject: Re: [PATCH v1 09/48] perf tests: Silence -Wshorten-64-to-32 warnings
To: David Laight <david.laight.linux@gmail.com>
Cc: Leo Yan <leo.yan@arm.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, 
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

On Wed, Apr 2, 2025 at 3:01=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Wed, 2 Apr 2025 17:38:07 +0100
> Leo Yan <leo.yan@arm.com> wrote:
>
> > Hi Ian,
> ...
> > If we use casts just to silence warnings, we also lose the opportunity
> > to improve code quality.  The changes in this series that fix type
> > mismatches are good, but I think the use of casts is not particularly
> > helpful - we're simply switching from implicit compiler casts to
> > explicit ones.
>
> It is certainly my experience (a lot of years) that casts between
> integers of different sizes just make code harder to read and possibly
> even more buggy.
>
> If the compiler really knew the valid range of the value (rather than
> just the type) then perhaps a warning that significant bits were being
> discarded might be more reasonable.
> But even then you don't want anything for code like:
>         hi_32 =3D val_64 >> 32;
>         lo_32 =3D val_64;

There is an instance of this in:
https://lore.kernel.org/lkml/20250401182347.3422199-3-irogers@google.com/

The particular problem that Leo Yan [1] found in the code base is if a
compare function like:

  int cmp(long *a, long *b)
  {
      return *a - *b;
  }

which are typically passed to routines like list_sort, qsort or
bsearch. The subtract is potentially 64-bit and the implicit cast to
32-bit loses the sign information. Generally the problem is more
opaque than this as here you can quite easily see the types of "a" and
"b". If we say we don't warn for implicit truncating assignments then:

  int cmp(long *a, long *b)
  {
      int ret =3D *a - *b;
      return ret;
  }

becomes valid, but it is identical and as broken as the code before.
I'm happy for a better alternative than clang's `-Wshorten-64-to-32`
but haven't found it and I agree it's unfortunate for the churn it
kicks up.

As an aside, I wrote a Java check for this as I found a similar bug in
Android. That check found instances where the subtract and truncate
were happening in a cache that would sort elements deleting the
oldest. Unfortunately the truncation meant it could also be deleting
the newest elements. In Java lossy conversions require a cast so I
could target the warning on casts within compare routines. C of course
has given us a good way to shoot ourselves in the foot with implicit
conversion and -Wshorten-64-to-32 seems to be a good way of avoiding
that particular foot cannon. Making ordering routines use a less-than
comparison avoids the problem in C++.

Thanks,
Ian

[1] https://lore.kernel.org/lkml/20250331172759.115604-1-leo.yan@arm.com/
>     David

Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFEE2500DE
	for <llvm@lists.linux.dev>; Thu,  3 Apr 2025 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691979; cv=none; b=gmcLkUk0yoxAcx0oIDF94z2PbPGAdiaqAKgnR73uCdZ+EHwDDnpa/bXbpXrmPtvFcLlJarTNXH7vdEnKPy7HhP0eNA1HLir0VpV2788VBqg4Ai2H0FiQPjoAXaeRBzwhia8f6JKI7HP0n/rBEfZ3ObKTuWPaAX5zDE0lOf3oRyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691979; c=relaxed/simple;
	bh=y/OB6K/Bt9NHwRPTlL/+qoZXBtgHIxGLUDZgy2E3y7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+uNtmUK2VEXTjQtH1ovcZ2kBDJSZuzzl5xM6IsRqQ2gxQ+F37A/Me6NQClW7ds78NBvY7uSmBfiEQgYpS8aDlnLbEeYMeBKk9mkb1JDdpRB9Z21/3ufHEsjGRA+sjFMnMN0coZuSVTqRpWNKitkedTndy1jbUyZAAjb+x1eYlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YZkL4ux3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YZkL4ux3"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2263428c8baso434445ad.1
        for <llvm@lists.linux.dev>; Thu, 03 Apr 2025 07:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743691977; x=1744296777; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/OB6K/Bt9NHwRPTlL/+qoZXBtgHIxGLUDZgy2E3y7U=;
        b=YZkL4ux3CErPEcngUUU/1cJbea2+TuZs4rmLBMOx7VWCErXZ8lUwFSYGylm0sS7taJ
         4LqxHZ3KKXTn0eQ9t6LxwqsKhW+lbDmkaL3OGM8JS2LG2fN4SD6mwSTRVZdRlG5BXLL7
         idwTFmL/PAcCAvaRR0Skhu2m6oWw906yplw/pRcHnPZR3A7CeZGC3Ug1B9GKVaO9icKX
         WqFs2D7WxThVZo15UwBRi0IKtJ2CRnIJWGQr63dUHrlzZdwKd9lEQaOrKwbI+9/p3gCJ
         IWVKlo6M41bhr1fYhaLMDLpdTK0q5c3hFZD7QM5pYfryMJbNlzoIsd8z7QvKR9yNEHPw
         L9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691977; x=1744296777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/OB6K/Bt9NHwRPTlL/+qoZXBtgHIxGLUDZgy2E3y7U=;
        b=oYUK9Ddg8KMORCpBhLp6D3Kw72sA4w1HSP4WLtiKBjJvw6XedIFhNWMKEn4bd3257K
         aM32FIM2nxaefPAGE1fY49uimEG742QAe4T9c7LcoehTBhSJsrMg+XiyY0lS5zFwF9ff
         AaSYUZQXCPNjj3u5/Vuu53Nd0SJkNiOzgimbefBHfiPUdot8VkbtSUNryE5WxGExyQXh
         YefWna+yDWFzOSTJU5U/g4cBQkDYGIKX3upUgy+dyQxEJC/5tH/0zzdZdWU2Nf5+pcjt
         NxQQkAUIiz66PlqMcyKyR8cw87BquodvLLcOUFwzboYxhItn6AbtLcD6DoVX8Qr5N0s1
         Wbjw==
X-Forwarded-Encrypted: i=1; AJvYcCX0mjWWLPJOEX98NoAIKPKC4ZnZYdcyQRbWc/k0enPN/AgLJBJNRRQlTegAno7RCPXR2prb@lists.linux.dev
X-Gm-Message-State: AOJu0YwUoaFmzTKgsu8KTUGubW3egTwDnmCdgdaW5oKoWol2YRIISBOs
	mvf7LZnIOxem1akdnjJrjMWSdRK9si2tlo2hUNQ/5eAUcSawhaN6++C9WYW9ODaLIr8uu3dQzcs
	5YBsIXbxUXhAww6HI4eYbapUD31UglFg6BMFu
X-Gm-Gg: ASbGncv52KChxEBS/5K4UGfjXBrzH7KDCza3UtxfEEwZ41wHE44VllcP1itPplbvA/C
	Aa2oegL3EBwqwF6hPo0CkoHiOioI3iyat9RHuLnq+9OlIdrXdchAuvlMmoxqJCFE+9D4JADu6mn
	XorWU1FEXR+L+9JdBxyAbqj03YFLEJcDhLt6oe/63uSAJ8hAzKwtq+OVQ+UCwm0Pc=
X-Google-Smtp-Source: AGHT+IGBznY/8m5rawZtAo3k2V++TsAKT/0vx3dFqX9aObHv2lNamccGJt6Wk28kpxn8mM8r33MXa1pRk8VeuY1C0/k=
X-Received: by 2002:a17:903:2284:b0:21f:9f4:4a03 with SMTP id
 d9443c01a7336-22978359fc0mr2645425ad.21.1743691976467; Thu, 03 Apr 2025
 07:52:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com> <20250401182347.3422199-3-irogers@google.com>
 <Z-6WY4a6RV1bEbNU@thinkpad> <Z-6aoJ3ohVHPsF0A@thinkpad>
In-Reply-To: <Z-6aoJ3ohVHPsF0A@thinkpad>
From: Ian Rogers <irogers@google.com>
Date: Thu, 3 Apr 2025 07:52:45 -0700
X-Gm-Features: AQ5f1JpXXdneR9py5d-4DyJqYcvkSLXJ0YA323VzpF-AA2iLPosnMDICafKsgoE
Message-ID: <CAP-5=fU6E1_8Vzki1dVyb8hDEYOXaSNSrJJkR6AOU8xqvknT8w@mail.gmail.com>
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

On Thu, Apr 3, 2025 at 7:26=E2=80=AFAM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> On Thu, Apr 03, 2025 at 10:08:39AM -0400, Yury Norov wrote:
> > On Tue, Apr 01, 2025 at 11:23:00AM -0700, Ian Rogers wrote:
> > > The clang warning -Wshorten-64-to-32 can be useful to catch
> > > inadvertent truncation. In some instances this truncation can lead to
> > > changing the sign of a result, for example, truncation to return an
> > > int to fit a sort routine. Silence the warning by making the implicit
> > > truncation explicit.
> > >
> > > Signed-off-by: Ian Rogers <irogers@google.com>
>
> I'm the first person in the To list, but only a couple patches in the
> series are related to my area. If you want to move it with me, can you
> send bitmaps, bitfields etc. separately?

Hi Yury,

If you think it is worthwhile. I did the series to see how prevalent a
bug was in perf's code - inspired by Leo Yan fixing an instance of it.
I would prefer not to be on the hook for all the kernel warnings :-)
Perhaps casts to avoid changing bitmap_weight's type. Unfortunately to
get to where the perf issues were I needed to clean up header files.
In the bitmap cases the change is just to make implicit casts explicit
and I don't know how much value you see in that.

Thanks,
Ian

> Thanks,
> Yury

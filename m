Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DDD16EC19
	for <llvm@lists.linux.dev>; Thu, 23 Jan 2025 21:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737668251; cv=none; b=Kt+YVKmnspw5bsToldc0q4pPWVvuKcMSkoja5QEc1Zw494A7pcu/hcuBXauEycAtcC4z6fzluOV9ZfZOGh83YDpihFvkcuCymLYzuJVR6N9pG4jZL48ctftsAGXWKC9jJeCoxhqlQ5fQs42TMHHccCFK+YIEExDVk98I0Z5PdKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737668251; c=relaxed/simple;
	bh=L752r3W235xYDox9BIyWE3Rp16Pk46klYTAG96XXzG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rbg+dixMVMBhGFIfaMdFydF4xj4/tz2GuNQ7rpRowrKPc9C7Zek52SePzfYoZ6kYokFysjNfu9YL+yxwxlwHJtrbS30AS0Mx1lXoTjz9OUF/z5fE8qErbmjeSGoba2DJKX8QLxU0o6KjK3nVyNwaGr2+yCZJkPYkLTMd+f6v3m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0bZ5gK3S; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0bZ5gK3S"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3ce82195aa0so40275ab.0
        for <llvm@lists.linux.dev>; Thu, 23 Jan 2025 13:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737668248; x=1738273048; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uoxnm9hTWfZu/cKYiCMCQS81Mb/wxsDunq4c/uCgQzg=;
        b=0bZ5gK3SpfUSz7/HnuGRvxxeqtwNBZ51vRomTJp+O2z+HuUIzh1rozHN09tAfuYRqr
         H4JPXT1PIVY5cWav/vsHdMSn8iI/qABOglTBIUsyR3hw5HfNJsUlQmzDp2pzAP4cKSD7
         MTMcYYE8k6La11IzB+25BsgZN44Ic6R6JBymYsEOFdGvEgWJOUUkss6JMMX6SR8EhAM5
         mzAUJaeup7N4Ryy3eObuHXu0jzNi5HDbOz1CuveIp9YH20QtAyoP3feWgZcYZ+jLVTRX
         0I1eeTAx+5b9QrgPdKz3TvV9/PcONMw4IaiQcT/wO6Jgptes8SLfYOY9B9xjGrSF+EXJ
         C05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737668248; x=1738273048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoxnm9hTWfZu/cKYiCMCQS81Mb/wxsDunq4c/uCgQzg=;
        b=P4mwcqyfwFWalWEI4AQm4rgfRDXse9g3Yo71dKb49j1/7GgCM/vplAV/LSB5uD52sT
         JzgEpUMhTFIqnF+lA0Wo0GcoAYQc8tFbejaUGykQCWWS8rBcx2vtgBNMw0GnQSe1IE/6
         NRE1QpSPRdo7hDwgiLVhwjTkXUYkDbecGmQY4hN2HLxsV0AiwueLK2+QIDzOOfUwYC7x
         z1zEjdtjN/+lGnWC23CQcFtKEYhwonVexPPVI+JxQTwxYrX4zHfhzAa7ijrlf30B6Fxo
         +JmRMKe02ddx8TlLQBulzRd5i+utPNKZ9fwhUzhZmRK1m8/nLldlMD52Fde7/wr25hyw
         /3Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVUAnQXgoFTtyW4xB+IPmhhA65I1RtPyxXawiimtz7AR9y/ctFkK9jidyMZbUfHX7DxVI98@lists.linux.dev
X-Gm-Message-State: AOJu0YxZJ5U57LMRYJ+roqIYUO2JBFjdvN9s/BFDvAOAlSrCn7nI0I6e
	FSgg1aDSKGAvLuv2li8DLfYbz44PK4CAwiLuO3pfHmIXb4nXykArmI7g4i2mR9I27kvzb+A9aui
	f1sobxsXa2sZWKdfacHC3yo68MeTk5NRfwobH
X-Gm-Gg: ASbGncvescsfP+xmiFEhdSur16cWV9bORtgzyESc9mqrG2zA4vqtP6SUnDmT7jp5+S7
	RBdqmx4buVdIDRBkLp0EOjJO+KKWtWJu/lWH+hdCCxR/cdn1TX0YtMfCzK1nFXNdzNYeC6NUKH+
	XZzCtogRxjHsIjdg==
X-Google-Smtp-Source: AGHT+IFe7SswEBLl2QnLCKZzlHXG+YarrT6rMAK1wtA2NW1AV2vUVPldz0BgyNNQs/pQU2LinX6XSFXiFaCh8HCJUlw=
X-Received: by 2002:a05:6e02:20c6:b0:3a7:e301:a1f2 with SMTP id
 e9e14a558f8ab-3cfbdea9d88mr4093055ab.15.1737668247865; Thu, 23 Jan 2025
 13:37:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250120173208.344231-1-irogers@google.com> <20250120173208.344231-5-irogers@google.com>
 <Z5FwusFZ_bYlu6aK@google.com> <CAP-5=fX4vtKzMtrEbZhqH0dmKpXY3Ke+pVJ-ZbnHnAVuto7Z8g@mail.gmail.com>
 <CAP-5=fXx=q-LHcb9BtjE1AFZGmV55NBWy3HvfWQaABo-YO=4gA@mail.gmail.com>
In-Reply-To: <CAP-5=fXx=q-LHcb9BtjE1AFZGmV55NBWy3HvfWQaABo-YO=4gA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 23 Jan 2025 13:37:16 -0800
X-Gm-Features: AWEUYZkx3MIYrAmzo2aXD_jxkXsQ8Hq8_p05FIEhwZQ0cii9aIVMyCMgz9iHWj8
Message-ID: <CAP-5=fUhNuybCU-2_5EgcCwgwXnxvyFMvyhzKe=ZP1bssQwXHw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] perf capstone: Support for dlopen-ing libcapstone.so
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"Steinar H. Gunderson" <sesse@google.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Changbin Du <changbin.du@huawei.com>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	James Clark <james.clark@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Li Huafei <lihuafei1@huawei.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > On Wed, Jan 22, 2025 at 2:27=E2=80=AFPM Namhyung Kim <namhyung@kernel.o=
rg> wrote:
> > > I think reverse engineering the types is fragile.  Can we simply chan=
ge
> > > to dlopen if libcapstone is available?

To understand the scope of the problem, here is the LLVM code:
https://github.com/googleprodkernel/linux-perf/blob/google_tools_master/too=
ls/perf/util/llvm.c#L22
3 typedefs and 5 #defines on 13 lines of code.

The capstone code is larger primarily due to needing to define cs_x86
(and its dependencies) which are used for extra detail in printing:
https://github.com/googleprodkernel/linux-perf/blob/google_tools_master/too=
ls/perf/util/capstone.c#L23-L132
We could opt out of providing the extra detail if capstone.h isn't
present. I believe this can remove lines 49 to 123. This would mean
there would be 37 lines of reverse engineered types - 2 structs and 5
enums.

My feeling is that this isn't significant and better than returning
errors for capstone/llvm, having #ifdefs/__maybe_unused for the cases
we lack the types throughout the code and relying on people building
noticing a warning to realize they need to install a dependency - the
alternative of failing the build if the capstone/LLVM header files
aren't present, and unless some NO_... build option isn't passed,
likely won't fly with perf developers.

Thanks,
Ian

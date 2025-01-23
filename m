Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E3123CB
	for <llvm@lists.linux.dev>; Thu, 23 Jan 2025 16:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737648483; cv=none; b=G7MyoHS7lS7/Ywtl+V32D0Jov+4AER0049J+Wdtl/FaFKWMgvqgFauAG6b9p1zQw/tU0fzctuo1JCfOYKOM310BlOsGoAas6wFOyig5fEXlUFfuhitAPeL6hqq7O0MvZRWxJzqTHCpoEIkjVmzNIUgaoYaM4gNi7ffvm/05xRUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737648483; c=relaxed/simple;
	bh=VJiHmI1djOKKK9qlzui7VcEj1PKh0CYZs7jRjQzcX2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QK7SVmVvCbkik4vMVRRptapv2qyTbhIZaVO+o+XU7pvZT/bNkQfNHsa0mu0YZcX7g3tk42+7rJ7cXprNe5DdDp4ODATWnzZJ/+UsVtaAiuqsefBmb3OZ7jykW0MpdWksX2krYpfkYnvV58JhFrjMU/1EW+Oz9W5bM8NyYHs0bSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jnpbPI5B; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jnpbPI5B"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a814c54742so165305ab.1
        for <llvm@lists.linux.dev>; Thu, 23 Jan 2025 08:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737648481; x=1738253281; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQDmKPoAbR7c0QGvmjmPxwpkQvGXQ/s6fxXQ9ADc7Og=;
        b=jnpbPI5BA3B+S3JuyQ3viiLXd+J41jCH22yQl1COtYgdJ5+fFPTa+DOWgZQ/Lpv4sZ
         LkO32kxP47VJ+HzN5Ohv9ZP9yuVOZQvMdFdI6pZkALxuvGQ2ECNTg2mTDeD12BckWtsj
         gm2IY/W+Cb8TiVw/UC69cF8YK+MMFcFWiQ4b1zjmLuMJntzPPxIgm6ipWh7bHOGFlnnv
         X2mmm9YtQu2guE37kMU53+gfjvWBpytgeiI+6GypbWlIhQd90joltv9Mbpw30f2SM3E1
         CPl60yb7PdHIFqJPIXwfs0jifYd4ULmMYPpiiayjYvj9Td8UnCuh1gbtKUF1+o7mDOt9
         R5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737648481; x=1738253281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQDmKPoAbR7c0QGvmjmPxwpkQvGXQ/s6fxXQ9ADc7Og=;
        b=ZYltSolyE+fjvhrMa2rMlCO1Nb1O7lBp2gLotvF0XT/xS2t/a7gYFfLaKY5APZYVAo
         Q24/rtDX9srjVoMNpzzdGtcfa954EnuXgXKqaKZ9gQ/i1vkshES6WIqh0wGih1oC4fMG
         3JzLtkycIFiSop7lYoIMrBJJ2CqoZY1ixQ76lNokYUHCycn2x9PT/HW6M8zVisDtEZOe
         i807b0gZkgXvdiHQzQkchK6jseIpSbRgQhlUX+JXG6ExVb0UJn+zEW+3+H/ss7TjFjCD
         cEwpAFy+xPOE4VxB8rXtF01GmeFMOWaGdbSS9XoTg/5N8NKZeGxjrn2XHl55aSecWAAA
         /caQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3HvbwFWIkQE58Md2nh6WqeSgOi5JzUqcTg8nvlc2nEByi+/emeh4lkpY3Vx2vy08BgIRn@lists.linux.dev
X-Gm-Message-State: AOJu0YznrDZLcMI6eB5WFhlf0SuGbLdecJia5zxW1m1G7Yjdp5QE1M/9
	2pk/M5aj01Qnqbnqxtia1DfEyafZHcL4YMfI6oq+NT2Us4SygcD4Zc3qrehmP8/QH0SzPiPs8UN
	yH9lwAikmI+288x3oaQmBsx3Q5uZ9q6A2Koii
X-Gm-Gg: ASbGnctn/Wi0VBM/MfVilC1j01hHUN6Ky8rZ+FuVk03qEraVeMo6TPQLuhonJXfC7Go
	YixM8CXdCzUDzYBZcSaJNAQfyhf9Z1EpAZv4FkwUdDW/pE3RJvhnduPuy/1VUu6FPntIqf6Ze3W
	EpHo4BmIsUyeT8RQ==
X-Google-Smtp-Source: AGHT+IEXJE46BE9oGbt739cbBwHASjUpEeCbviM8FWa0ovSaM4CyC+OI2+kR+M4VbAO92iS1fs/qHZrGKmHuWnAJN1o=
X-Received: by 2002:a05:6e02:1d14:b0:3a7:7d6e:fef9 with SMTP id
 e9e14a558f8ab-3cfbdebdff2mr3008595ab.27.1737648479856; Thu, 23 Jan 2025
 08:07:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250120173208.344231-1-irogers@google.com> <20250120173208.344231-5-irogers@google.com>
 <Z5FwusFZ_bYlu6aK@google.com> <CAP-5=fX4vtKzMtrEbZhqH0dmKpXY3Ke+pVJ-ZbnHnAVuto7Z8g@mail.gmail.com>
In-Reply-To: <CAP-5=fX4vtKzMtrEbZhqH0dmKpXY3Ke+pVJ-ZbnHnAVuto7Z8g@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 23 Jan 2025 08:07:48 -0800
X-Gm-Features: AWEUYZmuYzja_lRDXich0Xw56IxoG1_AoHvfnNjTcqKJp9HAh_UgwJL40-V3vys
Message-ID: <CAP-5=fXx=q-LHcb9BtjE1AFZGmV55NBWy3HvfWQaABo-YO=4gA@mail.gmail.com>
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

On Wed, Jan 22, 2025 at 2:42=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> On Wed, Jan 22, 2025 at 2:27=E2=80=AFPM Namhyung Kim <namhyung@kernel.org=
> wrote:
> >
> > Hi Ian,
> >
> > On Mon, Jan 20, 2025 at 09:32:07AM -0800, Ian Rogers wrote:
> > > If perf wasn't built against libcapstone, no HAVE_LIBCAPSTONE_SUPPORT=
,
> > > support dlopen-ing libcapstone.so and then calling the necessary
> > > functions by looking them up using dlsym. Reverse engineer the types
> > > in the API using pahole, adding only what's used in the perf code or
> > > necessary for the sake of struct size and alignment.
> >
> > I think reverse engineering the types is fragile.  Can we simply change
> > to dlopen if libcapstone is available?
>
> The current behavior is if HAVE_LIBCAPSTONE_SUPPORT then we will link
> against libcapstone and can assume the header files are present.
>
> The reverse engineering of structs and constants I agree is brittle,
> but these things shouldn't change, it is used in this code when the
> capstone/capstone.h isn't present. If capstone/capstone.h is required
> we could change the ifdefs to indicate:
> 1) capstone is present and we're linking against it (this is
> HAVE_LIBCAPSTONE_SUPPORT today);
> 2) capstone is present but use it by way of dlopen;
> 3) capstone isn't present don't #include, don't link and don't dlopen.
>
> My thought was that this is less good than the reverse engineering.
> (1) relies on the builder having libcapstone, which at build time is a
> warning that flies by. (2) also relies on the builder having to have
> libcapstone and to opt into a dlopen behavior, they'll need to read
> Makefiles to discover this. (3) gives a less good perf tool with in
> the source lots of __maybe_unused and ifdef-ed out functions all over
> the place.
>
> With the reverse engineered values if you have libcapstone then
> HAVE_LIBCAPSTONE_SUPPORT works as before - no change. If you don't
> then you will be opted into getting something better than objdump -
> albeit it could break if the reverse engineered values drift from
> those in capstone/capstone.h. Less build options also is less
> complexity and cleaner code.

To be clear, if the header file values/structs drift then libcapstone
will need to version values/structs, we'll need to update the perf
code to use these, etc. Otherwise a tool linked against an older
libcapstone will break when libcapstone is updated. The code handling
not having any libcapstone, dlopen-ed or not, would be significant as
every static function will need an #ifdef to avoid a not used warning,
every parameter will need a __maybe_unused and the overall code
quality in perf will be worse imo because of this. The no libcapstone
default when not detected would be crappy for users. The values/types
added here are fewer than 20, and so are not a huge maintenance
burden. I did a similar thing for the LLVM C++ symbolizer code and its
maintenance would have been a burden and so abandoned it in the
llvm-c-helpers case that mainly affects addr2line and not disassembly.
Hopefully later LLVM C APIs will make this unnecessary.

Anyway, because of this I won't be changing this in later versions. I
will be carrying these changes in Google's tree and think ideally it
would be carried in the regular tree.

Thanks,
Ian

Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC521DB92A
	for <llvm@lists.linux.dev>; Tue, 17 Dec 2024 06:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734417849; cv=none; b=O3Enp3rRZBOqgaOH+cnHM8c8nSWVrYs9BGWx2tVHO/OQ5NTKzCR4QnqKo2oFbocBpr2cSC1i+zQw65ufZA82A60DWFdbnN7jdWqvdAKMYWPP0pMI4P+NB8lfq8eHmqNQe2x3gQ+6VYOGTNr1AAmlNpDxvDXE3hOsuWvjnORtguc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734417849; c=relaxed/simple;
	bh=XM6EdApDEzksuMmtbmXfUCRcI+WD33NtLIPMOkhyeDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MANFgqHenT6fxXHlnh7aBZnWHyN7lesgRzd2SEox90XXEQwYDNr5mYgCEIF8IlCip+4g18x+pk1+ayU6bukHawckA+YgU/srG1O/drtIfzJ9188AKbXBa4/fW+qhuUlLqEA1dVC4jbQxDCTriVYr/6pSiy6TSSOXfuHt9xAiUho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=O1QrWQjL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="O1QrWQjL"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21634338cfdso58641925ad.2
        for <llvm@lists.linux.dev>; Mon, 16 Dec 2024 22:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734417847; x=1735022647; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sptCrX+fdOk7TfHGeXVf4O4ZKbAw/hvz5tMzXM5QRWU=;
        b=O1QrWQjL1+O7m8uyp1Ps1YdTQOrY8R7oiotHu21NUd5R9v5TH8uBXpAKlLJob4U9KC
         op7wBff9Bcqnj8rqBjCKL6bsBl+eo6+D1rw7rW9cLaExz2SwpOfiKPVRnM1dFo65ipRu
         fpYaCbeEmfGTIVlczlUX1rLBZMUAypPf38B+RvD9JWDggn4K1uvNzRft4lTft/lQasWC
         /YSR74bkJizI+0bOQf31WUxg/tzHkZs472ifvNJCi7XLoh6DJsbdGxv9R8OXO9ZXGM5F
         aqtNMRmXo45DePXtHPV+fcABjn4cFxtXZ4394RhaVjhAd1slA+PDmA7dI+qEhftGNnOi
         vj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734417847; x=1735022647;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sptCrX+fdOk7TfHGeXVf4O4ZKbAw/hvz5tMzXM5QRWU=;
        b=L6HnONcSTa9lurWFOT7opQHSEIuiSfVl257itaOrTwXGOIPDXHQ1om93zDsDgrHkwj
         8HvFz6Vo6Z+uTJeOMC14O18ye8Kal3WPgqZ3P+CKlSga7nCiqtoewRkMpaAT1et0Anek
         Pq6E50lrZjdtVEK3pQSzJi9gKPuTo/J5qOVcqDgDPkBmdAuqvKOly9t9vwdbKF1zAhaD
         dTAS/0+nwtPXQbY0aROR86cCE/RH1rg3BlXJ0lUAqQ1p4qhywtP5/yY8sP5ui0O7CxtF
         2y9vN1vqh+nAslLrAIWunJlhVqcPEcafczPlLIA2MY6x3dE/4YHXhXBzrYctKcsq/ZoO
         e6HA==
X-Forwarded-Encrypted: i=1; AJvYcCXftypr/19AeFrYV4QD/0isz29OKa8ct89Vi7eU/HLAwAshJ8wsPkMSq1WN8uA1ErzjnPGW@lists.linux.dev
X-Gm-Message-State: AOJu0YzfzQ13EUosDQB5sXhdS4jyqo21Ja4LsWVWVa4JPHz5E7+bSpl7
	8jfZo5a6s3hYw48cPfxPzC57P/5uzDlK5iAX/oxlJYKnYvqgG+4VVl27JaYxvIc=
X-Gm-Gg: ASbGnctkvLZIifZa0TkvG0L68Jtt6KE/kEFciJ3Bz1UoGdHuGu9L+NadPOsC7XLCyYD
	1tBwGXsbhTCMloSGJ9YfJM1GG5wcdAC2Mtp2UOyoLKQuQLwedR+Q19TlC8jQkZWhnkDPpOADFRO
	BN9tfy3Y2irziOjUgwtrtVVZxTDwg5Pxgi/JcxLlcKlDvhMLyzAuA4Ho5bhVliwxCtzy8RiBNfR
	mPBc+tdePEhcHfndrwGX7Q3EkNVUF+hFDoEn9XQYdSw3Z+GvT0=
X-Google-Smtp-Source: AGHT+IFbTJRs0BXv1Y7k1oAF2gI2HiBiChGf9jttH4DB2JoV1zZ1F2nYln3NdWZebP2jJGmxHiY0Vg==
X-Received: by 2002:a17:902:cec4:b0:216:2e6d:babd with SMTP id d9443c01a7336-21892a0dfc5mr201253875ad.15.1734417846715;
        Mon, 16 Dec 2024 22:44:06 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:9708:a71e:40e6:860])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e643d5sm53002335ad.235.2024.12.16.22.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 22:44:05 -0800 (PST)
Date: Mon, 16 Dec 2024 22:44:02 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ian Rogers <irogers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Nelson Chu <nelson@rivosinc.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH 2/2] tools: perf: tests: Fix code reading for riscv
Message-ID: <Z2Edsv2VB7D1hq3n@ghost>
References: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
 <20241216-perf_fix_riscv_obj_reading-v1-2-b75962660a9b@rivosinc.com>
 <CAP-5=fVvLv-OtkK57ri1EpM_v=PQZDZijYBpGv_9Smyz8EOm2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fVvLv-OtkK57ri1EpM_v=PQZDZijYBpGv_9Smyz8EOm2g@mail.gmail.com>

On Mon, Dec 16, 2024 at 08:57:20PM -0800, Ian Rogers wrote:
> On Mon, Dec 16, 2024 at 3:13 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > After binutils commit e43d876 which was first included in binutils 2.41,
> > riscv no longer supports dumping in the middle of instructions. Increase
> > the objdump window by 2-bytes to ensure that any instruction that sits
> > on the boundary of the specified stop-address is not cut in half.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/Kconfig              |  5 +++++
> >  tools/perf/tests/code-reading.c | 17 ++++++++++++++++-
> 
> Files under tools use a different Build system than the kernel. The
> Kconfig value won't have an effect. Check out Makefile.config:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/Makefile.config?h=perf-tools-next
> which is included into the build here:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/Makefile.perf?h=perf-tools-next#n313
> 

Ahh okay, thank you. It was properly enabling when I was testing, is
there some bleeding over?

> >  2 files changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index d4a7ca0388c071b536df59c0eb11d55f9080c7cd..f164047471267936bc62389b7d7d9a7cbdca8f97 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -229,6 +229,11 @@ config GCC_SUPPORTS_DYNAMIC_FTRACE
> >         def_bool CC_IS_GCC
> >         depends on $(cc-option,-fpatchable-function-entry=8)
> >
> > +config RISCV_OBJDUMP_SUPPORTS_SPLIT_INSTRUCTION
> > +       # Some versions of objdump do not support dumping partial instructions
> > +       def_bool y
> > +       depends on !(OBJDUMP_IS_GNU && OBJDUMP_VERSION > 24100)
> > +
> >  config HAVE_SHADOW_CALL_STACK
> >         def_bool $(cc-option,-fsanitize=shadow-call-stack)
> >         # https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
> > diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-reading.c
> > index 27c82cfb7e7de42284bf5af9cf7594a3a963052e..605f4a8e1dbc00d8a572503f45053c2f30ad19e3 100644
> > --- a/tools/perf/tests/code-reading.c
> > +++ b/tools/perf/tests/code-reading.c
> > @@ -1,5 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  #include <errno.h>
> > +#include <linux/kconfig.h>
> >  #include <linux/kernel.h>
> >  #include <linux/types.h>
> >  #include <inttypes.h>
> > @@ -183,9 +184,23 @@ static int read_via_objdump(const char *filename, u64 addr, void *buf,
> >         const char *fmt;
> >         FILE *f;
> >         int ret;
> > +       u64 stop_address = addr + len;
> > +
> > +       if (IS_ENABLED(__riscv) && !IS_ENABLED(CONFIG_RISCV_OBJDUMP_SUPPORTS_SPLIT_INSTRUCTION)) {
> 
> It would be nice if this could be a runtime rather than build time detected.

Hmm that is a good point. I will change this to check the version at
runtime.

- Charlie

> 
> Thanks,
> Ian
> 
> > +               /*
> > +                * On some versions of riscv objdump, dumping in the middle of
> > +                * instructions is not supported. riscv instructions are aligned along
> > +                * 2-byte intervals and can be either 2-bytes or 4-bytes. This makes it
> > +                * possible that the stop-address lands in the middle of a 4-byte
> > +                * instruction. Increase the stop_address by two to ensure an
> > +                * instruction is not cut in half, but leave the len as-is so only the
> > +                * expected number of bytes are collected.
> > +                */
> > +               stop_address += 2;
> > +       }
> >
> >         fmt = "%s -z -d --start-address=0x%"PRIx64" --stop-address=0x%"PRIx64" %s";
> > -       ret = snprintf(cmd, sizeof(cmd), fmt, test_objdump_path, addr, addr + len,
> > +       ret = snprintf(cmd, sizeof(cmd), fmt, test_objdump_path, addr, stop_address,
> >                        filename);
> >         if (ret <= 0 || (size_t)ret >= sizeof(cmd))
> >                 return -1;
> >
> > --
> > 2.34.1
> >

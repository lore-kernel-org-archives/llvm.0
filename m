Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242C88BEE
	for <llvm@lists.linux.dev>; Sat, 25 Jan 2025 00:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737766777; cv=none; b=F/kbh9anrkMPmGiEj8/ilFyNjNSikG6RXN10rpCsxZKyNnwx9Q/V2CJFuyL6NqBtZmTCH5P0W8ospd42AZpQEcYgvZh+lB/Dx4Ha0sJmGSOgAm/8vcArPsckGqAGvRRGbe358sQgYIGDMbihYZ3ukg7Lq7MZUjAzxAswHs55D4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737766777; c=relaxed/simple;
	bh=Ilq9sG8JKYA4H+fvAVGKWLkyxIF6IHweN1JBP/ZoAJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LOBA1XV5idpR80zt7Onk3T8hZD5abfq/xNmEMXG8OIrunpFCViWC9OxWMWYTUSV/0b6xF7Y5FC55hunWdCmoRJETPjEQdHJXLeesLARFwof5uHe0r9KfWhq1tW1F/E6FpwcamWvPi72zbeyBOSYH5P+J1EFLs8vNY7frOyYOOx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZBL1Mbkf; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZBL1Mbkf"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a9d0c28589so41935ab.0
        for <llvm@lists.linux.dev>; Fri, 24 Jan 2025 16:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737766774; x=1738371574; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvwNFInayukMcJtdYJm+4EZPaQ/jTSatsUUoZ8KS1Fk=;
        b=ZBL1Mbkfy9mvBtD47tzh3mey+RrfBTFJSVuDruwG/CNXmNX8BYQEL8SiRdnZx6xJMH
         VaCz5Oiv8wjUXc4E6NbKwOMqDrpKfPZgOFtkEbWjqkjvB3XAiVvurtb5wvceSyDuVcFZ
         8vn4hPAjuiyxFxbq3JjzZE0yUqSdE10dWBT3KeafdS0wvO0ePNXO/Kpe0T1cJxjR12M2
         +EsJ6oxVFlgnvhPrrqyy+eHN4ZmSZ1vMhaf4qpWjqsJvgej9TmaP3Yi7dgHEeEo3lrip
         gTxYc5t3JUs5J8k7qnwtFL5ezf4qEFlafCleC7A5Bm/LDytO/HA2j9RfsNh552sbObUi
         ss1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737766774; x=1738371574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvwNFInayukMcJtdYJm+4EZPaQ/jTSatsUUoZ8KS1Fk=;
        b=vZa9he5EyrWH7uPhDb6LVNbkdVnmfE3YkCAbEQjOfJ4IvRlX3LhyA7FP2diUFx41xr
         uWLxVINBvPYbzBi7QPvnQPG73Om9y1EnoRCHDi1bg77OOXd46N6GXX7sQ8/vMOZX6dqa
         Qrakdg0Ul+lSF6jof0iBoRAgjmhpJB76xuAo2Xq5r3xXicvLVGKD4x6Sw/wzLkCnOjRs
         oLYJ93D+HCinpJIjo5cjz791+y6k4A6ns7cggVIKM6Xrt9HJ5NP8mOvJuajp0IMaCL0m
         tPnCcCfRSF2XaRuV34w7QM9ANyl5qYwmzN/gnnqfvnE8B00y5C/57ODIeRa+l9xMHYa1
         7p5A==
X-Forwarded-Encrypted: i=1; AJvYcCVPGD9p/+vnvXRUCcQLi6AiDok7lRtczdMNC+Ph+gt06LXMb+vT7pSL0bCjT3uK68n003jJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzNsoHM34BlmMZLzH1qWATGGq0McvtB9xj473CuujqM1q3i0ASk
	94bwLvj/oq4lWLUXvzKZqHDcNHG7kRm2Qk+1IQ+uxPzN1A/0gQW/qqorNSt9EMzvxaNJGWsk/W0
	csi3AOl75Yl6Z4RlO0c9hk/iDoH8+k7tmgJPs
X-Gm-Gg: ASbGncvdqa+NHN45V2vGFRphOK2DGJiYjD7wKR5Re7OSQr/UqxB2fN7CdjahWRsDkxp
	zzCgoZADU8WZec/tftSh8ZQoryNTHqGq9HEtZElYchTY8EFiVvOH8Dn5PERVJ7wg=
X-Google-Smtp-Source: AGHT+IGh6ivw0qBP88gyiao18KHDgot1XcauQGKSYwcM9daOgt1ih9JPzBPb/ZTgOfAUg0HkcgcVg7rmGc4ArDfHqMU=
X-Received: by 2002:a05:6e02:1a4c:b0:3cf:cb47:9963 with SMTP id
 e9e14a558f8ab-3cfd20f3b7amr730665ab.25.1737766773969; Fri, 24 Jan 2025
 16:59:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250122174308.350350-1-irogers@google.com> <20250122174308.350350-4-irogers@google.com>
 <Z5QM8nHzwuQYczyQ@google.com>
In-Reply-To: <Z5QM8nHzwuQYczyQ@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 24 Jan 2025 16:59:21 -0800
X-Gm-Features: AWEUYZmjvpS3jmWoPhF4fcTYu0oQT1XVXYfxlbBmbmP1TgNbAdiddMkuBPFhAFw
Message-ID: <CAP-5=fV0w9tLFr7xYHFUH=UUq+tr+o5EYUik0d74rMWa9=Qi+A@mail.gmail.com>
Subject: Re: [PATCH v3 03/18] perf capstone: Move capstone functionality into
 its own file
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Changbin Du <changbin.du@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, James Clark <james.clark@linaro.org>, 
	Kajol Jain <kjain@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Li Huafei <lihuafei1@huawei.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, Chaitanya S Prakash <chaitanyas.prakash@arm.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, Song Liu <song@kernel.org>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 1:58=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Wed, Jan 22, 2025 at 09:42:53AM -0800, Ian Rogers wrote:
> > Capstone disassembly support was split between disasm.c and
> > print_insn.c. Move support out of these files into capstone.[ch] and
> > remove include capstone/capstone.h from those files. As disassembly
> > routines can fail, make failure the only option without
> > HAVE_LIBCAPSTONE_SUPPORT. For simplicity's sake, duplicate the
> > read_symbol utility function.
> >
> > The intent with moving capstone support into a single file is that
> > dynamic support, using dlopen for libcapstone, can be added in later
> > patches. This can potentially always succeed or fail, so relying on
> > ifdefs isn't sufficient. Using dlopen is a useful option to minimize
> > the perf tools dependencies and potentially size.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/builtin-script.c  |   2 -
> >  tools/perf/util/Build        |   1 +
> >  tools/perf/util/capstone.c   | 536 +++++++++++++++++++++++++++++++++++
> >  tools/perf/util/capstone.h   |  24 ++
> >  tools/perf/util/disasm.c     | 358 +----------------------
> >  tools/perf/util/print_insn.c | 117 +-------
> >  6 files changed, 569 insertions(+), 469 deletions(-)
> >  create mode 100644 tools/perf/util/capstone.c
> >  create mode 100644 tools/perf/util/capstone.h
> >
> > diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
> > index 33667b534634..f05b2b70d5a7 100644
> > --- a/tools/perf/builtin-script.c
> > +++ b/tools/perf/builtin-script.c
> > @@ -1200,7 +1200,6 @@ static int any_dump_insn(struct evsel *evsel __ma=
ybe_unused,
> >                        u8 *inbuf, int inlen, int *lenp,
> >                        FILE *fp)
> >  {
> > -#ifdef HAVE_LIBCAPSTONE_SUPPORT
> >       if (PRINT_FIELD(BRSTACKDISASM)) {
> >               int printed =3D fprintf_insn_asm(x->machine, x->thread, x=
->cpumode, x->is64bit,
> >                                              (uint8_t *)inbuf, inlen, i=
p, lenp,
> > @@ -1209,7 +1208,6 @@ static int any_dump_insn(struct evsel *evsel __ma=
ybe_unused,
> >               if (printed > 0)
> >                       return printed;
> >       }
> > -#endif
> >       return fprintf(fp, "%s", dump_insn(x, ip, inbuf, inlen, lenp));
> >  }
> >
> > diff --git a/tools/perf/util/Build b/tools/perf/util/Build
> > index 5ec97e8d6b6d..9542decf9625 100644
> > --- a/tools/perf/util/Build
> > +++ b/tools/perf/util/Build
> > @@ -8,6 +8,7 @@ perf-util-y +=3D block-info.o
> >  perf-util-y +=3D block-range.o
> >  perf-util-y +=3D build-id.o
> >  perf-util-y +=3D cacheline.o
> > +perf-util-y +=3D capstone.o
> >  perf-util-y +=3D config.o
> >  perf-util-y +=3D copyfile.o
> >  perf-util-y +=3D ctype.o
> > diff --git a/tools/perf/util/capstone.c b/tools/perf/util/capstone.c
> > new file mode 100644
> > index 000000000000..c0a6d94ebc18
> > --- /dev/null
> > +++ b/tools/perf/util/capstone.c
> > @@ -0,0 +1,536 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +#include "capstone.h"
> > +#include "annotate.h"
> > +#include "addr_location.h"
> > +#include "debug.h"
> > +#include "disasm.h"
> > +#include "dso.h"
> > +#include "machine.h"
> > +#include "map.h"
> > +#include "namespaces.h"
> > +#include "print_insn.h"
> > +#include "symbol.h"
> > +#include "thread.h"
> > +#include <fcntl.h>
> > +#include <string.h>
> > +
> > +#ifdef HAVE_LIBCAPSTONE_SUPPORT
> > +#include <capstone/capstone.h>
> > +#endif
>
> I think you can use a big #ifdef throughout the file to minimize the
> #ifdef dances.  Usually it goes to the header to provide dummy static
> inlines and make the .c file depends on config.  But I know you will
> add dlopen code for the #else case later.

So I think big ifdefs like:

#if HAVE_xyz
// 100s of lines
#else
// 100s of lines
#endif

are best avoided. It is also the point of the shim-ing that we do

... perf_foobar(...)
{
#if NO_SHIM
  ... foobar(...);
#else
  //dlsym code
#endif
}

Having the shimming and not shimming as two separate functions buried
in a 100 #ifdef loses that the code is common except for the shimming.

For example, in the current code we have find_file_offset:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/util/disasm.c?h=3Dperf-tools-next&id=3D91b7747dc70d64b5ec56ff=
e493310f207e7ffc99#n1371

It is only possible to understand the use of this seemingly common
code by trying to interpret what's going on with the #ifdefs.

I think it stylistically it is okay to have multiple stubbed out
functions inside a #if or #else, such as:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/include/linux/perf_event.h?h=3Dperf-tools-next&id=3D91b7747dc70d64b5ec56=
ffe493310f207e7ffc99#n1797

But when the logic is shared and all in one file it becomes next to
impossible to determine what's in use and what's not. Other than by
tweaking things and trying to get build errors.

So for the shims I've placed the #if inside the function to make it
clear the function is a shim. For the other functions that are over
100s of lines, for clarity the individual functions have #if
HAVE_LIBLLVM_SUPPORT around them to make it clear that the function
only has a meaning in that context - ie the source code doesn't make
you go on a #ifdef finding expedition to try to understand when the
code is in use.

Thanks,
Ian

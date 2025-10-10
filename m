Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC4F2749F2
	for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 07:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760083093; cv=none; b=tG/Ql7W2oKP5cwBQDHhylHcID+hgDv3NFNXlyeVP+00ypdpqA1/fk1wMQ+Xj18G8rZ3N6eWjJZfSrmIBog3q02xbDmB1q8+Wxr21yoa0XSlfPZodnaHa0rLoOYQCzFQIWoD/StDgbnhKOeKIm1Mq1/NvHik/77PtTaKuiVIgUwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760083093; c=relaxed/simple;
	bh=/EqQHNRDCS2YqzBq0RkItK1pvs5vi0KLmvOMTFqnmTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzL+xLt/tl8sT9UAo9VBAl4K2jKWoXdVgWbOT1itYUxCA96Zkn5xX+UP0ptzEwGepPhSf1aTUaZc/qRrZ2HtlEHJEwjecPFT+BGdGH9+0FZMvv2eOmY54p2IM94Tib97IegAaPDdJjyu/WoVJaoF4FyYVmsUcEsRPiTO/ShWDIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdgagE4i; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdgagE4i"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-28a5b8b12a1so17038315ad.0
        for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 00:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760083091; x=1760687891; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Nucw4E7LkwzxjCbFb3F737DKijbeBN9zMwZ0PDOoZQ=;
        b=mdgagE4iA7goKEiJVFrTkOXHkjFDuM9oOCJ77BMSFcZHSGEQf7CfjjPXCQgq37aihM
         tkVBooj7jKDSa99zjVdPH6nKJXiEFuqLB3a2T5k7TJBX6czCwqkT7KqKQN4MJaj0ReV8
         ViHxEwd65TZF0P/MG2ECoBWp4idQRy4HXEMwiM3CKbqJ9iYdrykfyNfB+78mCLUmLSAN
         GHAbVbyzkcZAlIbPsBDUhA8zME4OO045pH9MqtDMf2RYaIbSF97gkQCty7B+vfo4GGPs
         hjV63kgJGzeGYcfV5qMNEJ4lFK5nTZ2kNGklNgz/oU2R3Xu5cW5psh++WxNZwPlEvjMI
         7vRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760083091; x=1760687891;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Nucw4E7LkwzxjCbFb3F737DKijbeBN9zMwZ0PDOoZQ=;
        b=vTLHH7zUimL3CUu3p/CbS9F89dHyd8KTnaW0IZS8Zq6qqe1ckHHoo2PnuYoiIPLWAI
         nfs9U4sdjz1yFBGkA0BMkFae7aHYA9a0/3hBsBt6EEP8oP+15yCwpMH6c73tAQKkhWIg
         3LzhGl6KeCUlmK0DSq4mTT+/H6nr1slN/PLPHzUGMOXDWTUQTKmFhzbLGS79A0C5fMiz
         XAMHdBueMUjzy9ETz1z7IGAcE5cFxneynStiIHiFy+qcIDWeHvf/llBHZKEs50jDXwaj
         bKTvMSV6yf80aB/RgjS6fU7xzF6Uhu0ixhlJ4sdpRsrbsSAsJ5QhR5NDjMC6bC53QWBF
         JuaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5tUuiYGw8zDbh4urSoebyF86JBRtNyNvW5a+9TfwZGH8x7GHz6HtO9hBuJj8IVA6DyiT9@lists.linux.dev
X-Gm-Message-State: AOJu0YwRcwQNOc9QZxSXouN6XUmLYDEx2+VzS9VwRAtV+nD2xsBWWOcQ
	68mgcJ0YKScv6HbB7mxeaeOA2atjCQj05V9ZRBxbiMbwRgFtPWMRFHLT
X-Gm-Gg: ASbGnctGJO8LBC1uCt8MTh8Vol51QszDeW4ME6VXCNQ8Y7QGrVkymmmz9ZGbGAs62e4
	Cwp0LF3oDZnrkrfdUjNd3GrI+dGoAoemMdfG+DHXUUDsAEfWEYjaj6ASzwjnh2bJVfLxbN14TL+
	hauONoIm2iOy7HWvTs3ETNX2pFiWNSjHxdUkXJ05fNxkMSIQjFVFK3959u5eCsxx0XrQU08tZoJ
	OgreEwFzsQuD8FeDwnQvcQrE5rgfm7l4UDD437WIV7jnH7gKf4nbzQJWItna0I+0AL33C1DByCt
	OzyBcl4/p/w+RFhqiNl/9hQq1hsMz+Ly1DAlmKjevHlL8tt0lEhCil+d6KlW3YPH9G5rhpPIQMk
	w+MUvGqJsYTS3H7X8OBpIG8Dc78hXHnqQB8jvm+xKT1IAjhy6DfUCEzU1rMHU/9O3//o=
X-Google-Smtp-Source: AGHT+IFeywA6gB4/SQbmJGvT2KY5YTMhXWywBtcaIqaAsauF4r7EzLqcGRXLsSas3aRqscvIRrL6Qg==
X-Received: by 2002:a17:903:298e:b0:28e:756c:7082 with SMTP id d9443c01a7336-29027374b38mr134966335ad.15.1760083090502;
        Fri, 10 Oct 2025 00:58:10 -0700 (PDT)
Received: from localhost ([103.121.208.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f070ecsm49587725ad.60.2025.10.10.00.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 00:58:09 -0700 (PDT)
Date: Fri, 10 Oct 2025 15:58:03 +0800
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>, Rong Xu <xur@google.com>,
	Naveen N Rao <naveen@kernel.org>,
	David Kaplan <david.kaplan@amd.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>, Nam Cao <namcao@linutronix.de>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-mm@kvack.org, llvm@lists.linux.dev,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com, "David S. Miller" <davem@davemloft.net>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/23] mm/ksw: Introduce real-time KStackWatch
 debugging tool
Message-ID: <aOi8i1Y0decaamaX@mdev>
References: <20251009105650.168917-1-wangjinchao600@gmail.com>
 <20251009175107.ee07228e3253afca5b487316@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251009175107.ee07228e3253afca5b487316@linux-foundation.org>

On Thu, Oct 09, 2025 at 05:51:07PM -0700, Andrew Morton wrote:
> On Thu,  9 Oct 2025 18:55:36 +0800 Jinchao Wang <wangjinchao600@gmail.com> wrote:
> 
> > This patch series introduces KStackWatch, a lightweight debugging tool to detect
> > kernel stack corruption in real time. It installs a hardware breakpoint
> > (watchpoint) at a function's specified offset using `kprobe.post_handler` and
> > removes it in `fprobe.exit_handler`. This covers the full execution window and
> > reports corruption immediately with time, location, and a call stack.
> > 
> > The motivation comes from scenarios where corruption occurs silently in one
> > function but manifests later in another, without a direct call trace linking
> > the two. Such bugs are often extremely hard to debug with existing tools.
> > These scenarios are demonstrated in test 3–5 (silent corruption test, patch 20).
> > 
> > ...
> >
> >  20 files changed, 1809 insertions(+), 62 deletions(-)
> 
> It's obviously a substantial project.  We need to decide whether to add
> this to Linux.
> 
> There are some really important [0/N] changelog details which I'm not
> immediately seeing:

Thanks for the review and questions.

> 
> Am I correct in thinking that it's x86-only?  If so, what's involved in
> enabling other architectures?  Is there any such work in progress?

Currently yes.
There are two architecture-specific dependencies:

- Hardware breakpoint (HWPB) modification in atomic context.
  This has been implemented for x86 in patches 1–3.
  I think it is not a big problem for other architectures.

- Stack canary locating mechanism, which does not work on parisc:
  - Automatic canary discovery scans from the stack base to high memory.
  - This feature is optional; a stack offset address can be provided instead.

Future work could include enabling support for other architectures such
as arm64 and riscv once their hardware breakpoint implementations allow
safe modification in atomic context. I do not currently have the
environment to test those architectures, but the framework was designed
to be generic and can be extended by contributors familiar with them.

> What motivated the work?  Was there some particular class of failures
> which you were persistently seeing and wished to fix more efficiently?
> 
> Has this code (or something like it) been used in production systems? 
> If so, by whom and with what results?

The motivation came from silent stack corruption issues. They occur
rarely but are extremely difficult to debug. I personally encountered
two such bugs which each took weeks to isolate, and I know similar
issues exist in other environments. KStackWatch was developed as a
result of those debugging efforts. It has been used mainly in my own
debugging environment and verified with controlled test cases
(patches 17–21). If it had existed earlier, similar bugs could have
been resolved much faster.

> 
> Has it actually found some kernel bugs yet?  If so, details please.

It was designed to help diagnose bugs whose existence was already known
but whose root cause was difficult to locate. So far it has been used
in my personal environment and can be validated with controlled test
cases in patches 17–21.

> 
> Can this be enabled on production systems?  If so, what is the
> measured runtime overhead?

I believe it can.  The overhead is summarized below.

Without watching:
  - Per-task context: 2 * sizeof(ulong) + 4 bytes (≈20 bytes on x86_64)

With watching:
  - Same per-task context as above
  - One or more preallocated HWBPs (configurable, at least one)
  - Small additional memory for managing HWBP and context state
  - Runtime overhead (measured on x86_64):

       Type                 |   Time (ns)  |  Cycles
       -----------------------------------------------
       entry with watch     |     10892    |   32620
       entry without watch  |       159    |     466
       exit  with watch     |     12541    |   37556
       exit  without watch  |       124    |     369

Would you prefer that I include the measurement code (used to collect the
timing and cycle statistics shown above) in the next version of the patch
set, or submit it separately as an additional patch?

-- 
Jinchao

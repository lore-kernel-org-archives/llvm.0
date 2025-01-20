Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC235149C69
	for <llvm@lists.linux.dev>; Mon, 20 Jan 2025 17:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737394345; cv=none; b=WjLCmeN8xBffMdVT2Oey7h89vgqFC6Dl9WC3O1O5cZVS89oS3dX74YPsWA8929WMPCVknZxa2eSednd/TcOWZ4FGLRlFwwL373QGwaCnXH+ivKuD0+Xh2qY0dI9lmEhGKmuEXkUICY/s72t6X40cIIx31KsWTjDhXSYvvOtHJfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737394345; c=relaxed/simple;
	bh=XoxEYV+VDCUQVGr/fXdELyMg5VnHtJqPGO/sRS5XXiA=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Content-Type; b=h2iAPRN/JhacbJh0rlMM9vawkSouf+pN7pcu5pOzoV+aQPV52J5yccLmFIWJ3zYSfqv93y85Q+7CADd75Imm/erfn/8ftYF3VmPCQZiI5GRGhLWlWl5Nshrfh7rn1Jjn1/dMctucJZhqutynarhBM1lFwafHamgz6Mn+gsklL5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OsBiVpnW; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OsBiVpnW"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e54e14f7cbcso382436276.1
        for <llvm@lists.linux.dev>; Mon, 20 Jan 2025 09:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737394343; x=1737999143; darn=lists.linux.dev;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tkLT2dzsqbCe/JB8KOi2Tl3KKIFyxEh2X9A7KSrmrTY=;
        b=OsBiVpnWeHV+tjev3M+TRZUplRUAQyiwaK6B7hBFKL96soV0yoJKDj4QLdDT9x+Bbr
         B8Qpj2pFPWqNWcQOyUH4cyHCab1CBQcsNR5wRwcQfAimqidau2hJN74GSNetWd4jprc8
         ESWxap87feJ6BeBd0vsXvkZT9CaQB46zvLqockLSmKQtf00QbnnUl0+zWdoHN2QVj3a2
         2alab9ix0mYEXc0EDAWWpRQamnF/nd0vfH5eue56J2ruDpw9d8eKyBKLj65BI1klq+tR
         mG0YAmmw/dtk7ZR1OEZ5g4FxfUSjuf235ct8cv4NwqAvBiHPDZm+CpdUXmK9vimCTQD1
         fq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737394343; x=1737999143;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tkLT2dzsqbCe/JB8KOi2Tl3KKIFyxEh2X9A7KSrmrTY=;
        b=a8GoroTp7CC/hdDbwCTCWmf66/jsdZvGV0+MCNZx7tMskoYOC5XFSeL8pp5Vr8QaGK
         563qkPxIM0QKMweIzDTDPv5LhIFvFkmBeI1ytEqimwI6TMpFhVFhbXbvsEDDuw9gCm6A
         uVbyc6zGVdZHhs//Vt/Qq/fX/D88kPxjda5+a69djtsyO8UNPmjje0/aUztaehY8DXUi
         sehgWBekEGmVgweJ3XDNFomXPcpSZtwF7UKNNA1Zej1TVdylmpw7q7NVHD345rEUj/V0
         nPRtF8FerPUkH96XE6t+WNG3UBJZRyXATWKVkcJnEzpHJAJNI6HYairgeS9FSwJU8UpC
         X+bg==
X-Forwarded-Encrypted: i=1; AJvYcCUzOsQd7DNXrBKB8m5FWYHB15LkSxo0+f5Oim1ulY1XKG7D43Ua4j+Ok4Wf5xMFRW4Jt5Ls@lists.linux.dev
X-Gm-Message-State: AOJu0YwA0RqiwiaHU4zu4YNDTZ9V9u69aYWvTgH2EB0pqy4hFFh8gwyz
	CNl9SkofQWkazq1KlxnrxGKEvV76oTAlcSCnImkE8XN7VUHw7Nnj6gE2K6Y5pHu0HhKfnicI9XG
	8v21YCQ==
X-Google-Smtp-Source: AGHT+IGyt38/W4/BJDU9pXXSoXiIU1Y17e/2AaBaByDFhkf5NXiPNpYen3rqRmeKMY//v6VlvxwMbsh0wDML
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:fc95:312:c7ce:d18e])
 (user=irogers job=sendgmr) by 2002:a25:d642:0:b0:e38:225a:c3be with SMTP id
 3f1490d57ef6-e578a3e1d28mr61426276.5.1737394342834; Mon, 20 Jan 2025 09:32:22
 -0800 (PST)
Date: Mon, 20 Jan 2025 09:32:03 -0800
Message-Id: <20250120173208.344231-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Subject: [PATCH v1 0/5] Support dynamic opening of capstone and libLLVM
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Changbin Du <changbin.du@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, James Clark <james.clark@linaro.org>, 
	Kajol Jain <kjain@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Li Huafei <lihuafei1@huawei.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Linking against libcapstone and libLLVM can be a significant increase
in dependencies and size of memory footprint. For something like `perf
record` the disassembler and addr2line functionality won't be
used. Support dynamically loading these libraries using dlopen and
then calling the appropriate functions found using dlsym.

The patch series:
1) moves the capstone and LLVM code to their own C files,
2) simplifies a little the capstone code,
3) adds perf_ variants of the functions that will either directly call
   the function or use dlsym to discover it.

The addr2line LLVM functionality is written in C++. To avoid linking
against libLLVM for this, a new LIBLLVM_DYNAMIC option is added where
the C++ code with the libLLVM dependency will be built into a
libperf-llvm.so and that dlsym-ed and called against.

Ian Rogers (5):
  perf capstone: Move capstone functionality into its own file
  perf llvm: Move llvm functionality into its own file
  perf capstone: Remove open_capstone_handle
  perf capstone: Support for dlopen-ing libcapstone.so
  perf llvm: Support for dlopen-ing libLLVM.so

 tools/perf/Makefile.config         |  13 +
 tools/perf/Makefile.perf           |  23 +-
 tools/perf/builtin-script.c        |   2 -
 tools/perf/tests/make              |   2 +
 tools/perf/util/Build              |   4 +-
 tools/perf/util/capstone.c         | 723 +++++++++++++++++++++++++++++
 tools/perf/util/capstone.h         |  24 +
 tools/perf/util/disasm.c           | 612 +-----------------------
 tools/perf/util/disasm.h           |   2 +
 tools/perf/util/llvm-c-helpers.cpp | 113 ++++-
 tools/perf/util/llvm.c             | 537 +++++++++++++++++++++
 tools/perf/util/llvm.h             |  24 +
 tools/perf/util/print_insn.c       | 117 +----
 tools/perf/util/srcline.c          |  65 +--
 tools/perf/util/srcline.h          |   6 +
 15 files changed, 1481 insertions(+), 786 deletions(-)
 create mode 100644 tools/perf/util/capstone.c
 create mode 100644 tools/perf/util/capstone.h
 create mode 100644 tools/perf/util/llvm.c
 create mode 100644 tools/perf/util/llvm.h

-- 
2.48.0.rc2.279.g1de40edade-goog


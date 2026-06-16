Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB0C426EB6;
	Tue, 16 Jun 2026 10:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604890; cv=none; b=WcuqWDR5R1uzouIpeSx+mE1THcunpldFNixHhav6ViPrby96SgnGpxr4I8L9FecyhkWT8RsjFF5JxrtuSbqevIlTgzp0DK9EwqOY7DyIjFxEaH+PeQaJgdkV+GCWw8vaiNwsUQaOY02/E2S8QsvSeWGO8ALovyNQK6cR/zMlCUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604890; c=relaxed/simple;
	bh=Ab2iWGGawQ8+zbPNFr/8zoXyc2DvPAVpLN1H32TDD4Q=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=C7fEO8AQbX5eFuo+YX9HHtOzr+1RWUn/D2csxZ49D91xiuxKgJF/hX7hOwSKDdjJUeX5hAzwNYR3SgJdrrCPqJdBiPSuBLiOIFsGN23zFrLPfw5496X0QinTeSi4WnhkMuR8lIJvQLQDAbTfp+ecznBAwaY+wHOZjMJ51bfjftU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nLQKHluz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nLQKHluz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 196191F000E9;
	Tue, 16 Jun 2026 10:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781604889;
	bh=bymKJZqbdh9ytLXLyS/sDJQBHxJNBOyH9cCWnqVp6qk=;
	h=Subject:To:Cc:From:Date:In-Reply-To;
	b=nLQKHluzJ0+1E8U9B+IabOFNVfhkopDEqFWfXxT6JBNykEFQHNzWBZxJ+ayY47rsr
	 YSD0a+Zypfwc/bVv7vO8Ao09Y2b/tf/MCswLm4bR6NWaBK6mJ8FoIMi81cz8N1qAnV
	 A0Jzx/qKZliTkvMincp8QNjqYC7UrR5PiXWCixdU=
Subject: Patch "perf build: Conditionally define NDEBUG" has been added to the 6.1-stable tree
To: acme@kernel.org,acme@redhat.com,adrian.hunter@intel.com,alexander.shishkin@linux.intel.com,bcm-kernel-feedback-list@broadcom.com,florian.fainelli@broadcom.com,gregkh@linuxfoundation.org,irogers@google.com,jolsa@kernel.org,llvm@lists.linux.dev,mark.rutland@arm.com,mingo@redhat.com,namhyung@kernel.org,nathan@kernel.org,ndesaulniers@google.com,pbonzini@redhat.com,peterz@infradead.org,seanjc@google.com,trix@redhat.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 16 Jun 2026 15:43:43 +0530
In-Reply-To: <20260520163320.3073037-2-florian.fainelli@broadcom.com>
Message-ID: <2026061643-sturdy-pusher-35a0@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore


This is a note to let you know that I've just added the patch titled

    perf build: Conditionally define NDEBUG

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     perf-build-conditionally-define-ndebug.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-250203-greg=kroah.com@vger.kernel.org Wed May 20 22:29:26 2026
From: Florian Fainelli <florian.fainelli@broadcom.com>
Date: Wed, 20 May 2026 09:33:16 -0700
Subject: perf build: Conditionally define NDEBUG
To: stable@vger.kernel.org
Cc: Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Sean Christopherson <seanjc@google.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM), linux-kernel@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM), bpf@vger.kernel.org (open list:BPF [MISC]), llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT), bcm-kernel-feedback-list@broadcom.com
Message-ID: <20260520163320.3073037-2-florian.fainelli@broadcom.com>

From: Ian Rogers <irogers@google.com>

commit 616b14b47a86d880ba21a363440f20f82152d8f2 upstream

When a build is done without DEBUG=1 then define NDEBUG. This will
compile out asserts and other debug code.

Signed-off-by: Ian Rogers <irogers@google.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/r/20230330183827.1412303-1-irogers@google.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/perf/Makefile.config |    1 +
 1 file changed, 1 insertion(+)

--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -228,6 +228,7 @@ ifndef DEBUG
 endif
 
 ifeq ($(DEBUG),0)
+CORE_CFLAGS += -DNDEBUG=1
 ifeq ($(CC_NO_CLANG), 0)
   CORE_CFLAGS += -O3
 else


Patches currently in stable-queue which might be from florian.fainelli@broadcom.com are

queue-6.1/perf-build-remove-wno-unused-but-set-variable-from-the-flex-flags-when-building-with-clang-13.0.0.patch
queue-6.1/perf-build-conditionally-define-ndebug.patch
queue-6.1/perf-parse-events-make-yydebug-dependent-on-doing-a-debug-build.patch
queue-6.1/perf-build-disable-fewer-bison-warnings.patch
queue-6.1/tools-build-add-3-component-logical-version-comparators.patch

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7DF3AD505;
	Tue, 16 Jun 2026 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604912; cv=none; b=QLSGXFuh8+klKQq1RcYXa4dhRZyH0iHuek0YUpmnmfA2EwzPGlbOK/Z2oedyVen1oDL0LIhM56VW7+FLpe6A5LhxtxGmb2YYL7hF3FmayM9MMORcqqAK6YZ1OccfEByb38imAq5mEDzCmE1Wp0gTPmWxEKDU/Q33+EtB8V+VFiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604912; c=relaxed/simple;
	bh=DAywrNqU+URgnFnUBkp8rWz2nNyMAvCvafyHha+nXEs=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=J2UZpYG+MM/CHI64Cro9zqNhD/PSnXORMaB4ltgEvPGQUDjklx122JuQ9AuN7TPnlo1mcQYSbnqJy+5EXc7qbuPCeoeLMF7hNz1C1vqq0BVCJo4dxzLN946n4eJ+nM0OzIV/1mMYgfeu+ExRvfeLL+sCByWbyqdKuSXjv5cw2+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ERJA7kiT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ERJA7kiT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74D11F000E9;
	Tue, 16 Jun 2026 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781604910;
	bh=J8qQPMGtvjBZ3aDzfFa0tkjGHMWPgrEMNI0bEORgO0E=;
	h=Subject:To:Cc:From:Date:In-Reply-To;
	b=ERJA7kiT5g+VJ1CVAiys7OqayyyljXTXTx2qecRrRc0+LTtC9zPeiVEIqrg1E9yht
	 3i9Ened1ud1qxPu/sxWXztVG+XhwaPp7We2FtOCGJJguy8U0TvR2AHIW0BQ+hXRDiV
	 WbjxvusAY4GJe/vVW+kb0NGpn8mv7kJhVI3Uqors=
Subject: Patch "perf parse-events: Make YYDEBUG dependent on doing a debug build" has been added to the 6.1-stable tree
To: acme@kernel.org,acme@redhat.com,adrian.hunter@intel.com,alexander.shishkin@linux.intel.com,bcm-kernel-feedback-list@broadcom.com,cuigaosheng1@huawei.com,florian.fainelli@broadcom.com,gregkh@linuxfoundation.org,irogers@google.com,james.clark@arm.com,jolsa@kernel.org,kan.liang@linux.intel.com,llvm@lists.linux.dev,mark.rutland@arm.com,mingo@redhat.com,namhyung@kernel.org,nathan@kernel.org,ndesaulniers@google.com,peterz@infradead.org,robh@kernel.org,trix@redhat.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 16 Jun 2026 15:43:45 +0530
In-Reply-To: <20260520163320.3073037-3-florian.fainelli@broadcom.com>
Message-ID: <2026061644-harvest-anyhow-af34@gregkh>
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

    perf parse-events: Make YYDEBUG dependent on doing a debug build

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     perf-parse-events-make-yydebug-dependent-on-doing-a-debug-build.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-250204-greg=kroah.com@vger.kernel.org Wed May 20 22:58:26 2026
From: Florian Fainelli <florian.fainelli@broadcom.com>
Date: Wed, 20 May 2026 09:33:17 -0700
Subject: perf parse-events: Make YYDEBUG dependent on doing a debug build
To: stable@vger.kernel.org
Cc: Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Gaosheng Cui <cuigaosheng1@huawei.com>, Ingo Molnar <mingo@redhat.com>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, bpf@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM), linux-kernel@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM), llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT), bcm-kernel-feedback-list@broadcom.com
Message-ID: <20260520163320.3073037-3-florian.fainelli@broadcom.com>

From: Ian Rogers <irogers@google.com>

commit d4ce60190e08d84f88937019defa5e3d23409ac1 upstream

YYDEBUG enables line numbers and other error helpers in the generated
parse-events-bison.c. These shouldn't be generated when debugging
isn't enabled.

Signed-off-by: Ian Rogers <irogers@google.com>
Acked-by: Namhyung Kim <namhyung@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: James Clark <james.clark@arm.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rob Herring <robh@kernel.org>
Cc: bpf@vger.kernel.org
Link: https://lore.kernel.org/r/20230911170559.4037734-2-irogers@google.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/perf/util/parse-events.y |    2 ++
 1 file changed, 2 insertions(+)

--- a/tools/perf/util/parse-events.y
+++ b/tools/perf/util/parse-events.y
@@ -6,7 +6,9 @@
 
 %{
 
+#ifndef NDEBUG
 #define YYDEBUG 1
+#endif
 
 #include <fnmatch.h>
 #include <stdio.h>


Patches currently in stable-queue which might be from florian.fainelli@broadcom.com are

queue-6.1/perf-build-remove-wno-unused-but-set-variable-from-the-flex-flags-when-building-with-clang-13.0.0.patch
queue-6.1/perf-build-conditionally-define-ndebug.patch
queue-6.1/perf-parse-events-make-yydebug-dependent-on-doing-a-debug-build.patch
queue-6.1/perf-build-disable-fewer-bison-warnings.patch
queue-6.1/tools-build-add-3-component-logical-version-comparators.patch

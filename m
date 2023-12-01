Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4365101A
	for <llvm@lists.linux.dev>; Fri,  1 Dec 2023 23:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MpMy6PSw"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-db4038d7cfdso1418535276.2
        for <llvm@lists.linux.dev>; Fri, 01 Dec 2023 15:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701474657; x=1702079457; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9lUnGKwfnXUenrlTEoRlDOWCoPKyTMDM98VpoOLbg3Q=;
        b=MpMy6PSwsjC08cyUMzGP4gvFwUw35Tf02rtYNQIVfiuFYAwljxLnBoM09ypNGAuPLv
         azJKAYsDZb22jTI0gra8otEhR90BpTLLZGyO+3RxHa1b+nXnQgdrDO0i+fwB95wcPTnJ
         aj88qYSj9X2mvCJDknI0WZN4yKtYKTWQkGmWBSZn3NKMpveyxw2tnvSFyu3A0HOISiA9
         KGHKg2No3SOpY3s06gdguX305/Re/nG/DhikGjt/gkIq/81U5h/IyixTqTYm7usJ9OsJ
         UoXGA85LDVcpdbSZgPozBBfW/I79d5RSFRazVPAILjIsYw0kjqJyyZ9xbK63ai0j2VHx
         c6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701474657; x=1702079457;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9lUnGKwfnXUenrlTEoRlDOWCoPKyTMDM98VpoOLbg3Q=;
        b=peCBYr20rD3ChlfzJCqfhY80o9sZIBXl/+DBu9pPrNP8tp2AAlFT8EV07TjS9dxldn
         j2n66TYKuR9UitCiODiLL9QqqPfmGaYi4n9gtflapSVKowjtZ1+vO0oqtxWlHYNyLTcL
         dOA4tPGgXOpDHjEKfR6RVxRVdvPNlox+Y5iNO+f59m4WknzUi/4bNTTO6W184AaDTWV+
         4Kx4oJivhnnULVAZj+n8Su52Mg6G1Os0IxG4dSKwSeWSNsNkMY9/INLQJqkflj7h0Ahd
         r9IQDRSywNhL8Z4nZdNFj56JPszi/8PTIgYBjGNLaUK4jEtWrbrTYCGd1OVN9/jZWoOy
         TmmQ==
X-Gm-Message-State: AOJu0Yxaw6y9s1HQoJ2p3DC2T4oUs/gCbs1//ZCMAXn0FI+kRpNgBFev
	TE7U2i1yUWMHel4C+KOu8njI5nVLZwH6
X-Google-Smtp-Source: AGHT+IHhTfxjeqb/2Oow+1932o5xoEw597jdDkx3b5HoCXdGGldelKroIRhiDKbkrHbi1LEljtDajoEqDaAR
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:df3:224b:7b7f:efc5])
 (user=irogers job=sendgmr) by 2002:a25:74c9:0:b0:db5:3b4b:ad1e with SMTP id
 p192-20020a2574c9000000b00db53b4bad1emr240617ybc.10.1701474656852; Fri, 01
 Dec 2023 15:50:56 -0800 (PST)
Date: Fri,  1 Dec 2023 15:50:30 -0800
In-Reply-To: <20231201235031.475293-1-irogers@google.com>
Message-Id: <20231201235031.475293-8-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231201235031.475293-1-irogers@google.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Subject: [PATCH v1 8/9] perf srcline: Add missed addr2line closes
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, James Clark <james.clark@arm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The child_process for addr2line sets in and out to -1 so that pipes
get created. It is the caller's responsibility to close the pipes,
finish_command doesn't do it. Add the missed closes.

Fixes: b3801e791231 ("perf srcline: Simplify addr2line subprocess")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/srcline.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
index 034b496df297..7addc34afcf5 100644
--- a/tools/perf/util/srcline.c
+++ b/tools/perf/util/srcline.c
@@ -399,6 +399,8 @@ static void addr2line_subprocess_cleanup(struct child_process *a2l)
 		kill(a2l->pid, SIGKILL);
 		finish_command(a2l); /* ignore result, we don't care */
 		a2l->pid = -1;
+		close(a2l->in);
+		close(a2l->out);
 	}
 
 	free(a2l);
-- 
2.43.0.rc2.451.g8631bc7472-goog


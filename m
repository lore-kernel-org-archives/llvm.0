Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAED4E619
	for <llvm@lists.linux.dev>; Fri,  1 Dec 2023 23:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ceozH6ar"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-db3ef4c7094so1778676276.1
        for <llvm@lists.linux.dev>; Fri, 01 Dec 2023 15:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701474647; x=1702079447; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uS8pGWtETXg2WFdrfgf4aQEd7sN6fnFiI3KEJAmFcnQ=;
        b=ceozH6aro5cnaTJZXnoOER5RBqODFwSwbq+etpN2+XVxZ5IMeHgikgJ/gBNRDogfa1
         /0KVFeGCyXS2PsYwqD/Wj0JO65EV2w+8pE/Rhtxl5+2Jo1iHfO0G50OBgq5vCI2YbOKQ
         Ogcu7nr9ATTZZPGTpdBmlQUlCtoiNupk4UpyEyu86xBTGWRokiLnggt76pcGF6qJFo5h
         3DBBthUnC4BNbD179hhxcFYfhQAixfWThvLT60UuUhgaDxhjFH2FhgSv3FrXfR6VR8oY
         vcswkhitEnU6UTqtvhRNENoFCI35UlddVLo0v4ac9q+I9K6UWBV2txX+drF5wk+TglCp
         /uKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701474647; x=1702079447;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uS8pGWtETXg2WFdrfgf4aQEd7sN6fnFiI3KEJAmFcnQ=;
        b=egFigJ7RREwdfmKvxapSWpL0WC0wsTb+JkeHb/Q4HeVBXJul1ko70u+Zf4fpg04J+s
         ZeQynrMPZjfU14kVOkS7mlRVesD1tZS669S+SNdcBF14MmExazy76C8aCcJ36vmLWfFz
         FXwJZHxAAQukBCoPDdGF1CcNwSgkqK5rw18bSdCy5a1w8jo7a+aqcwKl+VfpbR/2e/B8
         N7y1Ub5a9M8hzWpUvDthZg+djWcZmYpP3q5jZLObNvJFrNdfiQ5gFM75wzYHkqMR9ukS
         f6iUgaGyOZD86bFR4d6VlgOtVUeEZcDzD/6abyXMH5OI9H0BZU0ZPEKh7JbKCu/zKdq8
         KeHA==
X-Gm-Message-State: AOJu0YybwVbTdZQKKcqy73ZEAw64UL9Zzh5HggwJMk92fsY5vNH+5zEB
	y7m5NEIgaGoj9Xq3QmrmbrHU1Ug+unb9
X-Google-Smtp-Source: AGHT+IELuyhuddMHz5qtKM8eoJ79tm6AThFMCEOnNC7A6AOrGbqi8w9ilpLSl58oEgA5OGcFVrpJO15dM0Y8
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:df3:224b:7b7f:efc5])
 (user=irogers job=sendgmr) by 2002:a25:ddc1:0:b0:db5:347d:44b with SMTP id
 u184-20020a25ddc1000000b00db5347d044bmr257636ybg.11.1701474646915; Fri, 01
 Dec 2023 15:50:46 -0800 (PST)
Date: Fri,  1 Dec 2023 15:50:26 -0800
In-Reply-To: <20231201235031.475293-1-irogers@google.com>
Message-Id: <20231201235031.475293-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231201235031.475293-1-irogers@google.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Subject: [PATCH v1 4/9] tools subcmd: Add a no exec function call option
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

Tools like perf fork tests in case they crash, but they don't want to
exec a full binary. Add an option to call a function rather than do an
exec. The child process exits with the result of the function call and
is passed the struct of the run_command, things like container_of can
then allow the child process function to determine additional
arguments.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/lib/subcmd/run-command.c | 2 ++
 tools/lib/subcmd/run-command.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tools/lib/subcmd/run-command.c b/tools/lib/subcmd/run-command.c
index 5cdac2162532..d435eb42354b 100644
--- a/tools/lib/subcmd/run-command.c
+++ b/tools/lib/subcmd/run-command.c
@@ -122,6 +122,8 @@ int start_command(struct child_process *cmd)
 		}
 		if (cmd->preexec_cb)
 			cmd->preexec_cb();
+		if (cmd->no_exec_cmd)
+			exit(cmd->no_exec_cmd(cmd));
 		if (cmd->exec_cmd) {
 			execv_cmd(cmd->argv);
 		} else {
diff --git a/tools/lib/subcmd/run-command.h b/tools/lib/subcmd/run-command.h
index 17d969c6add3..d794138a797f 100644
--- a/tools/lib/subcmd/run-command.h
+++ b/tools/lib/subcmd/run-command.h
@@ -47,6 +47,8 @@ struct child_process {
 	unsigned exec_cmd:1; /* if this is to be external sub-command */
 	unsigned stdout_to_stderr:1;
 	void (*preexec_cb)(void);
+	 /* If set, call function in child rather than doing an exec. */
+	int (*no_exec_cmd)(struct child_process *process);
 };
 
 int start_command(struct child_process *);
-- 
2.43.0.rc2.451.g8631bc7472-goog


Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099FF3A1AA
	for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 03:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486934; cv=none; b=aqvcnfcyl/0cEqPDZdINKLbhdeQZya3ijVxX/j+e3KFqAbDvYlUV5pICBe7DZjEhy2VGAWGdtwe1oNQhNcezY25lFExbrAdCNwi6/zENrLC10sROhrZI15biPrIVvZ4MgztDeC6WyqH2JpJJ8JPiOOsSMKQ5Ht4hawKtLXyhfNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486934; c=relaxed/simple;
	bh=nIwADbFncYymlWUg/R60jRadSx8+xe1bkn0KEBii9rU=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=aU05VRF3cspvmfriS9PWeSYJTXvqcdQy5N4yVrZoVEDqB7+2/Ikr5M3utOAuYFEZj4M4+0d1te64tUim3uCASocKtReGx72PKL5AAjhT2oBigNmBObFZIFGbZOnxJXeNNw9e9k84GfrecVLWcHI3v8Zd+OjFj4GalTJ+ZvDNEJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zsLTe1ix; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zsLTe1ix"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5ee22efe5eeso85715637b3.3
        for <llvm@lists.linux.dev>; Tue, 20 Feb 2024 19:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708486932; x=1709091732; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eF36kSIEMlGOGF+Ru4Ee+ArAeIU+1BDlU+YfXMm89FI=;
        b=zsLTe1ixZIZ5DAFjq0O9TD+5mdHSEcCzW50GkIOdSSGhl5dRy1HHW4wdByadSjHghh
         nF1xv1nniTKuvAX6XgyiihB96fIUZfrNlsldnlli+8mF0JXX3s6bdvyaCQ0ezRRFRA7R
         Q6v7BInj3yH/RVsBlL/lbhkvlDSUUMs6k/6rTh0IUlESewV8Dcn2xt+/SJKX9a0nwwBn
         loJc+O55jdEUchMJyaF1bN7ahuTzfVINcaedsi3zblFON8230HS6+UjZXamp1YUhgu88
         4LwiZEVMyqBGQM0k2sL/InZsZs0PPueQ8IbJyfXkLg3U0dpmpAIAqZo+xVMl7DwW2AGZ
         ISqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486932; x=1709091732;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eF36kSIEMlGOGF+Ru4Ee+ArAeIU+1BDlU+YfXMm89FI=;
        b=eYdQ34n/Ei9lyysiJ1sAEWaARle0wvq32Ayx+7DDSkgvhCBn4qvoRFpqR/kVXplpEP
         uos+lCXzDDtFJ5C2kNhcijJ7I3NftdKf8swBK0dFx1IPuHyVTQqSyg904pE4XeDIwhOJ
         telyRoxJXU10tDrJvJMEOONMpYf91KuhDiZwCr2l+FkfNtUwTTLcU1h82QXZj/2sDMBx
         GJy/ssmQ8wBM13JIWxlkTwcTw3RPOfak1QfYhHSGLgzviU1KsFe5Bhihg0XKGNKMLU7N
         r9XvUGCx9gWAfKniPsH5mtsBta/0LEk4wzBDnkPnA83B7t9IN+Bypq6zSKNsftMEAIfC
         n/EA==
X-Forwarded-Encrypted: i=1; AJvYcCUHLm44I/qbKPe/5oFq/u1CuOlq7qsf8hqkSpri47/YdSzLVgoD/o9xRIx4/FfwQNUhRjCKz555sZH6wqw3+8emfYujSw==
X-Gm-Message-State: AOJu0YxZ9pYZxH3N5Pb7VAGjZz3QgEkBkU22kmwiRDUn84KX40CBpyfa
	EG9qQJMBtpXDlgGoyg718bxB+rjCqLsyDN+P3wFbVaI5wVtaTjzdJhVRXcaqrsZ431/h/CH/Rlh
	eVgXG6w==
X-Google-Smtp-Source: AGHT+IE/on57IS2xafUtNQKU7p+VrGTBQkCYynjxRso5yRXY1KPrBnnB3HTy5IyNKzr/8fPp2V2mhgp0xx+K
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:3c02:f882:5876:b7ab])
 (user=irogers job=sendgmr) by 2002:a05:6902:704:b0:dc7:6f13:61d9 with SMTP id
 k4-20020a056902070400b00dc76f1361d9mr660785ybt.4.1708486932038; Tue, 20 Feb
 2024 19:42:12 -0800 (PST)
Date: Tue, 20 Feb 2024 19:41:51 -0800
In-Reply-To: <20240221034155.1500118-1-irogers@google.com>
Message-Id: <20240221034155.1500118-5-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240221034155.1500118-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Subject: [PATCH v6 4/8] tools subcmd: Add a no exec function call option
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Athira Jajeev <atrajeev@linux.vnet.ibm.com>, James Clark <james.clark@arm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
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
2.44.0.rc0.258.g7320e95886-goog


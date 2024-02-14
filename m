Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2DF11705
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 04:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707886484; cv=none; b=cMXfwcvGE5YKt8YBEJ/HvZOH0EwSNd2zX0kGl23V5NVQCB/HkDe6W9Z5ryGsl+ZZo3Q0N8lSrQ0cel/Tc8mkfR5LviB3IwrfXVJQUwsnW4ve18I8nMc5A7AEQuNoxpoEVLcHH48YFw+0sl1Lojtzi74ewWTgQHWiND+rGMKHYzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707886484; c=relaxed/simple;
	bh=LBou+XLQ8QDVF7i9zNrb0c+TC2HDLKGD9kRdzvqDd8M=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=H/2dvCy0/S50URQaq1SoFm0POZ5XlIKs6cPHJsT6K5aW+rHSHU58sVVeo5HgfunBjzemuP4ve2/XpYAld3l3YgwAZHif+gjWGFdxDaSQwW9vBGMw3Hqs5+t6ghkcRMHMGi2iPI0xbXLzLJ0BLlN/rqlp7806ZJWD40cPvK2J1hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rg0HVWns; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rg0HVWns"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc743cc50a6so2280776276.2
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 20:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707886481; x=1708491281; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FAs57lgcOMUxLgf079L8itwe0kfFXp2CsT7fDYu4PDI=;
        b=rg0HVWnsDgm/0ntze7h3T0amIEiyUd4/Iwx5I7FfZZ2e76R5dRa/OjFw55rzjgtEva
         fnC4zUl24mpSl/3pGguPcu4XVKLcacpUiyDEtfj5j9gjuF0KLagwfdsnTCVQqFZjYTSG
         s/nku900q2KnMTIEh3kM0zovcZWKugZEHleWhqAine34+f97DRpuy5DXkRJTYPpKpHhe
         ZN2VgaIzzOonw/6+WKcO9tS8xxYEGffmX9LnkKl+yasVpIIl6/PJRAc1xhIeX6HPetkj
         +9NAFZ9nJsiRhmXBzfUXLyuBrUU+eOsB5SJUs2vHAcGkKej+dPJBQcIuyxRy7SkXbSbR
         eX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707886481; x=1708491281;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FAs57lgcOMUxLgf079L8itwe0kfFXp2CsT7fDYu4PDI=;
        b=FqAK/GLid90Hnb4ySxh56Qt91X3+bp6ZYlA0XSvlEh29Q/6TdTpR+tTe10v95eATw2
         JYwZq2PYWz2CMAIYTjkqe8Z9FSvP1lSljSXSAVyT0eonZw4eNirYowM/5zRQ+ZYjFMS7
         lMXqZATqXXJsz5+ZGi4gLO1+emhK+nFmmy6pDq7bEn3WayvHMvXWXSQySO5rdYBnNBfv
         mu0/2AAXSjfUORfXg0fkyj+3QC53BfjXxhmxd1zvwq1eYUOb3c6kwZPDIYpZ9FeUS5Tw
         pnEnicjRFFFjojKSzSxLrQB5/2B+Kk2etsbLg1DAnq96j8WBNKbGFmoLcCLYxIpAa5cK
         IxbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXecWWieanMiSj1WniwUOZbJTIFsciQpErE+5KXwQ66Zit98J/XwrgHOWOHNZwW8F/jYlVsnP8sFg2pUc+Ec0yYW5aJ0Q==
X-Gm-Message-State: AOJu0Yx1GYNW/DW5aPiwPMLqPWq7lE7RycNrXNlmrlDLFxa8AL7QFymu
	vk7AqWn3bqtH5GIdiYX09/9SJDb03bo/nFQuLn/4bTUxpEJ43dZk+r/HMiDPR8iXJPb0NJmZLNw
	Guvsb2Q==
X-Google-Smtp-Source: AGHT+IFpwgld5BYgEW1Kl/VAFXVUauMsroX4LSe1K6ry/SOqA3PEmypBd2ntS4b9iIcZUKdQtHBwgISl4ugR
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:6d92:85eb:9adc:66dd])
 (user=irogers job=sendgmr) by 2002:a05:6902:1102:b0:dc2:5456:d9ac with SMTP
 id o2-20020a056902110200b00dc25456d9acmr50401ybu.5.1707886480735; Tue, 13 Feb
 2024 20:54:40 -0800 (PST)
Date: Tue, 13 Feb 2024 20:53:52 -0800
In-Reply-To: <20240214045356.748330-1-irogers@google.com>
Message-Id: <20240214045356.748330-5-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240214045356.748330-1-irogers@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Subject: [PATCH v4 4/8] tools subcmd: Add a no exec function call option
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	James Clark <james.clark@arm.com>, Athira Jajeev <atrajeev@linux.vnet.ibm.com>, 
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
2.43.0.687.g38aa6559b0-goog


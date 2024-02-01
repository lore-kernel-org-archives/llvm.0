Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B06C3C24
	for <llvm@lists.linux.dev>; Thu,  1 Feb 2024 00:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706746530; cv=none; b=pL6vxb+0oAE/3NqShNjc/zOHkqyE57rHMmY6WdS2ExJyxsIl+ZxB0pyBwQ/AOxkmwvaUBINTWM9afE73s3XSojQlOgEBe3WaDrlwURwlrqG0qIGp5xA3bTEkieOqTFTn6UMaZkaOIdmehxiqDkM7jzraUBGApEJ/ORs2f1nBtfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706746530; c=relaxed/simple;
	bh=P0dE4SZC6JMGyd4Zz6ysHena7Iqo04wzT6xeGII9Szk=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=qkguyNvgGIYCets3FBXhHtP+MiP/akTBrYp7KrTvJ3DXJP1R/TpMp/WQIU1l/+JGCVPA9+DsnncG1ynF7tdufByuSlcjQ6AloKgsUluwoV1oJuH+IRpIidD8D0HPXBOh2aJzZoXJqui6M2dwMihYxrOHxe/pdZCjWwmVd98wKoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wxCKmZwt; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wxCKmZwt"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc657e9bdc4so521737276.0
        for <llvm@lists.linux.dev>; Wed, 31 Jan 2024 16:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706746528; x=1707351328; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iap9AX1ulrmbLUTYu3qyDksm4nz07RhuxN54fV9TeXc=;
        b=wxCKmZwtr+t5xDFa1i4ENyC/1o8ilq6iHHn6Apb3gerFNE6nVxxb4os0mT6N6X0IeP
         WQwnLWKFXtvsikXrOumoW5+5LP255Hd58SDcEKesHODMk5wt3jOMiMl+TbGIl/f9puc+
         BwCauJBnraE7vlKA9NNBQfm2CANJLxTBbcukIOV2xVQGJip1yADWUWw/OM/KIedqLg10
         FzLWhgD2711dibLEV3mjJJvegfMePUHepZHMn2iKlyTYLSwrI+bAY0sUZvuMsMMY+ir7
         CnICP2vAVNsQ15UTVJf8RtllpXJWrq1H8m7zeu0s5SKz5J63vIRgYhVP7TEMW0lN59V1
         hrew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706746528; x=1707351328;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iap9AX1ulrmbLUTYu3qyDksm4nz07RhuxN54fV9TeXc=;
        b=oCcb55mAa5fBHgxguuXEj31E1FHV5oUbB8HDs6zw2nqJ9XeZEaBCHcJYHrhkpsC0KZ
         eDKDjKVwP7wq38HXb/Tm6YmBw1U0u1l1PBOSLr9Bw8vEROICqgAub2goBqiQAqq7w7cd
         gsKJ1FycYEJBTgt6VYMkP1bhv/1uPQbii85fDks76BVpG0521Msu57MChbm3GAIgZypY
         FWGrTeYZx3tcxXGgbsZnyAJZO6xKxHeBrTfSVSucGHdJX6E8/VwCpu40GCVvw1W4lKKr
         MYDihA9WrZwP2zzPyfazDziQYpTlLA5izYqEH6wze1xDJSu6oB9TCYOcn0YDGR85ye9r
         5iYA==
X-Gm-Message-State: AOJu0Yw4zkucq3oDf5sNNrH7F4hTskJdpDVnKrpVOcXuXVO7Pw8fUu+E
	9bOsdkgkf0WYJoSoeiI45NETOcP3jRkUeQuErmLZKPJCbj5y5JVB7s05m0Gb/iMv6dHzji70oYV
	r/yP5QQ==
X-Google-Smtp-Source: AGHT+IHxRSD0hjkzmEn1KU/PefzyPoGeVucSTS9v+lxpdrWfgHxnXREFi5iodt++/FgSyJgjDSNWNxNG8mLR
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:16c5:1feb:bf99:a5d1])
 (user=irogers job=sendgmr) by 2002:a25:db82:0:b0:dc6:d890:1a97 with SMTP id
 g124-20020a25db82000000b00dc6d8901a97mr9830ybf.9.1706746528067; Wed, 31 Jan
 2024 16:15:28 -0800 (PST)
Date: Wed, 31 Jan 2024 16:14:58 -0800
In-Reply-To: <20240201001504.1348511-1-irogers@google.com>
Message-Id: <20240201001504.1348511-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240201001504.1348511-1-irogers@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Subject: [PATCH v2 4/9] tools subcmd: Add a no exec function call option
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
2.43.0.429.g432eaa2c6b-goog


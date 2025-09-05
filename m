Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13CC1DE89A
	for <llvm@lists.linux.dev>; Fri,  5 Sep 2025 02:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757040875; cv=none; b=smbklLFUlESgwhslYF/gTtZwywIvQeK/SfkgU+Tec66eoCC5UYTvpV+qOfGC9B41lRIDzxmjYf8gSq4JeZg4JljR/BQcCGsnOLltoNzA24sXuklGJ05BEF+bwLSRLSdhAPpPBtQNPdI2AXawhjNaPPUl+/ah8aq9xIUh11HC058=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757040875; c=relaxed/simple;
	bh=undCemkUqZF9gBus1X/Ltrp7nF3cY3rXTXb46EMVxBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uowH3dDlO83WQFVl9J7Chj1BEdPjlGmhIk7OrXACH6PDYda0zzSiRoDwJP1ceVz/NpgcBOJ7ucZcU3zHMxGNY5R6ZKSCPnl2Wi5YyrOqZjxLxsfof1itCzpwYWGvxjSu+K/qeqUMef7cyIYC6M4Ca91r6RYk35YFV9GsPRlffF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=a/mS6Fjk; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="a/mS6Fjk"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3e3aafe06a7so145697f8f.0
        for <llvm@lists.linux.dev>; Thu, 04 Sep 2025 19:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757040870; x=1757645670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CHgv0NAqDCmZyIrAUaPsVJq1dy+s9KkgFo573UQUBVs=;
        b=a/mS6FjkBrwIU4MylQ7/6G0AUm/3NOr+0vc5RjDHlgkM2Rpc6SBjNfxXjcjt08NuZd
         /zFHVvK4cQjrO5T3tUgSnSuGWcXU9f0X4drjFSE3wdGySIQjxjV2i82rKWDvV+OWQLr3
         KkqbhL+kGJ0RUOmhA/FR6J6MCMr0DmA63astFAnslP90FgXs146UC1cZDA3gK4fcPfgG
         7EivwNaS7Q+N2quoewct29mMKApNlIv76fU8gAKebAgebkFyIfp1tWQMZ5ip+yzQD6EH
         8TSca8q8GpL2l0fpHUYMbfLNi0DXXa6RIA3/XDbHOa5bTeeGIk7oaBkarINEUIhkRNmB
         WlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757040870; x=1757645670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHgv0NAqDCmZyIrAUaPsVJq1dy+s9KkgFo573UQUBVs=;
        b=PpDLp+JdBQgj9csKEDKbhnNr1wE4IasV0aM2wNfls25URTYkTe+/6giNsDKdO0Jdy9
         oP+wKSAspeEahm6jFPkI919Jh+K9EznF8vyf/la7IEU0A8AjvKabEpgevFOHoM8ijAcL
         awLzXzTaDTN65C1fO+VP1Nt+f5UoLuhYcaBIebg1aSNMdic/YAApm7QsPoFSD6d/c/G9
         kTolANZrzC+xrZBVoTaoF6LEJ0ymCmnNzu8wgHi3hCxlJHZR/e/r59oB9XFhl1dbWxHl
         koTETJuD1KwtM0yHdyym6DEjcFr2/H+MOlv8U8nPgb60pE6i+2exNsMBu2u/kwKSwbXt
         rV1A==
X-Forwarded-Encrypted: i=1; AJvYcCW+jDTIV7O57BpRZipZjDh2hmn3sN6qCRuye/Ggo7HY/sgLXMjxlMp+1ixY9lOT/zF/KyvJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5famZEunSgrFr2Zp/DZYOxBu3+ZUmCUE3L1ptfNj5+edFFUKy
	XVvVGkB63V9S9LF/WhSidyUV9q3yv3VVsL/5hqsJLiQQanm0/N5RXxy2/GsAfdiL6iw=
X-Gm-Gg: ASbGncuGYu6ktEraHRqLiLk6tevrFVzZXCk+O2157xfzrlQ9o8UYHY2KWFUU5kSyDAZ
	kqo3VextARkfciEIMlLkUltxz0zI4b2IBG/U2Jx0ffqaHfcgShZcVAbElp1qT4MD1shyT4maI0G
	XUIvRYGzrT1VI/N3lIivwCctLLZE1nHx1YCCnTrqSRocPotwErm0jX7W55nDcnmPTJ2ZcQV+DBU
	6Nzcl25/3W9wOE7xgfWSn7PK97pkqiZ+G20HCtjLEsigNxWm3LosG6Se/bvawFsKT/cVlujwxae
	0yyLPV3lrkY2dQGc1dFBRXxxIpVIejt3vxy3y4MSiR4lC+XvbE7bzVZaq4T6LQoUaBX5K1oJvko
	gae5t3sEuq8n/+mO9dRwa1mqP9ww=
X-Google-Smtp-Source: AGHT+IHlQ5NtCWhhn706uFBkQkHtdTdgPPiLOwM5uLuiEP1poKNVs7I6ylodCTB9/wLUvkUlnXWfJg==
X-Received: by 2002:a05:6000:1887:b0:3e2:4a3e:d3cf with SMTP id ffacd0b85a97d-3e24a3ef8a9mr2789665f8f.5.1757040870188;
        Thu, 04 Sep 2025 19:54:30 -0700 (PDT)
Received: from F5.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b520b545a96sm457225a12.20.2025.09.04.19.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:54:29 -0700 (PDT)
From: Hoyeon Lee <hoyeon.lee@suse.com>
To: 
Cc: Hoyeon Lee <hoyeon.lee@suse.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	bpf@vger.kernel.org (open list:BPF [LIBRARY] (libbpf)),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [RFC bpf-next 0/1] libbpf: add compile-time OOB warning to bpf_tail_call_static
Date: Fri,  5 Sep 2025 11:53:10 +0900
Message-ID: <20250905025314.245650-1-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC adds a compile-time check to bpf_tail_call_static() to warn
when a constant slot(index) is >= map->max_entries. This uses a small
BPF_MAP_ENTRIES() macro together with Clang's diagnose_if attribute.

Clang front-end keeps the map type with a '(*max_entries)[N]' field,
so the expression

    sizeof(*(m)->max_entries) / sizeof(**(m)->max_entries)

is resolved to N entirely at compile time. This allows diagnose_if()
to emit a warning when a constant slot index is out of range.

Example:

    struct { /* BPF_MAP_TYPE_PROG_ARRAY = 3 */
        __uint(type, 3);             // int (*type)[3];
        __uint(max_entries, 100);    // int (*max_entries)[100];
        __type(key, __u32);          // typeof(__u32) *key;
        __type(value, __u32);        // typeof(__u32) *value;
    } progs SEC(".maps");

    bpf_tail_call_static(ctx, &progs, 111);

produces:

    bound.bpf.c:26:9: warning: bpf_tail_call: slot >= max_entries [-Wuser-defined-warnings]
       26 |         bpf_tail_call_static(ctx, &progs, 111);
          |         ^
    /usr/local/include/bpf/bpf_helpers.h:190:54: note: expanded from macro 'bpf_tail_call_static'
      190 |          __bpf_tail_call_warn(__slot >= BPF_MAP_ENTRIES(map));                  \
          |                                                             ^
    /usr/local/include/bpf/bpf_helpers.h:183:20: note: from 'diagnose_if' attribute on '__bpf_tail_call_warn':
      183 |     __attribute__((diagnose_if(oob, "bpf_tail_call: slot >= max_entries", "warning")));
          |                    ^           ~~~

Out-of-bounds tail call checkup is no-ops at runtime. Emitting a
compile-time warning can help developers detect mistakes earlier. The
check is currently limited to Clang (due to diagnose_if) and constant
indices, but should catch common errors.

Hoyeon Lee (1):
  libbpf: add compile-time OOB warning to bpf_tail_call_static

 tools/lib/bpf/bpf_helpers.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

--
2.51.0

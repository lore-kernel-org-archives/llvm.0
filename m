Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38BC382388
	for <llvm@lists.linux.dev>; Tue,  3 Mar 2026 23:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772578855; cv=none; b=JJ91+pmmMhr1Ccy6AlTuBIDMXNpgIRq7t0uBSXVkc5gT2QOePHRnePj7jKI7HZiP5NY3xfrmj/Fh9NNdQ+4ZHEymfxMB10woSdg7QnCmO7cvuhFrFe3rd82yVkIEs0FlSUQ4JWH/U8bytLLfRF49D/XMXBOpdGyyAeby+3kQkY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772578855; c=relaxed/simple;
	bh=FnCAM1M4bmOhgdVpm/AhNaTkpp8rO9NC0C89NQYqFhs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NU4x3UWbxNetFlD2KGh1rnZDb7l+XPJoqzXcar3AfKHrWpWzoivYI0jYJoretamB2UPRV+eXPibi0TtOgO7c1y231a5Howvr+tyHSB4TYqnh9NzQgYkz7voxeKW8B3dRsG7TpX1LUXmcAVKxL26aLTC7df6F1Y4VY5ccYq8C4po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pcc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KCTLVG2/; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pcc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KCTLVG2/"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1277896014fso105847930c88.1
        for <llvm@lists.linux.dev>; Tue, 03 Mar 2026 15:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772578853; x=1773183653; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iyeIncQFxH1HTyb8/kfTMSd0Ur9Ybipusnwm7N3vzvc=;
        b=KCTLVG2/U+sjzTsy2TSAVxPPgQZJHyXEaMAhQgpkipnb9uKNR7Su5a+bvAvzHA4mK7
         t8HFzw8BmXga/dTcY+K6SAAiYBoIiUTRDxayfp6/KZlAcaL4N9THraiNV2trEPwcMZsj
         6NzlVBVuHURA1VzqY8JhxoFeJgRPhPXrvFiojKqakuwoFb4I//f7jvroIwBrWULteW/E
         8m0j386jRwwz2sNk8fuhDqehqQkquVklyTQEjI0EhOY+Sjno0iUyovE/PpJeZ0Dboyp9
         /p7QbNszWg5H4bcq2aM6Z5a5k2+5fsZFNXsAcpOpDnYwuRodhFV48J8RYcYehvkFAm77
         RAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772578853; x=1773183653;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iyeIncQFxH1HTyb8/kfTMSd0Ur9Ybipusnwm7N3vzvc=;
        b=W+DShxtX3dt8pmVW8JM4kr6zRpMXLiW38WFklRnMi3gKozDdtyI9z3DWhqYLGIK6eE
         I2F3w5MzsFnbJccYUOEUpgay3E3YQjIYrkOTJ4qZPQNvkWL06Qe5uLRW5+9NLgHlfyPs
         snR/5K0kJiGrab2GcI9Ci/M3yC0ChKCAXW5n4HPU/mj5raDG40zGaglXN/M1POR0ZMaY
         CDkLFxjrG1MNJrMIwGhrLjwQqKh1wNocwQN79Y//nq82t5Tim4EBOeA18JUdEj1bz5Bw
         x+jC2KdRZYQJVsJgeO1doO1hJzDjIww3ItklbNFtAtDKmPtMVRYrQybzNl3QAR3pXvnC
         B3Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWOhC5cc3Yw7SAJCVWHG0ClOn0rDLIDnERUuEgOQNx5FHjyCDMcQf2a7Bx1DqIaGQWHEkq1@lists.linux.dev
X-Gm-Message-State: AOJu0YwwoFce0+9XGG0/zOFfRP0xWZUrdfqD2TZs0jbdjAUcD3Jm79OZ
	OIxlF+Q2tfhoX0w7hEIx+VOoQ4123B39hhfbl1RKIuMvyrce7VKdIWB5fPOc7bj28cXhFQ==
X-Received: from dlbsj2-n2.prod.google.com ([2002:a05:7022:f902:20b0:11d:cd2a:4c1b])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:fa5:b0:127:7893:b1de
 with SMTP id a92af1059eb24-1278fd5f760mr8720159c88.32.1772578851579; Tue, 03
 Mar 2026 15:00:51 -0800 (PST)
Date: Tue,  3 Mar 2026 15:00:42 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260303230043.2074593-1-pcc@google.com>
Subject: [PATCH] perf llvm: Clean up after a failed disassembly
From: Peter Collingbourne <pcc@google.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Collingbourne <pcc@google.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

An error returned from a failed backend will cause perf to call the next
backend. If the error happens mid-function, e.g. due to an unrecognized
instruction, we will end up with duplicated instructions in the output
unless the backend that failed deletes any instructions that it created
before failing. The capstone backend was already doing this but the LLVM
backend was not; fix it.

Link: https://linux-review.googlesource.com/id/I377eef3cd662ab98fbcd69e5004a259fa3d7aa06
Signed-off-by: Peter Collingbourne <pcc@google.com>
---
 tools/perf/util/llvm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/perf/util/llvm.c b/tools/perf/util/llvm.c
index 0d126d233c019..87fceae8488a7 100644
--- a/tools/perf/util/llvm.c
+++ b/tools/perf/util/llvm.c
@@ -261,6 +261,15 @@ int symbol__disassemble_llvm(const char *filename, struct symbol *sym,
 	ret = 0;
 
 err:
+	if (ret != 0) {
+		struct disasm_line *tmp;
+
+		list_for_each_entry_safe(dl, tmp, &notes->src->source,
+					 al.node) {
+			list_del(&dl->al.node);
+			disasm_line__free(dl);
+		}
+	}
 	LLVMDisasmDispose(disasm);
 	free(code_buf);
 	free(line_storage);
-- 
2.53.0.473.g4a7958ca14-goog


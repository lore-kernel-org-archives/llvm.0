Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF322777FC
	for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761130999; cv=none; b=bip/tUiyBITyPXudvb6I9YktZKbzghjDwvSUt+VBOgIu9+gbNm4HssIhfLiNpT3ZOIUjaROy6oAyHXI+RNJzUd60VyGjYNIeMVyuyOAO3WCJ4JbC/G7L8Tz9XoBBLbTYu66lx5VcaGKpXmzs+bB4j0MKlaM8ZxhiX2t7wAjqBpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761130999; c=relaxed/simple;
	bh=4JavVz8FkRkGctrnUlx06KbkSyRHDh5aZttv1CaU6Kc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SbfXkutjRACYkwuDFXyp3vGYgedr9h/diNdhU0vpM5XYmUR6jvLJYKIAaJm/kkWYl+wAlezTWC8UkOe644h3FqW5LNgukxyfRt1DB7+KAgt4lvXmmUh/NTnmLh0Fg20ZxmVSneTZeF4RwhaWuQ9CN4PXWJ0jGD6T9CCR7c3wZBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UbgqKZ7p; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UbgqKZ7p"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47118259fd8so42084305e9.3
        for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 04:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761130996; x=1761735796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PPx6FKp7wmsKPVdZUwCuuivNwZpWI/suVikvoWWTCC4=;
        b=UbgqKZ7ppNumdJ3dnvAfctYgvCJb7mCkS16vbI2GaVP+7BPHOOryp7N0IdqcprNN6k
         jo3K7bmBR5Yke7pactVuFtitLueMDo1u8GOIbuJcDWSx486yqpsYa25SZFkIRR98GvbR
         BR1YqyNUczpwRslMP2RUpz6vAEM4NthBn/h8UIRVEpOkOprvOr0UQ7Gdq7JGK1zZHiPH
         x4VlxoIvS8Sos5d3mWURlV1NXtbOu7FvEt2MlLR6PixFYro/OyClkcAt+a5BwDB5qrd3
         bWdEra/gpD02/cLrkjMiYx8AaDamS5EywjoRxCcb4KE4B1lfkYE/Zbv1TMLeC6wvG5wO
         y5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761130996; x=1761735796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPx6FKp7wmsKPVdZUwCuuivNwZpWI/suVikvoWWTCC4=;
        b=hFmTcBfhZMZBWNgQr6elnINvvvC22Q+JyH234yUudbrCNWMZXfyS6q/iukrZjkKReg
         OV/99opTBaVUD4OIvsN/mkE65HCDP9NVvZ/8wiZiIJlwQpvXe1l6/IuKI2SWTHdYiQKG
         5/XUxWMBcoa87JriqEwQ7ItHpNg9XTw3/TWItddCCuApYUr0EcxxtmD4ZSLl4ZrBJeK0
         ckhT2T18fBg6Nt6b+eq7WbzVbcTPr0trs7wSjUrN8d5iQbgvcsmyNabPBpKxqw41jp15
         chV7lFw5u1CQ9Kq+XNHtsvrzhrWRpp6OHi6Xdc8nskx3hANuvbMz2P1tCfSLrTGGh14z
         ndSA==
X-Forwarded-Encrypted: i=1; AJvYcCXZCGk5Etk1Z/MS8AiLw3F/bTKjdoEx/znWZyG+WbjBXyRkuVYtldVPTXscSviF3DAkzNGu@lists.linux.dev
X-Gm-Message-State: AOJu0YxtsD39X/fGp0BoOx08nExRZy1nw9b83S6iEaP+y1Zbf1qIw1in
	6cGTeFGfKXQfENzcPrX+5mf29vm1IK+7P/dbgFbupjQCz4/4goQpne8farXWgfh99a4=
X-Gm-Gg: ASbGncvvyfdrpSUrXgq56aG7v1lnJrFQ2+2lrlcYz2gcT1KiOPaSRn/u+/MbYZ3EcKh
	j0dTruCzAl/dPHK0fIEeAviFmSaaZTt8dAtL7tPdX8O2OUkhwcOXdS+9gM3BPy3MABWFwwFrCHy
	xy3VFUa72sR+FgcxISx2+wbzQXHIUeYmcA1tUKpC4CIbsen3XOdEFI2jp5ONdQiQIbNUWdhffVH
	GLWkOMcf99n1NwVa2GaYJBWuCYqEbeEIp78kJpvcRInYhGTaYHUl73DLyPESyLxHv80P2e+d57t
	hOhgk07p1yHzEb51deJCfN9qYYYPxZqdFjD1YUMa0mFn6PPOM1Uad6Em63tbd+T4Z+pJfyYE/9w
	88Ik8IClbJJFA6osCXnv0xLz3wI9ZU3Tj1uFb+DLSJw7+qGIuZ00hQWxjZT+RZwUJmxzyO6y7Hq
	CVhRoZkzI52S0ob+rWSWCsukumGvbvoQXHs5Lhsg==
X-Google-Smtp-Source: AGHT+IF8LilulXH5At0tgqLHRXCGDcvcWLjbyZ+//qsb5pM2DM6kkE8yghXjTsH7iBfpaK0P/8VeBQ==
X-Received: by 2002:a05:600c:870b:b0:46f:b42e:e366 with SMTP id 5b1f17b1804b1-4711791fa34mr146867135e9.40.1761130995897;
        Wed, 22 Oct 2025 04:03:15 -0700 (PDT)
Received: from localhost.localdomain ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4369b33sm37756895e9.14.2025.10.22.04.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:03:15 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: linux-perf-users@vger.kernel.org,
	namhyung@kernel.org,
	acme@kernel.org
Cc: irogers@google.com,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Tianyou Li <tianyou.li@intel.com>,
	Thomas Falcon <thomas.falcon@intel.com>,
	Zhiguo Zhou <zhiguo.zhou@intel.com>,
	Wangyang Guo <wangyang.guo@intel.com>,
	Pan Deng <pan.deng@intel.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] perf annotate: Fix Clang build by adding block in switch case
Date: Wed, 22 Oct 2025 12:02:40 +0100
Message-Id: <20251022110241.1283519-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang and GCC disagree with what constitutes a "declaration after
statement". GCC allows declarations in switch cases without an extra
block, as long as it's immediately after the label. Clang does not.
Unfortunately this is the case even in the latest versions of both
compilers. The only option that makes them behave in the same way is
-Wpedantic, which can't be enabled in Perf because of the number of
warnings it generates.

Add a block to fix the Clang build, which is the only thing we can do.

Fixes the build error:

  ui/browsers/annotate.c:999:4: error: expected expression
  struct annotation_line *al = NULL;

  ui/browsers/annotate.c:1008:4: error: use of undeclared identifier 'al'
  al = annotated_source__get_line(notes->src, offset);

  ui/browsers/annotate.c:1009:24: error: use of undeclared identifier 'al'
  browser->curr_hot = al ? &al->rb_node : NULL;

  ui/browsers/annotate.c:1009:30: error: use of undeclared identifier 'al'
  browser->curr_hot = al ? &al->rb_node : NULL;

  ui/browsers/annotate.c:1000:8: error: mixing declarations and code is incompatible with standards before C99 [-Werror,-Wdeclaration-after-statement]
  s64 offset = annotate_browser__curr_hot_offset(browser);

Fixes: ad83f3b7155d ("perf c2c annotate: Start from the contention line")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/ui/browsers/annotate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/ui/browsers/annotate.c b/tools/perf/ui/browsers/annotate.c
index 3a81912279ad..36aca8d6d003 100644
--- a/tools/perf/ui/browsers/annotate.c
+++ b/tools/perf/ui/browsers/annotate.c
@@ -995,7 +995,7 @@ static int annotate_browser__run(struct annotate_browser *browser,
 		case 'H':
 			nd = browser->curr_hot;
 			break;
-		case 's':
+		case 's': {
 			struct annotation_line *al = NULL;
 			s64 offset = annotate_browser__curr_hot_offset(browser);
 
@@ -1012,6 +1012,7 @@ static int annotate_browser__run(struct annotate_browser *browser,
 			annotate__scnprintf_title(hists, title, sizeof(title));
 			annotate_browser__show(browser, title, help);
 			continue;
+		}
 		case 'o':
 			annotate_opts.use_offset = !annotate_opts.use_offset;
 			annotation__update_column_widths(notes);
-- 
2.34.1


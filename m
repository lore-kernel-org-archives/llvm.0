Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390B1535FBA
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 18:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916006; cv=none; b=DXibiEtl3KCqWyIASGM5c6T0OuLGSMgSvS5ipvrN9b/Uwp5QlSqEKLf1FncwlKWVteDZDr3t3o8TH7g+xrZaSJAcnpSwhcazQWLp0xia0sXIZd8XIOydrLiUr7ycaFC+vyuzejMQMLYaztxhD5DWUCAyKsmyq0vx2neLA3/+UR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916006; c=relaxed/simple;
	bh=qz98LWjBN7vuyhktaur2iXpicZss29gzxpSAse2Me08=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pQBGKR+hNsINxMTPZLRCX5TNkMX5+lP7jZ+AZwiGy2PmMcqZzBnCjD9deTVs9WQNCvyWIV3J56mJb3451L6t0WCO2Phx2BuVF5Uh/zHpB2I2g232cwFCHNQJ5cPMi63VJsAMk1sm+6H7CcpZdoumctEc+jrQxB+Ye77KFqP9DPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MrtL8ZTC; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MrtL8ZTC"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so8887845eec.1
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 11:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791916003; x=1792520803; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DM2MthsEYIVhdmp2494m0lpQjS73jUhrnW6tHHeF46g=;
        b=MrtL8ZTCXxJ8oLp9ZOqIToQ8ereF/w8AHjXkTy5IA3C9k0M4igQpSWD1GXInJazmly
         9OolbUBuc5uWbaIUEmwXvYlspGLK8nPe3faYOv481bhet5v0sOs9EyimRv6DlraSNTE2
         xpgUjq/z6w1BwYPINQD5vnPUuzE+Rah8meDLJGDFRS8oRyMbeFlJTJ75nCUYI+uYAjP/
         oTC7gpJ3NoCvAA4Hj7CXO/rBieB9CI6Xze8Eu7VF3HT9YIK0S4ZwXw3TJ11SPzA2u11w
         3ZYBVhL7G7aPz2AD4v08tTrHz4lFzjZiJUkLB7cZ6ZSjkZDesFd5rugiluieX9IpBw4e
         4bJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791916003; x=1792520803;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DM2MthsEYIVhdmp2494m0lpQjS73jUhrnW6tHHeF46g=;
        b=03MnP++hz+cAMYxut7F+Co92hB/CCfvTVDO6c5v+3Xn3EuQI1u0IIoH/xqvIxNnLMH
         ARAND6D7JjHuHzaHMFAoJ5b70pBLPki+rH1BDngbqqbH8aRJ3lf2owPzdPzbFcdUoWd+
         q2yikX7ayicj9dOYSJtnvMDGH43BWTo6oP+5yA7pD0UAbyz3oc3SIOf7Y12htiW/zvKP
         11TOGStbMSS2hRnlDzRSdnLNExYI8g6/KVY2tVLkG7KGb4WxZP5TepLM6jTD2sggNd1D
         PqT/qANopoI6HsM7uKtdmIi1gu1HX/TPzwdcSDHovJRG2T9xM+tbpiqXs6I96BzHo+uk
         Gc2A==
X-Forwarded-Encrypted: i=1; AKwUvBw9ZrykqCpwk40+MsAJcoJMW5EyO2WuGif1JG6b4VOBhvpx9TBI9tjjwLFdXtz7FH7iBR1S@lists.linux.dev
X-Gm-Message-State: AFq9FYIV/dihZbubwMLLn4NRb8bzmsJ7nR7TxEoPLgoY8jaf1R+BIAUR
	7a+xbCSm7MrC5tx/BGXFxLnLc19WhV7TvwT8kGfnfxNA22vTo69eJXRK7uv8LYga/2jp4vbTEJw
	6SAvvdBG5HQ==
X-Received: from dyah25-n2.prod.google.com ([2002:a05:693c:83d9:20b0:359:72f9:2aa7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8103:b0:34a:fc46:35ba
 with SMTP id 5a478bee46e88-3537dfc6e87mr21326454eec.8.1791916002804; Tue, 13
 Oct 2026 11:26:42 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:24:54 -0700
In-Reply-To: <20261013182458.1234616-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013182458.1234616-7-irogers@google.com>
Subject: [PATCH v1 06/10] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Annotate strs, num_strs, and capacity in struct comm_strs with
__guarded_by(&lock) and __pt_guarded_by(&lock) so Clang verifies all
accesses hold comm_strs->lock.

Assisted-by: Antigravity:gemini-3.1-pro

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/comm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
index 6343a3c9debe..9fc4e91a36e9 100644
--- a/tools/perf/util/comm.c
+++ b/tools/perf/util/comm.c
@@ -16,9 +16,9 @@ DECLARE_RC_STRUCT(comm_str) {
 
 static struct comm_strs {
 	struct rw_semaphore lock;
-	struct comm_str **strs;
-	int num_strs;
-	int capacity;
+	struct comm_str **strs __pt_guarded_by(&lock) __guarded_by(&lock);
+	int num_strs __guarded_by(&lock);
+	int capacity __guarded_by(&lock);
 } _comm_strs;
 
 static void comm_strs__remove_if_last(struct comm_str *cs);
-- 
2.56.0.385.gd3acb90ef8-goog


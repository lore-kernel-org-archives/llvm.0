Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FF12BE64A
	for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 03:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755574825; cv=none; b=JAdvawVb5K9P0yJ4CjIlrljuxo6kwx5DXJaAnsWg2PpFsF2/3JeoWDZctPK8R+r0nvqLIwt3zxQKAJrvft/PJX8rGyOw19uX7s0ai9+lk/DXI+ejU3FxHVDI302j14ImWwVWpD9SW8McDUiiYpXlRtHKGUtrwnRZjlsyJZ+VK9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755574825; c=relaxed/simple;
	bh=Yju8yrfKAYNHODJEA8h/x80ZTVJoAlrlqoDz+HFiBUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kjTHTa5LMo/+20C04Khg3kSsB8rujhJ34LBCcpHGdG+xS2FSzXopXMTWX9ELxLVazV5bxSdv6oeetVnx7SZnc1ZpjqhEDJ/SS9pGgqMZnitOAmPUJo3oRW6TU+9fewmH5HtNLOMaUUgNO41Vuu75gvmMoFM0c1qasTS+cw33ytQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAOl1glB; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAOl1glB"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2430c3684d1so42932235ad.0
        for <llvm@lists.linux.dev>; Mon, 18 Aug 2025 20:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755574823; x=1756179623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=up9OuXnclQEyapPLpqQTS4r+NCar6InDzt6ZL5WdOUY=;
        b=mAOl1glBKKcgLUgCZxNmh3JSIBx3G3M5vtgP7+qRFPcOwudupufoStGlnmJb4Mkf10
         Ds+SfU/u6sxQjVw1wgb4derFRElpFTUSRZNGBjIC1mdCUCOY6HqEebGDRqqgV09mIkHq
         r0iU1eKgsm68/NuO1B18kcxsRs0WJPmDJgw8Wes7/7GVLUlLRb1mAgNenZVXpoX/g6LP
         fJUPngen3fcMY+SynUftLi19ZEYJLhoryzUPvPAnPXJiYMeOqKzqIKPJl43pyHUaxM+v
         jSqAnucI3Iw2hLIlJW+sxvq42ducI8QJQ/rFjboQSEYnuyFwEXWQaPgnuPvf8u3/QZBr
         foNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755574823; x=1756179623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=up9OuXnclQEyapPLpqQTS4r+NCar6InDzt6ZL5WdOUY=;
        b=RFVKnYdChJ/hyAoGLUm1HYlQlttNnjd0TKIxHPTau34wtcRoSRNttQ4JejTyb87YQf
         jIYSS+KS3Fwbrc1TsDCUkzdzswsXxck6KY3Ksql03mSyQkWXqSLYwkibRJQbLsHZyEuY
         yPn+qj1cBn+Hq0dPg1K62zn+3QX/YFgjeDm0lpcPgXwd9thkuLxhc6xjzsmQvlYyG6pf
         VTjEAOasMcVDHSqkdL5qdDOpJxUzvKXzxyUURaZ0WSjRXZII4X12lSoFEL8spztpKPZj
         aYpWIxU6GLXzjeyaneR9jiJpbbO2RloVOHQyazW51eZs0MoIIwGpw66e26enYNwfD1fQ
         7hAA==
X-Forwarded-Encrypted: i=1; AJvYcCX9U9zWMVe+9f5ckjM2wojBUVR08Os4ancusc0zhg98D7Fkfe7ZtUDj3BfyHSz65A1CGX0M@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/toELSD9ShJu2ovZL4ZHy9DXGFYJT22jDlDrGS5k+/aFhjV3Y
	8/3DySxwmgFScAIvN/gh2z2D0FBi22sXN9tdCRscdbSEmLLzaj0W3P9f
X-Gm-Gg: ASbGncvW9uVyH0t13YEQ782CMI3Na/nP+Q/9BalhDHmA23MlXrscx9S6h2M5ehRAuM/
	kqsIJfT+WoAATvCIncUAHq3MY1KzNeKHlgnPM8BmO5+U3Sbg8dhc124FDBU8VweQYvTAjXqac7/
	uu+jXSmxeJTUwgSivVx5XWjPArvd5rknglzhYWhXZnc1RAm1VwzM6Zhn5dyvCEvrN8pKjxk78KO
	zdMn7BNo18uy0ATi063l1pCDHT/oNmZGOgsOpnHofqTjGjVX8aTcaTJLfo3H8IpRtGSMFzow6mE
	YNIhh+1se18vjmXJC5lyeRjhwVV0mGAa6P5yGARvPfPm3NgOzCb8pm+q/9bhkEXtwJ0uEqrLH87
	WSpZUJPYvxO3x5bRD7TI=
X-Google-Smtp-Source: AGHT+IEC3G8q3IJdu+w6frUU7ChD8y/Lec4gtNmIDyApvzgod1kIF0UO4U1ayRLvDnDouBsTCoY4Yw==
X-Received: by 2002:a17:902:e5cb:b0:240:3f43:260 with SMTP id d9443c01a7336-245e09cfaefmr12686785ad.17.1755574823362;
        Mon, 18 Aug 2025 20:40:23 -0700 (PDT)
Received: from 7940hx ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d22b8sm1109804b3a.4.2025.08.18.20.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 20:40:22 -0700 (PDT)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	mykolal@fb.com,
	shuah@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next 3/3] selftests/bpf: add benchmark testing for kprobe-multi-all
Date: Tue, 19 Aug 2025 11:39:56 +0800
Message-ID: <20250819033956.59164-4-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819033956.59164-1-dongml2@chinatelecom.cn>
References: <20250819033956.59164-1-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For now, the benchmark for kprobe-multi is single, which means there is
only 1 function is hooked during testing. Add the testing
"kprobe-multi-all", which will hook all the kernel functions during
the benchmark. And the "kretprobe-multi-all" is added too.

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
 tools/testing/selftests/bpf/bench.c           |  4 ++
 .../selftests/bpf/benchs/bench_trigger.c      | 54 +++++++++++++++++++
 .../selftests/bpf/benchs/run_bench_trigger.sh |  4 +-
 .../selftests/bpf/progs/trigger_bench.c       | 12 +++++
 tools/testing/selftests/bpf/trace_helpers.c   |  3 ++
 5 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/bench.c b/tools/testing/selftests/bpf/bench.c
index ddd73d06a1eb..29dbf937818a 100644
--- a/tools/testing/selftests/bpf/bench.c
+++ b/tools/testing/selftests/bpf/bench.c
@@ -510,6 +510,8 @@ extern const struct bench bench_trig_kretprobe;
 extern const struct bench bench_trig_kprobe_multi;
 extern const struct bench bench_trig_kretprobe_multi;
 extern const struct bench bench_trig_fentry;
+extern const struct bench bench_trig_kprobe_multi_all;
+extern const struct bench bench_trig_kretprobe_multi_all;
 extern const struct bench bench_trig_fexit;
 extern const struct bench bench_trig_fmodret;
 extern const struct bench bench_trig_tp;
@@ -578,6 +580,8 @@ static const struct bench *benchs[] = {
 	&bench_trig_kprobe_multi,
 	&bench_trig_kretprobe_multi,
 	&bench_trig_fentry,
+	&bench_trig_kprobe_multi_all,
+	&bench_trig_kretprobe_multi_all,
 	&bench_trig_fexit,
 	&bench_trig_fmodret,
 	&bench_trig_tp,
diff --git a/tools/testing/selftests/bpf/benchs/bench_trigger.c b/tools/testing/selftests/bpf/benchs/bench_trigger.c
index 82327657846e..c6634a64a7c0 100644
--- a/tools/testing/selftests/bpf/benchs/bench_trigger.c
+++ b/tools/testing/selftests/bpf/benchs/bench_trigger.c
@@ -226,6 +226,58 @@ static void trigger_fentry_setup(void)
 	attach_bpf(ctx.skel->progs.bench_trigger_fentry);
 }
 
+static void attach_ksyms_all(struct bpf_program *empty, bool kretprobe)
+{
+	LIBBPF_OPTS(bpf_kprobe_multi_opts, opts);
+	char **syms = NULL;
+	size_t cnt = 0;
+
+	if (bpf_get_ksyms(&syms, &cnt, true)) {
+		printf("failed to get ksyms\n");
+		exit(1);
+	}
+
+	printf("found %zu ksyms\n", cnt);
+	opts.syms = (const char **) syms;
+	opts.cnt = cnt;
+	opts.retprobe = kretprobe;
+	/* attach empty to all the kernel functions except bpf_get_numa_node_id. */
+	if (!bpf_program__attach_kprobe_multi_opts(empty, NULL, &opts)) {
+		printf("failed to attach bpf_program__attach_kprobe_multi_opts to all\n");
+		exit(1);
+	}
+}
+
+static void trigger_kprobe_multi_all_setup(void)
+{
+	struct bpf_program *prog, *empty;
+
+	setup_ctx();
+	empty = ctx.skel->progs.bench_kprobe_multi_empty;
+	prog = ctx.skel->progs.bench_trigger_kprobe_multi;
+	bpf_program__set_autoload(empty, true);
+	bpf_program__set_autoload(prog, true);
+	load_ctx();
+
+	attach_ksyms_all(empty, false);
+	attach_bpf(prog);
+}
+
+static void trigger_kretprobe_multi_all_setup(void)
+{
+	struct bpf_program *prog, *empty;
+
+	setup_ctx();
+	empty = ctx.skel->progs.bench_kretprobe_multi_empty;
+	prog = ctx.skel->progs.bench_trigger_kretprobe_multi;
+	bpf_program__set_autoload(empty, true);
+	bpf_program__set_autoload(prog, true);
+	load_ctx();
+
+	attach_ksyms_all(empty, true);
+	attach_bpf(prog);
+}
+
 static void trigger_fexit_setup(void)
 {
 	setup_ctx();
@@ -512,6 +564,8 @@ BENCH_TRIG_KERNEL(kretprobe, "kretprobe");
 BENCH_TRIG_KERNEL(kprobe_multi, "kprobe-multi");
 BENCH_TRIG_KERNEL(kretprobe_multi, "kretprobe-multi");
 BENCH_TRIG_KERNEL(fentry, "fentry");
+BENCH_TRIG_KERNEL(kprobe_multi_all, "kprobe-multi-all");
+BENCH_TRIG_KERNEL(kretprobe_multi_all, "kretprobe-multi-all");
 BENCH_TRIG_KERNEL(fexit, "fexit");
 BENCH_TRIG_KERNEL(fmodret, "fmodret");
 BENCH_TRIG_KERNEL(tp, "tp");
diff --git a/tools/testing/selftests/bpf/benchs/run_bench_trigger.sh b/tools/testing/selftests/bpf/benchs/run_bench_trigger.sh
index a690f5a68b6b..f7573708a0c3 100755
--- a/tools/testing/selftests/bpf/benchs/run_bench_trigger.sh
+++ b/tools/testing/selftests/bpf/benchs/run_bench_trigger.sh
@@ -6,8 +6,8 @@ def_tests=( \
 	usermode-count kernel-count syscall-count \
 	fentry fexit fmodret \
 	rawtp tp \
-	kprobe kprobe-multi \
-	kretprobe kretprobe-multi \
+	kprobe kprobe-multi kprobe-multi-all \
+	kretprobe kretprobe-multi kretprobe-multi-all \
 )
 
 tests=("$@")
diff --git a/tools/testing/selftests/bpf/progs/trigger_bench.c b/tools/testing/selftests/bpf/progs/trigger_bench.c
index 044a6d78923e..3d5f30c29ae3 100644
--- a/tools/testing/selftests/bpf/progs/trigger_bench.c
+++ b/tools/testing/selftests/bpf/progs/trigger_bench.c
@@ -97,6 +97,12 @@ int bench_trigger_kprobe_multi(void *ctx)
 	return 0;
 }
 
+SEC("?kprobe.multi/bpf_get_numa_node_id")
+int bench_kprobe_multi_empty(void *ctx)
+{
+	return 0;
+}
+
 SEC("?kretprobe.multi/bpf_get_numa_node_id")
 int bench_trigger_kretprobe_multi(void *ctx)
 {
@@ -104,6 +110,12 @@ int bench_trigger_kretprobe_multi(void *ctx)
 	return 0;
 }
 
+SEC("?kretprobe.multi/bpf_get_numa_node_id")
+int bench_kretprobe_multi_empty(void *ctx)
+{
+	return 0;
+}
+
 SEC("?fentry/bpf_get_numa_node_id")
 int bench_trigger_fentry(void *ctx)
 {
diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/selftests/bpf/trace_helpers.c
index 9da9da51b132..78cf1aab09d8 100644
--- a/tools/testing/selftests/bpf/trace_helpers.c
+++ b/tools/testing/selftests/bpf/trace_helpers.c
@@ -575,6 +575,9 @@ static bool skip_entry(char *name)
 	if (!strcmp(name, "__rcu_read_unlock"))
 		return true;
 
+	if (!strcmp(name, "bpf_get_numa_node_id"))
+		return true;
+
 	return false;
 }
 
-- 
2.50.1


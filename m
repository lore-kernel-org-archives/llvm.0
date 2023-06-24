Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CA0360
	for <llvm@lists.linux.dev>; Sat, 24 Jun 2023 00:27:25 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-bf179fcc200so1545304276.0
        for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 17:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687566444; x=1690158444;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cPTlo5sw6qGJhy7W606O6MQ7uT0NiNLSzLEUW45mEMM=;
        b=k+q6Jii5JGpSb6F4X/RcFeITIJYPuMQ1PO9mDPzvSGC/fkp5Zgaj23F1CN18aX6kU4
         qkp1Ox5UxAeuGmlQvTA9tA0a8EfXOZ0FhjF4xFMqz7xPYOiH+w48BzvIucOScvAc44z1
         SHulTRrKf0k7jVFhio7b512ncPLaf7qBqqE8XzpnaOsKv4iEJCWBz798RdA919+bzn/a
         podgA4/rmZvOWQhgqdVCMdsaZrNBcj/SlfabnUSvUcBFZ08qPbhT+yk1A+Myi5GWDZA5
         Cn8V/BLwLcftyEckrd2pA3GAtOpS9mFEiAfdBiHg1PvA3NDjtkDmZwbGgGzbMg6zeLfK
         MbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687566444; x=1690158444;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cPTlo5sw6qGJhy7W606O6MQ7uT0NiNLSzLEUW45mEMM=;
        b=YQbRlbpfxHDzwGra1UFePVdqLmroypBmQXCtWrRCsNNMbgmniWskx9w4m4xco2G//l
         wGjM7Xd/pfwvYDgbP9540bdBJ75qc5ajlN+YcuRiwUz+O2dHbDrc8qs219VBhV+H0VEu
         B/Uiy+ggplPl4tKJRmRR1InJNj0z6aK6jlebkq6LteQ9UFSVDEah9Om34Cn10W9y9aMv
         WljTCvuPhBswmiduCTHcCUgGwWryNsd0auKTMBjaOCaaShRst6al9/EeBu7Oj/ZON/Oz
         GVViY24iuIs3IFZ2EcOoGsee2EtIxWjWsWg395iBcyCVVuPUfSJfPhmZ73US+/ZRcRhk
         g2BA==
X-Gm-Message-State: AC+VfDwOa+0EsD2jjlLY/DEDjl9hkzVLKMjXkeYezdsfBCG8EuHuH7UM
	kUhukvzVeakqlF+CB/uDDyWcjg3qPMvl
X-Google-Smtp-Source: ACHHUZ4Grszgqzm2u7AJaSzDsIqkZA26gyyKMpBn+t1La9762cl67RfO9iaIiWlvf8QQa25/X/PulsBkDGkh
X-Received: from meowing-l.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3eba])
 (user=maskray job=sendgmr) by 2002:a5b:bc9:0:b0:bc4:3e2f:7641 with SMTP id
 c9-20020a5b0bc9000000b00bc43e2f7641mr4120749ybr.4.1687566444575; Fri, 23 Jun
 2023 17:27:24 -0700 (PDT)
Date: Sat, 24 Jun 2023 00:27:08 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-ID: <20230624002708.1907962-1-maskray@google.com>
Subject: [PATCH] perf: Replace deprecated -target with --target= for Clang
From: Fangrui Song <maskray@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"

-target has been deprecated since Clang 3.4 in 2013. Use the preferred
--target=bpf form instead. This matches how we use --target= in
scripts/Makefile.clang.

Link: https://github.com/llvm/llvm-project/commit/274b6f0c87a6a1798de0a68135afc7f95def6277
Signed-off-by: Fangrui Song <maskray@google.com>
---
 tools/perf/Documentation/perf-config.txt | 2 +-
 tools/perf/Makefile.perf                 | 4 ++--
 tools/perf/util/llvm-utils.c             | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/perf/Documentation/perf-config.txt b/tools/perf/Documentation/perf-config.txt
index e56ae54805a8..1478068ad5dd 100644
--- a/tools/perf/Documentation/perf-config.txt
+++ b/tools/perf/Documentation/perf-config.txt
@@ -669,7 +669,7 @@ llvm.*::
 		"$CLANG_OPTIONS $PERF_BPF_INC_OPTIONS $KERNEL_INC_OPTIONS " \
 		"-Wno-unused-value -Wno-pointer-sign "		\
 		"-working-directory $WORKING_DIR "		\
-		"-c \"$CLANG_SOURCE\" -target bpf $CLANG_EMIT_LLVM -O2 -o - $LLVM_OPTIONS_PIPE"
+		"-c \"$CLANG_SOURCE\" --target=bpf $CLANG_EMIT_LLVM -O2 -o - $LLVM_OPTIONS_PIPE"
 
 	llvm.clang-opt::
 		Options passed to clang.
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index f48794816d82..1b752e0a3723 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -1057,7 +1057,7 @@ $(SKEL_TMP_OUT) $(LIBAPI_OUTPUT) $(LIBBPF_OUTPUT) $(LIBPERF_OUTPUT) $(LIBSUBCMD_
 ifdef BUILD_BPF_SKEL
 BPFTOOL := $(SKEL_TMP_OUT)/bootstrap/bpftool
 # Get Clang's default includes on this system, as opposed to those seen by
-# '-target bpf'. This fixes "missing" files on some architectures/distros,
+# '--target=bpf'. This fixes "missing" files on some architectures/distros,
 # such as asm/byteorder.h, asm/socket.h, asm/sockios.h, sys/cdefs.h etc.
 #
 # Use '-idirafter': Don't interfere with include mechanics except where the
@@ -1081,7 +1081,7 @@ $(BPFTOOL): | $(SKEL_TMP_OUT)
 		OUTPUT=$(SKEL_TMP_OUT)/ bootstrap
 
 $(SKEL_TMP_OUT)/%.bpf.o: util/bpf_skel/%.bpf.c $(LIBBPF) | $(SKEL_TMP_OUT)
-	$(QUIET_CLANG)$(CLANG) -g -O2 -target bpf -Wall -Werror $(BPF_INCLUDE) $(TOOLS_UAPI_INCLUDE) \
+	$(QUIET_CLANG)$(CLANG) -g -O2 --target=bpf -Wall -Werror $(BPF_INCLUDE) $(TOOLS_UAPI_INCLUDE) \
 	  -c $(filter util/bpf_skel/%.bpf.c,$^) -o $@
 
 $(SKEL_OUT)/%.skel.h: $(SKEL_TMP_OUT)/%.bpf.o | $(BPFTOOL)
diff --git a/tools/perf/util/llvm-utils.c b/tools/perf/util/llvm-utils.c
index 4e8e243a6e4b..c6c9c2228578 100644
--- a/tools/perf/util/llvm-utils.c
+++ b/tools/perf/util/llvm-utils.c
@@ -25,7 +25,7 @@
 		"$CLANG_OPTIONS $PERF_BPF_INC_OPTIONS $KERNEL_INC_OPTIONS " \
 		"-Wno-unused-value -Wno-pointer-sign "		\
 		"-working-directory $WORKING_DIR "		\
-		"-c \"$CLANG_SOURCE\" -target bpf $CLANG_EMIT_LLVM -g -O2 -o - $LLVM_OPTIONS_PIPE"
+		"-c \"$CLANG_SOURCE\" --target=bpf $CLANG_EMIT_LLVM -g -O2 -o - $LLVM_OPTIONS_PIPE"
 
 struct llvm_param llvm_param = {
 	.clang_path = "clang",
@@ -569,7 +569,7 @@ int llvm__compile_bpf(const char *path, void **p_obj_buf,
 		pr_err("ERROR:\tunable to compile %s\n", path);
 		pr_err("Hint:\tCheck error message shown above.\n");
 		pr_err("Hint:\tYou can also pre-compile it into .o using:\n");
-		pr_err("     \t\tclang -target bpf -O2 -c %s\n", path);
+		pr_err("     \t\tclang --target=bpf -O2 -c %s\n", path);
 		pr_err("     \twith proper -I and -D options.\n");
 		goto errout;
 	}
-- 
2.41.0.178.g377b9f9a00-goog


Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D491DD9AD
	for <llvm@lists.linux.dev>; Sat, 23 Aug 2025 00:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755909173; cv=none; b=PH4XRIPbhEv9wNHWCHgkKE9KFUS9805V4eWUv1ty0QbHBW5sMUVZL7DoTA6FtiHZb+4eoPufip7TywgxXTI9SCSaq76gfm5+VOW8duQwl8w75AD18anVfYYtjCp/OOZtxezBe3NLNb6VhSBjgKNGZSdSx16BGaY42zQMhkSQQw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755909173; c=relaxed/simple;
	bh=Q/rXeAEhkxuFPjccnxCIzH7tlh0lULiUPkRufe9iE+s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=DaEw+q+3LZI9Q5UUuMEpAGuCN/5CVRwb9p1G4i41lkSBd3I+P8hvTF7tSg7IacPL5n01Cnh3wUBOD0KLdqAHwtM2TJDKRq3+hZSecjsGcCmxrHKPkezUTYsdQRHwI4CBpob1F9B29GbHVHFKHWRzUx7UEB2LEXkoYdc2RxrFB8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N37F5H/M; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N37F5H/M"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-246088fc25cso26837055ad.1
        for <llvm@lists.linux.dev>; Fri, 22 Aug 2025 17:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755909171; x=1756513971; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGRBK4HNJps19DKyUYzYqKIeUoReuacj2yflz7VmQvc=;
        b=N37F5H/McQaDQwWbnabsjPFagLZ93XpIpy+o545jbybWeIYq0WvLaDjVLofQdOBZv1
         ChTNkzdYKmj5iUz7Ee9zaX9Oj3MJDGB79SwbKpsglPaK+nZ7MyfyDF45A8PvHjGFzJ86
         cYhmIhifX+CRUSs5T58e0OdBBBP8YSa28Vfjbqda12eLB4/3V+3uq3LigSoiOmJIjzzg
         7RLguacwYNWVw49mKO0tlNgoTwGGzQG0SBunfHKqC/QK/yWG5l/YLz9gsjjAISAad6k2
         h8Unu+ghyxaSvUMB/GPeKqiZLvE5g0/dN14Sh4Bnh1BDw6hYhF6cJC8qM6B2Cl4kPh80
         pbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755909171; x=1756513971;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGRBK4HNJps19DKyUYzYqKIeUoReuacj2yflz7VmQvc=;
        b=TW6hr2I4ynuzKtr90+0uC51GZnhVB5oFFnFCah5ivD8ObuKnkOI/qis32sQwbuNZ9a
         kvLm+RhkqiBso1fkQX2FQtPjYPFcN+XpDtKjc3QdbXfZe55uPMjEYzuU7oUoV3a8z/dD
         gsSqFAu7E5t3gddCQPjfJU+BHqNZk4ciuoGk4MFzgdhFb5rxPqxz0YQTT6U7dUATcgvg
         j7GBogQSFc5IxixxOOVRy2I0Kg9LMC5FHjX+mc/0UAuPo5GGLjuzowoagtsm5Fsbsuys
         5IRsqbkuor12tlvu3V4bHgTwEpK93L14fXAXGAQtS2VxyQKPKaIT0lDDYYuNOuz/2xSz
         xJ/g==
X-Forwarded-Encrypted: i=1; AJvYcCXwTlxl+VS1QPN5iYrmdl923Dv/y/8jk64sfV1AN1ouAErZzGopmdHEyACGjjpl0kTQn5Tg@lists.linux.dev
X-Gm-Message-State: AOJu0YwVSCrjq+D3bhl1P0oT6TtVUFDk7OsZznr9+nfl1ZFcnJ6eqHxL
	Lctc/FVEeSPTCtVoYjWDitv8S1S1pXZrjsQiyr3uuCen4XRhjKIaeQkwFlWogtq0LLHLLc/2DM8
	BG7CwquvHIw==
X-Google-Smtp-Source: AGHT+IGBn3ogB3LontfpDspe/kkcSqFJdkEiLLJCgmAVTw7Ghy/ncmS4udi4ZX5B/3tCkhU5ZNHVG8dlGB57
X-Received: from plbjx13.prod.google.com ([2002:a17:903:138d:b0:240:670f:ad71])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c950:b0:245:f161:35a3
 with SMTP id d9443c01a7336-2462ee59150mr70796845ad.15.1755909170563; Fri, 22
 Aug 2025 17:32:50 -0700 (PDT)
Date: Fri, 22 Aug 2025 17:32:06 -0700
In-Reply-To: <20250823003216.733941-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250823003216.733941-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250823003216.733941-11-irogers@google.com>
Subject: [PATCH v5 10/19] perf dso: Support BPF programs in dso__read_symbol
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	"Steinar H. Gunderson" <sesse@google.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Changbin Du <changbin.du@huawei.com>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	James Clark <james.clark@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Li Huafei <lihuafei1@huawei.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, 
	Song Liu <song@kernel.org>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Set the buffer to the code in the BPF linear info. This enables BPF
JIT code disassembly by LLVM and capstone. Move the disassmble_bpf
calls to disassemble_objdump so that they are only called after
falling back to the objdump option.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/disasm.c | 12 +++---
 tools/perf/util/dso.c    | 85 +++++++++++++++++++++++++---------------
 2 files changed, 60 insertions(+), 37 deletions(-)

diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 5a1a7be717d0..54b38dd696fe 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -1501,6 +1501,12 @@ static int symbol__disassemble_objdump(const char *filename, struct symbol *sym,
 	struct child_process objdump_process;
 	int err;
 
+	if (dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_PROG_INFO)
+		return symbol__disassemble_bpf(sym, args);
+
+	if (dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_IMAGE)
+		return symbol__disassemble_bpf_image(sym, args);
+
 	err = asprintf(&command,
 		 "%s %s%s --start-address=0x%016" PRIx64
 		 " --stop-address=0x%016" PRIx64
@@ -1635,11 +1641,7 @@ int symbol__disassemble(struct symbol *sym, struct annotate_args *args)
 
 	pr_debug("annotating [%p] %30s : [%p] %30s\n", dso, dso__long_name(dso), sym, sym->name);
 
-	if (dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_PROG_INFO) {
-		return symbol__disassemble_bpf(sym, args);
-	} else if (dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_IMAGE) {
-		return symbol__disassemble_bpf_image(sym, args);
-	} else if (dso__binary_type(dso) == DSO_BINARY_TYPE__NOT_FOUND) {
+	if (dso__binary_type(dso) == DSO_BINARY_TYPE__NOT_FOUND) {
 		return SYMBOL_ANNOTATE_ERRNO__COULDNT_DETERMINE_FILE_TYPE;
 	} else if (dso__is_kcore(dso)) {
 		kce.addr = map__rip_2objdump(map, sym->start);
diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 87d075942de6..277c7e81f1c8 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1820,48 +1820,69 @@ const u8 *dso__read_symbol(struct dso *dso, const char *symfs_filename,
 			   const struct map *map, const struct symbol *sym,
 			   u8 **out_buf, u64 *out_buf_len, bool *is_64bit)
 {
-	struct nscookie nsc;
 	u64 start = map__rip_2objdump(map, sym->start);
 	u64 end = map__rip_2objdump(map, sym->end);
-	int fd, count;
-	u8 *buf = NULL;
-	size_t len;
-	struct find_file_offset_data data = {
-		.ip = start,
-	};
+	const u8 *buf;
+	size_t len = end - start;
 
 	*out_buf = NULL;
 	*out_buf_len = 0;
 	*is_64bit = false;
 
-	nsinfo__mountns_enter(dso__nsinfo(dso), &nsc);
-	fd = open(symfs_filename, O_RDONLY);
-	nsinfo__mountns_exit(&nsc);
-	if (fd < 0)
+	if (dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_IMAGE) {
+		pr_debug("No BPF image disassembly support\n");
 		return NULL;
+	} else if (dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_PROG_INFO) {
+#ifdef HAVE_LIBBPF_SUPPORT
+		struct bpf_prog_info_node *info_node;
+		struct perf_bpil *info_linear;
+
+		*is_64bit = sizeof(void *) == sizeof(u64);
+		info_node = perf_env__find_bpf_prog_info(dso__bpf_prog(dso)->env,
+							 dso__bpf_prog(dso)->id);
+		if (!info_node) {
+			errno = SYMBOL_ANNOTATE_ERRNO__BPF_MISSING_BTF;
+			return NULL;
+		}
+		info_linear = info_node->info_linear;
+		buf = (const u8 *)(uintptr_t)(info_linear->info.jited_prog_insns);
+		assert(len <= info_linear->info.jited_prog_len);
+#else
+		pr_debug("No BPF program disassembly support\n");
+		return NULL;
+#endif
+	} else {
+		struct nscookie nsc;
+		int fd;
+		ssize_t count;
+		struct find_file_offset_data data = {
+			.ip = start,
+		};
+		u8 *code_buf = NULL;
 
-	if (file__read_maps(fd, /*exe=*/true, find_file_offset, &data, is_64bit) == 0)
-		goto err;
-
-	len = end - start;
-	buf = malloc(len);
-	if (buf == NULL)
-		goto err;
-
-	count = pread(fd, buf, len, data.offset);
-	close(fd);
-	fd = -1;
-
-	if ((u64)count != len)
-		goto err;
+		nsinfo__mountns_enter(dso__nsinfo(dso), &nsc);
+		fd = open(symfs_filename, O_RDONLY);
+		nsinfo__mountns_exit(&nsc);
+		if (fd < 0)
+			return NULL;
 
-	*out_buf = buf;
+		if (file__read_maps(fd, /*exe=*/true, find_file_offset, &data, is_64bit) == 0) {
+			close(fd);
+			return NULL;
+		}
+		buf = code_buf = malloc(len);
+		if (buf == NULL) {
+			close(fd);
+			return NULL;
+		}
+		count = pread(fd, code_buf, len, data.offset);
+		close(fd);
+		if ((u64)count != len) {
+			free(code_buf);
+			return NULL;
+		}
+		*out_buf = code_buf;
+	}
 	*out_buf_len = len;
 	return buf;
-
-err:
-	if (fd >= 0)
-		close(fd);
-	free(buf);
-	return NULL;
 }
-- 
2.51.0.rc2.233.g662b1ed5c5-goog


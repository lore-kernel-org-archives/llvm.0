Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AED443AA4
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cm7xK6hI"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d81c02bf2beso1959012276.2
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547377; x=1697152177; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qYwGkCO2MUsLkIeTcNd4b7CxJky5rinvoIEFDCIq7TE=;
        b=cm7xK6hIewdpRjsuN/fZpQc/SWeh4MkcCOydid0JEeP0G+ON1KNKXp2cFkZZ7IRaet
         rcMNnvKAatLP0D2ul938PzrQiPsWtjIKnwGLm+JBUP5OjGotSFMm7twVcLwHEOUyzVTc
         LkrDMAW4X0tc5ye8+ph3SAg4qsd6+i5pEGqKgLU00o8tiYviAwPjm32YvPp44pWDrXWM
         ql6PrDDPIMGShN5T3xbnCwXA4CYdgRDKWpncDB+Jnf3dWUGA2+2SKd3KMn4vYvD6iyMC
         ScrZ2d++K1BPDneJA671SUHp6eAMNDKWvTyCFsLwrp/ZbtJz4R80JULVUwqsf46BHL1S
         HsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547377; x=1697152177;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qYwGkCO2MUsLkIeTcNd4b7CxJky5rinvoIEFDCIq7TE=;
        b=ABWxSikVqi2EFXl7A+Zh4YF2Cbm1kev66mxGTeMxpVwUKIiWmtbrdAtxa0CY24j1So
         6Z58Syx1B9g+nSBXU2fliyIW+6bMRQY668cT9x4P2GUsETFva+gmjQyX/DMmMteedtQ1
         pkaLxqHaXLEaKd44sU3z2lOh4vVA+o1HSPNrit/CYEtXU7xS90GV6ynvKvW4D+/pJFIY
         aGQDj9LJZZIy3dDCRJe/zj0aceYjp3VaQvmdWT38K55EyFTkb0EciCysNvcQUQ7GNGV9
         Rui2x1/tpQvpMsBqiaJR7gERUPWk5ULtgk8qIBMZ683LpRkW/TejVJy8rN7OfYnDRuMt
         JP8g==
X-Gm-Message-State: AOJu0YxNqPr9xCbjV/Y5hMg9KGtT39yBfm2zDJmQGBYaasNGECEikgQB
	pOtrArvg915l98AOSJE7JjIHdpwaj5ex
X-Google-Smtp-Source: AGHT+IHWDvJDX0friGLPas8sSB1bU+Zqlv0548Stovx09NJffOSg70jhIDwPg6UsbunfjJZrgTn004zZHK20
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a25:8e8e:0:b0:d90:e642:d9fc with SMTP id
 q14-20020a258e8e000000b00d90e642d9fcmr96425ybl.6.1696547377572; Thu, 05 Oct
 2023 16:09:37 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:50 -0700
In-Reply-To: <20231005230851.3666908-1-irogers@google.com>
Message-Id: <20231005230851.3666908-18-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 17/18] perf header: Fix various error path memory leaks
From: Ian Rogers <irogers@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Ming Wang <wangming01@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Yanteng Si <siyanteng@loongson.cn>, 
	Yuan Can <yuancan@huawei.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	James Clark <james.clark@arm.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Memory leaks were detected by clang-tidy.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/header.c | 63 ++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 25 deletions(-)

diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index d812e1e371a7..41b78e40b22b 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -2598,8 +2598,10 @@ static int process_cpu_topology(struct feat_fd *ff, void *data __maybe_unused)
 			goto error;
 
 		/* include a NULL character at the end */
-		if (strbuf_add(&sb, str, strlen(str) + 1) < 0)
+		if (strbuf_add(&sb, str, strlen(str) + 1) < 0) {
+			free(str);
 			goto error;
+		}
 		size += string_size(str);
 		free(str);
 	}
@@ -2617,8 +2619,10 @@ static int process_cpu_topology(struct feat_fd *ff, void *data __maybe_unused)
 			goto error;
 
 		/* include a NULL character at the end */
-		if (strbuf_add(&sb, str, strlen(str) + 1) < 0)
+		if (strbuf_add(&sb, str, strlen(str) + 1) < 0) {
+			free(str);
 			goto error;
+		}
 		size += string_size(str);
 		free(str);
 	}
@@ -2681,8 +2685,10 @@ static int process_cpu_topology(struct feat_fd *ff, void *data __maybe_unused)
 			goto error;
 
 		/* include a NULL character at the end */
-		if (strbuf_add(&sb, str, strlen(str) + 1) < 0)
+		if (strbuf_add(&sb, str, strlen(str) + 1) < 0) {
+			free(str);
 			goto error;
+		}
 		size += string_size(str);
 		free(str);
 	}
@@ -2736,10 +2742,9 @@ static int process_numa_topology(struct feat_fd *ff, void *data __maybe_unused)
 			goto error;
 
 		n->map = perf_cpu_map__new(str);
+		free(str);
 		if (!n->map)
 			goto error;
-
-		free(str);
 	}
 	ff->ph->env.nr_numa_nodes = nr;
 	ff->ph->env.numa_nodes = nodes;
@@ -2913,10 +2918,10 @@ static int process_cache(struct feat_fd *ff, void *data __maybe_unused)
 		return -1;
 
 	for (i = 0; i < cnt; i++) {
-		struct cpu_cache_level c;
+		struct cpu_cache_level *c = &caches[i];
 
 		#define _R(v)						\
-			if (do_read_u32(ff, &c.v))\
+			if (do_read_u32(ff, &c->v))			\
 				goto out_free_caches;			\
 
 		_R(level)
@@ -2926,22 +2931,25 @@ static int process_cache(struct feat_fd *ff, void *data __maybe_unused)
 		#undef _R
 
 		#define _R(v)					\
-			c.v = do_read_string(ff);		\
-			if (!c.v)				\
-				goto out_free_caches;
+			c->v = do_read_string(ff);		\
+			if (!c->v)				\
+				goto out_free_caches;		\
 
 		_R(type)
 		_R(size)
 		_R(map)
 		#undef _R
-
-		caches[i] = c;
 	}
 
 	ff->ph->env.caches = caches;
 	ff->ph->env.caches_cnt = cnt;
 	return 0;
 out_free_caches:
+	for (i = 0; i < cnt; i++) {
+		free(caches[i].type);
+		free(caches[i].size);
+		free(caches[i].map);
+	}
 	free(caches);
 	return -1;
 }
@@ -3585,18 +3593,16 @@ static int perf_header__adds_write(struct perf_header *header,
 				   struct feat_copier *fc)
 {
 	int nr_sections;
-	struct feat_fd ff;
+	struct feat_fd ff = {
+		.fd  = fd,
+		.ph = header,
+	};
 	struct perf_file_section *feat_sec, *p;
 	int sec_size;
 	u64 sec_start;
 	int feat;
 	int err;
 
-	ff = (struct feat_fd){
-		.fd  = fd,
-		.ph = header,
-	};
-
 	nr_sections = bitmap_weight(header->adds_features, HEADER_FEAT_BITS);
 	if (!nr_sections)
 		return 0;
@@ -3623,6 +3629,7 @@ static int perf_header__adds_write(struct perf_header *header,
 	err = do_write(&ff, feat_sec, sec_size);
 	if (err < 0)
 		pr_debug("failed to write feature section\n");
+	free(ff.buf);
 	free(feat_sec);
 	return err;
 }
@@ -3630,11 +3637,11 @@ static int perf_header__adds_write(struct perf_header *header,
 int perf_header__write_pipe(int fd)
 {
 	struct perf_pipe_file_header f_header;
-	struct feat_fd ff;
+	struct feat_fd ff = {
+		.fd = fd,
+	};
 	int err;
 
-	ff = (struct feat_fd){ .fd = fd };
-
 	f_header = (struct perf_pipe_file_header){
 		.magic	   = PERF_MAGIC,
 		.size	   = sizeof(f_header),
@@ -3645,7 +3652,7 @@ int perf_header__write_pipe(int fd)
 		pr_debug("failed to write perf pipe header\n");
 		return err;
 	}
-
+	free(ff.buf);
 	return 0;
 }
 
@@ -3658,11 +3665,12 @@ static int perf_session__do_write_header(struct perf_session *session,
 	struct perf_file_attr   f_attr;
 	struct perf_header *header = &session->header;
 	struct evsel *evsel;
-	struct feat_fd ff;
+	struct feat_fd ff = {
+		.fd = fd,
+	};
 	u64 attr_offset;
 	int err;
 
-	ff = (struct feat_fd){ .fd = fd};
 	lseek(fd, sizeof(f_header), SEEK_SET);
 
 	evlist__for_each_entry(session->evlist, evsel) {
@@ -3670,6 +3678,7 @@ static int perf_session__do_write_header(struct perf_session *session,
 		err = do_write(&ff, evsel->core.id, evsel->core.ids * sizeof(u64));
 		if (err < 0) {
 			pr_debug("failed to write perf header\n");
+			free(ff.buf);
 			return err;
 		}
 	}
@@ -3695,6 +3704,7 @@ static int perf_session__do_write_header(struct perf_session *session,
 		err = do_write(&ff, &f_attr, sizeof(f_attr));
 		if (err < 0) {
 			pr_debug("failed to write perf header attribute\n");
+			free(ff.buf);
 			return err;
 		}
 	}
@@ -3705,8 +3715,10 @@ static int perf_session__do_write_header(struct perf_session *session,
 
 	if (at_exit) {
 		err = perf_header__adds_write(header, evlist, fd, fc);
-		if (err < 0)
+		if (err < 0) {
+			free(ff.buf);
 			return err;
+		}
 	}
 
 	f_header = (struct perf_file_header){
@@ -3728,6 +3740,7 @@ static int perf_session__do_write_header(struct perf_session *session,
 
 	lseek(fd, 0, SEEK_SET);
 	err = do_write(&ff, &f_header, sizeof(f_header));
+	free(ff.buf);
 	if (err < 0) {
 		pr_debug("failed to write perf header\n");
 		return err;
-- 
2.42.0.609.gbb76f46606-goog


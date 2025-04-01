Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C66F21E08B
	for <llvm@lists.linux.dev>; Tue,  1 Apr 2025 18:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743531906; cv=none; b=X7Wh0jX/fUBmG3vpuh/ZFrSIOBmGO70YvHu7p2AnlfuHSuYfmskoFoLQBtfIzqW/LR86tt0Rqyell8hRI0KqyX3Tehq2jjJPgoY9J5ce57cyUvLX+GVf6vkSNcUzUMz5dGLtfEBlW4+m4NMJ2eFUqvLHqgJuiQGkMI2zpEjxWCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743531906; c=relaxed/simple;
	bh=BdxBvdM8Nz1jjfzc2QOyKg4s6TJ+thWky0MjwWyO/zs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=k7WD34n7tuUh7qtvrJr+Od6gKimQ4vODpWhg8SE8JoohoXOwjPnpFLxbbatnHRYkKLgvknzgpHFuwsLdAfp5M6yd/vNkIJHb+1TI+YZKAD+GOMPXHit8mES1z0xXmqqvexc/XZmXNDf045lFbRcpfDjQoL/4Qczbs937/Je07kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RvbAwgO2; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RvbAwgO2"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-72a2107154bso2238600a34.2
        for <llvm@lists.linux.dev>; Tue, 01 Apr 2025 11:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743531903; x=1744136703; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ZOeKL1qyiNLxvN/oZiofK7bOvfFp8Vu2ELG7LdRApM=;
        b=RvbAwgO2DtiK6vmdy1Vu1QQtIaS1kS6FreMtqtiEQXiBV/0f8IZppSc8uAjvyOG69w
         fXwpij8+pjz5ij0EjntOHUhpzOhSfBmWJw0j0D4RSmqm5DHYFDcQcqYqAkd1GkAt3KKD
         lLZtZsiWibbddZ0cMqR//0BU5MclRACBEElR+ymJPyflUUuaQ2facLGl+0rEZiX+n2ac
         g2AKALZL4NGOo5bscTrDS8u/7JLFH8RoKxKs6xtcTjEHtJWodbIjma+wKY4vx5dDR2HD
         GyEoJSYYPUZEcU5wQSr8qFFpS6nrRk9s6Mnmo1Vy6Wswr0kfz0TsKBWEWlaKZo4Teqi8
         WbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743531903; x=1744136703;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZOeKL1qyiNLxvN/oZiofK7bOvfFp8Vu2ELG7LdRApM=;
        b=WOnWG9ZoHoSiSBqJ2/L+SSnhLBzHmOihpquQLwgk6Xlh3u2uxVEvbMMHY6wC0Twh+B
         YIQtSq/Q097UE9YYePjeEFJvA3kC/mnlkQ1s86PgD5Lf5566qiJzQnnySO0iR6SN39DA
         UPHh4/haVNVol2pK/clOJLcQG2dbybc3QfeCrP9fUHxQL2JHyGnI2gLm7umDNOH5iHKo
         iqHrM52GchyiQfI0ctLLeleyEEt2xxhFUpxaJDjceUNlpdlhd05070zAgNrqMECz3mvn
         J9pkDIF8X92X79sBGcuVeji/XlXKaKejkz5XiUwDUfTXxGV4O3/G7lPhvhTqAZMg2ukh
         ZLng==
X-Forwarded-Encrypted: i=1; AJvYcCUvpaMGvfQakYxTgH8sYHh7QIoEkmabA6SZXLAv2NTE6OixaARnQcxthcsDYfCNPdjZbw72@lists.linux.dev
X-Gm-Message-State: AOJu0YxW9FQvxnoZCXvPWah6Qdh/te4Emm9VHJAaurYgl4L5Cje2WGb/
	GG6V0a7C8vhQNH5EDwtyOfg+82e9r+KAiaRl0VcE1dmpnkO4buTHEcE+3DLCubzzQraGdpoputG
	fKCg9Gg==
X-Google-Smtp-Source: AGHT+IEJjExpoJgVVZs6Hlo908U0oi37UxrWtfgmlindyP0XfVD6VZ0siD4yNQUpQLPVE+N9T3e9cbC/UfJi
X-Received: from oacmm9.prod.google.com ([2002:a05:6871:7289:b0:2b8:e735:4798])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6830:7002:b0:72b:a61c:cbb2
 with SMTP id 46e09a7af769-72c6378e768mr9367054a34.10.1743531903184; Tue, 01
 Apr 2025 11:25:03 -0700 (PDT)
Date: Tue,  1 Apr 2025 11:23:11 -0700
In-Reply-To: <20250401182347.3422199-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401182347.3422199-14-irogers@google.com>
Subject: [PATCH v1 13/48] perf trace-event: Silence -Wshorten-64-to-32 warnings
From: Ian Rogers <irogers@google.com>
To: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Kyle Meyer <kyle.meyer@hpe.com>, 
	Ben Gainey <ben.gainey@arm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	Eder Zulian <ezulian@redhat.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, He Zhe <zhe.he@windriver.com>, 
	Dirk Gouders <dirk@gouders.net>, Brian Geffon <bgeffon@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Howard Chu <howardchu95@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Jann Horn <jannh@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Yang Jihong <yangjihong@bytedance.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Hao Ge <gehao@kylinos.cn>, Tengda Wu <wutengda@huaweicloud.com>, 
	Gabriele Monaco <gmonaco@redhat.com>, Chun-Tse Shao <ctshao@google.com>, 
	Casey Chen <cachen@purestorage.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, Levi Yun <yeoreum.yun@arm.com>, 
	Weilin Wang <weilin.wang@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Andrew Kreimer <algonell@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/python.c                      |  4 ++--
 .../scripting-engines/trace-event-python.c    | 13 ++++++-----
 tools/perf/util/trace-event-info.c            |  3 ++-
 tools/perf/util/trace-event-parse.c           |  2 +-
 tools/perf/util/trace-event-read.c            | 23 +++++++++----------
 tools/perf/util/trace-event-scripting.c       |  2 +-
 6 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index f3c05da25b4a..f55b2b7435ad 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -305,7 +305,7 @@ tracepoint_field(const struct pyrf_event *pe, struct tep_format_field *field)
 		len    = field->size;
 		if (field->flags & TEP_FIELD_IS_DYNAMIC) {
 			val     = tep_read_number(pevent, data + offset, len);
-			offset  = val;
+			offset  = (unsigned int)val;
 			len     = offset >> 16;
 			offset &= 0xffff;
 			if (tep_field_is_relative(field->flags))
@@ -599,7 +599,7 @@ static PyObject *pyrf_thread_map__item(PyObject *obj, Py_ssize_t i)
 	if (i >= perf_thread_map__nr(pthreads->threads))
 		return NULL;
 
-	return Py_BuildValue("i", perf_thread_map__pid(pthreads->threads, i));
+	return Py_BuildValue("i", (int)perf_thread_map__pid(pthreads->threads, (int)i));
 }
 
 static PySequenceMethods pyrf_thread_map__sequence_methods = {
diff --git a/tools/perf/util/scripting-engines/trace-event-python.c b/tools/perf/util/scripting-engines/trace-event-python.c
index 520729e78965..547eeb45a832 100644
--- a/tools/perf/util/scripting-engines/trace-event-python.c
+++ b/tools/perf/util/scripting-engines/trace-event-python.c
@@ -713,9 +713,10 @@ static void set_sample_datasrc_in_dict(PyObject *dict,
 			_PyUnicode_FromString(decode));
 }
 
-static void regs_map(struct regs_dump *regs, uint64_t mask, const char *arch, char *bf, int size)
+static void regs_map(struct regs_dump *regs, uint64_t mask, const char *arch, char *bf, size_t size)
 {
-	unsigned int i = 0, r;
+	unsigned int i = 0;
+	u64 r;
 	int printed = 0;
 
 	bf[0] = 0;
@@ -731,7 +732,7 @@ static void regs_map(struct regs_dump *regs, uint64_t mask, const char *arch, ch
 
 		printed += scnprintf(bf + printed, size - printed,
 				     "%5s:0x%" PRIx64 " ",
-				     perf_reg_name(r, arch), val);
+				     perf_reg_name((int)r, arch), val);
 	}
 }
 
@@ -744,7 +745,7 @@ static int set_regs_in_dict(PyObject *dict,
 	struct perf_event_attr *attr = &evsel->core.attr;
 	const char *arch = perf_env__arch(evsel__env(evsel));
 
-	int size = (__sw_hweight64(attr->sample_regs_intr) * MAX_REG_SIZE) + 1;
+	size_t size = (__sw_hweight64(attr->sample_regs_intr) * MAX_REG_SIZE) + 1;
 	char *bf = NULL;
 
 	if (sample->intr_regs) {
@@ -957,7 +958,7 @@ static void python_process_tracepoint(struct perf_sample *sample,
 		Py_FatalError(handler_name);
 	}
 
-	pid = raw_field_value(event, "common_pid", data);
+	pid = (int)raw_field_value(event, "common_pid", data);
 
 	sprintf(handler_name, "%s__%s", event->system, event->name);
 
@@ -1017,7 +1018,7 @@ static void python_process_tracepoint(struct perf_sample *sample,
 			if (field->flags & TEP_FIELD_IS_DYNAMIC) {
 				val     = tep_read_number(scripting_context->pevent,
 							  data + offset, len);
-				offset  = val;
+				offset  = (unsigned int)val;
 				len     = offset >> 16;
 				offset &= 0xffff;
 				if (tep_field_is_relative(field->flags))
diff --git a/tools/perf/util/trace-event-info.c b/tools/perf/util/trace-event-info.c
index c8755679281e..0f012890ff21 100644
--- a/tools/perf/util/trace-event-info.c
+++ b/tools/perf/util/trace-event-info.c
@@ -45,7 +45,8 @@ static int record_file(const char *file, ssize_t hdr_sz)
 	unsigned long long size = 0;
 	char buf[BUFSIZ], *sizep;
 	off_t hdr_pos = lseek(output_fd, 0, SEEK_CUR);
-	int r, fd;
+	int fd;
+	ssize_t r;
 	int err = -EIO;
 
 	fd = open(file, O_RDONLY);
diff --git a/tools/perf/util/trace-event-parse.c b/tools/perf/util/trace-event-parse.c
index 9c015fc2bcfb..982cbbc57168 100644
--- a/tools/perf/util/trace-event-parse.c
+++ b/tools/perf/util/trace-event-parse.c
@@ -34,7 +34,7 @@ static int get_common_field(struct scripting_context *context,
 		*size = field->size;
 	}
 
-	return tep_read_number(pevent, context->event_data + *offset, *size);
+	return (int)tep_read_number(pevent, context->event_data + *offset, *size);
 }
 
 int common_lock_depth(struct scripting_context *context)
diff --git a/tools/perf/util/trace-event-read.c b/tools/perf/util/trace-event-read.c
index ecbbb93f0185..78a3b3801d69 100644
--- a/tools/perf/util/trace-event-read.c
+++ b/tools/perf/util/trace-event-read.c
@@ -25,18 +25,18 @@ static int input_fd;
 static ssize_t trace_data_size;
 static bool repipe;
 
-static int __do_read(int fd, void *buf, int size)
+static int __do_read(int fd, void *buf, size_t size)
 {
-	int rsize = size;
+	int rsize = (int)size;
 
 	while (size) {
-		int ret = read(fd, buf, size);
+		ssize_t ret = read(fd, buf, size);
 
 		if (ret <= 0)
 			return -1;
 
 		if (repipe) {
-			int retw = write(STDOUT_FILENO, buf, ret);
+			ssize_t retw = write(STDOUT_FILENO, buf, ret);
 
 			if (retw <= 0 || retw != ret) {
 				pr_debug("repiping input file");
@@ -51,14 +51,13 @@ static int __do_read(int fd, void *buf, int size)
 	return rsize;
 }
 
-static int do_read(void *data, int size)
+static int do_read(void *data, size_t size)
 {
 	int r;
 
 	r = __do_read(input_fd, data, size);
 	if (r <= 0) {
-		pr_debug("reading input file (size expected=%d received=%d)",
-			 size, r);
+		pr_debug("reading input file (size expected=%zd received=%d)", size, r);
 		return -1;
 	}
 
@@ -68,10 +67,10 @@ static int do_read(void *data, int size)
 }
 
 /* If it fails, the next read will report it */
-static void skip(int size)
+static void skip(unsigned long long size)
 {
 	char buf[BUFSIZ];
-	int r;
+	unsigned long long r;
 
 	while (size) {
 		r = size > BUFSIZ ? BUFSIZ : size;
@@ -86,7 +85,7 @@ static unsigned int read4(struct tep_handle *pevent)
 
 	if (do_read(&data, 4) < 0)
 		return 0;
-	return tep_read_number(pevent, &data, 4);
+	return (unsigned int)tep_read_number(pevent, &data, 4);
 }
 
 static unsigned long long read8(struct tep_handle *pevent)
@@ -119,7 +118,7 @@ static char *read_string(void)
 		}
 
 		if (repipe) {
-			int retw = write(STDOUT_FILENO, &c, 1);
+			ssize_t retw = write(STDOUT_FILENO, &c, 1);
 
 			if (retw <= 0 || retw != r) {
 				pr_debug("repiping input file string");
@@ -365,7 +364,7 @@ static int read_saved_cmdline(struct tep_handle *pevent)
 	}
 	buf[ret] = '\0';
 
-	parse_saved_cmdline(pevent, buf, size);
+	parse_saved_cmdline(pevent, buf, (unsigned int)size);
 	ret = 0;
 out:
 	free(buf);
diff --git a/tools/perf/util/trace-event-scripting.c b/tools/perf/util/trace-event-scripting.c
index 72abb28b7b5a..fb1fa227c98e 100644
--- a/tools/perf/util/trace-event-scripting.c
+++ b/tools/perf/util/trace-event-scripting.c
@@ -422,5 +422,5 @@ int perf_sample__sprintf_flags(u32 flags, char *str, size_t sz)
 	if (pos < sz)
 		str[pos] = 0;
 
-	return pos;
+	return (int)pos;
 }
-- 
2.49.0.504.g3bcea36a83-goog


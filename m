Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622396;
	b=UwOdhPzFoeSSyOW4OdfgX0eV0Nw46dKvIjTiim3diDVxY3DNDIZt1RxvgO0rextK2Eas
	 IznXKEdbJxdBAU07MCdX3BDQZLwlPg4u5DVOoj6fXvrJxIT97Ce3jc3pKpY1alXwJ/sjJ
	 AsphnnigxSSW5LYz1FSqRwmxVkdF2xkdaQOrdzxljmzdrzUK9a/OgRObsGz3xQdax04HM
	 iuLsICx45JGV8J/wQLggrXxDOp7hIWBoFqK5vueBMYnwvx9t3/Mx3Ut5tDx/DiKIsoOTW
	 CzMIKBW3dN7L5GEeE9inTeq2eVsJmyHYRRZVJnSGQLwppJaRomOfWXXFmp332vhbJ3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=v2rrXS1ate7b8OOQCuZc5vd/vkFrx7oPEHSNFj+/YLY=;
	b=zphlTOgLu6pTGwDiOO0xKC01XgS6Fs6DHldftypJJwYRti9lWcKOtQNb6T282bW7EaN7
	 h3o25GCKON73uRfi/cqFJcrlFNUdttvlkaY2yKEchtizNBRVfAK4x8oGgK5iAQRXuDLlF
	 KMhZXHMc6SQuVgKeMJPBswzeAaKXG3mcM2nqkdYQsawEPI38UFWTYRC43NoJ26DBDL3GU
	 P8CMm8L3ocmbiiBgQbgGrDoSyf+XLVoKjL1z7kAJ1q68r8owNvSlY1IrqPlN3yiDJ+AvB
	 G9qYtOweA3kGFIDZ185qhfUzmCwbCwR3MhhmzRF8IfcvKFNjoz1w2ynz2pFmE18gkkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Wno1MKtm;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28A0606A321
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C28A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Wno1MKtm
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1663fb7e005so1790406c88.0
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 15:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622395; x=1793227195; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2rrXS1ate7b8OOQCuZc5vd/vkFrx7oPEHSNFj+/YLY=;
        b=Wno1MKtmkY6CXmcsiJmpQlpc1eu1yU5KRKdN+pO8/w9dxuNSLtYfnECturh6j8YW7w
         2xZ+OAtFDeSmzy0kcBHTxQrn6CTbkyVo0TpYqKlhxyVYnHCu+WX7FhstrciLBFpkBFH7
         SLK2pjuF0UQ6WHnmFGvvR2SmHPEgA2Mq+eBOsMWPLF3xrDrS3wUeg9TiPwXiPEoMWIgb
         TrU8AxNSSmp9RmECXY8G3RKDDlTIguTPX8C7OadBezuKwnVwXo/gwpfavF/4gIaD5vl6
         m73X8p+4/8mx85fpZfizr3+2RgbISD8F7s5oscuYNBWCwh7X/NySM+Os+e7C39DQaQOS
         uF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622395; x=1793227195;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2rrXS1ate7b8OOQCuZc5vd/vkFrx7oPEHSNFj+/YLY=;
        b=lcPwe5RCwiVXlVdVJFye20pC4rv4EeUDc/haLor9Dr89r4LsbziYLQ+2WaLTAOEqz9
         lKd9MC3wgw4eGvcB/MFi+80t5JqGUnUPZ8FbQSBsDyaBiJf16nPUuFfCPIIl/4ztYXqB
         fWK0m+PU47F1T6sSIxWYjM2u2mcnX3IruXugCMRdUiIIfAYofVUv//x21IjsLcZS7J15
         6Wk/Q2zjERRdS7HVHM697gFsJyTiB5cVdgDQc2wWPEZRVyk0ssJ5SgzsY8DWiPkko5ss
         jguJQe61Go9hjOA6zQegm/H7OXCtaZ3Im86rxkX3+w9IF06mUeJBkVv2+seYAqt2CB4J
         EzsA==
X-Forwarded-Encrypted: i=1; AKwUvBwKGKYoy2bd86AboxEv4CQzmqbjZMkvgKu9v4cOZTFhMhVirYb1JKfukBYCNZuPVlBD4mG0@lists.linux.dev
X-Gm-Message-State: AFq9FYLZOcxNiC5jcNJdMiHQwYxweu/LEW+IruNhwMmyoV6zqjq4c31Y
	2AXcXqAH56r0nmkULw0AkNAk1ZHKouoP4RaAvGrqTIW37pIowlUyUEzBDqQK9xdw9z8tNk27WAD
	0WbCfIiNmQw==
X-Received: from dlbpt3.prod.google.com ([2002:a05:7022:e803:b0:190:a370:8867])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:465b:b0:14b:cf58:ce15
 with SMTP id a92af1059eb24-190a6eb58e1mr3715874c88.43.1792622394673; Wed, 21
 Oct 2026 15:39:54 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:39:01 -0700
In-Reply-To: <20261021223905.715051-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261021171044.155240-1-irogers@google.com> <20261021223905.715051-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021223905.715051-14-irogers@google.com>
Subject: [PATCH v7 13/17] perf intel-tpebs: Fix race in tpebs_stop() and
 tpebs_cmd.out fd handling
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In tpebs_stop(), read tpebs_reader_thread into a local variable before
releasing tpebs_mtx to call pthread_join().

Transfer ownership of tpebs_cmd.out to __sample_reader() by passing it as
the thread argument and setting tpebs_cmd.out = -1 in
evsel__tpebs_open() so tpebs_stop() does not double-close the fd closed
by perf_session__delete(). Also reset tpebs_cmd.pid = 0 and tpebs_cmd.out = -1 and return early if
start_command() fails in evsel__tpebs_start_perf_record(), as
start_command() closes the pipe internally and may leave cmd->pid = -1
on error, and join tpebs_reader_thread on error in evsel__tpebs_open()
if it was already started.

Include <pthread.h>, <signal.h>, <stdint.h>, <stdlib.h>, <string.h>, and
<unistd.h> explicitly.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 51 ++++++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 7c0b8b15bd10..47c939fc2058 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -27,6 +27,12 @@
 #include <errno.h>
 #include <poll.h>
 #include <math.h>
+#include <pthread.h>
+#include <signal.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
 
 #define PERF_DATA		"-"
 
@@ -120,10 +126,15 @@ static int evsel__tpebs_start_perf_record(struct evsel *evsel)
 	tpebs_cmd.out = -1;
 	ret = start_command(&tpebs_cmd);
 	zfree(&tpebs_cmd.argv);
+	if (ret) {
+		tpebs_cmd.pid = 0;
+		tpebs_cmd.out = -1;
+		return ret;
+	}
 	list_for_each_entry(t, &tpebs_results, nd)
 		t->started = true;
 
-	return ret;
+	return 0;
 }
 
 static bool is_child_pid(pid_t parent, pid_t child)
@@ -220,13 +231,13 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
 	return 0;
 }
 
-static void *__sample_reader(void *arg __maybe_unused)
+static void *__sample_reader(void *arg)
 {
 	struct perf_session *session;
 	struct perf_data data = {
 		.mode = PERF_DATA_MODE_READ,
 		.path = PERF_DATA,
-		.file.fd = tpebs_cmd.out,
+		.file.fd = (int)(intptr_t)arg,
 	};
 	struct perf_tool tool;
 
@@ -236,8 +247,10 @@ static void *__sample_reader(void *arg __maybe_unused)
 	tool.attr = perf_event__process_attr;
 
 	session = perf_session__new(&data, &tool);
-	if (IS_ERR(session))
+	if (IS_ERR(session)) {
+		close(data.file.fd);
 		return NULL;
+	}
 	perf_session__process_events(session);
 	perf_session__delete(session);
 
@@ -331,12 +344,19 @@ static int tpebs_stop(void) __must_hold(tpebs_mtx_get())
 	/* Like tpebs_start, we should only run tpebs_end once. */
 	if (tpebs_cmd.pid != 0) {
 		pid_t actual_pid = tpebs_cmd.pid;
+		pthread_t reader_thread;
 
 		tpebs_stopping = true;
 		tpebs_send_record_cmd(EVLIST_CTL_CMD_STOP_TAG);
+		/*
+		 * tpebs_results is empty when stopping; clear pid so
+		 * process_sample_event() ignores any late samples while
+		 * draining the pipe.
+		 */
 		tpebs_cmd.pid = 0;
+		reader_thread = tpebs_reader_thread;
 		mutex_unlock(tpebs_mtx_get());
-		pthread_join(tpebs_reader_thread, NULL);
+		pthread_join(reader_thread, NULL);
 		mutex_lock(tpebs_mtx_get());
 		if (control_fd[0] >= 0) {
 			close(control_fd[0]);
@@ -515,6 +535,7 @@ int evsel__tpebs_open(struct evsel *evsel)
 	int ret;
 	bool tpebs_empty;
 	bool started_process = false;
+	bool started_thread = false;
 
 	/* We should only run tpebs_start when tpebs_recording is enabled. */
 	if (!tpebs_recording)
@@ -567,12 +588,15 @@ int evsel__tpebs_open(struct evsel *evsel)
 			goto out;
 
 		if (pthread_create(&tpebs_reader_thread, /*attr=*/NULL, __sample_reader,
-				   /*arg=*/NULL)) {
+				   (void *)(intptr_t)tpebs_cmd.out)) {
 			kill(tpebs_cmd.pid, SIGTERM);
 			pr_err("Could not create thread to process sample data.\n");
 			ret = -1;
 			goto out;
 		}
+		/* __sample_reader now owns and closes the output fd. */
+		tpebs_cmd.out = -1;
+		started_thread = true;
 		ret = tpebs_send_record_cmd(EVLIST_CTL_CMD_ENABLE_TAG);
 	}
 out:
@@ -586,9 +610,22 @@ int evsel__tpebs_open(struct evsel *evsel)
 
 		if (started_process) {
 			if (tpebs_cmd.pid > 0) {
-				kill(tpebs_cmd.pid, SIGTERM);
+				pid_t actual_pid = tpebs_cmd.pid;
+
+				tpebs_stopping = true;
+				kill(actual_pid, SIGTERM);
+				tpebs_cmd.pid = 0;
+				if (started_thread) {
+					pthread_t reader_thread = tpebs_reader_thread;
+
+					mutex_unlock(tpebs_mtx_get());
+					pthread_join(reader_thread, NULL);
+					mutex_lock(tpebs_mtx_get());
+				}
+				tpebs_cmd.pid = actual_pid;
 				finish_command(&tpebs_cmd);
 				tpebs_cmd.pid = 0;
+				tpebs_stopping = false;
 			}
 			if (tpebs_cmd.out >= 0) {
 				close(tpebs_cmd.out);
-- 
2.56.0.218.g1ec904b173-goog


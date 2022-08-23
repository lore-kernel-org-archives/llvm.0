Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73E15C91
	for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 22:10:23 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-3339532b6a8so260001527b3.1
        for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 15:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=pchsPb0q/3M596TWShJAL2CjEne0833N+uxiCelfZ4s=;
        b=Odecrv1If+FMva4pnjFdp2Y6sfSqkFu8zdScmwdC2ZskRIj8GRzINulF1y6pcEv9up
         JXbiuSVxJEyPcQewCOAToOcgB3wBfxPSxKK0o7IKKY0wq5g7+H7WIziuzADEsABaPQcs
         EEAIuMD63GSiJLVRq5qfb3Oj5TiLbm2r9MQlo7dKbwagH4Ab6Y9Wxex0gsZf3Zr8rs5L
         uE3lZZYnykc7V45aUX1vtbngrBDr1a/1SofnqHX+xllKQuf9G5cviZvX9PmnzXnAbIMN
         8wx8JSaj4GQp2qAkniRJzYHk+A7tydF3Rn7hhRbhqeA4rsEvKv5rSNyv6SaG44p9aG+X
         K+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=pchsPb0q/3M596TWShJAL2CjEne0833N+uxiCelfZ4s=;
        b=1ReWxTzCR2S5aSvFrrSse59O51BjXpnZI755Jr43HfqllibXFgA9hXUBKHhbLVCiTa
         qWx0ezCCTQ/MxNWlimKugGFQWIGnfmk9zgQSnIDgVo34TMN0Wq+t7ryfAEfWiSQqsRH1
         rCV3LQ8uAeP0GdGe6PdfwQZX1livRummhUfFvlR+If3zPi6QySKKeU6tQf0OT8sFjOY+
         L46bb+QzYaa7Kcbo9TFHS+ar7PSL87G/e85uAPrhUEwHp6iKtEbhvOlfcx1k4NaLjTWo
         y6joyie/885PHsPP8PFiWYgVvPURt7VHwlWAQofvi3uSP0NV/lMjY9a21ni/ClUKXayr
         PHTw==
X-Gm-Message-State: ACgBeo3Kp8Y/YzkGkdqtfXhacRbpX1w3dEMHW7GsdXrv+mZigtqMsR5o
	NuIa17A2pOL0zwpycHiIZb01naX5F73s
X-Google-Smtp-Source: AA6agR7hHbAq4uohe3oz+HwH6KghfM+zPkcQ6XmgaiG9Fo36n2oNWZm1KHIbogcMXI+oTbi3TINLNMe56vaI
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:7dbd:c08f:de81:c2a3])
 (user=irogers job=sendgmr) by 2002:a25:780e:0:b0:671:3386:8129 with SMTP id
 t14-20020a25780e000000b0067133868129mr25551495ybc.404.1661292622945; Tue, 23
 Aug 2022 15:10:22 -0700 (PDT)
Date: Tue, 23 Aug 2022 15:09:13 -0700
In-Reply-To: <20220823220922.256001-1-irogers@google.com>
Message-Id: <20220823220922.256001-10-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220823220922.256001-1-irogers@google.com>
X-Mailer: git-send-email 2.37.2.609.g9ff673ca1a-goog
Subject: [PATCH v2 09/18] perf ui: Update use of pthread mutex
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Weiguo Li <liwg06@foxmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Dario Petrillo <dario.pk1@gmail.com>, Hewenliang <hewenliang4@huawei.com>, 
	yaowenbin <yaowenbin1@huawei.com>, Wenyu Liu <liuwenyu7@huawei.com>, 
	Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Dave Marchevsky <davemarchevsky@fb.com>, Leo Yan <leo.yan@linaro.org>, 
	Kim Phillips <kim.phillips@amd.com>, Pavithra Gurushankar <gpavithrasha@gmail.com>, 
	Alexandre Truong <alexandre.truong@arm.com>, Quentin Monnet <quentin@isovalent.com>, 
	William Cohen <wcohen@redhat.com>, Andres Freund <andres@anarazel.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, "=?UTF-8?q?Martin=20Li=C5=A1ka?=" <mliska@suse.cz>, 
	Colin Ian King <colin.king@intel.com>, James Clark <james.clark@arm.com>, 
	Fangrui Song <maskray@google.com>, Stephane Eranian <eranian@google.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Alexey Bayduraev <alexey.v.bayduraev@linux.intel.com>, 
	Riccardo Mancini <rickyman7@gmail.com>, Andi Kleen <ak@linux.intel.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Zechuan Chen <chenzechuan1@huawei.com>, 
	Jason Wang <wangborong@cdjrlc.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Remi Bernon <rbernon@codeweavers.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Switch to the use of mutex wrappers that provide better error checking.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/ui/browser.c           | 20 ++++++++++----------
 tools/perf/ui/browsers/annotate.c |  2 +-
 tools/perf/ui/setup.c             |  5 +++--
 tools/perf/ui/tui/helpline.c      |  5 ++---
 tools/perf/ui/tui/progress.c      |  8 ++++----
 tools/perf/ui/tui/setup.c         |  8 ++++----
 tools/perf/ui/tui/util.c          | 18 +++++++++---------
 tools/perf/ui/ui.h                |  4 ++--
 8 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/tools/perf/ui/browser.c b/tools/perf/ui/browser.c
index fa5bd5c20e96..78fb01d6ad63 100644
--- a/tools/perf/ui/browser.c
+++ b/tools/perf/ui/browser.c
@@ -268,9 +268,9 @@ void __ui_browser__show_title(struct ui_browser *browser, const char *title)
 
 void ui_browser__show_title(struct ui_browser *browser, const char *title)
 {
-	pthread_mutex_lock(&ui__lock);
+	mutex_lock(&ui__lock);
 	__ui_browser__show_title(browser, title);
-	pthread_mutex_unlock(&ui__lock);
+	mutex_unlock(&ui__lock);
 }
 
 int ui_browser__show(struct ui_browser *browser, const char *title,
@@ -284,7 +284,7 @@ int ui_browser__show(struct ui_browser *browser, const char *title,
 
 	browser->refresh_dimensions(browser);
 
-	pthread_mutex_lock(&ui__lock);
+	mutex_lock(&ui__lock);
 	__ui_browser__show_title(browser, title);
 
 	browser->title = title;
@@ -295,16 +295,16 @@ int ui_browser__show(struct ui_browser *browser, const char *title,
 	va_end(ap);
 	if (err > 0)
 		ui_helpline__push(browser->helpline);
-	pthread_mutex_unlock(&ui__lock);
+	mutex_unlock(&ui__lock);
 	return err ? 0 : -1;
 }
 
 void ui_browser__hide(struct ui_browser *browser)
 {
-	pthread_mutex_lock(&ui__lock);
+	mutex_lock(&ui__lock);
 	ui_helpline__pop();
 	zfree(&browser->helpline);
-	pthread_mutex_unlock(&ui__lock);
+	mutex_unlock(&ui__lock);
 }
 
 static void ui_browser__scrollbar_set(struct ui_browser *browser)
@@ -352,9 +352,9 @@ static int __ui_browser__refresh(struct ui_browser *browser)
 
 int ui_browser__refresh(struct ui_browser *browser)
 {
-	pthread_mutex_lock(&ui__lock);
+	mutex_lock(&ui__lock);
 	__ui_browser__refresh(browser);
-	pthread_mutex_unlock(&ui__lock);
+	mutex_unlock(&ui__lock);
 
 	return 0;
 }
@@ -390,10 +390,10 @@ int ui_browser__run(struct ui_browser *browser, int delay_secs)
 	while (1) {
 		off_t offset;
 
-		pthread_mutex_lock(&ui__lock);
+		mutex_lock(&ui__lock);
 		err = __ui_browser__refresh(browser);
 		SLsmg_refresh();
-		pthread_mutex_unlock(&ui__lock);
+		mutex_unlock(&ui__lock);
 		if (err < 0)
 			break;
 
diff --git a/tools/perf/ui/browsers/annotate.c b/tools/perf/ui/browsers/annotate.c
index 44ba900828f6..b8747e8dd9ea 100644
--- a/tools/perf/ui/browsers/annotate.c
+++ b/tools/perf/ui/browsers/annotate.c
@@ -8,11 +8,11 @@
 #include "../../util/hist.h"
 #include "../../util/sort.h"
 #include "../../util/map.h"
+#include "../../util/mutex.h"
 #include "../../util/symbol.h"
 #include "../../util/evsel.h"
 #include "../../util/evlist.h"
 #include <inttypes.h>
-#include <pthread.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <linux/zalloc.h>
diff --git a/tools/perf/ui/setup.c b/tools/perf/ui/setup.c
index 700335cde618..fd10dc6baf07 100644
--- a/tools/perf/ui/setup.c
+++ b/tools/perf/ui/setup.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <pthread.h>
 #include <dlfcn.h>
 #include <unistd.h>
 
@@ -8,7 +7,7 @@
 #include "../util/hist.h"
 #include "ui.h"
 
-pthread_mutex_t ui__lock = PTHREAD_MUTEX_INITIALIZER;
+struct mutex ui__lock;
 void *perf_gtk_handle;
 int use_browser = -1;
 
@@ -76,6 +75,7 @@ int stdio__config_color(const struct option *opt __maybe_unused,
 
 void setup_browser(bool fallback_to_pager)
 {
+	mutex_init(&ui__lock, /*pshared=*/false);
 	if (use_browser < 2 && (!isatty(1) || dump_trace))
 		use_browser = 0;
 
@@ -118,4 +118,5 @@ void exit_browser(bool wait_for_ok)
 	default:
 		break;
 	}
+	mutex_destroy(&ui__lock);
 }
diff --git a/tools/perf/ui/tui/helpline.c b/tools/perf/ui/tui/helpline.c
index 298d6af82fdd..db4952f5990b 100644
--- a/tools/perf/ui/tui/helpline.c
+++ b/tools/perf/ui/tui/helpline.c
@@ -2,7 +2,6 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <pthread.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
 
@@ -33,7 +32,7 @@ static int tui_helpline__show(const char *format, va_list ap)
 	int ret;
 	static int backlog;
 
-	pthread_mutex_lock(&ui__lock);
+	mutex_lock(&ui__lock);
 	ret = vscnprintf(ui_helpline__last_msg + backlog,
 			sizeof(ui_helpline__last_msg) - backlog, format, ap);
 	backlog += ret;
@@ -45,7 +44,7 @@ static int tui_helpline__show(const char *format, va_list ap)
 		SLsmg_refresh();
 		backlog = 0;
 	}
-	pthread_mutex_unlock(&ui__lock);
+	mutex_unlock(&ui__lock);
 
 	return ret;
 }
diff --git a/tools/perf/ui/tui/progress.c b/tools/perf/ui/tui/progress.c
index 3d74af5a7ece..71b6c8d9474f 100644
--- a/tools/perf/ui/tui/progress.c
+++ b/tools/perf/ui/tui/progress.c
@@ -45,7 +45,7 @@ static void tui_progress__update(struct ui_progress *p)
 	}
 
 	ui__refresh_dimensions(false);
-	pthread_mutex_lock(&ui__lock);
+	mutex_lock(&ui__lock);
 	y = SLtt_Screen_Rows / 2 - 2;
 	SLsmg_set_color(0);
 	SLsmg_draw_box(y, 0, 3, SLtt_Screen_Cols);
@@ -56,7 +56,7 @@ static void tui_progress__update(struct ui_progress *p)
 	bar = ((SLtt_Screen_Cols - 2) * p->curr) / p->total;
 	SLsmg_fill_region(y, 1, 1, bar, ' ');
 	SLsmg_refresh();
-	pthread_mutex_unlock(&ui__lock);
+	mutex_unlock(&ui__lock);
 }
 
 static void tui_progress__finish(void)
@@ -67,12 +67,12 @@ static void tui_progress__finish(void)
 		return;
 
 	ui__refresh_dimensions(false);
-	pthread_mutex_lock(&ui__lock);
+	mutex_lock(&ui__lock);
 	y = SLtt_Screen_Rows / 2 - 2;
 	SLsmg_set_color(0);
 	SLsmg_fill_region(y, 0, 3, SLtt_Screen_Cols, ' ');
 	SLsmg_refresh();
-	pthread_mutex_unlock(&ui__lock);
+	mutex_unlock(&ui__lock);
 }
 
 static struct ui_progress_ops tui_progress__ops = {
diff --git a/tools/perf/ui/tui/setup.c b/tools/perf/ui/tui/setup.c
index b1be59b4e2a4..a3b8c397c24d 100644
--- a/tools/perf/ui/tui/setup.c
+++ b/tools/perf/ui/tui/setup.c
@@ -29,10 +29,10 @@ void ui__refresh_dimensions(bool force)
 {
 	if (force || ui__need_resize) {
 		ui__need_resize = 0;
-		pthread_mutex_lock(&ui__lock);
+		mutex_lock(&ui__lock);
 		SLtt_get_screen_size();
 		SLsmg_reinit_smg();
-		pthread_mutex_unlock(&ui__lock);
+		mutex_unlock(&ui__lock);
 	}
 }
 
@@ -170,10 +170,10 @@ void ui__exit(bool wait_for_ok)
 				    "Press any key...", 0);
 
 	SLtt_set_cursor_visibility(1);
-	if (!pthread_mutex_trylock(&ui__lock)) {
+	if (mutex_trylock(&ui__lock)) {
 		SLsmg_refresh();
 		SLsmg_reset_smg();
-		pthread_mutex_unlock(&ui__lock);
+		mutex_unlock(&ui__lock);
 	}
 	SLang_reset_tty();
 	perf_error__unregister(&perf_tui_eops);
diff --git a/tools/perf/ui/tui/util.c b/tools/perf/ui/tui/util.c
index 0f562e2cb1e8..3c5174854ac8 100644
--- a/tools/perf/ui/tui/util.c
+++ b/tools/perf/ui/tui/util.c
@@ -95,7 +95,7 @@ int ui_browser__input_window(const char *title, const char *text, char *input,
 		t = sep + 1;
 	}
 
-	pthread_mutex_lock(&ui__lock);
+	mutex_lock(&ui__lock);
 
 	max_len += 2;
 	nr_lines += 8;
@@ -125,17 +125,17 @@ int ui_browser__input_window(const char *title, const char *text, char *input,
 	SLsmg_write_nstring((char *)exit_msg, max_len);
 	SLsmg_refresh();
 
-	pthread_mutex_unlock(&ui__lock);
+	mutex_unlock(&ui__lock);
 
 	x += 2;
 	len = 0;
 	key = ui__getch(delay_secs);
 	while (key != K_TIMER && key != K_ENTER && key != K_ESC) {
-		pthread_mutex_lock(&ui__lock);
+		mutex_lock(&ui__lock);
 
 		if (key == K_BKSPC) {
 			if (len == 0) {
-				pthread_mutex_unlock(&ui__lock);
+				mutex_unlock(&ui__lock);
 				goto next_key;
 			}
 			SLsmg_gotorc(y, x + --len);
@@ -147,7 +147,7 @@ int ui_browser__input_window(const char *title, const char *text, char *input,
 		}
 		SLsmg_refresh();
 
-		pthread_mutex_unlock(&ui__lock);
+		mutex_unlock(&ui__lock);
 
 		/* XXX more graceful overflow handling needed */
 		if (len == sizeof(buf) - 1) {
@@ -215,19 +215,19 @@ void __ui__info_window(const char *title, const char *text, const char *exit_msg
 
 void ui__info_window(const char *title, const char *text)
 {
-	pthread_mutex_lock(&ui__lock);
+	mutex_lock(&ui__lock);
 	__ui__info_window(title, text, NULL);
 	SLsmg_refresh();
-	pthread_mutex_unlock(&ui__lock);
+	mutex_unlock(&ui__lock);
 }
 
 int ui__question_window(const char *title, const char *text,
 			const char *exit_msg, int delay_secs)
 {
-	pthread_mutex_lock(&ui__lock);
+	mutex_lock(&ui__lock);
 	__ui__info_window(title, text, exit_msg);
 	SLsmg_refresh();
-	pthread_mutex_unlock(&ui__lock);
+	mutex_unlock(&ui__lock);
 	return ui__getch(delay_secs);
 }
 
diff --git a/tools/perf/ui/ui.h b/tools/perf/ui/ui.h
index 9b6fdf06e1d2..99f8d2fe9bc5 100644
--- a/tools/perf/ui/ui.h
+++ b/tools/perf/ui/ui.h
@@ -2,11 +2,11 @@
 #ifndef _PERF_UI_H_
 #define _PERF_UI_H_ 1
 
-#include <pthread.h>
+#include "../util/mutex.h"
 #include <stdbool.h>
 #include <linux/compiler.h>
 
-extern pthread_mutex_t ui__lock;
+extern struct mutex ui__lock;
 extern void *perf_gtk_handle;
 
 extern int use_browser;
-- 
2.37.2.609.g9ff673ca1a-goog


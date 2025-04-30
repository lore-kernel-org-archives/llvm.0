Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F68127A44F
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035479; cv=none; b=Wq9xq9tw4ZCJNkCl6/nElkkqlp3Chb5BXEgQKKY6JrO0iLtwQYKKN4xy2mS2vR2zbHdqFhe56MpNRmV/az4eJPKZ+XNr4Ogj/3bH6V68rRgw8P3J8uRIKTqQKBQT5XDP1cyGwhpb48V2UAQYoNkOcHOf4FomCTaUv3KEobgfbmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035479; c=relaxed/simple;
	bh=Y3D+HeelZHUbj722B9+EEIFwYk/UcruDD4c+xdB3tPw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nMZiQsFbLBhPDpFrrJkS+Vp0sDdNFn6VNr37xD6M8Z02uom98tTZ5phY4vySonfSTDF9QihveU98WoUqciZ8umr+dKVuS4mTgctAmdge/12GjfQBWPmVoermqE3y/7iOYzWZ2IgIMZ0YnSCHaMididY7VhqYau/EVW0CoZ/Yp+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x0tE0SVg; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x0tE0SVg"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2241e7e3addso798555ad.1
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035475; x=1746640275; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZlmxX2xoyYFq1ODXrK6/XcfYk4sIZR3JZBZG1kQdeM=;
        b=x0tE0SVgMoxCuqbeepM0JUMwBlUvUax6wNK6DcgWjCuhgSlhNud6cGH7ClZ72lWEzU
         Hy6Rce1e5p8MaUMKlaCttho62SbeliAuL3mjj6oxwAz4qlMj0RQcVeikWpVyp/NcOY3Z
         UgNgUjDt73zidKq8Xywr1VngsrimjTkVKE7rJbYwiq+XXjkfjn1OHzXYS/n8nwHiHpmq
         +a+0bdSw7jCogHPiyRT424rQ7OVKoiWTugdSULWlyH2W5eYyBntJY2GlB/+le/MmbAkw
         e5Cf2iAPmITBs8Y4tpoS4sDqmSPU6G+WsteGD4xllSTcdYf0rIWaM/AIcPA0Fw5qMEfq
         iTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035475; x=1746640275;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TZlmxX2xoyYFq1ODXrK6/XcfYk4sIZR3JZBZG1kQdeM=;
        b=Nx5MEPyF3fX8eFvqjPRG/QeejkRq098eZSid5PtEiEm9LvQMM/r+gzYrJ++UciRGPI
         I8p91GJhw9h7GQe147+eg6XomnB9GF1839B9ShENWECAboQO4C2hm6Eq/YtYtQ8RuSeL
         qOZ2xoxt50BTno6G5qAuIy9QCXvXvqX0VoTUuJPA9vbhQU9V/Zr9u2IDl182wnUsfoo+
         vpPG3W3b5YWRZwJAoy3lH4a3pmTwnhw1AUQmU5BV+ZvT9CQD3f224InWETL2tr68FVij
         hrf+CZ744Buwb/JDZMEYDOqX8IV3ys1qr/99cV1KbLXmxW4miBUuGwlnvhk2t3/FejDm
         pKzA==
X-Forwarded-Encrypted: i=1; AJvYcCUMKfS5lQM+NK1xmEORcGzEuZidSOx/7A5ewtNmc7pfIgb92XWLnTh6deez76SBgMD3NOGw@lists.linux.dev
X-Gm-Message-State: AOJu0YwGrkt88eMCjToxKEi1M8Ntrm4RiSpJIwQLLVGREDDqZ1xUx5qU
	0b4KuYoRfn1qZ2ITFepS+RYtJRdhaRLcRYQOCMITu7BXh3rAafcz5tkChgmlS7eXJq2X0mE6awU
	LBN9dnA==
X-Google-Smtp-Source: AGHT+IGTl/0MRt+DgDNAUuYugWnKJZds1hQoM1nSd1eYiKimwIiKclutS+1wetnNSbh/OGTZQZOUhIBYkuPV
X-Received: from pjbst3.prod.google.com ([2002:a17:90b:1fc3:b0:301:4260:4d23])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f86:b0:2fe:a8b1:7d8
 with SMTP id 98e67ed59e1d1-30a33355ff6mr5623948a91.25.1746035475516; Wed, 30
 Apr 2025 10:51:15 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:49:57 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-10-irogers@google.com>
Subject: [PATCH v2 09/47] tools subcmd: Silence -Wshorten-64-to-32 warnings
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
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
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Levi Yun <yeoreum.yun@arm.com>, Weilin Wang <weilin.wang@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Andrew Kreimer <algonell@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit.

Move mput_char out of header file to its only use in help.c, while
changing its argument types.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/lib/subcmd/help.c          | 28 ++++++++++++++++------------
 tools/lib/subcmd/help.h          |  6 ------
 tools/lib/subcmd/parse-options.c | 16 ++++++++--------
 3 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/tools/lib/subcmd/help.c b/tools/lib/subcmd/help.c
index 8561b0f01a24..555b91ada0f9 100644
--- a/tools/lib/subcmd/help.c
+++ b/tools/lib/subcmd/help.c
@@ -125,13 +125,11 @@ static void get_term_dimensions(struct winsize *ws)
 	ws->ws_col = 80;
 }
 
-static void pretty_print_string_list(struct cmdnames *cmds, int longest)
+static void pretty_print_string_list(struct cmdnames *cmds, size_t longest)
 {
-	int cols = 1, rows;
-	int space = longest + 1; /* min 1 SP between words */
+	size_t cols = 1, rows, max_cols;
+	size_t space = longest + 1; /* min 1 SP between words */
 	struct winsize win;
-	int max_cols;
-	int i, j;
 
 	get_term_dimensions(&win);
 	max_cols = win.ws_col - 1; /* don't print *on* the edge */
@@ -140,12 +138,12 @@ static void pretty_print_string_list(struct cmdnames *cmds, int longest)
 		cols = max_cols / space;
 	rows = (cmds->cnt + cols - 1) / cols;
 
-	for (i = 0; i < rows; i++) {
+	for (size_t i = 0; i < rows; i++) {
 		printf("  ");
 
-		for (j = 0; j < cols; j++) {
-			unsigned int n = j * rows + i;
-			unsigned int size = space;
+		for (size_t j = 0; j < cols; j++) {
+			size_t n = j * rows + i;
+			int size = (int)space;
 
 			if (n >= cmds->cnt)
 				break;
@@ -180,7 +178,7 @@ static void list_commands_in_dir(struct cmdnames *cmds,
 					 const char *path,
 					 const char *prefix)
 {
-	int prefix_len;
+	size_t prefix_len;
 	DIR *dir = opendir(path);
 	struct dirent *de;
 	char *buf = NULL;
@@ -194,7 +192,7 @@ static void list_commands_in_dir(struct cmdnames *cmds,
 	astrcatf(&buf, "%s/", path);
 
 	while ((de = readdir(dir)) != NULL) {
-		int entlen;
+		size_t entlen;
 
 		if (!strstarts(de->d_name, prefix))
 			continue;
@@ -250,10 +248,16 @@ void load_command_list(const char *prefix,
 	exclude_cmds(other_cmds, main_cmds);
 }
 
+static void mput_char(char c, size_t num)
+{
+	while (num--)
+		putchar(c);
+}
+
 void list_commands(const char *title, struct cmdnames *main_cmds,
 		   struct cmdnames *other_cmds)
 {
-	unsigned int i, longest = 0;
+	size_t i, longest = 0;
 
 	for (i = 0; i < main_cmds->cnt; i++)
 		if (longest < main_cmds->names[i]->len)
diff --git a/tools/lib/subcmd/help.h b/tools/lib/subcmd/help.h
index 355c066c8d49..258b3a143cbc 100644
--- a/tools/lib/subcmd/help.h
+++ b/tools/lib/subcmd/help.h
@@ -14,12 +14,6 @@ struct cmdnames {
 	} **names;
 };
 
-static inline void mput_char(char c, unsigned int num)
-{
-	while(num--)
-		putchar(c);
-}
-
 void load_command_list(const char *prefix,
 		struct cmdnames *main_cmds,
 		struct cmdnames *other_cmds);
diff --git a/tools/lib/subcmd/parse-options.c b/tools/lib/subcmd/parse-options.c
index 555d617c1f50..add46b81a131 100644
--- a/tools/lib/subcmd/parse-options.c
+++ b/tools/lib/subcmd/parse-options.c
@@ -201,7 +201,7 @@ static int get_value(struct parse_opt_ctx_t *p,
 		return 0;
 
 	case OPTION_SET_UINT:
-		*(unsigned int *)opt->value = unset ? 0 : opt->defval;
+		*(unsigned int *)opt->value = unset ? 0 : (unsigned int)opt->defval;
 		return 0;
 
 	case OPTION_SET_PTR:
@@ -256,12 +256,12 @@ static int get_value(struct parse_opt_ctx_t *p,
 			return 0;
 		}
 		if (opt->flags & PARSE_OPT_OPTARG && !p->opt) {
-			*(int *)opt->value = opt->defval;
+			*(int *)opt->value = (int)opt->defval;
 			return 0;
 		}
 		if (get_arg(p, opt, flags, &arg))
 			return -1;
-		*(int *)opt->value = strtol(arg, (char **)&s, 10);
+		*(int *)opt->value = (int)strtol(arg, (char **)&s, 10);
 		if (*s)
 			return opterror(opt, "expects a numerical value", flags);
 		return 0;
@@ -272,14 +272,14 @@ static int get_value(struct parse_opt_ctx_t *p,
 			return 0;
 		}
 		if (opt->flags & PARSE_OPT_OPTARG && !p->opt) {
-			*(unsigned int *)opt->value = opt->defval;
+			*(unsigned int *)opt->value = (unsigned int)opt->defval;
 			return 0;
 		}
 		if (get_arg(p, opt, flags, &arg))
 			return -1;
 		if (arg[0] == '-')
 			return opterror(opt, "expects an unsigned numerical value", flags);
-		*(unsigned int *)opt->value = strtol(arg, (char **)&s, 10);
+		*(unsigned int *)opt->value = (unsigned int)strtol(arg, (char **)&s, 10);
 		if (*s)
 			return opterror(opt, "expects a numerical value", flags);
 		return 0;
@@ -770,9 +770,9 @@ static void print_option_help(const struct option *opts, int full)
 		break;
 	}
 
-	if (pos <= USAGE_OPTS_WIDTH)
-		pad = USAGE_OPTS_WIDTH - pos;
-	else {
+	if (pos <= USAGE_OPTS_WIDTH) {
+		pad = (int)(USAGE_OPTS_WIDTH - pos);
+	} else {
 		fputc('\n', stderr);
 		pad = USAGE_OPTS_WIDTH;
 	}
-- 
2.49.0.906.g1f30a19c02-goog


Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101482882D0
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035502; cv=none; b=EsEQ0aIqJJwo2vWv9o94XUlTHMzAlhoiaNd3qvact9LYQJMJKOq4jR/M+WMtxVdBYInJ6xzY9mBNvVb6BChkNyZSXsMjOrTY6hfvYMNlZ61QCz1ShJ0CdLY/ZsKHeOPDPbdNj0x4PRFXhbdFshNRUO2KVUAjYJvdxQ46PNaWrWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035502; c=relaxed/simple;
	bh=71Fh1qtXfJOLrXvEBj1LTswa/5CQQRqQLFx8XbFD85k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VT/oNvotF4aRJKyuv7lggLNzrqkXN8nFiRPaDrRk42NA8jiSzi/y0JZkwn2jF8Rjo6kot7uUfRqe1cwcQfYpVTvsUxAM/bnAv1RCV/SB53rvJb4D0EMuj9m0EZBFluKM9lzmo5UDYkDU9ou8OLwZH9mUytKcjnu6YyS1evRDqv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D22NDN1z; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D22NDN1z"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-72f3b4c0305so180173b3a.0
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035499; x=1746640299; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vzdcyVDs5KmZFcO+KePSm4+Ud/p9n76j0KYupv7ixbU=;
        b=D22NDN1z3Nmo5qKcpe9d3VLrJXVHUmUQKXzFzfaWO1GDx1Q/WK+iyMTb2CELyaaBJE
         TuUOaUpA7nH5dfsf9RlnULk6AzyWLJYTDj4zQ7cNJ5uLz0h5m3H4kaXSJHGH8yUkuNIZ
         s/SOF9if5IU5Zi1kUm+8CqcjU9OsJsIH53q731pT2cENCncJxY78Z7MOK64+yZZpqn8r
         F+mlAtvIWIyYJs/XH2bzn7UFP2+5Dvql+Mr/b3bVqc9vTaAlo5+D6yCbgZLy/vxZjKlE
         c9ee0ruLqZhFaG6OorEWLZFKwtA9mwuy3+Qh4XjDzJS4qITxLItIvLk08rsV+T4M7Rl7
         U8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035499; x=1746640299;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vzdcyVDs5KmZFcO+KePSm4+Ud/p9n76j0KYupv7ixbU=;
        b=arCooI3cFhYzZjSVNHLSKTL4JzjfkEr8HbxanTaSDJt30NN5nqi46Qmfq9HOU8cfZk
         5H7UiS3AIzBpEYAcOeS0n0fu01UwxJ/HyDV43sZH7ZOi21lHB3SVd28iOPlWbp4c2wuW
         b5sbe879+abBdEZg4ihJ0H5LvPn+40iiiFzt7KGycQUKO1u8z/GD0R6+3uVuH/13luJR
         v2+fT+izIxwmtXCwR9csE1Vd4c6vke1op4zjCjidSx++5da6rIp4i55fBVtE29qnQ5d8
         VGEEKd6rcHQbOrOgnU6aUw5ICu8Kboe0ObjF9dzEG5bTeJitKW4WdZBeG+lmmtHr5WBu
         dEBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdyyviXKGuYdMUhLxY9ZE6ZI2pVKtnAMizWuSMDAoQv+GG26WN+SvG9RlpbKDgP3NvjN2V@lists.linux.dev
X-Gm-Message-State: AOJu0YxO2OQC0AT1M/epmd4CqaTs36tMh9BP8qJeALykP+zK1NomxdIK
	ojab13IyL9Pa+/8tJ/ukgC4XeUTE82ImE459Qro4cAwg+mw2HV/BJmJoZ+HaY/KKQa993k9sGzx
	g84Yj7A==
X-Google-Smtp-Source: AGHT+IFOPGbRFAxJkE+dEQP10DpVFZBKzSu9vIFxGxZ8r+laJ8avCeQVWaEft4PQXwRDgfVw41yAmv4ZGYUC
X-Received: from pgbdp2.prod.google.com ([2002:a05:6a02:f02:b0:b14:9a53:2226])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:394f:b0:1f5:8622:5ed5
 with SMTP id adf61e73a8af0-20ba6a18194mr167216637.3.1746035499179; Wed, 30
 Apr 2025 10:51:39 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:50:09 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-22-irogers@google.com>
Subject: [PATCH v2 21/47] perf demangle: Silence -Wshorten-64-to-32 warnings
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

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/demangle-java.c  | 4 ++--
 tools/perf/util/demangle-ocaml.c | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/demangle-java.c b/tools/perf/util/demangle-java.c
index ddf33d58bcd3..ee20f4d08765 100644
--- a/tools/perf/util/demangle-java.c
+++ b/tools/perf/util/demangle-java.c
@@ -42,9 +42,9 @@ static const char *base_types['Z' - 'A' + 1] = {
  *	error  : NULL
  */
 static char *
-__demangle_java_sym(const char *str, const char *end, char *buf, int maxlen, int mode)
+__demangle_java_sym(const char *str, const char *end, char *buf, size_t maxlen, int mode)
 {
-	int rlen = 0;
+	size_t rlen = 0;
 	int array = 0;
 	int narg = 0;
 	const char *q;
diff --git a/tools/perf/util/demangle-ocaml.c b/tools/perf/util/demangle-ocaml.c
index 9d707bb60b4b..25fe755df5ab 100644
--- a/tools/perf/util/demangle-ocaml.c
+++ b/tools/perf/util/demangle-ocaml.c
@@ -30,8 +30,7 @@ ocaml_demangle_sym(const char *sym)
 {
 	char *result;
 	int j = 0;
-	int i;
-	int len;
+	size_t i, len;
 
 	if (!ocaml_is_mangled(sym)) {
 		return NULL;
-- 
2.49.0.906.g1f30a19c02-goog


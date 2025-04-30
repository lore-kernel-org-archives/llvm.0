Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C251274FF8
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035539; cv=none; b=XA8z4r+lejisLnJRLD0GNG1XnbZBHOmzvc37P2Ce5Iru2zqmWdWomGZ00imbnkOc4Di6wbHNydDXVetADexDcsNML4+0KhFSeAJZABMF6ohU+JASnmcn0Co9iQQjAqtXO0NDcGbsJVQL5Mn6f7NM6xWKKygvs3ewiXnRp1oKnaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035539; c=relaxed/simple;
	bh=B4P8X+ThauaDsMSNoMu1yG7cr2e+7hdA0BByWopBD0A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BQCDtorM4NLXSZU2sqU0eke2XKuQK79Owrqs3uNtYLqeD1sZS1Ik641MewyrbzqRsVeBSRD3CePxpr65OwGGzmZucvdd4yj+YSHtm0gl830Iw5OIu+vYAPZQ245VIbcZG9InobMzkAc0GmVP83Wxt9Fp2Uy20YMVzNTfjjRFN84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TOQGs9q5; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TOQGs9q5"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-73c09e99069so192022b3a.0
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035536; x=1746640336; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c9SIvg4b8LTBykzVMpfH5dHkyvhrTmI4owZU0wKlV1s=;
        b=TOQGs9q5rmzH/Rr9Vac+/qSLCnejqUTpvJbLrnn1ybb1HHXY4CoVpq+4WroKJkVwlK
         3SFA4OgTyULEcDEapochHwS3kOtxz5FV7BFMjlRKLlQZqpHeSYMU7Vwsx0l9JP6yw1SS
         mTQYubuRZgHTp544TQG+IvTMuFxj8Kqi1J3qwuqj0Rbzn+5xep9dmKcnmn/6v61DYYPk
         qyQKOyT6h3nAqOsmHUYKUcFv8pzAW4ocAqT+di+Nf5QaWpVb5dF3tKvWXoMvgVbIjskW
         LqQnjy+Z9JPe9pyPKTw2ZUZDDntfv1CrDpwSua9bcqGpJkI9wjOz3ChjxgpLMHg5MShM
         /CHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035536; x=1746640336;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9SIvg4b8LTBykzVMpfH5dHkyvhrTmI4owZU0wKlV1s=;
        b=H2NBVZzgG/d6Bus/s12EjuJfdYN1nrrgAZhilxVVgV2wWLkdkXp+yz5D5mDphnUrzU
         S1C86SRm7r7QTh/7lnYtMvIJSEVI/+kdtLG6A/+Qh2n5x+qZ6234zwfyD1c5ewrngXkF
         j6KCPn4YhEVI9guD4UsLgBnPhOkb+c3i9Qp2Sx/vs9jQyfFPFi8PPduznmToDV2o1BQ/
         eOmbxR+1VdbuWCuibecO+1djA3WFya1Fe7cKA9xoCwJbDMvutFexhs7hwargQKrRwuft
         bEiKBO2/vOPaF5+pVUaJao7o2iaNKRYCHHVIKeNLlC81tl1dLVZ2zKfAd8nv4VoPyA2r
         6MnA==
X-Forwarded-Encrypted: i=1; AJvYcCX3wXn1Ur3YiV5c9Slkkcbeexq5VNnpUG07Og0VXqO30ZwbRQya30lb99Ngksq9Zmps5195@lists.linux.dev
X-Gm-Message-State: AOJu0Yzgrx2AZh6fKrkIROEyFHdQA89tDj7lEGFeVtyFr1z4i7YGVlyv
	iQnvgFgvtq/4eHZVzb7BzdFihyQHQjTx6bTcf0v27XqT199K1ytxojZI22G/QF47yWzM9u03JpL
	Mj2C18g==
X-Google-Smtp-Source: AGHT+IGjzGff+HNk+tYsv6TUdg6dbW3ViGP7ppalI9VAj00JgvvC6ap53DDy+4MZf0hOj1/c1JTb3R8LqkAo
X-Received: from pgdp27.prod.google.com ([2002:a63:951b:0:b0:b0c:3032:f595])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9e4a:b0:203:bb3b:5f1d
 with SMTP id adf61e73a8af0-20a8754e89emr5818933637.6.1746035536138; Wed, 30
 Apr 2025 10:52:16 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:50:27 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-40-irogers@google.com>
Subject: [PATCH v2 39/47] perf list: Silence -Wshorten-64-to-32 warnings
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
 tools/perf/builtin-list.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/builtin-list.c b/tools/perf/builtin-list.c
index fed482adb039..ffe2e972e3f2 100644
--- a/tools/perf/builtin-list.c
+++ b/tools/perf/builtin-list.c
@@ -93,7 +93,7 @@ static void wordwrap(FILE *fp, const char *s, int start, int max, int corr)
 	bool comma = false;
 
 	while (*s) {
-		int wlen = strcspn(s, " ,\t\n");
+		int wlen = (int)strcspn(s, " ,\t\n");
 		const char *sep = comma ? "," : " ";
 
 		if ((column + wlen >= max && column > start) || saw_newline) {
@@ -171,7 +171,7 @@ static void default_print_event(void *ps, const char *topic, const char *pmu_nam
 		int desc_len = -1;
 
 		if (pmu_name && strcmp(pmu_name, "default_core")) {
-			desc_len = strlen(desc);
+			desc_len = (int)strlen(desc);
 			desc_len = asprintf(&desc_with_unit,
 					    desc_len > 0 && desc[desc_len - 1] != '.'
 					      ? "%s. Unit: %s" : "%s Unit: %s",
-- 
2.49.0.906.g1f30a19c02-goog


Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7616E227E87
	for <llvm@lists.linux.dev>; Tue,  1 Apr 2025 18:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743531965; cv=none; b=Mc13I7CssdXIXA68ZJKXkkcLFqUm788Sqcj2uuA64EILtTWT0Lq+bIbDGXhC8ToBKj3CNuA99R+87rQyh/e+aO4zYBkMrWYujQSTML8fy5sLzcNLBI9s+QCTjN58RESABbyg4PHZS52w/3SkbE6jkhOGT5r+JevSgTNtA2NkOvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743531965; c=relaxed/simple;
	bh=kqjLECJCUYD+3DaN9tBW/l19nUZu8ny1BGp4QXL8J/o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=fLJnM0ShS8TkMOY2zxGWq7B1BPz4FrB9yND8Epk3kEytbDcKYiL57obHjivOmYv7BLgx8PVU/gTmnNqtjklHgUGR147HQzi2fb2fv5GX3V4NO52qIJmE+Rknu6HZ3LMlTdILZlqitVXm369+m75MFz+Bey5CM/4BkoZgXT3tL8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wJlIH0Vs; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wJlIH0Vs"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2254bdd4982so149553275ad.1
        for <llvm@lists.linux.dev>; Tue, 01 Apr 2025 11:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743531964; x=1744136764; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P9osYdTmGwp/3DEg7I+o5/Yh8Bly4Esp6cRQqIII8fg=;
        b=wJlIH0VswtwA0WTtKV8JY15m/jth2/eoYNsq+kMeaF2rb9hnxtxY+bERcTuL4BwNs+
         D1LcFlG1HDwiP1uO3k1VKAw9ySro31irZU3dG56LYYREvNg90y1VakaYQxvbfkHjj3rr
         HpJFM1rHA0t+YMsZQnMFHmjyZHfLz/hNJqD8ucTLBdufzaFIiGpQnDbs3OIRCl7srYJR
         5LLzYJa3GQ+2iwb+110EwjGtjLu2uubSsUq033eSdG/nXOiCDO5sWl5nvbjFdBzWhdFb
         pnDc0Kda1D8qxFh2BnjEiR+ggzixk7JiYcQBDsEeNcwSxtP6XWmGDnlKZGsbNROe/BHs
         Fw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743531964; x=1744136764;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P9osYdTmGwp/3DEg7I+o5/Yh8Bly4Esp6cRQqIII8fg=;
        b=cLZwAlvGmzw32LkDDXF/u/twzAfJlnUT9/B73hjyld/iSRtmpeXEC+hsAwKDVH5VYb
         ivdscCVks+j9ZluDt99o8Iui7BWG7MHO33PIcY+cJEnYd0H3SpGfMprgPO7YPqXRRcVs
         DFxPAaPTtSkq3643RwOxPbc8TDUnPhQG6A5qI26CnLZR0+fpMB7qM1HHxdi6KnYsFouv
         AieWUCik5FGqgxzmdxzEcDN9Z7s6GqigLKbWlX+tKwdekiLflZSdvB/5PJL5SqQnE1rj
         XZet1ywAqm5uCef/WEgmphXvWNAM7V3CJ3DSEmgs2Bibr0Pv+D1BEoYxcyzKklMhsi07
         TeHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlrcZzvVV+66zn+KTgtklvhyQmVz63E/3AWvjIF33CK3aLpy8qPSjtXPzRZJANOEDe8qf9@lists.linux.dev
X-Gm-Message-State: AOJu0YygsMFm4dX5NtC/PJWzQPpGMxca3N6hpl8hhvg1PFfw3w4RQyPK
	vpgU3FSyl9W3SL0vJr2rpiZh9X74aAN2NHYkLqfSgdSlKH2TcfCsUyIImfKh4RcUbF+ugrNslkk
	haAIkrg==
X-Google-Smtp-Source: AGHT+IEC0XntAVPhP46YCuSQR8aucy2yFpAV1NdYsaqT4OqN5P4FGt9h/5E8WgDvwC6hNZc/JS/GJoayAtne
X-Received: from plgl19.prod.google.com ([2002:a17:902:f693:b0:226:3efa:da86])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2308:b0:223:5ca8:5ecb
 with SMTP id d9443c01a7336-2292f9f2b5cmr222952555ad.42.1743531963640; Tue, 01
 Apr 2025 11:26:03 -0700 (PDT)
Date: Tue,  1 Apr 2025 11:23:41 -0700
In-Reply-To: <20250401182347.3422199-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401182347.3422199-44-irogers@google.com>
Subject: [PATCH v1 43/48] perf daemon: Silence -Wshorten-64-to-32 warnings
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
 tools/perf/builtin-daemon.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/perf/builtin-daemon.c b/tools/perf/builtin-daemon.c
index f0568431fbd5..640ba8191083 100644
--- a/tools/perf/builtin-daemon.c
+++ b/tools/perf/builtin-daemon.c
@@ -514,7 +514,8 @@ static int daemon_session__control(struct daemon_session *session,
 	struct pollfd pollfd = { .events = POLLIN, };
 	char control_path[PATH_MAX];
 	char ack_path[PATH_MAX];
-	int control, ack = -1, len;
+	int control, ack = -1;
+	size_t len;
 	char buf[20];
 	int ret = -1;
 	ssize_t err;
@@ -543,7 +544,7 @@ static int daemon_session__control(struct daemon_session *session,
 	len = strlen(msg);
 
 	err = writen(control, msg, len);
-	if (err != len) {
+	if (err != (ssize_t)len) {
 		pr_err("failed: write to control pipe: %d (%s)\n",
 		       errno, control_path);
 		goto out;
-- 
2.49.0.504.g3bcea36a83-goog


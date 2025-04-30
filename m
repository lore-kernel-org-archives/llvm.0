Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B1C280325
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035494; cv=none; b=HelLEaEzaf9UnseS+KhToKAnRb/9iR1QsECX3M6XrSvD8sJhuIyQ1IE69mJ9QCAotVzeBylXPjnBUs+ice9lbK3YT0ftRckVw6q0crHdBz+Td2T9PSwg6D6zYe2XZt54z5EkzYol2xkUEIgBdNmvRRszn7tMNs2y4t3Se2o6hTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035494; c=relaxed/simple;
	bh=FzFTOk8Ufj5qP+krSfCyPLmIdLEkdVxKDQVag/5VkCY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=njnwx8ZdnoYf+iy1SsAQitpmWSOkF6RxrkRG2xaWaxNv1wUMrgvOO3wuGxSZZ/TlxbO6RZzIXAs8kUryDU3oCNsqe6wNTUT2fAlWG104NprQUdXzLXfvXshSgTF997qeSsolTaio1sfuAuWlH5pDPG3uJM9wMJnWXnANLCs9Qvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Evd/CNCm; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Evd/CNCm"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7375e2642b4so106214b3a.2
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035492; x=1746640292; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hYPH1xGtocHJ35QYcCtSMMJMMhxe7zjT7fDJ29knBFI=;
        b=Evd/CNCmpF7gbjRCLPxnW/3xPYDNf4cLhDewVOrY6HelW+2mq10PWbJK+s4W4u+W7C
         +A0agkRb4vMQDQb4Wjwyl8iFUil9yMZkYMLhP3lyHJFfpfTlkzoRSHLswC7YOXum6xnp
         tU1XtDR5Qja1uq3r8kdz8ZBzB4Nw9dvH28buK7BCp5wj0Y/muzjW2a34k+Kg1icREZjF
         simFqayv+DBicLtcsFkFPIwhJeBFSj8jtwGF12e8f9GGM1bSZ2BzaHXF1dfte9AL6cR7
         KCkaR8ZCakAOsfrnn5/CmUXnk3SgrPXNXm9w61dX2mckDnj2Oz+mLRcLdnN30UCDMND4
         08gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035492; x=1746640292;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hYPH1xGtocHJ35QYcCtSMMJMMhxe7zjT7fDJ29knBFI=;
        b=niedHdi234Qc7qd/00ETqkZzm6F6EFv3CcUz20/R5TFB+gctyhl2FE//RNUoLlCca6
         y4o5+ZERpDR/fg2FX8KmdsSCsbHf2OmQrnF/OWz1RyLt5YvwxizIWgwi1x9LfHvFt5LI
         Xm4LDyYpRxX6g3Z84oDWSp/hUUepHUF6XSPP+DV/Ojw7QmcbHXrqgfqMzIDGYw80ltAb
         nUV+nxZg2MdOd0hnMD06kTpLU6jqKYMLKodBDvrU5Q1sfKN2oA4ZblsDlSo0Rr1kNVnM
         T8pwrJ+56LC9a1OxKmymGnKcMrqfFwSKw2A1EyB3fH4wvbwROvQwPfnP50Hz2saMU8ZK
         jNXg==
X-Forwarded-Encrypted: i=1; AJvYcCW3cA74MCR0ts9bhI2dusZzOMFdNMhLgnf8D+nKAhWoU0/MYXSfrCsE3/I+dku/rcPKrMeR@lists.linux.dev
X-Gm-Message-State: AOJu0Yyoh3oKgdaFE/SyIlWtOePZb2mMI6MVXkAIxpAL/WxSETBSSs8H
	K2FXNcKcOISVn3mLNGXE/3yxhytz8eKNvfB2dfzOsPVAEl2jQXBKmeVVlvtvsWfg9Xpl5eIU3nf
	UgeTmSA==
X-Google-Smtp-Source: AGHT+IHbw+GdtjVSf/hiJFmVY7X2M/TmZ2qfVrFS6sONlhMKvT3czNPfmyWWbkeJgJWJ2/mlC7aqCgd+XwFA
X-Received: from pgbee3.prod.google.com ([2002:a05:6a02:4583:b0:b16:4869:6621])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:158c:b0:1f5:6abb:7cbb
 with SMTP id adf61e73a8af0-20a8832fa6amr5508460637.23.1746035491433; Wed, 30
 Apr 2025 10:51:31 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:50:05 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-18-irogers@google.com>
Subject: [PATCH v2 17/47] perf s390: Silence -Wshorten-64-to-32 warnings
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
 tools/perf/util/s390-sample-raw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/s390-sample-raw.c b/tools/perf/util/s390-sample-raw.c
index 335217bb532b..7e5c1448ea6b 100644
--- a/tools/perf/util/s390-sample-raw.c
+++ b/tools/perf/util/s390-sample-raw.c
@@ -202,7 +202,7 @@ static void s390_cpumcfdg_dump(struct perf_pmu *pmu, struct perf_sample *sample)
 		color_fprintf(stdout, color, "    [%#08zx] Counterset:%d"
 			      " Counters:%d\n", offset, ce.set, ce.ctr);
 		for (i = 0, p = (u64 *)(cep + 1); i < ce.ctr; ++i, ++p) {
-			char *ev_name = get_counter_name(ce.set, i, pmu);
+			char *ev_name = get_counter_name(ce.set, (int)i, pmu);
 
 			color_fprintf(stdout, color,
 				      "\tCounter:%03zd %s Value:%#018"PRIx64"\n", i,
@@ -258,7 +258,7 @@ static void s390_pai_all_dump(struct evsel *evsel, struct perf_sample *sample)
 		p += sizeof(pai_data.event_val);
 		offset += sizeof(pai_data.event_val);
 
-		ev_name = get_counter_name(evsel->core.attr.config,
+		ev_name = get_counter_name((int)evsel->core.attr.config,
 					   pai_data.event_nr, evsel->pmu);
 		color_fprintf(stdout, color, "\tCounter:%03d %s Value:%#018"PRIx64"\n",
 			      pai_data.event_nr, ev_name ?: "<unknown>",
-- 
2.49.0.906.g1f30a19c02-goog


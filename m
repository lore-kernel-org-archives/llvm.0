Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8828298413
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035540; cv=none; b=YsCFInQFLFFvf9FosDjFPJ84f9/TzaLMHAK9oDRKwUbWgLgHEzL37JR9qhuJnre8J0TpOoDaCRHfblu0HqOOm+2QauJmuFkstxlT8BNRJ/0uvdUFZlnuzZA5LudVVmpQdtfFIF1SiEYrilvLX7CcoLl7EgcZ/63yPkOH0IcM6KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035540; c=relaxed/simple;
	bh=X7ayYarIFslbLLtsLDqK4tsTxxIhw1Fw48lPCUEOBWo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oFRRyQiieQid+kOW5ks15bZ2q4Iywci2c7maP4c3O1dHYvVAS2+i3OunDDDv985xu2OxkythRHpghGmcl39TmGWr3GwPCq6GQecww9H8Ohsl2kfqC94i1r3gD9+VE4mql3cww4mdd8V8MwGTjmK+AZrmOrtgJEvq5d3TD0b35Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gy8kvG8v; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gy8kvG8v"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30a39fa0765so206416a91.3
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035538; x=1746640338; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FY+AhXNeHM9fvvryKR588grjwTzwmRayIi3f4UurhvE=;
        b=Gy8kvG8vbfGxReuzByb7/pR5yoIYU4McWcxHDVbdWiXa3zrK5Ip8HKR7q9A2z+ig0i
         1BOhcvHkeuRzPGI3I2YxNH9DXH1BEm7PdjtoU4X23RypXAyDTGvpM+wfAbZYMKY9mu2T
         oRXGHjgPjZuGWa+A1YI0f+JcwK0IDspY59Csq1JXP9Kf6niwLuZTjiOBNxAI0098rKoF
         xL8fp7z7Fk3BHzL1w+XXl/RTsRkahMkY2qp6Wn8hDZ4LixQlPjkxww6STpnUzrHcgoMS
         8daf6pdOaK6abz09EmPJvylw94fJGO1ctys4eAzNBu9PLeg8HpM2jKXKgobHWWyVqKVW
         CZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035538; x=1746640338;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FY+AhXNeHM9fvvryKR588grjwTzwmRayIi3f4UurhvE=;
        b=S6AsDtiAtkXZPnVSkJLMp+sl1fumNbIPgHyzTNLN3YUk543OSG7Tn+B5fwFpq5zBGd
         CBikM1Dbpkt66hVGKXn89YP7tR3jAtKdLXY7eBe6t1aXTMmjvhuSI+E9U+T87TkSu6ZM
         mz2JNLxvCYFkG9wV3A7mRODdNdVrY803L26usIuWenZzjWYQQO2uKnd2eiE2rO/S+VgI
         b5Mc1IMe05yf9QVBi2xFBltjrS80lnIk9r8wjhQzDr0Ul2Iw3kP/XHRmEV5gEu6WSdnI
         1VLPOvi/MQmFCZ9ifomibMJpu74ZhZ+BN2vNOfJdLnYuRL3ewivgQuZ5rorJCapzQSHO
         q5Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXlGDMHzec0v3QxfhIR7LbL9JXTKsGBbRzb9O15fMTc9AymXtyI0SIHfOf3DCy6S4iUGB/E@lists.linux.dev
X-Gm-Message-State: AOJu0YxJMJlOuX8oGmWypvHQQOfdke7woHazwdn4OV2+tMCTlU+phkk/
	c3XVuDTa54pThz27JnFVDGLSPSPGqJCT4tmOtlxft47Iv0Amy9WexHQNx84IAE+jfl6+YFoMlBr
	w7MsC6A==
X-Google-Smtp-Source: AGHT+IE3SvE/3M//FPmVxa20Y7yaBTKb6cpmpVwiYcI4Thv+DfvvJxrMk6sGwWSsSGI6Aw0EzedIm7xTjv4i
X-Received: from pjbsv4.prod.google.com ([2002:a17:90b:5384:b0:2fa:2661:76ac])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d48:b0:30a:204e:3271
 with SMTP id 98e67ed59e1d1-30a33300d8emr6527144a91.17.1746035538234; Wed, 30
 Apr 2025 10:52:18 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:50:28 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-41-irogers@google.com>
Subject: [PATCH v2 40/47] perf kvm: Silence -Wshorten-64-to-32 warnings
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
 tools/perf/builtin-kvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/builtin-kvm.c b/tools/perf/builtin-kvm.c
index 67fd2b006b0b..a81874b7f2d3 100644
--- a/tools/perf/builtin-kvm.c
+++ b/tools/perf/builtin-kvm.c
@@ -928,7 +928,7 @@ struct vcpu_event_record *per_vcpu_record(struct thread *thread,
 			return NULL;
 		}
 
-		vcpu_record->vcpu_id = evsel__intval(evsel, sample, vcpu_id_str);
+		vcpu_record->vcpu_id = (int)evsel__intval(evsel, sample, vcpu_id_str);
 		thread__set_priv(thread, vcpu_record);
 	}
 
@@ -1337,7 +1337,7 @@ static int perf_kvm__handle_timerfd(struct perf_kvm_stat *kvm)
 	uint64_t c;
 	int rc;
 
-	rc = read(kvm->timerfd, &c, sizeof(uint64_t));
+	rc = (int)read(kvm->timerfd, &c, sizeof(uint64_t));
 	if (rc < 0) {
 		if (errno == EAGAIN)
 			return 0;
@@ -1558,7 +1558,7 @@ static int read_events(struct perf_kvm_stat *kvm)
 	kvm->session = perf_session__new(&file, &kvm->tool);
 	if (IS_ERR(kvm->session)) {
 		pr_err("Initializing perf session failed\n");
-		return PTR_ERR(kvm->session);
+		return (int)PTR_ERR(kvm->session);
 	}
 
 	symbol__init(&kvm->session->header.env);
@@ -1924,7 +1924,7 @@ static int kvm_events_live(struct perf_kvm_stat *kvm,
 	 */
 	kvm->session = perf_session__new(&data, &kvm->tool);
 	if (IS_ERR(kvm->session)) {
-		err = PTR_ERR(kvm->session);
+		err = (int)PTR_ERR(kvm->session);
 		goto out;
 	}
 	kvm->session->evlist = kvm->evlist;
-- 
2.49.0.906.g1f30a19c02-goog


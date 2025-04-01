Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A671722687A
	for <llvm@lists.linux.dev>; Tue,  1 Apr 2025 18:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743531962; cv=none; b=bNfUokad/p1ygKqN02bXSHpWgqvsBPG+QfZstY5mlyrPm6NpeMrv62UE7UYPVmvYTwpJUEwbSFJMJlRAg9NQZBUgU0xQNNw0cxFn9vHwrmzrtJh2/Ydf60zM1OblafMZXN+n0TVK4gmZc+LlQVmVjZVhsKuYk9Tm6BIVfKTLg9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743531962; c=relaxed/simple;
	bh=ISIPur5EdG5VT16W+y596XtyvQru1DN+JSFfJcpaQKc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=Hy3EknpKvnyPXRbhRy2hkWYJlsLyMmsG2wryEkiDGF93VM8F6NNJWfCq92a4FQzf1cnmq5d62/wyKV0gmrJuq3pfUd9g825piZcNy1FZdXiSICXskt58EFnf4d2qTQTlMcARxtsDBTyoOO54nDJFuqDCbZakF1fRnYPDXFNv6Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PedzH1ta; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PedzH1ta"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-225429696a9so170487965ad.1
        for <llvm@lists.linux.dev>; Tue, 01 Apr 2025 11:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743531960; x=1744136760; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o8D2NdkIniQBtVAV1aGO9PS+E4EWZci4xwBtgznKQxc=;
        b=PedzH1taFqWmh7BlYpZz8Mp1byM1Dc6HfcKhcCS6bjHijoV8wV78H8tFtJ4o4jYZPs
         IJ39yV63vEnDlwtjHTEkEXP6TYiTfDVF2VTfyIbMhD6gGY+Qt/gA2hiTcD1PUO2ZZSCI
         e+SSOl81E4pWNIm7ZC9zr5PN7LcddhUxe7m2rfvHuOSAR/L3mt1AP84YPPJDS8uISxxo
         pg50zB+sb5GPciGlufvATAmPr1qwgZYihS0r3MNW11CthW8nmiqlG8TPeGtGTTp9DXhG
         b2RuP9gmj/KEGjPS17CQGb5dLSskeFmqFSw/tod4IOft1SCqeIvPQbrUkfe5F+O4tMcH
         fzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743531960; x=1744136760;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8D2NdkIniQBtVAV1aGO9PS+E4EWZci4xwBtgznKQxc=;
        b=qOSDwYPWMLAUzHQyn7bLntLT8ec1HtcgDmgllakJSQ3JLpG0XW1DYmETdTojgXeiHN
         j/CkSIAZmfIcWWpeDn0SUo0Z71dRNqz+CEgpay/buPE3gwIufGlXpRXqdIoHmgun5qiJ
         ZP9N7M45ewMmsfPEZESozX/8bWEowd36MAO+qFmoeZIw1j6Kh2jRyHiWCE+4HgyH97/k
         gw7zDd3LoKoJTr5x6DgHRVsCQQ641EEZUZgDCmCTceik7Mbg2UQgfk3cYfWP6aJA0x1s
         eCnafvnb/KOZmqxB9ygPtjerPBxwGVfpG/XlSezmISZUaShbxwNZOkoSe4asA3ktvc4a
         YfbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpfCJF9ccfFkrs0b8VKy2Jg8La6muW9sAnX36jpJWGFnil9Z7OyWs14fnQ1gAbdwAQxTye@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5yCzNX3giA4G1Va8Tvmu6PPgjFylLGb94ZzKayRLLaM6r3bvn
	B2lin5poK0DHKU+3xWpk2AzadihBQJlgGzUUcrSp7cd6xdUBgnMLvyP1pA89UIoK2cf38JIW9WF
	Wa16EkA==
X-Google-Smtp-Source: AGHT+IHOfHQYMPSlb929fAQLYUOR8MaSQ47qaoqjl5CBh3biX9RHBcWbfOEBlIWhvTFZDEluJlrFNHckgCuo
X-Received: from plrb1.prod.google.com ([2002:a17:902:a9c1:b0:220:c59b:c80d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e541:b0:221:7b4a:475a
 with SMTP id d9443c01a7336-2292fa0af62mr156962715ad.52.1743531959784; Tue, 01
 Apr 2025 11:25:59 -0700 (PDT)
Date: Tue,  1 Apr 2025 11:23:39 -0700
In-Reply-To: <20250401182347.3422199-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401182347.3422199-42-irogers@google.com>
Subject: [PATCH v1 41/48] perf kvm: Silence -Wshorten-64-to-32 warnings
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
2.49.0.504.g3bcea36a83-goog


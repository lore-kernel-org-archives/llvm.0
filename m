Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5F627F742
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035492; cv=none; b=ClQ6O5eLldiq0xVibsjsI8c7wYWvH3EcThCbsQfD7iHkEZaKmG3XpGVkskeydevYUw7BlY5sWhIFZiH7bPIcIJ2oAqziwbhz7DbRYHuz026vej0Hg0Sq63eJsXwXxE2f4TfmJ0gD37QQajXER/9fRKQ+S0m0cE9m2Gy8egX2tU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035492; c=relaxed/simple;
	bh=ylzDCz7ABNgz73jC33kqWkLxtIyjwa4WXPEBCQ9IPSs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mIyfRzEVfa2iE71wS5mR+jjqPaKfsHsAGwxeftyEfkItMmk57hXugSyfo2GGA85KNsrn47VwXzST7LoQAwtxW8/rS55mRfEALwEHTfFuKr1Y5gBFgJHJm3JNKn8Y8IMm1njLrE2+QlHTUThRjR0+pOBL70lCrD0KUOk5Cj3VjDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=upZVGW2g; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="upZVGW2g"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2242ce15cc3so1073195ad.1
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035490; x=1746640290; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PKvodGdphwgw3/59PaEVxt3ZIF+tbA/HSL0dM2VGnxA=;
        b=upZVGW2gqAPEPcRDb7LE4goYZUdgJU4TTxQorX9LBhK/KyPRYzhIy7f9s+qjYGIJtX
         RK1fYJrSbRBnQGujqJRh6nXoC4hoEfp+PqSwGNYndEm40/ijjMONsOYBylFA13AQAIss
         TyXcbpDZMy3V8mN1NFBQQScWJpesEkmpvdrqkpYnEhIkZrAF2z74CsM0xkb3PG2Kjfxo
         Fwt0usTvF7I3431+lkKr+dMy1bOrKp5tmWq8V5BvJlnUtv0StSmsA7vLlBaEUVmzWF/B
         SZKnHUQZMqxX8MU6bv/7ZzTsbv+zFmYDdjb1U0BU+wKBETAkR24Nrug58hTrtXEAhTdv
         4U/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035490; x=1746640290;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PKvodGdphwgw3/59PaEVxt3ZIF+tbA/HSL0dM2VGnxA=;
        b=d2MsKMLE1N9ZirjA9OX5ZjsiW1v0xSLthuXJZZfpxN3QwLpknl4cBp4JA9MeqDbYUR
         kwYYdPDLvoxg8hwNa301q8EmC50cOSJya6hAUKnRMVSIFe5577wTewq2PH8/fIw8iPP6
         y2C78ypllS3r1DDS7XBbVsr8Atcrki8fDDPqJiswbRvZaAT0ErqD5pOPkX4re4g29pDl
         xoO46hndpu3+NVrtvQQ88Ps5jH6p80P3s5oHq6X0j+6KaOBYQX2OkMHm7INiktuPCJJV
         5LcYlFWQY/rcpX9Ty9tf/MjVUJLpEMQ+XQeCMptDoSo0xCH2i5YsmK6jsVbM9ehtfBkw
         NgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlSPKvxjljUYwsSTEEHE8MCW80cdBOBjWULYsolfAzKeoAKV77+1FQsqdBTK6thzVFXeQU@lists.linux.dev
X-Gm-Message-State: AOJu0Yyx7VnO7J2emmB3cyj9S5bd64jloJnk8uzl61T7e5nrtsMgzKud
	X9+wkxTFkbyJVL+nBa77pgkHLRCJbhzpnWte1rJHYY+VeffE7iEaQTd3Vyu9eKFFbtJqLqhWNhr
	flc48pA==
X-Google-Smtp-Source: AGHT+IG3HFqCqUHV2O/fvwRA05Ia4nOSW+cf2ULUFRm7S3WdX6PSZJ9m9PEqLWVOShsiSpMoyTeVc4TfDMSC
X-Received: from pgbee3.prod.google.com ([2002:a05:6a02:4583:b0:b16:4869:6621])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f685:b0:223:f9a4:3f9c
 with SMTP id d9443c01a7336-22df34a60dbmr58244925ad.9.1746035489482; Wed, 30
 Apr 2025 10:51:29 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:50:04 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-17-irogers@google.com>
Subject: [PATCH v2 16/47] perf annotate powerpc: Silence -Wshorten-64-to-32 warnings
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
 tools/perf/arch/powerpc/annotate/instructions.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/arch/powerpc/annotate/instructions.c b/tools/perf/arch/powerpc/annotate/instructions.c
index ca567cfdcbdb..598dc10a1751 100644
--- a/tools/perf/arch/powerpc/annotate/instructions.c
+++ b/tools/perf/arch/powerpc/annotate/instructions.c
@@ -18,7 +18,7 @@ static struct ins_ops *powerpc__associate_instruction_ops(struct arch *arch, con
 
 	ops = &jump_ops;
 
-	i = strlen(name) - 1;
+	i = (int)strlen(name) - 1;
 	if (i < 0)
 		return NULL;
 
-- 
2.49.0.906.g1f30a19c02-goog


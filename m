Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3670829375A
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035517; cv=none; b=Cs64vFV30fvY+/XfVlHBqWoN9JHTDW88ZHNcXeyfiM3eiTgvkrdlWhCPyCUTsxHzS9EgX9qpOEHpDxtWVSbS9fkMl33WwqivcwhH1sIpFEEGWPgnv84q01zh2a6dyMG9GsnwGHaZbtOwMH2MbPoQtV7qEEwpLcMeSqtt6ABXZqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035517; c=relaxed/simple;
	bh=cft+CD1tTAR3nCyTEcBy0NRmOeO+kq0ax2JOpFaz2Gk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R/YilWXyq30/VbZ9r4t7Kj3FP/sbVBK14kGPcIiivdeD6i/M0utv7dyz0BJISrJ4dJ7NNUc40AHf51M4g8ljLmuN0zbok8f4jS1P0ujr5MLzc0jqNecqc2A9JrcdLfe3xbcW7K8hBvn+7sibtnJCyRmlPkM/JJCZEnbi3/h8jyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ao9l8LlI; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ao9l8LlI"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b1415cba951so44923a12.2
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035514; x=1746640314; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FPxygk1eCWlSDDmALd71PUuLxxkGD6gPcWD34OB2qtw=;
        b=ao9l8LlINvUMCpkyxSte7Dflsc37kZb9pKsqqpNbgdac8DqznzZNOMDRQR027oVDAx
         FMXRSI/FUePp2rkOU1UUv9E3xWs5ef5MLFAWXakXOBYTbe1vrthm+sOTzn5I4YeCe1yA
         pPoGPawIkUc4VF1CA+KrJR+vk2bPkbdoFebXUZeKD8U0r3+9RT2pcb/mTWZSnVQRhyBB
         FOAidMCwiKMvpPZybbqb2qYK1UEL1yVMsv3hGuVg3BEk9bxTdqasbMuDbjkZySVdcjU6
         6moycckQIRRjgWUsEFoqHO3zCJJEflr+O8uFDxZEJ8zS3+QtvK3yMB2Ak4O0SsgOnZJC
         A3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035514; x=1746640314;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPxygk1eCWlSDDmALd71PUuLxxkGD6gPcWD34OB2qtw=;
        b=s24bxSrzkbyoaOgh1fdfuE17akoIohAgi9nmyZ5iuGs+PWttHasGzPyov8UyLZB3Wu
         gUXZ6dOn583uylodPcUvebnVkcqzTGDgq2aaYjcSRiZxxwIpkXt3FZ160JDPd9XOsoAq
         kGaCshQth4VWhTl+KkN0xJfQpFQ4RO5F7mCPIVHmS21jBfm3P9GBd8thfbh2+TpUN54g
         B3ZF6lQMLf+zr7pKaM9D+wjPf5DT4b8pzbNR2iAt4nCT9Q5WEfGsvSoShj4EEaEf2zZa
         WVEizhzy4Hgg3ZO91/tTfZrTFaywvPg5LokZ2YUG9CY2knunl40SNNpEqg+Xa9JNfzkh
         xMzg==
X-Forwarded-Encrypted: i=1; AJvYcCWkcRgjjNEQfYKcpOnivRvWLe/6ihpAWfHy+fcUpdfw24In8U1YI8hMxDkUa4wryiK4P2Oo@lists.linux.dev
X-Gm-Message-State: AOJu0YxGrYY6ctXdFMRY4xSshYTLRbHHWcvWeZZtZxTW+SiVhRyXRRm5
	//pQVwTZPtA6TxGI9WHq6Wr2ztlE28zQ34M14KAWpO0exXT+NDRfxnyupKVe463mSapOgxLPh3I
	5jRaZQQ==
X-Google-Smtp-Source: AGHT+IGTE8aXwL7iH53hhEp548KgSppsS7AxEylvEKg8WPTsd2Igbq/S3Ml+IJCwmcbPtCPMYly3PIIzmj5C
X-Received: from pgcv17.prod.google.com ([2002:a05:6a02:5311:b0:af0:e359:c50a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3943:b0:1f5:5aac:f345
 with SMTP id adf61e73a8af0-20a898108f6mr6683990637.36.1746035513728; Wed, 30
 Apr 2025 10:51:53 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:50:16 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-29-irogers@google.com>
Subject: [PATCH v2 28/47] perf buildid: Silence -Wshorten-64-to-32 warnings
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
 tools/perf/builtin-buildid-cache.c | 2 +-
 tools/perf/builtin-buildid-list.c  | 2 +-
 tools/perf/util/build-id.c         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/builtin-buildid-cache.c b/tools/perf/builtin-buildid-cache.c
index b0511d16aeb6..7f7ebd625ed6 100644
--- a/tools/perf/builtin-buildid-cache.c
+++ b/tools/perf/builtin-buildid-cache.c
@@ -450,7 +450,7 @@ int cmd_buildid_cache(int argc, const char **argv)
 
 		session = perf_session__new(&data, NULL);
 		if (IS_ERR(session))
-			return PTR_ERR(session);
+			return (int)PTR_ERR(session);
 	}
 
 	if (symbol__init(session ? &session->header.env : NULL) < 0)
diff --git a/tools/perf/builtin-buildid-list.c b/tools/perf/builtin-buildid-list.c
index 52dfacaff8e3..ef84d1adb98f 100644
--- a/tools/perf/builtin-buildid-list.c
+++ b/tools/perf/builtin-buildid-list.c
@@ -109,7 +109,7 @@ static int perf_session__list_build_ids(bool force, bool with_hits)
 
 	session = perf_session__new(&data, &build_id__mark_dso_hit_ops);
 	if (IS_ERR(session))
-		return PTR_ERR(session);
+		return (int)PTR_ERR(session);
 
 	/*
 	 * We take all buildids when the file contains AUX area tracing data
diff --git a/tools/perf/util/build-id.c b/tools/perf/util/build-id.c
index e763e8d99a43..6a3ae17b1ccf 100644
--- a/tools/perf/util/build-id.c
+++ b/tools/perf/util/build-id.c
@@ -81,7 +81,7 @@ int build_id__sprintf(const struct build_id *build_id, char *bf)
 		bid += 2;
 	}
 
-	return (bid - bf) + 1;
+	return (int)(bid - bf) + 1;
 }
 
 int sysfs__sprintf_build_id(const char *root_dir, char *sbuild_id)
-- 
2.49.0.906.g1f30a19c02-goog


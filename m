Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04267299532
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035546; cv=none; b=hc/pWlmejHPdhRMs97htGvaKAstSzyfx+olguK8IciNbYm4ck+D4NP2Mh1vFOANgbp0gveoN74n/H1tMwRRjEsJju08JiqOEaVm6T+b5yct9p69PXS9kcvXlEA/MKpyt1vS2jf088jOpJpWOedh9WEtasHeZO2UfYjx6tfDKWfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035546; c=relaxed/simple;
	bh=SChJhTbUNPg1ND5dFZYx1lf5bG8QjJRd5Qz/8x8RQGk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZZWfGLsazbIUic4N6ck1T9PG6fy7+yppS/XxHB3vNATPEHNmT+j7JdmGFIOFYZmXCBEYaRVFntBfB/e22zz947WU0TV+H2d3s0C85Ga0GfyYilpBVUUsA+dqsfaFVy24OJ/6zZB88qCkeiYJsDJlEBv6mIZ/pHI+KgYbS+k6Qkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T3/3f9e5; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T3/3f9e5"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-309c6e43a9aso224972a91.2
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035544; x=1746640344; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PttgRlYacSl4neWRZmL9Egf25cjRBgUThY4Fgt+xSRQ=;
        b=T3/3f9e5DAI3ETET+wNL8uJOG2NeNiq2uIuQ8xNtiXIvyFzO5QRvkzmUrgsB/M4mUE
         3F9P04i/RjpP5SmDU4/3FUmsPX+wYJelCShXmcnzc32VC6W3DH2ij9tQP2rHNEPlMEEk
         /7M00LGNr/PTyVieZpTlripw8r/dtQtHbNnbSRepO36d2jDygq8q2voLSdQTzUiMSgC6
         HW/O+1h0pY1w/spMYhFBKHtmtpDXAIMv+weiGqxhC/D51h819Lhx8GahPq8n+i0cQABG
         XGmg4X3fkkZP2Pfik7viZ6wsyZB5EbSZe9LhcyWxlN9Xg5iFumK2ypW8zmbC7uT+3AtP
         5n1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035544; x=1746640344;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PttgRlYacSl4neWRZmL9Egf25cjRBgUThY4Fgt+xSRQ=;
        b=MBiNauTIsl+19L1C1xY7JX1qj2QFFYi05p5r9tRpuXsWCnCwXl0NVhXUcgzruxXheg
         V34Xi7wuNnaKxw7gXm/ktbTB0YpdHCTlJmd3/inAGtQDFgPihFLUX5tZvBp6MTtMCjHu
         TWY1EZnxqIqaKfjwxu/HGvdubu0jgDgRHyWnz7SNAB/tIiMiZXU3GbozCZUHeSgdXHKa
         DcEUBbZ3H7bU0ZkyK7xpFI5kvBX0JoPB1Pbr/M94ZSr9Qop03E0u2U4hIDj5DJQBuPXC
         u9I3rYUfbZ01BG3FTsOpqXRwpoX7cYhjVc3gcG6QWVCPQYuEMpCZI5I1JzXNpsYyMsdy
         Yfdg==
X-Forwarded-Encrypted: i=1; AJvYcCUh1RG3yPIifJ3yidwmpoFNq6x1l0rV4aRf84MXrUqt7dFYleP90VaJi7EsRNrolYJU194W@lists.linux.dev
X-Gm-Message-State: AOJu0YxKXE2s3x2wjHOk6oOTX9lEZfseg5eW9p63wg0eK9uIKE8UJN/u
	Jh7nFZeRTtIjuPt+voGuY3uncV34eIeG6IWwO4XwvfvqSixJiRLS16AzR79SChbx/FKmke5sXoN
	HU/dbqg==
X-Google-Smtp-Source: AGHT+IH609WX54b/JbVgl93PVIkC18sTffKfTUp//AJVPoOBnLr2z7CYeICMxOSMi9XQ3JkGUed341rCFivT
X-Received: from pjm4.prod.google.com ([2002:a17:90b:2fc4:b0:305:2d68:2be6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4984:b0:2ff:58b8:5c46
 with SMTP id 98e67ed59e1d1-30a344025abmr5485273a91.8.1746035543977; Wed, 30
 Apr 2025 10:52:23 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:50:31 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-44-irogers@google.com>
Subject: [PATCH v2 43/47] perf zlib: Silence -Wshorten-64-to-32 warnings
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
 tools/perf/util/zlib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/zlib.c b/tools/perf/util/zlib.c
index 78d2297c1b67..d30597701fd1 100644
--- a/tools/perf/util/zlib.c
+++ b/tools/perf/util/zlib.c
@@ -44,7 +44,7 @@ int gzip_decompress_to_file(const char *input, int output_fd)
 		goto out_unmap;
 
 	zs.next_in = ptr;
-	zs.avail_in = stbuf.st_size;
+	zs.avail_in = (uInt)stbuf.st_size;
 
 	do {
 		zs.next_out = buf;
-- 
2.49.0.906.g1f30a19c02-goog


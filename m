Received: from mail-oo1-f74.google.com (mail-oo1-f74.google.com [209.85.161.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D23374CE
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 18:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SqOwrnVs"
Received: by mail-oo1-f74.google.com with SMTP id 006d021491bc7-57be2b0e95cso6575070eaf.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 11:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696876797; x=1697481597; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=49ZawQt+7SlBsoWKownV7zVOA634acLMIh7oRlSswNg=;
        b=SqOwrnVsWAoj+iuOSFXy/Zd2OQYtDTxCJEd7nz1LsnPnM5LMqeLn96i7RePcv7V4Ir
         k1yEu6BEMVzN/evjD8mbylxUoPDwFlQiRBdqgKdMb5UD7u1Rk8tmFp3M7l38R/Es63v8
         G5iZEK1MZIg64j1KHfH7XzDDAHEKDCkNHsbFDzFoAUFCXCvhkvS8d9EI77+xmf81e8eB
         5MGgphl3lZOupOS+m7Bl+HBMi9R/9G3q39k3RmRDdyobmX1NPUEKbrxQWY0GS0xRyBfV
         v7C+c+HnjBbPRLJlur8Y2GRyv+NIqLnWCH/eZesvhldirde+i5lWs1YCSoeDjLpVYGr+
         zL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876797; x=1697481597;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=49ZawQt+7SlBsoWKownV7zVOA634acLMIh7oRlSswNg=;
        b=N8owIugujMKSIcwrtvpu4sQienaZae4hjPY+2l6Q6zAjExWGA+aLevl0t4cBdZtrV+
         /pgh4U6g3eD1tKyNNiAFmPN4FNOi8mGsyaRytI+Z5Y4L4fiSe3zLFo1F/4Zz+mOMAoNL
         SSCmPqeY02S1yvOcbUl9JaOSNNla0nHpuvDvFFKy4i6pT2KnzwobM2sUvNvx6mRLY0Zr
         znzK8/ZnSJsSaDCoZJ0xomw9YsE2vOAOssw1s426qAL3Reoqqiy2hQADC2bU0YMONEbV
         tJJ2I1N3u67oOkyPaNDC6k0MBpZ7pkPNkjg22fBH2/QbQlTE4tQI+To3l4GSs6rwudVm
         KvxA==
X-Gm-Message-State: AOJu0Yx/LXfDW5b97GDBydq7zuKbIq2rus0QtYkCEd3xgYnAEmvSRWyT
	jkrD/hb6ZgX5os+WXkzs9f0OBWrqESQu
X-Google-Smtp-Source: AGHT+IEQO/YSLvuW5lkkNTKqekhHTTuwM6kivSrFg1QMVwNQ4jbE84siI8dfYQbP2HOz0jg1yFaPHkpxB9tv
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:ac4a:9b94:7158:3f4e])
 (user=irogers job=sendgmr) by 2002:a05:6820:100d:b0:57f:10cb:516b with SMTP
 id v13-20020a056820100d00b0057f10cb516bmr3087810oor.0.1696876797162; Mon, 09
 Oct 2023 11:39:57 -0700 (PDT)
Date: Mon,  9 Oct 2023 11:39:14 -0700
In-Reply-To: <20231009183920.200859-1-irogers@google.com>
Message-Id: <20231009183920.200859-14-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231009183920.200859-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v3 12/18] perf svghelper: Avoid memory leak
From: Ian Rogers <irogers@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Ming Wang <wangming01@loongson.cn>, 
	Kan Liang <kan.liang@linux.intel.com>, Ravi Bangoria <ravi.bangoria@amd.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On success path the sib_core and sib_thr values weren't being
freed. Detected by clang-tidy.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/svghelper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/svghelper.c b/tools/perf/util/svghelper.c
index 0e4dc31c6c9c..1892e9b6aa7f 100644
--- a/tools/perf/util/svghelper.c
+++ b/tools/perf/util/svghelper.c
@@ -754,6 +754,7 @@ int svg_build_topology_map(struct perf_env *env)
 	int i, nr_cpus;
 	struct topology t;
 	char *sib_core, *sib_thr;
+	int ret = -1;
 
 	nr_cpus = min(env->nr_cpus_online, MAX_NR_CPUS);
 
@@ -799,11 +800,11 @@ int svg_build_topology_map(struct perf_env *env)
 
 	scan_core_topology(topology_map, &t, nr_cpus);
 
-	return 0;
+	ret = 0;
 
 exit:
 	zfree(&t.sib_core);
 	zfree(&t.sib_thr);
 
-	return -1;
+	return ret;
 }
-- 
2.42.0.609.gbb76f46606-goog


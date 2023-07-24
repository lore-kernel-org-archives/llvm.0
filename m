Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B2F101D5
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 20:12:59 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d0d27cd9db9so3033606276.0
        for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 13:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690229578; x=1690834378;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpe672BMcYgw1/Tq0sSVEvWbR/AI8Dk2IlobtDn5kyw=;
        b=2M2G+MvDUvaC4v3ryP+ApSPqOaSP4AH5XVMKamZ8urbsjFkVLNInRrp2LTZ/GqUZim
         qN+Jv3Tt2AdT+frefTxmqnDGCW+wiZlucBQpvp7lKsJF/MEHEZSgNYS8ZzT80rswNt2f
         ZUdMU4hEFhqNlBCBWiq69krhqG2Ke7uhcA9GQxgcQyk8GWmhFMbhhyfK4ojYwJDtdno+
         GCY20xkBVTXG3/EHvQ4sI2oVmRKUGmCgihTYSmi6ie8nP85rl7+SMKT7+z5QlAyTmh2B
         kXqutf119zg8ph1niL6MYGmn1vDpOeWPobVxKNmAbtAvQ4YHSswk/InZE2XTOtMsuUe2
         2kKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690229578; x=1690834378;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cpe672BMcYgw1/Tq0sSVEvWbR/AI8Dk2IlobtDn5kyw=;
        b=GI88GBYQGkIKLPh3CBXrcId5w6tZsblHxxTKrz3HClqyECUSiIKpq5zQ8HWZYuc+R2
         hMjSJEkFDX+EbttWtQtaTSGo5lR2eIMfrqvo1HZj3+TEi6GTgUu3XFTj/OoCm9yJZ+69
         sKQnaF+oxLEyOT8UMQBp7lLVaUnIfbshs6u1pcou5/WB7rSRStgBlyjF+LsOC7gHTL5d
         cHqfjWK5iINgD0mCpp7AWHo8CE+dXmu79lRctUgYuLMZmn5GH7ALF+0wG9vn7QaMvMP7
         1/WLf0FAA6c6r9iD4sPTf6MkO8tlfnq35WghuQI3RXczb8iXxebWIcampkYigdtj8hBB
         I0Rg==
X-Gm-Message-State: ABy/qLa8tdpfuRaWGoj4EjyQhQYbtnaeWH2Oco7SbAWfPTpkf3NzduLx
	eMZkQl3PtnOxVGLHcIvA/aCqO2t4nzSQ
X-Google-Smtp-Source: APBJJlF+r3JvE4POU8/iw3zmTMqwkKUWM9A4TplQkBMkPp+JYJG+ZBQQK2pKifSkc8U/9qvm8anWelibR1RQ
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:5724:8dc0:46f0:f963])
 (user=irogers job=sendgmr) by 2002:a25:ac1f:0:b0:d04:6d5e:4ded with SMTP id
 w31-20020a25ac1f000000b00d046d5e4dedmr1994ybi.6.1690229578123; Mon, 24 Jul
 2023 13:12:58 -0700 (PDT)
Date: Mon, 24 Jul 2023 13:12:45 -0700
In-Reply-To: <20230724201247.748146-1-irogers@google.com>
Message-Id: <20230724201247.748146-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230724201247.748146-1-irogers@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Subject: [PATCH v1 2/4] perf parse-events: Avoid use uninitialized warning
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Carsten Haitzler <carsten.haitzler@arm.com>, 
	Zhengjun Xing <zhengjun.xing@linux.intel.com>, James Clark <james.clark@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: maskray@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

With GCC LTO a potential use uninitialized is spotted:
```
In function =E2=80=98parse_events_config_bpf=E2=80=99,
    inlined from =E2=80=98parse_events_load_bpf=E2=80=99 at util/parse-even=
ts.c:874:8:
util/parse-events.c:792:37: error: =E2=80=98error_pos=E2=80=99 may be used =
uninitialized [-Werror=3Dmaybe-uninitialized]
  792 |                                 idx =3D term->err_term + error_pos;
      |                                     ^
util/parse-events.c: In function =E2=80=98parse_events_load_bpf=E2=80=99:
util/parse-events.c:765:13: note: =E2=80=98error_pos=E2=80=99 was declared =
here
  765 |         int error_pos;
      |             ^
```
So initialize at declaration.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.=
c
index acde097e327c..da29061ecf49 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -762,7 +762,7 @@ parse_events_config_bpf(struct parse_events_state *pars=
e_state,
 			struct list_head *head_config)
 {
 	struct parse_events_term *term;
-	int error_pos;
+	int error_pos =3D 0;
=20
 	if (!head_config || list_empty(head_config))
 		return 0;
--=20
2.41.0.487.g6d72f3e995-goog


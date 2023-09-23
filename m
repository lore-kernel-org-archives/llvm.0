Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B05819
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:35:49 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d81c02bf2beso4388361276.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447348; x=1696052148; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2TUsgHG34tvRYixG1937P5Fi9+1duOaYRJoYEfUpa7o=;
        b=VzcCY5ms94LsILoWwblpFMzfHKu1CMustv5TeALSuOpBjBmZXmwq6ghMSXqdjXPvaA
         E2hKEigOgUXR8nHfL3n9t4O5LpTKJqvp6rQ3pNMTkBeCxLtHIi6i6XX+Z40oRr+9mHAo
         Lyr/X0u4S/9ADMSbwJA6UeoIDyzLhj8aqxg9AyM/FCUp+/7Oubgs5r0vsHOlgobYuhBN
         dSEYtngnJgdl1XHscejDee1aJq8bcU1f1sYftLG4bE9dJsVEF825/Q5x0xvWEcqiRiv5
         JLEjiCmMlXNvcgDntR8vJ+KDx18Dyyn5Zs5lwvlcl6PjGdd4NPoiZafPOE3cf3yeT7j2
         WNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447348; x=1696052148;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2TUsgHG34tvRYixG1937P5Fi9+1duOaYRJoYEfUpa7o=;
        b=dUyXZ5ZFfWvDBiESlJ+iS7mPG7o8AuqvarfApQXu+NseXOJS6Ug7VhWXdo4405gtku
         l0cQSsRoM0ZHLOx+A1ny8nfOjxoc0DaaWcHmFbVkw82bIGHFZu54FzrmdF7Iqbymc/se
         voOxpvGVCNsaTN1iyOpDRqz62JW6VP1MD4SM4jWB2NKzzjghBF/fjQYBmJhNWOQfdFE+
         j5GOL8ZtNgdcMDUA+bWokpVOw/BVTgyPwJOCXQNCdUFCBtLh+pdAE7fF3j++bUo85VI1
         wUj0Xv4Qyo6iAhhvjzkHq6NwNsXUYpd9ZUSsLmw/EVCe+Hxvk9T25lkoPVkzrnsH+aYT
         yvSw==
X-Gm-Message-State: AOJu0YwdZVCsBOexnjvhxKGZrTGTXIfnf6CYSxC89XRcPDB63r6E2JNf
	Yij0np+abOyHaXn0kZn0Bi4mMCm6ydLr
X-Google-Smtp-Source: AGHT+IEp4kbeLYXnxxqvZKp5O2vhys9x017pPzfHBmcwh+n5Yk8hZwya6+TOe1kFu1OjvjZAFx6MM0x3TpT1
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a05:6902:a8c:b0:d80:6110:835e with SMTP id
 cd12-20020a0569020a8c00b00d806110835emr12073ybb.3.1695447348106; Fri, 22 Sep
 2023 22:35:48 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:35:02 -0700
In-Reply-To: <20230923053515.535607-1-irogers@google.com>
Message-Id: <20230923053515.535607-6-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 05/18] perf bench uprobe: Fix potential use of memory after free
From: Ian Rogers <irogers@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Ming Wang <wangming01@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Yanteng Si <siyanteng@loongson.cn>, 
	Yuan Can <yuancan@huawei.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	James Clark <james.clark@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Found by clang-tidy:
```
bench/uprobe.c:98:3: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
                bench_uprobe_bpf__destroy(skel);
```

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/bench/uprobe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/bench/uprobe.c b/tools/perf/bench/uprobe.c
index 914c0817fe8a..5c71fdc419dd 100644
--- a/tools/perf/bench/uprobe.c
+++ b/tools/perf/bench/uprobe.c
@@ -89,6 +89,7 @@ static int bench_uprobe__setup_bpf_skel(enum bench_uprobe bench)
 	return err;
 cleanup:
 	bench_uprobe_bpf__destroy(skel);
+	skel = NULL;
 	return err;
 }
 
-- 
2.42.0.515.g380fc7ccd1-goog


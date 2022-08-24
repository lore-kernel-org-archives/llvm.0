Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7612F7E
	for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 15:40:29 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-33da75a471cso30017887b3.20
        for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 08:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=hI/abfVc/lpVnBGw0/IBypco5YlPGa9tkPSCqJ9uDZQ=;
        b=K4WvIteHQst8sUIrt3X5+g4N8dsRBlJV60qYviWW+eMsHJ+U/ObLuAAap2dexoauAb
         s/UA7XKXWt2EJTsFv88NSfbk5guMt0c5q5JOTx6MfYaYYcf/JzEwWUR2c6H+xVuUl0mi
         LeACmtO26T4rGZeLzGlY9R3O8EtizzsRGrN3nafORfohlOQTfaOhqbujhjdYDOORZzyF
         R0dPZN41uT2mVMwX1fACOC7ci7/hlz95LNTad6coKPZjT+JPrntiM46wRlqqjd4+jJyq
         C+1IuWl04hjzAowCHFH9FYl2KediyaQVj8gybEHlxXAEY763BVn9NSLKYbYOAjzheTEi
         fuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=hI/abfVc/lpVnBGw0/IBypco5YlPGa9tkPSCqJ9uDZQ=;
        b=e8QiPVjdA/DXa0NYl7K+FZGbeGlJZuXu1nLVDeCjyv086J6WBRW953t89ORGYPKSjx
         f07hNhxjd7lj0uqJyAQHZzjcG/23IhqsTXxGwkk2EBWccgMHBK/QmMTT0hkU5RXr8eST
         OrNKRQoo7qN5hbS/yHvRF9+HHPi1YcPL0M0IFanaLHX2/8DhifCEdtQxABF+GucW/zKq
         N5zsNEXYpQhmeVbDK8RAmC9dn+rdp3X+6brzZcqXYGT0zuIa7D2hF2ulyipd0jbFQ4lw
         STy13J66e8NVBN8UawTpSmoHl465b48bFub9fXR7u5GF9445bdwanu4nEHXIPlpDPh2F
         e5Pw==
X-Gm-Message-State: ACgBeo1Qb3OLTL+iM6jxB4N52oYNd3Xj+Tm6DB+rjirxhoMwxgGW+Rct
	gCiWTPwg5P5kFrMbwL5lOm5Nu7F5FTiL
X-Google-Smtp-Source: AA6agR5amzTbKyhRl0hgVmQH85dfCOg717/9dh29bBkhIeffqhKeAJVU23zxWfna7TU9km3Q8eUuILFDgFkW
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:ab82:a348:500d:1fc4])
 (user=irogers job=sendgmr) by 2002:a05:6902:1101:b0:695:ce92:a857 with SMTP
 id o1-20020a056902110100b00695ce92a857mr12311995ybu.337.1661355628312; Wed,
 24 Aug 2022 08:40:28 -0700 (PDT)
Date: Wed, 24 Aug 2022 08:38:53 -0700
In-Reply-To: <20220824153901.488576-1-irogers@google.com>
Message-Id: <20220824153901.488576-11-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220824153901.488576-1-irogers@google.com>
X-Mailer: git-send-email 2.37.2.609.g9ff673ca1a-goog
Subject: [PATCH v3 10/18] perf mmap: Remove unnecessary pthread.h include
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Weiguo Li <liwg06@foxmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Dario Petrillo <dario.pk1@gmail.com>, Hewenliang <hewenliang4@huawei.com>, 
	yaowenbin <yaowenbin1@huawei.com>, Wenyu Liu <liuwenyu7@huawei.com>, 
	Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Dave Marchevsky <davemarchevsky@fb.com>, Leo Yan <leo.yan@linaro.org>, 
	Kim Phillips <kim.phillips@amd.com>, Pavithra Gurushankar <gpavithrasha@gmail.com>, 
	Alexandre Truong <alexandre.truong@arm.com>, Quentin Monnet <quentin@isovalent.com>, 
	William Cohen <wcohen@redhat.com>, Andres Freund <andres@anarazel.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, "=?UTF-8?q?Martin=20Li=C5=A1ka?=" <mliska@suse.cz>, 
	Colin Ian King <colin.king@intel.com>, James Clark <james.clark@arm.com>, 
	Fangrui Song <maskray@google.com>, Stephane Eranian <eranian@google.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Alexey Bayduraev <alexey.v.bayduraev@linux.intel.com>, 
	Riccardo Mancini <rickyman7@gmail.com>, Andi Kleen <ak@linux.intel.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Zechuan Chen <chenzechuan1@huawei.com>, 
	Jason Wang <wangborong@cdjrlc.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Remi Bernon <rbernon@codeweavers.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The comment says it is for cpu_set_t which isn't used in the header.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/mmap.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/perf/util/mmap.h b/tools/perf/util/mmap.h
index cd8b0777473b..cd4ccec7f361 100644
--- a/tools/perf/util/mmap.h
+++ b/tools/perf/util/mmap.h
@@ -9,7 +9,6 @@
 #include <linux/bitops.h>
 #include <perf/cpumap.h>
 #include <stdbool.h>
-#include <pthread.h> // for cpu_set_t
 #ifdef HAVE_AIO_SUPPORT
 #include <aio.h>
 #endif
-- 
2.37.2.609.g9ff673ca1a-goog


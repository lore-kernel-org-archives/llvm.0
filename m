Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80A453B7
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:35:46 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-59f4f2a9ef0so16370487b3.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447346; x=1696052146; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tl2sn727KJMlO6SMtr3A6ZiYWuqB+jcCP05IXOF0Rso=;
        b=esUqxEknBQv9Ej2+SKtBZ1zHp5tYgJlD/W0ejf88U87O3UWPpFA56NdHeciDtp7fQz
         mpJ50VtmOsITD6W99I9Gjl46Tx59QQxvquk//82mvIarGkMfetrd1reRXh/qtFSk7Eec
         TAowPJdjGPRQv6E0wrM6A99KpKAWDkj7ZRIIL84X8W3XOiRLBIqx7WLpAWktjEIRteLn
         hjT6NoA35LGk9GlIy6FIj+VgdrGIpY0mKlmfIxeqlpWbx0zz/lGP/QF+qq5okbDXqf/g
         RPmYEjXwLuo5HN9RDeXzAyXjMKtdFHUmMi89wHQEheQLtKBND/z+iiXLfm8rEAYba3p4
         VpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447346; x=1696052146;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tl2sn727KJMlO6SMtr3A6ZiYWuqB+jcCP05IXOF0Rso=;
        b=U7srsq43fPgseFYlXbQF8yh+c/zsdA/dAzMwxaDTqxEecKzLllSn0K8N7mER6yEZ9c
         9QHe9OYjZ+trfwPgz+cUB94ru44On7e4naTPxUHPgxT17NZ2nvSRjoHBEXNZkeN8Yy4a
         AeFvmE5lKG5ev2yn7RV5waaF1XJmDPdn8txVSgz9IdGr+Vck2YZ2QUArcr0VLyauZaY3
         birdchnhiBWSR+wU94lE0So9CwedYmiuKsjb7n8a9ymTbnKfKVwjSH4Sb1rhg6aRK99/
         BY9xaEoxh5ygWJcBATrMu4SDJf5bLlLt5MqGGSfhpQXLaazUzXo9XxHwgSLEvzP+MSXy
         gBzg==
X-Gm-Message-State: AOJu0YwcL2hcE4iQvakebP0gLbJ6EMSxmIRvjm/ecagFx4WELeKrfG5H
	p4qtHc6dJ+JTEHoR6DEo/htWUOi9re1Y
X-Google-Smtp-Source: AGHT+IEpB4ceFB8hMqXpgUfgfqjdrpt7iWJfuJvUFtKD0Y9n2ndn3h9cRzzXJUloa5oQOGJF/fsXJ+a1H0ub
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a0d:ec52:0:b0:576:af04:3495 with SMTP id
 r18-20020a0dec52000000b00576af043495mr19364ywn.9.1695447345828; Fri, 22 Sep
 2023 22:35:45 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:35:01 -0700
In-Reply-To: <20230923053515.535607-1-irogers@google.com>
Message-Id: <20230923053515.535607-5-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 04/18] perf hisi-ptt: Fix potential memory leak
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

Fix clang-tidy found potential memory leak and unread value:
```
tools/perf/util/hisi-ptt.c:108:3: warning: Value stored to 'data_offset' is never read [clang-analyzer-deadcode.DeadStores]
                data_offset = 0;
                ^             ~
tools/perf/util/hisi-ptt.c:108:3: note: Value stored to 'data_offset' is never read
                data_offset = 0;
                ^             ~
tools/perf/util/hisi-ptt.c:112:12: warning: Potential leak of memory pointed to by 'data' [clang-analyzer-unix.Malloc]
                        return -errno;
                                ^
/usr/include/errno.h:38:18: note: expanded from macro 'errno'
                 ^
tools/perf/util/hisi-ptt.c:100:15: note: Memory is allocated
        void *data = malloc(size);
                     ^~~~~~~~~~~~
tools/perf/util/hisi-ptt.c:104:6: note: Assuming 'data' is non-null
        if (!data)
            ^~~~~
tools/perf/util/hisi-ptt.c:104:2: note: Taking false branch
        if (!data)
        ^
tools/perf/util/hisi-ptt.c:107:6: note: Assuming the condition is false
        if (perf_data__is_pipe(session->data)) {
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tools/perf/util/hisi-ptt.c:107:2: note: Taking false branch
        if (perf_data__is_pipe(session->data)) {
        ^
tools/perf/util/hisi-ptt.c:111:7: note: Assuming the condition is true
                if (data_offset == -1)
                    ^~~~~~~~~~~~~~~~~
tools/perf/util/hisi-ptt.c:111:3: note: Taking true branch
                if (data_offset == -1)
                ^
tools/perf/util/hisi-ptt.c:112:12: note: Potential leak of memory pointed to by 'data'
                        return -errno;
                                ^
/usr/include/errno.h:38:18: note: expanded from macro 'errno'
```

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/hisi-ptt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/hisi-ptt.c b/tools/perf/util/hisi-ptt.c
index 45b614bb73bf..ea297329c526 100644
--- a/tools/perf/util/hisi-ptt.c
+++ b/tools/perf/util/hisi-ptt.c
@@ -98,18 +98,18 @@ static int hisi_ptt_process_auxtrace_event(struct perf_session *session,
 	int fd = perf_data__fd(session->data);
 	int size = event->auxtrace.size;
 	void *data = malloc(size);
-	off_t data_offset;
 	int err;
 
 	if (!data)
 		return -errno;
 
-	if (perf_data__is_pipe(session->data)) {
-		data_offset = 0;
-	} else {
-		data_offset = lseek(fd, 0, SEEK_CUR);
-		if (data_offset == -1)
+	if (!perf_data__is_pipe(session->data)) {
+		off_t data_offset = lseek(fd, 0, SEEK_CUR);
+
+		if (data_offset == -1) {
+			free(data);
 			return -errno;
+		}
 	}
 
 	err = readn(fd, data, size);
-- 
2.42.0.515.g380fc7ccd1-goog


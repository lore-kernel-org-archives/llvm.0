Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4447487
	for <llvm@lists.linux.dev>; Mon,  3 Apr 2023 18:41:18 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-54161af1984so297340337b3.3
        for <llvm@lists.linux.dev>; Mon, 03 Apr 2023 11:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680547277;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8W0bFO1La/7HK/HpWnbmeoTx54QZk6D+Z078ZNMeyCg=;
        b=m6LfHyI56ByW91W423utUqnJXSW4puezbyRvLd6hsvF1zXWMY7ZofDsdmw/fYmx7FE
         sJe5baFpA9RtIsAPV/TuuKyopzHqf8x5UkNGMNP+GpGoiGynVSQnFjaM+qXQySgIvwx+
         PpviiDCXQkgIgjISkk1CcHi80s4Dp3E3eRHHQqKOqoDDJgMb1sSV6jObKGSiFd96xoaz
         efTEqDOKLltwL2YvagCx265klOH3KpeZ04hy6yRfwooPWtXeqEVIBeKYS7iklOuGYFB+
         pE3VKKQoBOJHo7uXBa68D7TOgCN2ChVGEJEngsRm7GT4i0MP++uce4te53qFdGmSdqL+
         GkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680547277;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8W0bFO1La/7HK/HpWnbmeoTx54QZk6D+Z078ZNMeyCg=;
        b=D2Us4j/rgxz7honE4EzR8rqMIkwfHTz1aZyU+4STIAO+43DVyDawrgD3dieqzpTOdR
         U+v+Gi+uoP9K8N3f9nH+SaGtJho3xFWBX/j55P2GFT5t8I5bCS8yD/fnh6LrEULfLNhh
         y06H+vwd5E8+RdEcgTJghWfcIPlZY4TYi2rzuE4ZSOzFsl5ltz1Hnf2xTCJrwM9LtGz3
         e0YMEb+rkv+9IkiYdJZ+TtrJ8gGcfNRiov9tnGwDGZ02LjdbYzri5ibqu8Vg/wRR2byI
         hL3+9vRaQfkxcrb/RhFW6pG6VLEtOyZgIgq5ggf2AfNc/yrd+f9o/9IWxzCMDhETPtRm
         ggxg==
X-Gm-Message-State: AAQBX9coyRQoi2Gl+LzHNeuQiW1iS+2ld3CPnLiq62gjVsiH6vdaQY3A
	JIrdD7bnLxC0D4WuX7ndniorMSFLeUiz
X-Google-Smtp-Source: AKy350YA7iS2fx3kOTsfSZF1PwKeWeZXwx2DADzFWTKQU5tx6UHKq2lzlgfua94c/o+4RdLMBwIC0QQq9qCc
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:9dc:a977:817d:341])
 (user=irogers job=sendgmr) by 2002:a25:d9c7:0:b0:b46:4a5e:365f with SMTP id
 q190-20020a25d9c7000000b00b464a5e365fmr131859ybg.8.1680547277315; Mon, 03 Apr
 2023 11:41:17 -0700 (PDT)
Date: Mon,  3 Apr 2023 11:40:33 -0700
In-Reply-To: <20230403184033.1836023-1-irogers@google.com>
Message-Id: <20230403184033.1836023-5-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230403184033.1836023-1-irogers@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Subject: [PATCH v2 4/4] perf srcline: Avoid addr2line SIGPIPEs
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ignore SIGPIPEs when addr2line is configured.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/srcline.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
index f4fcdada821b..cfca03abd6f8 100644
--- a/tools/perf/util/srcline.c
+++ b/tools/perf/util/srcline.c
@@ -473,6 +473,8 @@ static enum a2l_style addr2line_configure(struct child_process *a2l)
 				ch = io__get_char(&io);
 			} while (ch > 0 && ch != '\n');
 		}
+		/* Ignore SIGPIPE in the event addr2line exits. */
+		signal(SIGPIPE, SIG_IGN);
 	}
 	return style;
 }
-- 
2.40.0.348.gf938b09366-goog


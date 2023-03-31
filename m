Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15A910E7
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 00:49:39 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id w5-20020a253005000000b00aedd4305ff2so20602187ybw.13
        for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 17:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680223779;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZjS2ubyipVi2ZMDZ77od8b4DQTs3LsPG+UyJYia9quE=;
        b=Z3sRXpowh/3nWuTnA9ABQqlwKz9e/xaBcX8rB1G+JuHoqvIkDMhppRkNVRu2bUEHZD
         DcC346N6icjGxjlxtlLeXPBaAoXHoIDXDh/8n1hZk1rYidPWX5OaeuTCkDt50Bv0q+Lu
         80Xjxt8eqOOsrqHIuSE0bNDLJRDkZXu6yTVVZ62h9kqTeGsLVb9Yo0Ov9CtNO8orwV9A
         0LmbNG+Wz6nzzMPQ19TvVwytQedxgKy0Nm7IRaiblHe2QebEnrZhCIxN1WOuvKyBciAi
         d/wPJXHFQHM9MVHHwCPIjIIKK7gCJj02pIeZBIQipfsYZR+VBL4ws1tnoHf+kPTyKWXD
         gnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680223779;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjS2ubyipVi2ZMDZ77od8b4DQTs3LsPG+UyJYia9quE=;
        b=oAWJfYHQB4ILkuP0iK0A+2cbPv4S+FW81xxSabLpPONvVzCyUb/BL1KTMhRJj/uwFg
         +wR9gpKk/TXuqs5USLEmdthF9XhkjGk9b2lzaXiq6n0kq7W5401JnA9rwbuJL5v560KR
         M0SKui/WLwVzGWhuuIEQzpvhj+Efburyj+UpqhOECxeaGvjzgPzjMfk9jCRY4RULjtjP
         KugitW9QKoqm7BMfVm3r2KnXi/WSFsEvZGvRCDs3g2Ws3j/KfCxeRvmCw9iRDCzUEFE1
         JtDbbKGfJ4+fCIzk/gqSKd6jF5WVAiTVYigLQQ8U5/1gTvBRbx9R54nbRGkwlf7LYVa8
         lqaw==
X-Gm-Message-State: AAQBX9cFRT2RwOs8RrZtUQnCszt6Lqk5r5rEZ91zaIvfg7E/Zehdn/Nq
	N5dv7epUvfCs1GSSWMO3jRXDHnwFe4dI
X-Google-Smtp-Source: AKy350a3m5BHFnMmj6UwcvTHHQb2LbUjX3nn1IHOfBofEyRM+5fd1eyYoe8wYYAs+1wdFn70nEN5YmCfcHDW
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:11ea:eb75:e48c:2c04])
 (user=irogers job=sendgmr) by 2002:a81:ac64:0:b0:545:6106:5334 with SMTP id
 z36-20020a81ac64000000b0054561065334mr12667656ywj.8.1680223779432; Thu, 30
 Mar 2023 17:49:39 -0700 (PDT)
Date: Thu, 30 Mar 2023 17:48:44 -0700
In-Reply-To: <20230331004844.1592789-1-irogers@google.com>
Message-Id: <20230331004844.1592789-5-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230331004844.1592789-1-irogers@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Subject: [PATCH v1 4/4] perf srcline: Avoid addr2line SIGPIPEs
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
index 423ddf3967b0..bc3e48afe054 100644
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


Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1FF7F
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 09:45:55 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id z2-20020a056402274200b004516734e755so3224390edd.3
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 02:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=uClVApymgkgK7fH66RPqLcCXsTpVvQDUaMyIyH9j81w=;
        b=mzaREv75OO9jeMTftu6qMrDvjWyoS7dmtczfI+DtBQstSDLGDMqZPaz7hb7dEGfdFa
         L5zrXlF3i7wXLMmc/QK6Cq1gQoQ9a8oRiW7/dJRFif9hjgAosjALtzl9zYJM/kgXcUiv
         BWoNUYm3av4TubtS3UGkngxlAUZMPWF08ez0R6WK4aVQK1mDMUs6iN3FjuBDChWgaNGZ
         M3tMcHSBdu3mzZG410pdINdYJt47pp8gj0t931+z+Ks59iJxlg22luFuhDE6QyxAau1S
         4cCXlV1yaGQUnjHo4h9/zLpYnBs2LRgoFzpg7EJ638CRr5+zBKFWhWu/kUaeeIeZOdq+
         jVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=uClVApymgkgK7fH66RPqLcCXsTpVvQDUaMyIyH9j81w=;
        b=CZO88nMZJnsl4zh1gc+atq3/9lCypFJUtKD/jD76L0h6T18+xOLX0GWLN+0+O18M+a
         JG5WWP7v3SHGA4KeX0B57JrQeXBTCKMWpSNDs4A9lwGBObdC/x8xldlUr2OdhnYYJIq0
         wsugdWgVu9DzcZKikfCI1Bsei3874HYiskXXlDcnqnvSeqGPBD/hMy0vHWUPNloQYpSy
         Jhu/NQJbP0TK8N6BJO2KF6jJj/d8t4AkgUgveqT1NzKbl4tGrvEjCk/7+pVW45MJbdjW
         Bxg9Xs5jJTt5fi7MpuGZ0VGaALP1ZeNoSw5y7/uQWguH06+HiCYFsQvuYWOAu5pVff50
         RtuQ==
X-Gm-Message-State: ACgBeo3KBVxvvS9o3IubA8y9vuUk4qg6QrN0+NUKwcSuoD2/ZkRM5tSH
	QJuqDg6I4mj+JKgVqyBIj09ldUrgCA==
X-Google-Smtp-Source: AA6agR7cvD8C/Dhvo0E3GiFQpr7GnkJ1DN4GnoER7SNLYE1VvkIUscG0N07VxTdgE9lGYtSmBjs0Lg5IVA==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:f693:9fff:fef4:2449])
 (user=elver job=sendgmr) by 2002:a05:6402:4011:b0:44e:b8b5:f52e with SMTP id
 d17-20020a056402401100b0044eb8b5f52emr21439836eda.352.1662975953684; Mon, 12
 Sep 2022 02:45:53 -0700 (PDT)
Date: Mon, 12 Sep 2022 11:45:41 +0200
In-Reply-To: <20220912094541.929856-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220912094541.929856-1-elver@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912094541.929856-2-elver@google.com>
Subject: [PATCH v3 2/2] objtool, kcsan: Add volatile read/write
 instrumentation to whitelist
From: Marco Elver <elver@google.com>
To: elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Adds KCSAN's volatile instrumentation to objtool's uaccess whitelist.

Recent kernel change have shown that this was missing from the uaccess
whitelist (since the first upstreamed version of KCSAN):

  mm/gup.o: warning: objtool: fault_in_readable+0x101: call to __tsan_volatile_write1() with UACCESS enabled

Fixes: 75d75b7a4d54 ("kcsan: Support distinguishing volatile accesses")
Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
---
v2:
* Fix commit message.
---
 tools/objtool/check.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index e55fdf952a3a..67afdce3421f 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -999,6 +999,16 @@ static const char *uaccess_safe_builtin[] = {
 	"__tsan_read_write4",
 	"__tsan_read_write8",
 	"__tsan_read_write16",
+	"__tsan_volatile_read1",
+	"__tsan_volatile_read2",
+	"__tsan_volatile_read4",
+	"__tsan_volatile_read8",
+	"__tsan_volatile_read16",
+	"__tsan_volatile_write1",
+	"__tsan_volatile_write2",
+	"__tsan_volatile_write4",
+	"__tsan_volatile_write8",
+	"__tsan_volatile_write16",
 	"__tsan_atomic8_load",
 	"__tsan_atomic16_load",
 	"__tsan_atomic32_load",
-- 
2.37.2.789.g6183377224-goog


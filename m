Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CD42C9D
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 11:45:58 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id q17-20020adff791000000b00183e734ba48so3524731wrp.8
        for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 03:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=JzBhpw0Qm81Z9lbF5IGyZhQAb+5o04LDLkCFlxupKLc=;
        b=pHRgTgtBe9w8GJo+UVuCrCXkkBePrXHeJXXGSGxiMQTDZhPB1HMZjVhCQEHB+8iuxA
         QTqapU0TX6O4TE0Y48efyZW2bq1hF37Xt0PGzM68wPVdqNEwB+3nHHqWFUL1gWu3kHtR
         Cq7Wrdud5dEh12cWU90OhIU4V/9Q7ULAOS9mOORJ6Eqe+R8j1ryew/Yd+VDrcTllPVFh
         5lcxmqYwyS4EYnDSPUY2x7vLF1W4hPQ8ICF36xbdENuMBTVVtdo+SbNEIlEehDKxtwYR
         kgzu3xNPjqGc6hHJvBg6+Ezt/2WHsUBVgd1XEwAmeXQPIFvn+uf/vjPzU0O+2NhHvmqd
         ksUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=JzBhpw0Qm81Z9lbF5IGyZhQAb+5o04LDLkCFlxupKLc=;
        b=tEScLhNEahPZtIHDK5fJ/GsP4U7wclGAkjYLKNISqL12ZV8lFd2HxPWa8hhitencJx
         ZeMGX8UQBaJ8qF8LD+kEjLqvTQJdXS/drRWxXXis0uD0LVOvkCVR8bPL6AqaVuq2aGjq
         AeDG9hX2Wm1/usH2dHBNY/x5sukMbfWKSF+qWGjH3GpvKDBXvrGo5j4Do/EqvjUnjKVr
         vTp0dIUge3SjgQkBZviMc7XEMjA5nqGTKuJ9lQG8bJT/NumQBOW84H7wRg5zC2244d2e
         AehP/QMBOaw5OOzVCSjH060PVc9VU4Mvoq+8CzU+8qI0VUq5LvSikVdTTtShbv3vn2ah
         4NOQ==
X-Gm-Message-State: AOAM530kveEFBiM54VAQlyB0sWnFH8g9C62R6jDzEsnFBR8ZpfcP4jQ5
	GQlks8Du0z2QD05Wu69Io/Ul5gWFXQ==
X-Google-Smtp-Source: ABdhPJyGlw39n0+Jfq+xh033MGOvVeVGOoalcV20EEznri+jie430fZfA9+7esf3Wo7SpGvol2V1AwHpQw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a7b:cc8f:: with SMTP id p15mr4408290wma.129.1638272756667;
 Tue, 30 Nov 2021 03:45:56 -0800 (PST)
Date: Tue, 30 Nov 2021 12:44:30 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-23-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 22/25] objtool, kcsan: Add memory barrier instrumentation
 to whitelist
From: Marco Elver <elver@google.com>
To: elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Borislav Petkov <bp@alien8.de>, Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Adds KCSAN's memory barrier instrumentation to objtool's uaccess
whitelist.

Signed-off-by: Marco Elver <elver@google.com>
---
 tools/objtool/check.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 21735829b860..61dfb66b30b6 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -849,6 +849,10 @@ static const char *uaccess_safe_builtin[] = {
 	"__asan_report_store16_noabort",
 	/* KCSAN */
 	"__kcsan_check_access",
+	"__kcsan_mb",
+	"__kcsan_wmb",
+	"__kcsan_rmb",
+	"__kcsan_release",
 	"kcsan_found_watchpoint",
 	"kcsan_setup_watchpoint",
 	"kcsan_check_scoped_accesses",
-- 
2.34.0.rc2.393.gf8c9666880-goog


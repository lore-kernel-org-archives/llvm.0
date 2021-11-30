Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386DB2C9D
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 11:45:56 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id 205-20020a1c00d6000000b003335d1384f1so13626361wma.3
        for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 03:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=SnYVQxLC6YSHg0QBspCa3KEICf+BvvptqJyS2cHTmDQ=;
        b=YAPrqaSvFXPKIyChd2B9G/mC+V4Jc4D9Ysa+dt9+gyWoCPV+nRINqJd57Duo402ra3
         fACCmxrugjWDUChLO48YEakWmtgKIBS2NenkgfzdEIUaFeOLMeRRLt3y3O0O8m42KVyP
         EYZTlGjECGMCo3XeJTyzQ9huKYBCMEUzAAG6gZ+6TrfzQbi+hkq/C1sNW9Osl71l2q00
         KnvJkh1XBMAWo2p+iVXz1ZScDqJ9cYV8qalOkG24HTG/65Ii8z7IiAdL8qvRMC2Opkvc
         XOyIIRR2dMM8QMdcIa4mT34J5n4EmvIPm98FB4otkGxOdejNKSt9f8kvehv1Vt3mjuJX
         t2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=SnYVQxLC6YSHg0QBspCa3KEICf+BvvptqJyS2cHTmDQ=;
        b=AkTxbpko0+12BL996a7O5I5oh97ToLURGub4tVC0ua/GIGEz0q5HTjkg7VoHEFtubZ
         v5mVbJu1FkxuLlUKfY9msktOb6BXHEB8SRySj5IZYUEOYnOG2TPD4VH+xjza4I+gNBLq
         fwm+ZjexmAYyNt6InJS7YzNdcn48QtdCuw+6d64GuqHff4F0MuIgAIRiFB9Zzx8bbyCI
         oIg1KXgccCMe9XEWs7Z8MKpxvs0W7Z89CZmzChuSK+rFO63P1VlUqwOEJWH2/DNrjLeF
         LhTaCpKrSCCzhKytHneUW9gpB+YVjRUNNDlCXIBSaNLaqqnHK+QZO8dqtEkwcJ7mipwE
         9bTg==
X-Gm-Message-State: AOAM531lEHAdzWZV/e2PzZwnXYYQb8goQJv4/8eZwf7lMXuxKB0J6XmL
	zYUL2el9Oj4jQdA4S98HYiMOGyFa2Q==
X-Google-Smtp-Source: ABdhPJy3VXvdk8vo/XrXiDkU+BIk+TJTbB/pqh504ouz3u8/5fsbp+KQ9JgMbQcOudhStkssJotFYNwe1A==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a05:600c:4f0b:: with SMTP id
 l11mr626057wmq.0.1638272754116; Tue, 30 Nov 2021 03:45:54 -0800 (PST)
Date: Tue, 30 Nov 2021 12:44:29 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-22-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 21/25] sched, kcsan: Enable memory barrier instrumentation
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

There's no fundamental reason to disable KCSAN for scheduler code,
except for excessive noise and performance concerns (instrumenting
scheduler code is usually a good way to stress test KCSAN itself).

However, several core sched functions imply memory barriers that are
invisible to KCSAN without instrumentation, but are required to avoid
false positives. Therefore, unconditionally enable instrumentation of
memory barriers in scheduler code. Also update the comment to reflect
this and be a bit more brief.

Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/sched/Makefile | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/Makefile b/kernel/sched/Makefile
index c7421f2d05e1..c83b37af155b 100644
--- a/kernel/sched/Makefile
+++ b/kernel/sched/Makefile
@@ -11,11 +11,10 @@ ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
 # that is not a function of syscall inputs. E.g. involuntary context switches.
 KCOV_INSTRUMENT := n
 
-# There are numerous data races here, however, most of them are due to plain accesses.
-# This would make it even harder for syzbot to find reproducers, because these
-# bugs trigger without specific input. Disable by default, but should re-enable
-# eventually.
+# Disable KCSAN to avoid excessive noise and performance degradation. To avoid
+# false positives ensure barriers implied by sched functions are instrumented.
 KCSAN_SANITIZE := n
+KCSAN_INSTRUMENT_BARRIERS := y
 
 ifneq ($(CONFIG_SCHED_OMIT_FRAME_POINTER),y)
 # According to Alan Modra <alan@linuxcare.com.au>, the -fno-omit-frame-pointer is
-- 
2.34.0.rc2.393.gf8c9666880-goog


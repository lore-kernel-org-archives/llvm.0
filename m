Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463423164DF
	for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204397; cv=none; b=b/FOmn2wEOhugWWb+22jaalg+55rzKwy4JjiQwneEwspFy3lKc+zh+dRhhYdWGGfCGti2QMSPUACZAzwTWp7YmYxUhi6YudSGUSqEZ44T6aO8MrJKJcLE2hzr/1V3GFJmCGbR0JDO3iepi7tuWDEqyC2t+kK3Tl/FCrgyDlzrlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204397; c=relaxed/simple;
	bh=SpUgVrjaDm3RLrxadQdn2hAFpCJXInTkIERb02PmxvQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jJZCKzB0RfKpHuQJggSguE1TLfGm9SO704TF48yl9H1SyVasvXsm99oYZ0f0abYzvfW1E7nRpGHXkKwOqZX6PR3XUMte/kbVa94cU0BtEY09C0hWRSN5RQA0pfzztJ9gx2/+4X7DBctQxttTUE4uuBjHADlxNUbG0BduOMeZpgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zGrXtHOk; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zGrXtHOk"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3eb67c4aae5so473531f8f.0
        for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204393; x=1758809193; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i8w2QAEoYIuf5bb1DymlH6d9mwXwlVHoZjcMp7ct6B4=;
        b=zGrXtHOkWj8BX/nBezcZc+F5bJ8VcQFaqepMal1EWbPCTPpwPbin7wfHYAPn9oy6Gb
         hysz/GgvfeD2SmVxyJXqNYAsXG0cO686Jo+9GRsa2AAepF9dCsp3/HHhYaRjCaW0ZbGg
         kBX8iT2/sQVU/bL4yaeSRW2rWE8rwNvBmRANUwPTSS9bG4mlODDlZCpDdKSD/B55oM5g
         8Vw3xYJMpDCjFMZjR4FpWKDsuTlnnutXQ2jruqFrFYi6+XhfEd9JZAzv1Y1jKQ10rjn0
         NYWFUXop9NMKu4ky5lmr9JfIIU+3wFOi5OoV0yNfo4O8qqcJMikZgP+3LZpfweZ+48+N
         wpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204393; x=1758809193;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i8w2QAEoYIuf5bb1DymlH6d9mwXwlVHoZjcMp7ct6B4=;
        b=HE25xiWJbn2qBrD8+a95cSsHmDJdazDLCth+TkxPTXaasXixMgR6JsyK8jpq0yzsMX
         tRKmTYqUBwTWgm1G3T8olAAIw6+yoPjPaLdLRndRYyBwUW6m2TVkV4u00Zef+y+r4r9e
         N827F4l203b8sNleMceyTixu533d1I9bESr41GA/QfdrawL3RMA0TcMyHO4yQVDnGsE3
         NRhOOnEDPMymO4HuGAxCLuK9UqIKwSsWVoVfzoz94TcakZqmY5AtO3m8Ar/HsbG4oJaT
         FgEaLy1bfShR2yhyqa4ROZLVograoARYOGir7N/tsB0VUpFE/NU5NxngZYSjAFoNVU7m
         8zqg==
X-Forwarded-Encrypted: i=1; AJvYcCUWhe5Slb9MfAXlMJPYuCvWZk/24WZ1olKLQuhLv8Du6Ckx2zKM0BGzxpvWSKbuG2vG0gI1@lists.linux.dev
X-Gm-Message-State: AOJu0YxutiUMhCeGMJXKUSZwIb5ITumSuDWMFrE1QPpsLeYuOU3BmwLT
	zS2YHVup46UNWvfDGh5cLUKI7i+tNyo8BCgJJ36QOqhTM17uJ90IKIw4UHd35VHrn+ehbn0zEWs
	34Q==
X-Google-Smtp-Source: AGHT+IHWNzp66JVSJfWTxCRHilc0nDbHIqmddDpVoeLyiEVjC/MpaqVSH0JrUfOsI8FVYQkmBD96f8iDCw==
X-Received: from wrbfr7.prod.google.com ([2002:a05:6000:2a87:b0:3e7:6467:c475])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2506:b0:3da:27c2:f51d
 with SMTP id ffacd0b85a97d-3ecdfa5f1bamr5332225f8f.45.1758204392094; Thu, 18
 Sep 2025 07:06:32 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:35 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-25-elver@google.com>
Subject: [PATCH v3 24/35] compiler-capability-analysis: Introduce header suppressions
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

While we can opt in individual subsystems which add the required
annotations, such subsystems inevitably include headers from other
subsystems which may not yet have the right annotations, which then
result in false positive warnings.

Making compatible by adding annotations across all common headers
currently requires an excessive number of __no_capability_analysis
annotations, or carefully analyzing non-trivial cases to add the correct
annotations. While this is desirable long-term, providing an incremental
path causes less churn and headaches for maintainers not yet interested
in dealing with such warnings.

Rather than clutter headers unnecessary and mandate all subsystem
maintainers to keep their headers working with capability analysis,
suppress all -Wthread-safety warnings in headers. Explicitly opt in
headers with capability-enabled primitives.

With this in place, we can start enabling the analysis on more complex
subsystems in subsequent changes.

Signed-off-by: Marco Elver <elver@google.com>
---
 scripts/Makefile.capability-analysis        |  4 +++
 scripts/capability-analysis-suppression.txt | 32 +++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 scripts/capability-analysis-suppression.txt

diff --git a/scripts/Makefile.capability-analysis b/scripts/Makefile.capability-analysis
index e137751a4c9a..76ef93ce2466 100644
--- a/scripts/Makefile.capability-analysis
+++ b/scripts/Makefile.capability-analysis
@@ -4,4 +4,8 @@ capability-analysis-cflags := -DWARN_CAPABILITY_ANALYSIS	\
 	-fexperimental-late-parse-attributes -Wthread-safety	\
 	-Wthread-safety-pointer -Wthread-safety-beta
 
+ifndef CONFIG_WARN_CAPABILITY_ANALYSIS_ALL
+capability-analysis-cflags += --warning-suppression-mappings=$(srctree)/scripts/capability-analysis-suppression.txt
+endif
+
 export CFLAGS_CAPABILITY_ANALYSIS := $(capability-analysis-cflags)
diff --git a/scripts/capability-analysis-suppression.txt b/scripts/capability-analysis-suppression.txt
new file mode 100644
index 000000000000..95fb0b65a8e6
--- /dev/null
+++ b/scripts/capability-analysis-suppression.txt
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# The suppressions file should only match common paths such as header files.
+# For individual subsytems use Makefile directive CAPABILITY_ANALYSIS := [yn].
+#
+# The suppressions are ignored when CONFIG_WARN_CAPABILITY_ANALYSIS_ALL is
+# selected.
+
+[thread-safety]
+src:*arch/*/include/*
+src:*include/acpi/*
+src:*include/asm-generic/*
+src:*include/linux/*
+src:*include/net/*
+
+# Opt-in headers:
+src:*include/linux/bit_spinlock.h=emit
+src:*include/linux/cleanup.h=emit
+src:*include/linux/kref.h=emit
+src:*include/linux/list*.h=emit
+src:*include/linux/local_lock*.h=emit
+src:*include/linux/lockdep.h=emit
+src:*include/linux/mutex*.h=emit
+src:*include/linux/rcupdate.h=emit
+src:*include/linux/refcount.h=emit
+src:*include/linux/rhashtable.h=emit
+src:*include/linux/rwlock*.h=emit
+src:*include/linux/rwsem.h=emit
+src:*include/linux/seqlock*.h=emit
+src:*include/linux/spinlock*.h=emit
+src:*include/linux/srcu*.h=emit
+src:*include/linux/ww_mutex.h=emit
-- 
2.51.0.384.g4c02a37b29-goog


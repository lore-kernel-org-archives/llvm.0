Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5F7145B00
	for <llvm@lists.linux.dev>; Tue,  4 Jun 2024 23:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717542997; cv=none; b=N6JFMyPpSliHocymbsNq2yIqdyEd1OTzVm9oUfTCDs68l69c9GlHk4Ywu10PoLJnaWdf4kXZf4q1vEQaQD6L0IDWiCSbVBF0985U1dSXNBa/DkEm6vxHJNHZT3nkdbc0JTZwzX326hAOM0psxUDdNgcRqRuW7L2PlqsGwRDzRwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717542997; c=relaxed/simple;
	bh=d3KD+dGdQ4ZHnHhSkskyUBnHOtvBSxNQVc1S9GV3jlM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QCjlivL1/ILEVXHH8iWVQckG8GWOHIK6oPHlNmHrKqRluK4f6KvrGDOuUXrBnuua9D85SaOzZlhEKSZGROlRJt/OpNjOQgFU/autZI+I4BCyBSVntMe4KckuJuXA9lK+cdrqPwLIwpp1eFxPxYk1+bct/z8Kv3QSTF3fmfUrEjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gCPppL7f; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gCPppL7f"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62a50486746so26010447b3.3
        for <llvm@lists.linux.dev>; Tue, 04 Jun 2024 16:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717542994; x=1718147794; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WZNrZXaQe5QjyrPFceQH2LfhlF3G2burIHCEgVqIZ78=;
        b=gCPppL7faGQeR7udoYOfGkWLL3dmQL6S1es88eLLJgN254l9P3Qmm6VvVkrMNQBUqr
         wZwSlq69QPJwuXPHYKhbZS4vXRTEN6vwbfz7nG4wzWhhqXQEJTT/Z7VobFMhTMb/qsjX
         o///fq2Z2s3cL2gwoMBcbdTNvAxD/rJmBmE405fJKxOzlUcsAgHbo84RO1+z3Xo7HKai
         nk70BpwHrxw5VdjsZ5VsZxji7o+G69jft/xFmaaOiNzcrlTMhuiJd0yfOTg0ikwTPKTg
         VtSNfKTzyJT24N0gy+Tdl0juHr1IBE7Q89rMuGZ6s8HFbqr/0tD4ErlunWWDVWjMSr7p
         vGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717542994; x=1718147794;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WZNrZXaQe5QjyrPFceQH2LfhlF3G2burIHCEgVqIZ78=;
        b=rba1XcdcCDfgZLYarfGFEZ7PAN9svYrabgH3XWjwz6hbSYxJfzMZfSrBhuDzhJNbu1
         aNnVH1wl4qRiDYhqDz5o4dEQCLw6nGCwYaJG8HrR5/XtcdTy+4JXhQ84ajdhhB+XmcbE
         7oyDdxUNA5qdSQb7aCrG6xeTn3wBz82VdhuTdsSPnyhfwNPd+xEmKgQlo+zHfoQm9TH/
         YhvkYvTUyyEOk6yCAS3WiEZHw9ZP6kbhZZZCP8P0dfhgaPbhZaxfijH+4hQ0Y6P7P4JV
         NpdzLAQwvDBACafegQp6C4z9Y4zwUthPJ5edQTzIvECH10sy4JpgCpMRC/uX7jb7DP/c
         AVKA==
X-Forwarded-Encrypted: i=1; AJvYcCU1X9fmCeGTB6YH+Pw41dBgh5C+wD35FwNKtm/zypFjMhpG+r0vHy2jkQUcH4R0lvr1Y3proHs6f71xcB3sXSXV6/Jzvw==
X-Gm-Message-State: AOJu0YwaAPBfaHRMZj7gtjai0HttjC7RCU2QE6mkTjBOlOawU/WZpMNh
	U2vpwNOMhCfc56kjFDr3xyxjLzqX4dfJvIEJHbmTZNIZwLhwAVAGqNsN7r04iKzPxnhEnH43tPk
	rXw==
X-Google-Smtp-Source: AGHT+IGjXoXe+YCWwO+tWw0X7qGEAnModzncTc1ziQR914tc4YoJFWMBFQKkS7uv8fTlHNhwtR04tsmeZDo=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:887:b0:62c:35fd:678b with SMTP id
 00721157ae682-62cbb5ab5a2mr885387b3.8.1717542994498; Tue, 04 Jun 2024
 16:16:34 -0700 (PDT)
Date: Tue,  4 Jun 2024 23:12:18 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240604231219.444603-1-edliaw@google.com>
Subject: [PATCH] selftests/timers: Guard LONG_MAX / LONG_MIN defines
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Add ifndef guards around LONG_MAX / LONG_MIN defines. When building with
Android bionic, these macros are redefined because bionic's time.h will
include linux/time.h, which includes limit.h.

INFO: From Compiling common/tools/testing/selftests/timers/valid-adjtimex.c:
common/tools/testing/selftests/timers/valid-adjtimex.c:107:9: warning: 'LONG_MAX' macro redefined [-Wmacro-redefined]
  107 | #define LONG_MAX (~0UL>>1)
      |         ^
prebuilts/clang/host/linux-x86/clang-r522817/lib/clang/18/include/limits.h:47:9: note: previous definition is here
   47 | #define LONG_MAX  __LONG_MAX__
      |         ^
common/tools/testing/selftests/timers/valid-adjtimex.c:108:9: warning: 'LONG_MIN' macro redefined [-Wmacro-redefined]
  108 | #define LONG_MIN (-LONG_MAX - 1)
      |         ^
prebuilts/clang/host/linux-x86/clang-r522817/lib/clang/18/include/limits.h:52:9: note: previous definition is here
   52 | #define LONG_MIN  (-__LONG_MAX__ -1L)
      |         ^

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/timers/valid-adjtimex.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/timers/valid-adjtimex.c b/tools/testing/selftests/timers/valid-adjtimex.c
index d500884801d8..3d9f1baff86e 100644
--- a/tools/testing/selftests/timers/valid-adjtimex.c
+++ b/tools/testing/selftests/timers/valid-adjtimex.c
@@ -102,8 +102,12 @@ long outofrange_freq[NUM_FREQ_OUTOFRANGE] = {
 	 1000 * SHIFTED_PPM,
 };
 
+#ifndef LONG_MAX
 #define LONG_MAX (~0UL>>1)
+#endif
+#ifndef LONG_MIN
 #define LONG_MIN (-LONG_MAX - 1)
+#endif
 
 long invalid_freq[NUM_FREQ_INVALID] = {
 	LONG_MAX,
-- 
2.45.1.288.g0e0cd299f1-goog


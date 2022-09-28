Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0FB7B
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 23:36:56 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id i91-20020a17090a3de400b00205fd282e8cso693390pjc.4
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 16:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=3Yq7CLybwWK+RFrws3rXKi2UuiysUZtk+qDRhATTop0=;
        b=Ea3Z5w53CFnMPujNQZAL9/uyD/3RiI7TVHdzhFSB9a8FOkzqbjbzGOxhA4f+pYpUWw
         kjvVsSZ6gIciDfWplCOpp7+3o4acPhjH6dc+IvjtH+lE5CWHG2Ea9+G+CE11ZFELwUZK
         OssDKu/flHUvN9766NJUh8fo/586Rqz/K4gn/pdCfbVVLA++Uj/lLB4kVvEAhA+/3wc3
         wfvCwcDC1z9OuWx865t3SCfgnvkQ9d51HFyuFOuoelHQe+3oJDYrJMQe7P2gDorQH3zg
         XjCTtTjbD9jMb5aWKPys4tavSYdDCEPUg5Eq6Mjgt49Mt93NSLF3SUKoSd+FU11Koa3B
         y2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=3Yq7CLybwWK+RFrws3rXKi2UuiysUZtk+qDRhATTop0=;
        b=kjPRFPuUS/623YgLryrxSZokDezHI7NLdWcBqQbfASd5q9o5Kg5FTgPRh3Aq57YcQr
         ZQD+f0VeU8eCKNrnWTLSaDUVYNBMbf+rUD63567zM/E0L9ZQEC5inAVuhd7jxORf/B/U
         htzd4V8ykUOJhhJ0CN5Gr8UTsgWEZKItkJ3MwVp4gPgCjDR+q4pyupOekQR6pjKhqxLI
         5C/p/xphIY94WMqeG+Gy1cqRZpj5TEiwRHWIlA4ZQZes/7J6t5XDH8olIfGFCkhjjoYB
         du48pc0sPjFn5YoOo49dd/zHsEqi1j0xzelQofumWU5h8Wb8iGH/T8e+1k7mkBwuXdIY
         /4QQ==
X-Gm-Message-State: ACrzQf2nPKK0bVtv5CMWMLByQx5/Z9dX8Mu2aarfzEOfQWG/ThkxN/X7
	VTOFwT8ZoVZhT3wJ/QbXFbhtjyocrNI=
X-Google-Smtp-Source: AMsMyM4fkY7buPPc/43yyEhSXtWDuxs9cmm2ZivmHyGaIMKrEDJWrAlpCSP0tsKKX4mKhBMrtBkfhXhZ+yA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:32cc:b0:178:41c1:2e41 with SMTP id
 i12-20020a17090332cc00b0017841c12e41mr462492plr.126.1664408216145; Wed, 28
 Sep 2022 16:36:56 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Sep 2022 23:36:46 +0000
In-Reply-To: <20220928233652.783504-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220928233652.783504-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
Message-ID: <20220928233652.783504-2-seanjc@google.com>
Subject: [PATCH v2 1/7] KVM: selftests: Implement memcmp(), memcpy(), and
 memset() for guest use
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Implement memcmp(), memcpy(), and memset() to override the compiler's
built-in versions in order to guarantee that the compiler won't generate
out-of-line calls to external functions via the PLT.  This allows the
helpers to be safely used in guest code, as KVM selftests don't support
dynamic loading of guest code.

Steal the implementations from the kernel's generic versions, sans the
optimizations in memcmp() for unaligned accesses.

Put the utilities in a separate compilation unit and build with
-ffreestanding to fudge around a gcc "feature" where it will optimize
memset(), memcpy(), etc... by generating a recursive call.  I.e. the
compiler optimizes itself into infinite recursion.  Alternatively, the
individual functions could be tagged with
optimize("no-tree-loop-distribute-patterns"), but using "optimize" for
anything but debug is discouraged, and Linus NAK'd the use of the flag
in the kernel proper[*].

https://lore.kernel.org/lkml/CAHk-=wik-oXnUpfZ6Hw37uLykc-_P0Apyn2XuX-odh-3Nzop8w@mail.gmail.com

Cc: Andrew Jones <andrew.jones@linux.dev>
Cc: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@atishpatra.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Janosch Frank <frankja@linux.ibm.com>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile          | 11 +++++-
 .../selftests/kvm/lib/string_override.c       | 39 +++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/lib/string_override.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 8b1b32628ac8..681816df69cc 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -48,6 +48,8 @@ LIBKVM += lib/rbtree.c
 LIBKVM += lib/sparsebit.c
 LIBKVM += lib/test_util.c
 
+LIBKVM_STRING += lib/string_override.c
+
 LIBKVM_x86_64 += lib/x86_64/apic.c
 LIBKVM_x86_64 += lib/x86_64/handlers.S
 LIBKVM_x86_64 += lib/x86_64/perf_test_util.c
@@ -221,7 +223,8 @@ LIBKVM_C := $(filter %.c,$(LIBKVM))
 LIBKVM_S := $(filter %.S,$(LIBKVM))
 LIBKVM_C_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_C))
 LIBKVM_S_OBJ := $(patsubst %.S, $(OUTPUT)/%.o, $(LIBKVM_S))
-LIBKVM_OBJS = $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ)
+LIBKVM_STRING_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_STRING))
+LIBKVM_OBJS = $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ) $(LIBKVM_STRING_OBJ)
 
 EXTRA_CLEAN += $(LIBKVM_OBJS) cscope.*
 
@@ -232,6 +235,12 @@ $(LIBKVM_C_OBJ): $(OUTPUT)/%.o: %.c
 $(LIBKVM_S_OBJ): $(OUTPUT)/%.o: %.S
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
+# Compile the string overrides as freestanding to prevent the compiler from
+# generating self-referential code, e.g. with "freestanding" the compiler may
+# "optimize" memcmp() by invoking memcmp(), thus causing infinite recursion.
+$(LIBKVM_STRING_OBJ): $(OUTPUT)/%.o: %.c
+	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c -ffreestanding $< -o $@
+
 x := $(shell mkdir -p $(sort $(dir $(TEST_GEN_PROGS))))
 $(TEST_GEN_PROGS): $(LIBKVM_OBJS)
 $(TEST_GEN_PROGS_EXTENDED): $(LIBKVM_OBJS)
diff --git a/tools/testing/selftests/kvm/lib/string_override.c b/tools/testing/selftests/kvm/lib/string_override.c
new file mode 100644
index 000000000000..632398adc229
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/string_override.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <stddef.h>
+
+/*
+ * Override the "basic" built-in string helpers so that they can be used in
+ * guest code.  KVM selftests don't support dynamic loading in guest code and
+ * will jump into the weeds if the compiler decides to insert an out-of-line
+ * call via the PLT.
+ */
+int memcmp(const void *cs, const void *ct, size_t count)
+{
+	const unsigned char *su1, *su2;
+	int res = 0;
+
+	for (su1 = cs, su2 = ct; 0 < count; ++su1, ++su2, count--) {
+		if ((res = *su1 - *su2) != 0)
+			break;
+	}
+	return res;
+}
+
+void *memcpy(void *dest, const void *src, size_t count)
+{
+	char *tmp = dest;
+	const char *s = src;
+
+	while (count--)
+		*tmp++ = *s++;
+	return dest;
+}
+
+void *memset(void *s, int c, size_t count)
+{
+	char *xs = s;
+
+	while (count--)
+		*xs++ = c;
+	return s;
+}
-- 
2.37.3.998.g577e59143f-goog


Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E180D5C9B
	for <llvm@lists.linux.dev>; Mon, 29 Aug 2022 19:54:02 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id b142so7484007iof.10
        for <llvm@lists.linux.dev>; Mon, 29 Aug 2022 12:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=WUgMijwl3W/QqZyM5v4oVVeLOTQBRv/iBPfrAQK3cSM=;
        b=GF2Pf2kbP1bSwmxwKabzsaine2PsPmjRpXpr0oIii0TWbFI2h2/VIQ4ER842ndSgHC
         BB+YE71B0mKuwPEQ1JW2qu1JIB+fcQNkrw5tnFmE4ZTgrf0u5y4jM+3B06ASeBLny7qn
         QOF1gAxuY2nLDNq3Rogeqq9yb+zoyju9oujpKoWvGmRsebu1bEe3Kuev8Wm4tNVOFdc9
         Rah+bJsFxRN0WP2SBUjJu49Wy1vbareMzUoywImszv7gJMVCnw0ZPlrASixQYamWGv6+
         LKZ0DvRHRXQZ5TUz18FYNLU/+WCFlOwcqZcb7hAkW8YQBLSQ7geH6Yul4KGS3bVmtnQL
         OnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=WUgMijwl3W/QqZyM5v4oVVeLOTQBRv/iBPfrAQK3cSM=;
        b=lobjfa53mpsxaniTOafB4bx0exUDaY1s2dXOEdLZFUliOAwDVEwXDS8RJNOwkdAkvP
         kIV0mv9TEH5dHFdTaSyb/r0k/vikVimTLzvbaOh6Ua74Mso/uk6sozwTnKFtyQQEzGx1
         S/bYgitwXEvsegL+RIvd+mwwwBI2qjpt8EQVajxdtFNGSD9K/A0FsILKvVY1XG9F1weD
         67+1V84N3qY16H4QhBmOOBAGvOjSP7rqWllmYs/8aQL+sf7qWknoVAHURF73mkYsvRPb
         f7NXKa5QbuTB1p05bkrINCXndrFyUYhXQRr0JKedOxFb8sexUOtxkfx8soMUJPmw7b7p
         qFzw==
X-Gm-Message-State: ACgBeo0I561dG19qxPci41eFcMJzikKFJ9XCwfcI5qK9ZWTsm+dbe0Ix
	5STm+YiWVLqSCab6Nf2KIo4=
X-Google-Smtp-Source: AA6agR7JxuA2bQaS834AqPvIcem/ZAFJkF8Qf3POvbHbAw2OGF941suyh0ZkzMo0E9PbNIqrQkq18Q==
X-Received: by 2002:a6b:b7c2:0:b0:688:ae30:27d1 with SMTP id h185-20020a6bb7c2000000b00688ae3027d1mr9590645iof.1.1661802841930;
        Mon, 29 Aug 2022 12:54:01 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net. [71.33.138.207])
        by smtp.gmail.com with ESMTPSA id 66-20020a021d45000000b0034a54523fcfsm475119jaj.28.2022.08.29.12.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 12:54:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: bpf@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] libbpf: add GCC support for bpf_tail_call_static
Date: Mon, 29 Aug 2022 13:53:49 -0600
Message-Id: <20220829195349.706672-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bpf_tail_call_static function is currently not defined unless
using clang >= 8.

To support bpf_tail_call_static on GCC we can check if __clang__ is
not defined to enable bpf_tail_call_static.

We also need to check for the GCC style __BPF__ in addition to __bpf__
for this to work as GCC does not define __bpf__.

We need to use GCC assembly syntax when the compiler does not define
__clang__ as LLVM inline assembly is not fully compatible with GCC.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 tools/lib/bpf/bpf_helpers.h | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tools/lib/bpf/bpf_helpers.h b/tools/lib/bpf/bpf_helpers.h
index 7349b16b8e2f..a0650b840cda 100644
--- a/tools/lib/bpf/bpf_helpers.h
+++ b/tools/lib/bpf/bpf_helpers.h
@@ -131,7 +131,7 @@
 /*
  * Helper function to perform a tail call with a constant/immediate map slot.
  */
-#if __clang_major__ >= 8 && defined(__bpf__)
+#if (!defined(__clang__) || __clang_major__ >= 8) && (defined(__bpf__) || defined(__BPF__))
 static __always_inline void
 bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
 {
@@ -139,8 +139,8 @@ bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
 		__bpf_unreachable();
 
 	/*
-	 * Provide a hard guarantee that LLVM won't optimize setting r2 (map
-	 * pointer) and r3 (constant map index) from _different paths_ ending
+	 * Provide a hard guarantee that the compiler won't optimize setting r2
+	 * (map pointer) and r3 (constant map index) from _different paths_ ending
 	 * up at the _same_ call insn as otherwise we won't be able to use the
 	 * jmpq/nopl retpoline-free patching by the x86-64 JIT in the kernel
 	 * given they mismatch. See also d2e4c1e6c294 ("bpf: Constant map key
@@ -148,12 +148,19 @@ bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
 	 *
 	 * Note on clobber list: we need to stay in-line with BPF calling
 	 * convention, so even if we don't end up using r0, r4, r5, we need
-	 * to mark them as clobber so that LLVM doesn't end up using them
-	 * before / after the call.
+	 * to mark them as clobber so that the compiler doesn't end up using
+	 * them before / after the call.
 	 */
-	asm volatile("r1 = %[ctx]\n\t"
+	asm volatile(
+#ifdef __clang__
+		     "r1 = %[ctx]\n\t"
 		     "r2 = %[map]\n\t"
 		     "r3 = %[slot]\n\t"
+#else
+		     "mov %%r1,%[ctx]\n\t"
+		     "mov %%r2,%[map]\n\t"
+		     "mov %%r3,%[slot]\n\t"
+#endif
 		     "call 12"
 		     :: [ctx]"r"(ctx), [map]"r"(map), [slot]"i"(slot)
 		     : "r0", "r1", "r2", "r3", "r4", "r5");
-- 
2.34.1


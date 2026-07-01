Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AB7441020
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 12:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910317; cv=none; b=Me/qc7r2aDKRQmhWR45myLo5m6eKAoCVhG3pmXZ7UdDzUUDDkj2pp7vEHtxTHI3Xgs4Cd80zj+8EYe9b3q3hgXNd9xnaax9KE7vxRuEQsO/kFeAtQwqdi/rblVL72lDsheW/TN+tOS+xEJQQCdDQ+jeO65ZTPpggKbQK1snUO7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910317; c=relaxed/simple;
	bh=uGPFCFx1FqW9VMNus2a7Thw1P9za6fs0Y7aQfT5w4n8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FH18sl0LJgfH3xiwWh7TXH72Hvw++2KI5Wx3QRRavK4qGLp7isuT96/BqgUpf4yp+hAKW+9cbOmneflOYrDFbhR05XRUudfgC+SEk4rbJIStv5qYWuQdveqpJOZVf7PDx8uXmJTTHExkYPFKvdit6GJvzZhfH/DeLA6MwLOrFPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3zjwKNN; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3zjwKNN"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4745492ed3aso370340f8f.1
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 05:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910315; x=1783515115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OmWDh+E3Ix3zFJalnxUFFjV5BfDox2wF4vd/HMlyNyM=;
        b=N3zjwKNN16tDuu+I6CuPqHaRWL+91hZJgttaJ1Ku+ZGC2xy6chXfFhwy8fijsNwI9u
         hPa10Xa54oU3O7ofydP/ao3u/pQahZb5f3bvxJbnBtTFLXOxg2ydejUvmBM1NVXMeFxN
         zirUPmznf/CWfe+QUIHoZmj0xsRvZ6ItYsPQJSTLhKXvuKuB/si8TptIuzExGambK31r
         KYgyu1cmR/BxT8AmijnI/JComikUyKkpMEiVeqlzNciw78GJuKt+hKSezwUDd6l+OWWj
         6EJdj6eRTqci84OiOj96kwZkjCEBb95Kwm3DcCRDxyci6AifxMM1Rg0IjGeG1kNFSqdw
         ZZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910315; x=1783515115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmWDh+E3Ix3zFJalnxUFFjV5BfDox2wF4vd/HMlyNyM=;
        b=LVqSkpko3eDy4rguLkq/Bk3EMo3pfT4mgqjkD/siopAlgB4xvFztgDOcpw7Tdv3IKM
         Ximdvcg3gykOnC45t1Rp53mwu25H/kdXBvSbrf3Hmu2oVetwgZV3w1ntaPJPW85f+pbR
         xzP90dGjSo8hrt/DcWQ57wGUEIWibEhbJNFSKECFm4npYoV7YqZ73OPmO9xNZ9IsbDEv
         9dcjK9gsZtgI1pSUAN6YgUGkdBZGx0BhAsyheeQLK0SQVv4Bm1tgR35ahJGYpMuXcBYU
         5RwKtWsS5BEefWYA0PhHThnoF7gv3ySzSdlF2qTkytXDVSqfFvOiYRiLqwH3mNqPhUmi
         KTIg==
X-Forwarded-Encrypted: i=1; AHgh+RroOZVqpqknzD+Jo1BBYrrV+XeAzNnf9bvo0TBUKAOOpqLrnXWKdgt04FDjMPARKBkL8q9I@lists.linux.dev
X-Gm-Message-State: AOJu0YwdVWz/7hdvN/Hoqj7rKjXWA8N4ODlvTMO607FwJwDCG5coRY2z
	4MewqJEKLJcKCIMPx7KuUugiDfaJEnp2Zep8PAYRA/jvQSuK79W+rRBY
X-Gm-Gg: AfdE7cluFkKXShYjtXxDk2jBH+aW8WWsloUQl9dPh4fhLCyR1fkHTKMo6+ujVbIYibZ
	ZcqhDKyUX3Xg0zoRe/gmeYA6k8mYQWjSse4KD4Lmc+tMws5j0eWf4Oed5vAgUgmcsGFGkAR5AfT
	TrTrnphwKoglSFOXSizFZx+PFk9i29n9u5PaQwKi39aIWPOPKmcna3vuuFCv3cy5ms+FS2Xe7G+
	La93z9/BNYcebyyAbbwVFUkb4Cnae3TJdt0byDCIxWw1hQePDRSMbu8IJDiU2zKkRIjxqgBZqRC
	VY9v4irPvslI1vaAhDxKJxMXv9IiLLKFq+kM2FvWoIDLSeUN3REnRLxwxES7KkbmUt9/KnP3VQa
	ys/sVgYbuvLzsODpaNGiAG5yFCg3KCaJ+rxdxtg0vr7nnSnyjGmsIOVewRsRlad7AoMAvtzX961
	yONV80Opkq/j3C2V+tKGh4Xo+3be9gQe2rDYvOVDnyZxNYbj7miaS9shPGgxSJniudSD/V6Ses1
	MH2urXGKdEkxWRQznpWgY8wlaM=
X-Received: by 2002:a05:6000:2406:b0:46e:5c5d:b2cc with SMTP id ffacd0b85a97d-47757c6e277mr2873893f8f.23.1782910314659;
        Wed, 01 Jul 2026 05:51:54 -0700 (PDT)
Received: from voyt-laptop-dell.fritz.box ([2001:9e8:bd55:a800:14a4:886c:f7de:bb03])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475671d0403sm17665051f8f.29.2026.07.01.05.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:51:54 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Alexander Potapenko <glider@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	Dmitry Voytik <voytikd@gmail.com>
Subject: [PATCH] x86/mm: fix objtool failure with KMSAN enabled
Date: Wed,  1 Jul 2026 14:51:51 +0200
Message-ID: <20260701125151.352632-1-voytikd@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes broken builds with defconfig + CONFIG_KMSAN +
CONFIG_DEBUG_INFO_*.

To reproduce the issue before the fix:
  make mrproper
  make LLVM=1 defconfig
  ./scripts/config -e CONFIG_KMSAN \
    -e CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
  make LLVM=1 olddefconfig
  make LLVM=1 -j(nproc) vmlinux
  ...
    LD      vmlinux.o
  vmlinux.o: warning: objtool: folio_zero_user+0x801: undefined stack state
  vmlinux.o: error: objtool: folio_zero_user+0x801: unknown CFA base reg -1
  make[2]: *** [scripts/Makefile.vmlinux_o:76: vmlinux.o] Error 255

objtool in verbose mode shows how the frame pointer is omitted:
  make LLVM=1 OBJTOOL_VERBOSE=1 -j(nproc) vmlinux
  ...
  b15a2c:  folio_zero_user+0x7fc      xor    %eax,%eax
  b15a2e:  folio_zero_user+0x7fe      mov    %rcx,%rsp
  b15a31:  folio_zero_user+0x801      mov    %r14,%rdi
  b15a34:  folio_zero_user+0x804      mov    %rbx,%rcx
  b15a37:  folio_zero_user+0x807      call   0xb15a3c <__clear_pages_unrol

After the fix, the frame pointer is back:
  b15a37: 31 c0                       xor    %eax,%eax
  b15a39: 48 89 ec                    mov    %rbp,%rsp
  b15a3c: 4c 89 f7                    mov    %r14,%rdi
  b15a3f: 48 89 d9                    mov    %rbx,%rcx
  b15a42: e8 00 00 00 00              call   b15a47 <folio_zero_user+0x817>

It seems the issue was introduced by
commit 54a6b89a3db2 ("x86/mm: simplify clear_page_*")

The actual fix is to revert the change how ASM_CALL_CONSTRAINT is
positioned.
Additionally, reintroduce asm_inline to prevent potential compiler
rejection of inlining.

Link: https://lore.kernel.org/CAAX90H2_RPnZL_dFYN7cQF6yt-wAweKKSx2=6e2aZ0kv+Pm+NQ@mail.gmail.com
Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
---
 arch/x86/include/asm/page_64.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_64.h
index 1895c207f629..de8604f0a3a1 100644
--- a/arch/x86/include/asm/page_64.h
+++ b/arch/x86/include/asm/page_64.h
@@ -100,12 +100,13 @@ static inline void clear_pages(void *addr, unsigned int npages)
 	 * __clear_pages_unrolled() are part of the inline asm register
 	 * specification.
 	 */
-	asm volatile(ALTERNATIVE_2("call __clear_pages_unrolled",
-				   "shrq $3, %%rcx; rep stosq", X86_FEATURE_REP_GOOD,
-				   "rep stosb", X86_FEATURE_ERMS)
-			: "+c" (len), "+D" (addr), ASM_CALL_CONSTRAINT
-			: "a" (0)
-			: "cc", "memory");
+	asm_inline volatile(
+		ALTERNATIVE_2("call __clear_pages_unrolled",
+			      "shrq $3, %%rcx; rep stosq", X86_FEATURE_REP_GOOD,
+			      "rep stosb", X86_FEATURE_ERMS)
+		: ASM_CALL_CONSTRAINT, "+c"(len), "+D"(addr)
+		: "a"(0)
+		: "cc", "memory");
 }
 #define clear_pages clear_pages
 
-- 
2.54.0


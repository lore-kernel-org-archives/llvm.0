Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CCE211C
	for <llvm@lists.linux.dev>; Mon, 29 Aug 2022 21:05:53 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id d6so5155624ilg.4
        for <llvm@lists.linux.dev>; Mon, 29 Aug 2022 14:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=iMrKlQSZZ8llMPUpcA2wkZ6GcnRo6xzhVqACLMFFoSU=;
        b=bIW6nMBxac3oWFkumBvaLSV52Vt9AeCRygcLmOsPHX3jxbSjnojDVwFhOJ+HdvtNze
         P5zhXtolNVwIHZN7XcUwe1zJrKI2XrmMAu/zmRaAWnLuaYhEHl0IoKa1FDsaqgZcLN15
         nuNIOP2iyiCM8TAajoSkPoq4YTwvWn1nHPORFWJHRReuqt4cmS0BLBSutK+PQiK1xooh
         I01m9MfCQNmjywINSvWr/UDdKuHJaic4oPimpSMBerCIbw72oCkbyV46uzYJxlgUPrMR
         1C7D9HO1qaYDIMcsx5dcIeGsHqc59tfavyXoPhuKRjIoT5/1gzONB/ltMwVs7+ipAbAJ
         CS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=iMrKlQSZZ8llMPUpcA2wkZ6GcnRo6xzhVqACLMFFoSU=;
        b=f+4wXR+9cOa7UquX8ZSPqrd2rmrK299ml2foKEfAlHwfndPwklTmWfvI/LLIKqgq13
         c5DX3/7B+9lWVR1GWqD3HiHPIBIVzb7szN8Oq9A8NfNQvg01uyxRja/tLCBik5h1u87c
         G5fkqzxiI9oP8K0rkCerIL7X1M3kOn32ZyeWBOgk5AR0VsoJ2KVsftJri3ZfbLcuwnul
         zau25lUes3gVXJNg7r3PRfFyWHiB86WT/y65PlKEFaMbzg01WWdMJ+9Y8eW2lJ8Rva/v
         ip4/FS55DYO7a29ii6wDseT8vw6OsL3FtukxVUb6z82Rfdq44HU+riij2AbzY1fOKHJn
         ZAmQ==
X-Gm-Message-State: ACgBeo2Y2v4UHS81snPCk92/pGepV9Ml2L9xQVp5IfIv7JGO5Z6XwVQ3
	c9ILOqmkZdK8+22Lw7wHldo=
X-Google-Smtp-Source: AA6agR6HwPl7lcId2NQFwlhhy8MwBh/S/oUdT5J+eVfJVXe2bjQjiGZUk/XL01VRi41cBEqKLyL9xA==
X-Received: by 2002:a92:130f:0:b0:2e4:22c9:7721 with SMTP id 15-20020a92130f000000b002e422c97721mr11343828ilt.34.1661807152810;
        Mon, 29 Aug 2022 14:05:52 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net. [71.33.138.207])
        by smtp.gmail.com with ESMTPSA id p6-20020a022906000000b00349dccb3855sm4638981jap.72.2022.08.29.14.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 14:05:52 -0700 (PDT)
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
Subject: [PATCH v2] libbpf: add GCC support for bpf_tail_call_static
Date: Mon, 29 Aug 2022 15:05:46 -0600
Message-Id: <20220829210546.755377-1-james.hilliard1@gmail.com>
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

We need to use GCC assembly syntax when the compiler does not define
__clang__ as LLVM inline assembly is not fully compatible with GCC.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - drop __BPF__ check as GCC now defines __bpf__
---
 tools/lib/bpf/bpf_helpers.h | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tools/lib/bpf/bpf_helpers.h b/tools/lib/bpf/bpf_helpers.h
index 7349b16b8e2f..867b734839dd 100644
--- a/tools/lib/bpf/bpf_helpers.h
+++ b/tools/lib/bpf/bpf_helpers.h
@@ -131,7 +131,7 @@
 /*
  * Helper function to perform a tail call with a constant/immediate map slot.
  */
-#if __clang_major__ >= 8 && defined(__bpf__)
+#if (!defined(__clang__) || __clang_major__ >= 8) && defined(__bpf__)
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


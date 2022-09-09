Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3D97E6
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 22:46:13 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id k9so1540008ils.12
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 15:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=dzQRKjNXBN2X1C+bDxNUc6KcBKqucdHKpIeoNgjV1yM=;
        b=YQwDKdNbYs9yzPupNoeI+QhCPK4MB/PMHZ0bCIz+6TBW3QUR5JvxaL+Si7ndB6pd39
         nFqYC9g0FuBGsx1F8C8EfWvM8V2py454+1WdhcnZn+O7fXWkpP+tCJa8BVbMh2fJPWLH
         5C4v/98UmDTS98z7QXO93GtieIpFIfg/0bFS2lhInM/iH/Zw56pDuiHZSANy5dYzNRhT
         03zGLZ4WEoCvt74vtT9chot2gdRqhdWzdVWtZmZIb+cslBRPeiCfsRsAZvRh9SQFV8aH
         KiFdWDGRDVgk1h6dGdpIiicCBe85uLAV1vnTtuCCIyDSJNi52tcaHTpsO8bUwrcHaYdB
         /SMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=dzQRKjNXBN2X1C+bDxNUc6KcBKqucdHKpIeoNgjV1yM=;
        b=h0Y5IFUp1aV/p2AyyEEQ6tsAKUEXtj87nDBiRqs9NrrMcv6503VNSz0oC2nD2XyWM9
         gtrDHYajhhbZ9u2M+9dGtFqN+8HIHnKFquDTFhUCxwKFJoadkGI2njhyuC1vYsWXU9f5
         QiwrVYQb304o7PT8wUvaFpiwcvgrhVR9QXtDF+Rzw1pZhL7HXEhlHCH5lOXTHaoQkEa3
         EUUy4FX5iNUTSFmaCjuF2CtEvOtzRTWKubaDmmdjv0CJ/LiAj42waZtYCw9FbILV2pN1
         Vdjd+9pSK0cFq8awUJebv4PiO4AYzF6OEpvc1q9+1f9LW1d8+y8yEEXGZDIeZUFET0KQ
         f7EA==
X-Gm-Message-State: ACgBeo0KDZvJgmjS+3SvZafjAFLmasamXsMlo2pMVJ3TIU9A9fnx+RUu
	jAXkc/6mGev7cmH4HMqdIas=
X-Google-Smtp-Source: AA6agR4GcezE1UgvP/2CEUs2lazsIDtnAHJrPC+kC1DbPhKGyr10Xesvcyx8FVugufLJXTZPeAtG8g==
X-Received: by 2002:a05:6e02:1568:b0:2f2:b10f:6da4 with SMTP id k8-20020a056e02156800b002f2b10f6da4mr5536126ilu.140.1662763572170;
        Fri, 09 Sep 2022 15:46:12 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net. [71.33.138.207])
        by smtp.gmail.com with ESMTPSA id q5-20020a02a985000000b0034689175166sm639765jam.86.2022.09.09.15.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 15:46:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: bpf@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
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
Subject: [PATCH] libbpf: define bpf_tail_call_static when __clang__ is not defined
Date: Fri,  9 Sep 2022 16:45:44 -0600
Message-Id: <20220909224544.3702931-1-james.hilliard1@gmail.com>
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
---
 tools/lib/bpf/bpf_helpers.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/lib/bpf/bpf_helpers.h b/tools/lib/bpf/bpf_helpers.h
index 7349b16b8e2f..30fc95e7cd76 100644
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
@@ -148,8 +148,8 @@ bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
 	 *
 	 * Note on clobber list: we need to stay in-line with BPF calling
 	 * convention, so even if we don't end up using r0, r4, r5, we need
-	 * to mark them as clobber so that LLVM doesn't end up using them
-	 * before / after the call.
+	 * to mark them as clobber so that the compiler doesn't end up using
+	 * them before / after the call.
 	 */
 	asm volatile("r1 = %[ctx]\n\t"
 		     "r2 = %[map]\n\t"
-- 
2.34.1


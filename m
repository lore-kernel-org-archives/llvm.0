Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DEFA20
	for <llvm@lists.linux.dev>; Thu,  1 Dec 2022 19:10:47 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id r19so2110687qtx.6
        for <llvm@lists.linux.dev>; Thu, 01 Dec 2022 11:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8lBn7HA8s73zkhGBNG3m4Sb/6k6XYlgLSYhUWX2vb1I=;
        b=R1N6Q+6EHAvFNQV7/6IZX3Aixg6UnmIt/9PjjzdEbOApqMebnO6IX1H7Mb50Gm02gz
         VXdj+LWNboN0dcXgELaAg69k6+dZ4o68EkPz+PyNYIIo2VN1SQo89z8JZtKnvL9057it
         leOaMYglJnV+FUMHAgoarShMntNo1M1DLtf34CvYeOjRmsXWyjkoZFYOM570hcHsHqGJ
         xpMlzjuNgXuC0ILwBMhTPAsg9vA6a7InK0DJmlHmuCPCY8GgUKwob5zyBYaJHdTKBEF1
         6N9919eAfx3ZqrhGhRfecNzr7v13/YbmRVEyYbhbdqqSc1SX6k+JorAXSrFE3d5DDvMd
         3EIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lBn7HA8s73zkhGBNG3m4Sb/6k6XYlgLSYhUWX2vb1I=;
        b=t+DHoBEHaenkIFgI/3c/O/MP9XIY2qlGNwHRkBvnG0a0Sy5kCm2ThmpIettW+aOSq9
         n/P3SJpynS2mWVnv0oCTdZ7lf8pwOsYmxFbV6YrBxuIqQGmKVM+ZuYDwn6uvoTdM/zeC
         gdUmapbe5xtRkp7O8hTskUzoA2GTlCz0TJi4O1hBY+Yz/rMUbRyUPzrEd7QIsRAnLXEK
         EKl3b4bwL1vlFHkqtygZABKENpD9KXU0lR5tkJA/fdCr8wBq+cPxLWfRvuDorxVssam3
         LWpJmcMKM5h8kLHiyPq522U7w9JR/0sHT8gVcxssaUq6vjdmVCM3xOqYu5t+Y95+wlE6
         QAAw==
X-Gm-Message-State: ANoB5pkOqrNEP5FvT+s9806/ju+MRs5IbusK9gcsrdia+6H89RHMEVXc
	D6aUwBnNNhLzhcMG+Yd/2/w=
X-Google-Smtp-Source: AA0mqf4KtmNIsiq/zeXOvH+tkCJJ6Gmy0Ia5DiailXwqblPE+ac8gkWv7sEJwtKzv1A5t2Ns4XyLOQ==
X-Received: by 2002:a37:be45:0:b0:6fb:f7a0:987d with SMTP id o66-20020a37be45000000b006fbf7a0987dmr48096466qkf.191.1669921846406;
        Thu, 01 Dec 2022 11:10:46 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net. [71.33.132.231])
        by smtp.gmail.com with ESMTPSA id bs17-20020a05620a471100b006bbc3724affsm4006972qkb.45.2022.12.01.11.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:10:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: bpf@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	"Jose E . Marchesi" <jose.marchesi@oracle.com>,
	David Faust <david.faust@oracle.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] selftests/bpf: add GCC compatible builtins to bpf_legacy.h
Date: Thu,  1 Dec 2022 12:09:39 -0700
Message-Id: <20221201190939.3230513-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bpf_legacy.h header uses llvm specific load functions, add
GCC compatible variants as well to fix tests using these functions
under GCC.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Cc: Jose E. Marchesi <jose.marchesi@oracle.com>
Cc: David Faust <david.faust@oracle.com>
---
 tools/testing/selftests/bpf/bpf_legacy.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/bpf/bpf_legacy.h b/tools/testing/selftests/bpf/bpf_legacy.h
index 845209581440..256c2a90aa20 100644
--- a/tools/testing/selftests/bpf/bpf_legacy.h
+++ b/tools/testing/selftests/bpf/bpf_legacy.h
@@ -2,6 +2,15 @@
 #ifndef __BPF_LEGACY__
 #define __BPF_LEGACY__
 
+#if __GNUC__ && !__clang__
+/* Functions to emit BPF_LD_ABS and BPF_LD_IND instructions.  We
+ * provide the "standard" names as synonyms of the corresponding GCC
+ * builtins.  Note how the SKB argument is ignored.
+ */
+#define load_byte(skb,off) __builtin_bpf_load_byte((off))
+#define load_half(skb,off) __builtin_bpf_load_half((off))
+#define load_word(skb,off) __builtin_bpf_load_word((off))
+#else
 /* llvm builtin functions that eBPF C program may use to
  * emit BPF_LD_ABS and BPF_LD_IND instructions
  */
@@ -11,6 +20,7 @@ unsigned long long load_half(void *skb,
 			     unsigned long long off) asm("llvm.bpf.load.half");
 unsigned long long load_word(void *skb,
 			     unsigned long long off) asm("llvm.bpf.load.word");
+#endif
 
 #endif
 
-- 
2.34.1


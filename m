Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B44749A
	for <llvm@lists.linux.dev>; Fri, 17 Feb 2023 15:18:46 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id r25so2404270wrr.5
        for <llvm@lists.linux.dev>; Fri, 17 Feb 2023 07:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GHpElbdT8yGvO2G+2wK7hH12e2y8DO+zHXf7OVoJ8YY=;
        b=Xw/ILqWdiTi7Y5ML8FZgvK/UJFdWtP/qoxwRrlczOKWdxKZ3ltZr09E7i7Kb6hx3pg
         CwaTCoeenVJmC58suWT4k7NVsQCIPpNt6mwkWd6wlcRVqP+3xr/wF+u8asvJYhM8SHCH
         Y+ExaTAObLFUuT0b0f1DMpW/t+f20533EBThc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHpElbdT8yGvO2G+2wK7hH12e2y8DO+zHXf7OVoJ8YY=;
        b=QYjH7xHc0jDpibvU4w0OBdaYh6Dui/T+LA08HMD1uBoHLHyKC6yBFlPOY7kLdZlqiW
         BJb36bpAsy2TyIjsSySOLLkYo8J9f1dMEVvxEchEoJrQ/4Hg4yaeMz2ECde1bUWjUWzq
         X5E/gt3vPjw1za0v3K6L0IK/YB+kOCnbjcpW1c0UxicppxBFz8SWSPKl6VG+5gh5AiGQ
         rpEwFCzdzDehUPwJ9UgzkEa49A3K8kRgr4iM04TVZPS44MYFqTtdJV3Zm/ZJNxfVpEyn
         SKtFLtu0YT9O44kzpVryz/z82rqE5L10RMBGI9LxgjTOySxFoESsubnsKKAL6G2161Db
         5okA==
X-Gm-Message-State: AO0yUKVNj3wc26ksyxCQ/VVZ9HbgjZP1FcycJgqyS4ReGcthXjSL0WMe
	gVgTrBYIgiDlTi1M+XJ/eCMnfw==
X-Google-Smtp-Source: AK7set9HOYCXPZnIl+FQkYUmovMzzNM5k0/e/5wKgplxSmbKJ77s6EqPKIFEntOkCwkD9eyurmqsYA==
X-Received: by 2002:adf:f646:0:b0:2c6:e87f:f19 with SMTP id x6-20020adff646000000b002c6e87f0f19mr1491310wrp.57.1676647124414;
        Fri, 17 Feb 2023 07:18:44 -0800 (PST)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:1704:c044:3b31:aaca])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c229a00b003dc49e0132asm1166420wmf.1.2023.02.17.07.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 07:18:43 -0800 (PST)
From: Florent Revest <revest@chromium.org>
To: bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Cc: andrii@kernel.org,
	mykolal@fb.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	kpsingh@kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	Florent Revest <revest@chromium.org>
Subject: [PATCH bpf-next] selftests/bpf: Fix cross compilation with CLANG_CROSS_FLAGS
Date: Fri, 17 Feb 2023 16:18:32 +0100
Message-Id: <20230217151832.27784-1-revest@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I cross-compile my BPF selftests with the following command:

CLANG_CROSS_FLAGS="--target=aarch64-linux-gnu --sysroot=/sysroot/" \
  make LLVM=1 CC=clang CROSS_COMPILE=aarch64-linux-gnu- SRCARCH=arm64

(Note the use of CLANG_CROSS_FLAGS to specify a custom sysroot instead
of letting clang use gcc's default sysroot)

However, CLANG_CROSS_FLAGS gets propagated to host tools builds (libbpf
and bpftool) and because they reference it directly in their Makefiles,
they end up cross-compiling host objects which results in linking
errors.

This patch ensures that CLANG_CROSS_FLAGS is reset if CROSS_COMPILE
isn't set (for example when reaching a BPF host tool build).

Signed-off-by: Florent Revest <revest@chromium.org>
---
 tools/scripts/Makefile.include | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 0efb8f2b33ce..ff527ac065cf 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -108,6 +108,8 @@ endif # GCC_TOOLCHAIN_DIR
 endif # CLANG_CROSS_FLAGS
 CFLAGS += $(CLANG_CROSS_FLAGS)
 AFLAGS += $(CLANG_CROSS_FLAGS)
+else
+CLANG_CROSS_FLAGS :=
 endif # CROSS_COMPILE
 
 # Hack to avoid type-punned warnings on old systems such as RHEL5:
-- 
2.39.2.637.g21b0678d19-goog


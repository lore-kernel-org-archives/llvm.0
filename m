Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C382F257828
	for <llvm@lists.linux.dev>; Sat, 15 Nov 2025 22:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763247419; cv=none; b=t5AVu5urupJuZK5M8/b55Zj+ymCV2aAO/+L2UNXtHSaZVz7rkFvnhsr8DIxeuqQfq7Un4lXVTEVm9Owo+IIVWX4FyO6bFJ4efsrKnsGrPPSLEv36cgA3775eph0i0TcA1/ePnApmGmodjGkSMQU7U5VJmaYQyiGbQtInGFDyXag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763247419; c=relaxed/simple;
	bh=r6WDjhpIq3Wd/J0Y+qOKRxylI1swOi5e1ZWkbyl+O9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tSj6MUmkYDkKaYMBBnyBNIBclvHldFYNmfKpDOJBo3wl6yGLnoiAd1NgRbKvtYKRori9GMQ9yH36MNiJjVkThlHUfDq9RsQQuH8rzVi+bBM/W9eY2cdGiE0e6Rb5s5gy8MWCSF2RIViQc/EFUaqxhscmVTOaRIgglB5TGTNieco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dhpj69+9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dhpj69+9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so34782975e9.1
        for <llvm@lists.linux.dev>; Sat, 15 Nov 2025 14:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763247416; x=1763852216; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoQmqXz6sGsQU+5pMM6WGkJhNb0pQ0+RIfWOvYniKT8=;
        b=dhpj69+91vyBJm4ohJOXty6dngMzIWMzWemJqM87ycIKqu3PdusMgJadwV8PuUxOMV
         bAOof0jj1GbVi/p0dvSE0meJ3sXXjZM2kdF2IINI3uqG5ke4pqtzN0diaWA+lUTdIWaE
         36OSQRBrRpDuliIQFGjqE+wcxI5arkrMD7PZvVFS7QO3lIq6sCR4n1yfzy3BdhkU6k3y
         GyrUUp8tPKp0crfM8WiQ2PKaxbc8tLtPp0nAe/kaY/LrKw/Rg1ckRhZ7hah/hlNKWwWU
         x+/vSafZ1K1dgrMMVcHUiqIyJ//4Alu1DJaTftgMWn8xxg3Abn8Wfxk8Gg4CiDsxvDMq
         XUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763247416; x=1763852216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VoQmqXz6sGsQU+5pMM6WGkJhNb0pQ0+RIfWOvYniKT8=;
        b=xOzORfOMxHpH3YMt7HzHbq53hFGiR0WwuuJWvQMrTlq3If5MLG0276r00cGTsOjtEG
         /38TtyVnuSnpIiC5w4pL/r7pSeuqOY7VWz+q0qZNW5mqhLC0QQKiHbTfGpE/8tD2YneA
         JVG38wvTO8koNoLnzgoltD62Lh8tGr2ZutFxHiLbT1YLa6brQyeG5bsc6aL502Z3nlTR
         vPvvkJGoOIW55Ppfqhz+PVFa9fyk16P5+6/Ek7TtSMxCTlousImWFYnaGD3T6SMXU9UP
         3B7s9wjdB8KX6aDSOgJ3vghYZkg5x/T91z1Nvk0oG0obvAp7jDVBTjQYOhCemesCpZs6
         7LQg==
X-Forwarded-Encrypted: i=1; AJvYcCVTNnb3R+N/KRiuyIcqgvMB16UizILrL9U0Uw1YtbHNBEhSZuu9SR5gUlSAayAel/Xsjou8@lists.linux.dev
X-Gm-Message-State: AOJu0YxQXLzguqmyCcEpvwpI/QsHwuHj0oPfkcr9ks6sGUzFSBgxi4S1
	NHX8UhKLzz+jb1AwtTpVJrZMaT3o61/dDmWz1bZuXnTUBsThdAfxR48XgwyX1QouSX0=
X-Gm-Gg: ASbGnctJabelugf05AFY4rRVnHvMzU7RsDezpxnMcDJM5wu7EK7wsdLk03n9sT/mksL
	79ttflnGm4J+WAgSkS6zqFFTPR/2EQRkW534msxBKeH2jUiSoXWBTrWxqtJymK7+joyCIPDrQ18
	2fvNeH/6SVSVIEir6Zz7HHDoNF/C0pURewkJhA9tYmA+cSH4DEdk5t3FiXqkGkP+Dzw6lcqxzrz
	yWFUsyH1Tzx8lsasAMBlwcFxwOoEErybhuD8cUZBZel2/YnzTMBT/pMFwPo5GU7H0euOfSM/kbr
	YErbSjB0dsGeFEr8pkkHsFUCTnvV+V33tj++jUzp6puctVNpl9gcGMJ1Ge1IVSwET+MG5xEv3st
	XDL1nh5R/9kp4ZeFEAOkAzlG7JnjUjmu+nIbraWB1WWXgLvPnyMnt3fBSEpDfXg2wuJEkPbL1/A
	IGRtxyFF6/FukOJ0FK453mLfLrh9HmfKjTVNeO7sSYQ/Tz5rOSkA==
X-Google-Smtp-Source: AGHT+IHzTCVjlD7bxRYPCcVQyJMUetvvQL/GhvoPlqWuHIenUBMbxrAsm/jIQ3IT68GtJnvxF1gisQ==
X-Received: by 2002:a05:600c:3b19:b0:471:989:9d7b with SMTP id 5b1f17b1804b1-4778fe95fe2mr74546895e9.21.1763247416137;
        Sat, 15 Nov 2025 14:56:56 -0800 (PST)
Received: from F15.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ba1462c605sm6641971b3a.21.2025.11.15.14.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 14:56:55 -0800 (PST)
From: Hoyeon Lee <hoyeon.lee@suse.com>
To: bpf@vger.kernel.org
Cc: Hoyeon Lee <hoyeon.lee@suse.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [bpf-next v1 5/5] selftests/bpf: propagate LLVM toolchain to runqslower build
Date: Sun, 16 Nov 2025 07:55:40 +0900
Message-ID: <20251115225550.1086693-6-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251115225550.1086693-1-hoyeon.lee@suse.com>
References: <20251115225550.1086693-1-hoyeon.lee@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The selftests/bpf invokes a nested make when building runqslower, but
LLVM toolchain version (clang/llvm-strip) is not propagated. As a
result, runqslower is built with system default clang, not respecting
specified LLVM version.

    # LLVM=-21 make -C tools/testing/selftests/bpf
    ...
    make feature_display=0 -C /bpf/tools/bpf/runqslower                        \
        OUTPUT=/bpf/tools/testing/selftests/bpf/tools/build/runqslower/        \
        BPFOBJ_OUTPUT=/bpf/tools/testing/selftests/bpf/tools/build/libbpf/     \
        BPFOBJ=/bpf/tools/testing/selftests/bpf/tools/build/libbpf/libbpf.a    \
        BPF_INCLUDE=/bpf/tools/testing/selftests/bpf/tools/include             \
        BPFTOOL_OUTPUT=/bpf/tools/testing/selftests/bpf/tools/build/bpftool/   \
        VMLINUX_BTF=/sys/kernel/btf/vmlinux BPF_TARGET_ENDIAN=--target=bpfel   \
        EXTRA_CFLAGS='-g -O0  ' EXTRA_LDFLAGS=' ' &&                           \
        cp  /bpf/tools/testing/selftests/bpf/tools/build/runqslower/runqslower \
            /bpf/tools/testing/selftests/bpf/runqslower
    clang -g -O2 --target=bpfel -I/bpf/tools/testing/selftests/bpf/tools/build/runqslower/ \
          -I/bpf/tools/testing/selftests/bpf/tools/include -I/bpf/tools/include/uapi       \
          -c runqslower.bpf.c -o /bpf/tools/testing/selftests/bpf/tools/build/runqslower/runqslower.bpf.o && \
          llvm-strip -g /bpf/tools/testing/selftests/bpf/tools/build/runqslower//runqslower.bpf.o
    /bin/sh: 1: clang: not found

Explicitly propagate CLANG and LLVM_STRIP to the runqslower sub-make so
that the LLVM toolchain selection from lib.mk is preserved.

Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 1 +
 tools/testing/selftests/lib.mk       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 34ea23c63bd5..79ab69920dca 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -306,6 +306,7 @@ endif
 
 $(OUTPUT)/runqslower: $(BPFOBJ) | $(DEFAULT_BPFTOOL) $(RUNQSLOWER_OUTPUT)
 	$(Q)$(MAKE) $(submake_extras) -C $(TOOLSDIR)/bpf/runqslower	       \
+		    CLANG=$(CLANG) LLVM_STRIP=$(LLVM_STRIP)		       \
 		    OUTPUT=$(RUNQSLOWER_OUTPUT) VMLINUX_BTF=$(VMLINUX_BTF)     \
 		    BPFTOOL_OUTPUT=$(HOST_BUILD_DIR)/bpftool/		       \
 		    BPFOBJ_OUTPUT=$(BUILD_DIR)/libbpf/			       \
diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index a448fae57831..f14255b2afbd 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -8,6 +8,7 @@ LLVM_SUFFIX := $(LLVM)
 endif
 
 CLANG := $(LLVM_PREFIX)clang$(LLVM_SUFFIX)
+LLVM_STRIP := $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
 
 CLANG_TARGET_FLAGS_arm          := arm-linux-gnueabi
 CLANG_TARGET_FLAGS_arm64        := aarch64-linux-gnu
-- 
2.51.1


Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A9C3064BB
	for <llvm@lists.linux.dev>; Wed, 19 Nov 2025 04:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763527095; cv=none; b=XSSE+1FtlA8lIH74YMCuciqXwdNVpCBByag3TEeonDt6hBlJicE3h5/ty13MjGGh+IWJePva8peWw0oZKXMFbOAWK3NDHPk2XR0/wWvIfseVPGvE/1SPUDaSQoD28YtCM+TBn3TXik9LT0RRpAY5AEzk6T3WjnzFuKmWxA3q9o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763527095; c=relaxed/simple;
	bh=C5jSsTgvkALL9ejzqmPQgB6rWH7GZHKRGrQ29813rEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PTmlfZsYvQFP3yUW3Ul467BTFAHdzEM0GyUF08VyBTrdJA5z3r2UHdDhPnBnDc5mZXxHBQJbc6BsrkqnXslffdljD7REO5t6koYhxQNVrpZO5CytSz77DoY1TUbe7o98nuQotiKdQl1odTbJHVr0eS+FW+h4LBdxCFqaGno6XbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NwBkzJT7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NwBkzJT7"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3ad51fecso4516522f8f.1
        for <llvm@lists.linux.dev>; Tue, 18 Nov 2025 20:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763527091; x=1764131891; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=013VvflcLvdlThJ17BkVnV7aFyDVxc9/Iz9Z2M21yQ4=;
        b=NwBkzJT79ew5IbtpLKEutYjgG5TS+M73VvQ529t3rvtrHb5QNah5BuhnoNK2AtvB0g
         YZUtBawukMdypbuN+UO0i6xT5Rqgeu/8qSGiQjbSrUM/fizzb8rjB21o4qO4Btc9cDZ/
         yn9fFrSo8x3xb2lVSPBfU1ZlTR2uuhPDhu7fR4GmEPG/a3pFT4sx5tvixv04tfchUrrW
         I2XQDsmqf/5TJfLquuFQtx/jKaVYn5AbO1JPP8j+MtcHBnHA/KRQH0VIGcSkOrvliA+r
         MTYQh4DThfqyK+QRFGIHfj7yQI9PUQouP159quIis6p6bbXZ6E64t0xQeTCpFO41318P
         Q1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763527091; x=1764131891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=013VvflcLvdlThJ17BkVnV7aFyDVxc9/Iz9Z2M21yQ4=;
        b=V0aYIZezeRj0Cl9AORkt4lbwVwDyKoGwlY8RaMRwNHcw2kuEcMfOqo5efTkCXDvPJq
         RmF0qUGfnVZFiGVlKWaRy2fOcuHK+LqdxD6wJVff4hwrnhqj0Hcnu64/VFVOpg0KOJA1
         wrCldZF7dI/UDU4aO8oNJWyR66fHaXZ3BynfYmyrmaulVxSMSTLSVsNyUeWIRWBISR2T
         Uzj/EK8Qd+qLZszcEwknQ9ltKvO/bpth+QCi5s8f2ofcFOjJ1+0whbalUXCK6jZD0N6n
         HoBTmsHnQnTn+ev0cV+3bHnTxiI1PL3V9LsOxhVdnxyYscnbaXmZCVodeLiMMlqAg9gz
         673A==
X-Forwarded-Encrypted: i=1; AJvYcCXOBW7q4hSfFsy2mrAaQK9Baesj8kYGP3qiE9xqYfdLZg5vIZReqaGxh0bNUjlbhfvltGSP@lists.linux.dev
X-Gm-Message-State: AOJu0YyHFa8XPybMIX7KGUy/1E2trj485HHiDhFM7EVSZ/EINwJmlG8Z
	LQ3xAj8LZ/mN0uYYOKJfQ4pAmvh2au3Wo8eln9jOSnwnYchp91sKmXdEL2z9eTTDtAA=
X-Gm-Gg: ASbGncs5BceHr6lcWxNtWzlx/iozGam7MYAshftkpo7LwWmtPMv3KJkvKQQRfgtPXxS
	xjy7giunHfO56fItI5BEDxsr7wCMvzSEtySfSE/OY1HKzOmM+vuAPDe/EiNczuSDYHPQ6Smv/yH
	9AsVeb3v1XuHBYNz+DPj62Lzy/mGkiKqqXSMjmWwSZtX7zWBNsZqBM6ILh1YC/q1LAukPqBydL5
	NCAdMKyt1Fj22idpUzs1TeD/pn1zRgFaj4o9XIcjaNjUamlnEzxZLrv/Y9o75Vaw4uIZ9Swzj9W
	yMYQ2nnfQh7B9TXCfuB7TDctr2iQhyz5Ikhsyv9Gh23ua/b5dLON6wjdom08KiJTVRCqL0nV855
	y62s5/ddqUK0Fz0Js7VfVsLj+twkFjnQlyK3b4wRlu6iTgn3OiX/dtgoxgEHnCDO38HDqG7ZTWo
	g/ClkW5OOWUqravS6egqLNxjQg8ji2qM638VFnZYh9YmOKRdDX/MKsaQk3Rev+
X-Google-Smtp-Source: AGHT+IFgiHdEgYchAFUbIZ5BWc3G8XCUjTmDiMfuGUz/BhBLX64rehASsPYNXoMihhYrAXRp+ZdMsg==
X-Received: by 2002:a05:6000:230d:b0:42b:2dfd:5350 with SMTP id ffacd0b85a97d-42b5939e2afmr16870012f8f.56.1763527090754;
        Tue, 18 Nov 2025 20:38:10 -0800 (PST)
Received: from F15.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf1ddsm192241165ad.92.2025.11.18.20.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 20:38:10 -0800 (PST)
From: Hoyeon Lee <hoyeon.lee@suse.com>
To: bpf@vger.kernel.org
Cc: Hoyeon Lee <hoyeon.lee@suse.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
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
Subject: [bpf-next] selftests/bpf: propagate LLVM toolchain into runqslower sub-make
Date: Wed, 19 Nov 2025 13:37:39 +0900
Message-ID: <20251119043739.1860428-1-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The runqslower build invokes a nested make, but the selected LLVM
toolchain (via LLVM=-<version>) is not propagated. This causes the
sub-make to call the system-default 'clang' and 'llvm-strip' even when
a specific LLVM version is intended.

    # LLVM=-20 V=1 make -C tools/testing/selftests/bpf
    ...
    make -C tools/bpf/runqslower ...
    clang -g -O2 --target=bpfel -I... -c runqslower.bpf.c -o runqslower.bpf.o && \
          llvm-strip -g runqslower.bpf.o
    /bin/sh: 1: clang: not found

    (expected: clang-20 and llvm-strip-20)

Propagate CLANG and LLVM_STRIP to the sub-make to ensure LLVM version
consistency across all builds.

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


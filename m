Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FF8322527
	for <llvm@lists.linux.dev>; Tue, 23 Dec 2025 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766479444; cv=none; b=PES9ixNZPYLpOFVMYkEF/0gV/V7naGDwE0mWvm5I5GwyjlWNDOljF//UalW5ZXTxnm5WEp7gv26/Z7kXPMBw2zq4NtIDCxwOxIjhNZeggYs/jIuwCVVRGiUC2agPUu1ZCB5Spqg2kJHV8GNSPuWYBAQqfqoiAKKiXFwWvHRBnwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766479444; c=relaxed/simple;
	bh=JNcxDi8XtzEu3xbpObOr3vCN2IHmRD7IAR2ObU+ycjA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r9bu7uMENdSm83mDtqjk7bTbJmQSguxrvfLPITB4ufQa4xm70MZ3iAUjfrcJ1/RjiHQQoAI66ZvA2b3+g7BhuoAhr5vXZ/vyQslMVjWqq0p0aqAPbJpV7vZsoq2i6LhEBrBQ3fL/xKJMDYkp/3us7hkdnOQfLR4VdmE+5bxJl48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ld1oLe9w; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ld1oLe9w"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-bc09b3d3b06so2975949a12.2
        for <llvm@lists.linux.dev>; Tue, 23 Dec 2025 00:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766479442; x=1767084242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNT47R5lyHr6s83aFhP7qeMV+Nwtti6xzxLjC7+hnjk=;
        b=ld1oLe9wTXoPD0Lmd96YgzbE7vh5wlnpgu4KNxyVd4axeA3hUZeKuKCHXYnwf8t/cf
         ZtrpSXcDAYED85rWU5rBpiGmF3UFd5xt5bt9QsX7P+zM26HZM6ID9DhPuvW4f1iBtxlK
         yri2FQniMfg6oeB4f1xuPWWtaXeq4/kBJLCDZvVkv0d50TL0DA/dcIixlrEwuTRjDS7y
         0RG3xJKzJ+5ySk0nwcl1Na9RiVNm3+RHifv9gEdlz0nsIBk/vEJa42x94OVaxtMfu57Z
         8x1KsjJimJes7tBCXKXHpjscG+tNm4XWGSz1gDElbZxojafJoaB91GrpCfhew8bqqjgS
         QxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766479442; x=1767084242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oNT47R5lyHr6s83aFhP7qeMV+Nwtti6xzxLjC7+hnjk=;
        b=tBvAjoNO0LneC8uk5G4nASed8TP4jY7qNEzm55gIsxJdULtlWbWKe08CH+s+XszHlF
         hTVLBRQze1sWLygP96jjs9NIN2+ELLjBCoaIehB4A3DTNYKZ8Q+4NC2e8jepkx3DhoGh
         QDmATnyrxvVWFI0bd1U/z7D8UTvOGNoNPSvb8CKbvUugontYczp7L7OCvF6Ujtz9oKo/
         wgGwdQFTlmkuw93wStkRPFvfEIHVgtxfTjxw4CcYoJezhOf5KSTvg2Z0HrwIGjjGbfch
         auBgG9SfB5cosQsDk3mqUcrJ+ZYq4gmDve2VQRzlO2gH+K1n5Tj+dH20Gdt1kz5lg5jw
         +VhA==
X-Forwarded-Encrypted: i=1; AJvYcCWZiLgh8xTVyzEpD8Pm2dqVO20qLUmJ3EZgjEnOhSrmhxMbbkHlcdbBUfP+VG0bFkU2VLyT@lists.linux.dev
X-Gm-Message-State: AOJu0YyIN5dHM9HucFB4EcK0vKxkPCTzssi06PWxfQ64h30gWs5odF2y
	EZ4O9O4jd1vCFIRnxxft1FD39K07TVCbLmpaf7h2Nh7uMnISHCsLmyE8
X-Gm-Gg: AY/fxX4PUvisJjxhVxgebruja3cYXn6HKzaWwPwMEKGQqidfazDUzsT5b9zR/JdQ0GB
	dz1oiUfwEGTYVKSi3k0ZLmhAgLBabfULbq0ThOVCxSCAeZNZNJfinzjCsE0/+GasaR4r9LioyD8
	svg4jdX2yzOIHVRueRvZTJQs7TFgg9H/3vlAu+cvEkW3YQ4flVMxUAmEeg0/5KibV7sDne+wxdY
	hQqW2axg2uOmobtKe8fPm24hFILWT7dsHum7MFwDoxlFh0lMDpfOtXBA6Oc6RBgPouX29nB+h3K
	XYlq+cdeywTcRdvFG0loMC3pceaKxB8vwKbRW5mg6LbmzXrUCYcs2ZXGFAnsB4xtJVZzEejtE+Y
	XsgJN34B8GwGE0mZwX8d+AcKv0x48JRNL79VpwAWO/dmUI3Sylb4g+41i5EPfZAhT1bqUu1/ODV
	jEAIz3YKVfXt1AixiXqEExNXeOGw==
X-Google-Smtp-Source: AGHT+IHYU+Os1x0yRwca4Pe17iWLQntYr4tzo/e2hIsHQnCg2+Cy7uhXYlQBCpFNDm7a2HU6WuZDfQ==
X-Received: by 2002:a05:7300:50e2:b0:2ae:5b2e:9d45 with SMTP id 5a478bee46e88-2b05ecb39c4mr10097700eec.38.1766479442294;
        Tue, 23 Dec 2025 00:44:02 -0800 (PST)
Received: from HUC.. ([149.34.251.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254c734sm56720887c88.13.2025.12.23.00.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 00:44:01 -0800 (PST)
From: hupu <hupu.gm@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	hupu.gm@gmail.com
Subject: [RFC 1/2] perf build: Allow passing extra Clang flags via EXTRA_BPF_FLAGS
Date: Tue, 23 Dec 2025 16:43:34 +0800
Message-ID: <20251223084337.3789-2-hupu.gm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223084337.3789-1-hupu.gm@gmail.com>
References: <20251223084337.3789-1-hupu.gm@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for EXTRA_BPF_FLAGS in the eBPF skeleton build, allowing
users to pass additional Clang options such as --sysroot or custom
include paths when cross-compiling perf.

This is primarily intended for cross-build scenarios where the default
host include paths do not match the target kernel version.

Example usage:
    make perf ARCH="arm64" EXTRA_BPF_FLAGS="--sysroot=..."

Change history:
  v5:
    - Update commit message
  v4:
    - Apply EXTRA_BPF_FLAGS directly to BPF skeleton build command
      instead of modifying CLANG_OPTIONS
  v3:
    - Move the variable description comment to the top of Makefile.perf
    - Update commit message
  v2:
    - Rename EXTRA_CLANG_FLAGS to EXTRA_BPF_FLAGS
    - Update commit message
  v1:
    - Introduce EXTRA_CLANG_FLAGS to allow passing extra Clang options

Signed-off-by: hupu <hupu.gm@gmail.com>
---
 tools/perf/Makefile.perf | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index b3f481a626af..8b8647fd4f41 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -35,6 +35,9 @@ include ../scripts/utilities.mak
 #
 # Define EXTRA_CFLAGS=-m64 or EXTRA_CFLAGS=-m32 as appropriate for cross-builds.
 #
+# Define EXTRA_BPF_FLAGS="--sysroot=<path>" or other custom include paths for
+# cross-compiling BPF skeletons
+#
 # Define EXCLUDE_EXTLIBS=-lmylib to exclude libmylib from the auto-generated
 # EXTLIBS.
 #
@@ -1250,7 +1253,7 @@ endif
 $(SKEL_TMP_OUT)/%.bpf.o: $(OUTPUT)PERF-VERSION-FILE util/bpf_skel/perf_version.h | $(SKEL_TMP_OUT)
 $(SKEL_TMP_OUT)/%.bpf.o: util/bpf_skel/%.bpf.c $(LIBBPF) $(SKEL_OUT)/vmlinux.h
 	$(QUIET_CLANG)$(CLANG) -g -O2 -fno-stack-protector --target=bpf \
-	  $(CLANG_OPTIONS) $(BPF_INCLUDE) $(TOOLS_UAPI_INCLUDE) \
+	  $(CLANG_OPTIONS) $(EXTRA_BPF_FLAGS) $(BPF_INCLUDE) $(TOOLS_UAPI_INCLUDE) \
 	  -include $(OUTPUT)PERF-VERSION-FILE -include util/bpf_skel/perf_version.h \
 	  -c $(filter util/bpf_skel/%.bpf.c,$^) -o $@
 
-- 
2.43.0


Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3C5321F48
	for <llvm@lists.linux.dev>; Tue, 23 Dec 2025 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766479450; cv=none; b=iP3dszKOoChgjXhOe9HWe9Wf7/zKxrMjB6W5RVqEReB9kXNIU62+zFcfRw+0pX4srQwQnd4NqvVEApO5fgej0Wl+nfjayhcUXfiq0pZL14ieeeToiliMI31CiqqLW4RBdI5sL/uCrYcYtucXmJVN9ZFq6xLi6fcEZkY7Zxmo/+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766479450; c=relaxed/simple;
	bh=m43rCnWF6W4flnZfWPAFH2zPZg0lP1fMO8rg5+/cqio=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCX0c5hEEeN30XzY9j3pMs+f7MJZT4CE6LU9KZw1khizl1LapGwfNLx7osIwvXSliSIoOam99Aagj4y7VlvEw5rdubRnocvr4/4f47VwiLEs1nFf1X7epM9KVq1ke8FLvSSIPJLl1bxRuOirSWcqTC63CCvgfpYPSbrccPKWgvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UH0Gzm3j; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UH0Gzm3j"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-bdb6f9561f9so4691824a12.3
        for <llvm@lists.linux.dev>; Tue, 23 Dec 2025 00:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766479448; x=1767084248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYARJPf4DCJHMSVJhsQ64ZrdejW7DqNqW01daFc7LNc=;
        b=UH0Gzm3juhPjQy/3xbh4Sa00dcuWQxZXBJhamK0oCZMQ2Wqf6gZXdbrCgZib1VZVEg
         I2CCXqH2spNwBrF3h6niS3uq1DZJelfmpnTpZ1IY49dLqwOlGpzop/gfCDnsYszA4V6A
         baUFcdxpJ0ePVQVBhwFuBRNvSwi+B6dA/Cf4Zrp9UUC4EOyDJoJ0z+GNDLMSqdRVzBAd
         SxcLGFyvTMKfP1RfSYTwuVSt9AsPrSw3vgyw+n+37KEeSXXgiqtp3/Psq2R6ifYStr4W
         iSDaKAaZRBHDveoH6GmzVuStvu85Gz++fnSfUB4zue4nU3LUEG1lkYXrnyynZi/ylhz/
         vaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766479448; x=1767084248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sYARJPf4DCJHMSVJhsQ64ZrdejW7DqNqW01daFc7LNc=;
        b=ZG/SUWJnhKb6J8v8VcLtKfCKWsX6t7vIjcWCFcTjWWQKQ30NisQQliPckl3weWX5St
         0PwfFrnCsryFAlQz7UB+qe1bFHnXC175aFY1KDEWUH8Kxv58EkXZVVESxbLLLtiraOAA
         YXJCj2K3j5VlEVdw9FBcUDtPw1ak6L4SZgh3Lus1bhP7lHBY9YN9KHY73a2bkwBk7g6Y
         Q6pGaWS8BWgOv90F8zhUZi0erHjI+ABraQ4GhGV2jlCBq14DMyqXuxdDyu/FdIAF/oel
         8Na+I/wCRiga9cm67e6O9qw/EIJeoVCqgNs/I4jjVF3d/w6q9/fDbcYwgvlUwqoBU3Bt
         ladQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYlkoAzK5dDlaJkK2VPqmc8Dz1jTThQEKFyUrLZsQrXilCc4AV3R8Q7oX7WJXH9vKySU6w@lists.linux.dev
X-Gm-Message-State: AOJu0YzkhRj+BcblSwHR5BfM/1RQHjUxnYj7qPPkZNdYaJP54hdaoeiF
	R9Yz10Cv5fvDfGpuFWphGSukQwbS3IPY7f37THqp5jLhTx2GldWn7JGA
X-Gm-Gg: AY/fxX4747hp/8QCfzY2DHR6FGd5t+6Okek5Y/nNZNEmQFasJ73osaCrDfkz729Y+hG
	4sa0pjN7TlP4o/xFDObVkVyPwALZtThiZo7pbIQ9vcHOqsR0XCt3Q+owrX/iazPhSTIoIlVhukP
	riMDLaCBjAzGc4AbrPjq8ydh6o23M4lODtvf7KlHHx8RsqbxS/5jKkqVkurqANSUyFSDYRQP4KP
	7Xp1Vl9kkjBMQ5hy7S6X6+BLYgKd94+bch8nIXOhW2TeD9KfMu1HQX4HabpUkBl+lux56tw5hJV
	e/XyrKbWscNPE7ZkUYAmS9kc7yW0BI9cVuHUVBN/BggG0bA43uzF9CoGkwWjEx3RFzFVKzYmO6x
	TMozhTKNjEgIr1r3wM77P/Q1WIS2DG5Qh5Vj9cfMR+E0WgoMyamgb6e7K10mMsiHTw4DJGQp/T+
	IF4FX+ewH+Voii6OoLmANTV23seIVPNZR645Vg
X-Google-Smtp-Source: AGHT+IEPBzpa+JSlltoi2sicjexlhwpONg+WQbBsfL7i+rkHPN4HgKra3RHsx7N07jEuGnZtt+CPGw==
X-Received: by 2002:a05:701b:250f:b0:11b:9386:a3cb with SMTP id a92af1059eb24-12172310ff9mr8272832c88.44.1766479447624;
        Tue, 23 Dec 2025 00:44:07 -0800 (PST)
Received: from HUC.. ([149.34.251.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254c734sm56720887c88.13.2025.12.23.00.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 00:44:07 -0800 (PST)
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
Subject: [RFC 2/2] perf build: Prefer kernel source headers for BPF skeletons
Date: Tue, 23 Dec 2025 16:43:35 +0800
Message-ID: <20251223084337.3789-3-hupu.gm@gmail.com>
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

When building eBPF skeletons with Clang, prefer header files provided by
the kernel source tree over headers installed on the host system.

While host-installed UAPI headers can be sufficient today, they are
tightly coupled to the host environment and may diverge from the target
kernel version over time as the kernel evolves. Relying on kernel source
headers helps ensure that the headers used during the build remain
consistent with the target kernel version and reduces dependence on the
host build environment.

This change adds the kernel source UAPI and generated header paths to
the BPF include list and places them before the system include paths,
while still keeping host headers (CLANG_SYS_INCLUDES) as a fallback.

Signed-off-by: hupu <hupu.gm@gmail.com>
---
 tools/perf/Makefile.perf | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 8b8647fd4f41..57c73ab98703 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -1203,7 +1203,13 @@ endif
 
 CLANG_OPTIONS = -Wall
 CLANG_SYS_INCLUDES = $(call get_sys_includes,$(CLANG),$(CLANG_TARGET_ARCH))
-BPF_INCLUDE := -I$(SKEL_TMP_OUT)/.. -I$(LIBBPF_INCLUDE) $(CLANG_SYS_INCLUDES)
+
+KHDR_INCLUDES := -I$(abspath $(OUTPUT)../../usr/include) \
+-I$(abspath $(OUTPUT)../../arch/$(SRCARCH)/include/generated/uapi) \
+-I$(abspath $(OUTPUT)../../arch/$(SRCARCH)/include/uapi)
+
+BPF_INCLUDE := -I$(SKEL_TMP_OUT)/.. -I$(LIBBPF_INCLUDE) \
+		$(KHDR_INCLUDES) $(CLANG_SYS_INCLUDES)
 TOOLS_UAPI_INCLUDE := -I$(srctree)/tools/include/uapi
 
 ifneq ($(WERROR),0)
-- 
2.43.0


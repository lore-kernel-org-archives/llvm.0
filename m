Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4FC3BADB7
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342139; cv=none; b=sWuGit9nWZM/YxJlooogyEj+hZo9vKuXP1bUa6WCsc5namkv2irGYV0zX1icbc8/3A2ds2QlhJMNOLG00UKtu2Ap2LOscL5qeF1vHd86mMMsMfF8k+6gTXdOwGleZ/fINDyVE7czvXv6jSSsba44TM9WmMuAnzNUbgdcwTHUMxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342139; c=relaxed/simple;
	bh=mEg+v7zXI0iREsRG6kydyUfkdkpuhC25e846u65Lppk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kMwV7yvpzgcQ670dv7NaWCVw5B4AnH97xZHBmoKqBTR59VxvGzA3OcsiKtxQzjcXx2tjJLO+KNzAohyURzAyyArIZ49FzOW6tO21Vba3KtDZeWXj5jD3ApjSvl3XbMZqdz6WsOARHGxijf7k2ZQkVit8NGaX/u+fMKVGRGB714s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fu1MQ1Wh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fu1MQ1Wh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b8efed61so6658425e9.1
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 05:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776342135; x=1776946935; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KhHX7gYP2RMHcZsNzdTs8ia86Fe1heXnXQrH+zN2ESQ=;
        b=fu1MQ1WhgaYPR1NP1zPZIRUhZRkmhM/ih/NE+YQbvYeTFRcw4HVEC87FitXir6SdEy
         kbvKDkpo+hBzqLy4THD2y2gWFtuPVVMn0cnBuHXiRTJ3SwJbxd4sLMa6Qjf/lxICam/8
         VQRijlh2cTdhNNrzjky4SOGMsrDRTJ1+kM3balYrZiPwysreyDAtzsSJy2imQfP0sBEO
         ZdpHkoCID0OW2ohTTaKkEjPRUbZxYiavOgI+wjmvxhdly8FmCRCFMqtPGwtnyiSjhUpj
         c6y6fjIbUUxQjLJT3Le3+/TrBmmkg57TVfW40vsygW5xD/GBIdcyXKLX+CfOMcie8nQQ
         vOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342135; x=1776946935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KhHX7gYP2RMHcZsNzdTs8ia86Fe1heXnXQrH+zN2ESQ=;
        b=FWBh32+j2HEH3zZhwDJ6isPFDiHj4LSYaHsbRKGeRXR7zNDrNVBB62VJugd9UTnN9w
         0h0llknzdZUdWm1h4e9dNUbv0UJI/3dybutQPYXzLjqVL+e2CaaU93/1FRwcyyNDzr/T
         YUcnqGC7ZB78Qj0WSdjNgzBuVZFQBa15dmfjR1/1gOgQ3Kbt3d+f7e2ETFNWaa8NJ1yK
         r/KrVtsjb3ukxvMr8SedbJiLbO1PGJgwoU6TY2P7FZM4bqvhibSdFFojMrXTcpIqSz00
         qU/WiwmmMBXMhuwFajAwLqv4lBU1A873B+vn/DtAUOLwn002e3N8cItZG9OEQAvwWQEZ
         xXmg==
X-Forwarded-Encrypted: i=1; AFNElJ+kb0lTAzfaq1eGSzFdvGRIpZZ7gVK84oESxK3J7n3h83iXUGrtn8CEIJRYlSU8FxLBnmUw@lists.linux.dev
X-Gm-Message-State: AOJu0YwGSJTupt+7fdqe90Wy6eozdfDYDzixvGNbcOmQ1bCtvrwuaogj
	GYg/VnjXcJFkh124xKxdkpbSoMJbaHUtDqXlescfCtQ2XtMFT3U9Y4O24xCndtHUPBQ=
X-Gm-Gg: AeBDiesobTKzX7PnZMHsYIgVYK31l8PLTwXYDn1HMtUr8Ib/Hkl6z9PBUgPKA3zB5c5
	syi8qZAHlsu7V+YrbtxLyNjXOAE6PVpdT8pQi2bmXubyz3kjDxOeLqIs2Kz5yHSjXvJhRXb3Cyy
	MX/MDADZprLfNAcwGDP0UjPZt5bNqyypbE3z93uNUeSIdgrLuGeyCn4kVFV+fEU+GEC4/we+XOJ
	OjZLqj8SUMl6kysrZ50Lc8jZAf0Ku9vY8mpQqSXzAt/lMK2XKoLyd0bNa8UzPuX+lEDsxZv6EoS
	bb0Z8Egxi4i2jtvSfDa8Hbugh7f8im0mCKVSUpYEDjDPpiL0BWtl3nm/PyvmJECWEs2a9j8KT0x
	snlcz/JSrjC3mIrzxESPxNQOM6T7wYBLzfRzGjTCKaWns2vPAUR38iBDL5G1svP9xXbJWunk+7+
	U6PlKFN30np2Q=
X-Received: by 2002:a05:600c:5888:b0:488:a9c3:44a3 with SMTP id 5b1f17b1804b1-488f45c02abmr34600335e9.2.1776342135114;
        Thu, 16 Apr 2026 05:22:15 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c90cd7esm8736289eec.13.2026.04.16.05.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:22:14 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 09:21:28 -0300
Subject: [PATCH bpf-next v6 11/11] selftests/bpf: Tolerate missing files
 during install
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v6-11-7efeab504af1@suse.com>
References: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1776342088; l=2151;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=mEg+v7zXI0iREsRG6kydyUfkdkpuhC25e846u65Lppk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFN3SnWDFLPzFWsuaYADh4eBzRwT7G4DD1uJJxg8KDV+Al+f/kRjZMmp78ssLgAjQOV9rrCEpue
 zdCykIU669A8=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

With partial builds, some TEST_GEN_FILES entries can be absent at install
time. rsync treats missing source arguments as fatal and aborts kselftest
installation.

Override INSTALL_SINGLE_RULE in selftests/bpf to use --ignore-missing-args,
while keeping the existing bpf-specific INSTALL_RULE extension logic. Also
add --ignore-missing-args to the TEST_INST_SUBDIRS rsync loop so that
subdirectories with no .bpf.o files (e.g. when a test runner flavor was
skipped) do not abort installation.

Note that the INSTALL_SINGLE_RULE override applies globally to all file
categories including static source files (TEST_PROGS, TEST_FILES). These
are version-controlled and should always be present, so the practical risk
is negligible.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 9e3e0a898e40..2808387b3d9f 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -974,11 +974,22 @@ EXTRA_CLEAN := $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)			\
 # Delete partially updated (corrupted) files on error
 .DELETE_ON_ERROR:
 
+# When permissive, tell rsync to ignore missing source arguments so that
+# partial builds do not abort installation.
+ifneq ($(PERMISSIVE),)
+override define INSTALL_SINGLE_RULE
+	$(if $(INSTALL_LIST),@mkdir -p $(INSTALL_PATH))
+	$(if $(INSTALL_LIST),rsync -a --copy-unsafe-links --ignore-missing-args $(INSTALL_LIST) $(INSTALL_PATH)/)
+endef
+endif
+
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
 override define INSTALL_RULE
 	$(DEFAULT_INSTALL_RULE)
-	@for DIR in $(TEST_INST_SUBDIRS); do		  \
-		mkdir -p $(INSTALL_PATH)/$$DIR;   \
-		rsync -a $(OUTPUT)/$$DIR/*.bpf.o $(INSTALL_PATH)/$$DIR;\
+	@for DIR in $(TEST_INST_SUBDIRS); do				  \
+		mkdir -p $(INSTALL_PATH)/$$DIR;				  \
+		rsync -a $(if $(PERMISSIVE),--ignore-missing-args)	  \
+			$(OUTPUT)/$$DIR/*.bpf.o				  \
+			$(INSTALL_PATH)/$$DIR;				  \
 	done
 endef

-- 
2.53.0


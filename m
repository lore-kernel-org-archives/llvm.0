Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CFB394786
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 18:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499756; cv=none; b=tZfXJIkfIgGTaTzEfIVnzTLUXO0rl6jePsye5n+ruMiYYCqZNyDlhqjeL9Es20QZXxprywFfpzOzh+atFOZ618hxvjBgIB8jlY/h7HbHyIHQxSz3nGrM2zNlju9t/JzxG47iKEs3kL4jhS3/swgL1C0nCILpFFKurf62khv3NjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499756; c=relaxed/simple;
	bh=23NdMGoa+vcqEV0jJ3meh8Gl+VeTbF/g8o0rZHbeMi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g/MNh9oPZwlCBN4U1NWb7ohUPMoi8+sqk45tygB8y3gAzyd9Ktq190yzlh/uwbTScw3YgZJ70C6SLGAHYChX6qSv7aOt+hEjZNmsuVTXFfMejPHzHDnb7z3SiJWPLIME6qs2wds4IGYG1E81vJQn7am4GDO9O0hTsfMhX59WUfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SaLOopuE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SaLOopuE"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so3366015e9.0
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 11:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775499753; x=1776104553; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FlS9hoNLxVP1THYSXUkUN3DbjIQMFidMedFjH2/H618=;
        b=SaLOopuEebT6whfRm6sXEkx5Kw8J2ePIs31iXsMdZjS2FGEVNvTI1N52/dCl6vyEqG
         dT7OXHB3JNO0NZZbuOgqlVfYyzEEMKOfH0xVcvOSwQVaYwelkAjhHbU300xT0bLf1Smp
         YOQk6NkQ0ogL+yP259bm61u1ts6tkkG3GsB3tqwolvY/Rp0lO1izCtFJ55J8zHrIAReA
         sNaTpc2/hz9qMF3uhZb5TAIdzhDXjtggRpIn+KsSeR/7H80kBPfg8IjmfFwNtycWEo+I
         UAoGZXG8ii2c7WJ/H8kykDr4fvPRY+EZjHH8g4Yk3jGdF0smBNIMu0VLZFLa8q+IEWFI
         NoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775499753; x=1776104553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FlS9hoNLxVP1THYSXUkUN3DbjIQMFidMedFjH2/H618=;
        b=CEHtX5uIIYxG3ZnsE15WUMH251KMV200uN9qHVK2kacLTaAtZLDiY7eIXeiA4K/s6T
         gQISOctO/CjIzN8YzaP7ker18DmK8w3q/mXEqGfN+Usv/vUXPYBcYmvF1/TWs7/tEdVH
         B5FMNaV2ZiNayVFx8lZ2oXFt2I7EQz/rLrVMhnQOWa7lHQb+X7rwNrnIfPt3TphS85pJ
         Mjo2xvAMeP8Vm1G3zkBTJeHcBIEtQZoYJBjgBOBDMW0mJOVfrfc6BQAHRqcJrhzXJaQu
         J9jVKtzIDVeNiKnW21cYQN/HEFeFXJ78+qNjEqNEMJKbauW0nYA20HFjlXhWVPgeyFKB
         u/SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkVrU5cSyOyh2k/rnUpo/8+Npd1UgrldiaKu5/fOPD6UUG5qcFg1pC1vdlKD/Fx6TaPWAu@lists.linux.dev
X-Gm-Message-State: AOJu0YwYTdiSA/B4UHyQ3s0eTW0sxeaRAy1Kdobo72WoW/rqwvTUQtKV
	HbFJvo/oSYw3Cb7ywnwN75DjKAKu7r7pAzRGRaNAyni3cbidRNO4feOS1e/zd+UbrbA=
X-Gm-Gg: AeBDietOR/MdvnNWTclvmiinG/uHaXwiKXGHn7rUL+u3GFwNkEhr+Wt3hXW9u1iLHd7
	AO0W1AQ74Tq9l3VEf34GhF2Ayv0TtA3+Sf4RVmnmgkeM0s7gtA5iM6se5pl/PfLIDm38SJJmcAj
	w4hGNtv1SyXVnFa9DZ3Lzg/T5oB6bcvfOtx3ECwXP/WjBbikKUGIR3jjDKO9LdkyKYmMtP6Bwzu
	AUZm0zqOIVkH0ISDX7336M6xZFCI/Bhd5GfdIKqG8NEHF1uGWoijA2Szmbyzq96upvSHghQnlV3
	ymWTBbXWHeDPX13VYAHz4kk9/XVhgKk7sQybNEsA4tzpi9/9NijFIs1lu9HUD3YQ/UWRLV1UlpR
	C2xlB4AFCcRw/WyEpZQd8gta5Le+41E7Jtd/bB+Uq3/bxPMDvzinPip6hhdvmGNextfe6IISuaa
	rmUJhlfVohgQz0
X-Received: by 2002:a05:600c:8b52:b0:486:f9d0:aac8 with SMTP id 5b1f17b1804b1-4889978140bmr217856345e9.18.1775499752950;
        Mon, 06 Apr 2026 11:22:32 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-605830999f2sm17555974137.12.2026.04.06.11.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:22:32 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 15:22:16 -0300
Subject: [PATCH v4 04/10] selftests/bpf: Make skeleton headers order-only
 prerequisites of .test.d
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v4-4-9914f50efdf7@suse.com>
References: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
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
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775499736; l=1610;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=23NdMGoa+vcqEV0jJ3meh8Gl+VeTbF/g8o0rZHbeMi4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNdZ69AfgrAyqanC50wjNZ9qTNcmG1B/46tYgH8fwNfwYd/7Lgcz6tym3xBLEo78DUawQ1CD435
 VTdS+uD6dyQ8=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

The .test.d dependency files are generated by the C preprocessor and list
the headers each test file actually #includes. Skeleton headers appear in
those generated lists, so the .test.o -> .skel.h dependency is already
tracked by the .d file content.

Making skeletons order-only prerequisites of .test.d means that a missing
or skipped skeleton does not prevent .test.d generation, and regenerating
a skeleton does not force .test.d to be recreated. This avoids unnecessary
recompilation and, more importantly, avoids build errors when a skeleton
was intentionally skipped due to a BPF compilation failure.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 781238152c4f..72f576a8236a 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -697,11 +697,11 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
 $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_TESTS_DIR)/%.c			\
 			    $(TRUNNER_EXTRA_HDRS)			\
+			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)		\
 			    $(TRUNNER_BPF_SKELS)			\
 			    $(TRUNNER_BPF_LSKELS)			\
 			    $(TRUNNER_BPF_LSKELS_SIGNED)		\
-			    $(TRUNNER_BPF_SKELS_LINKED)			\
-			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
+			    $(TRUNNER_BPF_SKELS_LINKED)
 
 ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))

-- 
2.53.0


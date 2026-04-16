Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DA53E715F
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 19:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367894; cv=none; b=REhqXy7bPEgp9JP/YnTXBAHffeiMHXYKRoI+PiDZUhENYhSpeYGr0P8GqAJ/5t34bpxDE+8WxuYvpuwPnORtsVv1yIn33E54v1Ps5oCg+RKvgrA22fAU0BsEtIGZsu0rzPg33w8fTghOwDoxbJEIIgowzsLTKtFID7R4jbGWuuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367894; c=relaxed/simple;
	bh=5U8TIbN/mzwNj1zjJeSGJwHzlD5O57QgUuewKq4KEws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=blDdVb99HbXE5R9s22bGJLYZ7BfttEGkdx4a2Kd+YwZsVBxeSSVaCPkOYsTJY5ZeK5RbehVmiKhCWDoibUMammEd8g6C5scgCcrYtCySvvNnay8718aO3nfDayWB7yokl4WDCiTXyO/RHKD4L1xM3QrVV3iWpit5t3sL8PWj2es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P7CipJod; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P7CipJod"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso9696895e9.1
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 12:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776367889; x=1776972689; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXKDU/OMVkefnHkZO//qI2CUfyjPw6Bi2G+7mqZsuYM=;
        b=P7CipJodI7cRQzORV/ed6XoqoJVOxPWri7yozdotjXjnvAdJjFtbQn91Hd3l3pjMgx
         2vctFyNXBnh6k+Y0/ggKELQOL/XxhdhrQwLfseE972rB6QgaKcsUDgIkVWr1mmjDcBMs
         HnIfMglVJV6CO+rO5/9N0P3keCDLdmK7njgZsd55fZiuph0iVti5JdNNPzjbQDAzL80N
         bB/XTaVFrcr+jeFjNwrvpqd8MoDxijCImRTL3PK3773aLn6uPNVqXCICl/kHxyYnTOCn
         jfR2fK27eQXiFSzPfax5ACrF2XZJYDZDb6fM3JVZobMkvhAOieJproBoySSiWbpsOwMV
         zNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776367889; x=1776972689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VXKDU/OMVkefnHkZO//qI2CUfyjPw6Bi2G+7mqZsuYM=;
        b=L8AXAK4Nj+tNnPUGWlMgRbdKwEkWx/8G233sa3r+0Q2AMIjeUnJhzRLAx79oQoHeWf
         e99GVWsuXaAoBGeynfMF2etZ0IMN8drSohq1MQwc0UGxrm+CIcdkLPID1ljToreQWJs4
         3848lYgiw6cVH04t2RxWXpLlVrr/10JYYliRmNVsdD68zXjUtSkZMOdUahN/SBJeU2xH
         gjwKjHaJhcng7uQP6ZMi6bfOfeI3zovAKmk+ghOULnyYqiaI1HCRmROT4GhZ+4wozO3P
         w2mkZnFJ73pXKqm0PdJZBaQlLrHX3qxm+s1OigtbXAqBrSRTRpH5C66cMoqiKpGSmGgT
         OL1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+HsJw2gjocg7DzSvaPYMIkEhGEBJWaFOwRfJBjoEjS+Bz1s/ihoPVG3o2gchiKZhmTQ6DZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzZUGz6Z97xS2lia/7b92RdkCvPEE3Rn7lt5JIznY8bXDOciZmH
	f/+eAL+UdtXa5BTYkFScFQVWBeOwt5OnEjxZe/ymlZsNlcL7rJ44WMERXYcgeJGNTtA=
X-Gm-Gg: AeBDietM1/un6Z5f7Uwq/arxkzIN7DZ7r18vg1L/4lBuAU/GK/McNuVko34ifHj2px1
	l9yZGGgLWApYF76bhKZrcHClE4egKmtSfJHHFkY/lIPvYsDn8cQ7oXvaT7c0TU0kSJDywUUuznv
	Kv2jUMVzbnr6s3NXpkM+bd9FA5cIdmLBau1B702Pb9L+K34uX7inte+dRI1h65Lvp/qTseyRW+L
	QCqdsLoUY1I8TFStS/3RpA+NyC3rhpohFBw6y/zAzhKDavCG0zNkbKjSdOBtpm5/ggGRNoEs5ZA
	skj3HYCJzHgrrDtumaqVxUq8/rO2s8WAumVtfdc5RSRHVwqYPggIkmScM4hKvj/YcM+SpNaK2wH
	JNxaJga390g0q9zEUpgKRrDjkudnfdARdnr28AM2/kvCmFvLsDzQgbQEzLRwXuU976sGUqb6Va6
	8i5W1nv3cdqK/nOyjHrMzdLSc=
X-Received: by 2002:a7b:cb10:0:b0:486:fcc7:6811 with SMTP id 5b1f17b1804b1-488fa8ec417mr5190175e9.10.1776367889102;
        Thu, 16 Apr 2026 12:31:29 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:dc8:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f6615d5sm10798290eec.24.2026.04.16.12.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:31:28 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 16:30:57 -0300
Subject: [PATCH bpf-next v7 08/11] selftests/bpf: Allow test_progs to link
 with a partial object set
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v7-8-a078e18012e4@suse.com>
References: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776367852; l=2156;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=5U8TIbN/mzwNj1zjJeSGJwHzlD5O57QgUuewKq4KEws=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QONTkF/ZR6INLgA6jIuOfO+7ACHpfnck930ufRHZ8hvwjxS8M6MclxSL84x2+0W8DdhP3yinoQg
 fJwg3i3v+Swo=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When individual test files are skipped due to compilation failures, their
.test.o files are absent. The linker step currently lists all expected
.test.o files as explicit prerequisites, so make considers any missing one
an error.

Move TRUNNER_TEST_OBJS to the order-only prerequisite list so that their
absence does not prevent linking. Use $(wildcard ...) in the filter
expression passed to the linker so that only the objects that were actually
built are linked in.

Place the wildcard expansion before $^ in the filter to preserve the
original link order: test objects must precede libbpf.a so that GNU ld,
which scans static archives left-to-right, pulls in archive members that
are referenced exclusively by test objects (e.g. ring_buffer__new from
ringbuf.c).

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 5ad50d3ff2f8..a5597e8431a0 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -758,14 +758,15 @@ endif
 # some X.test.o files have runtime dependencies on Y.bpf.o files
 $(OUTPUT)/$(TRUNNER_BINARY): | $(TRUNNER_BPF_OBJS)
 
-$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_TEST_OBJS)			\
+$(OUTPUT)/$(TRUNNER_BINARY): $(if $(PERMISSIVE),,$(TRUNNER_TEST_OBJS))	\
 			     $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
 			     $(TRUNNER_LIB_OBJS)			\
 			     $(TRUNNER_BPFTOOL)				\
 			     $(OUTPUT)/veristat				\
-			     | $(TRUNNER_BINARY)-extras
+			     | $(TRUNNER_BINARY)-extras			\
+			     $(if $(PERMISSIVE),$(TRUNNER_TEST_OBJS))
 	$$(call msg,BINARY,,$$@)
-	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
+	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$(if $(PERMISSIVE),$$(wildcard $(TRUNNER_TEST_OBJS))) $$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
 	$(Q)ln -sf $(if $2,..,.)/tools/build/bpftool/$(USE_BOOTSTRAP)bpftool \
 		   $(OUTPUT)/$(if $2,$2/)bpftool
 

-- 
2.53.0


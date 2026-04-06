Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334B3388E65
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 16:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491923; cv=none; b=SKbcUKiIX+ddv10+OlVtduri+5/sOpe9T88AVPMR6LF83GQIx/vJ8DA4QrTePLvUfN6fJwBYENS7vkSUmgGYhL7oQa+OlIMpUAoS19+XkqHJNbxSfAHzquBlBAdmVE2/iO94in7qGPZNXqNdVhUAA9NzlK4kiqYi25qPBudkJbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491923; c=relaxed/simple;
	bh=SxhjXuCfOoDBfzhpHd2FQo7WMYqlfNQJpvpfGE0Qcnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XGY42id2lD1FbBY8GU9gTV8C8AucEE03GJiK28T0AdjEhgy0Pt5PWY7xopP3pKvN7/ofBnE1piNfyM+fO6kx4tmHbxzR9k1bX2TvHFEcG4pz3y0HiUPXKbpnmGh8delc52fEx10zot/qsTFbE6JHH/LRLN1Fa2rtzfsoq8BcxS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Oh/uQACg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Oh/uQACg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso33856705e9.3
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775491918; x=1776096718; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvVbJTt2G3f5MT1ZecImKaWgr21hR9oJpCuQYknRbaE=;
        b=Oh/uQACgEg2ze6Ekk65ty0GEkVK2NkCkKHfCirpA092+UaeIpCztJUbF+qAAe+47K9
         kU/viV8xZyfUNqXusnfCQ9N2UtIoq1Fwlu0t/dY+dd2BYnK1tAgdFwLskd0o1nFTaucI
         YEbA7Q+zlGvvjc0rT2OXuYtZP9SMTnRPYdkx+bBrcw7/N4IjDqTGXdsOVq9Hnryh8Ow9
         1IaeH4akHsGdebQCo7tuk3tsXpkyxyo6zAE4TgPeAZ7M/AFSjVZevmBXWxGyTx7bkYFU
         O7uqhVFC/Dqw3mkauLNt49eJrkdmx+hbFwiEH5TV/GowmnwbE2WiJ4otkk4Qjq9HHvra
         UGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491918; x=1776096718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bvVbJTt2G3f5MT1ZecImKaWgr21hR9oJpCuQYknRbaE=;
        b=he1N+YDW3dZExzFymOwBPTsED6S+K7k2XDKStpE4PZGwaJzXAzhFfe0YV6+mknb0lF
         BZf4j1XMQkg4zHmbkucxMfLkf8MfMD20qoSRtsKYc8lUQXaaqSDaac/Xt0Moq3BBvHCD
         SAsadUfvOW3uPAUPblhiv2xoIo8XUVeQFJEuXmHQGhIrkvUitUNAzVSQr3wxF0w5I+Ee
         pRjdcdtz2MhfMIOKJ4+p8MgsQ5HojZK0O0pBIgp5LZWq+fKSXdONA6wAiOYqAysJQpoz
         nlKSDEXA9GUTIs+i/LvtuJd2BKsp2EeC+/eTpH4H6dCIyu24cye3hz8NBsvw4w/wsvvW
         eMSw==
X-Forwarded-Encrypted: i=1; AJvYcCU/y5+5pSJihoU7Kn1Iei8pm7UiYLYDEP7MIDzWlnzPORQJn3vhjLQTG/SnDEj2HRV/9LYW@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh0uNLrad2UN7YbIjZvlrt+BLUX7t29NNxJSjhj3A/dOE3pBFw
	+i4ijWqXj3YMdPW69ibpJqXJqa+NV9MaZqMgTlOXDe8MbM8QzuaDYWPWAvj2BHd3FDI=
X-Gm-Gg: AeBDietaL2fQQjgmI8msTWfqPVWM6bDyrNRW7rQ49Ms/J3HMMlwFlztA5X/vT9qEVtJ
	AFe7VbZFKK5mlyBl+rcNqc/B+CzS+H32OMATZVvbeP1OkHQbJBSMF0XoJChLBoR2sS3pSFklWUd
	1eXtd1Ll2cfq3fDMqSop0JAl+ns/8QPe2zZ7Ix3ndTxvnaah2mKwgk7obvL3qymunNsiUKVug3v
	6gLgEI0UoOwEBs1yQ4yQDFIPmtsfs9ZLjQbeR1TUwZ6FD4L4CwvqTbGhgXpQ5gpoHvGPYI+B5ef
	IsBHNI4wGJigxF4SKrdndh8le4upSY9/6Dq+jhm6PLQIzEx2twFMkulm821l8FdbIjkhlmkEaWd
	ym/tynjmui+ksmd1cwJYZstmh6757Fe2vBzWoQ5c94jydacByDhEsBIbfheQ17C2YvbSa49yQn8
	VkwPocDfftfvYhSZ8mtjttBas=
X-Received: by 2002:a05:600c:8012:b0:486:f4d2:eac6 with SMTP id 5b1f17b1804b1-4889974a310mr198214275e9.13.1775491918502;
        Mon, 06 Apr 2026 09:11:58 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582b562bfsm17283320137.0.2026.04.06.09.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:11:57 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 13:11:30 -0300
Subject: [PATCH v3 08/11] selftests/bpf: Tolerate benchmark build failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v3-8-587a1114263c@suse.com>
References: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775491886; l=1818;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=SxhjXuCfOoDBfzhpHd2FQo7WMYqlfNQJpvpfGE0Qcnk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMrhXQOPhVZEx57DEXWeTRhOLdCPBuBJxjffDgeT/GVPSwlxbq2FuHNs3JTsfnTU2Xw0l+8TPI3
 9coAEaN6I9AE=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Benchmark objects depend on skeletons that may be missing when some BPF
programs fail to build. In that case, benchmark object compilation or final
bench linking should not abort the full selftests/bpf build.

Keep both steps non-fatal, emit SKIP-BENCH or SKIP-LINK, and remove failed
outputs so stale objects or binaries are not reused by later incremental
builds.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index bfdae212037b..1e1da26153a2 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -871,7 +871,8 @@ $(OUTPUT)/test_cpp: test_cpp.cpp $(OUTPUT)/test_core_extern.skel.h $(BPFOBJ)
 # Benchmark runner
 $(OUTPUT)/bench_%.o: benchs/bench_%.c bench.h $(BPFOBJ)
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@ || \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-BENCH' '$(notdir $@)' 1>&2)
 $(OUTPUT)/bench_rename.o: $(OUTPUT)/test_overhead.skel.h
 $(OUTPUT)/bench_trigger.o: $(OUTPUT)/trigger_bench.skel.h
 $(OUTPUT)/bench_ringbufs.o: $(OUTPUT)/ringbuf_bench.skel.h \
@@ -914,7 +915,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
 		 $(OUTPUT)/usdt_2.o \
 		 #
 	$(call msg,BINARY,,$@)
-	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$(wildcard $^)) $(LDLIBS) -o $@ || \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-LINK' '$(notdir $@) (some benchmarks may have been skipped)' 1>&2)
 
 # This works around GCC warning about snprintf truncating strings like:
 #

-- 
2.53.0


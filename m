Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D17C41B365
	for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553638; cv=none; b=Co1vu+FLxkHXxH2bDUoyud+yS5SBjIVVk3FjmAzaftNju2lLQjdF5+8zM2MaAOViHsX3YgSzGw6XO8m6YCTxq8XDFoTcHw67MZXtW3qsvGxakXamjl7j2c40onDZlX6qfPG9b+OAtywPEVvnXYbOm7xXUHU3Ccgn/WpLQ3+xX4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553638; c=relaxed/simple;
	bh=g1IPrukXdfTha1L81vMX7RIO9kNQy26KDYwIrzAmnCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j8EZqUE3qXYStJnaOmksL/CwDH6UYTb69BQRywstbm1H82PV3s/tsOCpGm1c8Vrql2CPH+orWXGIm/+1+X6qThg1+uoS7XkvXvFyrVHvWkhnny+LFwqOnS9CGQd3ftEubc1xUZ1VzCT+yjmZz6jw00ax5uwO43V/Mje0F6xAN/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EqBaDjUa; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EqBaDjUa"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso6793515e9.1
        for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777553633; x=1778158433; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7/TuOwF2JlmKiSd4FRcLat+/O0pJJ7pZtNrVGAkImI=;
        b=EqBaDjUaF5FgVfN9I7QsDZ7+Cjd4dwOegUSpP9sG4wdxPGYF6+KZzCg6pnI4kCyp2/
         Ly3Wt8PDpvRwANNUmX6aaTt9kLKIqiFtdhyhndnYvtDuiXcY03Hs1Lwi6QF8R4IKB4uy
         0cJ3xcAxlILgAsnKkzyXFDFU0CjLwYPWxEyfPIbNyxCMtHie9WDxk2WgDNnhIoiImPqY
         TCWh+ljj0Z98/NKNcnc/Ub5SdEvFyVS3ZiknMpmFsvHskdE3Z2xEK4fyEYQJrA1hy5jd
         R6ThYpqNK2S6zrwKu4yTJV8EOHUcFaC2yAczu37HWTB3oJ3Yf8wLVOnLlGGqUlTcL5fV
         D7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553633; x=1778158433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f7/TuOwF2JlmKiSd4FRcLat+/O0pJJ7pZtNrVGAkImI=;
        b=WZz5pPVhNxiv5dLx1VzYDuCGZ9LJbnvx5vlx20/CzixbpxZDxRJiB42qN926/76tcZ
         OVpa+ZzRbA2vXrn+QQCWQBKZZbnwmFIvu2yXpGWkzq62K9qzXRiEPcr1aeljTb+qZfIs
         1Ac8c8mNiD28TIgwdMNSc/bX3SyVwdDHPTHpj9vhNGiq1jD+LMrxfp4RvoxrfRwxqbqo
         zQxQ740wleEIuA78hBp2u0yjU89siAsfwLDNnxKiMtiS+kEuaGAVQLkN9yO61vRajr+1
         b93RHR1RpMLcs9lpzg3VLdGzvzT1M9ItSanjLXkXim1QIvAQY/egu94SbEw6FnA0264A
         u02w==
X-Forwarded-Encrypted: i=1; AFNElJ+RI6zhpI0v5R3hcnipSJDEnEvf2vVAG9LPqutXuBLFMg4L5UK1ZD/zDKuY7cbZVDs4o/go@lists.linux.dev
X-Gm-Message-State: AOJu0YzWRHaLCcR4P7X3vV3+N1g3cgsR5D7HEpafugBi30VfFJBSMWq9
	P65MIJX3xuyQN/KbuLJsxIDGZhK+qhdvGn59gNYkYLUPE88N4u1ICjHbBnKCwwAWub8=
X-Gm-Gg: AeBDievfnm6IvyQwNZ+QoFyDPcOC7VDLjz9yNzhp853cI/5yzAi5E4VzL3/ix9DbX9t
	UifoTQ1GuS9f7HO6+Bl/FnhRjWGN3oRNisDu35pUW8qrGHfMszTS3etSDYOExzDdmGbywif2uAC
	Tfow5HoFOgB3wT6wLWV2kEFW0OsaU+FHkShyoI9U22zwqCOW2yhOFcSzCM5E1pdsbXYN6Ohylei
	g5wtsoKZREYpA4UrDFp0VPPwssK0k3O+3JeDDwipfPBAYQwBvnNk6VKR3RonfWJ5cJfKUNIUZeQ
	ip/0T8Xu+B7dfITIsmd/s15NVLafNI/zhCBBxJ6+oi0I4HhoEwPk9D5BxUZtgYaKEh6yWBMbwF3
	CtH0rtAQf2icWMZ9W3hk8y4xHD0mYIqe55TJ02XQ6+Ds5TSDpvJOade6RbOtc/u/ZLd7f0mtMLL
	eDqhXBPn1oWefb01SGtcZYYYdX
X-Received: by 2002:a05:600c:a30b:b0:48a:58ae:993b with SMTP id 5b1f17b1804b1-48a8451cfe2mr34518965e9.16.1777553632830;
        Thu, 30 Apr 2026 05:53:52 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1c07058esm8543457eec.15.2026.04.30.05.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:51 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 09:53:21 -0300
Subject: [PATCH bpf-next v10 09/11] selftests/bpf: Tolerate benchmark build
 failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v10-9-cd302a31af16@suse.com>
References: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777553600; l=2182;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=g1IPrukXdfTha1L81vMX7RIO9kNQy26KDYwIrzAmnCQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFrprJLNfF/AMQtIohJ9qwKSRFoGc3sU5lSGc2K+fLOKPKd8TPdpoBYF716d7APQ1EEWkWctrAB
 bALNYv5AqLg0=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Benchmark objects depend on skeletons that may be missing when some BPF
programs fail to build. In that case, benchmark object compilation or final
bench linking should not abort the full selftests/bpf build.

Keep both steps non-fatal, emit SKIP-BENCH or SKIP-LINK, and remove failed
outputs so stale objects or binaries are not reused by later incremental
builds. Note that because bench.c statically references every benchmark via
extern symbols, partial linking is not possible: if any single benchmark
object fails, the entire bench binary is skipped. This is by design -- the
error handler catches all compilation failures including genuine ones, but
those are caught by full-config CI runs.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index a64e822dc540..0559742137e3 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -945,7 +945,8 @@ $(OUTPUT)/test_cpp: test_cpp.cpp $(OUTPUT)/test_core_extern.skel.h $(BPFOBJ)
 # Benchmark runner
 $(OUTPUT)/bench_%.o: benchs/bench_%.c bench.h $(BPFOBJ)
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@ $(if $(PERMISSIVE),|| \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-BENCH' '$(notdir $@)' 1>&2))
 $(OUTPUT)/bench_rename.o: $(OUTPUT)/test_overhead.skel.h
 $(OUTPUT)/bench_trigger.o: $(OUTPUT)/trigger_bench.skel.h
 $(OUTPUT)/bench_ringbufs.o: $(OUTPUT)/ringbuf_bench.skel.h \
@@ -988,7 +989,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
 		 $(OUTPUT)/usdt_2.o \
 		 #
 	$(call msg,BINARY,,$@)
-	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@ $(if $(PERMISSIVE),|| \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-LINK' '$(notdir $@) (some benchmarks may have been skipped)' 1>&2))
 
 # This works around GCC warning about snprintf truncating strings like:
 #

-- 
2.54.0


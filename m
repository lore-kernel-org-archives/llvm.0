Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D491472783
	for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 16:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564970; cv=none; b=S9KXhGvjlOv2lbJa3F1qYF7lhvGU3ZWGlEFs5uoeFu/dRu3KaLPdc0a+D+Q5mPM6+hcZ0Tb2+DJe1MWCTpiM3AFrFWp+pfckvMrYByRaIxBKX2YjhTAz3Nweix4xDJjQWTogCn1Y2lMhe77bTos6UnJOjH4uo6OlsDtBR5MEMNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564970; c=relaxed/simple;
	bh=f06ir+V8MBP2SSgv5G++kXrrlxY69TYTIXZ0uOZw4tM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pi7947UJh9ip5UMxGk41zhmcJmhZGfF3FfjFlAquPhIdNpt8NbBUYq5w132ZzKipOIGvgdWkU+s2PgANuMzBk3GUFVo5LryiVOoR01bf6j0ZFOrMSNntAgm4bXdQ65RrCVeezlvbaOUGoxHAg4XeTk46KzhNoZXbIddPi2Jnesk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LXbNO5wh; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LXbNO5wh"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59dcdf60427so990686e87.3
        for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 09:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777564966; x=1778169766; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+b/4j6CY19W7q3lBMrvL6zjiFHJtdkm0lZNuDa90g/E=;
        b=LXbNO5whHb8b8H94L1Q7y+m4WMLgVFdg+QkBtADT1+gE7kphwkyUbIFRMWoUuQeU69
         /Gbz03kXqr5yTXHGMCq7PUG5Q/uh/a76S2Z5PjgOUsP8i48Bzc84jUvmUl+fBm13cqN+
         HrxeFhc6a3sXXBg5IawP97UFexu8ieI5hAHGnPyTvXKL32ygjwHxwYfgX1ZiN5NK8n+1
         HFxUBSPGCbz136eDVip+DdmJYmkfL6VmVXDPZ2n9+KmAWw3XZU+fcFLk5M5T8qGZZXVZ
         nNfeC0+LzjafvjwMHW6MD6ohjHMLsUiIhg0hjLHmTKdmj6nPB/+tDx654qPOZ3QA5qJR
         8fPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564966; x=1778169766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+b/4j6CY19W7q3lBMrvL6zjiFHJtdkm0lZNuDa90g/E=;
        b=qWLsSgqKXpvugFJmLnYFtzHh00Tj9atX3rO6/ucmY+22THW03FDZLpWFy/zBnQ1D29
         oHq+3/XbnOz01UyuQeJFVQt9X84kl8JcgSEqK0T5X1HuaE1M4wW6cAxxx+I/oho4mxdH
         0VwOCwSCKl/vZcaUIkvIsK8M0sbnGKXDNA3q466ljw3XCDfQkTiuKKh3C+IHObMZiUNc
         O89Y/DrK6Y0fz3JabzVxKp5ICmcFZ1RYmju4/trQh0KT3LGtWHc5Y/vinNs82pIGlx1v
         oGRVbRw6P6uEAOh1LuamI+C8e6DrclAJRJQ+0pG/o7Ru0Tk7W/jrAY0HtNZqRdYrZvzY
         KQDA==
X-Forwarded-Encrypted: i=1; AFNElJ/ket6EtX28tbPOoaIOVsQm4N+o34MYswnJTm0Lo7sirl7OdfkkOk80TKufmSOIG1MOJNbO@lists.linux.dev
X-Gm-Message-State: AOJu0YyVsJqZK92jKrSDbwvnf3Rb+eTlCnZ1r6BzpXk6SQGbv3GP389C
	FFCPnNj3Z1JT2sTxmaKLcP68pyoUjNFqI4N1yXeYv9KEaOBLgTnB3qlSzc0c2ur40cs=
X-Gm-Gg: AeBDievusu15FhzESDH50OK6+xey3JYKx61xEwqlosZJbQjHCI2BttRPeuhqTo9Eb5S
	t6N8FCKkRZv06H/lraviRcN+zDMJiwMtd9G+rTLHv049ZYIRR9Rh8YA4sGHV0IBXtIhOX0DQPG7
	GDZxylhAD81Mc6hjN7KPms9siahDkXzG6+xj0JJ20HpPfeqj7Ut5SRegZ42IwibJTTyGVIbZNKe
	5KQ7UdqerizFzSjBZBvT7iYWFkwTBBkcTTJOWLESckblH64Fp03RYvh3ziXCRSk7h2QKOVFUBvZ
	rsjgy7lD2rz9t57vA9UhFNeusgPO8bVyF5g7NcZc2v063UmglBRNODCZL9kV1KaZdJ5L+J7n6xD
	oXt0xjaPAvmZYeUYIgbbC138wp4yBtfLyaGFNyAAGeR0NVwGwgqMZpiG5kOORdMYX1y4ws9bvA/
	RUbRlM8BUjlAvtcNLZEDM2ni1V
X-Received: by 2002:a05:6512:3e0c:b0:5a4:19de:eb70 with SMTP id 2adb3069b0e04-5a8522d8efamr1578264e87.28.1777564966083;
        Thu, 30 Apr 2026 09:02:46 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b878317sm382791eec.23.2026.04.30.09.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 09:02:45 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 13:02:10 -0300
Subject: [PATCH bpf-next v11 09/11] selftests/bpf: Tolerate benchmark build
 failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v11-9-e11f7a8c4fdc@suse.com>
References: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777564926; l=2182;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=f06ir+V8MBP2SSgv5G++kXrrlxY69TYTIXZ0uOZw4tM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDUnUVNq+KTiBlpnlPZJH1cqaY9VAtOaYXT+y5Wn+5QoEO5ilHeYCkdfLjoxtRlU7pi1iZ/BAUz
 EoNU6VSR3dQo=
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
index 04634e6e0661..a460f2ad3cff 100644
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


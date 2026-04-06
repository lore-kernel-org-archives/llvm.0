Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA243947B3
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 18:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499766; cv=none; b=QTN8q9kKUkqAMRYaRq6UvXaNH3cSKLFhKhuQjZfrBokuw8EvJHTMYSBhLKCnG7FgvYtDuhmSahiD4ECnJbCmT70SpHTLQuCxJJDE0SvNF8iwY6FfSXW9XnYQFPCwYWxpSy0k8I9ONXjOC9qv26Gp2ZlwrF9h//H5hrA+DbkirbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499766; c=relaxed/simple;
	bh=ucptwUIJtqhx8dsrJhSQ9C3w9ScuJ0w9Y+4aIdpjm+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gG2aU0uu2T6QzO1cG/UO7gcgRhTmyiOcdDVXQDBO6Jyl0J2HzdkF29ROEARdNup/uej5GT9hPrkwIZu3G4r/8aa0hjKihYFkwacfbB+K6Uq2eNmOIQEBUm2MwQpQG6W1Jjz/7P84gmPBEFev71cnqgky0k2ngx/AHwXyltkrsHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RtSg/klL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RtSg/klL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4888244e9f9so39886625e9.0
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 11:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775499762; x=1776104562; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtaCX1T0hy3mWY06GsAlGBkN/yaFPOhiixn1CTjMhwc=;
        b=RtSg/klLL951124zFpHuxTbUIhcKCdlT0Ef/MB1twmp96FSNE/eQrhRlxb3G1DQXEe
         KkXy8Z5fIIQEU+s78I2dXzdE9Is7NF92R8K4+tbQEwGBAYT10FtaVR7ngN37AaHLsqmt
         r5VBBGtsu7pP7eo+tG0pj9cpJnML9u2DY4LoXddd2xrcdHbeHoTZMqbv0nXl47E3MFC+
         3FIcV1xX0oh2EekTqc1+ydhMJKMbS1HJP33ccxK7HTCARuLbFwIMq5oLP9eZtbeLCyqq
         Q5eHtxZSeZN05WMZMENw0ZYu9p1Dt3arqyJXh9wNkmIjxo+9pZlpQZBRTfN2wBdUeckV
         nwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775499762; x=1776104562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VtaCX1T0hy3mWY06GsAlGBkN/yaFPOhiixn1CTjMhwc=;
        b=QuHmPF+e3EhFspfXunbppyzoNfCf3tIzly8CdU36vppl1NAo3W39X+GlAwu3qRWFDx
         ZRivhOmHqKViOxp2DXOGMmRs9byGJ55OmAyD6RV5Viz1mSr5/Rwq7awKTJPJDcA2MTx7
         Vt/hKiOT9JWIFr71xzmMn7+co9qv/c6M9YMuON24CaFxJcVy/ok29fKqUNZoPRnMY9ZI
         RDocZw6U6Dk2gpLCFwoZvytkbm0RN+dNeHLFQsa33i1NrIflALnEs1MVkIaT+QNYaUN3
         jeXj7En4PCZX70hN1VeKBBZbqVy4GcEz8o0H+77spdRkptY7tPLndB+VvRQbt6KOmg43
         DSbw==
X-Forwarded-Encrypted: i=1; AJvYcCUkHrdtysw1r/UzEiGZ3Ukw8M7MiqESUjQI9NgPtvLj+cRiIyQtq/qNwOhsLkOWHTg2tyEh@lists.linux.dev
X-Gm-Message-State: AOJu0YwJZIJEqgZeUS337Lf/sQLN5kOMdZdUkP1fKSPesd0dGDXyXtr1
	/LzWiaCbO55HrSOpUYspwtUObYXuTu5fO2oN076Hxzjs43GEuGi1G+/gR3kTRCTvp2g=
X-Gm-Gg: AeBDievmPVa2BX8cnq5RYhj+upx29ZU0E2LVY+eNI38z6BT7anI0bmM0HR7qEceq2xB
	kt2Y3Q+Esz5bmoZrFeBMP9FiXFitr66EhHEBd8d9hyZGnmF1Wi/RWtTND+OYsHJeVn2o4d5CHRP
	gLlsQYdzOMQtEU2N72FtYR5/IdPVwCyNvRPA7AlgA7CQX8i5l6G3oLIVah86HgdKnLvLGPm8gaF
	qC3ysgZ4szqfMsh4EG48X6WrZVXBr5ur8+XVYxeNaHYaPb9Yy58KV4/kWncWeOwr5t+ahnVj/jy
	VRJEqpdftVFcUz74cnpwyiQu4KGOUyfXhlmrfVHCCnYKgynV4pIpnpczT3gu/pvin53IbiwBPRT
	R56RGmwzxS01lnSG8N1AwXfNJ+Hw3Nom5NktQ/bRrX3EnHuXhqk+82Vkky0SV0yFf7CecFJoDmm
	YYPIBagB/S1Qtq
X-Received: by 2002:a05:600c:c8d:b0:486:ffa3:594 with SMTP id 5b1f17b1804b1-488997a6883mr187562235e9.23.1775499762028;
        Mon, 06 Apr 2026 11:22:42 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bd2106csm17014057e0c.18.2026.04.06.11.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:22:41 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 15:22:19 -0300
Subject: [PATCH v4 07/10] selftests/bpf: Tolerate benchmark build failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v4-7-9914f50efdf7@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775499736; l=1818;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=ucptwUIJtqhx8dsrJhSQ9C3w9ScuJ0w9Y+4aIdpjm+8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHRyc3p5anKKcI/W38lb5jswVJrWqewGR0lwA51VbpiHo5xK1mR7Q68dPAHEDbiBGKp3PiIOWQz
 8yGfmpM0cuwk=
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
index a12bc9d76f8e..2b0747604d5f 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -875,7 +875,8 @@ $(OUTPUT)/test_cpp: test_cpp.cpp $(OUTPUT)/test_core_extern.skel.h $(BPFOBJ)
 # Benchmark runner
 $(OUTPUT)/bench_%.o: benchs/bench_%.c bench.h $(BPFOBJ)
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@ || \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-BENCH' '$(notdir $@)' 1>&2)
 $(OUTPUT)/bench_rename.o: $(OUTPUT)/test_overhead.skel.h
 $(OUTPUT)/bench_trigger.o: $(OUTPUT)/trigger_bench.skel.h
 $(OUTPUT)/bench_ringbufs.o: $(OUTPUT)/ringbuf_bench.skel.h \
@@ -918,7 +919,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
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


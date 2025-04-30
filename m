Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3974267B04
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035462; cv=none; b=VWePhcCB1Z+gtFrZqzu70kCx+veIICsUnJGBRZUymRgCJ76Wnd5PryuOcllkUdEtX5dqCk3C+DBcJ+IJDU2eDnaMqAAdzft3WTXMTLSZEWP8v2IFyAAQKwKLW7vY7UDaX9rACKDjNDB8Fen1tnsQdpcjdxdhfRSlU2MV4OfpdEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035462; c=relaxed/simple;
	bh=b6GEsVu9thS8iXXc8KAUQ//meHD4/cmlQIYLDMRfwN8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xk76+EHegL7A51RYTd5mwyBnDa+mHNj6MSasMovs0PNyrkj1nYaiSQ4UL3F689duiUZT/sFM3rZn6YJo1Aar9GxHP3KLrefKg14XI+rPd5LaS6ArfWm5ZdY8DK8qpxJVyZc2eJdSuydHScCXsJZ87qguezPbLULE+34fcu1vPTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PcjrmnjQ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PcjrmnjQ"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3082946f829so212176a91.0
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035460; x=1746640260; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZS2b2cmlDbxRN0eNnvdNyztXD0xddYMhm98CtrBwR0w=;
        b=PcjrmnjQO67510LMVRwX0gMUrZffesuHnK0gG4HM2L8h1H0u+W9M0OOq5CWPCVEkI+
         bpOarAK2f30CkZFJS4floaFT/Bi/6o+dFK2X8uuqYuDYG5aAnrUW+Ef/Xd7bbCGaIh/U
         QKk3PcK2IjDRURdDbw4YPtgQcBqBG3wyfRjtxeUh30WDEB+btZ/Fq0HOxDmIdEp0VzZy
         DF58+vJ0k0YaEBHleq3d+4LCbYU6hR3FHxQ4N7LebKB35vDgJDeBz4s1mkJznWAB0/40
         vPYjjjy3Hsw2HQa54nggZe8l4TMfPIuuG3Px/ECnvz42ubUQ0HdtJWMlHpMygq6YcHim
         qPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035460; x=1746640260;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZS2b2cmlDbxRN0eNnvdNyztXD0xddYMhm98CtrBwR0w=;
        b=eh7HLVpNskU1Hi53Hgp8R3Bp1L9eZJQYQOlul4FT0ioXnuwrhix64IMLCn7JPethdK
         3OPko37ACkKjCNxVIUGgCqxSe7niEYgrGJhvWFzWyOiZnNIG+v2+pZntT+qLh/k62MAO
         1uwwFBHEZ7QwScnFOjyf8OsA+03c9/86u+N4Co+TWyQ4B1vs4pNgdTS0/bh27oOEp8hN
         D8eKmsXPs0FxdS2lUsRRG6XBZgSJZ8ToFrlU2hDYxQFYoJmr422273Ui1S5rM27wVUL8
         nPHhyiOAUntacPelrMa2XvIzZ3BWeVXQivC8/yvNKzEZlWYv08/h3q0Gb4qSGkCRzi9/
         jxSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfG/0YTDf2WhnPy/1F5jAa3cqHPpz3+iV9N6riJ7cfU/I5URsB4OCSqWsrJdwlig0cpP8Q@lists.linux.dev
X-Gm-Message-State: AOJu0YzGd3z5BKVZ9QMd3AUFVIOD14XW/W9LGCzjQ6RwJPmAIyaTs0bz
	wh03BONou/mfELqd84lxV3189S7YnoCD6zXs9sgPSvUscuNeReeRuXD/ic6IQmnizVg+OIc45K7
	A7Ek+ag==
X-Google-Smtp-Source: AGHT+IG+GdkoGN4xBxp4qlm4lG1pOdHUqwoA4DsTSPMhQg5ePkqBXcq3O8r8NR9aJaDVMVUVrzPROEAezvNG
X-Received: from pjbsk9.prod.google.com ([2002:a17:90b:2dc9:b0:2fc:2e92:6cf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d606:b0:2ff:53ad:a0ec
 with SMTP id 98e67ed59e1d1-30a333073f6mr5735112a91.21.1746035460084; Wed, 30
 Apr 2025 10:51:00 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:49:49 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-2-irogers@google.com>
Subject: [PATCH v2 01/47] perf build: Avoid building libbpf/bpftool with LIBBPF_DYNAMIC
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Kyle Meyer <kyle.meyer@hpe.com>, 
	Ben Gainey <ben.gainey@arm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	Eder Zulian <ezulian@redhat.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, He Zhe <zhe.he@windriver.com>, 
	Dirk Gouders <dirk@gouders.net>, Brian Geffon <bgeffon@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Howard Chu <howardchu95@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Jann Horn <jannh@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Yang Jihong <yangjihong@bytedance.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Hao Ge <gehao@kylinos.cn>, Tengda Wu <wutengda@huaweicloud.com>, 
	Gabriele Monaco <gmonaco@redhat.com>, Chun-Tse Shao <ctshao@google.com>, 
	Casey Chen <cachen@purestorage.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Levi Yun <yeoreum.yun@arm.com>, Weilin Wang <weilin.wang@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Andrew Kreimer <algonell@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Building with LIBBPF_DYNAMIC still requires building libbpf as part of
bpftool, but the build also still accidentally builds it. Make the
parts of the build bringing in libbpf conditional. Don't build bpftool
is a bpftool exists from the which command.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.perf | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 5438d1111f3b..296c00e224a0 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -960,10 +960,12 @@ $(LIBAPI)-clean:
 	$(call QUIET_CLEAN, libapi)
 	$(Q)$(RM) -r -- $(LIBAPI_OUTPUT)
 
+ifndef LIBBPF_DYNAMIC
 $(LIBBPF): FORCE | $(LIBBPF_OUTPUT)
 	$(Q)$(MAKE) -C $(LIBBPF_DIR) FEATURES_DUMP=$(FEATURE_DUMP_EXPORT) \
 		O= OUTPUT=$(LIBBPF_OUTPUT)/ DESTDIR=$(LIBBPF_DESTDIR) prefix= subdir= \
 		EXTRA_CFLAGS="-fPIC" $@ install_headers
+endif
 
 $(LIBBPF)-clean:
 	$(call QUIET_CLEAN, libbpf)
@@ -1183,7 +1185,11 @@ $(SKEL_TMP_OUT) $(LIBAPI_OUTPUT) $(LIBBPF_OUTPUT) $(LIBPERF_OUTPUT) $(LIBSUBCMD_
 	$(Q)$(MKDIR) -p $@
 
 ifeq ($(CONFIG_PERF_BPF_SKEL),y)
+BPFTOOL := $(shell which bpftool)
+ifeq ($(BPFTOOL),)
 BPFTOOL := $(SKEL_TMP_OUT)/bootstrap/bpftool
+BUILD_BPFTOOL := y
+endif
 # Get Clang's default includes on this system, as opposed to those seen by
 # '--target=bpf'. This fixes "missing" files on some architectures/distros,
 # such as asm/byteorder.h, asm/socket.h, asm/sockios.h, sys/cdefs.h etc.
@@ -1202,16 +1208,21 @@ endif
 
 CLANG_OPTIONS = -Wall
 CLANG_SYS_INCLUDES = $(call get_sys_includes,$(CLANG),$(CLANG_TARGET_ARCH))
-BPF_INCLUDE := -I$(SKEL_TMP_OUT)/.. -I$(LIBBPF_INCLUDE) $(CLANG_SYS_INCLUDES)
+BPF_INCLUDE := -I$(SKEL_TMP_OUT)/.. $(CLANG_SYS_INCLUDES)
+ifneq ($(LIBBPF_INCLUDE),)
+  BPF_INCLUDE += -I$(LIBBPF_INCLUDE)
+endif
 TOOLS_UAPI_INCLUDE := -I$(srctree)/tools/include/uapi
 
 ifneq ($(WERROR),0)
   CLANG_OPTIONS += -Werror
 endif
 
+ifneq ($(BUILD_BPFTOOL),)
 $(BPFTOOL): | $(SKEL_TMP_OUT)
 	$(Q)CFLAGS= $(MAKE) -C ../bpf/bpftool \
 		OUTPUT=$(SKEL_TMP_OUT)/ bootstrap
+endif
 
 # Paths to search for a kernel to generate vmlinux.h from.
 VMLINUX_BTF_ELF_PATHS ?= $(if $(O),$(O)/vmlinux)			\
-- 
2.49.0.906.g1f30a19c02-goog


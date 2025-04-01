Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1911F20F07E
	for <llvm@lists.linux.dev>; Tue,  1 Apr 2025 18:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743531883; cv=none; b=W6kDJfZeT4Kpsr9LOhvaUNyBCFYWs0ef/Ah3f29TrhVP2bZgSnrYIqUR0uZKfFTiisfbUQrSrPYXqfMO6AGIAdaK52AuDKOpvown+eogZJS868W4Biv8ivU1PDlyGBmqGi1a32GQ+aDaY+wcmBi/RJtvg6n1Z93lJEFDxkveITM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743531883; c=relaxed/simple;
	bh=49l7ADb3p3Yt9ABBM2gRd7j5skKd2Ri396uT1ankTM4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=XojHEqzDJiDCoQUPrU94BzeKK8hoow/lbyOTS+TanmA9JcYZsCYS3Kbmk1xGDRgbeOPIrDf05x5btiKOMl/8wnAq95PE34kHE9r0Hv3Rr54xqalSBmwGruZEVi7E5+bC9Ab5Yw01hhX+xM6/euUnlFO1KJrV2sMQ4Rw1EvruMHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c7I+8dB1; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c7I+8dB1"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3032f4ea8cfso10907871a91.3
        for <llvm@lists.linux.dev>; Tue, 01 Apr 2025 11:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743531879; x=1744136679; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iRjxFcSihUrg8jPg2GdkHyPzaMHS3sRgicHABls9JzI=;
        b=c7I+8dB1U/pUtYXxFfHT9mqsCsiWvPGqf0XoMQurWSLccIHttrY+W9L9KiA/KNAYtT
         KP+pVFL1FiAAsfceYsl/BgyS0G0VpXn+YZtpnGSyWgln/8bMVMAg5FOKlTXcsOlyf9zT
         VY2MpBKzqWST10RhuwVo3N05EFhb4Yd0Vdlxi1I6BFPAnDJm852noFOTBtjm+2cFVkQc
         elPSx4EqqpT8DsVK5nY1wmJglCaQVwsgTF+tnvhQg8BTFRfssZVvc4SDGf7Gbli36kC8
         4ITv+u6V0OcNrs3E4/7bokCIFaVoeSUYVu8g7UcReXHT/XOY1uO/SwAr6L34w8Oan9CO
         bi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743531879; x=1744136679;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRjxFcSihUrg8jPg2GdkHyPzaMHS3sRgicHABls9JzI=;
        b=BzTyNcvzRVE9fLu6jbelZf0eU+KF8baiHL9UHhDrOqe/HXMQuCP4OVIE5JxWIgdY6L
         VGypOqjEerebxni2ty0oltx7C+ilUYUD0wqcMU5J1w67qnhzEohaRV93PFJlbaXeE/Lg
         MP8GXFle7Z5dg5FFB49WMtprddotSBG0X5BfjBYtiMOAXIPyaBeX3bvKN1Lf58i/YNSf
         ssaBbJqAS7sGrONGttgbDXGxiA7idPjxO1pKCMjkv20HHAf+PqIbdV0Z2qk14soljv9d
         jRc3REeMzjUMd5ipHpkmj/zSxcVVhbUE1IN0G2fO5iNPz6WDSEr6iMEz0FT4Dcnmt+zH
         RTIg==
X-Forwarded-Encrypted: i=1; AJvYcCU0NbCnzWSYlSqv6YIOPEL2nqy8YeKihQvR8QWhTJ1lnnnMvECQjniyDS9Dqyn+BE4Tja2D@lists.linux.dev
X-Gm-Message-State: AOJu0YwDZu1OUmru6ndSfVtYiEqhuubhHsgWl8bPsckpGd1QqqEMnMOf
	46OEHQLHRvNxpFDBwZar9wHdvzdbTFVSRq0XtPSMThLOm0Xc21xV9uJpQ+LKk6aeNuj+NKNnoHY
	5lsi6UQ==
X-Google-Smtp-Source: AGHT+IEFoEdW54+8IzXF8SrRli8AZBce5TP8glO5taNb/WkCtgqcwxjpvN6TkKqQcxglUuElnk9l67f2Meoj
X-Received: from pjvf3.prod.google.com ([2002:a17:90a:da83:b0:2f9:dc36:b11])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2704:b0:2fa:13d9:39c
 with SMTP id 98e67ed59e1d1-30531fa6be2mr25430589a91.14.1743531879230; Tue, 01
 Apr 2025 11:24:39 -0700 (PDT)
Date: Tue,  1 Apr 2025 11:22:59 -0700
In-Reply-To: <20250401182347.3422199-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401182347.3422199-2-irogers@google.com>
Subject: [PATCH v1 01/48] perf build: Avoid building libbpf/bpftool with LIBBPF_DYNAMIC
From: Ian Rogers <irogers@google.com>
To: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
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
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, Levi Yun <yeoreum.yun@arm.com>, 
	Weilin Wang <weilin.wang@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Andrew Kreimer <algonell@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
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
index d335151736ed..c836e01c8279 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -1001,10 +1001,12 @@ $(LIBAPI)-clean:
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
@@ -1224,7 +1226,11 @@ $(SKEL_TMP_OUT) $(LIBAPI_OUTPUT) $(LIBBPF_OUTPUT) $(LIBPERF_OUTPUT) $(LIBSUBCMD_
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
@@ -1243,16 +1249,21 @@ endif
 
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
2.49.0.504.g3bcea36a83-goog


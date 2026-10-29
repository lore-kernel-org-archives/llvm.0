Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287466;
	b=JF/+lLBJ4p91/IHiFYuA410m5k3lvC50EODMGLa/gKZzAFN6Jw7Em6PPXIYf5RiO0arG
	 Sh7VdwXDhKf/B+eknHioK0KjJh2O1nnkStBY3h2UKw+nfqVIisyxv+bKOTI/HBukp95RU
	 enY9NicSI8BxBRs8VrhcslqH726uaP+Y6nUZehg25P9ibqMZEU8mV0CpKorkM4tA5JrB2
	 S4xR5Z+VSNlepNeC4gczwhSF6jmANwI43o8IVzOy4MYsoIeSOI8LdMFXGXmjleIl7MKw/
	 7QD63Jjfb/HwR6x3cO/C8KCFIExMDiQgVHFymxUuG+bOjGy52BRjclvF7615pfJ0EAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=LqUQbtPft1j46GYypYCN7/YQGyvs+Nf1fNrdAmWoWxc=;
	b=YjZAIMnpi6Scxy93HuSlIj812vn/+qdNLe4V8qjo4hp8FPJec19VXkBkIzv4blvYFuTA
	 Wc496THZECfGyH6AC7FsVN7YuNor2flZ+Zh325bTY9V+A3xr1heu1OLArmk61APL90FhL
	 nj9P2C789MB7vxE+BrMQAIkKPaR1IDQPVaJHzwBrQgzM19Gxd8lBCVDSUVPIoogU+TdCN
	 /YkrSJIgB8IPJQMhDU4wD83Ylb4dVoWjaG9btwPCgHfsMM3gzneQZUatsWdl3miJlN2cJ
	 Hqe/fKmpqbRvnkUXvqWKLpUFBKDipvpeE8VL0cLhO+cSd6ml3V9b5mS8p8A90BtMq/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYw3sZtJ;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C70606A31D
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 15:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59C70606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYw3sZtJ
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc502d509c0so1039281a12.2
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 08:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287464; x=1793892264; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LqUQbtPft1j46GYypYCN7/YQGyvs+Nf1fNrdAmWoWxc=;
        b=QYw3sZtJQmegqlf8K6D0RLCI3af8kJ/QRxn1LSBW0wowGjIWlEfBZ+hv9VjJZfKi/N
         8025TTBNpByLW265YaHU/amn7pYspGE061aU/Kddz7VurtkVL/sXE3g+h+ktdjwKxYpD
         dyiAQX9rTEMVe0ayhX49RrleVRJJ+9P41pUwwMJmT6Qh0BIvifcmZ0kRtT6k8yNtwcVY
         j32WsJ5ByCmjaWE6SjpIlp9MzFbCnx9Ty39l+jbGeMm32DS5dgzcgpfl+KdH0YSoL9/N
         /YS2buoNB7oPxUGXQxfNPT5dcpwNw92p8dKoI73OM7ulGTNA0xovRQDdnBn+mg2S5bgX
         aqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287464; x=1793892264;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LqUQbtPft1j46GYypYCN7/YQGyvs+Nf1fNrdAmWoWxc=;
        b=2W82GRL6H61Ap3n1AlaDBebXLOrpagJZc0y/KavJl7VNTCGwWAAC/8wu0WxbTC7l9/
         gFIogcg6YtvV/ZeqhiYD1pbIa/x0RLkEs/+4IEY+uRnM2+mIdpb8U0UeRX1TUHqzD91n
         4yFUKXNeJfKrmBvoGsYxQGv6B5u+SQfXNyNrw3IcJ/d7XD+ecOirb68PXZvEqL4HOYt4
         7xdZYpAGVplNda7au/OTQC+1PyrHZmzw5dukQs88KCttGlPnBB/Nw7H+Q5X2HD4byPle
         eHqPv12kLeXj/dND8NUVuhme8zbWgV0e34QJpJt/8anFlCttdLsyMUdMhNE/jBcWpCnH
         BFOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZDUKqri40+xZSqxYHs3mDOD9vemv97qv0dJZRtTo4ON/o54wAD4smMmBqTEBC+b5GUSyo@lists.linux.dev
X-Gm-Message-State: AFq9FYKx3qrox0AIZPOmsHD7GN7oPZ9ykMSodUeENf1GkOwsAMx8j8wd
	kCKZDCAKQo8sl/K3Hjq32uPGOO0VBUtdIF7/nPZpGranq79S4Fs/IXU3
X-Gm-Gg: AYBFou0vZVhvgmCm93ih03VQy3+lxnVqyierUvCcRnFcGn9nIYeSAyDS9nNFqtxYahr
	DczPgabMh0OxJFcWBZUV702WkxVpxn3Ih++9HmX3GHCcXNAIagynrMDA+wbax0zkw4Yu8+14ryE
	7INJuJJ45WoXvPv6pnZrj91KenKwbehBJcRazdZtr1vwbIekz+5KSPbRQvdpB0wI+zzLX91V+Ia
	57ZqT80EBic9g2WRA4Plnf/xPUXlc+WD7XLRkzArrpgrVGwmHv7phMepPANRQMKcmjK4gLt4deM
	cqJqxzcbrtBSKqKyCAVKhWUhLaNwQTD/ZS+ihPQFbSbglD8K8KGtWTppDemZB0EQeVwlxqlqBZf
	hwg5nAC6uGMF/YaEouYYdk40z4w+gKXpfzY5KO7EsWDuTlZBsQ7r6AUfZs1hPjftvA3YsPKwUDL
	+nL/67ymg3VFxugX9Y4O5LDkT6bEYoOlDsXqmE7fx1X7e3RxL+Pu4DlYvp+5PLmpJ377L8cANuh
	9JyrjBs86LDf5iuBTE3a1pj+lFPrDWq6isPNqKbNOba8pCia3m7UjwaTr8TjZp6X2pmO1meO3Wo
	4QvDxb+DQ3qt1YlwdSYT4dhB5YB0T4fG8s/Pyi0BjOAngzKcrsBcrsw8octPucNRq01t5iwDkNh
	LJSzU0TnrzeCSLZ37G40Bl0HrxJejZeilEQ==
X-Received: by 2002:a17:90b:48c7:b0:3ac:adce:60a9 with SMTP id 98e67ed59e1d1-3ae57e346ffmr4072955a91.9.1793287463471;
        Thu, 29 Oct 2026 08:24:23 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae579c59a6sm3481124a91.3.2026.10.29.08.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:24:22 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Oct 2026 15:24:22 +0000
Message-Id: <DMHFCN3J36VN.2JJEE30A07C0Z@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <llvm@lists.linux.dev>
Subject: Re: [PATCH bpf-next v3 2/2] bpftool: Make the LLVM disassembler an
 optional runtime dependency
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <socketpair@gmail.com>, "Quentin Monnet" <qmo@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Nick Desaulniers" <ndesaulniers@google.com>
In-Reply-To: <20261029-bpftool-plugin-v3-2-87af799da40a@gmail.com>
References: <20261029-bpftool-plugin-v3-0-87af799da40a@gmail.com> <20261029-bpftool-plugin-v3-2-87af799da40a@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Thu, Oct 29, 2026 at 06:05 AM Mark Korenberg via B4 Relay <devnull+socketpair.gmail.com@kernel.org> wrote:
> Move the LLVM disassembler to a plugin, $(libdir)/bpftool/bpftool-llvm.so,
> that bpftool loads with dlopen() only when disassembling JITed programs.
> Distributions can then ship it as an optional package.
>
> The plugin exports a single structure of callbacks, with an ABI version
> checked by bpftool. bpftool looks for the plugin next to its own binary,
> then in its install directory, but not in the current directory since it
> usually runs as root. "bpftool version" reports "llvm" only if the plugin
> can be loaded.

This is overkill.
The plugin wraps 7 llvm-c functions and the target init calls.
bpftool can dlopen() libLLVM.so itself and dlsym() them.
perf does that for libcapstone. See
commit b5c9bcde61b8 ("perf capstone: Support for dlopen-ing libcapstone.so").

                     this patch                  dlopen(libLLVM.so)
  -----------------  --------------------------  ------------------
  installed files    bpftool, bpftool-llvm.so    bpftool
  who finds the lib  llvm_plugin_find()          ld.so
  ABI to maintain    struct bpftool_llvm_ops     none
  Makefile           libdir, llvm-plugin-dir,    one -D
                     install, uninstall rules

v1, v2 and v3 each look for the plugin in a different way.
The bpftool that the selftests build still doesn't find it.
selftests/bpf, selftests/hid, selftests/sched_ext and tools/sched_ext do:

  make -C tools/bpf/bpftool prefix= DESTDIR=<dir>/ install-bin

  bpftool           <dir>/sbin/bpftool
  plugin            <dir>/lib/bpftool/bpftool-llvm.so
  bpftool looks in  <dir>/sbin, then /lib/bpftool

"prog dump jited" fails there with this patch.
"make install" in selftests/bpf copies only bpftool. The plugin stays behind.

In the diff below llvm-config gives the name of the library at build time.
ld.so finds it the same way as today.
The distro package recommends the LLVM libs and doesn't require them.
"bpftool version" keeps "llvm" as a compile time feature.
That's what common_options.rst says.
LLVM built with BUILD_SHARED_LIBS=ON is not handled.

Something like this (not even compile tested):

diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
index b0f7168..7a49182 100644
--- a/tools/bpf/bpftool/Makefile
+++ b/tools/bpf/bpftool/Makefile
@@ -186,10 +186,15 @@ ifeq ($(HAS_LLVM),1)
   # Makefile includes lib.mk which sets -D_GNU_SOURCE) which would cause
   # compilation error due to redefinition. Let's filter it out here.
   CFLAGS  += $(filter-out -D_GNU_SOURCE,$(shell $(LLVM_CONFIG) --cflags))
-  LIBS    += $(shell $(LLVM_CONFIG) --libs $(LLVM_CONFIG_LIB_COMPONENTS))
   ifeq ($(shell $(LLVM_CONFIG) --shared-mode),static)
+    LIBS += $(shell $(LLVM_CONFIG) --libs $(LLVM_CONFIG_LIB_COMPONENTS))
     LIBS += $(shell $(LLVM_CONFIG) --system-libs $(LLVM_CONFIG_LIB_COMPONENTS))
     LIBS += -lstdc++
+  else
+    # Don't link with libLLVM.so. "prog dump jited" loads it with dlopen().
+    LIBLLVM_SO := $(shell $(LLVM_CONFIG) --libfiles $(LLVM_CONFIG_LIB_COMPONENTS))
+    CFLAGS += -DLIBLLVM_SO='"$(notdir $(realpath $(LIBLLVM_SO)))"'
+    LIBS += -ldl
   endif
   LDFLAGS += $(shell $(LLVM_CONFIG) --ldflags)
 else
diff --git a/tools/bpf/bpftool/jit_disasm.c b/tools/bpf/bpftool/jit_disasm.c
index 0454115..cca02cd 100644
--- a/tools/bpf/bpftool/jit_disasm.c
+++ b/tools/bpf/bpftool/jit_disasm.c
@@ -25,6 +25,7 @@
 #include <bpf/libbpf.h>

 #ifdef HAVE_LLVM_SUPPORT
+#include <dlfcn.h>
 #include <llvm-c/Core.h>
 #include <llvm-c/Disassembler.h>
 #include <llvm-c/Target.h>
@@ -47,6 +48,88 @@ static int oper_count;

 typedef LLVMDisasmContextRef disasm_ctx_t;

+#ifdef LIBLLVM_SO
+/*
+ * libLLVM.so is big and only "prog dump jited" needs it. bpftool is not linked
+ * with it. disasm_init() loads it.
+ */
+#define LLVM_FUNCS(F)			\
+	F(LLVMCreateDisasm)		\
+	F(LLVMCreateDisasmCPUFeatures)	\
+	F(LLVMDisasmDispose)		\
+	F(LLVMDisasmInstruction)	\
+	F(LLVMDisposeMessage)		\
+	F(LLVMGetDefaultTargetTriple)	\
+	F(LLVMNormalizeTargetTriple)
+
+#define F(fn) static __typeof__(&fn) p_##fn;
+LLVM_FUNCS(F)
+#undef F
+
+static const struct {
+	const char *name;
+	void *ptr;
+} llvm_funcs[] = {
+#define F(fn) { #fn, &p_##fn },
+	LLVM_FUNCS(F)
+#undef F
+};
+
+/* The functions that LLVMInitializeAll*() in llvm-c/Target.h call */
+static const char * const llvm_init_funcs[] = {
+#define LLVM_TARGET(t) "LLVMInitialize" #t "TargetInfo", "LLVMInitialize" #t "TargetMC",
+#include <llvm/Config/Targets.def>
+#define LLVM_DISASSEMBLER(t) "LLVMInitialize" #t "Disassembler",
+#include <llvm/Config/Disassemblers.def>
+};
+
+#define LLVMCreateDisasm		p_LLVMCreateDisasm
+#define LLVMCreateDisasmCPUFeatures	p_LLVMCreateDisasmCPUFeatures
+#define LLVMDisasmDispose		p_LLVMDisasmDispose
+#define LLVMDisasmInstruction		p_LLVMDisasmInstruction
+#define LLVMDisposeMessage		p_LLVMDisposeMessage
+#define LLVMGetDefaultTargetTriple	p_LLVMGetDefaultTargetTriple
+#define LLVMNormalizeTargetTriple	p_LLVMNormalizeTargetTriple
+
+static void *llvm_sym(void *lib, const char *name)
+{
+	void *sym = dlsym(lib, name);
+
+	if (!sym)
+		p_err("%s is not in %s", name, LIBLLVM_SO);
+	return sym;
+}
+
+int disasm_init(void)
+{
+	void (*init)(void);
+	void *lib, *sym;
+	size_t i;
+
+	lib = dlopen(LIBLLVM_SO, RTLD_NOW);
+	if (!lib) {
+		p_err("failed to load %s: %s", LIBLLVM_SO,
+		      dlerror() ?: "unknown error");
+		return -1;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(llvm_funcs); i++) {
+		sym = llvm_sym(lib, llvm_funcs[i].name);
+		if (!sym)
+			return -1;
+		*(void **)llvm_funcs[i].ptr = sym;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(llvm_init_funcs); i++) {
+		init = llvm_sym(lib, llvm_init_funcs[i]);
+		if (!init)
+			return -1;
+		init();
+	}
+	return 0;
+}
+#endif /* LIBLLVM_SO */
+
 static int printf_json(char *s)
 {
 	s = strtok(s, " \t");
@@ -135,6 +218,7 @@ disassemble_insn(disasm_ctx_t *ctx, unsigned char *image, ssize_t len, int pc,
 	return count;
 }

+#ifndef LIBLLVM_SO
 int disasm_init(void)
 {
 	LLVMInitializeAllTargetInfos();
@@ -142,6 +226,7 @@ int disasm_init(void)
 	LLVMInitializeAllDisassemblers();
 	return 0;
 }
+#endif
 #endif /* HAVE_LLVM_SUPPORT */

 #ifdef HAVE_LIBBFD_SUPPORT

Keep patch 1.

Also pls don't respin in 22 minutes only because a bot said something.

pw-bot: cr

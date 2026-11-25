Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587418;
	b=V2T7ICeyazxpiYgg8/vM8UWPlZY++2CydHNpwTpw92eC3ExBRtD9Th7AbUlVMEJyYirf
	 zZJnmq6j2i1hcB2yz1CJKrJjFv79oJp5VyNA1qViX6NLhnAYFtaZrMlbcNzKIVSbOUSaO
	 0dWCQ0Q9TUOw4Lmyb4l6RkbjE6kNggUN2uB7EMa77RNTsBwk6HfzFTa8hMHETHU+lJg+O
	 IIt1h9srbD89a/K8xoPbc7D+RHCoCMouNk7ZyBGW/HGMyaOroHNky0lEa6gkubEyDDdb3
	 ghz88xW+Fk3Q5IPWPXMPypZwDai1kuDips67112QF8adtmE3vEsqMuT/7iYoz9coY0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=B0szZcyaY7NP1HowgKnJWSVhbM1uN8jco8rE2rfxzUA=;
	b=TR8qlbfiz3cqHzYzFj5cZoyQTCln/Ues1rHVYHiRNxVcL2bwOd3Ww7SGuTOY32nK77kG
	 Hck9QwAp/WBY4LKazRB/abq1BodergPLS8gI+27T6vqHJHufCpKvmW5SC4kNiMzULZSD1
	 PWEYDEYOjTZIT4muhB03oPkkAZBPUTZJExTmf+Yqew5rn+xxYxUgh0+688uUPN6M2Nfl6
	 Sl+HOIZhgHin0dKVDtIgMkzDpPPDebGzZ2v6QoKbbGqLG4iUdpNd4BoBZ/sHLSTmQrdDV
	 S1GrYpK8QmYyFxwM9IdWxxP0egNyJfYGxlsUTdp1sPmNwdBQfc9T2BJEEn0KCBcYy8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OYtSOtL4;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAA3607AC3A
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 06:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DAA3607AC3A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OYtSOtL4
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89e05d31e54so3741779b3a.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 22:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587418; x=1796192218; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0szZcyaY7NP1HowgKnJWSVhbM1uN8jco8rE2rfxzUA=;
        b=OYtSOtL429vx8h9e8KmJ/oGhT4gkjeQ021DBdoDdRU0/PX54D7Rsp3lWJGAXyRL5mc
         bxCKAhao6ehgV/HDPNQ6tilImjkNYbBPOQ+CWdUdZgyOlaPtyLoKZZjAMSrmjVbdpBfi
         y6hrj6DUVXDXqpxh43Byxt5zWGMDLraUXXpyNClQC1ZM520uXfAdqLfry5TISAOxZiw5
         LKi1JFdlFSTj279EPNDz3stCVUDCoKhxstL4+T3Er9Nc31JKpdTMHQBfx4q85PlFf4ul
         fuOrvHqUZTJEP77DP5QY8LfmCtQBEGpg3gpMYg7eVHD8zJ0jdYCDA/nYS387hEjaN9EC
         uLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587418; x=1796192218;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0szZcyaY7NP1HowgKnJWSVhbM1uN8jco8rE2rfxzUA=;
        b=ttzt9MEoDSmLdIxQdsdGtVD9VwmKnR01h5mB8xc5XwEKk2m1lRirLxZT8+HDG5f/mW
         XV6TG5gSohdsbs+DSbM6vcno4xQJ/S5uZyb2uYQcZucOa3QT4Dv/mxzwUWtG3o4e3xhS
         eIeRhri3llWu/wloxOtiswckVPa/1IgkqRufPUpwN/5WeNswznv3/trTIEtOiGVLFSeC
         xM3n+HIcVMjy5JZJkGGjcCseZgPpCwpJkdNj/8FlXqbnsKviiOrWtwp1VvUrvdaGWUM0
         Kn/4HYRietudIh7JoZFEJwoDdO9r7GTUCGB7dDWikD9K4VtAuhg0iFUQyxxA0Fzvxnji
         kPtg==
X-Forwarded-Encrypted: i=1; AL+hErGb+Yr8O/qqwEdbV240WGJlrT+/IZWs0eJLj4iJTDbIL9+/lqh3za/Un/CdQhKqI4kZmSVI@lists.linux.dev
X-Gm-Message-State: APuU4Z85kMdBaPUpWpzWe9NysrGxzaKreJoTJMcQlW++4vUelpjxAQg4
	jPCOT14S27neFQlwBHwgK/mZ4bCuE9JAGWv/x8gDKT4JCkaR45stzrYl/aFqgOnAXEMLT/T3tSI
	E3jZ88K/5mw==
X-Received: from pgin21-n1.prod.google.com ([2002:a05:6a02:8795:10b0:cdb:932c:948b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:8095:b0:3dd:85a8:cac8
 with SMTP id adf61e73a8af0-4014c949c92mr14160775637.31.1795587417428; Tue, 24
 Nov 2026 22:16:57 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:23 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-31-irogers@google.com>
Subject: [RFC PATCH v2 30/30] MAINTAINERS: Add DWARF CFI stack unwinding entry
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a MAINTAINERS entry for Minimal DWARF CFI stack unwinding covering
the core .eh_frame / .eh_frame_hdr bytecode interpreter and KUnit tests,
the user-space PT_GNU_EH_FRAME VMA unwinder, the x86-64 DWARF CFI kernel
unwinder, the build-time .eh_frame minifier and analyzer scripts, the
standalone tools/unwind/ CFI verifier, and the deferred user-space CFI
kselftest.

Also add arch/*/include/asm/unwind_user*.h to USERSPACE STACK UNWINDING
so architectural unwind_user headers on x86, arm64, riscv, and future
ports are routed to the user-space unwinding maintainers.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb2b8..0584279d745e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9496,6 +9496,21 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/usb/dvb-usb-v2/dvb_usb*
 F:	drivers/media/usb/dvb-usb-v2/usb_urb.c
 
+DWARF CFI STACK UNWINDING
+M:	Ian Rogers <irogers@google.com>
+L:	linux-trace-kernel@vger.kernel.org
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	arch/x86/kernel/unwind_dwarf.c
+F:	include/linux/unwind_dwarf_cfi.h
+F:	kernel/unwind/dwarf_cfi*.c
+F:	kernel/unwind/user_cfi.c
+F:	scripts/eh_frame_min.py
+F:	scripts/min_eh_frame.c
+F:	tools/include/linux/unwind_dwarf_cfi.h
+F:	tools/testing/selftests/perf_events/unwind_user_cfi.c
+F:	tools/unwind/
+
 DYNAMIC DEBUG
 M:	Jason Baron <jbaron@akamai.com>
 M:	Jim Cromie <jim.cromie@gmail.com>
@@ -29300,6 +29315,7 @@ USERSPACE STACK UNWINDING
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
 M:	Steven Rostedt <rostedt@goodmis.org>
 S:	Maintained
+F:	arch/*/include/asm/unwind_user*.h
 F:	include/linux/unwind*.h
 F:	kernel/unwind/
 
-- 
2.56.1.831.g720f3f5937-goog


Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56F346AF21
	for <llvm@lists.linux.dev>; Wed, 27 May 2026 18:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779905900; cv=none; b=dd9C6UNT3lteXkchlEZCmBS/1SdpylE0PsfoEXU56eIicrRlXLOjggsrrgffx9watgODZQ6gGDa7P09OhKD2i554SHaIqrCoGU4eoVIOqOnaoj3bvoxvRdltSgXfuIfeUoHaF0saYBGWJF5GjF46JwF9IDq6cRJQbNJOqHh19cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779905900; c=relaxed/simple;
	bh=A1hu78OBhTmmHM5EGvEyajNzJfF6krcevjHiRkrrgeE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DAW/P1UxR8h/TBXYsX5kzGUB88TqPgfH7dOHTH9CIsg3NYm0reQIZcr5PwSRaNcuYxJdyrMW6l7N7aAjUMZ6GHqU76GCj5fg8H2L9svDA+bzyGsf+aM2AaFTwhNHs9VY/lbS/wLPSOJpOCOdxEKMbl1/od+OH8yv3OrhVtVWnvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z882UGkn; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z882UGkn"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4908af8d7f9so581385e9.1
        for <llvm@lists.linux.dev>; Wed, 27 May 2026 11:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779905897; x=1780510697; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aYuyafSbZ4rVnjRaui8xS+rYrPMJVSn6qkIJmqMYC34=;
        b=Z882UGknpq4fDYTQ01reJgJuEo+bqnjopUqSB9w0wmRzzTuJinhoyalvVTzDyhS2uq
         Y5r//Cq8Ttn78fbUK87nxi6Bf49P56YODDNAz1bWkAgY5BNK0zDMcj/yL2KmMsG4z/Qc
         AX7ej4QygMYCbOrIugEaNdR3wy9gMvqNyOA0fNuoVNmCd7ebNkPNPCUJyzIfoWiBw20a
         cAJyPLZvd3TDK4wtEengUNm/pKXJaUBS6b7ejoG1LdkyFlzBePhkzOgZU0Dqt1QeJn8i
         iOL0IYf62ViA4SSZWITlLqFxTzI5CJMNbxCEM8H00qEbuQWDFchxdM5rR7c7zjwaPs8U
         slbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779905897; x=1780510697;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYuyafSbZ4rVnjRaui8xS+rYrPMJVSn6qkIJmqMYC34=;
        b=lP3g5t553Y4fb1zJamwgbpWXFk/lm7yBtsatNWH8AYuqjjevL/6rJfjlkYBb50QDMU
         WB8z/QabZDeKQMiWBssTiiHCY6OH6VeJJBXYxsUWTdLAn16W36jZjyiy8Q2LvCz+EBZ+
         C13PQ4mSO8MaP+XVyjRzbsf9a9H3tpp478i1J9hO2xdE5XQa95IWwudc8dTND50OjvOZ
         yAZp0OL39/m9mOL5x+bmm/CzoCO6yvK1j0dujR4gjwktg+OIYZcXDLmHJyOyXl3626n6
         CD0qGo/sGdzsk3gQ7jFaFAxiZVqB8hK7iTvQWpFoffeYWgdBzCMNltUDLgUOKwWS6bmm
         0JbA==
X-Forwarded-Encrypted: i=1; AFNElJ9GHaU7VcY+nBVXhsv1XUzdRSFqgdFmSLGeFjvcnuuSTWzNJJOH8FKVJWlEpjnfRB5KWDiJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwCMcz3lEqCZ8CRKRr2P8lxTVF/KBhcvLQ+SrdxgIOV/f64E/kh
	USjHsSQJal/KRgACbwLr9iltgEjK+wTIBXeYCGkyiOLBvFEN13zMsm08l8za0NsXdI6RfzQzThr
	NmODNfr5Oru17kELxfg==
X-Received: from wmsk24-n2.prod.google.com ([2002:a05:600d:8498:20b0:488:81f0:1a27])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4592:b0:490:6237:5212 with SMTP id 5b1f17b1804b1-4906237533fmr237671675e9.9.1779905896526;
 Wed, 27 May 2026 11:18:16 -0700 (PDT)
Date: Wed, 27 May 2026 18:18:07 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAF81F2oC/x2MSwqAIBQAryJvnWCCSV0lWmg97UE/NCuQ7p60G
 mYxkyFiIIzQsQwBL4q0b0XqisE4m80jp6k4SCEboaTm6T6NXZCv+5QK3GI8b4xQrbJOYKuhlEd AR89/7Yf3/QAohpNwZQAAAA==
X-Change-Id: 20260527-uwtable-module-flag-6a0595bf0e97
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=A1hu78OBhTmmHM5EGvEyajNzJfF6krcevjHiRkrrgeE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqFzVi3kskmzo8hxmO7mr/pbdeQYSEplX95V4tq
 4KaJnwxD3eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCahc1YgAKCRAEWL7uWMY5
 RnybD/9o0kTvgXkQWWk/GJHZZCLOLzFKaeecdlVjCAPFYR53Dcqn84/yAo7HVigvXUUcnW0gyLn
 uXFqu08Z02Avg1LUUeKaQULe2uSOlv8rIw+lz7IkmAdC9Nad5Im7V8a8ydQzZMMNAdTPcr3KAvR
 1kx0f7WXBSO8DHJwf5G7P4Ja0+vBhdDY5m9gy7+V5Sel+doifDGaKUC0z7XzbC3j03y+v6qEsW+
 yW+KRxivNzyU16EHSLPIpvbxjTpChWMBTjMo9Y/quuFxFTZoCamc81u/F3A4wMs750r7ktNwgQv
 +Ek/azMy1gvdCowz4gcnEmGzeik9YLhCvtPJxNzdPMWeDwEiCGQBkk3bVYTrFewrUzxvrJmVNQj
 GnU8T5uy2Uws79QK7PFp8DWHtU2xUaLAuBKroF/SqxD8LgXJzjOMeI462U/Oc81GAw350m9kfwm
 O1uwJmSY/xpZyIojZ96csOTUlEakjtWiuwMTi3d2R19bVQLnzXNjE7Tq7ZNuTmrGMBKMAbD8if4
 Kv9AF92m34Ci1f5xqnnOyl8RXWxOeYA2B4OkS+TQta/8/RSi9nWxsr2qRPwFtNUx1BYsLIIk+Vz
 vBunGSTkvWvH5S1yqoUyTZungaMF6+rFWuXgPSTHeCbpOgdtDOfauQG9uHGCghUrZ+loToGr46W DfVKYjs9T98PU8Q==
X-Mailer: b4 0.14.3
Message-ID: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
Subject: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
From: Alice Ryhl <aliceryhl@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, stable@kernel.org, 
	Bo Ye <bo.ye@mediatek.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Due to a rustc bug [1] the -Cforce-unwind-tables=y flag only emits the
uwtable annotation for functions, but not for the module. This means
that compiler-generated functions such as 'asan.module_ctor' do not
receive the uwtable annotation.

When CONFIG_UNWIND_PATCH_PAC_INTO_SCS is enabled, this leads to boot
failures because the dwarf information emitted for the kasan
constructors is wrong, which causes the SCS boot patching code to
patch the constructor in an illegal manner. Specifically, the paciasp
instruction is patched, but the autiasp instruction is not. This
mismatch leads to a crash when the constructor is called during boot.

	==================================================================
	BUG: KASAN: global-out-of-bounds in do_basic_setup+0x4c/0x90
	Read of size 8 at addr ffffffe3cc7eb488 by task swapper/0/1

Specifically the faulting instruction is the (*fn)() to invoke the
constructor in do_ctors() of the init/main.c file.

Once the fix lands in rustc, this flag can be made conditional on the
rustc version. Note that passing the flag on a rustc with the fix
present has no effect.

Fixes: d077242d68a3 ("rust: support for shadow call stack sanitizer")
Cc: stable@kernel.org
Link: https://github.com/rust-lang/rust/pull/156980 [1]
Reported-by: Bo Ye <bo.ye@mediatek.com>
Debugged-by: Isaac Manjarres <isaacmanjarres@google.com>
Debugged-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Isaac Manjarres <isaacmanjarres@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 arch/arm64/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 73a10f65ce8b..5b21941b5c8d 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -63,6 +63,9 @@ else
 KBUILD_CFLAGS	+= -fasynchronous-unwind-tables
 KBUILD_AFLAGS	+= -fasynchronous-unwind-tables
 KBUILD_RUSTFLAGS += -Cforce-unwind-tables=y -Zuse-sync-unwind=n
+# Work around rustc bug on compilers without below change:
+# https://github.com/rust-lang/rust/pull/156973
+KBUILD_RUSTFLAGS += -Zllvm_module_flag=uwtable:u32:2:max
 endif
 
 ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)

---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260527-uwtable-module-flag-6a0595bf0e97

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


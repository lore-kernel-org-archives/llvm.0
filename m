Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06262328625
	for <llvm@lists.linux.dev>; Wed, 10 Dec 2025 17:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765387814; cv=none; b=A53qPBGH24Y2W3v5/gabfCh54XWVPz96Oh2OHkMMr8WylanyS2Wtar9Ode7kHC8RPC0wsx0JNA0TnytV45oN1ZsacjKvc7Zjgy/DIkvso6hmqhnpZFXL/a+eziLHOuN23jZWMb5utFJbI9VxtaPEIxmpD0XBZFg36X1EpxdT0Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765387814; c=relaxed/simple;
	bh=LMaezUJWZi8w9+psRoT2CJOKvmM8RmxmTEKWOhg42fQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QEjKe7efixQae9Xsme1SJms7rNJ74tWaGkX0WKgVW80yLGe+XUkRpx7pdULSEM2mcw+kbaIhBSb1+q28hzB1UJvw+yvpnJttGgDslJwhAba9Zm9cFRkpNHgMKHsoyd+hR1oQPJGRNZQXjzn6e9hh7oGfWR21jiLLmzgWjt0TSB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=bff9AUQ6; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="bff9AUQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1765387809; x=1765647009;
	bh=lY9fE4khm8TKePDz5X4aC5hOywz6v3YeXyq28VGtz8g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bff9AUQ6oevu1qmq4awuQxoIpaVMBvgWcsrkovnFdMLLnKhFnUAmFyidjfDgyvHe0
	 3M+9lDnYM56Ifcsfm8YJHY4kunEYYxx4B3eqknKTYzC90GMoxesWB/vM2z5YTTgnlG
	 OwF9x6HqTwCREXSowqU+JpDm/q+L85JSm63BxpFVdj3APlRs2kyqFLbGiLQpZwrFBG
	 bhdKnEsiWTo2Pdwtf0mz4JPCpeXzqJVBC0Z3hUXFC5fmTu1J620kB3ztHCNyFivZME
	 Sc4eqgZlfsssXT7B0EHb+HkkhLusIRaALPc610UuPoh1fkiWsyzVtTZbEVLRh9UpmH
	 NGkFThngFKhag==
Date: Wed, 10 Dec 2025 17:30:05 +0000
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev
Subject: [PATCH v7 12/15] x86/kasan: Handle UD1 for inline KASAN reports
Message-ID: <13fa5da13adf927abbb7dd85d19fbaa8e4fadc84.1765386422.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1765386422.git.m.wieczorretman@pm.me>
References: <cover.1765386422.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 7032ee222089e9740a5e84130b4a9493439885f2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

Inline KASAN on x86 should do tag mismatch reports by passing the
metadata through the UD1 instruction and the faulty address through RDI,
a scheme that's already used by UBSan and is easy to extend.

The current LLVM way of passing KASAN software tag mode metadata is done
using the INT3 instruction. However that should be changed because it
doesn't align to how the kernel already handles UD1 for similar use
cases. Since inline software tag-based KASAN doesn't work on x86 due to
missing compiler support it can be fixed and the INT3 can be changed to
UD1 at the same time.

Add a kasan component to the #UD decoding and handling functions.

Make part of that hook - which decides whether to die or recover from a
tag mismatch - arch independent to avoid duplicating a long comment on
both x86 and arm64 architectures.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v7:
- Redo the #UD handling that's based on Peter Zijlstra WARN() patches.
- Rename kasan_inline.c -> kasan_sw_tags.c (Alexander)

Changelog v6:
- Change the whole patch from using INT3 to UD1.

Changelog v5:
- Add die to argument list of kasan_inline_recover() in
  arch/arm64/kernel/traps.c.

Changelog v4:
- Make kasan_handler() a stub in a header file. Remove #ifdef from
  traps.c.
- Consolidate the "recover" comment into one place.
- Make small changes to the patch message.

 MAINTAINERS                  |  2 +-
 arch/x86/include/asm/bug.h   |  1 +
 arch/x86/include/asm/kasan.h | 20 ++++++++++++++++++++
 arch/x86/kernel/traps.c      | 13 ++++++++++++-
 arch/x86/mm/Makefile         |  2 ++
 arch/x86/mm/kasan_sw_tags.c  | 19 +++++++++++++++++++
 include/linux/kasan.h        | 23 +++++++++++++++++++++++
 7 files changed, 78 insertions(+), 2 deletions(-)
 create mode 100644 arch/x86/mm/kasan_sw_tags.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a591598cc4b5..ff1c036ae39f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13421,7 +13421,7 @@ S:=09Maintained
 B:=09https://bugzilla.kernel.org/buglist.cgi?component=3DSanitizers&produc=
t=3DMemory%20Management
 F:=09Documentation/dev-tools/kasan.rst
 F:=09arch/*/include/asm/*kasan*.h
-F:=09arch/*/mm/kasan_init*
+F:=09arch/*/mm/kasan_*
 F:=09include/linux/kasan*.h
 F:=09lib/Kconfig.kasan
 F:=09mm/kasan/
diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index 83b0fb38732d..eb733ac14598 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -32,6 +32,7 @@
 #define BUG_UD1=09=09=090xfffd
 #define BUG_UD1_UBSAN=09=090xfffc
 #define BUG_UD1_WARN=09=090xfffb
+#define BUG_UD1_KASAN=09=090xfffa
 #define BUG_UDB=09=09=090xffd6
 #define BUG_LOCK=09=090xfff0
=20
diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
index eab12527ed7f..6e083d45770d 100644
--- a/arch/x86/include/asm/kasan.h
+++ b/arch/x86/include/asm/kasan.h
@@ -6,6 +6,24 @@
 #include <linux/kasan-tags.h>
 #include <linux/types.h>
 #define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
+
+/*
+ * LLVM ABI for reporting tag mismatches in inline KASAN mode.
+ * On x86 the UD1 instruction is used to carry metadata in the ECX registe=
r
+ * to the KASAN report. ECX is used to differentiate KASAN from UBSan when
+ * decoding the UD1 instruction.
+ *
+ * SIZE refers to how many bytes the faulty memory access
+ * requested.
+ * WRITE bit, when set, indicates the access was a write, otherwise
+ * it was a read.
+ * RECOVER bit, when set, should allow the kernel to carry on after
+ * a tag mismatch. Otherwise die() is called.
+ */
+#define KASAN_ECX_RECOVER=090x20
+#define KASAN_ECX_WRITE=09=090x10
+#define KASAN_ECX_SIZE_MASK=090x0f
+#define KASAN_ECX_SIZE(ecx)=09(1 << ((ecx) & KASAN_ECX_SIZE_MASK))
 #define KASAN_SHADOW_SCALE_SHIFT 3
=20
 /*
@@ -34,10 +52,12 @@
 #define __tag_shifted(tag)=09=09FIELD_PREP(GENMASK_ULL(60, 57), tag)
 #define __tag_reset(addr)=09=09(sign_extend64((u64)(addr), 56))
 #define __tag_get(addr)=09=09=09((u8)FIELD_GET(GENMASK_ULL(60, 57), (u64)a=
ddr))
+void kasan_inline_handler(struct pt_regs *regs, unsigned int metadata, u64=
 addr);
 #else
 #define __tag_shifted(tag)=09=090UL
 #define __tag_reset(addr)=09=09(addr)
 #define __tag_get(addr)=09=09=090
+static inline void kasan_inline_handler(struct pt_regs *regs, unsigned int=
 metadata, u64 addr) { }
 #endif /* CONFIG_KASAN_SW_TAGS */
=20
 #ifdef CONFIG_64BIT
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index cb324cc1fd99..e55e5441fc83 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -102,6 +102,7 @@ __always_inline int is_valid_bugaddr(unsigned long addr=
)
  * FineIBT:      f0 75 f9                lock jne . - 6
  * UBSan{0}:     67 0f b9 00             ud1    (%eax),%eax
  * UBSan{10}:    67 0f b9 40 10          ud1    0x10(%eax),%eax
+ * KASAN:        48 0f b9 41 XX          ud1    0xXX(%rcx),%reg
  * static_call:  0f b9 cc                ud1    %esp,%ecx
  * __WARN_trap:  67 48 0f b9 3a          ud1    (%edx),%reg
  *
@@ -190,6 +191,10 @@ __always_inline int decode_bug(unsigned long addr, s32=
 *imm, int *len)
 =09=09addr +=3D 1;
 =09=09if (rm =3D=3D 0)=09=09/* (%eax) */
 =09=09=09type =3D BUG_UD1_UBSAN;
+=09=09if (rm =3D=3D 1) {=09=09/* (%ecx) */
+=09=09=09type =3D BUG_UD1_KASAN;
+=09=09=09*imm +=3D reg << 8;
+=09=09}
 =09=09break;
=20
 =09case 2: *imm =3D *(s32 *)addr;
@@ -399,7 +404,7 @@ static inline void handle_invalid_op(struct pt_regs *re=
gs)
=20
 static noinstr bool handle_bug(struct pt_regs *regs)
 {
-=09unsigned long addr =3D regs->ip;
+=09unsigned long kasan_addr, addr =3D regs->ip;
 =09bool handled =3D false;
 =09int ud_type, ud_len;
 =09s32 ud_imm;
@@ -454,6 +459,12 @@ static noinstr bool handle_bug(struct pt_regs *regs)
 =09=09}
 =09=09break;
=20
+=09case BUG_UD1_KASAN:
+=09=09kasan_addr =3D (u64)pt_regs_val(regs, ud_imm >> 8);
+=09=09kasan_inline_handler(regs, ud_imm, kasan_addr);
+=09=09handled =3D true;
+=09=09break;
+
 =09default:
 =09=09break;
 =09}
diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index 5b9908f13dcf..b562963a866e 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -36,7 +36,9 @@ obj-$(CONFIG_PTDUMP)=09=09+=3D dump_pagetables.o
 obj-$(CONFIG_PTDUMP_DEBUGFS)=09+=3D debug_pagetables.o
=20
 KASAN_SANITIZE_kasan_init_$(BITS).o :=3D n
+KASAN_SANITIZE_kasan_sw_tags.o :=3D n
 obj-$(CONFIG_KASAN)=09=09+=3D kasan_init_$(BITS).o
+obj-$(CONFIG_KASAN_SW_TAGS)=09+=3D kasan_sw_tags.o
=20
 KMSAN_SANITIZE_kmsan_shadow.o=09:=3D n
 obj-$(CONFIG_KMSAN)=09=09+=3D kmsan_shadow.o
diff --git a/arch/x86/mm/kasan_sw_tags.c b/arch/x86/mm/kasan_sw_tags.c
new file mode 100644
index 000000000000..93b63be584fd
--- /dev/null
+++ b/arch/x86/mm/kasan_sw_tags.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/kasan.h>
+#include <linux/kdebug.h>
+
+void kasan_inline_handler(struct pt_regs *regs, unsigned int metadata, u64=
 addr)
+{
+=09u64 pc =3D regs->ip;
+=09bool recover =3D metadata & KASAN_ECX_RECOVER;
+=09bool write =3D metadata & KASAN_ECX_WRITE;
+=09size_t size =3D KASAN_ECX_SIZE(metadata);
+
+=09if (user_mode(regs))
+=09=09return;
+
+=09if (!kasan_report((void *)addr, size, write, pc))
+=09=09return;
+
+=09kasan_die_unless_recover(recover, "Oops - KASAN", regs, metadata, die);
+}
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 5cb21b90a2ec..03e263fb9fa1 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -669,4 +669,27 @@ void kasan_non_canonical_hook(unsigned long addr);
 static inline void kasan_non_canonical_hook(unsigned long addr) { }
 #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
=20
+#ifdef CONFIG_KASAN_SW_TAGS
+/*
+ * The instrumentation allows to control whether we can proceed after
+ * a crash was detected. This is done by passing the -recover flag to
+ * the compiler. Disabling recovery allows to generate more compact
+ * code.
+ *
+ * Unfortunately disabling recovery doesn't work for the kernel right
+ * now. KASAN reporting is disabled in some contexts (for example when
+ * the allocator accesses slab object metadata; this is controlled by
+ * current->kasan_depth). All these accesses are detected by the tool,
+ * even though the reports for them are not printed.
+ *
+ * This is something that might be fixed at some point in the future.
+ */
+static inline void kasan_die_unless_recover(bool recover, char *msg, struc=
t pt_regs *regs,
+=09unsigned long err, void die_fn(const char *str, struct pt_regs *regs, l=
ong err))
+{
+=09if (!recover)
+=09=09die_fn(msg, regs, err);
+}
+#endif
+
 #endif /* LINUX_KASAN_H */
--=20
2.52.0



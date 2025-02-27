Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDB4217668
	for <llvm@lists.linux.dev>; Thu, 27 Feb 2025 06:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740636788; cv=none; b=Pqkui9D3F+hopFZMMe7UF3c03Fmd4OlS6xk0+0IFiLZgUzFXl4snUse2fZgKbY+TcSsU1tBDaYPtAsC3ltApuVzHjWTj/OQCAk0FRsFvx4E31PgaxBhFEtkP0ssS2EMDDtzYmbIGO0UTkhluvko1gsfsX/2JdZljbZliztFlW84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740636788; c=relaxed/simple;
	bh=9J81SQoYHsfHuQNlO6dXXiKaclPkwFctCUcS7bQFdZ4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dEhAigUB8XutLruciYPHHQukRRgkAs00PXl1bCA7KQ6xsMy5hgMqhSs5sClB8bEtRwEjL1FcGT46jvN34FZ/77DMMaGEmhU341YX66oX4oox0wwr1lz9FE3aLs9nWX7H0ZvDQ2jsjTsVowSiwY021z0VSoX+nSyJLZBC86rnzw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vhgItv0V; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vhgItv0V"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abb7a6ee2deso77887366b.0
        for <llvm@lists.linux.dev>; Wed, 26 Feb 2025 22:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740636784; x=1741241584; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CuxSuk4eRgxWynJJEawNIcvcHNqZ5bgfZDjnTmQkJOo=;
        b=vhgItv0VRsS2u2Yb5UPk7i8ViVqnfJohW8IrT1UAf6cT6TuVcskcgCrlCAk8zdLwLq
         F6xpM9LUH64UtE+acxeVpAFz2liojaF0t4NjXwQ3YcZFCOfNYWwpUGqJuvLd0MO3tcUG
         hxoPu/tpqHdPiMy2Vkjg8/CAkQCLOI9IH0+T366zXD4pDXijEOmU320Rq8RMrrfeRoGC
         BV3FsAUrbeBlSRPHhBVm5BdKkjONaY8aJVPADmsLv/oagNBCp/53eMOAY/IcodPEEaGH
         Arn4finq7juc/ASlK8b4jNZSvkiSmQIQZEshlP7genH9LkOpplPyb0p7/LvJx+A7G2Am
         T0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740636784; x=1741241584;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CuxSuk4eRgxWynJJEawNIcvcHNqZ5bgfZDjnTmQkJOo=;
        b=FRQXTN7g0C7XbUAcFlU5b70Fo9XCNE3LmVxA1ujq3xyJmv760MxEEUfVvFqW9lN1aS
         jNlu0VnuPNiyHnf7WLGH4QM+FYwnpto6/VfGWzmYuC44ZK/9Pl/dscF1d5Qz4h5sQ69c
         Mc5ai/BsvntX89wWI+wKmqfmJuVg1CHv4zHoqHha55icWd3Np5yW/uLKNElqVWFBIudt
         5T76BW//gtHh6MyFARACK1DEo7/k/03kYZPV4+L0jKR5boB0ykMaR4pzLhmOIEw1TwiP
         zWbuRbUOC5aNBHN72nddQ3qJ/JDlrAz7y4x3CEMkca+/TObCScBszurbW59IyVrD1Onz
         B6Vg==
X-Forwarded-Encrypted: i=1; AJvYcCURRNuEag8MXUAkZUIziOv2/R1I46KGVrKRbQeVBLQ4wVK0qhNv9gMudDB/9dttTZhkuRgS@lists.linux.dev
X-Gm-Message-State: AOJu0YyQMZeYYfUejQO7pj/B8tFiN3zsiWGmUVhew1tbxNQ5IAa7HRro
	6RKr708j496sXpgDfanM8dzIQ6LYnq60Um3JL2XxG2AcK8p5/KyD4eCd8/CvTcS4ItR2Op0rJzL
	w2k1XfWmKVC5UK5ibj34UxY7XS2K4+EY4vFI=
X-Gm-Gg: ASbGncsyVWtRUyqmoKH6xgdszdX6M7zPkmTci5RGJjO9T21/Rv8WCm84f+iMstxi4Rg
	qgEzkj1IshLvnupdMrsRJYCwDo19mhhWubOJyRAyhWcZTwOFWL+fI3V8e6M+FovOhL4QcdRZG9Q
	485rkZ
X-Google-Smtp-Source: AGHT+IEgJXsQWOrOPhuyDiqYa5ObWU7mCLEWr74aJZ2+hsjWBPxMvycAsBVKLy9JZ2u4XFnZXPgBLyMLQe3dM8dy6ys=
X-Received: by 2002:a17:906:3105:b0:ab7:f2da:8122 with SMTP id
 a640c23a62f3a-abeeecfd662mr707407366b.3.1740636784177; Wed, 26 Feb 2025
 22:13:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Bill Wendling <morbo@google.com>
Date: Wed, 26 Feb 2025 22:12:47 -0800
X-Gm-Features: AQ5f1Jovhh9LtaEfZAB9uuTkphZJ0I-qXJT238fUHcidB3rX9MNwIcr8OFeNbcQ
Message-ID: <CAGG=3QVi27WRYVxmsk9+HLpJw9ZJrpfLjU8G4exuXm-vUA-KqQ@mail.gmail.com>
Subject: [PATCH] x86/crc32: use builtins to improve code generation
To: Bill Wendling <morbo@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Eric Biggers <ebiggers@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	LKML <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

For both gcc and clang, crc32 builtins generate better code than the
inline asm. GCC improves, removing unneeded "mov" instructions. Clang
does the same and unrolls the loops. GCC has no changes on i386, but
Clang's code generation is vastly improved, due to Clang's "rm"
constraint issue.

The number of cycles improved by ~0.1% for GCC and ~1% for Clang, which
is expected because of the "rm" issue. However, Clang's performance is
better than GCC's by ~1.5%, most likely due to loop unrolling.

Link: https://github.com/llvm/llvm-project/issues/20571#issuecomment-2649330009
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: llvm@lists.linux.dev
Signed-off-by: Bill Wendling <morbo@google.com>
---
 arch/x86/Makefile         | 3 +++
 arch/x86/lib/crc32-glue.c | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 5b773b34768d..241436da1473 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -114,6 +114,9 @@ else
 KBUILD_CFLAGS += $(call cc-option,-fcf-protection=none)
 endif

+# Enables the use of CRC32 builtins.
+KBUILD_CFLAGS += -mcrc32
+
 ifeq ($(CONFIG_X86_32),y)
         BITS := 32
         UTS_MACHINE := i386
diff --git a/arch/x86/lib/crc32-glue.c b/arch/x86/lib/crc32-glue.c
index 2dd18a886ded..fdb94bff25f4 100644
--- a/arch/x86/lib/crc32-glue.c
+++ b/arch/x86/lib/crc32-glue.c
@@ -48,9 +48,9 @@ u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 EXPORT_SYMBOL(crc32_le_arch);

 #ifdef CONFIG_X86_64
-#define CRC32_INST "crc32q %1, %q0"
+#define CRC32_INST __builtin_ia32_crc32di
 #else
-#define CRC32_INST "crc32l %1, %0"
+#define CRC32_INST __builtin_ia32_crc32si
 #endif

 /*
@@ -78,10 +78,10 @@ u32 crc32c_le_arch(u32 crc, const u8 *p, size_t len)

        for (num_longs = len / sizeof(unsigned long);
             num_longs != 0; num_longs--, p += sizeof(unsigned long))
-               asm(CRC32_INST : "+r" (crc) : "rm" (*(unsigned long *)p));
+               crc = CRC32_INST(crc,  *(unsigned long *)p);

        for (len %= sizeof(unsigned long); len; len--, p++)
-               asm("crc32b %1, %0" : "+r" (crc) : "rm" (*p));
+               crc = __builtin_ia32_crc32qi(crc, *p);

        return crc;
 }
-- 
2.48.1.711.g2feabab25a-goog

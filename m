Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2491B7D3FB
	for <llvm@lists.linux.dev>; Sun, 28 Jul 2024 20:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722198666; cv=none; b=kNnledmdjZ5t8v0/sErm4ooeGpu8QE4dWMpkSdqFPfNMwF3Jkpkn3xUuQifAjmuQW7+TcUmk38Y3Xyg69bt+Tk/eKhWbl+GKmDUiaIl24oPmnlGxuuBYlNIKaiqIQHqEm00AY8zj6Wv7/yxiWEQEBe/gSQJXcJJDg7tftmyI0xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722198666; c=relaxed/simple;
	bh=jgG0TSTo1c+hpUBT22yEfSilFpbm6otN2MQr5+RKpfs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E4p2wyWI94ekucsNBr+RW+qBTGcOgUgQ3HIFaFJLSc33QzdCKw0iFHBDYuioQC3goGkhEpsaiDvJbr0JgAofR24zr+c7TllfxdqU+kLx/d4RMSJyDfD5D81AtN+CDfA0YG0LXaPdTd9cKzTFYHuX81bH23wTUXc042N+rNUYXnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4m8F/Fok; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4m8F/Fok"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6506bfeaf64so42221657b3.1
        for <llvm@lists.linux.dev>; Sun, 28 Jul 2024 13:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722198663; x=1722803463; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tokg3sFCTTXy/Tg/kyuYTkBel/otDfHpuf9TI5sSKRc=;
        b=4m8F/Fok4br21ZTGu80bclgbu7NWLN0/dGe/zdZF13wcAxIGRqNbm21OMtSyTJfUka
         yEcvPL2WPvS6+Mptti8kDG2deVazcYdgGy981NEdIMap8p/dYx1slO5+tSrg4k3J0yJn
         Sm0DTQzJz15X0Iruvbcdtf7MdhDGCFmTacSQIcea95oMwvc1Xw8zK4rkaBnxynJ/p3vw
         OWHAZROvnRmDliJHyOirSupt7y/Y3gq6OtY4p5+CtUZLtVcF9K1G0GZ4Yt8fmNtBJQpF
         whd1aNtMOdPrx2KB11gNkgA6dReV7fI9TNKev2Kzvj9U7brM8Dpv684I0nB3p0E4xEms
         7T7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722198663; x=1722803463;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tokg3sFCTTXy/Tg/kyuYTkBel/otDfHpuf9TI5sSKRc=;
        b=tKYcYzTtlmNzHcm4S/jEPfWCui/P3HzT6u4tglN170o7qF3MO9axyAN/SMhs549XCy
         JVJkug0HSOozxyadnf8cwxvKULK2YYkVbVIv94GFUKv1NtQ95nXXObuTHzMZ8L1cHyac
         9T2dgOEwC0so3Fbj5tFLmzqOpEPq5biyH+9hUMB5MCgXRN0o1K/vq0yHBYNuYX+uonZk
         iwtnhNvtCQQIPT9Bz0CsLleMYhlnPTtMRDHNLF6XyYHTLOH/RSaVLzLT1cejhnZw8KEC
         7/fILfCxVJuLY/O4VRqokijPn8LWEmaXzeoFuapq8+5v0X3DZzu7sWivYFtDmmfLZ72d
         Z3pg==
X-Forwarded-Encrypted: i=1; AJvYcCXHrbMnbOpqs96OOWVeT1xXk6td8j7CF+O7k7AQI6Bod1d/MjqoTEEy7DP0iHR/OHImAS3Nr9VBAsehkss1YDmP/3aHFw==
X-Gm-Message-State: AOJu0Yzcf8k58oWdh/NcLiTSAtlPfkpkhYAeokpq0xlXZ9c1N8Nap9LZ
	j7b22CoOhK55GxKLlPV5O51FQLUWU95HHrYN6jIP+q2yC+fcF7nafhpxO2hiBPwnYw==
X-Google-Smtp-Source: AGHT+IGFJCBpCGKio3GvIQMtPQU0FwuQLnvFXOWRFKgHtvK/N12utXtZSpDgbRkZ6jpM9dmXhNWYM7k=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a05:690c:827:b0:667:8a45:d0f9 with SMTP id
 00721157ae682-67a004a2775mr1250767b3.0.1722198663143; Sun, 28 Jul 2024
 13:31:03 -0700 (PDT)
Date: Sun, 28 Jul 2024 13:29:58 -0700
In-Reply-To: <20240728203001.2551083-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240728203001.2551083-1-xur@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240728203001.2551083-6-xur@google.com>
Subject: [PATCH 5/6] AutoFDO: Enable machine function split optimization for AutoFDO
From: Rong Xu <xur@google.com>
To: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Vegard Nossum <vegard.nossum@oracle.com>, 
	John Moon <john@jmoon.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Mike Rapoport <rppt@kernel.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Rafael Aquini <aquini@redhat.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Eric DeVolder <eric.devolder@oracle.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Benjamin Segall <bsegall@google.com>, 
	Breno Leitao <leitao@debian.org>, Wei Yang <richard.weiyang@gmail.com>, 
	Brian Gerst <brgerst@gmail.com>, Juergen Gross <jgross@suse.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Kees Cook <kees@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Jan Kiszka <jan.kiszka@siemens.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>
Content-Type: text/plain; charset="UTF-8"

Enable the machine function split optimization for AutoFDO in Clang.

Machine function split (MFS) is a pass in the Clang compiler that
splits a function into hot and cold parts. The linker groups all
cold blocks across functions together. This decreases hot code
fragmentation and improves iCache and iTLB utilization.

MFS requires a profile so this is enabled only for the AutoFDO builds.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
---
 include/asm-generic/vmlinux.lds.h | 6 ++++++
 scripts/Makefile.autofdo          | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 97c8399e5532..7d9dc8a3c046 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -593,9 +593,14 @@ defined(CONFIG_AUTOFDO_CLANG)
 		__unlikely_text_start = .;				\
 		*(.text.unlikely .text.unlikely.*)			\
 		__unlikely_text_end = .;
+#define TEXT_SPLIT							\
+		__split_text_start = .;					\
+		*(.text.split .text.split.[0-9a-zA-Z_]*)		\
+		__split_text_end = .;
 #else
 #define TEXT_HOT *(.text.hot .text.hot.*)
 #define TEXT_UNLIKELY *(.text.unlikely .text.unlikely.*)
+#define TEXT_SPLIT
 #endif
 
 /*
@@ -611,6 +616,7 @@ defined(CONFIG_AUTOFDO_CLANG)
 #define TEXT_TEXT							\
 		*(.text.asan.* .text.tsan.*)				\
 		*(.text.unknown .text.unknown.*)			\
+		TEXT_SPLIT						\
 		TEXT_UNLIKELY						\
 		ALIGN_FUNCTION();					\
 		TEXT_HOT						\
diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index f765bd9e81d7..80ad06689947 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -6,6 +6,7 @@ CFLAGS_AUTOFDO_CLANG := -fdebug-info-for-profiling -mllvm -enable-fs-discriminat
 
 ifdef CLANG_AUTOFDO_PROFILE
 CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
+CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
 endif
 
 ifdef CONFIG_LTO_CLANG
@@ -14,6 +15,7 @@ ifdef CLANG_AUTOFDO_PROFILE
 KBUILD_LDFLAGS += --lto-sample-profile=$(CLANG_AUTOFDO_PROFILE)
 endif
 KBUILD_LDFLAGS += --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
+KBUILD_LDFLAGS += -plugin-opt=-split-machine-functions
 endif
 endif
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


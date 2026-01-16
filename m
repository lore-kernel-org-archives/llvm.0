Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413DB30FC20
	for <llvm@lists.linux.dev>; Fri, 16 Jan 2026 00:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768525128; cv=none; b=CfFAeZHu3TnMmBa/hIOVouFUArUpFauniI3iZZnpFYQSlbSi+w3nHR5xPjRtbKQD8LylDspnZGc0sDgUuJ5YndaLp3dMgqL/QDln5niXuI7wMuH2AR9vlbcLtXavSQrfk4qajIB5kT54vsMDeQ30Q5DrMJmCweGRuEtAkIRl+WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768525128; c=relaxed/simple;
	bh=nHFUsryZ8szs34hW30MiqG55J4pUKDGQJYOUyFsrPSo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 Cc:Content-Type; b=RzAN/bb9gjiwgGd6rb5SfkWMs/7dJQppIWC1t/MYmZ+haDEnn/80DdpFGr/JRx+kGo5VTrh/uG3CN8DajpdVPQo1fdWAEUtD4KrXeimdnEQzipLHM7MtYea9+MgsVyJFLpsmSWUXnwdkSfbfuuEubn7mjaBxoZPnYSkvX/Dqgq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gNiA28RM; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gNiA28RM"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34abec8855aso1185593a91.0
        for <llvm@lists.linux.dev>; Thu, 15 Jan 2026 16:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768525126; x=1769129926; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHoQLKEkjSbRJhkXlQg+W06E7SiS3vBTvquHybXdSeI=;
        b=gNiA28RM7I/YdzvJbsW0S+SgTE6QvKRutuU0hzXkBikgiGQCMO98nYsiFvvxg95sTW
         Y5Y8VL+oWpa7kvnZIzPpgITNfcb8gIgIL+u514v4dP9FEv4IsmqG3B8EOVvsgbHWIrCZ
         YvaGhi+GWR9ETg5GDBYBv/MlZoPUb4g2zGY793hRMRPjOxYbMMKuCajv2cbXMeCjXwiF
         GIYpavhvaDs8ehlKPOVvb+LC7xP2dF5V6VKZ2KzRVxk5S+IcFjYxSsqM6pl857MYXQfC
         jzin04O+5J5lHJdkfOW2qmd8CBnn24aHEE16OQnunN8qFXS+/SMwI6dJy4yHxGvx3/8q
         jVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525126; x=1769129926;
        h=content-transfer-encoding:cc:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gHoQLKEkjSbRJhkXlQg+W06E7SiS3vBTvquHybXdSeI=;
        b=RYt5G8kKYnN+HvyxRzIJ07pdump9vIC3Sx9kWicdQ1KQ2Yh4//8avShFeHVNutycdX
         hTKeeyI1w92rlLhHnLJPQDN72iL5qphCf9rZ7Joo0FFQpBPIqWHe08pBEAcqODTDY90a
         NZVvLLc3pLc9QsNnGZrWU8HbDje2/jbCISal7b/dsS5wX8mNf4eBfgQnlBHDlWufiBim
         qjL2frU4uZDY37EOPnwN4+hpsuxwGLK9N//fN0jvVnZXEUHrPKBNBpKmpN5Fn9i/7aOO
         Mju4vXqxuy263hK2EO7F3QvhehHyJ4UcJ84L6n9Ae94cqf+zku1rKRcZSyNddhc+hfmm
         uodQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5OCyLuM9HUDtYW5ZSQXJ3UDwguyLM05fnLMlNiyEs/C/Q6wFJ/Fg4qMSOaprCxyA87TkW@lists.linux.dev
X-Gm-Message-State: AOJu0YyX2tRoGJZ/k4URO3CiTSG5NRBI4e8IMf9cGy5V4efNlRQKhDjf
	hwjJtWi+xpak3YbNZwBCY6VFMh6Fcgh5JH5KKJCIWITd+PUeix0RfETd2L8c4GnSihWUElzDaR+
	M
X-Received: from pjog1.prod.google.com ([2002:a17:90a:8f01:b0:34c:3239:171f])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c09:b0:33b:a906:e40
 with SMTP id 98e67ed59e1d1-3527313c1a6mr960886a91.2.1768525126439; Thu, 15
 Jan 2026 16:58:46 -0800 (PST)
Date: Fri, 16 Jan 2026 00:57:57 +0000
In-Reply-To: <20260114193716.1740684-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260114193716.1740684-1-morbo@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260116005838.2419118-1-morbo@google.com>
Subject: [PATCH v4 1/2] Compiler Attributes: Add __counted_by_ptr macro
From: Bill Wendling <morbo@google.com>
Cc: Bill Wendling <morbo@google.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Marc Herbert <Marc.Herbert@linux.intel.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Tejun Heo <tj@kernel.org>, Jeff Xu <jeffxu@chromium.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	"=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <thomas.weissschuh@linutronix.de>, John Stultz <jstultz@google.com>, 
	Christian Brauner <brauner@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Brian Gerst <brgerst@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Nicolas Schier <nsc@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Naman Jain <namjain@linux.microsoft.com>, Simon Horman <horms@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Douglas Anderson <dianders@chromium.org>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Introduce __counted_by_ptr(), which works like __counted_by(), but for
pointer struct members.

struct foo {
	int a, b, c;
	char *buffer __counted_by_ptr(bytes);
	short nr_bars;
	struct bar *bars __counted_by_ptr(nr_bars);
	size_t bytes;
};

Because "counted_by" can only be applied to pointer members in very
recent compiler versions, its application ends up needing to be distinct
from flexibe array "counted_by" annotations, hence a separate macro.

This is a reworking of Kees' previous patch [1].

Link: https://lore.kernel.org/all/20251020220118.1226740-1-kees@kernel.org/=
 [1]
Co-developed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Kees Cook <kees@kernel.org>
Signed-off-by: Bill Wendling <morbo@google.com>
---
v4 - Default to Clang's version 22, which has support for "void *".
   - Add the missing S-o-b notation.
v3 - Replace the previous code with a modified version of Kees'
     previous patch [1].
   - The question about the naming of the macro was considered, but we
     decided to keep the original naming (__counted_by_ptr), because it
     mirrors the current macros like "__counted_by_{le,be}".
v2 - Add support for GCC.
---
Cc: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Marc Herbert <Marc.Herbert@linux.intel.com>
Cc: Uros Bizjak <ubizjak@gmail.com>
Cc: Tejun Heo <tj@kernel.org>
Cc: Jeff Xu <jeffxu@chromium.org>
Cc: "Michal Koutn=C3=BD" <mkoutny@suse.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Cc: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
Cc: John Stultz <jstultz@google.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Brian Gerst <brgerst@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
Cc: llvm@lists.linux.dev
---
 Makefile                       |  6 ++++++
 include/linux/compiler_types.h | 18 +++++++++++++++++-
 include/uapi/linux/stddef.h    |  4 ++++
 init/Kconfig                   |  7 +++++++
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9d38125263fb..6b029f694bc2 100644
--- a/Makefile
+++ b/Makefile
@@ -952,6 +952,12 @@ KBUILD_CFLAGS	+=3D $(CC_AUTO_VAR_INIT_ZERO_ENABLER)
 endif
 endif
=20
+ifdef CONFIG_CC_IS_CLANG
+ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
+KBUILD_CFLAGS	+=3D -fexperimental-late-parse-attributes
+endif
+endif
+
 # Explicitly clear padding bits during variable initialization
 KBUILD_CFLAGS +=3D $(call cc-option,-fzero-init-padding-bits=3Dall)
=20
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.=
h
index d3318a3c2577..d095beb904ea 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -369,7 +369,7 @@ struct ftrace_likely_data {
  * Optional: only supported since clang >=3D 18
  *
  *   gcc: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108896
- * clang: https://github.com/llvm/llvm-project/pull/76348
+ * clang: https://clang.llvm.org/docs/AttributeReference.html#counted-by-c=
ounted-by-or-null-sized-by-sized-by-or-null
  *
  * __bdos on clang < 19.1.2 can erroneously return 0:
  * https://github.com/llvm/llvm-project/pull/110497
@@ -383,6 +383,22 @@ struct ftrace_likely_data {
 # define __counted_by(member)
 #endif
=20
+/*
+ * Runtime track number of objects pointed to by a pointer member for use =
by
+ * CONFIG_FORTIFY_SOURCE and CONFIG_UBSAN_BOUNDS.
+ *
+ * Optional: only supported since gcc >=3D 16
+ * Optional: only supported since clang >=3D 22
+ *
+ *   gcc: https://gcc.gnu.org/pipermail/gcc-patches/2025-April/681727.html
+ * clang: https://clang.llvm.org/docs/AttributeReference.html#counted-by-c=
ounted-by-or-null-sized-by-sized-by-or-null
+ */
+#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
+#define __counted_by_ptr(member)	__attribute__((__counted_by__(member)))
+#else
+#define __counted_by_ptr(member)
+#endif
+
 /*
  * Optional: only supported since gcc >=3D 15
  * Optional: not supported by Clang
diff --git a/include/uapi/linux/stddef.h b/include/uapi/linux/stddef.h
index 9a28f7d9a334..111b097ec00b 100644
--- a/include/uapi/linux/stddef.h
+++ b/include/uapi/linux/stddef.h
@@ -72,6 +72,10 @@
 #define __counted_by_be(m)
 #endif
=20
+#ifndef __counted_by_ptr
+#define __counted_by_ptr(m)
+#endif
+
 #ifdef __KERNEL__
 #define __kernel_nonstring	__nonstring
 #else
diff --git a/init/Kconfig b/init/Kconfig
index fa79feb8fe57..96b7cd481eaa 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -143,6 +143,13 @@ config CC_HAS_COUNTED_BY
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108896
 	default y if CC_IS_GCC && GCC_VERSION >=3D 150100
=20
+config CC_HAS_COUNTED_BY_PTR
+	bool
+	# supported since clang 22
+	default y if CC_IS_CLANG && CLANG_VERSION >=3D 220000
+	# supported since gcc 16.0.0
+	default y if CC_IS_GCC && GCC_VERSION >=3D 160000
+
 config CC_HAS_MULTIDIMENSIONAL_NONSTRING
 	def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__)) =3D=
 { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
=20
--=20
2.52.0.457.g6b5491de43-goog


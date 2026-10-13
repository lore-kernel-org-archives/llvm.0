Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515A7563298
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 22:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931221; cv=none; b=PEu7gC6seVbcunOudjm3u2Mdu92b+sIju2jvTUBGS63WVXTA45zGUUWM6b6pCky/F3hTo6GIYzG/m/opduliq0K2tC9MCUIzaPOENMlCxO/Ja5WIyac7w8V52HligN2JhaDUGeb44WV7V77dJ4rTT6b2+ohSSag3wjiz3hB1hik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931221; c=relaxed/simple;
	bh=Em27O2OyO7l+P8tBXhGlDjdSvn4vy+iPZ8ia1MGPgrk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N3I3CHS8Ruh3t/BX+Bl+uH8cdSOqtIn/0fMLg+LTS8zTWSb2LkKhzF1eLr5+53UsA3nOhPjlCKB2KjbTGVsNqQockp57Mx+GMyzMfRV80X21tAlhW3BFhaegFDxMfymN3G5HS082uWogIcTDtmeH+ZwJqQIUhCxS9AhWG+hbKac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bLdiBfut; arc=none smtp.client-ip=74.125.82.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bLdiBfut"
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1663fb7e005so4564589c88.0
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 15:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931215; x=1792536015; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zS2ZTWNtYHltA9QytinDsw+p3+JtthDKSkNq3q9AYXg=;
        b=bLdiBfutco5zmWqCl+t8/YrIQhbYOmc+Bfu0jjajJN1Kn71HJpLYgOzD5tfoULvltG
         SVZ6ygZAP7wCM4Wpfc5Zhs5Ti7Zj8HfRY2aCOutNlarIKNhdV3sODw+8+kDDPtOtQCAP
         nIbLUZntt8wcVo1tAt4NtpWDcFPwDTA0RMtclH6fg7h1ULiHkAIT3WXEMbD+u8LRVaMo
         2y7CwutNYcZ1IMxxhliCTostwkep9d3kt+gJ4Fi9o269641ZdrIUXKA6a6hc+UMUdyos
         Dqt5ZeMAEbnflmjwFz7gj7AK+QhFDaN3j7/Lul2y3hgtcDDYF9WLROqMr5kRVoiqJ8UZ
         EP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931215; x=1792536015;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zS2ZTWNtYHltA9QytinDsw+p3+JtthDKSkNq3q9AYXg=;
        b=r6taFIlPwEgu2mblinrQLwusazZ347ND+uqGz6VECtvMsMbUsRVUtpHlf8elF71O5e
         f+9epEGbcO9sVZtcW4DTky8S+AqEgJMBWtNmLoYl6Ensuh99eWZGYJAswPz+csYitcgT
         5JGeZxvXu8V3U8tgeOzpip2SC+gWOs/bf7yCxJLKyb1pUJuGHi0qlD7FIgyKnNT3tAKs
         MjWdlsEt6mHMJAd5IF2J2Ob0ixrJ/nWAaJTpkxW6+Muj2chEZ08pkJlbskBBEvyvYjj/
         8U+uxxSRNHHWQqm+z6HiNymQzRuTvmgugYKW8ICg5Igo09hJww3rCkxBa71bDbLfx/p9
         AOeQ==
X-Forwarded-Encrypted: i=1; AKwUvBys9te09VAMdbPxaD4JasF8xsXmNqRiKzRbaT9Cr34IMCoxZldVigTwmjw5qKxRAw890Ryz@lists.linux.dev
X-Gm-Message-State: AFq9FYKl9cXx6Q2BE74AtrW6cHVV+LNS1nA3Qs5aKWTM+TWhkdYHRcWY
	8RgpufVEuwWgPc2Z8aLvGdWgMCW0ucDlNKV0woR83alQndeNO63Jfh08bNIcHtZ0GsPiNiHSCkQ
	AErp7tN79bA==
X-Received: from dlbvs3.prod.google.com ([2002:a05:7022:3f03:b0:16a:e18b:92ba])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4553:20b0:166:9e0d:3b56
 with SMTP id a92af1059eb24-16a6384d0c8mr17137930c88.38.1791931214565; Tue, 13
 Oct 2026 15:40:14 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:36 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-2-irogers@google.com>
Subject: [PATCH 01/11] Compiler Attributes: Add __require_explicit_initialization
 macro
From: Ian Rogers <irogers@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Clang supports the 'require_explicit_initialization' attribute on struct
fields to indicate that a field must be initialized explicitly by the
user when the object is constructed. When an aggregate initializer or
uninitialized variable omits an annotated field, Clang emits a
-Wuninitialized-explicit-init warning (enabled by default).

Add the __require_explicit_initialization macro to
include/linux/compiler_attributes.h (which is included by
include/linux/compiler_types.h and include/linux/compiler.h) so kernel
structs with error-prone initialization (such as mandatory callbacks or
cleanup handlers) can enforce explicit initialization at compile time,
as discussed at the Linux Plumbers Conference.

Also teach Sphinx (Documentation/conf.py), kernel-doc
(tools/lib/python/kdoc/xforms_lists.py), and checkpatch.pl about the new
attribute macro.

Link: https://lpc.events/event/20/contributions/2392/
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 Documentation/conf.py                 |  1 +
 include/linux/compiler_attributes.h   | 11 +++++++++++
 scripts/checkpatch.pl                 |  1 +
 tools/lib/python/kdoc/xforms_lists.py |  1 +
 4 files changed, 14 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 5ab26ce89daf..3e5cb9ca0970 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -203,6 +203,7 @@ c_id_attributes = [
     "__noreturn",
     "__packed",
     "__pure",
+    "__require_explicit_initialization",
     "__section",
     "__always_unused",
     "__maybe_unused",
diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index 476c4c560d17..60522ab80c5a 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -322,6 +322,17 @@
  */
 #define __pure                          __attribute__((__pure__))
 
+/*
+ * Optional: not supported by gcc
+ *
+ * clang: https://clang.llvm.org/docs/AttributeReference.html#require-explicit-initialization
+ */
+#if __has_attribute(__require_explicit_initialization__)
+# define __require_explicit_initialization __attribute__((__require_explicit_initialization__))
+#else
+# define __require_explicit_initialization
+#endif
+
 /*
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-section-function-attribute
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html#index-section-variable-attribute
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8a7787d228a6..4a3ae6b0100a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6871,6 +6871,7 @@ sub process {
 				"noreturn"			=> "__noreturn",
 				"packed"			=> "__packed",
 				"pure"				=> "__pure",
+				"require_explicit_initialization" => "__require_explicit_initialization",
 				"section"			=> "__section",
 				"used"				=> "__used",
 				"weak"				=> "__weak"
diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index e3dda2fe8a53..32066fbbe763 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -36,6 +36,7 @@ class CTransforms:
         (CMatch("CRYPTO_MINALIGN_ATTR"), ""),
         (CMatch("__private"), ""),
         (CMatch("__rcu"), ""),
+        (CMatch("__require_explicit_initialization"), ""),
         (CMatch("____cacheline_aligned_in_smp"), ""),
         (CMatch("____cacheline_aligned"), ""),
         (CMatch("__cacheline_group_(?:begin|end)"), ""),
-- 
2.56.0.385.gd3acb90ef8-goog


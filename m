Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1089E1BD515
	for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553121; cv=none; b=hgVe4rZBf8fTc/lYz1+SpOHg0V36hogZOiefBxGxducqbEvVf/VMJBd63EmeVsoUtC9YAyGZXLUhsbA0q8FGDyFYCNfGe1p7uE8vjZwN1YFwIonUJ5tHd85Cf3TbiaUe3jVamSSxvpVgCIEQ0QGZMP3wAfMtjM3u3Zn5qSSxG20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553121; c=relaxed/simple;
	bh=sprZWicbSYX/wuK86XaKNqOKKGSxgjIajbIesmsLRa8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d07xIG/6RSEfKt6TEeb35pxBKg2Ba5Ewha1Q9yuxcQtO7MsRPzIWrXpWjpL0Mtxax3dqap/blxjfrjPkUa7gdnCNoyG8npBciscGbl6RPnGa6jUFL/wnyuqKAy7I+/4MrDvn/NgnejScwIZTxR0C2D8/3So7qEEPW4BVH1oGXm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZPX3pw5Z; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZPX3pw5Z"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e28edea9af6so909417276.3
        for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 02:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728553118; x=1729157918; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O+AhvaeBWw5/RdolKgGnr5greoh9tZKs03Mr9gvw9kc=;
        b=ZPX3pw5Z4tyKMsPGOuP1hpjJDNhg8XC6LpVUJZfuMGMfC3/XZ/oDAen7WECoaXxmaB
         a5F8iZIfzRmit9tl2qpjgMzEuNSXWLmTShXOPm3dID+tQ8RB/gdf9GCeOZJipFgQE1Km
         D5a+338AVunU1lZTiGSosqpi/aEQWQH7u8ysuBQOtgleWBtgTBg9wykAbBcsSTmGP1ty
         e0N0AieHP0TTqvo/slGRXVqyMwlHNBb0D05LrR0wj61EZhzWBnx7KQetjol/ENumoFAW
         /hP2xmPRU8/ajdtu7LNmMugGr4YTChJvbhgxeMB/s7ysJIqtxqjBbludKI4e3p+FSh9a
         dsbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728553118; x=1729157918;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+AhvaeBWw5/RdolKgGnr5greoh9tZKs03Mr9gvw9kc=;
        b=kf2yZ8x4OM4CzmA54zGKqXOcep9PDlz1HVZnWso/TpOx103HzoDol2FTTqgzv/93Qr
         fU2L7MQ8nj6dQS0EkG8+a9mntrRM3fHgjwY8JivtOPVkFWC+4Io1Xs1KuBUi8iJ5VH6J
         wwJXb3HVzg9zJWZvhFRdi5vt1PlqRceIxSsJB8BYiWChZ+iU3Pks98LN2zd1tuhP6GyF
         aZaYBrGBfG7D/GMi45K+aJToHLomtfzeDa3snvOeryY3DB7StbjrO5k8KFvmRunGXQ6V
         2SghkCkxOq01jIBg390WlR4kRJtPrOmCpG2fjx1mAMMwkFNLAa11321FdRcUZM1Jc8tZ
         9rzA==
X-Forwarded-Encrypted: i=1; AJvYcCWM11EocN+SdWjhDMVKghYz9cHBjWHxZEgAzs3DNBPcS8kWUT528OV+wAJeboOdPQVBQe2r@lists.linux.dev
X-Gm-Message-State: AOJu0YxPsWrGkkaJN0FjsDTd+3RICzhQo1PXs0uomctA7+Un9VxG1fw6
	rAfrSES/qFEnMuR8pkVbM/VXyQp91BCDCIZWSgk3jOgkWImxq6Kl7h9u/0Bk0Ty++75RH+qHZvn
	It1t0g0ns5ahURQ==
X-Google-Smtp-Source: AGHT+IGeUBivrsQSq+PuNVUTTRBZI+h4vM5m+PDMtlURQ9Ehj+kRy0g7Kk3HN2DNX8RKbhDakX9kqmGo1oBnmoc=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:d681:0:b0:e0b:a712:2ceb with SMTP id
 3f1490d57ef6-e28fe3665b7mr121379276.5.1728553118005; Thu, 10 Oct 2024
 02:38:38 -0700 (PDT)
Date: Thu, 10 Oct 2024 09:38:26 +0000
In-Reply-To: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3960; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ioyjOajrFUcSJsPSpIsZJ5SxB5UOY0I6EBrBjM/1voU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnB6CYAC51tAnp8Qhdz59K5IFjoWW12e6tR9tLn
 kG/RmSvGhaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZwegmAAKCRAEWL7uWMY5
 RgmyEACujMB3w0rEef116bx1bRT21n1YSunfGZXdQCCu2RtRyUVgsAEUwAVB5pdwVkC4eO9k2y4
 J/0P5OFmndf5+KsZZT6jdQdRtUkNY8h/5fUPuTNsLQZt4LEgQ4MQyqbC6/hJWb9ZfrXZGokMuYk
 NPi5w6WZScxVBt9QEKvSCQ0AlJ0Q+1WvZbt3JJBKLZOhVJPlQZXik7JbThTpSdZzkVPp+MM/HKc
 zP6pz5u+VmWY7AqGTE/N1n2FgHIe8Ooyl9l5lWwbX0tXfmHPdAfZ6o8A0EQHT4MUHzM5263Qn9R
 /CoMZ61NeRmxv9nAlddUSP9xEokmrVy5CdIHQINBKsvaGjnuXrg0kpaaFWvvrXNO4zxsPaOy19M
 owZX8cAsQQ0wFtN3lrRuy5FkSlhWgnjPYEIbI7YW0uY005s6dhdRFXSJ665W0KcPG6Q9FKJiW7m
 hauSngZ5cbsX55pxwJVDXXZJ0rxbX8ySptvJeCUmoi87os8k0vy8FwUvbpdrAL2dgibjLbgRb+J
 kwDlcUEtlnNnltQST23BIiQm3Erw7fHHdbeC0Igr5CWNKGEIXvk36XAdt2dDb4tU4jOq0t5aCVQ
 mKOsr+/PeiQ9vHdAhu97yN5Jqtp85cbystbJ0XaJNX80jGj5HcMzRwB87Q4nX8NJkU98RoQbEQK HoWTPx+0j4qrp6w==
X-Mailer: b4 0.13.0
Message-ID: <20241010-icall-detect-vers-v1-1-8f114956aa88@google.com>
Subject: [PATCH 1/2] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
From: Alice Ryhl <aliceryhl@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

From: Gary Guo <gary@garyguo.net>

Each version of Rust supports a range of LLVM versions. There are cases where
we want to gate a config on the LLVM version instead of the Rust version.
Normalized cfi integer tags are one example [1].

For consistency with cc-version and ld-version, the new version number is added
to the existing rustc-version script, rather than being added to a new script.

The invocation of rustc-version is being moved from init/Kconfig to
scripts/Kconfig.include to avoid invoking rustc-version.sh twice and for
consistency with cc-version.

Link: https://lore.kernel.org/all/20240925-cfi-norm-kasan-fix-v1-1-0328985cdf33@google.com/ [1]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 init/Kconfig             |  6 +++++-
 scripts/Kconfig.include  |  4 ++++
 scripts/rustc-version.sh | 31 +++++++++++++++++++++++++------
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 530a382ee0fe..98cf859d58c2 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -62,7 +62,7 @@ config LLD_VERSION
 
 config RUSTC_VERSION
 	int
-	default $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
+	default $(rustc-version)
 	help
 	  It does not depend on `RUST` since that one may need to use the version
 	  in a `depends on`.
@@ -78,6 +78,10 @@ config RUST_IS_AVAILABLE
 	  In particular, the Makefile target 'rustavailable' is useful to check
 	  why the Rust toolchain is not being detected.
 
+config RUSTC_LLVM_VERSION
+	int
+	default $(rustc-llvm-version)
+
 config CC_CAN_LINK
 	bool
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 785a491e5996..788097a55731 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -65,6 +65,10 @@ cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$
 m32-flag := $(cc-option-bit,-m32)
 m64-flag := $(cc-option-bit,-m64)
 
+rustc-info := $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
+rustc-version := $(shell,set -- $(rustc-info) && echo $1)
+rustc-llvm-version := $(shell,set -- $(rustc-info) && echo $2)
+
 # $(rustc-option,<flag>)
 # Return y if the Rust compiler supports <flag>, n otherwise
 # Calls to this should be guarded so that they are not evaluated if
diff --git a/scripts/rustc-version.sh b/scripts/rustc-version.sh
index 4e22593e2eab..24e19ed8f234 100755
--- a/scripts/rustc-version.sh
+++ b/scripts/rustc-version.sh
@@ -3,14 +3,23 @@
 #
 # Usage: $ ./rustc-version.sh rustc
 #
-# Print the Rust compiler version in a 6 or 7-digit form.
+# Print the Rust compiler version and the LLVM version it uses in a 6 or
+# 7-digit form.
+
+# Convert the version string x.y.z to a canonical up-to-6-digits form.
+get_llvm_canonical_version()
+{
+	IFS=.
+	set -- $1
+	echo $((10000 * $1 + 100 * $2 + $3))
+}
 
 # Convert the version string x.y.z to a canonical up-to-7-digits form.
 #
-# Note that this function uses one more digit (compared to other
-# instances in other version scripts) to give a bit more space to
+# Note that this function uses one more digit (compared to other instances in
+# other version scripts and the instance above) to give a bit more space to
 # `rustc` since it will reach 1.100.0 in late 2026.
-get_canonical_version()
+get_rustc_canonical_version()
 {
 	IFS=.
 	set -- $1
@@ -19,8 +28,18 @@ get_canonical_version()
 
 if output=$("$@" --version 2>/dev/null); then
 	set -- $output
-	get_canonical_version $2
+	rustc_version=$(get_rustc_canonical_version $2)
 else
-	echo 0
+	echo 0 0
 	exit 1
 fi
+
+if output=$("$@" --version --verbose 2>/dev/null | grep LLVM); then
+	set -- $output
+	rustc_llvm_version=$(get_llvm_canonical_version $3)
+else
+	echo 0 0
+	exit 1
+fi
+
+echo $rustc_version $rustc_llvm_version

-- 
2.47.0.rc0.187.ge670bccf7e-goog


Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419584DA03
	for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 10:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730284303; cv=none; b=VmAAcjukcVbC1/9M1WGv22b5FYmAot1HuKDDJ8dbjH1jurMADmilEOQUUSRpok8svW5dUmJ0InNtmr6mzBWavIAM1qYR2trIqTHB8W/1u75JAtpawTDcRugHV9e+lj0dh4xENLVzWVvx7SdoQNf2eMih9Zh7mJfOc2M1mbR67cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730284303; c=relaxed/simple;
	bh=HJK67huFrgBbh0oq3D9/SSpm2m6CsdbT12PbWndMQ+Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ff57xCI9dr9cLyIZZ7zTdHU2l6cdCg29k/kXP6TMWoPUV6RyUBF9uCJnb1qJkyA60JHYOVo+NagsTLCtFy1OehOoJSkFAGc6s3W6bFCDqSRWNXUu/x+mvzGnWHlonFccTttdfNKL53nudS8rmJmug7ZLk4yrTwhlDH0+xufi7r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3iwGYvOr; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3iwGYvOr"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-37d458087c0so485688f8f.1
        for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 03:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730284300; x=1730889100; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k6MdjXaWjXuXFvZiq7sXgM/XS2xMntv/yleDKxQ87K8=;
        b=3iwGYvOr6i1B6OMyuJn2ou+y2nfUNLu+XTvJYTQFiHBUSTWsc6YW4qY4DZPj70GCqh
         Q2Yz+5tueFhlWeb2oxF5DGEVX6yt0QBWOyEl5iV+ZYM8A7jGal4QzIeheZzU6AczRXZy
         N2nHzKA5vi2EpklrTSqEAvyCugRtH/P/w2OunGFFP1LEL6/3yUKau52YyoJ9XfmzGUUK
         cUgt/cf3dL3QCzE0UtOI30TXyl3L7SHt7l1hmp/5Fl4iu8D9eCZEONFagqg14t7t3k3/
         1LKdThB4bliNVUyoNq6kCYhYg/d+VaYmibK3Lf3ihzpzxgHCH+pYKwGfBR9q/fX8pGiB
         QWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730284300; x=1730889100;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k6MdjXaWjXuXFvZiq7sXgM/XS2xMntv/yleDKxQ87K8=;
        b=G+dDSpElIM268vSOq+FdPPd9q7jw+6wPWDEV7sda7QZIFwa90w7poDwWjXGXAQhQa8
         PQuyAu+13xjF286ta0eaTl1tr8A09aU77+0ybXpf9txC7zzVzKku+DfhZLt8A+fjN+X6
         3Rk/WUXoqR9q5M4JHGVSn14cggnfnvcsAg+QJa1VQ/N1zWDeCKKzFrCRvyTZjHfrEEzq
         OqGEJ8Powo6vii/MfsH+d/GqV6Ex3DlHkI7R+6OkHjVBX0TSlXs383Ga7trHnHqBIx9R
         y0Qv4q7LZeAsd1QbVdudnjlb3o3hPMoOk4Ypmw0gChS+SUWbzYcf9V99MWLmAHT9A2rh
         wKVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxvm/S3fiZSCcpb8tCBhlkDmbyFtXFLis5PMTEwM+p69+W1R2TugavRcezaeyu6kBLfUd9@lists.linux.dev
X-Gm-Message-State: AOJu0YySXA1BXCquiPtxDlgUlM+hYApCsRjLTn5MLtv1KcJS/8+xcmEP
	C9qkUz6fNwFSnvm01/RwHlLgCGxZ7tdWL2oeUJCmRX+IZbyD7Ynics8Y2UbTqEcOZOvz9HCxkBR
	CeSARKws9pwItmw==
X-Google-Smtp-Source: AGHT+IFnZQr30Y+M2jhTAmoir5ZrxKPXp/akJvD704Eg2oZKQaaz30lDM/zqxKc6KNIUk1EYIT5KPVY3MJkj4sQ=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:adf:ee0e:0:b0:37d:3878:ff42 with SMTP id
 ffacd0b85a97d-381b97ee8ffmr2906f8f.5.1730284299740; Wed, 30 Oct 2024 03:31:39
 -0700 (PDT)
Date: Wed, 30 Oct 2024 10:31:34 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAULImcC/x3MQQqAIBBA0avErBvQsSi7SrQwnWogLBQiiO6et
 HyL/x/InIQzDNUDiS/JcsQCXVfgNxdXRgnFQIoarYxCvwiKd/uO2mqDwba9CYEcdTOU6Ey8yP0 Px+l9PzrYWaVgAAAA
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1882; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=HJK67huFrgBbh0oq3D9/SSpm2m6CsdbT12PbWndMQ+Y=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnIgsIDkprsQHnquBzdddO8VG6yBx2gIzt/R/V5
 lOhbSIB5+qJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZyILCAAKCRAEWL7uWMY5
 Rg26EACVKjteAW4c2ejRnwDxOvD+WRYhuqP2MXBTJDi14yPKpgXf5UV7MXboKuBCpFJJuOXVePc
 WBanDEMSZZFSxR7lvkXUZLLwJd/sdKiZ13Zkoa2Q9KletFcqEGPFU7TMU0+pa6GccYWOYSBkNjv
 pndYPVexIcfWKGapv5dJvqJl6J/l9qeMkGfVSUOnEJdVlk3U/5x3238QmhaWFrOwruu6FkVx/Ns
 u1XpYfQY6MxpgUJNVejZ3iY5gOdnwiB1/7lzkHPDiQUm1ceipEz2mXamJ9Hsn5ORv3s3En5YJNo
 8DOwVj9owfmZMLU8BKJ+zQ9XBN+6JLQmOJ3/u6BzzPYryBhL9Gn/Qs+b5h/KYFd6Se4xGX0GyiR
 1uuLVlSiE/TrT00Uf4UWqKgMw/UGAhBtybtQqO/cuWuvlgVysD3NIuA0Bd11hcOZUhtbP40ybBf
 Awn6DMPJjSm9Hzm43vsBAryKKeCEOjM34MubEip40az9Ts5LAjIC/NZBcpVSl0JYlLMUhDvR3He
 s79reSUwhw4CkZEWcrqw6plhWTaYwMwzaTGnVQujYbHobrvADtywiDPs5rDroCkdulGQ3sxAjRT
 7cJSvjVU5GReIi4IlrQZoHJDgrP72U5PZi0NXkvURae6I/UWJD0gIHNURf0wJi+uolSh+iHeOsy s/2OSs2/mRYqwiA==
X-Mailer: b4 0.13.0
Message-ID: <20241030-cfi-icall-1913-v1-1-ab8a26e13733@google.com>
Subject: [PATCH] cfi: tweak llvm version for HAVE_CFI_ICALL_NORMALIZE_INTEGERS
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, kernel test robot <oliver.sang@intel.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The llvm fix [1] did not make it for 19.0.0, but ended up getting
backported to llvm 19.1.3 [2]. Thus, fix the version requirement to
correctly specify which versions have the bug.

Link: https://github.com/llvm/llvm-project/pull/104826 [1]
Link: https://github.com/llvm/llvm-project/pull/113938 [2]
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202410281414.c351044e-oliver.sang@intel.com
Fixes: 8b8ca9c25fe6 ("cfi: fix conditions for HAVE_CFI_ICALL_NORMALIZE_INTEGERS")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 arch/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 00163e4a237c..bd9f095d69fa 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -855,14 +855,14 @@ config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
 	def_bool y
 	depends on $(cc-option,-fsanitize=kcfi -fsanitize-cfi-icall-experimental-normalize-integers)
 	# With GCOV/KASAN we need this fix: https://github.com/llvm/llvm-project/pull/104826
-	depends on CLANG_VERSION >= 190000 || (!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
+	depends on CLANG_VERSION >= 190103 || (!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
 
 config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 	def_bool y
 	depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
 	depends on RUSTC_VERSION >= 107900
 	# With GCOV/KASAN we need this fix: https://github.com/rust-lang/rust/pull/129373
-	depends on (RUSTC_LLVM_VERSION >= 190000 && RUSTC_VERSION >= 108200) || \
+	depends on (RUSTC_LLVM_VERSION >= 190103 && RUSTC_VERSION >= 108200) || \
 		(!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
 
 config CFI_PERMISSIVE

---
base-commit: 8b8ca9c25fe69c2162e3235c7d6c341127abeed6
change-id: 20241030-cfi-icall-1913-d9583dd2a27b

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


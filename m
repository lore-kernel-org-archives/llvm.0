Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500171AC43A
	for <llvm@lists.linux.dev>; Sat,  2 Nov 2024 17:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730569889; cv=none; b=Z+kwb7tXZTCY/gpi+fH/uEHsSM/7eImuB/pl99c84GCCtQqVHm2R7tD3RUTsOO5PaRx55Khwjb3ezMroyZ0QNFT1CZBfjdKnV7m6gXHoDxKQubr6vdIpWet6yYEGbwxc+sk738t0Iks2C2OTwQiutE7fe8Z12CFUBnrvIpQcGuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730569889; c=relaxed/simple;
	bh=JvxcRd6YmtrCl+GZCGplZl/ZNrWqWevvQT1yH4/zYYQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ts/kpCylv1px92LGRcbqVOEs56o7a7DpRzMrS2o+6VPeJngYCvttMb+XBQ8+32ysZ2cdQBKOeZV0nPmu8Ua89Xr3xinVNym889quZbo16Lpx7R/B4/C+Id/0KePSh+os+Kj2H4IN0wHpZx+hbEHGiOD9uNv8Taz0R9U9QDTH5jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KuBbY9pu; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KuBbY9pu"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e7fb84f99cso61149967b3.1
        for <llvm@lists.linux.dev>; Sat, 02 Nov 2024 10:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730569885; x=1731174685; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aocsS2GBm0tKtUkt4oMs70MBTwqe0y0WT7ej9bCD6/M=;
        b=KuBbY9puq9/B0hcd4Ng8Dei+24fZR5icHarSQB78rZ5XXUcAIiE8W9YhSsYqflkO2z
         9o2GcCDDbXdQmYP/x0hQaGjnsE/GHMPcB1RM32vT9/MNl4lMoYm76XsYxN8u/LzRLCIj
         7dKHyiOZlgduAruY8SJ01rJl5gvIkH5WnNbBlpXFZ1gEBqFF3ygvqpKWapGxQCBFpT8u
         j7d8IXR3+TrOeroSUl+bS4kODLi00V80teAxk+ABkcZXPJP+I5TCARzsy1PiB9jHPOP0
         UzFX4CT0ZfreLH2ccqKNyTywfV/UDNNrX45MPJT7COKqfHLVT/gfeZIyTuJXzB4TO51z
         OgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730569885; x=1731174685;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aocsS2GBm0tKtUkt4oMs70MBTwqe0y0WT7ej9bCD6/M=;
        b=Uxhq39Y+MqeT3rfz+IaiWbvof1izTd00El7biCQKQXLcJ/GG/3XJiuriH2t1sSCRjU
         fNTHZL6hMl5ejWPL4QHrj7xmGvQXG4KJCmJK6NmDZ+MHxcOEZptc9XcziRGcaKURETcU
         7AEa2t0gRWK/EdlkE9akBSFddZwxggN3SRp4z6jNjqOWgYQUYC8vpldOQpM51ZO8MshK
         eAauGZFrBs2RW5J5592/s2FaivK7H+88OMCVFPLp1lquAGDCeLpqlL/7q4yu0bbE/0BP
         yJ/o5TE0eDKkNU65tckzbdSJc4tSMxqVhC3j0MErDCSY24wdexk6jC7FR23BSyFOMFlV
         FkIg==
X-Forwarded-Encrypted: i=1; AJvYcCWyqvnyTJ79MD44Q/+/tItbpcium5z7BIPzmgZKQzPcjNjjeBarxYzCPzOrTlgSph9beHVI@lists.linux.dev
X-Gm-Message-State: AOJu0YxHNaVSVJ/VR8bPXWmoFreMgI8Rp9f79L60KH0lg7IZ/KqZ6sjg
	AcTG/kzOXVp+CKrg2WD8rQ+LDBkUeh8I8/++bpM3EwX0SHBKpXtClrYFvhLQqPnF6Q==
X-Google-Smtp-Source: AGHT+IHgnJ0YhCd1EkSEz+tdwpvNNsyp+LcO1wOdC/OUzSn1flY0X31/t3eGDeD9oP/MyR4nmcAVYVE=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a5b:f0f:0:b0:e2e:2cba:ac1f with SMTP id
 3f1490d57ef6-e3087bd5414mr138970276.6.1730569885221; Sat, 02 Nov 2024
 10:51:25 -0700 (PDT)
Date: Sat,  2 Nov 2024 10:51:11 -0700
In-Reply-To: <20241102175115.1769468-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241102175115.1769468-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241102175115.1769468-5-xur@google.com>
Subject: [PATCH v7 4/7] Add markers for text_unlikely and text_hot sections
From: Rong Xu <xur@google.com>
To: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>
Cc: x86@kernel.org, linux-arch@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Add markers like __hot_text_start, __hot_text_end, __unlikely_text_start,
and __unlikely_text_end which will be included in System.map. These markers
indicate how the compiler groups functions, providing valuable information
to developers about the layout and optimization of the code.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Tested-by: Yonghong Song <yonghong.song@linux.dev>
Tested-by: Yabin Cui <yabinc@google.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 include/asm-generic/vmlinux.lds.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index fd901951549c0..e02973f3b4189 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -549,6 +549,16 @@
 		__cpuidle_text_end = .;					\
 		__noinstr_text_end = .;
 
+#define TEXT_UNLIKELY							\
+		__unlikely_text_start = .;				\
+		*(.text.unlikely .text.unlikely.*)			\
+		__unlikely_text_end = .;
+
+#define TEXT_HOT							\
+		__hot_text_start = .;					\
+		*(.text.hot .text.hot.*)				\
+		__hot_text_end = .;
+
 /*
  * .text section. Map to function alignment to avoid address changes
  * during second ld run in second ld pass when generating System.map
@@ -565,9 +575,9 @@
 		ALIGN_FUNCTION();					\
 		*(.text.asan.* .text.tsan.*)				\
 		*(.text.unknown .text.unknown.*)			\
-		*(.text.unlikely .text.unlikely.*)			\
+		TEXT_UNLIKELY						\
 		. = ALIGN(PAGE_SIZE);					\
-		*(.text.hot .text.hot.*)				\
+		TEXT_HOT						\
 		*(TEXT_MAIN .text.fixup)				\
 		NOINSTR_TEXT						\
 		*(.ref.text)
-- 
2.47.0.163.g1226f6d8fa-goog


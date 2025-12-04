Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45EE30FF3B
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834926; cv=none; b=SjHGiw/N4JnC8wUVYXCr+dgM6zGkSdghgcU2FdiNtpeSFfyzRR+7z+IqLhQfPLeBdPcJNxxgqgIcaWrG+kLEbk3x+NJZfw3o5ZxRAPpC/oKdAjdTbR2uHwUHfrXUy3QgwxpCBnKYAX2AHXlemjzQDxwzzUfM3WPZIjOLGGrsPVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834926; c=relaxed/simple;
	bh=gAqTIa/FjG6cAUC+EuJL20860zY+3jWZZY86tAyZUAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/+ojuSwwA+2MjzFnU646ZvueYkj936MB7WPpOpzp0d2GNqErIJR9gExxLWEWCEozoP1I4QH97Amn8m0iOEBvj+RNRmxDsDqjbnVtBQSh3YP1UheNh6eb44V0tNLQPWDDiWjgrvClW/ZpT1wYHMm0cHEYkSCkIcOQlyE8rnHZ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hk6G3RCA; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hk6G3RCA"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59581e32163so675128e87.1
        for <llvm@lists.linux.dev>; Wed, 03 Dec 2025 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834921; x=1765439721; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZiwTIA7+3bk0rVcoIpmE4cdhNIriz9fkqfbHGGu2Q8=;
        b=Hk6G3RCA9rIYsjBPXptAVBQmghdSN51yflvY9Ja2vJMhcJAZ3/pkZ3HG8IxeHX6dUY
         XucbKzW0a4efAiFyxKSl16MFrZInDECpATNgoofSbslos5feRy2v2xNBB96ZZE1bneYg
         YTBtqTb2J7mpmovAJu5S+7ak0Zj7rw/JOo1HgiTHJNnsFIBUQ6Jq2zECLTwrTpW4dSBK
         3duoHA42zpUdtb8FPP/evln/2DZNXj9uHceS8i7HAC2G2Q6DEP2Gkop5ecKYonIiA4aL
         lHw2Lgl/DdUP+0AfqKhutXWgDbIaQxalQ8QMgZkmOcFWmwxy5KCP3K/Ak0o8w+SQlGRK
         Zpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834921; x=1765439721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FZiwTIA7+3bk0rVcoIpmE4cdhNIriz9fkqfbHGGu2Q8=;
        b=Yu7kB31ZJKNrmm8Z/xjlXXzOhCxDbPLbMGKY+VUE8JrQ/9Gbe1+sztmoHK/LejqHoM
         I9DTi4Chy+NS9vYb06HC8MJyfDBkSEMNunRb51zmbf8z4Bkyr0diFvup86YABnpTX0Ea
         V/amJsxkwXKmA+CWG/dfVuEamrUwhCwNoqEbsgmsIIuZC1mdnkENqKhqQN+FWE9vlDJI
         y2yykrKsQuQEMViQvKk5wJI1ikb/wC2aP57RgbgEqr3szW9kq9V/61oOTxRo+9JQikdT
         tGM4j5hY+itcbrPaPDuEZitsD5IBL7H5XLaQQ2599ObbRx7aToTLAirPy2voEsmNUsou
         5s9w==
X-Forwarded-Encrypted: i=1; AJvYcCUvhzS4PtOAy1LyeKFe2pGSMPYC8EIL7Msy+GwJXzFu1pEO4qcBonr0EfAXOXPSOz2S/2m9@lists.linux.dev
X-Gm-Message-State: AOJu0YyNcC/cnFS0uj5s0mPWhi9AiyzuFdLaarrELgQQfq+d5NeeY94v
	2oX9/3ZBmQanMVORKuzBcs1uWFoFqOkVKeRTAHuZp0e9ewUq0mPnVBrT
X-Gm-Gg: ASbGncvv/kH+yC/cJWcJl8HwJ3NWkntVKgMJfNRMEtl0mqBkGmVloL9e1sYZB2k9stU
	XLuwxs+wRtbvvmeQqyeiNLpwpcPSbYa35gdQ7EBzsYhKX5cZD5hq/ybsZzBqV1VuP90rp4NtLO+
	Y/XPpEejjgZ1r32QBdbQj7cFd2aYhOk6vACYqxBGz+9+AyFFiMYYENW0hrAxxrr10LQc9mRgCiT
	tOnoFIQwdBoDraQZts7ntf3Tv9AJ1u+nvPPARZu3A87jN5HhyWszFZDBYFcT/dK7LWuIzpBC9go
	4iahUvxlzcjJeqMad9Aoggq9SFaD12uSSMA+FflKPtTFwfoYGMYESmsttsNtKHwEUq1Z63UiltO
	5Taz+yNnIciN5TjQhgMcY+gl1yLtSl5MvD13mrvec2ee3gpWEFjfkXo7XtZ53O+doILrtlg==
X-Google-Smtp-Source: AGHT+IGspx1iBq0l/KYW0BPXnBTjQSmqu1QYrFO2QolLF61uEAVSaqBKv7zpWcBgOHbRwa9f2MaI2A==
X-Received: by 2002:a05:6512:684:b0:55f:4f1f:93fa with SMTP id 2adb3069b0e04-597d66f8a45mr630014e87.42.1764834920536;
        Wed, 03 Dec 2025 23:55:20 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:20 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Thu, 04 Dec 2025 08:54:52 +0100
Subject: [PATCH v5 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
In-Reply-To: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>, 
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 Asuna Yang <SpriteOvO@gmail.com>, Asuna Yang <spriteovo@gmail.com>
X-Mailer: b4 0.14.3

From: Asuna Yang <spriteovo@gmail.com>

Generate a friendly fatal error if the target triplet is undefined for
bindgen, rather than having the compiler generate obscure error messages
during the build stage.

This piece of code is copied from `scripts/Makefile.clang`.

Before this commit, error messages might look like:

error: unknown argument: '-mno-riscv-attribute'
error: unsupported argument 'medany' to option '-mcmodel=' for target
'unknown'
error: unsupported option '-march=' for target ''
error: unsupported option '-mno-save-restore' for target ''
error: unknown target triple 'unknown'
panicked at bindgen/ir/context.rs:562:15:
libclang error; possible causes include:
- Invalid flag syntax
- Unrecognized flags
- Invalid flag arguments
- File I/O errors
- Host vs. target architecture mismatch

Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 scripts/Makefile.rust | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
index 5c12b4b8c8b6..b219244cd051 100644
--- a/scripts/Makefile.rust
+++ b/scripts/Makefile.rust
@@ -6,4 +6,8 @@ BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
+ifeq ($(BINDGEN_TARGET),)
+$(error add '--target=' option to scripts/Makefile.rust)
+else
 export BINDGEN_TARGET
+endif

-- 
2.51.1


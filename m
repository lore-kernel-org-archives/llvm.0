Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E136678F51
	for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 00:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763943811; cv=none; b=d2aPugqtVX4V5S3vn1E5bdoEdqkvBaolTXzzumoBwrJEwAdS6J2xUxHvzQoIKf+NvhbP0QIEvruzk0Ye3GPRRXVOQDSybUw0I5fSwPxtJ8r5J8BaGoA7Ifq4TDCIA8HxqcEY6Ud7V9nA+TNwcWWVJESzAhgh19ZUo/Kx9oxwCtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763943811; c=relaxed/simple;
	bh=WbemIgKuUD0wTji/U5cdEGBHeKZfnMP3MRB40CeW1Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GGUBrPZRXSlOD3RqIpx0w1JkLgoBOfeLegOZoDzukljTGeWu5C9TCRPF7bnb3+u/POnn+cGN+I1BHMIc1Jiqz3IjJxVkF9Tf0GncP/HBoaUNTgwmaqcOx4WxB2oMvgtTaac6dxfH2gRkRIWusOy14ZuJnwAyG8BjL9MXPCFrWSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jq0cGBqs; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jq0cGBqs"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59581e32163so4209253e87.1
        for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 16:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763943807; x=1764548607; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbGYlCQvEAxl7Ii7cRcs+Js6nTClE2kmQahDh35IFoE=;
        b=Jq0cGBqsh/E9f5GCvaA0cN5SR7ZxMUYQQv6g6FOMMgKATlHrlmjAeepZlQtR6pbS48
         a1MIzWI/3xiJjEtW22xCQdm/h7B5WFsWergyNVlv+/IQUWJb5N2GoVLkek+nVqccUXOZ
         SDY9mCHhmNbQrJ82hTwd2eZoHr47OX7D273UL73wHSqQ3H07M+Ett3Pt1V+Fm2DrsTbB
         8tDCPnua22rIuzkJHDo+VOKgaLDICpUW2MPXzEmcBmWUrVGqeBugXeI0mdxPEDutKPl4
         r1QS7kqBG8Dfa6oxLiU+8gWihHzF4c+Qd0Kw5XIdjT1f3rCkDjOVJhZVfiULNZiWrnWa
         94IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763943807; x=1764548607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qbGYlCQvEAxl7Ii7cRcs+Js6nTClE2kmQahDh35IFoE=;
        b=IGnTKJV7Gjtpj3sTfNqWtZyDTPDRmrAEpmbgDcrbC0Y+tzRgvS6h2MsqJ5ecoZKthX
         gk02y0tNu3iktHN1K1c1kgwe1j7b6pPr5sZVj7RWsWIre6M0hUx1eL716t5ttGWH54ay
         4IzukSbA4fjromZ7fTWHYRD9HF2SvYs53LVIrFLmsdfXYy5bet7flRptzg5ql0Y6BzZy
         j2+07Zsqr+/goE6haOPuHo4USniYg+OvifGfqDkd9NsNcMkSqV2gEE+loyNHMOxiWmZc
         gGtQ3pdCtHEMn5N9RZF/1v3pXoJO9BcFjJuy9AZVh/WEdftOsqbOM+pd8SncsFVyErD5
         3+Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXdOka6GIMBo9TK90tpLPwW8stuiTHCF86qVWXderFxbpj72b1RVUmpJXnkvRVEs7WqsKQq@lists.linux.dev
X-Gm-Message-State: AOJu0YzDXobJLVhSQsDBoonb7wanSV5Kkl8DMCmDVQZlOnClR1G5QjtK
	osrfN+PkQvpI5fOn3d4DU0mA2Qiii1IWDB0c1H7WZ5oEaH8inijiErXX
X-Gm-Gg: ASbGncv6NnHulhiFA73Ip4YOTYQHNa4VZ9aBFS5J/msHfBCutKOl1TR/yZElTVF7gUs
	Myy2/pGMa4n8V8y26YCUc48ChQZ2ulIpl+/ELirGbKhJTP6+MZDzSmpC9vdfn4U1KoaLT90jRq7
	epikCe9BaeXSpVDxgiZVY03ifoNpcFy7UrXuqFIRUovhlZxoLscQNqVwcrsBiwYbZQPVwiFQ2pl
	xm+aJRV9Ga/w6hm5cs97J9QElShpb0XAvZbhLVe5epRsQ58B45HTOo6Hv+h1k7eIny9wI4946Gs
	aCDOTLB1hNPVxj6gARHSivFVn1v7q25ObL33oiFBgl1H5y408lPSd76npIkQMr1nC7Kz9icdy6s
	U0UyJo3GkwmlWqtUruhzvrgV8MJR72kaX+0U1oT4MJwuwNVfYLTRVk2Qp5r3+rJQYhzZ6RQ==
X-Google-Smtp-Source: AGHT+IEwZK8e0HsCARZb6AL+s2DVpYUXEissqZGhv69G7j9nHjSuwrkdy5uD1EZ2r86MmPczP46Jzw==
X-Received: by 2002:a05:6512:b19:b0:595:7fa2:acd with SMTP id 2adb3069b0e04-596a3eb2edcmr3569705e87.21.1763943806325;
        Sun, 23 Nov 2025 16:23:26 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5969dbd095dsm3708266e87.97.2025.11.23.16.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 16:23:26 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Mon, 24 Nov 2025 01:23:23 +0100
Subject: [PATCH v4 3/4] rust: add a Kconfig function to test for support of
 bindgen options
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
 Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Asuna Yang <SpriteOvO@gmail.com>
X-Mailer: b4 0.14.3

Use the `BINDGEN_EXTRA_CLANG_ARGS` environment variable to pass the
`--target` option for cross compiling, so that the function can be used
to test both bindgen options and bindgen backend options.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 scripts/Kconfig.include | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 33193ca6e803..a8cfe9f408a5 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -75,3 +75,8 @@ rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
 # If you are testing for unstable features, consider testing RUSTC_VERSION
 # instead, as features may have different completeness while available.
 rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null --out-dir=.tmp_$$ -o .tmp_$$/tmp.rlib)
+
+# $(rust-bindgen-option,<flag>)
+# Return y if the Rust bindgen supports <flag>, n otherwise
+# To test options for the bindgen backend, add -- at the beginning, for example: $(rust-bindgen-option,-- <backend-flag>)
+rust-bindgen-option = $(success,trap "rm -f .tmp_$$.h" EXIT; touch .tmp_$$.h; BINDGEN_EXTRA_CLANG_ARGS+=" --target=$(BINDGEN_TARGET)" $(BINDGEN) .tmp_$$.h $(1))

-- 
2.51.1


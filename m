Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85C5311972
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834926; cv=none; b=TjuweQtgGURH3r6dPy/X62msEEs5jQGm2gQrclptbdcMOF2rnjlELzU8CRc6nRJ8r40uyj1/y+t00/1B4CWdi3fFVP2oU3PNjQJCSBJyvZllA6luokDNeAWGIiiwno0fEiHkk5a4/PJvrhYppDFA7k7eoDicpfWsCg2k7TDmxos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834926; c=relaxed/simple;
	bh=iTlPMjznJPbXtJOmJD38qd13ozQfx2VEj/0hkHnAJ+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q2zYjno80dto1zaUEr1l69pIER5c30zIqFiat1+l0gHvYLJ0AtK1XcPE5EYjbNK/fEfUio2jSEik1Of/lsUlx09bvs3p3J7pPJRbJk/A2r/iYdfhNdGBKbJVUZbdk7Dm15jfIVIi9t50yAFUoQBQHx4qLMUSTkNzhkf7ZnGfHdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jr1b5NzQ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jr1b5NzQ"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5958187fa55so453862e87.3
        for <llvm@lists.linux.dev>; Wed, 03 Dec 2025 23:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834921; x=1765439721; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5CWhh0bivbAxLbPHjrdPNLbMwbFtGK6KhcOChIXS0I=;
        b=jr1b5NzQlcOOxu3zXNQ06u1YqJOImiAO2atYqhLYXrUgmSmhX7a7ooeiXGEuPafmya
         GcennsKaVXdQYo5RLvzr/sHpKb2TWPj8JXKrc35SZaA1oAbr3NImhpG5Gnt68ZpDrI7F
         YzgOjfkKMGE3g0JBXRF/9XSeOBWsxl3gJcbuHOlRiLxwTkrzFS+DeDomjCSAORZaktNC
         XU17vJCpKzqRwx8koERRi6bxwrB6ZSEF9mwKJ165a6l+voiRItt/Yv6L1xb3MnMmqjtr
         vXqSHi3WVaQei050710Kf8e0unBAHfFDJJK87EinNY/XBabrSLv7+fpb+Q/bRU6oWU0h
         OgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834921; x=1765439721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l5CWhh0bivbAxLbPHjrdPNLbMwbFtGK6KhcOChIXS0I=;
        b=Z+RbbxE+Yuj9YfJlCUq9IHKS8gzYNwoHtldqSUbFlKBDIohKTG6a5Lz2Gx3GnI04mf
         H7QIC0gO5zgHBJmS0t6AwB/WY46a6RminHKZZgfdXhRBD968ln//ft605zhQabJR14fk
         UaB7RV/Vp16IotQ2wAsy2Oaj+oQnDiK8NAEmTdhZozbf8bc0cgGDmfHSxVpcCZGwfnK0
         wUDNg2MU+uVHQ+mAzc7MJ7R+A8s0ASTgD6k3jMzfUEh/5ssfgxmhNVB/DxkSuCxRrPp3
         w8GP+P9y2GSAxhISt6o5CzEVy3ElCKT93CW40QTq7mti/5qVZMvAM5ZbXWBpqGFAYWZu
         B5hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOzXc5DvAClk+TH373Tz9IuoM1hyR7AzmlHs0TTLiv7xAFiiwyb6lZTXOvdhwMjbj+D40S@lists.linux.dev
X-Gm-Message-State: AOJu0YxoF6+bcfQOFd0DJ9kgUD4c3h4JdxMQYyxjC+2P347VetcDrjrg
	WMUTKYkTKYlK60xUXbEtQiHQz3xhqU+sjyU61X7X9YWktCC6NnVr27YI
X-Gm-Gg: ASbGncsW6UDArVEfNCGlGSP0GPMRJzZv8eKdVzKR9X3DBJEsB4lPhW+L1WL00Fbvf0d
	RQuH8UzLbucDT6e+qJVqX64Uml6TFsu9yXT9sI+Oj3vCTC27s4PlV00hYQis9f7Gwe2Wc67N2qs
	OdhON8twgT0QCL7BdnSm3LaEsWiB1v7m92vyZOCvzGp/xt1ipfBdW4gs31q93oUYnAMDbPEcxaf
	iA4isqSyBtq07pMLv4yab1EiiVrsH+fIuwb1hEiYGLBM+eAXguY9Zeyq/xX229p4kHoXEYq0XGc
	R24AVMPx/IGS6boUH3Hf5omSe/njkN9sGO9n0teyzpF5NxetRvnGoXJJqy3FORcdOx9/byjSACm
	OTJnKJ7j1HQkXp9S5qBkB7LOoq0W8Oh0keb1tSYpFVubni4ArEdVp/PUtp9xgaJQOGxYVTQ==
X-Google-Smtp-Source: AGHT+IHtNtKovriM8w2pLkDHwyMQApqeD8GW60UnConeyFy7gFY99L8zBySpoiS8naABTGPgdJC9Sw==
X-Received: by 2002:a05:6512:159b:b0:592:f521:188a with SMTP id 2adb3069b0e04-597d6709d9emr571551e87.49.1764834921103;
        Wed, 03 Dec 2025 23:55:21 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:20 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Thu, 04 Dec 2025 08:54:53 +0100
Subject: [PATCH v5 3/4] rust: add a Kconfig function to test for support of
 bindgen options
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-gcc-rust-v5-v5-3-2d4f20d86c24@gmail.com>
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

Add a new `bindgen-backend-option` Kconfig function to test whether the
bindgen backend supports a given flag.

A subsequent commit will use this function to test for RISC-V extension
flags.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 scripts/Kconfig.include | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index d42042b6c9e2..5d4d29eed0b3 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -78,3 +78,8 @@ rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
 # If you are testing for unstable features, consider testing RUSTC_VERSION
 # instead, as features may have different completeness while available.
 rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null --out-dir=.tmp_$$ -o .tmp_$$/tmp.rlib)
+
+# $(bindgen-backend-option,<flag>)
+# Return y if bindgen backend supports <flag>, n otherwise
+# For now, the backend refers only to libclang, so more specifically, this function tests whether the given flag is recognized by the libclang used by bindgen.
+bindgen-backend-option = $(success,trap "rm -f .tmp_$$.h" EXIT; touch .tmp_$$.h; $(BINDGEN) .tmp_$$.h -- --target=$(BINDGEN_TARGET) $(1))

-- 
2.51.1


Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C442C2353
	for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 19:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760469128; cv=none; b=PWaVzCBmqW1k3VAilgSPxEvQKgbjJNwIcYLsjyofHRFNJ9VS9YaX3ZRK80eqbZahO1SXz4xToJtHsm5uxcA6tnh7kozKdzbekTGJc7RZmyxxxPv9Lx4ZFZBEiVujoxG/fa/uGCD7RXnKvuyF8Fb/0tCc9rO87tT04ydGalX/U/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760469128; c=relaxed/simple;
	bh=cx36TyRZQRd8d2KdjPrZq7eNjP57j04LkvW74Zdo8sQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m/FQ10lkVsCY7hT2XDrWmF+g5spAMRK3mqW2Y2l26s2yw4H26/Aph5O0yS+lHZYKmhVMbc227BRk+MtznHBfNKCBIkT4RCzLHXXXbPloytYGcaxk9Su6zUyfLUFcMrM0EAk8C9E+zHRf3NB5u1Q+tF5loM10ZaljV1foOlWf0YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bvIpiOhr; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bvIpiOhr"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32ee4998c50so9844408a91.3
        for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 12:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760469126; x=1761073926; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zBllpB0ePNMOVbkElWmvNsFG+oJS+DPSsTH9YVldxTc=;
        b=bvIpiOhrcPB15PiXh8QNzPGo3r87WOH24+3HRl9aZV81j9BmAAsNtaxpUQEMyMNO/2
         Z7OYI1YrIcASBCTNylaE5gLCciAp/hbSMPoylp4mnFQkBwlIJqBRse1BF7uVKM7kVfJr
         SjFA+Bv0VMzfxdypeLk81ePS/bAqNnrpX+tAfHvv/jO5oBAHVyrYayBCpx+R0YqA+coU
         rD1pyuzDyhGhRQdIJXXrmF/6Ftv3WJ95WwNmGu2/ssIgD8TDVdcB2Ah9/3aLoobZkndu
         2hyLM/rKYHHRTXDHtBsDYw2nBB/PbZ13HaA5hvwIJ0V2Vg98L1ERzkC8hRcqWyB+22i0
         yNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760469126; x=1761073926;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBllpB0ePNMOVbkElWmvNsFG+oJS+DPSsTH9YVldxTc=;
        b=p0ww/f6Nl9Z+sJdE+DI9jN8cP1D9shG+jI8L/b01pDjtzJxSAj+VXA3E51J8hfgcYq
         6c6VoAjJYmasMbgNUVrVeo674FVDXTUUFsGaCQf7Mwyhtt6fqpoKBHYYHho4D47PnKvo
         t54hvWyVMzsHZr37xEZ7qB7Vq1p0P+1fnx++yDvSfgSTTrDnoSwQeAjLY2/YO7lC0ty2
         VinKA2vO4wRpK9qjLw986FyBVqBm6gLRpnQpgEeF3PkhnKsOrH8wH02RPg43M0B6kNs7
         Onyz88O65PAz5kVS+WCmYMJjUT7hVcRq6OQ3IfYVQ535h+4xvQ5irLrDVom4QukAou3m
         N48g==
X-Forwarded-Encrypted: i=1; AJvYcCVCVz95GFC3bf6Z26JTz1LBbQr0icRIXgSQ7tPQEv0myrDZoS20ThEZAWYQmkjIU97Fz91D@lists.linux.dev
X-Gm-Message-State: AOJu0YzfF27/HV8h2hPx8KDBEPj+fJUGmYge9tcCBg3u6Bzf90Y6wRN3
	6uSGdRJlzyEBQP7Igw4JY0U3dHTh1op4dObO5PgknMkgokWXnLpQwK9Sib8ttuGAtnDClA==
X-Google-Smtp-Source: AGHT+IF7GZo6/ROXKJlnWT1JhTqmzbjvSVDgDSvfujyxO4MGyLwSW7azfV21spAGRwjheSwdbs4i9m4=
X-Received: from pjbgv24.prod.google.com ([2002:a17:90b:11d8:b0:329:ec3d:72ad])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c89:b0:32b:df0e:9283
 with SMTP id 98e67ed59e1d1-33b51399970mr33646704a91.34.1760469125986; Tue, 14
 Oct 2025 12:12:05 -0700 (PDT)
Date: Tue, 14 Oct 2025 19:11:56 +0000
In-Reply-To: <20251014191156.3836703-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251014191156.3836703-1-xur@google.com>
X-Mailer: git-send-email 2.51.0.788.g6d19910ace-goog
Message-ID: <20251014191156.3836703-5-xur@google.com>
Subject: [PATCH v2 4/4] kbuild: Add config to assert profile accuracy for
 aggressive optimization
From: xur@google.com
To: Alexey Gladkov <legion@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Bill Wendling <morbo@google.com>, Han Shen <shenhan@google.com>, 
	Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Tamir Duberstein <tamird@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	"=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <thomas.weissschuh@linutronix.de>, Yabin Cui <yabinc@google.com>, 
	Sriraman Tallam <tmsriram@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

Adds a build config to AutoFDO to assert that the generated profile
accurately represents the intended workload. This enables Clang to
perform more aggressive optimizations.

Signed-off-by: Rong Xu <xur@google.com>
---
 arch/Kconfig             | 11 +++++++++++
 scripts/Makefile.autofdo |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index ebe08b9186adc..6fdc676cb0fe4 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -886,6 +886,17 @@ config AUTOFDO_CLANG
 
 	  If unsure, say N.
 
+config AUTOFDO_PROFILE_ACCURATE
+	bool "Assert AutoFDO profile is accurate (EXPERIMENTAL)"
+	depends on AUTOFDO_CLANG
+	help
+	  This option asserts that the AutoFDO profile (specified
+	  in CLANG_AUTOFDO_PROFILE) is collected from a representative
+	  workload, allowing the Clang compiler to perform more
+	  aggressive optimizations.
+
+	  If unsure, say N.
+
 config ARCH_SUPPORTS_PROPELLER_CLANG
 	bool
 
diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 5bcfcef273745..36abeae2accdc 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -11,6 +11,9 @@ endif
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
   CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
+ifdef CONFIG_AUTOFDO_PROFILE_ACCURATE
+  CFLAGS_AUTOFDO_CLANG += -fprofile-sample-accurate
+endif
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
-- 
2.51.0.788.g6d19910ace-goog


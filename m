Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219051372
	for <llvm@lists.linux.dev>; Fri, 30 May 2025 00:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748563613; cv=none; b=f+MOa8lbd47dTxFTQaqrcaMBiluqQGIilwj91X8J2fiQn+Yg9YJvwsmA76452+anL+JWVn7FiXeecj9NaRx71yX6CUQgEW+/VhIGL7kld3ZUkoUkuuLFcgrqKcUwJGra48er6uDn7cxYKVzm/3E0OeESXNQXAxa77yndxIz/efw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748563613; c=relaxed/simple;
	bh=Qs3fKJz8kaIyTjSI+VH+mg1a+38N08rlUGlC+WiuByA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xree6lAnQzfPYcEldszVtfAtCwA+qLjuaID44jLlntL6TEuLCqk7URMWQmhLbG4r/s6McT8XXaT2q0v2WCt1vjNRXOUGx+DTRb68uhA3oVjeaGPKu+XeHR2/FndcGWPd9ckscRmK0IN4/UKgQuJAIdz9MiXYseD6QAoMIGcwFzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UZmsyRif; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UZmsyRif"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-73712952e1cso1121517b3a.1
        for <llvm@lists.linux.dev>; Thu, 29 May 2025 17:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748563609; x=1749168409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JaOyXlzy8Vkp255k6mJVMg/BC/f2o1qDq99ujzTjjD8=;
        b=UZmsyRif1j1t8DehcxLiZIO3Kd8rGEyq1qzzLsEbxkYRfBdZUFYwhfGjWOStiaeYe0
         D6W8Nan4HMOD5qL5CCE++8jW33u8IAUbcj1fEDptgM0xC3SapnNfiTraICBkKae+m0cC
         smM2xGaXXDYRcpw1vgmI4D+2ObESX9etzChPi6nDh8dlMnUgmr9AFqOc2VXFZp3Y9wqv
         IOMtndYpTGten7TUV1DGtrNsBd3OQalWkorNcMgGyG2uY0ijoGVDDMBq0dLIz0WAtRbp
         rqelyPn1btUHrwm4ZTzDl6tI+dQG3haDEzsdJkCwQIjBZoCcz3z477NUYXWJKldh8qJI
         hAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748563609; x=1749168409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JaOyXlzy8Vkp255k6mJVMg/BC/f2o1qDq99ujzTjjD8=;
        b=WIjq/7+94+OZ1K5lGOXa+kDhZ/3ORnkuNz0NuH90DSrRrmv3S6ZXXY35hZ41q6yTf7
         ssxQeIz3lMeWpYcBxCKTVJu0c5OlmxoUZg1tvXV9f+OrNwNeBFJiNMxs5xNT0fRJgrgI
         NS2lfMSr2y907A6iT2t6HQSpLieCaTAj3ZVPxhXV5hFOoyzZfc6GlegnUsWTzQ4jia9t
         tsSSP7W/+Su1PMtQ+kuSltGPPirQ/t7fB0vWUWoArdy1ynkSlkJj3rWQzhpLYQ1f/2cu
         gqGDvKD6ULZ07FLRuvoxi3PMJIS1TyH97NUWtcUxZ0r2Kg/gwsCeaBealx3YT4tabsZe
         dvoA==
X-Forwarded-Encrypted: i=1; AJvYcCVF1Z5BQ+VIXkEwFxJZS4WNyhripRV1NbQOzYvgo8KJeBNJPlzb3/FkzB/Q+8GM7d/zGohG@lists.linux.dev
X-Gm-Message-State: AOJu0YwV1IFE7NSvm9iwIduQd9nNdJtHxCoWdnhddJdW+U5cNPJ4elxD
	xrRuvoIuVt1mYyrfplkd7yZsWup8FxXGzcxo6SLfbKaeeztak63CEeo1MlKlfEg58u4=
X-Gm-Gg: ASbGncvKIOqJBUnFEO4ils1I2b7NFfkZQUe/iIi9oSzt1zX0BrR/803A832jagxnvsw
	pYTT4RE4ztXkBBbYWQINCoYKRdW2ZW/Ua4WR4S41cf2UNKGxaxZKxrHDPWz1zLfWyIrr2x7wEeo
	Z0TZnLSEirwUvuyThdne/UW9nxMZWpvKgEDI6vvqkW6FVPXNWAu+K7miSLfgUwoDd0/gUIksPW3
	nPlDyMzcGyqxbDyQCRhKfqJ+jqog9l+ah9tHgStYqmeWy8uogYfXPTjLqXY11cc1LdELaAJbB0q
	D+rnYx8SSS04AuNY93cwvHhPOrOKWoKrLcyH2scEywJGzvlxy68R5R+J3sKEZoPmmdXUEQ==
X-Google-Smtp-Source: AGHT+IHYOsFk2zcF1gLH1VRU+irYg1/F2TFp50LC35CUJj4OwIZqUaVrXo0NvOsbYcPu1XpBkFVZUg==
X-Received: by 2002:a05:6a00:189b:b0:736:8c0f:7758 with SMTP id d2e1a72fcca58-747c1a7f839mr253775b3a.10.1748563609262;
        Thu, 29 May 2025 17:06:49 -0700 (PDT)
Received: from localhost ([2804:14d:7e39:88d6:4b9a:64e:e01:2c33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe967easm1894641b3a.21.2025.05.29.17.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 17:06:48 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: kees@kernel.org
Cc: akpm@linux-foundation.org,
	arnd@arndb.de,
	broonie@kernel.org,
	davidgow@google.com,
	diego.daniel.professional@gmail.com,
	gnoack@google.com,
	gustavoars@kernel.org,
	jmorris@namei.org,
	justinstitt@google.com,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux@treblig.org,
	llvm@lists.linux.dev,
	mcgrof@kernel.org,
	mic@digikod.net,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	paul@paul-moore.com,
	pmladek@suse.com,
	rmoar@google.com,
	serge@hallyn.com,
	tamird@gmail.com,
	wangyuli@uniontech.com
Subject: Re: [PATCH 3/3] Revert "hardening: Disable GCC randstruct for COMPILE_TEST"
Date: Thu, 29 May 2025 21:06:46 -0300
Message-ID: <20250530000646.104457-1-thiago.bauermann@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250427013836.877214-3-kees@kernel.org>
References: <20250427013836.877214-3-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This commit was reported by our CI as breaking the allmodconfig build for
the arm and arm64 architectures when using GCC 15. This is due to
https://github.com/KSPP/linux/issues/367 :

-00:05:08 *** WARNING *** there are active plugins, do not report this as a bug unless you can reproduce it without enabling any plugins.
00:05:08 Event                            | Plugins
00:05:08 PLUGIN_FINISH_TYPE               | randomize_layout_plugin
00:05:08 PLUGIN_FINISH_DECL               | randomize_layout_plugin
00:05:08 PLUGIN_ATTRIBUTES                | latent_entropy_plugin randomize_layout_plugin
00:05:08 PLUGIN_START_UNIT                | latent_entropy_plugin stackleak_plugin
00:05:08 PLUGIN_ALL_IPA_PASSES_START      | randomize_layout_plugin
00:05:08 arch/arm64/kernel/kexec_image.c:132:14: internal compiler error: in comptypes_check_enum_int, at c/c-typeck.cc:1519
00:05:08   132 | const struct kexec_file_ops kexec_image_ops = {
00:05:08       |              ^~~~~~~~~~~~~~
00:05:08 0x225bdff internal_error(char const*, ...)
00:05:08 	../../../../../../gcc/gcc/diagnostic-global-context.cc:517
00:05:08 0x7cb197 fancy_abort(char const*, int, char const*)
00:05:08 	../../../../../../gcc/gcc/diagnostic.cc:1803
00:05:08 0x81f0e7 comptypes_check_enum_int(tree_node*, tree_node*, bool*)
00:05:08 	../../../../../../gcc/gcc/c/c-typeck.cc:1519
00:05:08 0x81f0e7 comptypes_check_enum_int(tree_node*, tree_node*, bool*)
00:05:08 	../../../../../../gcc/gcc/c/c-typeck.cc:1513
00:05:08 0x7e3b83 diagnose_mismatched_decls
00:05:08 	../../../../../../gcc/gcc/c/c-decl.cc:2170
00:05:08 0x7e64f3 duplicate_decls
00:05:08 	../../../../../../gcc/gcc/c/c-decl.cc:3169
00:05:08 0x7ea1eb pushdecl(tree_node*)
00:05:08 	../../../../../../gcc/gcc/c/c-decl.cc:3376
00:05:08 0x803c03 start_decl(c_declarator*, c_declspecs*, bool, tree_node*, bool, unsigned long*)
00:05:08 	../../../../../../gcc/gcc/c/c-decl.cc:5755
00:05:08 0x864c67 c_parser_declaration_or_fndef
00:05:08 	../../../../../../gcc/gcc/c/c-parser.cc:2851
00:05:08 0x8a7b33 c_parser_external_declaration
00:05:08 	../../../../../../gcc/gcc/c/c-parser.cc:2110
00:05:08 0x8a8ba3 c_parser_translation_unit
00:05:08 	../../../../../../gcc/gcc/c/c-parser.cc:1964
00:05:08 0x8a8ba3 c_parse_file()
00:05:08 	../../../../../../gcc/gcc/c/c-parser.cc:29839
00:05:08 0x931eff c_common_parse_file()
00:05:08 	../../../../../../gcc/gcc/c-family/c-opts.cc:1385
00:05:08 Please submit a full bug report, with preprocessed source (by using -freport-bug).
00:05:08 Please include the complete backtrace with any bug report.
00:05:08 See <https://gcc.gnu.org/bugs/> for instructions.
00:05:08 make[4]: *** [scripts/Makefile.build:203: arch/arm64/kernel/kexec_image.o] Error 1

The same error repeats for several other source files.

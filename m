Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9230AD524
	for <llvm@lists.linux.dev>; Sun, 26 May 2024 17:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716746227; cv=none; b=t1whMLw55RnyiZz7bBPUx+xmJytjSad9ff4vSfMnnxIAQe3ULZf0jQUl7Q7K/lDYgNqfjPKrSetVfev/4AsYOg9WBxwVdvEJlkHAlDyF4QwVgADtbv0NRUyy1nHY1Sk7DdJaTu5kcU6a+JGJ8UYoqa7s2TJBk2EJt8GboKXt77A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716746227; c=relaxed/simple;
	bh=BbvmViwVwJ/KmB08kS0p2rNXTjkvnKUZiDNKPQAi+YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AvH7qILs7yMSL+hpdLwJYrluEpuYVImbY5mmQfWDDHrfTJl8SoOMySu4lYVd+k1KeGMjNlu20vgaZL5tjk0zKtsEa4ud+49AU+d9No1U+ji6fJRjWge3dhymGOAlzNYJCbGz5AwUYaxeEiHln4RTGj8BphvVkTNR29Ea/HMsHC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqU4fAkm; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqU4fAkm"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-529aa4e988aso1048700e87.0
        for <llvm@lists.linux.dev>; Sun, 26 May 2024 10:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716746224; x=1717351024; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qVCDGbDE1hxIe+eglZipWL8jWoLwckalVAU3UroUOMI=;
        b=nqU4fAkmjNVZz43iHoK8Gpfi2fVBF+ED9viIf3Dfm0GfRzQS4ky9Pj1I9X+sJPRUSw
         xMuwhS1lSLlR4p6I1g8WPjmhkngw9/er3EGCxa7mQSpfI9ARdBglwp6QALrMyTbfkLUo
         8vjBl/MCJbiZkIDkmTK2vY0NJOneW7zan/NjDTRTPN+nKTmxhMsCsLxrNut3n+TpgucH
         EYukNecK3UUuMIfaD5z0IuM0SzUEZM76NCpVdxTX8kc0H8pde3llTnA8Lp1G8AZTnHFw
         LuOA6rvGX4DX+L5XcgZXflSH2omYN4Sz2uKOFq7wYAKF99yLA4eZg7mlXDuT+2xq01Ep
         oAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716746224; x=1717351024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVCDGbDE1hxIe+eglZipWL8jWoLwckalVAU3UroUOMI=;
        b=rDXQgVuozaW3ejPl5yRZUaTT9/5KPwdu7xNrwOow319OY2z+i0JlHFghXfmDZe9lP4
         BQQoIABCklZ9fJ/U2wPameWBg+wAb9hGSf3ieDc3EPTfKADVesek/BcU4OTJrTvYxd/X
         mxOz+NJHDQ85hxufT+yS00FmZeQiY+X3Cz9cVCVWYk9yfd/c+Z9fUtCQ6adO3PYpsR2l
         Z7dC2geBqiuDIdJQmYa57jayNXcsKUet1LsgbZLSunn896zMt5eWSObI+XPOjcTrkd9s
         TQxuxvSRemmD+EQRD4Apyp+/TJaChBbsnYfDrBe4qrHIZvrOImNL5qcq+gDtmRLkm16m
         j/YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz332Ah4r1qEdhQjIfc5uZudvbxQklXna0+5FTEV78OWx46xCrdBqPMqGI3/Up1VLqzjqagWB+u8Uae21TOB4efwtuhQ==
X-Gm-Message-State: AOJu0YxlEQwc+znAUZpNGbgirugTwk5J9jvXoBoxlz21wTPiTGT+RIjY
	z/5JHjZXFNpv90ntYG1A7aZNSimAlC6iJiXIGdvrthsOaGKHk2Cm
X-Google-Smtp-Source: AGHT+IFVa1qUR79s4iYKKBSRgnjEmsg+qJzvJ6uTrHbrHoR/ogdT9aBaMVRncpxJ8r9WTnaO3Of8sQ==
X-Received: by 2002:a19:8c07:0:b0:519:5df9:d945 with SMTP id 2adb3069b0e04-529642048d7mr4287411e87.4.1716746223402;
        Sun, 26 May 2024 10:57:03 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c817c52sm406424866b.1.2024.05.26.10.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 10:57:02 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: [PATCH 1/2] x86/percpu: Fix "multiple identical address spaces specified for type" clang warning
Date: Sun, 26 May 2024 19:55:52 +0200
Message-ID: <20240526175655.227798-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clang build with named address spaces enabled currently fails with:

error: multiple identical address spaces specified for type [-Werror,-Wduplicate-decl-specifier]

The warning is emitted when accessing const_pcpu_hot structure,
which is already declared in __seg_gs named address space.

Use specialized accessor for __raw_cpu_read_const() instead, avoiding
redeclaring __seg_gs named address space via __raw_cpu_read().

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
---
 arch/x86/include/asm/percpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
index c55a79d5feae..aeea5c8a17de 100644
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@ -160,7 +160,10 @@ do {									\
 	*(qual __my_cpu_type(pcp) *)__my_cpu_ptr(&(pcp)) = (val);	\
 } while (0)
 
-#define __raw_cpu_read_const(pcp)	__raw_cpu_read(, , pcp)
+#define __raw_cpu_read_const(pcp)					\
+({									\
+	*(typeof(pcp) *)(__force uintptr_t)(&(pcp));			\
+})
 
 #else /* !CONFIG_USE_X86_SEG_SUPPORT: */
 
-- 
2.42.0


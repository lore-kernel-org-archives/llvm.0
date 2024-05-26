Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F6D29CF0
	for <llvm@lists.linux.dev>; Sun, 26 May 2024 17:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716746227; cv=none; b=KHMxi5Sq02uTOwZAL5v7Frbd/SlCBWkB6/FjpRM/oXGFS+W9uBcUw3CG8h9F7bjp94ElByAlpQbDyVFeCQKTgtXKiw1Extyi4PeQaWDsYyB1I1MDGwS5mZ8tnZaKaPoKzzyjtlNoAV79AIwuycritPSAmQ2VhXr/HOVFDJ1qbAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716746227; c=relaxed/simple;
	bh=gwrkl0x0ZYQXDs57tv+T6mmq3c+fVkN3vQ8jk1jAIGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmAc2DglCFHdZjnxeUuDak2UQRMNJ5EZXGm/LoeX+tD7oq0v+DJgCZbz6gyJyivnChD5zQKZ8aQWqz7HrO9pp3hH7shS+FSMeD3RT5fNcUPrCkQW3dmR6jdCYZr4Apl2YizRmSZfniQqlxgM0sOTbOUKYbpHdXByrkt75k+VeZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VM3YiVAl; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VM3YiVAl"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5785d466c82so2625457a12.3
        for <llvm@lists.linux.dev>; Sun, 26 May 2024 10:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716746224; x=1717351024; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wdEt72NXsmqG4ZgtbWkypOIL4UtO8kSPqTnYgEIfbA=;
        b=VM3YiVAlABthZdKpHfcLTGYussZABBtYU63DkJMaTRoB52r/un/eAmBBhSeY5a+cT2
         58swkezlSjhX+i56xVAEpWrcIeouzUe5oWjlPV3n7F7CHkx35jz+EPAvMgP8AXPuIHti
         x2/zDAisqWSvEeHwjitNW2xsTZ3ivyXXGp37nS6t0Ceykhikia1SrF09gfzWNmHhlf7B
         oJroyfGYKAXYB9jRK50nFdK5gRjKHEbjd/74+4mgaz/mdNpnQ1Xne2IsUsyU9NmYgTnT
         nVpVRrztUhYGCpcLd4IoS7i9Ux5hteATYlZ/6GK46OlYF0d+XssQxiFLj8+bgeKMRB70
         lLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716746224; x=1717351024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wdEt72NXsmqG4ZgtbWkypOIL4UtO8kSPqTnYgEIfbA=;
        b=EplUYyHdZC77tmNPIlZ7/tStVEwFvb0tEvWvY1PZ9ljfR9dTDBAAwBhn1FZrtei2jo
         zBUuel0etRwSkFlmMekM0Uc7cfIX30shN3vXeLj3NmWcj9c92qRLx02qXH7kJBhm2XT7
         ztGf1u/R2qtcR/BI0LWF/RBTGc4k37NZiNCTWEFR9FDfsJptBuhyBZv5MPqnlWfeFImG
         0+Wuwp8sMqVIAgrt5whr3JQcV6NJZDK/zdoZZi2EvgVq24SoBDbXvBwHBqHrDiUd2pzx
         6MMrUdoHgZGIVxkIovv39EfqAXs/QFVTK14RwxnBfRa4AYS4BgXrcmBo8pZ5qaRwHtHa
         n4qw==
X-Forwarded-Encrypted: i=1; AJvYcCUO9RdW7ZQjOguLk9Z9vYg9CIBxnhcwI0kXheZz7VgBHzvFJpOGKXbhorGFMAaKcMwP0NGjXJiM9MG0T9CuZSJ5TMU4Cg==
X-Gm-Message-State: AOJu0YwBl/TQ7xCzK4VRPPMij+9GkP/1KOG+CMua3iZX6laFmwgRpeKo
	Jr6JYpjF8W9TP9c0+75hdcownvv0RYBF2QUwa5A3soKRqsaQQiLo
X-Google-Smtp-Source: AGHT+IFPAMK0nTnoFeh8iBe1mJjQQc3xu6NNyMU2yvsrihWDwbp+bHn8GX1qWvA2iHXNjMEjyNQuDA==
X-Received: by 2002:a17:906:d18d:b0:a59:ab57:741e with SMTP id a640c23a62f3a-a6265112305mr520494766b.76.1716746224366;
        Sun, 26 May 2024 10:57:04 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c817c52sm406424866b.1.2024.05.26.10.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 10:57:04 -0700 (PDT)
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
Subject: [PATCH 2/2] x86/percpu: *DO NOT MERGE* Enable named address spaces for clang
Date: Sun, 26 May 2024 19:55:53 +0200
Message-ID: <20240526175655.227798-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240526175655.227798-1-ubizjak@gmail.com>
References: <20240526175655.227798-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable named address spaces feature for clang.

However, someone from clang side should qualify the compiler
before this feature is enabled for real.

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
 arch/x86/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index e8837116704c..08455e62f994 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2433,7 +2433,6 @@ endmenu
 
 config CC_HAS_NAMED_AS
 	def_bool $(success,echo 'int __seg_fs fs; int __seg_gs gs;' | $(CC) -x c - -S -o /dev/null)
-	depends on CC_IS_GCC
 
 config CC_HAS_NAMED_AS_FIXED_SANITIZERS
 	def_bool CC_IS_GCC && GCC_VERSION >= 130300
-- 
2.42.0


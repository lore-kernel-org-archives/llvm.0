Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8EA31353D
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 14:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762786137; cv=none; b=u1VaQozCzIeRRumb4HZx0ixZ3ayBckxT8jtvpfAZMplkbOpCV+HEHEbc+CYHtCETw8bCmVqY/UMj02SoIjp+9QheyLUO9KW4wyugWq4rizwWIB9HhZf1Epg4cuxFXu/YEBYAJ5lsj3gk8Y9T6QVgeV5gfrVylCwu8+R8W9TCzMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762786137; c=relaxed/simple;
	bh=QvLvyRTtOe3YpANvSN2TJE7jXUgDr0aVixqk0y131fg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PA0I0tWWKgC7ScWaoUenLfNIgq8JHALFGBtbeCa4VLiYeMxOwEZwQlJPjB2GFiCBXayYKCYSfRpQ9WJOCbctIk/ifwQbWGiDrycPn6cf15u51j2NJqPZ3ziVYnyNjHuEQxNcae4PhYjYZwmdmVrst+PP16cUGrzT2Qjnl7PUbD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLMNxUwp; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLMNxUwp"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-340e525487eso2070938a91.3
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 06:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762786135; x=1763390935; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FrgskyzgQxtRPQXe+YA6yojSKzP/1EuspyiSaUY67z8=;
        b=dLMNxUwp6p6CEpn6PZCxlq11jfVACSyT8jUMYrYGmMuhhenbKoGefBe7jWcwusgov/
         VVa5nNYmsxUyHgT4S1L57wTW2FAi455JPU9NfIqbvMRsL9MdfdxYqtgUEn2QFgqEzazF
         DdI+LnNxnxF0Fqn8qoLADbKhewQYWGJYhaX+EmpN4YTbH3R2dmc7Fd4xkhkvh28VE/p9
         6T6LFzUbry+9rJMkNPvpqM57Aicj1eU03OYSl8nJD3Opw60q7m9gRTkqgab2BoAYwPZY
         tfO1KN38Bb//JrvGRBBbqaB6wc04glPQKZXDbyRPpr3kO5mVzd8sWPnmUBX/q+spFF5/
         oZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762786135; x=1763390935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrgskyzgQxtRPQXe+YA6yojSKzP/1EuspyiSaUY67z8=;
        b=Na5a4P0//FjYrcFm+Xs7IJjRnrqvXtDa8gIJ6cna/L5ptdiHThQM/GnGJxOP+DgC1g
         dadwV/haAFNsrK5tWetGbqFW/nRx29uorLS2NRwzU0/ENmtXyMSXJwoz7wR7fy/kosg3
         /6kOPf8RxcPNPd1x7KeTPvDmgPcodUWci0NWx2lXFB65bekrwVATDHDMgOPNTl/p/mfO
         jtEV6FUZT40Cad8VS2iNoWyZY5Klpch17L1oGm0zyFE6SUIssGOH0exYRe4IlyKqBQIb
         oScxltJsXu1OiSqeBkQJoSKSlveNEf8s5CzwnnM4rSqAKMf/D1Jj+6Q4ARVsmkQTbKn7
         7p4A==
X-Forwarded-Encrypted: i=1; AJvYcCW8jPIZtVpZzB0TiABhuHU84WRi8XN3Z5JGzNhlgKxB9Z5q9fMgaMJKNnahfFXMckKXc/tu@lists.linux.dev
X-Gm-Message-State: AOJu0YwRgm00CzfkT3qSIBM3TzP2ngF2yqY9y95syIKZIHYAQwFS1ZJU
	Rzcc1luBtPKqQrCVyNrO4csbBQTazMZ8VE6ln1c0OlNrDMiEx1se04es
X-Gm-Gg: ASbGncur12IguyswbVYh56xeahEpJeJqiao9KfEcc2jZe9IEuX8V4UYEyW4TbpLgeRR
	dIY9C7icDmkdSDjESpweGGytSO3M2w7cLaw0IgVpuwldH/izpoSZBU0YPB/PtrKpu0w1f4zQ4mg
	yDnoEEloEm2AxXBE9G8+vT/nh0P6PSIX8wIi+NIgAsqrGLKpxIU9aDs8qACHn4PLKOqNUpQewXE
	QsrVirdg8D99xbPV17xhsA5DkNCMDEi7VSQYH0Xw6hl5MHl2YqfuiY0im2L36Cy+drIxuhhBdVF
	Ren3xtDhBuOxgoVD3bur7ZcLdXWAjvqVd+3MJeM/75bvuNwILrJehx2THfHsNZL85r/Ren8+9Hd
	Z2rebIREjwJtVKkbAwhz4a6pb/Tl/Vd7CTIr+WGJ9bvtrsrapKL8jI5dRjJwmX90HjrQh5JPLQq
	K568WRDFTdiXTIAf7w0dywgyP5
X-Google-Smtp-Source: AGHT+IFO7qcki/gcHxPVszkVoI6yIC1USYq4fWfL3CjPS2tpRrsdQwNQQWhcDI05RjMTZ5o9QWvvag==
X-Received: by 2002:a17:90b:3bc6:b0:336:b563:993a with SMTP id 98e67ed59e1d1-3436cbf7f73mr10435722a91.23.1762786134867;
        Mon, 10 Nov 2025 06:48:54 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3437221b329sm7579364a91.16.2025.11.10.06.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 06:48:54 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qq570070308@gmail.com,
	masahiroy@kernel.org,
	jack@suse.cz,
	akpm@linux-foundation.org,
	maninder1.s@samsung.com
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	will@kernel.org
Subject: [PATCH v2] Fix redundant judgment in WARN_ONCE with clang
Date: Mon, 10 Nov 2025 22:48:44 +0800
Message-ID: <20251110144844.1376-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For c code:
```c
extern int xx;
void test(void)
{
	if (WARN_ONCE(xx, "x"))
		__asm__ volatile ("nop":::);
}
```

Clang will generate the following assembly code:
```assemble
test:
	movl	xx(%rip), %eax // Assume xx == 0 (likely case)
	testl	%eax, %eax // judge once
	je	.LBB0_3    // jump to .LBB0_3
	testb	$1, test.__already_done(%rip)
	je	.LBB0_2
.LBB0_3:
	testl	%eax, %eax // judge again
	je	.LBB0_5    // jump to .LBB0_5
.LBB0_4:
	nop
.LBB0_5:
	retq
	// omit
```

In the above code, `xx == 0` should be a likely case, but in this case,
xx has been judged twice.

Test info:
1. kernel source:
linux-next
commit 9c0826a5d9aa4d52206d ("Add linux-next specific files for 20251107")
2. compiler:
clang: Debian clang version 21.1.4 (8) with
Debian LLD 21.1.4 (compatible with GNU linkers)
3. config:
base on default x86_64_defconfig, and setting:
CONFIG_MITIGATION_RETHUNK=n
CONFIG_STACKPROTECTOR=n

v1->v2: https://lore.kernel.org/20251109083715.24495-1-qq570070308@gmail.com
  - Code format adjustment

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 include/linux/once_lite.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/once_lite.h b/include/linux/once_lite.h
index 27de7bc32a06..236592c4eeb1 100644
--- a/include/linux/once_lite.h
+++ b/include/linux/once_lite.h
@@ -16,7 +16,7 @@
 		bool __ret_cond = !!(condition);			\
 		bool __ret_once = false;				\
 									\
-		if (unlikely(__ret_cond && !__already_done)) {		\
+		if (unlikely(__ret_cond) && unlikely(!__already_done)) {\
 			__already_done = true;				\
 			__ret_once = true;				\
 		}							\
-- 
2.51.0


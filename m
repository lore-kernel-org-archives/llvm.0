Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422BF22A7E5
	for <llvm@lists.linux.dev>; Sat, 19 Jul 2025 11:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752923598; cv=none; b=d9bI56QABwqLcrRI3nxRm2XccGX/pxG36f+2o4/LIG53RtwwxKsvbT/832vpM12jWFiTIruFQ8kIVFI1Gpr1EU+OkVMNcHTZNZqkmVT8QPrOEvwTvow5WHZK6zJ7j1xEfOIuHuTW+zqggkQrsmYIr4pTbq+8Ur9BGHuq45vh8ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752923598; c=relaxed/simple;
	bh=iDJifj/ZhU51RDm0EpQQSmQnGYmcG8haC/LGgI5iLDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=agFed5NIVQ9XoCgCtSkG0SvcDUxIU5kQMcf1IEX5VO3ExNeY2p3ojGeJXbLWRSAItY1dgxOLQlqPG5TO9G7D6Sul00CvCl3EgLPxJE4vjKW0acV8UE/WyMwk01jRKcGWpYtCeWKTJ2ZbvsJaIMB7N05ZZjW1SMo6wtz2ktloetk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPJDokAM; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPJDokAM"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2353a2bc210so26845075ad.2
        for <llvm@lists.linux.dev>; Sat, 19 Jul 2025 04:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752923595; x=1753528395; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjByKCvTZEF1xGfMFmwT1JaBMmtSxQ+whOxPUBJ5+Io=;
        b=RPJDokAMERqnpyj/RNkVvH1ArvP2RnP0ilHywe38AIqnzqbGjCH+DyI96oYOmetEXH
         xFrEgBjEnubVLGQHJ0E1wupa7WIz9A0UAgShFOwWND0ZOuTlvL8GAv6zq8jsqwB6Od4h
         rFp5e6LDWLgfnbN6HxPEq1YJdnl+uEwOR8r+WRE1XzSmkVOdVwQpzl3rCp0/AJrhkz9O
         h2Om8tkRiKzw2Acp+t7vVFilVoAu8s0ykkmtm4kHq45y1PPKypASj0wN401JeW2EOKLC
         E+084WAuy7dLEfghca2iodjJuO52Grgu19gZgQMItneXDlIqiB2A1JD8ixW3QIaqk9ut
         kDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752923595; x=1753528395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjByKCvTZEF1xGfMFmwT1JaBMmtSxQ+whOxPUBJ5+Io=;
        b=XmhtpUvWpPowpiqgD/z2D95T863RL2j0/CWXdkWJW0tXBDZrIx+6oazHtd/P5aYDcl
         YbDN2k0oi0N8W8Qluots41UpuXU8FK+8uQHJzNBhURUp+8Gvlhv1lvsKSIiX5VH7qyjF
         MlLK/HXOG8WoDY/VuFK8aO0FJJER5crt2yxPRALLR3OfsKnX9nNLp0V/KS9BadCzjVc8
         Tt28rBXNxREAAbenS6o1/4egwf09+UP4Ye7kQqAG07kk1j/Vrk5cmh3Yy5646bIKsK/2
         Lj49cUC7NWM7oczM5cc70/p7h0BXL0t2cy9twK9AhhRBC4E8x+BEgbGjJCs7JYwwsO18
         dhFw==
X-Forwarded-Encrypted: i=1; AJvYcCXk5laLCftDQh/AkaQYLqp2MLZQBZZV7SY/r6lUvKSGJGW2E15N8tIxjTW1EALZsCwU68gA@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8nq7Br3OV2s+Ff+IsY4xrwvMK2sriDObH0sZiyCYsXL/omfce
	n6h8//cAaujISC75dHxPwRYuuW1wLnNBdvHFNjiNDcnBKF4dLMKbifwh
X-Gm-Gg: ASbGncvwBvJzPnTeXgd6q/fsQFkBw5x2BiRGlL74oFEKmthYoFsSOigCc20CdHEB9cT
	79OG68yaiWOp2Uv/GDqC2QFJqd1StsTbKrZwo1J9mnOahcEZjiduaM0UcaZ7Vc+wpC0aHDY8tha
	K+fy8Ea/NWgt2EjG/alsfWRDn9G3Wr4v5cFuQ4pWn7b6MlSMfNGiBzYxbvP082SzQ78giSpNPWQ
	gjlw9WBJia7qMBSE3gU+G6KlIhDZyCxRdppvJrTdXnwA4rXoDt1Tk6zMA5EA9LkU2rN14o5XdjJ
	2bkXg7fxVZ/YuIrNRqjjjvA+W5DhJWXBqltuySV7ESoeKGUm3obZc2elaPu9XewN2Wx5zzKHuBF
	7HWnSzSQHddncrorNXYAY
X-Google-Smtp-Source: AGHT+IG0u/3BM4162UOk4cT8N50hBTxDblT9eqv7wTs1fnB7ULc1mTo4uoyoShWrx6dn8rHaTBHZfQ==
X-Received: by 2002:a17:902:ea01:b0:235:2403:77c7 with SMTP id d9443c01a7336-23e2576e462mr159838865ad.37.1752923595464;
        Sat, 19 Jul 2025 04:13:15 -0700 (PDT)
Received: from [0.0.5.57] ([136.159.213.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4c81sm27388875ad.114.2025.07.19.04.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 04:13:15 -0700 (PDT)
From: Abhinav Saxena <xandfury@gmail.com>
Date: Sat, 19 Jul 2025 05:13:11 -0600
Subject: [PATCH RFC 1/4] landlock: add LANDLOCK_SCOPE_MEMFD_EXEC scope
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-memfd-exec-v1-1-0ef7feba5821@gmail.com>
References: <20250719-memfd-exec-v1-0-0ef7feba5821@gmail.com>
In-Reply-To: <20250719-memfd-exec-v1-0-0ef7feba5821@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
 Abhinav Saxena <xandfury@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752923593; l=3578;
 i=xandfury@gmail.com; s=20250614; h=from:subject:message-id;
 bh=iDJifj/ZhU51RDm0EpQQSmQnGYmcG8haC/LGgI5iLDU=;
 b=ZOXLrGW0W9QEKrXbhoVkDi78LrYBAUNgeQPX7CkuOST32Syj2llRiJTC6HzEjjW1yg5JJkEI7
 uaGLyqCIzXSDFD0uOnqyqVtpbUvGTTHCL2b4oaMaWBJnT4qYZu981A8
X-Developer-Key: i=xandfury@gmail.com; a=ed25519;
 pk=YN6w7WNet8skqvMWxhG5BlAmtd1SQmo8If6Mofh4k44=

Add new scope LANDLOCK_SCOPE_MEMFD_EXEC to restrict execution of
anonymous memory file descriptors (memfd). This scope prevents
execution of code through memfd files via execve() family syscalls
and executable memory mappings.

Update UAPI headers, limits, audit infrastructure, and kunit config
to support the new scope. The scope follows existing Landlock
scoping patterns for hierarchical domain enforcement.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 include/uapi/linux/landlock.h  | 5 +++++
 security/landlock/.kunitconfig | 1 +
 security/landlock/audit.c      | 4 ++++
 security/landlock/audit.h      | 1 +
 security/landlock/limits.h     | 2 +-
 5 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/landlock.h b/include/uapi/linux/landlock.h
index f030adc462ee..5fa439b65aa6 100644
--- a/include/uapi/linux/landlock.h
+++ b/include/uapi/linux/landlock.h
@@ -364,10 +364,15 @@ struct landlock_net_port_attr {
  *   related Landlock domain (e.g., a parent domain or a non-sandboxed process).
  * - %LANDLOCK_SCOPE_SIGNAL: Restrict a sandboxed process from sending a signal
  *   to another process outside the domain.
+ * - %LANDLOCK_SCOPE_MEMFD_EXEC: Restrict a sandboxed process from executing
+ *   anonymous memory file descriptors (memfd). This prevents execution of
+ *   code through memfd files via execve() family syscalls and executable
+ *   memory mappings.
  */
 /* clang-format off */
 #define LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET		(1ULL << 0)
 #define LANDLOCK_SCOPE_SIGNAL		                (1ULL << 1)
+#define LANDLOCK_SCOPE_MEMFD_EXEC			(1ULL << 2)
 /* clang-format on*/
 
 #endif /* _UAPI_LINUX_LANDLOCK_H */
diff --git a/security/landlock/.kunitconfig b/security/landlock/.kunitconfig
index f9423f01ac5b..a989785df65d 100644
--- a/security/landlock/.kunitconfig
+++ b/security/landlock/.kunitconfig
@@ -1,6 +1,7 @@
 CONFIG_AUDIT=y
 CONFIG_KUNIT=y
 CONFIG_NET=y
+CONFIG_MEMFD_CREATE=y
 CONFIG_SECURITY=y
 CONFIG_SECURITY_LANDLOCK=y
 CONFIG_SECURITY_LANDLOCK_KUNIT_TEST=y
diff --git a/security/landlock/audit.c b/security/landlock/audit.c
index c52d079cdb77..a439461d1b28 100644
--- a/security/landlock/audit.c
+++ b/security/landlock/audit.c
@@ -78,6 +78,10 @@ get_blocker(const enum landlock_request_type type,
 	case LANDLOCK_REQUEST_SCOPE_SIGNAL:
 		WARN_ON_ONCE(access_bit != -1);
 		return "scope.signal";
+
+	case LANDLOCK_REQUEST_SCOPE_MEMFD_EXEC:
+		WARN_ON_ONCE(access_bit != -1);
+		return "scope.memfd_exec";
 	}
 
 	WARN_ON_ONCE(1);
diff --git a/security/landlock/audit.h b/security/landlock/audit.h
index 92428b7fc4d8..5a822bc50c4a 100644
--- a/security/landlock/audit.h
+++ b/security/landlock/audit.h
@@ -21,6 +21,7 @@ enum landlock_request_type {
 	LANDLOCK_REQUEST_NET_ACCESS,
 	LANDLOCK_REQUEST_SCOPE_ABSTRACT_UNIX_SOCKET,
 	LANDLOCK_REQUEST_SCOPE_SIGNAL,
+	LANDLOCK_REQUEST_SCOPE_MEMFD_EXEC,
 };
 
 /*
diff --git a/security/landlock/limits.h b/security/landlock/limits.h
index 65b5ff051674..130f925283fa 100644
--- a/security/landlock/limits.h
+++ b/security/landlock/limits.h
@@ -27,7 +27,7 @@
 #define LANDLOCK_MASK_ACCESS_NET	((LANDLOCK_LAST_ACCESS_NET << 1) - 1)
 #define LANDLOCK_NUM_ACCESS_NET		__const_hweight64(LANDLOCK_MASK_ACCESS_NET)
 
-#define LANDLOCK_LAST_SCOPE		LANDLOCK_SCOPE_SIGNAL
+#define LANDLOCK_LAST_SCOPE		LANDLOCK_SCOPE_MEMFD_EXEC
 #define LANDLOCK_MASK_SCOPE		((LANDLOCK_LAST_SCOPE << 1) - 1)
 #define LANDLOCK_NUM_SCOPE		__const_hweight64(LANDLOCK_MASK_SCOPE)
 

-- 
2.43.0


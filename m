Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9707046C4C5
	for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 13:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072706; cv=none; b=C7CqzfPq8tRb5lR8tJd/4xEHBPMJVURu6ntNfO2T+STEsDfcGrYcF/B05EGhNX5uKpu0esDsLvGq9RTuNhciwPRmhpWXIsjJa7EqkPfVk/oDMFVJzcZOXZFmQ/pvr68clsqTp+OgXxWFhadeWESEo/Hrc0GhpQwGme7XLnsWn4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072706; c=relaxed/simple;
	bh=Ho9YjB7reTrmZ0D9XSI3KdhGFFfKLwxERh2NVVcc4zg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g9KYqas0fgBItMunRt269rTr+4cl+bHHdDdBRLjevKUmHzeOLjRvKaOdn2t1EIyn6qEUy3QuWd8X5ycCcRekhLYkk3WHFxafS/siMvnk6uUO4Bccv0MXbq6ROCL3IYwA6QqNo8QAiP3EtmzGsAhEW0Al345IA5lF8KqsXkYE6Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSPUpZzg; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSPUpZzg"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so117218a91.1
        for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 06:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792072704; x=1792677504; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPZUBNn4GPGhvhNrbIpHNNxTG5Tr+rGqMQM1UOtv2Wk=;
        b=VSPUpZzgfLCizGebcVYWYUkoAEivUeD974qVBZZzA3fk7lkNBLWR0X8P9ws0ZUkkO/
         +sPbQA8muyu7BUrKL0C6VQFxzn9CfirrJRk/yrD6u0xsIUrbbP8qyZ6SozdndQeezjSe
         haVfjrN2EAbSOz05kL33UsOk/NO/nm5o2MgLs2YTMMU7D3Mvt7fnBDo6mIfPTqvGvpLn
         Jt/fzA9oBU1AjN8WEOFDZcuJtPpX1GliOw6d/KZ8MB5caQFfX0uMh2b++8Z01LEAyyPt
         h6mBRbqJm5elOQ0qyEr446QWTpJlnr73bVkF0dbuY8kgFFD/LWQ8myRonAvrzasY00hA
         9K8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072704; x=1792677504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPZUBNn4GPGhvhNrbIpHNNxTG5Tr+rGqMQM1UOtv2Wk=;
        b=prUSL6cGlk9RC1KPCOYuJbYB2/t4VbZgIvWHL3KItp/tR/7fRAvXp1oUgAlAx42Ov5
         BS/0Aa91W2GbFTurdx6sTmHY7Ezw0YhhQI6GvbKpp2Ap8Ffp0x/vQApra/xr5lBpIGF4
         jkDAfNihvojLOlG3wsSSAp+XLDbTRbgYCn6B62hjZ6Sde2EAyJkkCmRuNEawHJ32bqwF
         dWmmzz7QAbyDWcQSKE2mLZolikiTfeawuvC6wVpqBvAxCv9RgICQQ1BZUrYKAC/w2aew
         t3bbp3owoK+5anOMtLDuvgIkTYJI59gjVSHBWJdXKkD5yoHtGjfgbCuaXkq1WL+aVfOb
         KRaw==
X-Forwarded-Encrypted: i=1; AKwUvBzOVr22lvKFXOuF42iWOToNpNlLynEzMvaHfLsW+b75ZidbgXKnAuRy9Hyg1pDCVxUcQe7q@lists.linux.dev
X-Gm-Message-State: AFq9FYLnjdE1U1M2vnjQZTBlQGNPIRwpp2PJWY5/HyZ96okKVjl6nXI0
	ZeX1ToM+/hAAP+oxqyVnQ2T4/ZP0HIJdE6ep2aOvfjKezGa56gg+UnMN
X-Gm-Gg: AYBFou1xeJDjNK+UPX4TJYdVfgmHT+RqDBru39SvoTIh3W3+FEvKT0qRhtin7Y1Mtzs
	iC8KvIN/8w43EmLXI12GJCCnJ3ZHxt3NKVSlA12UprMy/DrUqe3gy5UfkWQwPg4NKrPtDpwSTgL
	U1S+0zVCJC7/kKcWE5SNiyQP+eavw6+nP37pQopwn1Gz8jq+fipDSi0heGxxwU1sNtpxWWyGLYn
	w4tZTUj3FcqCEpqa5+TjjTwykkhsWsdkd+pbNMxrpUs/ZYwhupn879UERAl59qcx9v5QgYeZd8J
	hWMWas5zAwLsx6L19IKgu3H6G/q6IKZAVkaEaBMUz2RydlbN8XkvevGeXjAKWftoWGgMpYjHZiM
	uxapyiYtL7D8CkdbLFvnBt9c6yOMMH+Mt32IMzxcG3y5XMADcuoQP4Z/gX1dgBm6GQbzJuP52Cd
	ULBNnGR8re0vxB3jgjEEw80IyKYRzZZtsMxoO/IHJLY3JcIUiVD+A6t22cR7oUPUCYoHAzNnkJa
	4j97S1R7HoEaHxf7tGKmBJtIw==
X-Received: by 2002:a17:90b:4d88:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3ab3a79cf22mr17057046a91.39.1792072703840;
        Thu, 15 Oct 2026 06:58:23 -0700 (PDT)
Received: from localhost.localdomain ([113.165.144.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94794dd9sm4566857a91.12.2026.10.15.06.58.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 06:58:23 -0700 (PDT)
From: vngocvan <vngocvan@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	masahiroy@kernel.org,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gen_compile_commands: honor the build directory for modules
Date: Thu, 15 Oct 2026 20:57:52 +0700
Message-ID: <20261015135752.17028-1-vngocvan@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When invoked from outside the build tree with -d and a modules.order
argument, the script opens .mod files relative to the current directory
instead of the specified build directory. This can fail with
FileNotFoundError or collect commands from unrelated artifacts in the
current directory.

Pass the build directory to cmdfiles_for_modorder() and resolve both
the .mod files and their associated .cmd files relative to it. Absolute
paths continue to work, and the output location is unchanged.

Fixes: ecca4fea1ede ("gen_compile_commands: support *.o, *.a, modules.order in positional argument")
Signed-off-by: vngocvan <vngocvan@gmail.com>
---
 scripts/clang-tools/gen_compile_commands.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 8d14b81efd73..149135f85f19 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -124,7 +124,7 @@ def cmdfiles_for_a(archive, ar):
         yield to_cmdfile(obj)
 
 
-def cmdfiles_for_modorder(modorder):
+def cmdfiles_for_modorder(modorder, root_directory):
     """Generate the iterator of .cmd files associated with the modules.order.
 
     Parse the given modules.order, and yield every .cmd file used to build the
@@ -132,6 +132,7 @@ def cmdfiles_for_modorder(modorder):
 
     Args:
         modorder: The modules.order file to parse
+        root_directory: The directory where the objects were built
 
     Yields:
         The path to every .cmd file found
@@ -142,11 +143,11 @@ def cmdfiles_for_modorder(modorder):
             base, ext = os.path.splitext(obj)
             if ext != '.o':
                 sys.exit('{}: module path must end with .o'.format(obj))
-            mod = base + '.mod'
+            mod = os.path.join(root_directory, base + '.mod')
             # Read from *.mod, to get a list of objects that compose the module.
             with open(mod) as m:
                 for mod_line in m:
-                    yield to_cmdfile(mod_line.rstrip())
+                    yield os.path.join(root_directory, to_cmdfile(mod_line.rstrip()))
 
 
 def process_line(root_directory, command_prefix, file_path):
@@ -206,7 +207,7 @@ def main():
         elif path.endswith('.a'):
             cmdfiles = cmdfiles_for_a(path, ar)
         elif path.endswith('modules.order'):
-            cmdfiles = cmdfiles_for_modorder(path)
+            cmdfiles = cmdfiles_for_modorder(path, directory)
         else:
             sys.exit('{}: unknown file type'.format(path))
 

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
-- 
2.56.0


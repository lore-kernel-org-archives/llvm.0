Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0E5340D9C
	for <llvm@lists.linux.dev>; Wed, 27 Aug 2025 08:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756285191; cv=none; b=Jd5OAZL60UBhV8EoRXtZoXPRWYbw1f+OYgz+ENHWQ4af1q8QmR2nXyXugyLyE9v4SRPi7HV812ZHvGr/wlhj/fMqBNr0sNkn068f2Shcxc5w0PMVKg2Km236tY8dBN6JHzmxH8WlbdO2+BjZ4HCeDYGz5+T1fQ+hufH/1xaufF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756285191; c=relaxed/simple;
	bh=G5RHcyAQhhynG+8D21Feb80SFmDzlYfQlsKBEaqLyto=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=C/54H294A7FDS+Cl1DN3U0Bf5vwPUaPaZ3iIwqWGGTijuRSHxpIQgcHMyfMbmYGl2CkYcRNofhk0gdYHCM4zWP7sB58bXIHRSnzV/43FuKfK9CPi13fndUH3d6+AS7xNgteFO6PR+VNY3ReeXMU49Jh7ZH4yHqtCWvQVNmObg3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e7R+xbaU; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e7R+xbaU"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3c79f0a57ddso2220653f8f.1
        for <llvm@lists.linux.dev>; Wed, 27 Aug 2025 01:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756285188; x=1756889988; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mCbvYqZ7Q+ZgN4xz3iEc7/nCTDhxbVjaEX6q4+sX7Vo=;
        b=e7R+xbaUrpENK7F9rGC83LF1qme5zYiUsX0D8JNtrc3tv9lK9+NAUaWqzS6Qsz3/EH
         wxRAhchNw6B7ZqdziWO24XNKCETcqDAacLYv8Ip8xUBOG3s3rxAkn7IvBbL5gHPwu0T0
         o1gTzgfC3HWhcZbDF9FsHw1wDc5wk7EjkqBhBdkn6+/jS6yUvO01fMM8s8KLlBhYs1uT
         u2q29AmD133X1xRFms61b7ETiwiExb/MLiYdaJ+omt5/F3O9f2hMe8U2hC8ZCSam47Dd
         wmxYNApBx4RXoR75wgejs67Aac9MGsN7hJuukB/aieNLDTX3/OkvjNrGy6iQ6f/MGfyA
         jB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756285188; x=1756889988;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mCbvYqZ7Q+ZgN4xz3iEc7/nCTDhxbVjaEX6q4+sX7Vo=;
        b=gu6Mu2HQemheNuMgr7dTU3WeVDBeEMguOxoIRW1GgYVecsCP8b4HRHBlkPRBs0mdDj
         S7AfXU2Ya0A/j5NH6u9cvQ5rv7rbInKrSEUDTUSO6OMV87v+NPCu35VQyfkT/hsfeYk0
         eSBpvTnziQ3BVWMW6xdfUjpI7OMXDCwcY2fSC4gkeCEzx7NPgm0K/dB3F4NoLVo3plY+
         nRA3hr4FtFeLYuHt5AoT6LJ76nG4sWfHdZvrpPN28QF17I8FMYLRxn2gRBIubYHfGqaA
         xzlVUD8vzoXMAZBu3gTOtkmXlLD0LsxkNdWkvjvfEGobrneF9A+EN4yAKpKfsO5pSVLY
         6T0g==
X-Forwarded-Encrypted: i=1; AJvYcCWSWtlr8b6zj6ZQMq4928/oWqIxbgnxdzyPOd40sayPIA+CPp09CMhrY0WgTpFk4vEA9YGL@lists.linux.dev
X-Gm-Message-State: AOJu0YxJPIjZWVx2Eqt3xfPKRqg63h8OjbMDiz3XITUWT8PJZHAFPmqH
	bsjpmR4BeDZi/9phFtMIJpMyV+YpoAt6quY8uQdpjiUvqjjSYiPs6cX4fUOXq2BM9/+XEUJ47F5
	F05+KHpTPjg82iQ==
X-Google-Smtp-Source: AGHT+IFC3E/+dRj3XpK74Hc/BqhSS54lPq0I2RSkjwdKWfWuGOOUksaXYb0YFnepvi7Gl5iDWfEyn1t3jdZJSQ==
X-Received: from wrsm11.prod.google.com ([2002:adf:fe4b:0:b0:3cc:31a8:d973])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:25c6:b0:3ca:4e3:6ea6 with SMTP id ffacd0b85a97d-3ca04e3768amr6875722f8f.46.1756285188065;
 Wed, 27 Aug 2025 01:59:48 -0700 (PDT)
Date: Wed, 27 Aug 2025 08:59:43 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP7IrmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyNz3dzE4pLUIl0jYxNTi8SkJEMDoxQloOKCotS0zAqwQdGxtbUAjd7 smFgAAAA=
X-Change-Id: 20250827-master-23458abb102d
X-Mailer: b4 0.14.2
Message-ID: <20250827-master-v1-1-19f9f367219c@google.com>
Subject: [PATCH] .gitignore: ignore temporary files from 'bear'
From: Brendan Jackman <jackmanb@google.com>
To: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>
Cc: linux-kernel@vger.kernel.org, Justin Stitt <justinstitt@google.com>, 
	llvm@lists.linux.dev, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

Bear [0] is a tool for generating compile_commands.json. For Kbuild,
Bear is not useful, since Kbuild already generates the necessary info
and that can be converted to compile_commands.json by
gen_compile_commads.py.

However, for code in tools/, it's handy. For example, this command
updates compile_commands.json so that clangd code navigation will also
work for the VMA unit tests:

	bear --append -- make -C tools/testing/vma -j

Bear generates some temporary files. These are usually deleted again
but having them show up ephemerally confuses tools that trigger
recompilation on source code changes. Ignore them in Git so that these
tools can tell they aren't source code.

[0]: https://github.com/rizsotto/Bear

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 .gitignore | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.gitignore b/.gitignore
index 929054df5212d68a32a1f5ee2b267389fcd1c8db..b07c8c8383bd791e903ce985c14c231cb6928411 100644
--- a/.gitignore
+++ b/.gitignore
@@ -53,6 +53,7 @@
 *.tar
 *.xz
 *.zst
+*.tmp
 Module.symvers
 dtbs-list
 modules.order
@@ -177,6 +178,9 @@ x509.genkey
 
 # Clang's compilation database file
 /compile_commands.json
+# Temporary files created by 'bear', a tool used for generating
+# compile_commands.json for non-Kbuild code.
+*.events.json
 
 # Documentation toolchain
 sphinx_*/

---
base-commit: fab1beda7597fac1cecc01707d55eadb6bbe773c
change-id: 20250827-master-23458abb102d

Best regards,
-- 
Brendan Jackman <jackmanb@google.com>


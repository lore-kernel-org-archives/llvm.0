Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08741F09A5
	for <llvm@lists.linux.dev>; Sun, 26 Jul 2026 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785060797; cv=none; b=fhihxtH5l2+GWR6+6BELkLAz+SoI40vG2UoJFiG6I3b+mwMG5Q5L9pRhoi6uPU3wTpbSrvH21wRBylE72+SOzSx/a9dSaGdIzCB7vAaV0Yn8t6qi9aMaU7jUAmUnm5JQlypzuqD41AL9VkyJnjUJm8af/YdS2Njp/uKeGkdI1t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785060797; c=relaxed/simple;
	bh=hMbwhWX1Er1b+7H8vHCWQZO1kW/LGuAOr5+dXSIawrE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fNU73U/6LizbMiliNqbzdaFv1hhqEhL53dpn6VNkBtu4WqL2iOyUhyM4rnOceLA3hmvnsZ9qESFIO9UEdwq6rWws7F8R2dsbCUxDIZGnMpmG7W0JVgjT52JCexxu7GMO2uLAjOM5i6a+TMKct8yc3SaiVKChRKR/CiIWtn7T5hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=kkAUy+6G; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="kkAUy+6G"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c999f162c9aso1287043a12.3
        for <llvm@lists.linux.dev>; Sun, 26 Jul 2026 03:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785060795; x=1785665595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wcAzVpejed4McahzXYzgR83QcZ2K+/EUa6LpMYvOA98=;
        b=kkAUy+6GIKVla7YITQ2YEyjexwOjtWiEGmQlsHKxM4gavV0Y7S9VZevz6zwGFdsYny
         D0H8meiX3LiBAv5aseYX+YhTPXddJB40csKKPRPbZrBssnObWO2NLL08EBu5v17vJ2Tm
         lYJTlYM6H9Po2vKc+2nt3YpixJPnP0L2UjjSoW/BDH1Wyy5HfvAI7rp08NI4VT401Vhw
         3GJsWIKvg1LVcyy/zsVBtZ0C4t1fDrmxd8bCmIsEWCzAFSnXWaE0u0nI2wP2esuqpBmA
         ZVowr9ub8TInj6CjToh9fFcm+0BA68ZnjmFpJEWZIfJFxkpiU6UVvltF2fUNUagFljFL
         aeKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785060795; x=1785665595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wcAzVpejed4McahzXYzgR83QcZ2K+/EUa6LpMYvOA98=;
        b=O5omvCmNVhLhOrSMsfjYQ7hyWsFRZLbPBtb7vmDF7uoBKo6qUDsU+V8TliANyH5JXZ
         BtdYUV6wxX6CNtIF/axoJ5Kr4zhV2wbEBBiM4WnatrD7EbOqC9CB5gODh5qu93lFJN+g
         FedsitmySc9AZLsHt+ttEFXNT9bcDBRZh2LPD7zJ7vLLSOMmsPeK7KSigdBVyYGSv0GW
         JmWnMVkMSpyGDP9TEWfxu84n00L7AXhIi+EWatJyBmoPl7K0doirhEu6BFKLMC3IZfOB
         y5eDbyEmR4UPZI8e5/0mtmyw977rF/FaJTY+QyNiUi8mk1KNb4o+3o5zHY80vBaTPw9E
         hZ5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpBbaiOLx5p32F1YpxWTPahTCZbc8YcTJBLVaz9bgC6TAXk9z7KN0mJWSzN8+5eCfibfEzg@lists.linux.dev
X-Gm-Message-State: AOJu0YxUg3xGExmOfoC8ZA7o5ep3nmcXkwlD7aqB6ZJ6ATJc3t395xyi
	49IxFkSWO3evOtf2ntUq4m5Axso/xUIx9S5cj03dvfhtwwrQOEQOiDjkogJi51tIt7c=
X-Gm-Gg: AR+sD12/fBzfQ9bOEJbKQumRW6cBz4PfJDI0h2q6ha//XwPzDfB1X3ZnJZleyJRjgeJ
	x9qjaOpqTzgbQo0+SDZFBsaoZd33B2cm+23i7GRJfN7VZKisJJ6jwEV0p7SeXMXtJm8f0lzJGkq
	4cOOqWfgre1mv8aifs7DinDxLWaQFUYm0q4bUqaSv/kElar5MbzAD4kH1zGLKTzYAoyj5y6Hgx3
	uov0/gsteS8O2aYOQQHANIxsWxY0lpSp4ZeSZN0/sl5XFgg29o88dQQPm7xjwecv0lxBOhTKKYC
	f+u4404KUoAPlh8JDa5PMvMHzq4fnNOfjIBGVPSMERwdS08KJwDOu/62dcrW/VlSVWqK4l2NTX2
	Ob4+mU47+Hoq+GF11wyqXnaiY5GTNLi4F9KyRWLMxBcpR7r4VXTsNw4MY9CTMm/5s4D+FfClSp8
	U019TXRyIoH7nfKQ==
X-Received: by 2002:a05:6a21:394c:b0:3bf:d1f9:b1df with SMTP id adf61e73a8af0-3c67e0c9effmr4541605637.54.1785060795098;
        Sun, 26 Jul 2026 03:13:15 -0700 (PDT)
Received: from integral2.. ([2402:8780:1329:2779:9db7:a8ec:2e1c:53e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59e9fesm17243981eec.27.2026.07.26.03.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 03:13:14 -0700 (PDT)
From: Ammar Faizi <ammarfaizi2@openresty.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Ammar Faizi <ammarfaizi2@openresty.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>,
	LLVM Mailing List <llvm@lists.linux.dev>,
	Yichun Zhang <yichun@openresty.com>,
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	gwml@gnuweeb.org
Subject: [PATCH 0/4] nolibc: syscall() and abs() fixes, plus a cleanup
Date: Sun, 26 Jul 2026 17:13:01 +0700
Message-Id: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

A small set of fixes and a cleanup. Tested on x86-64 and i386.

This contains:
 
- Evaluate syscall() arguments before they reach the arch macros. The
  __nolibc_syscallN() macros drop their arguments into local register
  variables, which GCC does not guarantee to survive a function call,
  so an argument such as strlen(msg) clobbers the registers that were
  already set up and the wrong syscall is made. Reproduced with gcc on
  i386 and x86-64 at -O0, -O1, -O2, -O3 and -Os.
 
- Avoid signed overflow in abs(), labs() and llabs(): negate in the
  corresponding unsigned type, so passing the type minimum no longer
  invokes undefined behavior. The value is still not representable in
  the result type, so the minimum is returned unchanged. Under the:

    -fsanitize=undefined -fsanitize-trap=all

  flags the selftests are built with, the old code did not merely
  return an unspecified answer, it died with SIGILL (thrown by ud2).
 
- Add an abs() range test walking abs(), labs() and llabs() over the
  interesting points of their argument type: the minimum, the minimum
  plus one, an ordinary negative value, zero and the maximum.
 
- Remove the dead __ARCH_WANT_SYS_OLD_SELECT from arch-x86.h and
  arch-arm.h. It lost its last user when select() was reimplemented on
  top of pselect6 for every architecture.
 
Patches 1 and 2 are fixes. Patch 3 is the selftest that covers patch 2,
and patch 4 is a pure cleanup.

Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
---

Ammar Faizi (4):
  tools/nolibc: evaluate syscall() arguments before the arch macros
  tools/nolibc: stdlib: avoid signed overflow in abs() and friends
  selftests/nolibc: add abs() range test
  tools/nolibc: remove dead __ARCH_WANT_SYS_OLD_SELECT

 tools/include/nolibc/arch-arm.h              |  3 -
 tools/include/nolibc/arch-x86.h              |  3 -
 tools/include/nolibc/stdlib.h                | 12 +++-
 tools/include/nolibc/sys/syscall.h           | 72 +++++++++++++++++++-
 tools/testing/selftests/nolibc/nolibc-test.c | 47 +++++++++++++
 5 files changed, 127 insertions(+), 10 deletions(-)


base-commit: 070cf03f5ec454eec9c42827ee9f3c0b3fad09f1
-- 
Ammar Faizi


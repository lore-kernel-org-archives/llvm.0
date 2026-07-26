Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA51F305693
	for <llvm@lists.linux.dev>; Sun, 26 Jul 2026 10:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785060805; cv=none; b=at1DeW78mbK/LMv3J4ik7QZTHSP4/3XdFlXLns2uqXa3rO+CPhv3+Ib9atKhBfdQXhn2ci/4KC8bU0v5ge3s4Wv0Cvw9tv5Xrdkhfw0kIXwxlOERvYEm/ZK/hpMmMJZQwS0kWTzIt7JZQBULHsVOqsZK1pY3e1nhSA+nHKP20is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785060805; c=relaxed/simple;
	bh=QOdOi199BViQDB2zktzRARAZBH5W7lFBr1ovz4QbkjI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rl5wNk1mVdQDslG2IZsgCb+HCHRZrIvrLXYp/hIk57gun8ysQ6Wg5m8S7xBORbGZ7iD+vdV47m51EaksxWZx95qWQqm1zBSaZnjjUzVZfGoXg5UZJtz5/g+EWT9TaSgmcOJz1ofCLQ7mzLN+bTu2vfsDG2SHvls1M7SnnK9LD3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=URfUGJVv; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="URfUGJVv"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e08baf860so1823132a91.2
        for <llvm@lists.linux.dev>; Sun, 26 Jul 2026 03:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785060803; x=1785665603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzYyTqubCWXIpDP8ZIyMuH6xumXv5Qqvgs5r4fwNWNM=;
        b=URfUGJVvdQla4S6H9b8n77GvFbavHndXQ1+HQ8Sc6BYRrfDgFHsOA2W3EVX4phgF7Q
         VApC3icRviXLCBcl7n6nIjDhdq08rRKROGKshlX6IzrRxLXv9REYXWo7ccSTTZtcDBoQ
         o7vkG+oJDFpk3Nn5ZHyYbyoTgtee8JP+6oneFTkYqhiV0dM6vtJnHh5a3KFs2jRvpcc1
         DL0kdJ5wYRY+ElmKBAJ04rgpPwmqf24q1j6IXbDhtYAwMGWaEHcBSoL+PLEYNYA/sbLl
         h4di6i4bqOSRolqHngQze3XU0kZAtv9oBEZRb8V+KPnec4o5hbTqbCP+L49eaIHGOUan
         ESxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785060803; x=1785665603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IzYyTqubCWXIpDP8ZIyMuH6xumXv5Qqvgs5r4fwNWNM=;
        b=lM04i3tgKfUSzK+R6FsgXuhYHkV0oJbF6tQ64XVp2VUl1fR29wuauAvDrBXhJ5W5/D
         /Y4zy9D2HxWJfUNDh9WVwsbFu/VP4HemSFgjYklHuZMhKQhguyPMWr6QyAwd3vorWGyu
         gFesS5de8CxYHMdvwzU/bCQ5jZgh0SAvEX4NzYMVonMfa6BZs2OLrgDHc/JgLDiH0U9s
         EA6nB0JQA8WoEnxxed6h8rVi3bC/9UtNrl1FiWMUJuzkeryE99pMgZKnBUtAMsgOdvO+
         GoByAGpm/3uPOvZtruoUbJNXOIu9l6cFgVHJnIOHFZ6K/cmQxHIHO2zQ0cMBjN5VMWl3
         +uZQ==
X-Forwarded-Encrypted: i=1; AHgh+RokxgD4WpDJ20LW6W64g/a7eSMFQhWk3v224ThS1oa/ACWV7djKusdKkI6H2mgS0WiDjIgJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzxRYwAAXthHmY27eSnBCT+Ljoo21zIH15sM98JZkaRR4QYhQ0j
	IeVbK7erKBnjWbYLFe75qHLggdoGUoDBhxPrRLCPdSJfJO0jkRTY9/bB468coH+sOVs=
X-Gm-Gg: AR+sD11HBDg+JuuRzZ7kepr85GU4aaEVq9YGCgPvYPzTxnKgFQEkzksWJSnZUg6atIU
	BD4X9gVj8ixDF855bFMyTzhrk/liih6NaHLFRWzJlIr++NR9/xfcd4gI0SS6nV9sGi73RsPfyQD
	rYH9sPRvGilyTh52CbGWuOVFlLoycs4c8r38gTfSn5uPBmrmkCAv5GOi9/XkeZ4U1zJzzEavbqb
	WFk62aq2GG8B/huAM5tw3oIfby8Oomb5MGSbr1pvSwaK5q9qqkEgox5qsNtLd10z50M2/SyhtnH
	htaL1UVZVsoQl5xH1Ci9Jo7zV7Dk+Q2RxudR30FDuton9w24LbZsNQGsyijdH83/y7O2C2hzYuw
	b3hcGxvEqN85zC5lHosA2wP1Lee4YduVoj6oK3h7Glnhleba/5w/slmWUbvBnHZQy3UU44YZSMz
	mcioe6jexiQLookw==
X-Received: by 2002:a17:90b:254c:b0:387:e0db:3d8d with SMTP id 98e67ed59e1d1-38f298859c2mr4688509a91.40.1785060803000;
        Sun, 26 Jul 2026 03:13:23 -0700 (PDT)
Received: from integral2.. ([2402:8780:1329:2779:9db7:a8ec:2e1c:53e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59e9fesm17243981eec.27.2026.07.26.03.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 03:13:22 -0700 (PDT)
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
Subject: [PATCH 2/4] tools/nolibc: stdlib: avoid signed overflow in abs() and friends
Date: Sun, 26 Jul 2026 17:13:03 +0700
Message-Id: <20260726101306.3772237-3-ammarfaizi2@openresty.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Negating the smallest negative value of a signed type overflows, which
is undefined behavior. The selftests are built with:

    -fsanitize=undefined -fsanitize-trap=all

so a caller passing INT_MIN does not merely get an unspecified answer,
it dies (on both x86-64 and i386):

    A simple test program:

      printf("x = %d\n", abs(INT_MIN));

    $ ./ab
    Illegal instruction (core dumped)

    (gdb) bt
    #0  0x0000000000401009 in main ()
    (gdb) x/6i main
       0x401000 <main>:     mov    $0x80000000,%eax
       0x401005 <main+5>:   neg    %eax
       0x401007 <main+7>:   jno    0x40100b <main+11>
    => 0x401009 <main+9>:   ud2
       0x40100b <main+11>:  push   %rax
       0x40100c <main+12>:  mov    $0x80000000,%esi

Negate in the corresponding unsigned type instead. The value still
cannot be represented in the result type, so the minimum is returned
unchanged.

Cc: Yichun Zhang <yichun@openresty.com>
Cc: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
Fixes: bf5e8a78bede ("tools/nolibc: add abs() and friends")
Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
---
 tools/include/nolibc/stdlib.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
index 1816c2368b68..8d86044f759f 100644
--- a/tools/include/nolibc/stdlib.h
+++ b/tools/include/nolibc/stdlib.h
@@ -32,22 +32,28 @@ static __attribute__((unused)) char itoa_buffer[21];
  * As much as possible, please keep functions alphabetically sorted.
  */
 
+/*
+ * The absolute value of the smallest negative value is not representable in
+ * the result type. Negate in the unsigned type so that the overflow is
+ * defined and return it unchanged, like the other libcs do.
+ */
+
 static __inline__
 int abs(int j)
 {
-	return j >= 0 ? j : -j;
+	return j >= 0 ? j : (int)-(unsigned int)j;
 }
 
 static __inline__
 long labs(long j)
 {
-	return j >= 0 ? j : -j;
+	return j >= 0 ? j : (long)-(unsigned long)j;
 }
 
 static __inline__
 long long llabs(long long j)
 {
-	return j >= 0 ? j : -j;
+	return j >= 0 ? j : (long long)-(unsigned long long)j;
 }
 
 /* must be exported, as it's used by libgcc for various divide functions */
-- 
Ammar Faizi


Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5406F1F09A5
	for <llvm@lists.linux.dev>; Sun, 26 Jul 2026 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785060814; cv=none; b=cww5ta/ZmyatzfBFURi8Ns1mSSPP0qH53elGQib+KaR8DRBN4+HQE9xnuQ3l0XOswBxQqLq4/qAEWqBIYO0UlPxOO7Hwhg2D3Oru8EOO9MOp6OAdQTfl1QWPHGpcgzUiqxN+VmUwsck9ZAB//h1j5KcxDQ7FZftkTXDPLC3pYjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785060814; c=relaxed/simple;
	bh=9yh2PeC9iH2ehGJhAogCXH1OX690Q3HSkoCKr4p5te0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V5uRdBuAqs28pDQ+NGQmCq8cj3NKrnAOOkzHLyMtAGktdJTZSMyzbjRcdYREJHhqoXT7KHpUzmlG92yGbVzRvZZMqo2rFE0HmV7XUnzJFAErLGXlJc/7XxlQCGcLQbC+mSbtVO9HLZjgBQ9+n9Tp2tISbjilLV5eCp78yxmHYmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=l6xFaemr; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="l6xFaemr"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso1012208a12.2
        for <llvm@lists.linux.dev>; Sun, 26 Jul 2026 03:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785060811; x=1785665611; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrlASkg3aEU6DCVKYIVsNYyPT/klq2H1IARTdtVshro=;
        b=l6xFaemr+zpIztxREeHWuAYQ0tmjH3E7CKHlvUACwReDe8gETBYBafNGpQaDXseoOL
         D+52oPfuDur7kjKIg54OVSSq2izVrDO4j5miTKbwjinzueRUPvy9W8bcsq6gzCukHOJk
         PsmNrA5Ph9trvkSwy7NT3PRMSoAQxks06z4TQ/Ip0hwSB2eZqtONZe11B2kGA+YybOZs
         gxTrFEs+JPsMEndUQ/i3SpaedyHjhXvhUbE8JRwryo383D7D6HxVDnywyiMT1a9azH1H
         yhYjufHqzEmc2rqDYsibTSrft7zEDtUo5WTOFLPFNPzFjCeUTl7IDb78NAALTthAJmHy
         pwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785060811; x=1785665611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrlASkg3aEU6DCVKYIVsNYyPT/klq2H1IARTdtVshro=;
        b=jE745tVJkHZIH3vRebsIftznfHXMrbwY4NQ0pPFVUKL6YeIzpAnjU5BsAWVKll5ilf
         JB5So00ZcRAO1r7WTZFfVQUIezJ0MNTYdEgtjkbUBr7lXjxUaPKseMWDWOCBomhJ84oX
         DHdr2kHgZfzZXPxuU+7EzjXf0OBziaPRi9Wvc3CXQOGp4xtTco5UCYcIXSyfpyDAMxLK
         Pxjr1xCW6QlX1BbmhwAc4PhFTsGihvIVXmyS0LlyNKw8JLCAEo3yY11gr6idyT76Jadk
         HZuehdhKclu1T5dghabPAFMvv3FLKss5V4tg54dEnimj1ybww/52oVjjal2y1toIwpgi
         nsXg==
X-Forwarded-Encrypted: i=1; AHgh+RqJhtSvV7/loeEFom9aqHvQrFD4DRUS1prGHwRypexxdNmZSvDKYVDK1F0E7Io0pT7dnUXF@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf93XFSLQCk2PIasdZ1xhzy8RsVgx/ZTY8uH4t0VkCFNI6yMOX
	0q0xHqXpVW27je8ymoxPlpzQd4oc1EH26wD50KNDyTNqWbKEzgqQffzOyPzrub+Uzm8=
X-Gm-Gg: AR+sD11Jy4w2beZ1tdq+I4dyrIQtsvT/hlPlUSRKdSvhTihNHNdUTx2x2Gma99Zx7Oo
	UEDFKj+Hls3TnkXbzkfGf4yEbmGOmxM816INnjFEaHLan+ukF18s1tyC44336Jg5Yj53/hkKKvd
	O+xHrrKsypwZNc1P+bDoEMXl8zk+1MDumEbFq5SJ+aQswp1pNj9+nJVSlxBYJ3Icf3WtN4Iy1ib
	Fb5Y5YQwG4Tt22Rq4tYAIyLc6D08JTlGUle9G+slCQAFZDgu3eGHVF4Xkub7dRjcE0Si7/RcxUJ
	dtHn1lpE3kSNx+HVfE/oK89YeVBoEskG1rIKYUVOdTOqY+2lOxnK4bY/YPrKMTGWA76lVd27Y0H
	H9L9vgeMcSw3M40KTYtyyabMeW+Oyk2VuIGp2FSb2yiYWBiR7VrDs9MaP+Z3tgmN7+BCevEuKI5
	cTmO2+3dV1VrA1KQ==
X-Received: by 2002:a05:6a20:2d11:b0:3c3:824d:5200 with SMTP id adf61e73a8af0-3c67df2e412mr4352320637.41.1785060811108;
        Sun, 26 Jul 2026 03:13:31 -0700 (PDT)
Received: from integral2.. ([2402:8780:1329:2779:9db7:a8ec:2e1c:53e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59e9fesm17243981eec.27.2026.07.26.03.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 03:13:30 -0700 (PDT)
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
Subject: [PATCH 4/4] tools/nolibc: remove dead __ARCH_WANT_SYS_OLD_SELECT
Date: Sun, 26 Jul 2026 17:13:05 +0700
Message-Id: <20260726101306.3772237-5-ammarfaizi2@openresty.com>
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

The macro lost its last user when select() was reimplemented on top of
pselect6 for every architecture; sys/select.h no longer looks at it,
and nothing else in the tree does either. See commit 668e43737279
("tools/nolibc/select: drop non-pselect based implementations").

The comment that goes with it is stale for the same reason, as neither
architecture can end up calling old_select any more.

Drop both from arch-x86.h and arch-arm.h.

Cc: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
---
 tools/include/nolibc/arch-arm.h | 3 ---
 tools/include/nolibc/arch-x86.h | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/tools/include/nolibc/arch-arm.h b/tools/include/nolibc/arch-arm.h
index 8681922e05ca..b88686fb19c4 100644
--- a/tools/include/nolibc/arch-arm.h
+++ b/tools/include/nolibc/arch-arm.h
@@ -33,10 +33,7 @@
  *     with r7 before calling svc, and r6 is marked as clobbered.
  *     We're just using any regular register which we assign to r7 after saving
  *     it.
- *
- * Also, ARM supports the old_select syscall if newselect is not available
  */
-#define __ARCH_WANT_SYS_OLD_SELECT
 
 #if (defined(__THUMBEB__) || defined(__THUMBEL__)) && \
     !defined(NOLIBC_OMIT_FRAME_POINTER)
diff --git a/tools/include/nolibc/arch-x86.h b/tools/include/nolibc/arch-x86.h
index fe152ac2650b..577e9b682eb3 100644
--- a/tools/include/nolibc/arch-x86.h
+++ b/tools/include/nolibc/arch-x86.h
@@ -25,10 +25,7 @@
  *     don't have to experience issues with register constraints.
  *   - the syscall number is always specified last in order to allow to force
  *     some registers before (gcc refuses a %-register at the last position).
- *
- * Also, i386 supports the old_select syscall if newselect is not available
  */
-#define __ARCH_WANT_SYS_OLD_SELECT
 
 #define __nolibc_syscall0(num)                                                \
 ({                                                                            \
-- 
Ammar Faizi


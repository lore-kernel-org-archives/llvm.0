Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5519E24728E
	for <llvm@lists.linux.dev>; Thu,  7 Aug 2025 08:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754554181; cv=none; b=f1zDXMiBn7HFHgn2N5EcNPK5ooJt75/Cc1ThQHntZwbn1BhSHHe+sAqTmoqnqnfaXn/V8U4fKnWmqw49JdYSRV3VC4JVSBZlwDxR2otdurNaFW0SI8iwDo34b9m/kgMdEQBPTeB1d/KIfehnnbkbDSPLEVl70kdX1onBp/XtIsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754554181; c=relaxed/simple;
	bh=NG8aMCDYi/WL5efK/Uu3n3eKEM6SXtiTD1GUBeg7nR4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jbjsKp90ClMFY+Rzfa2/FZ9V+Mkgh26bCyzKPwYgayOMVQFIAZAPv2CXsZXm7FMy/HOT0NQR6pW6ohWK7GYepDMX6Xk5Gr3NxF31oe4w2SQJOh+lhqgyBSUqPxHF7QjHlyodb2iuy0lf70zoztMFt6hQNtxnLLyHdwyNvsLUdPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tSiJTf9m; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tSiJTf9m"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-31ebadfb7f2so799143a91.1
        for <llvm@lists.linux.dev>; Thu, 07 Aug 2025 01:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754554178; x=1755158978; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VLNRGdnrrrHWLpewd/Xb7yM5Du12QJz86ZRVs5IOSyk=;
        b=tSiJTf9mKKUaxgnRrLRx4xtd5SmIlNrOPZlGotcoTmhQK1UNnDazYQBg55C2ccJ9wi
         83AxnkQtuE9aSpspd/mfYg/kbgr7Q8Y+Wf+y+oqLWAACVZygukFnTX7aC75qs0aRw72V
         zTdJnrrgNEcvELEFKe0kQz9ga3p3tD9zfRwR0Nb0jmGwvZRAe/Ns1zwRczgFGF6oXwis
         UjFIPnSWl68xyukwfe0b11nXLZLZ5cRjslOFcvfPRdH3CcwkHGU+78xObGJLBjOIYX+1
         1ttViomjVIj9IwOjCXux9ZY9TEz78Ae/Blke6ajRsf9Fcm/W14H7UccZqM0HfeEe28A/
         o0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754554178; x=1755158978;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLNRGdnrrrHWLpewd/Xb7yM5Du12QJz86ZRVs5IOSyk=;
        b=s7UHyNUtmSP96Z0sk+awTEXAQHfTyQ2MwKORjdhanfwz39tFs8run1YyajFJrU2WHH
         KP4lBZ6T8HoCU1A8q910xVD1Y7FEjJHXDIHYw6zH3x11CtC2Y4c03Dd31yBxXGe+DSLo
         cYZUFQL6bpY5PC25RfIFCq3smXgDQj0cUVlJqf6NrcUUkEhfDzGLCFMPLr1g+LgF96bI
         OOR6Z569pm3ozCmXaWOPmNRnZAs1HHKDqTFd483XABJ8CatJAFhVaZcFlxAjas8+L+3t
         v5/s2LFoGx8tJrIl32lNeiTZktLfE8WAqSaYqjlMy3Aqz4qHQkFC9rfkLAior/WhqP7n
         E7lQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2JSkyC9/obgStzsPE15mP5+Dr0C0HGGV/YSm1bteekPUFzMCNDX3+8FMNnohESLHdNDoa@lists.linux.dev
X-Gm-Message-State: AOJu0YxydAFHBra57Hcnm654X5jzLetZo+/Hjq+4smX+xdGcyrR60j4Y
	vlYZwZBL/QjnViZHkcGeqZ7WZjDOEDQySwCMLFo1F+oJo+1XEvK0sBh5byLO0hmvcl6q6Sk1lTn
	QdA==
X-Google-Smtp-Source: AGHT+IG8sljjPjemytxJ6EepEkRImkq0DnvG/hG3DgghsQDxt5WKavU7F2Clp5GAwSB/brbaER3yPagxfw==
X-Received: from pjbta7.prod.google.com ([2002:a17:90b:4ec7:b0:314:d44:4108])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4e85:b0:31e:326e:4d2d
 with SMTP id 98e67ed59e1d1-321763087famr3140808a91.5.1754554178483; Thu, 07
 Aug 2025 01:09:38 -0700 (PDT)
Date: Thu,  7 Aug 2025 16:09:32 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.703.g449372360f-goog
Message-ID: <20250807080932.1678178-1-wakel@google.com>
Subject: [PATCH] selftests/net: Replace non-standard __WORDSIZE with
 sizeof(long) * 8
From: Wake Liu <wakel@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, wakel@google.com
Content-Type: text/plain; charset="UTF-8"

The `__WORDSIZE` macro, defined in the non-standard `<bits/wordsize.h>`
header, is a GNU extension and not universally available with all
toolchains, such as Clang when used with musl libc.

This can lead to build failures in environments where this header is
missing.

The intention of the code is to determine the bit width of a C `long`.
Replace the non-portable `__WORDSIZE` with the standard and portable
`sizeof(long) * 8` expression to achieve the same result.

This change also removes the inclusion of the now-unused
`<bits/wordsize.h>` header.

Signed-off-by: Wake Liu <wakel@google.com>
---
 tools/testing/selftests/net/psock_tpacket.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/psock_tpacket.c b/tools/testing/selftests/net/psock_tpacket.c
index 221270cee3ea..0dd909e325d9 100644
--- a/tools/testing/selftests/net/psock_tpacket.c
+++ b/tools/testing/selftests/net/psock_tpacket.c
@@ -33,7 +33,6 @@
 #include <ctype.h>
 #include <fcntl.h>
 #include <unistd.h>
-#include <bits/wordsize.h>
 #include <net/ethernet.h>
 #include <netinet/ip.h>
 #include <arpa/inet.h>
@@ -785,7 +784,7 @@ static int test_kernel_bit_width(void)
 
 static int test_user_bit_width(void)
 {
-	return __WORDSIZE;
+	return sizeof(long) * 8;
 }
 
 static const char *tpacket_str[] = {
-- 
2.50.1.703.g449372360f-goog


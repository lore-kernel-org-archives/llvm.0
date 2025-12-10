Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2FF221299
	for <llvm@lists.linux.dev>; Wed, 10 Dec 2025 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765358054; cv=none; b=R42XoKJsIuZjDpEMY8rJy5wA+AcP8yqhg+yNNdHF3vM/PwaYF/qZya+XDke1gsE/dRdKTiJRqYQsvWKIOznnrIL4RuNu0oohNB74if9nJJU3F1zDzgVa6/7K0MMrxksrK7BFXTFlv3SZkT+eMDDJ/rjA9Po2BWaFsQOsS4otKMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765358054; c=relaxed/simple;
	bh=qA8etQBYMVx7IE9HjB0d2PDyzFeEHh6dA5fDZxxGkug=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=r/Lo737ZaqtQ9czFBHfRPyou5ma00CkOuM/Rp4xbA/CRtv1gF0d1shVJZbcwtkOujR53fclXtcI69nFhBrxuS8nry79zeuNjcsPYUo+slLnLcZBQDKa7DDnQ7GviDIOAGg3dvg5uu7R2d+5BGVfazVG4NRJTmwwb8Mu7uVzEGCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JDVY/ks4; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JDVY/ks4"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-29809acd049so148158595ad.3
        for <llvm@lists.linux.dev>; Wed, 10 Dec 2025 01:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765358052; x=1765962852; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gJ+diNdvdoAjNwW4/UoG9jb3p4kgQF7Wid7xBQKDtGQ=;
        b=JDVY/ks4o4akJXKyXf4mMaeabL3PXxqvpQM4hTQ4mWAsbu+KIkdRLsbTIj0DJ6FnZa
         gmKi6254BW4ax5Udk151dcQUklH2Q8RwZi/j8x6aahkxPDfeeRWS6p8qHyFzl78e4pAp
         +PUfZ0FQn2vitd3P2zAMrwhr/bCHU238u3UWsp+O2lcL9T4HpKNiEEMgvjhRkOQ5y9hh
         V+611bTnHELGRNIbu1gc2KaE+3xlnySgsKuz9D/woFcYZOKh/OxFUeuIRY0frnjQKiZ5
         Gp3o3vwZfi82Dd5QaabXpZ1vdSEdRwgwXFbjHbTM+jrNQrj8wRexnw5MD+GBZdAFtfrS
         KFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765358052; x=1765962852;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJ+diNdvdoAjNwW4/UoG9jb3p4kgQF7Wid7xBQKDtGQ=;
        b=dxzwwQ5D5dN7IJ+2PapJsOq4+GRHT8i+CJAg8a/sMqtsqHtN2xL3PXOLus5qiNUvde
         pxXHpTVT44OlLKRkxS/DkyFWZier+9YRxssANwNl6ZAqZj56jX8ay8GSJW6xL58l+p8t
         r4ywTxdqeCP4fQ5i7c++CQlyjJyCwecY/6dpq0sk46n+MsR1C9dV1jLYbDBKiOT+2p74
         AgWbIQ2ah4HJe4OXvT+OipKdxjeF1I1yw0DGOF6WyAJKD4F5GqyU2Qt3Ieeh3xV0t97u
         AEJ2QW0LatgF6r4fnAWkMMceeIPNvAnL/YFduvP7xvFEMtlm5bdpPWhMgyLEQjjT8tBg
         g+jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhsYLRERs3zQHb1vRyxVDh1Q5WnJHUl2KHt39ovApBSiqjUWzna7eDKIOnLVa4LY/qrAf+@lists.linux.dev
X-Gm-Message-State: AOJu0YwBRyC8VSiYc+wAyP1dKkH2EfaoofXeP/eKZbXsEkAbaDbWCnhz
	EB+oCMbg53seSNnufU87lp5XfZ//81wN5FbdI1li4EQjXwaO9uHZhCo7zLCAmVz6zRvpimdNogO
	ZfQ==
X-Google-Smtp-Source: AGHT+IEu6z3l2QX6KuLU3Q6OFfDJ0FX6A27zVmwG9FygHINtFnYd4ff1NV1/k8xr34jkmCShD9fTkvGN/A==
X-Received: from plij11.prod.google.com ([2002:a17:903:380b:b0:290:28e2:ce65])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d482:b0:295:4d97:84fc
 with SMTP id d9443c01a7336-29ec2484bcemr16730975ad.32.1765358052034; Wed, 10
 Dec 2025 01:14:12 -0800 (PST)
Date: Wed, 10 Dec 2025 17:14:08 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251210091408.3781445-1-wakel@google.com>
Subject: [PATCH] selftests/mm: Fix thread state check in uffd-unit-tests
From: Wake Liu <wakel@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Wake Liu <wakel@google.com>
Content-Type: text/plain; charset="UTF-8"

In the thread_state_get() function, the logic to find the thread's state
character was using `sizeof(header) - 1` to calculate the offset from
the "State:\t" string.

The `header` variable is a `const char *` pointer. `sizeof()` on a
pointer returns the size of the pointer itself, not the length of the
string literal it points to. This makes the code's behavior dependent
on the architecture's pointer size.

This bug was identified on a 32-bit ARM build (`gsi_tv_arm`) for
Android, running on an ARMv8-based device, compiled with Clang 19.0.1.

On this 32-bit architecture, `sizeof(char *)` is 4. The expression
`sizeof(header) - 1` resulted in an incorrect offset of 3, causing the
test to read the wrong character from `/proc/[tid]/status` and fail.

On 64-bit architectures, `sizeof(char *)` is 8, so the expression
coincidentally evaluates to 7, which matches the length of "State:\t".
This is why the bug likely remained hidden on 64-bit builds.

To fix this and make the code portable and correct across all
architectures, this patch replaces `sizeof(header) - 1` with
`strlen(header)`. The `strlen()` function correctly calculates the
string's length, ensuring the correct offset is always used.

Signed-off-by: Wake Liu <wakel@google.com>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index f4807242c5b2..6f5e404a446c 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -1317,7 +1317,7 @@ static thread_state thread_state_get(pid_t tid)
 		p = strstr(tmp, header);
 		if (p) {
 			/* For example, "State:\tD (disk sleep)" */
-			c = *(p + sizeof(header) - 1);
+			c = *(p + strlen(header));
 			return c == 'D' ?
 			    THR_STATE_UNINTERRUPTIBLE : THR_STATE_UNKNOWN;
 		}
-- 
2.52.0.223.gf5cc29aaa4-goog


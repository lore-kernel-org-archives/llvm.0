Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6BB266585
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746033348; cv=none; b=aEwojwMn2x92t+n0Gkr6Hx/jkT8XxJ5J2dWuMFTcPpK1/FGfKlqcXqFpyiOIo8c24EfC5Mnt3tOdxum4oRKilBfM9O7VGd6mUDYCUcFkxGqraDX6xQx/CUCRy6LDxCbRBohO+SYEcvIT9GQlSASxz/Pp/dF5SU61mZ+GZ+skJ4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746033348; c=relaxed/simple;
	bh=b5n+p0p3B+o0lVnDJxYolZguQtjCrIGPwnCN1vjSRAU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=lTpsDlhOXPex3LBBp+BQ9WUr5le26j1GUZMSLvnNse8CRtiQ0B4VNZXch0sLmgUffFlFvZD2tyWw93W8DBDVY1sW95xdiuBc181wza7z+c+H7haLxAe69iFUy4LrfmuO0dLfNP8cJfcCAmpwS8JG7idIi2wPtaU7k4OLVWPPOFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0df1aTXe; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0df1aTXe"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-739515de999so98667b3a.1
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746033346; x=1746638146; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hsdZl0+5u5nJRx5OChJBArmUD0oJ0ouyPxFpzVvIMfU=;
        b=0df1aTXeY0KLRWWavMruVCSdYUuJNWqDg/Iwmst6am5VeifKQ6d+upRBtVU3QQNRlS
         r1rhLwhNch7WHrfVmg5ff6y2nlhs2bhOzKEl//Ouf7D79eSclGE+XCJ1bA7/qGHsgXOF
         lc5f7rCgfZmFutBlwvKTJTxdrdb6CElSfhrKyVpwxVHW4yq8jF0kEs2aBn20/b3yxSYZ
         ypoA55SO/ZrU2JgZNzdnjM8zJLzZlCpPdRhjuAAQQpb0i8lGERaUrAzR1R84G2gQoME7
         a6Q4TTzqIdx3L8e7e3wdwkw7IR+9W6Xx1n64fKnM2NGBQbCrrHmhBGNf0iXZMLrOWh6v
         1rDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746033346; x=1746638146;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsdZl0+5u5nJRx5OChJBArmUD0oJ0ouyPxFpzVvIMfU=;
        b=qD7xV7cGW/zvQrkXFAIse9r9Y6rMISiyv9syfkpLyYyU/KKQLHyA0tTHYO+7DY6E2C
         tN+BerXAsCI/LC5x+po5a3COt7Hl7oUSQA7aZLLRg2fTB5oi35oLT1SRRHwK3wi51SLu
         RNIs9qoQ1oFMSmOOvwVJcIP++vP2s0NqRXVbp3QPb7wi09WkU2HrIGuu7HNGiDtwHxlF
         +osuFud7vOBcPLJMnC/bcRgjvjqDE2oyZkeoBH/Hlf/Y6C4anUHNFRYOxmqG01RXTJ7m
         dunYEo2v6uvgXXxyT3Dc356mM2VKFHcjxe8tPro60vNemQXuZRvZ9C/ajZQMX+WSS4WN
         Ejeg==
X-Forwarded-Encrypted: i=1; AJvYcCXkTqkiEAerVZD9dfuZk2hA76X8WOXn0ZbLxSwwFZkPL4gerpQrpA9HxjEFtCd4yUFEELGd@lists.linux.dev
X-Gm-Message-State: AOJu0YzcKneCcEzPkM9CBFRdrCTiGgdEcJmCkrW5RWN4t1VsZ3MkmI4X
	F+dMlrkFlsAI9OLJoquly4XVGkuiTgrq7gFp8dIFklM2ZxOMP1KWNuj9fR7B+KjptiblQOraq0i
	U7MFA/A==
X-Google-Smtp-Source: AGHT+IH5YtRVCcmk/wqXASBTNnMEzZz9u8UpGehwrJivWav/O6WKRgJlaCeWX2JmolUzo5pIQPg8Xc06cId1
X-Received: from pgct16.prod.google.com ([2002:a05:6a02:5290:b0:af2:47b7:4d61])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9c97:b0:1f3:33bf:6640
 with SMTP id adf61e73a8af0-20a87d4bda7mr6205234637.18.1746033346436; Wed, 30
 Apr 2025 10:15:46 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:15:32 -0700
In-Reply-To: <20250430171534.132774-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430171534.132774-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430171534.132774-4-irogers@google.com>
Subject: [PATCH v2 3/5] bitops: Silence a clang -Wshorten-64-to-32 warning
From: Ian Rogers <irogers@google.com>
To: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit. This isn't to say the code is currently incorrect
but without silencing the warning it is hard to spot the erroneous
cases.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/asm-generic/bitops/fls64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/bitops/fls64.h b/include/asm-generic/bitops/fls64.h
index 866f2b2304ff..9ad3ff12f454 100644
--- a/include/asm-generic/bitops/fls64.h
+++ b/include/asm-generic/bitops/fls64.h
@@ -21,7 +21,7 @@ static __always_inline int fls64(__u64 x)
 	__u32 h = x >> 32;
 	if (h)
 		return fls(h) + 32;
-	return fls(x);
+	return fls((__u32)x);
 }
 #elif BITS_PER_LONG == 64
 static __always_inline int fls64(__u64 x)
-- 
2.49.0.906.g1f30a19c02-goog


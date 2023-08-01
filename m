Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56CF4DC94
	for <llvm@lists.linux.dev>; Tue,  1 Aug 2023 22:22:26 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d1ebc896bd7so7006638276.2
        for <llvm@lists.linux.dev>; Tue, 01 Aug 2023 15:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690928545; x=1691533345;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qdq1QXzvBye3WPzSe4XaK38onFNZo3hs4fREXJmryW4=;
        b=yFZATxVFwdyeZsYr/9WCBmdfdj5iHWfXapu8fa8Ga+vqLw+ZGN5LSPG0FGOl+dSWwJ
         dV8cPD6wXAWF2sw1PaeSS7S2a3SIhuzG7wje2xR8P/+Sygug78lCik23/ZZpU+4PBpcY
         CiU8R+B5L8IP3kjcZD1OhBgCxddy1Z2pw7qqEYIcl73Miwuo5L5bjWhNvH5F8OMlZgSd
         rE3P8FC8m2XPvfSaMO38q8amGfJ3eKBf6S5gtNuovLEdZu1lQsQIRojVM493LoldoTZD
         YdQCqeNo9SPI9tw+Ca8LEMMD51Z6mHn7KMAE52D34Xuc0PAdsvepS0gNhEW3dbY/IV+A
         QFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690928545; x=1691533345;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qdq1QXzvBye3WPzSe4XaK38onFNZo3hs4fREXJmryW4=;
        b=B6/3WVjpur6MbeLG9KjKwJ3r0xyBhrv4o8dYBT2Fhl+dg+gFfFrfbZ8GnRw9qoQY0y
         xg2NqeIffd9aJez0bDeK/PN3M7t8k4iu6II5s1RCr9Q7f5cwXZSM98+/d95krTxP6I4D
         5GSb8UAIF/RaHgdAGPDnI9gzrPHpOM6p4MBdhxMLS6XB4YIATtg1dZUi1wSk7kcaJ3ag
         DkBRD9cTgwgdmZvvJqNfFK+qUtU1O3I9DT9weEBJF/Us4utmhnoJcS+Zpjs3pW73EVDU
         K8NHoFNv/QLDZzpdAS2e7RSoVGmwEu1q/r/SJVHKwg5Nv1H+puhBM/2PXBXFZbRkIvql
         /KWw==
X-Gm-Message-State: ABy/qLbJ109vnz/bjV7yhRvJ+qBP1tGYdHzUJIA94U2HMhCsGDmPKFT5
	hAQExq5f7Zq9QAPu/R023S+cQWuonzSxw4MbZio=
X-Google-Smtp-Source: APBJJlHXsSD74YLaFezk7Bbpn6vBaNo77fE487r3MoevCiAjy2gKlgCSRi8w8ivfYunycq2GKV7i1YLkwAwOGtlXY1U=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:feaa:8649:3c6a:9e94])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6902:1804:b0:d07:cb52:a3cf with
 SMTP id cf4-20020a056902180400b00d07cb52a3cfmr96059ybb.5.1690928545489; Tue,
 01 Aug 2023 15:22:25 -0700 (PDT)
Date: Tue, 01 Aug 2023 15:22:17 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJiFyWQC/x2NQQqDMBBFryKzNpBJkUivIi4ydlJn0SgzYgvi3
 Rtdvvcf/AOMVdjg2RygvIvJUipg28A0p/JmJ6/KEHx4+N6jI9m+Yuxij4EQucsUodaUqiRNZZq v/pNsY72GVTnL774YxvP8A5Si+6hyAAAA
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690928543; l=2114;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=wXfGM6+rwzEUsf/TAMmubM77ovOgqNDW45eNFnd7nUI=; b=xg1QMLVE2aNnHbUJv06d31odtnY8e9Qbg+57vMuYZRKUErkyMAJirs1yLG26IR6bgSdkUt4tJ
 qsAFQF5WDRHBt4fXyxuf5JbZDjV/Lzw4AFKfQ3fItCoC9PFd/ghrWHK
X-Mailer: b4 0.12.2
Message-ID: <20230801-bitwise-v1-1-799bec468dc4@google.com>
Subject: [PATCH] word-at-a-time: use the same return type for has_zero
 regardless of endianness
From: ndesaulniers@google.com
To: Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

Compiling big-endian targets with Clang produces the diagnostic:

fs/namei.c:2173:13: warning: use of bitwise '|' with boolean operands
[-Wbitwise-instead-of-logical]
} while (!(has_zero(a, &adata, &constants) | has_zero(b, &bdata, &constants)));
          ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                           ||
fs/namei.c:2173:13: note: cast one or both operands to int to silence
this warning

It appears that when has_zero was introduced, two definitions were
produced with different signatures (in particular different return types).

Looking at the usage in hash_name() in fs/namei.c, I suspect that
has_zero() is meant to be invoked twice per while loop iteration; using
logical-or would not update `bdata` when `a` did not have zeros. So I
think it's preferred to always return an unsigned long rather than a
bool then update the while loop in hash_name() to use a logical-or
rather than bitwise-or.

Link: https://github.com/ClangBuiltLinux/linux/issues/1832
Fixes: 36126f8f2ed8 ("word-at-a-time: make the interfaces truly generic")
Debugged-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 include/asm-generic/word-at-a-time.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/word-at-a-time.h b/include/asm-generic/word-at-a-time.h
index 20c93f08c993..95a1d214108a 100644
--- a/include/asm-generic/word-at-a-time.h
+++ b/include/asm-generic/word-at-a-time.h
@@ -38,7 +38,7 @@ static inline long find_zero(unsigned long mask)
 	return (mask >> 8) ? byte : byte + 1;
 }
 
-static inline bool has_zero(unsigned long val, unsigned long *data, const struct word_at_a_time *c)
+static inline unsigned long has_zero(unsigned long val, unsigned long *data, const struct word_at_a_time *c)
 {
 	unsigned long rhs = val | c->low_bits;
 	*data = rhs;

---
base-commit: 18b44bc5a67275641fb26f2c54ba7eef80ac5950
change-id: 20230801-bitwise-7812b11e5fb7

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>


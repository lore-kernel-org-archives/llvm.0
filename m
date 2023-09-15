Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4A01B26D
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:15:30 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68fbb10dec7so2356708b3a.3
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808930; x=1695413730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5U9yAMmxUGtlu2RTV+opnsRR/vKyQ1Eg6VpI2oRXqGs=;
        b=EA3iQ+YCpPWNy2Q4zFtkdVoxkfSkjqlp1Vk4UW0kOvNsco0no8Uj1AOvmWvh5MKq/e
         Z4/O2wUlCstB1eqyvmJYVP0Uj00Tj/9/26NgQgPzQT7fFRF/YXnQRTMmAlb9l3yTItrW
         Ca4cuUTFQ/7gOrYvccaCiSZ1kgOLhWqR87RkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808930; x=1695413730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5U9yAMmxUGtlu2RTV+opnsRR/vKyQ1Eg6VpI2oRXqGs=;
        b=o0FHQ+w9QMe9QTH0j4+A1oZ99gUUaiftfZv5TsD39mMh3gt3keay6QdbRtz/EHwVjj
         OHeghp46BF2vXvYCn+OR5ZhiXQTUzWBWSeryNKZRDAuL0iFr4Y0dfrvuZr81UJhkEmwj
         24oRSyxWmQcvv83bXRM6RBkmBjzmgTlhokXYDXT2v3cNjqB00KQgCnDLLue0/s0OiGrs
         4vF9PAv1pMdXMaKAcx7fD6Vw65aqMO7j7bGH3NyK3YNO9WKfYUlixM+SiUT0B5zjR9qc
         H30k9gSdX1fBz1ukcSox+lPpZtEdw2Z0vHh27IIbB/vNltojMcFV5PzGVgnJjWSDdtc0
         oolw==
X-Gm-Message-State: AOJu0Yw3Z/G0XyrXhxZ1NcN7uBCxfSyl15KlXUrOJiNlfcZ7nhQcN8BQ
	xIc5pmCCuMZgOfgqHxRiW6oUuw==
X-Google-Smtp-Source: AGHT+IFiEOjtKML9hAMj7s89s+YrjEI9Ics/TkDbK27NvmtLHbxAe68D4A4yHfRZWvo9JI7q0ksJ7Q==
X-Received: by 2002:a05:6a20:2583:b0:153:8754:8a7f with SMTP id k3-20020a056a20258300b0015387548a7fmr3347558pzd.4.1694808930405;
        Fri, 15 Sep 2023 13:15:30 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u4-20020a62ed04000000b0068fb9965036sm3308876pfh.109.2023.09.15.13.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:15:29 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Mark Fasheh <mark@fasheh.com>
Cc: Kees Cook <keescook@chromium.org>,
	Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	ocfs2-devel@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] ocfs2: Annotate struct ocfs2_slot_info with __counted_by
Date: Fri, 15 Sep 2023 13:15:23 -0700
Message-Id: <20230915201522.never.979-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167; i=keescook@chromium.org;
 h=from:subject:message-id; bh=vVg/lwd/xTHPf1ncyCo+ObbQAlMJgY5cAnP5s625GBY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLta7z/D+qrhNioYhLhzv1EUA9eiYGgPkff5E
 WkJ6ZVV9kOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS7WgAKCRCJcvTf3G3A
 Jm5LD/9AgxrbRwWNmusFfPJ9QxfnI7oMtHew9CbcXH9J5762zPWuOe5jVw8WhT+uByyd1i1mixz
 5el5s969WpfACTpAWuJhC/dB7M4vQwfkdYngKRmI9ur1PJ+4t2AN44FzbEL0g2b3dm2/nYJqU2B
 6Bn0Nq+cC8LlgpdU6T5vaEUHoMtls5+suDayovc5HuVQiWgA63f0jqxtvXW/eXzZ7PjtEuZrvut
 XMJyOwUDGcR86O4hFOt3lBOxZB/WNl/iYEJiAjksnRhkdshPp4fXzHQTxaHF4VgS993Y3T+1IWV
 8GlRsZ/6SOwuRU8ZyH3298IY06+Ri3SP6ZGZTdDYELWaSBKTxDG8PTveGNZKjOy+whqwYugCb4p
 xp7eLci8exro42aA49ZptpY+0KaTLA10QN78NVp9rsHmzi1dV7bX9FbkeAk+gVE2mcy+iDmc65O
 6bLjfR2vvXY8zgk250FYcXj8HrxcGjXAjw8ZWIEFRjY9IiH+F+8aGhc7QICsw/u0gUDjWZskoa2
 6ir7iarUGsxSiSF0PfeRvgLppdp0iyrKw6u1FIdu1hVbHgTwK32rVJP3eENfmy9GK+DZrEKnVOq
 wXmADnU5lgUCfc3hTRxQhalNw9D6NVB3UClIcZ3ZI3ve7LH3ObESB1Q8b/RkX/Ks9y2PWyYg2Bf
 x8VFe1R RW1mYTMA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct ocfs2_slot_info.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Mark Fasheh <mark@fasheh.com>
Cc: Joel Becker <jlbec@evilplan.org>
Cc: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: ocfs2-devel@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/ocfs2/slot_map.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ocfs2/slot_map.c b/fs/ocfs2/slot_map.c
index da7718cef735..e544c704b583 100644
--- a/fs/ocfs2/slot_map.c
+++ b/fs/ocfs2/slot_map.c
@@ -37,7 +37,7 @@ struct ocfs2_slot_info {
 	unsigned int si_blocks;
 	struct buffer_head **si_bh;
 	unsigned int si_num_slots;
-	struct ocfs2_slot si_slots[];
+	struct ocfs2_slot si_slots[] __counted_by(si_num_slots);
 };
 
 
-- 
2.34.1


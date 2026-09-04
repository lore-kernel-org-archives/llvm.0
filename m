Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16147156F45
	for <llvm@lists.linux.dev>; Fri,  4 Sep 2026 00:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788480519; cv=none; b=nnM4BhEJPnS/A1sqMaRm6cymRHmJWv9AuwGzoXToPY+vQ8BNEcXLuEPO4t1aPme+M76oe7oaRmiChY13SAcRqAK/dycdK5tDp2nIE090NXgYq52jrpSIv8yOONB8mw2p6ez0xu/274PjcscqkBx8ZgHu0BepCIV10hqYXhxAF4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788480519; c=relaxed/simple;
	bh=b0mz6z83zVCtUhJLb/Mp9OvJFzgVV9/P0wSg48iDAPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FEPrlQOSZVtcnOogQzbKFLGBV08fVPPecHBs6Yjq+BhqHPNAk0OyajlBblFnXAtsVAwHQ3hVQBKK3GVLzNWqnO0oueaC3M+BTfoRl600K1i35+IEKLHMR+TKoHxcfyF+xKymJjKKiZH+ynNQQJcC/t+/T6Wm2ZsNU0WOJHgTmOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYRcpji8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYRcpji8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cace91f112so4076935ad.0
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 17:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788480516; x=1789085316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GljiUmm1um383ek6AFMz0AxdrrGuN7oQsO/t/B0oBUA=;
        b=UYRcpji85hC78oKmaY5sPoA4VND92RVbMdlRtUIVE18k2X8IUY+gMlT6A0NBUHOVip
         MhK2ZpTqgVbESaZezDXcmBig6+T1ddSm34OfFQKoRr5UDTbxNIcaGDOlpnam8Ihdtm+3
         aVVZgsUyE+5Jxl/lp6l4zKKeZudR+UA6YRDXZ7NurI0lXPULuzs6eOrwxt8dV76EQZ3M
         l1o7m13vnpSNrbkOU9mK41D20dwHQTj9q7ouLVhtn0uynsit04vf0PkLmiMJLHz7zmoE
         DnOKzyQadTIOwmdnbvAxD96hym2eu+eMJy1UGT3eMLSG9F19uVI9mYfLr+OKGmudpFoX
         /o2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788480516; x=1789085316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GljiUmm1um383ek6AFMz0AxdrrGuN7oQsO/t/B0oBUA=;
        b=PQzF80HLsxzG1qUKn7FloMJYRgv9NTb5iQM5Lwi4tGCYKqQfVgWDjo0n023kxKqOFI
         3lQR3DCmdoeUsw6WQ4HHv7DDiZAP705+AiCbZvJw8EjhD/1jyNNInzbgYblqzckVUsv5
         KyhVYO0YB+qgoQDNAwE2J2IPr8iyzOSpjskA5vx+NV0kQeMpZrRMJ4R91/dTfi5+3nyT
         +0cOHPKiZb6ivfXOPYOO6v3ZDjFdjSwfiUbwe4VOFHftneC2JXJS+1q9Zk3vWWDuhiOI
         m4HoVXQBgzV0GqBFzv0RUxixC3wtj6++URFquO4oDhzmvpqiUG9FqGEYpipYzLY9R0AX
         0K1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxfo5R+ZgRpQEvSaDZfm0pcpLkl8h3o4eYvCSYqEbKvBn76UEIGL/xOqCudlVLDXDUNZO1v@lists.linux.dev
X-Gm-Message-State: AFuF++mOZeTw1DqCynnGsgZyuK3x7QSMKyl2ie1AalLxssBWyVVNAvbf
	e0gBiMKU4dTitSszcD6+At2oImCBa59cV2Ptaf9xTU8W1B+Xiw0fwcWf
X-Gm-Gg: AYBFou1QhnQ8skwzY/iQYkx+AKtNEbgEF89U9bKoZnmy8yEZ2+HWkSC11R6/bt2onqn
	UbO00R25RlNtbJajmv4cANp71mcFAJ7WrP5QLFfRVibwMGJma46z9p1M8w19jyfVTDKe1KSZ8sG
	HH5Bv/SWHFJuCDMwvKxeTsFuMcOwHSblQnjBj4qWMKp0b6uG5U7+tbVpzmy02F1pj6dO2OIsy1F
	2dBS3CsTAeb9CyG41vll2AB4ewoVCtlt9nd3QqIl3wrI6J8WCDV2RN/SfUk4qjagpsM+iSMPjNw
	/+3yJb1YDaT5mINkla7JvcvyzCtzTpzEWvdoRphBnEXvgCBBUJ3eyH5dNyYY5aVWbM5zGE9gfHV
	xlFHrXV6cxypKoKnOW7vI0l9AWDd3zN8dNVTMTc8n8XXTGymEhTcHCCkeZMIxxHp8ogwuPF3m95
	xT7nPfRu0FRP9VlxjydRa7SIGvEkQ3Ri/hVBqRhtk4K5UdLudQBoTyhAmGAmDPoROL6038d8mUg
	rX3soGoP1gG2Voik4tJ3VIujfyaRlz0RzlruG2TFV1N6pEZl//ACzzk1Djqc+mfx5FAB5/t29iQ
	8/fnj0LC6yOZpV9Vw/rhkD9F64XjIG6LJ8Gt8QrX5/8LFkfWUg==
X-Received: by 2002:a17:90b:1dc3:b0:398:d6f4:c61a with SMTP id 98e67ed59e1d1-39b26207ee4mr3446839a91.17.1788480516137;
        Thu, 03 Sep 2026 17:08:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8f1448esm4136507a91.4.2026.09.03.17.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 17:08:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] x86: checksum_32: allow memory/immediate operands in csum_ipv6_magic
Date: Thu,  3 Sep 2026 17:08:33 -0700
Message-ID: <20260904000833.2058186-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building nf_synproxy_core.c for i386 with LLVM/Clang fails with
"inline assembly requires more registers than available". The
csum_ipv6_magic() inline asm demands five registers at once: an
early-clobber output for sum plus four "r" inputs (saddr, daddr,
htonl(len), htonl(proto)). i386 only has six GPRs, so under register
pressure at inlined call sites Clang cannot satisfy the constraints.

Relax the register-only "r" constraints on the len and proto operands
to "g" (register, memory, or immediate). Since the asm uses adcl,
which accepts memory and immediate sources for these operands, the
generated checksum is unchanged; the compiler can now fold the constants
to immediates/memory and only three hard registers are needed.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/x86/include/asm/checksum_32.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/checksum_32.h b/arch/x86/include/asm/checksum_32.h
index 17da95387997..f74873a5e351 100644
--- a/arch/x86/include/asm/checksum_32.h
+++ b/arch/x86/include/asm/checksum_32.h
@@ -159,7 +159,7 @@ static inline __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 	    "adcl $0, %0	;\n"
 	    : "=&r" (sum)
 	    : "r" (saddr), "r" (daddr),
-	      "r" (htonl(len)), "r" (htonl(proto)), "0" (sum)
+	      "g" (htonl(len)), "g" (htonl(proto)), "0" (sum)
 	    : "memory");
 
 	return csum_fold(sum);
-- 
2.55.0


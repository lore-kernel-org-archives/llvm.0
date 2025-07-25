Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157452BAF4
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 01:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753406138; cv=none; b=WMOQaS7ccOe/YClPtmXis/AxwVPdEXJQsTnAJYROsnAoZ3kaj/UN6IugpxZhxWjGuMOJgPh812pZKmQc/SnQeD7ISrtvHbOjoazqG82V1phjMdG4d+Tl/lxdvE4INwnCVRMHP7pLVLVxz+TrhgsFgTYXvZtchCUudqqpZ7MfEec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753406138; c=relaxed/simple;
	bh=9d2LgkAsER9qXvaUPfEoLgpaLUIRkRofct2D4FWudKI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZxykvxHRqsk0KR4KPx2WhEXGbYdqW24OH2dpZ0UVoXLGJaN/nDtELKoWT/adXw8e/15v8HdARakjMwXGJ/Yeg29fdjRmwXft1B/ieppZ+G19OdwP2jQqhfiNuomayPgXsu1fkSFJPWqgDCcA/Gta0YFlNJqeDNCwNDG/uYsAT48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ar8QyDYK; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ar8QyDYK"
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-86d1218df67so169602539f.1
        for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 18:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753406135; x=1754010935; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tFITuuJDgutpEFJlerPyHHpSB0sfh/jbjTlG3FOcAgo=;
        b=ar8QyDYKzInJBt2HcFAEsJ2wA1BUw0AgxsJ1wxxBnOrQsg/3Y479sBKqrNmz0aObcw
         aRoIhS1ze+ERmHuGGm8PMtOSzk5Tu6isYlP5Gk15nycUOnPMt0Ok74EEWkKodMwEj63c
         oPEITAwrc5gZXuFYbF0Vl00A8CpkG+85J2pM+VFe3totoOMU++KwfQ1kC8SocLUMsnhf
         Dj99eZSSL/Siz6KwgvaSRpe3oCCXiMAxOD2/qur7ouwPeDnOOYuy9nwwbAhocooa4K0m
         R3pS7c5ZyPpN8lyaM1KrhLiciQ+RQgGz8cLsJjBW4KSM+hKNS0XcIYpRS2gTiEGlDta8
         VCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753406135; x=1754010935;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tFITuuJDgutpEFJlerPyHHpSB0sfh/jbjTlG3FOcAgo=;
        b=SoujnxHprFkeusskyab3kvjPchOLzmek0xx4+W8lQAypd5wV/92vfZvxYY+I62PTHB
         rnxpYbGw5OC0xs4T5HK9A/4Oolsnc3p0cGuftNS8cIkSrmypKij9oTfTsn2ytyp7H6GF
         kUXVKVx0KcG8JJwLjXM6c4/qi8hQPbzQYOAhDKd4RMKkQIx3+Vby3KaXzl1OA4JMgfzm
         Zq1x5Gg2HK1sdUC+oCSntTyCMo1gHDlbHEgIiCk7sxGB2hQRbF+gg+9hZvy5H2Y3nxMl
         4V5MH63Oj8F7Ta6E+Ez9XAoAzw6rcwE1uREeXY82X8Qhzdj0UQehm20ipwER5L91Mcr3
         xxsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXisRjPLt8TYr52WGrH8DC0jOTMfNzrBwDTYNpqRCWd7K/RZ/qz2WtuG3q/vTFPQetd8rMw@lists.linux.dev
X-Gm-Message-State: AOJu0Yxjl0cRkbauBZv2RHfcHkK3Iuttd649EtqJNRgII+LSLUropeqP
	UMJpX+NnZkQ2UVi8wF11CgUNR8lw39oSHAa/8pkbsrkGprzzfr2A5HRwi/JGIYeRVMATa/BIs7n
	gzPW7G/hmgJsOYeFnBzdBItnQeQ==
X-Google-Smtp-Source: AGHT+IGOtyjrWZUt4IHge1YVAFkDgbRkTc1qBa9LhfCId/pQ3L7S/vw2KQQqW8B0agIZPE8gkRvP90/rdal04fwoGg==
X-Received: from ior10.prod.google.com ([2002:a05:6602:a00a:b0:87c:359d:819])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:1689:b0:867:6680:cfd with SMTP id ca18e2360f4ac-87c64f87d98mr1663521139f.1.1753406135096;
 Thu, 24 Jul 2025 18:15:35 -0700 (PDT)
Date: Thu, 24 Jul 2025 18:15:28 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK/agmgC/x3MTQqEMAxA4atI1gY69Q/nKjIL20YNSJS0DoJ4d
 4vLb/HeBZGUKcK3uEDpz5E3yfiUBfhllJmQQzZYYxvT2RpdjX7loHgIS0K/SUy4J8WOgutb43z lAuR8V5r4fNfD774fh1uFv2oAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753406133; l=1391;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=9d2LgkAsER9qXvaUPfEoLgpaLUIRkRofct2D4FWudKI=; b=Az97+z18RNg38lLclau+LqNY25wUxs7AH7etlMkLkQAjtx4UrkJ/fucCvYO1m1JtsrhW59gi2
 O2QmudrpqmkA3awdm9rNP+my9CyxHVn9/w9CtSU5eSYTY9DSciiwM0N
X-Mailer: b4 0.12.3
Message-ID: <20250724-b4-clidr-unint-const-ptr-v1-1-67c4d620b6b6@google.com>
Subject: [PATCH 6.1.y] KVM: arm64: silence -Wuninitialized-const-pointer warning
From: Justin Stitt <justinstitt@google.com>
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Christopher Covington <cov@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, stable@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

A new warning in Clang 22 [1] complains that @clidr passed to
get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
doesn't really care since it casts away the const-ness anyways.

Silence the warning by initializing the struct.

This patch won't apply to anything past v6.1 as this code section was
reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache configuration").

Cc: stable@vger.kernel.org
Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 arch/arm64/kvm/sys_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index f4a7c5abcbca..d7ebd7387221 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2948,7 +2948,7 @@ int kvm_sys_reg_table_init(void)
 {
 	bool valid = true;
 	unsigned int i;
-	struct sys_reg_desc clidr;
+	struct sys_reg_desc clidr = {0};
 
 	/* Make sure tables are unique and in order. */
 	valid &= check_sysreg_table(sys_reg_descs, ARRAY_SIZE(sys_reg_descs), false);

---
base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
change-id: 20250724-b4-clidr-unint-const-ptr-7edb960bc3bd

Best regards,
--
Justin Stitt <justinstitt@google.com>


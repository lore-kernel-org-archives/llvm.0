Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3C535A395
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 11:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201245; cv=none; b=OqY6RQY0ScPww313jHdwujFvgWp0asL0TMIX1MpdqFrn9O+1VCDRQboMSqsH7k7T907gRaPKrd6akp//A1VNw1u2ylrG0fvGMr0sR/VRyLSrZQRAoxCo1CvRnXkpcXdDqtl3LVAZTffwQXQ5rireheKvigl+BI3n2oONEcXhp8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201245; c=relaxed/simple;
	bh=r1aKh5I901VyW1MTDbYbzZkzaliwYbiMtV4wPKGZXxM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TH1GiIdzlwCbk0B0KOhjJZ1Lx8OYiTYNx5i18XQbajplM0iSTrGGsvrHrlsSDe8eZkBI/GV2MoNl1yElM/f0nefDC9Mc+mmVbUAplwC9zJGwlS3aw88AVZivRQ+Ff8ctM0RmM/4/U2u3MD0neJY2HVH1Q1W2AgcBjbteqWshBdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUb+6keX; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUb+6keX"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b24fdac394so89998575ad.3
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 04:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777201242; x=1777806042; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKjAi9HbHD3A8vBvpsVmPpMZEiOAHaxheYu3agjVGmU=;
        b=rUb+6keXbCLVYYGDOgFThl8io0g2/GfIN9cYn7IOfNS/8KFoROURBmll1QkNORFTXQ
         85JV3sSYfcda3FumW2Hf8bIZX+IwBoLhB6RC4vhJCPfQ5zcOHxOhBIml64K7IxvvBF7Y
         SLsfG0//5VKqDMI2jlgZaD/Fqt/VSc6EJBLFjsaPzgXAFLKmYKg0pcfFBRX2h1NgJzep
         cqB2Lm0V1tsPIArdvwX7hZTyMORhUWz0s8gP9QrWBgT+8uvwCNQQOdkIpfyMfLWoZdzX
         12cWMeEG/DzirQbGIl06IOGp37ao87YhfyrJr/LffEkKIwjoLxsITr+uHW0z7zhg0mr7
         LrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777201242; x=1777806042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xKjAi9HbHD3A8vBvpsVmPpMZEiOAHaxheYu3agjVGmU=;
        b=kqq6EPH9vHrhqAeEYjEmnnd+fDkRfsNPLkmRRHQDWtWrHJF/Z6wiPS+Y32Dp9AssUt
         HpZpvem2/5c7AqE60ZENEyD//aoK6j+Ld2SD/MGXU7gDTJQdTn1er73eUbRYBQVbsYFu
         JzyN5SFHTNJ1PApk8nx7+LuRiXX3LV5zlagi2KbKyS+lx68YlXrIr5WNJxLKDELl9ubw
         xUWVSpgH8BiPJKGeSwUFXvEMCUe7oHpdaxvw2in8k6OV2f+dv9gZxMk3UMM+yTDd8wBN
         X/wKD9Zx/3G+lx3JEaGiEC74kyqs1sAA6BToe37YSIC9wF0kiKU6AXpYkB8V+hicgtW3
         4Mow==
X-Forwarded-Encrypted: i=1; AFNElJ/QDsL4AShghfwQJyFeGR8t3kiThnh4sRUtRcLZ4E6UAekAYOes3v++yAjaDJgxhVtgpxfv@lists.linux.dev
X-Gm-Message-State: AOJu0YyiVk7bK2c6r+0cJHRCCiP0E2VLAXfzyjoJVPOhKk2WZ8wjfDD8
	JIz5TDD9I8y8LXw6mEvj/Fc1We7shjij3ykwegXhjJiNDazPGew7I8Bf
X-Gm-Gg: AeBDiescAi6iQDqmny8JFWqtjuJFMkAPgwXYyL1jsS6+fwbSRH+ducFZZsaOU+hg7Eu
	VOEG5rAkTrMUYfig6YOXqDJPcqufBokaU+x5KcAMt05LZATblcEa8uURoIanbxgN3P2Q4kfqDj/
	6RpQh4Nam8H6vB1jhhgX45ffKHxQD6cNgLdg8a6XwNMIBcphlBnwPcn48S0Yaw8WWSrZUQjcFCg
	6WSv+ShREKGbrcI42USwc+dcRjbjp+BIvG3jz6pDySR6vnGfZNqKUsecP8LF2EsBy3ShkD9gnJq
	C2WSSJ87jdMeF1dkelD2j6cAalBVg4Oaz6P9SA3s0EHF5mCnI5N01+3PFjgw+DAyAuWXJQkV+Tv
	QTqBiRYJmAIKwzyYDUgtZaHBgJs6+AuSX1S1IiYewzvd/AKbJ7Dqq8J0d8vyQot42bSttdT36id
	Q3UGQF2/x6Up6p3DhYg+itbqznWUSNf/qYRnpSp5upv/TWZ8OOZNI8RNRXYgqJ64BPcfZ1jlBMw
	p+Gm/AOG7WNA0s=
X-Received: by 2002:a17:903:32c9:b0:2b0:5923:5194 with SMTP id d9443c01a7336-2b5f9fa70e1mr403887325ad.27.1777201241796;
        Sun, 26 Apr 2026 04:00:41 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2f129sm256667235ad.29.2026.04.26.04.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:00:41 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	daniel.almeida@collabora.com,
	fujita.tomonori@gmail.com,
	viresh.kumar@linaro.org,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	tamird@kernel.org,
	mark.rutland@arm.com,
	mkchauras@gmail.com,
	lyude@redhat.com,
	lina+kernel@asahilina.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V15 4/7] rust/powerpc: Set min rustc version for powerpc
Date: Sun, 26 Apr 2026 16:29:29 +0530
Message-ID: <20260426105932.2270364-5-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426105932.2270364-1-mkchauras@gmail.com>
References: <20260426105932.2270364-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minimum `rustc` version required for powerpc is 1.95 as some critical
features required for compiling rust code for kernel are not there.

For example Stable inline asm support which got merged in 1.95.

Link: https://github.com/rust-lang/rust/pull/147996
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 scripts/min-tool-version.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index b96ec2d379b6..406895621511 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -31,7 +31,11 @@ llvm)
 	fi
 	;;
 rustc)
-	echo 1.85.0
+	if [ "$ARCH" = powerpc ]; then
+		echo 1.95.0
+	else
+		echo 1.85.0
+	fi
 	;;
 bindgen)
 	echo 0.71.1
-- 
2.53.0


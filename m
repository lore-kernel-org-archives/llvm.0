Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85EE33F580
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 05:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009722; cv=none; b=ixIOcBTr3JP4zYR3sY6CbK2GoRivdIvlmDUM0iKSghMlPWhkiPV4amsqdQeiHuzMgKewXjtaS6uHsQZI3OQkRZig8cHV8ilhKHASNm9ffzcGXjvg44TXlE9cZYQTEvFEec4pbwLlxpAb8tdV3ZxCcILYEGpLbzsAFdiVEalcCj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009722; c=relaxed/simple;
	bh=g4L7C9uN0rpytwf/MlwodVI8K8mAxgIk4T8HtuH8eBk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6ca1G+FtAr3+0A1BSsoCu1hlRj1bwZmoK1ekG5yhbUBPPVh8tGWCaEhwfS3tEIBzfDY2kUZA4nGChaEEYTxuLk3UIyIjx2mvD2vDLCxUAt5ctXIJWqbhqB3aPmayHlfumfM2WVpj637Fta7O4dmvZVjtcodcyk9b2g1NJOuFcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lONwmHt+; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lONwmHt+"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c741692db4cso2289726a12.1
        for <llvm@lists.linux.dev>; Thu, 23 Apr 2026 22:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009721; x=1777614521; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUmefGJqV+IRkFPz6sSuv3GYeINth0c7dueYg2gp07o=;
        b=lONwmHt+SY3QCoDimWoYTvyxNeF9jbBya7oz+7qME7mpA4XOJWNydhURkSwv8090eq
         AMdd2axM2hwa+9yqzWTQmeV+EysBHGH6ZkV+LXdYBAVRl/c7FJSSZv9DRG+v04muiTdb
         Px3Aw6PmLsw2rE/2svmKZAiV4hwEAO2JxRgoyLCPcr1zl/D0OIoE/8OPtXKbIcTydMjl
         AhIZs8UxtF+5S/AXnMWItWV+xGEymsKwr4fM+sDYYkfUzbwzv8eCFS26q3xnphgbrhJP
         p2Gkqwrb+njmA7xPdOJ79YKZh9jNCC2na6skxiyaiHSlauKU4Y5b06MZnh2tTaZgBHU0
         JXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009721; x=1777614521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uUmefGJqV+IRkFPz6sSuv3GYeINth0c7dueYg2gp07o=;
        b=OcFXpXhsFYO5Hjr5gfvE+hrRan16DMn/yO689iGBWEL7Ztk91UGWZUMDT7frfV58NM
         DXpsoXTXahKWF1+8F4BLC2UCZBv/T8PoVN4FG6NwTt7iMkbEL0pY1iCrAV22PLa07mhq
         aNhBQu32uNOxM1UHXaC6rnjzsorQ/k0c/dpp9TgrVoZh8U6decDq/MK9Kmm+Lp11gEye
         NbjUONlA/NkNiE8y2W47ALkYgXrUd83WZ73dyIGnPvzi5b6RQ27uhTjD738JDhPVQhom
         y7HwmLnNagd8PECoRyTOZLN2zsjRa8xLNm1dGw8jU/n5XchfcL1U8AJuB7AOpWJLOMNs
         cKhw==
X-Forwarded-Encrypted: i=1; AFNElJ+teFC/UjnevQUsFB+QAtSJLARnhiL8IzdFvuGtV9Iv2s/R0vJS0R5FXft8Ui62D9+leYfb@lists.linux.dev
X-Gm-Message-State: AOJu0YyoQsM/3FKGcw+y0u5LsYicL1WqMCyxR0EVJm9hOl4yp/X+L1zP
	OWs3DsSzO9+r6R5z/9BGPmun8Puf9icrutn8Yb2cU6EJu/i1OYXZv52G
X-Gm-Gg: AeBDiesk70XR2V+BC8Ix3ZO0KfLmSj2ozy65NSfs2FMsFybSZbQ/WODUM4h45uCZdzA
	s7wvVWHLqtDMZrhjssTivpBei9tyQgVUkriyyKYl9Z7hiCV+brpy6Csa7jNpp+CHZgJj8je/4Ed
	hsYlfuT3xCFGyPLdYRXYSTMf6ZQT4tXhsLPdj3gIpTeuGnvXyyMhuoRXDbkOWtBcpRreC9nO7UA
	ixMwErW6QfRsOPs0O0iQ4wxEIY6Rkss9fV2suSLWr3PDeEtiF47Egqgb6vgL4ikfftlhWesCn8D
	YpNr9S8dJF3CHwDWVaoUIQkJL1BI3dNla11FFWGkAQcz2PrMg+AGbuHJbihNgZqCGiF4Dpwm8a3
	d8AZDHugZGurU+SQFiPjrNLvGBmYkT++SYqvLUmmbU6d7mEff8FfO+ABgudYNo6Tqoxws9lY32y
	MEa1vq4q5VfAT2gRS9CDg2nnGCXu1jvEqYoVQwEgXhiVBmoMnI4dweY8CAxVvix7rsg4bF326SO
	XGITxHhnudbe5A=
X-Received: by 2002:a17:902:b195:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2b5f9eb272fmr183181305ad.20.1777009720961;
        Thu, 23 Apr 2026 22:48:40 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:48:40 -0700 (PDT)
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
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
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
	tamird@kernel.org,
	arnd@arndb.de,
	nsc@kernel.org,
	mkchauras@gmail.com,
	simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V13 4/7] rust/powerpc: Set min rustc version for powerpc
Date: Fri, 24 Apr 2026 11:17:39 +0530
Message-ID: <20260424054742.45832-5-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424054742.45832-1-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minimum `rustc` version required for powerpc is 1.95 as some critical
features required for compiling rust code for kernel is not there.

For e.g. Stable inline asm support which got merged in 1.95.

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


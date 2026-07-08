Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04D6402BA9
	for <llvm@lists.linux.dev>; Wed,  8 Jul 2026 08:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499167; cv=none; b=cBQ/pfKxPlLER687+0geZoVh85PWDloc9aDIe6wszxf8MgQczJ5KuTh2HxFB1VjRwNglgtr9KfOWtcG6qXx5BQUyWXCYHAoMkJ1gjhqN7Ws/c1oo85tdMN+ATTUp3Xz/JpwrHO8rxt4eP/xxM2MqEmkVFbwUy8kpv2I0r5EymtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499167; c=relaxed/simple;
	bh=DslXIw+GRv1wOiIX1SNqLhsBYlKXgQRISJI63XytIB4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NdK/Scmls6GAb6qTWXF6TeHUixi+sq4OsKxePHbbllRunAZGuaryCUBk57JMgFzoLsufcU6rfQL/S2BDqBDVvbh1mzrgX/VArLbvKRZbAHzmpXIEQpgKzWfhf13TQZNp9RCwPLRjFRmIMrLuT8r4dCl1wbAYxH5/opF19gpVED0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7QV5b2e; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7QV5b2e"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-381507c9380so315982a91.0
        for <llvm@lists.linux.dev>; Wed, 08 Jul 2026 01:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783499161; x=1784103961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N7/TgPupofOaFBPAX2pw0tL7gzCEKb6TKZTW3jPqY/0=;
        b=a7QV5b2ecJiNAPsAO7AX4hxkfExZcOfcvQpsoa3uNloWCfCiP2VvgbicwiZDymTVrI
         1wAQFq8nnXAkgzIUKKI0IjSvfoAxNNdSq8plUD11m2kxfHi04Lj02YNyUwkTBINBsZSs
         p8ldJRImMUVGC8z80utFton+S6sgRk/BE5/7P4FSCrCnkxBuCSpFpf0dbhG6h8VXOo8O
         67E3dAeD+qWU4TvxYQ9fJgQ0P3jgQMeR5eWZK2zL4uOIryQBC4VyqESTt5+GCSAvO4c9
         re29/M1ykaFVMaqZDvxdfptRTM2A+2JC9K2rPCxW4hn2XvgQsyHU0bjgeRvln+ied6Bs
         /47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499161; x=1784103961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=N7/TgPupofOaFBPAX2pw0tL7gzCEKb6TKZTW3jPqY/0=;
        b=FzMEpZhZIuXCuSEeHzT4RQDYjjW/1h+7am9EzdUlAPoHOoB7L/dCbe1m6//61hW75i
         G5SPpfw3Rbt6d24V4zkkD1DQ9XGEWsYdYvRc5fIKSJa2/18tngargzmZvEPDfkVJ8xre
         TXLW4VeDh9HFTeYT9gyiC+80H6FMBAYdaA1QKoNM9ISVhTcRdjOfRdPFn+PdkeV4Y9WL
         H3OV394Sjk7qJFc7nNozq3B42vLB3v50QN9zBDrdXA57KgrdnuSThWCSU/KtjrmY3cqw
         A6O5l4/iF5h8b5umyEVlwebykKkHniZExFHtw1qmFWUztI/JtwdIlcLPb80cVebfQRZw
         qigw==
X-Forwarded-Encrypted: i=1; AHgh+RpmOqRLbt6EmBFQ1/gOHbu5H72hLqjgeZ5tZLVpwBRlZZVDcou+v8e9H6JBTSDpEiO0jOxn@lists.linux.dev
X-Gm-Message-State: AOJu0YwHtf+GF+cXdoobu5sLtpB246JFMGM0UZrhE6CtW0w1av8v/zMT
	VCbUWV9CynfIbztJcZIy+g7NSulbptF6ZA/Irlkx2mFc3OxhipL7eJwM
X-Gm-Gg: AfdE7cm9hDblZLCY0F7fp46BUWPNHnulLKn7mqgDKn9ctrmJ7Pft4E/UXr3D2u5bLVw
	CydsZsPgPUfI7PxRpYKUK+mCvWaVKILWslzZ2D2FiiOlmvA36aAx2MV6GI5EKa+TuIM1QUWaSC6
	6cXir8MS8upO9xpQwINJ6CMjri08pdj6bE360ELWUF2xFFaPM+v+TawuSw3NvbMay0VOsyl0Pm2
	GYv4FNWj6+NyES479j6x5IB/iram4eGUDA+4G+xjJ7ykt34ZUNbxiEEH5i7dIrvu+vDVSUUu+1e
	yOMk8fZRS5wBKpkTrlED0aSkCA/Lm670kcsn1HKQEWq08s/TBH1qfRTic8XkNf2aQ9SE3iSz4TR
	qLZhOcdnFvjCqVG37pi17baAONtUxdUs7Guwu4So2wfS4m9b00uCRpwQc6BKfafIuvjYzNyMsZL
	UAOXofw43ZTX+8z5xTb3TyHXqPsmXybtRBrS15umuzqBFh/2Fqq+CZjHlXVdybwHPr5g==
X-Received: by 2002:a17:90b:2d89:b0:387:e0db:bc23 with SMTP id 98e67ed59e1d1-389420ad00emr1735318a91.35.1783499161101;
        Wed, 08 Jul 2026 01:26:01 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm19975117eec.0.2026.07.08.01.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:26:00 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	nsc@kernel.org,
	japo@linux.ibm.com,
	mkchauras@gmail.com,
	lina+kernel@asahilina.net,
	j@jannau.net,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V17 4/7] rust/powerpc: Set min rustc version for powerpc
Date: Wed,  8 Jul 2026 13:54:51 +0530
Message-ID: <20260708082454.1254320-5-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708082454.1254320-1-mkchauras@gmail.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
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
 scripts/min-tool-version.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index 031f2192b390..99bfdcaa3396 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -33,6 +33,8 @@ llvm)
 rustc)
 	if [ "$SRCARCH" = "s390" ]; then
 		echo 1.96.0
+	elif [ "$ARCH" = powerpc ]; then
+		echo 1.95.0
 	else
 		echo 1.85.0
 	fi
-- 
2.55.0


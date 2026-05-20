Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF0433F5B5
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 06:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259659; cv=none; b=EeIIzk4P8+8rzn1quGDXidUWaFG8ZmfkjQFg60YZQNbirqu6lPL8z91P8eGdllV2nNnLLE4j8ie0VJdjhIMaWUwoMhc5A63W32FTAWvNdDF6zJC//7GfBRz6ffJQlcIpVSsH5ATZZlDoBQLUl1CEfN1qmfuKbw0VM40gnDeZ+pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259659; c=relaxed/simple;
	bh=IE7Rc7fvs9GPBV/ek1LPWWvDTbBnI90elNYNDzaduxA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jtLPrEyv8uVk3l87vyqSASfC26Z/9KV3qIviDM9BkN4Z+AKk3WxWS/l3K76bn6PH3yemEHaXUFbPL2f8EdYNLhC/B2uQT7fIfd88AZL/OfiGXPGTugZ90EywTu409CS9HRUzzDH1aKlTm31m2YDSClhKZeHmhFw3Qx6aDspMZQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E48CdxOl; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E48CdxOl"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so2810378a91.1
        for <llvm@lists.linux.dev>; Tue, 19 May 2026 23:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779259658; x=1779864458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAXxYbsc5I9eqWTeSv6j9oBSm3zo+5SB8Z+tNOyX718=;
        b=E48CdxOlTJnu98Ob0Ra+ZA4sxqZjWm/Fd4YM8hesuQ+gqIBH+mBjjuWfR45l0Moa5C
         f8xTiiG/2viRF3wWWVuzS9wLR08zRKBCOcWefGocAHXwFQyFQ8i02lgNT+hTkHsr4tGC
         HHXzT25BLsafQcEK8f84F4VDr58D8H/jB8vJ5fZuBLq4oNNb8xZ0KvIM0j668ihRRo+a
         HYmNAGdM86c5R0GyA6UG2h2yQLj3vACciq+wFwhxYgyu2OTF5S6ZIcwcHebyNfUyNv6k
         i/h/bm02rtIbLTZxbtRXDLDqNY/TPMVN2rTYEO1NLqUKH9iHXo8yPrrXFDfI5y2bHIZF
         8cBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259658; x=1779864458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yAXxYbsc5I9eqWTeSv6j9oBSm3zo+5SB8Z+tNOyX718=;
        b=tCb9TkGBxbGGFSPKocK5w1uOwVGjvo77hYVZAnVdBXhr2r91OqS7kjMbNURoeS45H1
         eR1x85HoZO63UszFYzroDhrplbLOOKaItVqC/4H9mP2OUDkrZD305fboOvm+IGNY7tJ2
         hm1+1Jl8U0cbh5EYi26ljElyS89OFHsXUviwTkmNKGEztJF8m120yfcBmSe/sxfU4jQd
         dNn7r2TTf4tWF78qBWXtNltbVhNmZuXSFFbAynEIXH0BrVd/DQqtxSb8aQGFo9BTldQn
         kohWjAlSxRXM9Uf7dxSC3NKEHZBeNkFBM9omCIk5NsY53NHqSHdgGiWopLRoFuHCZBjZ
         1zEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+QUs85yBhw2sMQJ/YjmTBQgPzrYpL4CUcLqoNDJpCaBfiqKap76HXNpLNqNRnMXpjdYzX@lists.linux.dev
X-Gm-Message-State: AOJu0YzOPpenhav7r2nSnOnk5GVVai5lHu8CQQqLS7AU7nt+Aulx1ZzX
	/7SLfqWbmDh3tpTbMJRMltaVc0d2iw60DKYvdaua/BEbfRYgHD5SoXbu
X-Gm-Gg: Acq92OE3ZiMF5xlVZHV0LLnhpeuDWPjIR/1noOEIZKHy/dghpQeUCNQCsFU+/00rCE8
	nm/8mDFbyS3yn8kN8+Zbu0Ua/pSHBmJU/CNgUQmHwqk7Bf1IWZX1X/A87Jbnca+21ybyPte5BrS
	eFxcTqH+sHZ2uX6GIzgVB7RNboiovBagAoq/3ZRtvH9VTxiVEpLgWJpUyYyWr247WRBaGc6SVuK
	pQfCGR3RYa6D+iRSK9SE3B3LsB4nrh4ROuoiyxGa4OWK/mtjOr+hvipL1gBvD9+cetvZIy5gicq
	ZxAHkNH6USbcyMnaNt57U5KI2KNP91MnMtw4l2ls4NwLmCdAdl3pUooKcihgYTiDj6paN7+0Ipx
	NH/WU9CQKHQnYFc0gxPOi20mygRizOs7zovyMr81mNhM7Ztt9kljn/2pe5zl07i/rJc9QxwQ2Ma
	ZsjpeXc83dbKZVNFgzfGnphiXVrcGUku63hAPZ9MiMFo9o85BufyhFkDcfxlzgtXhItUlLNyaKo
	QOpoEB9GPNOFUU=
X-Received: by 2002:a17:90b:5688:b0:369:a9e8:dbf5 with SMTP id 98e67ed59e1d1-369a9e8dc51mr13102353a91.3.1779259658100;
        Tue, 19 May 2026 23:47:38 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695a0e93e0sm6069970a91.10.2026.05.19.23.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:47:37 -0700 (PDT)
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
	acourbot@nvidia.com,
	fujita.tomonori@gmail.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	tamird@kernel.org,
	kees@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
Date: Wed, 20 May 2026 12:16:26 +0530
Message-ID: <20260520064630.1785283-5-mkchauras@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520064630.1785283-1-mkchauras@gmail.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
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
2.54.0


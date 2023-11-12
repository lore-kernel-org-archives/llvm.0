Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78D91A287
	for <llvm@lists.linux.dev>; Sun, 12 Nov 2023 21:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="17FEsz8i"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-32d895584f1so2314936f8f.1
        for <llvm@lists.linux.dev>; Sun, 12 Nov 2023 13:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699825801; x=1700430601; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x4DJgysSwlmaILN3qWQle+EbdCbxMlt/vSR3NUIE38Q=;
        b=17FEsz8iw/p3nnUhh348xuSHoOfJs0v6NkqyBJBweypoNEg9NdvvdYC+bbawgIZz4U
         NNt7KtvzYNceHHYDC0YfCrC0BLKDTalaaK5IJ4TNTF8Es3dHWzvxp1QYcr0oYNz43D63
         0qbthiEq4qdafzgGQgd1Dv7WvmGvHbL0Gf8e+Wgvi17m+Q47imNd5jwG8JnYBDokPYBa
         ctuR2oDAafcHz9jBeeSpcIKrkO+gSiBNSBaaIRpSHk+IqaBxRJDRwwn6Yf3w6bfI52sB
         83xFxgDK8sXb6MAnwy1sm0S0tLtxiEbzbAy+zbqLRru0d8CcmJalh6xFMQ3XcpUu403N
         OBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699825801; x=1700430601;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x4DJgysSwlmaILN3qWQle+EbdCbxMlt/vSR3NUIE38Q=;
        b=S/oam9FHxyb00nYvRI9KOecKcV29Lf8lbYEhl3gLJpsklJFrvJbplW3+ESGcGlWFFE
         Xkx/pNHUEeWIg4EeHmSHMTZM6fP12LQeEBdBNtJfF1oCQhl0lkG8JthinHIg9gXksRW6
         /WMHDsOgjdMoaAdAXkoaOeKyBiI7Qjtekr5jCEenRGKbP9C/zac9v/PGBOrbWWxRyDX1
         X6Y0ibrKuTzgusTmB1/KngBO3O6AmSsNIIIrVxSqEqkCL5bfTiVTj1Kl/FzOw/+5ddk2
         knKINJAuKv5BuTh+T2LvgDSsZNVMSiK9enhSdWlYgka+lmG7wjOtRk2i/MTGTdMLDqSW
         H/eA==
X-Gm-Message-State: AOJu0YyoQUR6UeP+V/C5XKXyjtyqHcANUC+EDetv23KK1HbuzNiBEz44
	+dkgCuB/bTFUeEE9JFWvkBW4u2e21fg33slYNTyXnLRXmkgyGQNhjjQUi6Vx
X-Google-Smtp-Source: AGHT+IGiM1zWE17fE25y9lpImdpGfAacloHV5xpkDbcgzNb6dRtCn0ca2KxpGFgj6Qv1rVj64z6cxSFKCiBRoCXWDCU=
X-Received: by 2002:a5d:648f:0:b0:32d:967d:1baf with SMTP id
 o15-20020a5d648f000000b0032d967d1bafmr3739183wri.1.1699825800664; Sun, 12 Nov
 2023 13:50:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Sun, 12 Nov 2023 16:49:48 -0500
Message-ID: <CAKwvOdmvAcnjmTiAoeUFF0yDU=Pf5jRYRwxDU=5x2-Fhocbpxg@mail.gmail.com>
Subject: removing github group priveledges
To: clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hello,
As https://github.com/orgs/ClangBuiltLinux/people has grown, it no
longer makes sense to have so many admins.

I'll be converting less active members to admins.  Please speak up if
you have a good reason why you need to remain an admin.
-- 
Thanks,
~Nick Desaulniers

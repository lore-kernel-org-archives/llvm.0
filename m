Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9AF281525
	for <llvm@lists.linux.dev>; Sat,  7 Mar 2026 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772894540; cv=none; b=rsRkXRRQxMovIDGmRdJZ4w3aI/9bIRTKLT5+nlj5QuJEApfRoyNSmK/YVAv5k8xM2wWjAqLIVD+eTa+aWoKOERoRipjAFx+iPWaR7vRXUc4K1xMyCefndVDAVwMKwpyf7swFClIZljit6eI8NCpowMxMcsKD7BSTkfpqN5LeJcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772894540; c=relaxed/simple;
	bh=56OBOkIzjy/uxwrBUlE3/GyAxtadOAWIbJi29aK6CcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0X2Lhc+IFza1a3io9W8iB70iU8cJFMq0fyPGwljXNOYSLvpshRcu5kJbRYJgjvX559dbtbYDzQJ6Q3oYuquooP5aGJuilBALMTn8jUPCtoblQUrCnsQWrQkfAqh6lD/1pa/IGt4gZEpiVJLlSJb348CyBi1RR2qZBSh3wYNsDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fqei0JOX; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fqei0JOX"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-829a568f3ccso746588b3a.0
        for <llvm@lists.linux.dev>; Sat, 07 Mar 2026 06:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772894539; x=1773499339; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QA6JTgkCmC8RnKP+cAmYpuoERGcQQmKSYmaGYS81ag=;
        b=Fqei0JOXNG2cWDl3CBS+hoS/MikgmrwFC/hW70DZxMq0U78IOvJazllRSorrFom12X
         aEiGT5q/iswTKN5pbTDEznL/z42cUAlyWtB1ibu1JSNHXNNa9D2F+0Kai5169+RLhg4x
         WVc4LLXQirEguOPKoQsASkaLt7hqbE986JfD5JFgA3R/idzdlHCZGS5YClRetX5DW6cR
         MLhCUpePcQy7Fxx09E6lynWhIcfKxg7zHiJT3/idkL2UJE/1CjksoOKDzn2W9N5mxouz
         PiEn4AuJNOi43ZeStmWp4yq8RDY16XYErfyqiYmabNZhEQ+oU2fTZa0ZGk5UVNw7OSfq
         cCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772894539; x=1773499339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6QA6JTgkCmC8RnKP+cAmYpuoERGcQQmKSYmaGYS81ag=;
        b=azS6QyN1pJpI5PI2Ck/kmFJX6fv1j82GUkaZ/egRnCWQfb8DDSJkLgEguUl13MAkPf
         oLovddPUvLJEpyXmQ+UKbOp94AzUrHP9GmbVLy5CAw6UT8WCSzgWze76vIxtTThHNmXX
         kGokYHRAT5LNKj+c57i6NLqTTuakMV51/+sNCGtOVBWblpaTpCmiqY8LvlwXOA7okPkG
         4obZk5op43H2bW7MIbVo7pudLfbpvJOutzvO5mPghXCCZF/7Kkkfo0IcPKW/Ial7yo/b
         w2MtEm/XxzeGU4kid9pRUPcj99e34j2Tq6Yg2fslZrKNmBiVswfKrkmXLUiWCMBDy5xJ
         8GrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy8TSG2UhY0kxi68Ew6fNunub5iNtWPUvTpWb45WjnyYy7sB1XR1+0qliOBj2UD33TXppS@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1ltMw47ey0MbnltzMCPwCtHlTsvzIzc3KY8sjQTf5fCmJl3m7
	YQQ+tLNCIH4Swx/YmOVM56M88UOT1sE8RepHHdfIg13sUP/7Hc+DNNp0
X-Gm-Gg: ATEYQzzDhJajRKv3Ag5PiOLq2JMaMAAKYWZZ4oDzvIHfb1jk5gpkXnJ5AYSgvqAwhAg
	SuX8881zVI4P7a5KUSSrLV9sNsetOOiF/ACgku0OHYtJ7ndiTVO09f4JzA1u/UOL8JRpB34qhql
	3uS+o0hrG2YvYcPTN4hif1+2ESYetxg7Inn0sog7L75bZXROzWYqsJXDLupkavUuqKsOYd3n7v/
	ffQEB8CakN7+A8XLmbMO9IokCvltwsV0suSSEFszDNSOPUQ09izSjB9WX1ezWVVPeA//jOqqGp2
	TrgwHCq2yDOjfCH7LcR5C0ETlIWpaBYy4j96eegs7JQAosoEm2KjHG2uBNewIWTSMnJqp23B/JJ
	GipHw+fgS34G0QwJRSkeySyIhex1+XyQbKsD3wC1hmnhuXLL2IOQHo0js+PU3VnLtkrj4YA6VdO
	QXaqUSlFzakYJ68RF9zgwPmvSBpn/kDInCzg+cKEr3Bm4=
X-Received: by 2002:a05:6a00:1815:b0:821:8492:7f66 with SMTP id d2e1a72fcca58-829a2ded871mr4982644b3a.22.1772894538988;
        Sat, 07 Mar 2026 06:42:18 -0800 (PST)
Received: from DESKTOP-3LEPQG8.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48b2c41sm4778981b3a.54.2026.03.07.06.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 06:42:18 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: rppt@kernel.org,
	akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com,
	david@kernel.org,
	justinstitt@google.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	llvm@lists.linux.dev,
	mhocko@suse.com,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	qq570070308@gmail.com,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [PATCH] mm: optimize once judgment with clang
Date: Sat,  7 Mar 2026 22:41:35 +0800
Message-ID: <20260307144135.380683-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aavd4hoAO1DFLuJP@kernel.org>
References: <aavd4hoAO1DFLuJP@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 7 Mar 2026 10:12:18 +0200, Mike Rapoport wrote:
> On Sat, Mar 07, 2026 at 02:54:04PM +0800, Xie Yuanbin wrote:
>> commit 242b872239f6a7deacbc ("include/linux/once_lite.h: fix judgment in
>> WARN_ONCE with clang") helps optimize performance and size under the
>> clang compiler, but the modification is not complete.
>
> How much does it actually optimize for size?

Basing on commit a0ae2a256046c0c5d377 ("Add linux-next specific
files for 20260306"), compiler "Debian clang version 21.1.8 (5)",
arm64 default defconfig, and setting CONFIG_CC_OPTIMIZE_FOR_SIZE=y,
the size result is:
|                                    | size     |
|                                   -|         -|
| Image.gz                           | 14256146 |
| size of ".text" section in vmlinex | 17035264 |

Basing on above, revert the commit 242b872239f6a7deacbc
("include/linux/once_lite.h: fix judgment in WARN_ONCE with clang"),
and build again:
|                                    | size            |
|                                   -|	              -|
| Image.gz                           | 14258152(+2006) |
| size of ".text" section in vmlinex | 17039360(+4096) |

> Note that performance is really not critical here because we are already
> dealing with slow path of debug code.

It seems that WARN_ON_ONCE_GFP() is not affected by in CONFIG_DEBUG_VM,
and it is used in __alloc_frozen_pages_noprof(), which seems to be a hot
path.

Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF63F78664
	for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 22:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706652533; cv=none; b=NkD6rirmTO4nrfvT1NzfQxFK8CDzuvdj9g9W/hGfXbpgrPzV/p0+r+rZR54hxevdNn60BBNkuwoKrPBssCCrmn7jUVV6C46wki1v0R4qFY0h/tHvw/0Lv4g6PABmYYlnC1BLiHVW1Z1qdl+iPh05O04GcSCQC4Ieav++3hT9/4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706652533; c=relaxed/simple;
	bh=wLXGJX7ZPdzpVptP9s9CeY5Mk/dYYO7q22+aMQXDhEk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tnFjtQEvgjIrV/kkY64R5K/DFfzkIb5g5wxENUCxjCT8R6FD/s0GAsasadKxF+UE+p35tX5ZQBOnvuFZbsba3OuqSXEFyUnEDOXmataJXIOq6mvxiwr1XDbjfA5f+yzsdPI0ZUezAZrauSrSew6NJvcwnOHg2DW4vZOJf4W01qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o/XLAreN; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o/XLAreN"
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-7bfffd9b47fso146675339f.1
        for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 14:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706652531; x=1707257331; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g4o2DS6nz22ReCocFZD628QsKvugxD4ZslaXCuzueXU=;
        b=o/XLAreNYLsLjz5wFm2Q4ZRoC2kunaWgt+zw04O/W6grQUAQQBRJoYbzOp+5rv9oQJ
         m7Fv6k+UbHZHU77zbM1xyl848tm6Qb5q1Yt8vq3MBK3hUoQXpljxIChofjBJSh5U9kY9
         s5zxTkAzO0Yi8Rxv/xQAk1swGKexaECm66cSU1JQ0JnG0+w+yxg+IsmRKDOdu82dE0qq
         Qqj/PhsjyvpMasTGKiCAvUejQdP7yM4uhhXQ7JmZV28/51rbPsX7ie5Wjic3HZPOCpys
         eIDdQsyJuNjirm2UpmS8X6QowRUv/AjVZH3fV0iABzVUZJuEobQdzZ3zIBV6S/UhTKZC
         2iZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706652531; x=1707257331;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4o2DS6nz22ReCocFZD628QsKvugxD4ZslaXCuzueXU=;
        b=JEXbDg1OMjNT/QCaNy/R0OUzt3T59XGDMjo/wY9lAygBJs8nhzCL3geGJ+QAhDjasP
         4tyrheD6oZer9boSpv3FgMF8DtkAg69To/exfp2nAizwl+Zw85VAY+txDG4ynCSoyHy1
         shamXPKhO9Ertv0FkA5yHg+6b7fVc5RLw1mrxfJ6lAcbn8k3eBU9R0gilbP4PorciQmo
         jZQBUTwH0xHtpWSl5IKXRxFtfaS7p2GYsKhSKG/ahOu6mlPN5zNcmP4x9+fSdcE9j2eD
         6QD7ozBiSdAVKt/Zxl38anzMLsUWStVjYF7g0IU1adiCu0Y3cKfVBqLuS2BCp8UtfSKm
         3Jpg==
X-Gm-Message-State: AOJu0YwpBC2zKctFov4WG52uUj5nUpnZd/ys420CYCoNymi5kae9/ZLw
	Zm6eAMfCboggtMkR2watFCjgkb5sTNS/JsfRXYFhepX2tiAlIx/BSzQO1ysAG+SLkn9WLsdf94H
	TvS07QORMA7M1jHfhg41SCpb5Q7ROzg==
X-Google-Smtp-Source: AGHT+IFCRfKhWZRTr+KDp9L4a02S08LEimE8qMaXDlyq6BDCOhXQB2PbalDDpVRn2ZzbZOn51uX14mS9ojwXOeRzWTiU
X-Received: from loughlin00.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:1b6f])
 (user=kevinloughlin job=sendgmr) by 2002:a5d:9907:0:b0:7bf:e3a5:ccea with
 SMTP id x7-20020a5d9907000000b007bfe3a5cceamr11521iol.0.1706652530978; Tue,
 30 Jan 2024 14:08:50 -0800 (PST)
Date: Tue, 30 Jan 2024 22:08:43 +0000
In-Reply-To: <20240121182040.GBZa1geI5NxWSslvt0@fat_crate.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240121182040.GBZa1geI5NxWSslvt0@fat_crate.local>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240130220845.1978329-1-kevinloughlin@google.com>
Subject: [PATCH v3 0/2] x86: enforce and cleanup RIP-relative accesses in
 early boot code
From: Kevin Loughlin <kevinloughlin@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Kevin Loughlin <kevinloughlin@google.com>, 
	Pankaj Gupta <pankaj.gupta@amd.com>, Hou Wenlong <houwenlong.hwl@antgroup.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Dionna Glaze <dionnaglaze@google.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Michael Roth <michael.roth@amd.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-coco@lists.linux.dev, 
	Ashish Kalra <ashish.kalra@amd.com>, Andi Kleen <ak@linux.intel.com>
Cc: Adam Dunlap <acdunlap@google.com>, Peter Gonda <pgonda@google.com>, 
	Jacob Xu <jacobhxu@google.com>, Sidharth Telang <sidtelang@google.com>
Content-Type: text/plain; charset="UTF-8"

SEV/SME code can execute prior to page table fixups for kernel
relocation. However, as with global variables accessed in
__startup_64(), the compiler is not required to generate RIP-relative
accesses for SEV/SME global variables, causing certain flavors of SEV
hosts and guests built with clang to crash during boot.

These crashes highlight a broader problem wherein the toolchain does
not guarantee that early x86-64 code executes correctly at any offset.
While Ard has been looking into overhauling the early x86-64 code
going forward [0], the signficant proposed changes are unfortunately
not backport-friendly.

Instead, this patchset continues the approach of fixing the immediate
problem of SEV-SNP boots crashing when built by clang, providing a
backport-friendly set of changes needed to successfully boot SEV-SNP
hosts and guests. In particular, this patchset is a cleanup of V2 [1],
which introduces a macro to force RIP-relative addressing in early
SEV/SME global variable accesses and existing head64 global accesses.

V2 -> V3: Rename RIP_RELATIVE_ADDR(), remove fixup_*(), cleanup style
V1 -> V2: Use GET_RIP_RELATIVE_PTR() macro to avoid -fPIE compilation

[0] https://lore.kernel.org/lkml/20240129180502.4069817-23-ardb+git@google.com/T/
[1] https://lore.kernel.org/lkml/20240111223650.3502633-1-kevinloughlin@google.com/

Kevin Loughlin (2):
  x86/sev: enforce RIP-relative accesses in early SEV/SME code
  x86/head64: Replace pointer fixups with RIP_RELATIVE_ADDR()

 arch/x86/coco/core.c               | 22 +++++---
 arch/x86/include/asm/mem_encrypt.h | 32 +++++++++--
 arch/x86/kernel/head64.c           | 88 +++++++++++++-----------------
 arch/x86/kernel/head_64.S          |  4 +-
 arch/x86/kernel/sev-shared.c       | 52 +++++++++---------
 arch/x86/kernel/sev.c              | 13 +++--
 arch/x86/mm/mem_encrypt_identity.c | 50 +++++++++--------
 7 files changed, 143 insertions(+), 118 deletions(-)

-- 
2.43.0.429.g432eaa2c6b-goog


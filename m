Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C463F5D73F;
	Sat,  3 Feb 2024 10:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706956052; cv=none; b=MOtzzVdGFqunTCtQKgIzwMH2cxFbBr/UXc0rIl7eN+Rk7WZrbz21RoxnPlm6/W9x48CGQon37dR2X9fLk7jvmuAIZ2EwctDUu/r/WdPQAqeELKbnrro7+l89dl8HwdC0XEibGlxMcW1r5DwVxmPOHU47egGuMQqxM58UWxmj+CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706956052; c=relaxed/simple;
	bh=cP0msj1t8wyJ2dcgj7bifErL/pCrSLrZq5t++VseJdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPqmZbEcwudG420P8PcAwl5xuWwupQaYihjNX9ZaSE9kLzUtQM1FiznPZa5mrRJof79XgtpI/FyGYAx3vF0hCrVnOIghqdMh6xYpik/y2Z0fF7oYhRjvIIu0izbr5X3bLgE9bzAsES0Hgxu7+A2hWqh0g7h31ZT25QnJ67I+NZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q27ZZ3+M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q27ZZ3+M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535F5C43141;
	Sat,  3 Feb 2024 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706956052;
	bh=cP0msj1t8wyJ2dcgj7bifErL/pCrSLrZq5t++VseJdg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q27ZZ3+MqG3q5LcScV1zUuNSPUoXLpeL88B4qOiKwTRer/4jqsvzIFfoIpYfGKAWW
	 +2BQ196gyxJiMvG7OdH3gjBPHuwkVFmsz0vI05v+6A2AQ6pb9KAOkzRJ60uFGmzKi8
	 IuMbEDXHoUMU8jdZqedcTuOy4cKwlLd6WpRZfcChpeOGpfaTRA6PUJE2QexIzYf9kf
	 LlxlQiVXC8c9is+FD7oMy7ji5WAh8W2iIcsFPckZBLRhoppF+Py+j83G+wq1Gai0QN
	 r3jFwDkEgifF+tJcYnKEpIFh5ylTAjPrDV1pWEcUvZdlC3JwTtRarML/4la0/cmv7E
	 eS5diNfv6sCSQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5113a7e662aso1271579e87.2;
        Sat, 03 Feb 2024 02:27:32 -0800 (PST)
X-Gm-Message-State: AOJu0Ywh4QGLTNRbdASAjaiYmEbFb/T/pfl97ZMxsefnCWqZmeOm9N6z
	wW0Wd+j71u6qyAcoATGTw2le6s9rZLmoa9qLB6o+9LjIjyh9eHqo+GPsAPOiXdSR8pgphoIcNi6
	y5fWSD6V3uXXnkRPcF3uF5rXhNmo=
X-Google-Smtp-Source: AGHT+IHb8cBPyA/QawkbQ9qzwWsYgUaeqJKJTfu9WFtSZ0iKSt/aVpkqocorS6+5YBh6Bv6nidqXzImV2SOy/dXzAhc=
X-Received: by 2002:ac2:4e8e:0:b0:511:3208:d4e7 with SMTP id
 o14-20020ac24e8e000000b005113208d4e7mr4341732lfr.69.1706956050543; Sat, 03
 Feb 2024 02:27:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240121182040.GBZa1geI5NxWSslvt0@fat_crate.local>
 <20240130220845.1978329-1-kevinloughlin@google.com> <20240131140037.GDZbpShX2b0elXlqDA@fat_crate.local>
 <CAJ5mJ6j-Vw2P=QLK-J_J79S35UggvZPtm5sia74=enR1qq9X9A@mail.gmail.com>
 <20240131182944.GJZbqRmBN_KDgK_nmB@fat_crate.local> <CAGdbjmJgu4euOTEzns4-7pqUWo8n-gNJiAfARoZWxw8T252zJQ@mail.gmail.com>
 <20240203101927.GEZb4TL2H3XTqCSo5d@fat_crate.local>
In-Reply-To: <20240203101927.GEZb4TL2H3XTqCSo5d@fat_crate.local>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 3 Feb 2024 11:27:19 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGh9pw0U=+-Pg8Uh4xzNhyDZBDvGC7jcnCYvmTQxaUZTQ@mail.gmail.com>
Message-ID: <CAMj1kXGh9pw0U=+-Pg8Uh4xzNhyDZBDvGC7jcnCYvmTQxaUZTQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] x86: enforce and cleanup RIP-relative accesses in
 early boot code
To: Borislav Petkov <bp@alien8.de>
Cc: Kevin Loughlin <kevinloughlin@google.com>, Jacob Xu <jacobhxu@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Pankaj Gupta <pankaj.gupta@amd.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Michael Roth <michael.roth@amd.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-coco@lists.linux.dev, 
	Ashish Kalra <ashish.kalra@amd.com>, Andi Kleen <ak@linux.intel.com>, 
	Adam Dunlap <acdunlap@google.com>, Peter Gonda <pgonda@google.com>, 
	Sidharth Telang <sidtelang@google.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 3 Feb 2024 at 11:20, Borislav Petkov <bp@alien8.de> wrote:
>
> On Fri, Feb 02, 2024 at 04:22:02PM -0800, Kevin Loughlin wrote:
> > True. I just think it would be better to have an upstream fix for
> > clang builds of SEV-SNP guests; I believe the first such SEV-SNP code
> > was merged in 5.19 if I'm not mistaken.
>
> SNP host support is not upstream yet. So we'd be supporting something
> which is out-of-tree. Lemme see how ugly it'll get...
>

The minimal fix doesn't look that bad IMHO. Note that this version is
based on your patch that removes
CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT, and we'd need to see whether
or not to backport that as well.

 arch/x86/include/asm/asm.h         | 13 +++++++++++++
 arch/x86/include/asm/mem_encrypt.h | 13 ++++++++-----
 arch/x86/kernel/sev-shared.c       | 12 ++++++------
 arch/x86/kernel/sev.c              |  9 +++++++--
 arch/x86/mm/mem_encrypt_identity.c | 27 ++++++++++++---------------
 5 files changed, 46 insertions(+), 28 deletions(-)

https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?h=x86-pie-for-sev-v4a&id=65d0e5f4ed6ca807cdf28a1c5c0389af2c9f9bda

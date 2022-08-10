Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E0D2F3E
	for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 22:53:37 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id z25so23289089lfr.2
        for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 15:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=j6fno2mISmVVseTNiVd5u2bXemkF7mgmiaKZKMr15FM=;
        b=HDMpqlIa35VfOhvDtP6A3gqDhAoyxOeOo6u0e7+xTJmrpq9BjCWOCrFepK6ll3Idds
         QIvwN3vWSBMPVJcwtjrnGPI5Zr8LPCKwtMMuIKLOs5dvOJXcuFwSOuderPgE4ES4x3Lq
         DAfY44Ibnh0YRv/tzN3w7Ssi1FK6JiCLHJccuXyu7hLZmjYIP1ihAXroyTzGo68yFGbd
         xiRvwE+t1yOmwIfzVUI9lCUpNSAyYKOF5m53bCxppuDlJtWm7KG6oBDA1FKe/b392D8X
         d6EocmVT5p2a3Ac33wPpWHCCyG7T4AxHOBSRbE1Hws8Az6Gnn8w9TvmlHracGRnNrEg9
         eIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=j6fno2mISmVVseTNiVd5u2bXemkF7mgmiaKZKMr15FM=;
        b=MlhS/Mep5pnBn3dWLptWg9d+biljQX34t3gFOHC7ZZuBR9yX8NJWrcYJz3ls9AhA8W
         t2VrPHKZFTSiQbski6y+cLZan9TdpMPfVkNoUbUV0GjeCv/QXomZbigKG/POOWXHZmUZ
         3qdRHjwi2mhEmxL/aoFgJiAKjCLh5jYEtouGceshz5xwgx/ZNE+MjzWAIEOFn6PtU/3A
         TOAi6sxyZOGHX+7zFJwSFxQtE3eGCK13Z2ldxyLCmWsP6u1gGauK/mrhWhs9CwXZ8Krp
         91VFQbnxvwzvL65jqc59SOyvHQJzsxTgcZ3hgQFDtXEbmq0W3qgn4Q5YrD/uzvkargmJ
         A1xQ==
X-Gm-Message-State: ACgBeo3nf1wjxqwLtLQ/EgYv/3Mtd386SaIxMFyXM6gqvoJMTrdrauRK
	VR6mPU0PAXhARG35e/bN6vaAXDMSfZjy7Pac+rQX+w==
X-Google-Smtp-Source: AA6agR4o+pAxCynagLEO6JT5nD8KF3ONgIeBDQzL8LHqZDJoPwnV0XhN6/KLOpWZ6HbkKbBIgPUaPltMiWjkEyeKgcM=
X-Received: by 2002:ac2:5190:0:b0:48b:29b2:4755 with SMTP id
 u16-20020ac25190000000b0048b29b24755mr9570834lfi.23.1660172015230; Wed, 10
 Aug 2022 15:53:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220722234838.2160385-1-dmatlack@google.com>
In-Reply-To: <20220722234838.2160385-1-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 10 Aug 2022 15:53:08 -0700
Message-ID: <CALzav=frNna1fZYTxwz+Lo=1=zsOLAKoAd3pntXfUiDNdJ_PoA@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM: selftests: Fix Clang build issues in KVM_ASM_SAFE()
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Sean Christopherson <seanjc@google.com>, Peter Xu <peterx@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Oliver Upton <oupton@google.com>, 
	"open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>, kvm list <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 22, 2022 at 4:48 PM David Matlack <dmatlack@google.com> wrote:
>
> The LLVM integrated assembler has some differences from the GNU
> assembler, and recent commit 3b23054cd3f5 ("KVM: selftests: Add x86-64
> support for exception fixup") seems to be tripping over a few of those
> differences.

Paolo, what do you think about these changes? I'm still hitting the
mentioned Clang build issues on kvm/master, commit 93472b797153
("Merge tag 'kvmarm-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into
HEAD").

>
> David Matlack (2):
>   KVM: selftests: Fix KVM_EXCEPTION_MAGIC build with Clang
>   KVM: selftests: Fix ambiguous mov in KVM_ASM_SAFE()
>
>  tools/testing/selftests/kvm/include/x86_64/processor.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
>
> base-commit: 1a4d88a361af4f2e91861d632c6a1fe87a9665c2
> --
> 2.37.1.359.gd136c6c3e2-goog
>

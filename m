Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B908477
	for <llvm@lists.linux.dev>; Wed,  4 Oct 2023 12:21:22 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-65d066995aeso12024216d6.2
        for <llvm@lists.linux.dev>; Wed, 04 Oct 2023 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696422081; x=1697026881; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AM7m7vaSmmMYAyEADAXdMx0sZwgXiamITxRXtutrqys=;
        b=XLO79bgB4i5O3bHPTI09+My0D1J0J5jpgmejcD2oVotu74IU9zmUqwybPnDk4PtH2p
         H1R4Opm0VipEr2/kZ/K/foNQB7lfAARnxu26OUlGtdbjOKDdexXzZd2TCYA2O71g5lb7
         S91UzAMdfyEh2S7koACPRWn/RHLuTlH2ZVYCiVHWIVTrrB8yXL4ydauuRXAhLiCFmZrB
         9AQ0r05CxwVXKbEJdQcBsRXbQ/LI6I1H7pNAuCwhOUtvZiImM+wDGxQ5whY2xYX3NQOx
         3lSk+ClvBahW32L6+OnIOUQkIDQR/ASfmmaBbfiA+RMJleo/N102mNbs/HaOEIR9zy67
         PB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696422081; x=1697026881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AM7m7vaSmmMYAyEADAXdMx0sZwgXiamITxRXtutrqys=;
        b=KMFab1aAoqQjCwi7hmexGrR3TxcpBm9upWhlRqa9ZPKUgOTMoI7mlKozcn3iiz3OcV
         lfzSH5Xte7q3gneReMlFBU6aVnvy6usI6lL5G/CWzYnOBlKJp5vDRWQMTqFYV8pwT2b6
         Vq+3qGD/w8YHqmjDWPKOJD06WdwL/7g3lTI41T2NSF/GRG6KvP3KpGLIsZT8fydHzK+K
         YoefJe1EX2ypJ7Xh6FcqDt7aHSbJo+m2SuarMQqzJtUrhDA8gJEtD3CooSr7NSyvpjPB
         zt7LyUzTD8RvYnQkPcFpOsXnuYC2FpLaDqDuvO3K5j+GVceFsrDRulDgnGMcPwoLeT2z
         7tDw==
X-Gm-Message-State: AOJu0Yz64lWYBGbl496s3P2+8+agHRJ/Bcx4QmPH/iaFU9acIxX6NUa8
	yjT58mNbYZVL/SRLMsiFhBY=
X-Google-Smtp-Source: AGHT+IH6JR0icKV87wR6aK9vYjlSTqVEiUxLPDe63ZwohLb+GJ8E9PGNFpX9Dg+q4xR/zsjTXO5W9A==
X-Received: by 2002:a0c:e18f:0:b0:656:4ba4:f8b6 with SMTP id p15-20020a0ce18f000000b006564ba4f8b6mr2113572qvl.54.1696422081606;
        Wed, 04 Oct 2023 05:21:21 -0700 (PDT)
Received: from luigi.stachecki.net ([2607:fb90:fe4a:a54:f3b3:2ab7:a445:b3f2])
        by smtp.gmail.com with ESMTPSA id z15-20020a0cf00f000000b0065b12c7a48dsm1277228qvk.133.2023.10.04.05.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 05:21:21 -0700 (PDT)
Date: Wed, 4 Oct 2023 08:21:11 -0400
From: Tyler Stachecki <stachecki.tyler@gmail.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/5] KVM: x86: Fix breakage in KVM_SET_XSAVE's ABI
Message-ID: <ZR1Yt6Z+dhMbn/FJ@luigi.stachecki.net>
References: <20230928001956.924301-1-seanjc@google.com>
 <ZR0QOGo5DftkRWsr@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZR0QOGo5DftkRWsr@redhat.com>

On Wed, Oct 04, 2023 at 04:11:52AM -0300, Leonardo Bras wrote:
> So this patch is supposed to fix migration of VM from a host with
> pre-ad856280ddea (OLD) kernel to a host with ad856280ddea + your set(NEW).
> Right?
> 
> Let's get the scenario here, where all machines are the same:
> 1 - VM created on OLD kernel with a host-supported xfeature F, which is not
>     guest supported.
> 2 - VM is migrated to a NEW kernel/host, and KVM_SET_XSAVE xfeature F.
> 3 - VM will be migrated to another host, qemu requests KVM_GET_XSAVE, which
>     returns only guest-supported xfeatures, and this is passed to next host
> 4 - VM will be started on 3rd host with guest-supported xfeatures, meaning
>     xfeature F is filtered-out, which is not good, because the VM will have
>     less features compared to boot.

This is what I was (trying) to convey earlier...

See Sean's response here:
https://lore.kernel.org/all/ZRMHY83W%2FVPjYyhy@google.com/

I'll copy the pertinent part of his very detailed response inline:
> KVM *must* "trim" features when servicing KVM_GET_SAVE{2}, because that's been
> KVM's ABI for a very long time, and userspace absolutely relies on that
> functionality to ensure that a VM can be migrated within a pool of heterogenous
> systems so long as the features that are *exposed* to the guest are supported
> on all platforms.

My 2 cents: as an outsider with less familiarity of the KVM code, it is hard
to understand the contract here with the guest/userspace. It seems there is a
fundamental question of whether or not "superfluous" features, those being
host-supported features which extend that which the guest is actually capable
of, can be removed between the time that the guest boots and when it
terminates, through however many live-migrations that may be.

Ultimately, this problem is not really fixable if said features cannot be
removed.

Is there an RFC or document which captures expectations of this form?

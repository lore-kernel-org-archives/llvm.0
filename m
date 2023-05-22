Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8250CEA8
	for <llvm@lists.linux.dev>; Mon, 22 May 2023 04:17:09 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QPkft3zztz4x4B;
	Mon, 22 May 2023 14:16:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1684729020;
	bh=AVLVOohCWlNWsFlZp/IjXPMalhLXANn4M3eXvq7tzo4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pgufz1uRbk/l6Rkj1iL6mZYqH3IRjcKojpyTlmnAqC5gBLrUBoE9FFstCMUjKSjQa
	 uv9vN+rApxtjlJ8i1zW14wzuxXSWmzFWQpJmE+6E5yQ16RHo80JIMVZFCkzEud3Rsd
	 crFSqYweTi2+OSAyQrKmkoPy6AY1LlMn3p4HCzfgB27T+V6UTyE7OgP+ZngP7e0K/g
	 xrERP69ypwM37e6nnw4lM8nQO1q9vvBO0V6MtmIgeKMJxW1qB5hv4V1bHGEHIl5WZr
	 GLi3ASKQsCuuTsN3XYaBrB9DgTnDKaHMkGPu9JFhl45o+kil82t9uN8FJoBA2XwUIK
	 n8c477C2qGY9A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ricardo Ribalda <ribalda@chromium.org>, Eric Biederman
 <ebiederm@xmission.com>, Philipp Rudo <prudo@linux.vnet.ibm.com>, Dave
 Young <dyoung@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor
 <nathan@kernel.org>, Tom Rix <trix@redhat.com>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Baoquan He <bhe@redhat.com>, Philipp Rudo <prudo@redhat.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Ross Zwisler
 <zwisler@google.com>, Steven Rostedt <rostedt@goodmis.org>, Simon Horman
 <horms@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
 stable@vger.kernel.org
Subject: Re: [PATCH v7 3/4] powerpc/purgatory: Remove PGO flags
In-Reply-To: <20230321-kexec_clang16-v7-3-b05c520b7296@chromium.org>
References: <20230321-kexec_clang16-v7-0-b05c520b7296@chromium.org>
 <20230321-kexec_clang16-v7-3-b05c520b7296@chromium.org>
Date: Mon, 22 May 2023 14:16:54 +1000
Message-ID: <87h6s59f0p.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Ricardo Ribalda <ribalda@chromium.org> writes:
> If profile-guided optimization is enabled, the purgatory ends up with
> multiple .text sections.
> This is not supported by kexec and crashes the system.
>
> Cc: stable@vger.kernel.org
> Fixes: 930457057abe ("kernel/kexec_file.c: split up __kexec_load_puragory")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  arch/powerpc/purgatory/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

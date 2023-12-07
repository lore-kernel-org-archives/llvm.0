Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857343D0A9;
	Thu,  7 Dec 2023 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmDVt5l8Cz4xS0;
	Thu,  7 Dec 2023 23:44:38 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, Nathan Lynch <nathanl@linux.ibm.com>
Cc: lkft-triage@lists.linaro.org, Benjamin Gray <bgray@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>, regressions@lists.linux.dev, Linux Kernel Functional Testing <lkft@linaro.org>
In-Reply-To: <20231127-rtas-pci-rw-config-v1-1-385d29ace3df@linux.ibm.com>
References: <20231127-rtas-pci-rw-config-v1-1-385d29ace3df@linux.ibm.com>
Subject: Re: [PATCH] powerpc/rtas_pci: rename and properly expose config access APIs
Message-Id: <170195271166.2310221.13174919656650959020.b4-ty@ellerman.id.au>
Date: Thu, 07 Dec 2023 23:38:31 +1100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Mon, 27 Nov 2023 18:40:09 -0600, Nathan Lynch wrote:
> The rtas_read_config() and rtas_write_config() functions in
> kernel/rtas_pci.c have external linkage and two users in arch/powerpc:
> the rtas_pci code itself and the pseries platform's "enhanced error
> handling" (EEH) support code.
> 
> The prototypes for these functions in asm/ppc-pci.h have until now
> been guarded by CONFIG_EEH since the only external caller is the
> pseries EEH code. However, this presumably has always generated
> warnings when built with !CONFIG_EEH and -Wmissing-prototypes:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/rtas_pci: rename and properly expose config access APIs
      https://git.kernel.org/powerpc/c/9be4feb768b86c25da336a6c0f3e3caefd16f1e4

cheers

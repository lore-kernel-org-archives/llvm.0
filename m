Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF622C8E2
	for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 13:09:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D90E1FB;
	Wed, 27 Sep 2023 06:10:06 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C65843F5A1;
	Wed, 27 Sep 2023 06:09:26 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Kees Cook <keescook@chromium.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yangtao Li <frank.li@vivo.com>,
	linux-arm-kernel@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] bus: vexpress-config: Annotate struct vexpress_syscfg_func with __counted_by
Date: Wed, 27 Sep 2023 14:09:24 +0100
Message-ID: <169582011549.164975.11672483972791250049.b4-ty@arm.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230922175234.work.134-kees@kernel.org>
References: <20230922175234.work.134-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 Sep 2023 10:52:35 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct vexpress_syscfg_func.
>
> [...]

Applied to sudeep.holla/linux (for-next/vexpress/updates), thanks!

[1/1] bus: vexpress-config: Annotate struct vexpress_syscfg_func with __counted_by
      https://git.kernel.org/sudeep.holla/c/cb289ce6e2ce
--
Regards,
Sudeep


Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E5163B4
	for <llvm@lists.linux.dev>; Fri, 18 Aug 2023 09:45:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33B47D75;
	Fri, 18 Aug 2023 02:46:10 -0700 (PDT)
Received: from bogus (unknown [10.57.34.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CB0B3F762;
	Fri, 18 Aug 2023 02:45:27 -0700 (PDT)
Date: Fri, 18 Aug 2023 10:44:53 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Justin Stitt <justinstitt@google.com>
Cc: Sebastian Reichel <sre@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] power: vexpress: fix -Wvoid-pointer-to-enum-cast warning
Message-ID: <20230818094453.pc7zlzl4lvjk3zpx@bogus>
References: <20230814-void-drivers-power-reset-vexpress-poweroff-v1-1-c3d9b0107e5d@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814-void-drivers-power-reset-vexpress-poweroff-v1-1-c3d9b0107e5d@google.com>

On Mon, Aug 14, 2023 at 10:21:51PM +0000, Justin Stitt wrote:
> When building with clang 18 I see the following warning:
> |       drivers/power/reset/vexpress-poweroff.c:124:10: warning: cast to smaller integer type 'enum vexpress_reset_func' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |         124 |         switch ((enum vexpress_reset_func)match->data) {
> 
> This is due to the fact that `match->data` is a void* while `enum vexpress_reset_func`
> has the size of an int. This leads to truncation and possible data loss.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> Reported-by: Nathan Chancellor <nathan@kernel.org>

Hi Sebastian,

I am assuming you will pick this up.

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

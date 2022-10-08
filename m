Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEA27E
	for <llvm@lists.linux.dev>; Sat,  8 Oct 2022 14:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AE2C433D6;
	Sat,  8 Oct 2022 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665238955;
	bh=WpsbLV1k1LdGsZAYRrhpFF8H3l4G3h3csAgFDHOsZ6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j/QWLg1pXgy+b9YTsneB36RDyrMzeAFl49eD/oGSSHc8QaWH3TU11YSn84PhzXi/2
	 Zh9NBLdkZujgSAt7uTjp9hKeAuIbZeQcJsXH/pULokJJPTKVs7tLAimsF+oKyRkhyl
	 NjSNgpIoo+0W9RP1vQXNjlukbnj9gvKQCzsn1ocj/NhtePKlcA1ZUix/F0aC7FxJgy
	 GRADGWjBWQaNnpx0mg3qUr3Zl+AIxeJWFvMGrvc1gd4uZXsAtbysWSqxVduzNYtTyT
	 cmZqKnYla+g66mLo9IemI+/0fqoSqVUDADijtyL+Qta9n8bPUsr8TsO/3NoxcVHVAC
	 obuyyz7n3eubw==
Date: Sat, 8 Oct 2022 15:22:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Conor.Dooley@microchip.com, peterz@infradead.org, jpoimboe@kernel.org,
	jbaron@akamai.com, rostedt@goodmis.org, ajones@ventanamicro.com,
	ardb@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com,
	trix@redhat.com, samuel@sholland.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: jump_label: mark arguments as const to satisfy
 asm constraints
Message-ID: <Y0GHpJMQwEeLEq2Y@spud>
References: <20221006064028.548-1-jszhang@kernel.org>
 <20221006124144.abaz74g7nxrb5hxj@kamzik>
 <4c8fa16a-8463-ee32-7307-0383fa94403c@microchip.com>
 <Y0GBO77e2Lu/khkI@xhacker>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0GBO77e2Lu/khkI@xhacker>

On Sat, Oct 08, 2022 at 09:55:07PM +0800, Jisheng Zhang wrote:
> On Thu, Oct 06, 2022 at 12:44:32PM +0000, Conor.Dooley@microchip.com wrote:
> > Also could you please add the reported-by from samuel & a fixes tag?
> 
> I will add Reported-by tag, but I'm not sure whether fixes tag
> is suitable, and which commit I could use? commit 8eb060e1018
> ("arch/riscv: add Zihintpause support")?

That is the commit that Samuel blamed for the issue & is the one that
added the static branch - so I guess so!

Thanks,
Conor.

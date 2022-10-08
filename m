Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6A17E
	for <llvm@lists.linux.dev>; Sat,  8 Oct 2022 14:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA66EC433D6;
	Sat,  8 Oct 2022 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665238714;
	bh=AUMnXmbKs1i6Qjt6RJif9g0nKBuFWpjAIMlUnXBwHyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Irj53r5uh7JKLsWfaz00Ted8G5G2Tt7pcty8UZq4h7/Jpk+wBzjHUVLekcTLkn36W
	 O4zWBJBk08z2J0loe125SXUpth+SEu8HIkH1yg202CXqZuUeBLl7jJGo2S1KvdHWcf
	 dVAKBRTveXwkkCDJfHFADfvUfPYGko93SYsxZR8XqJGhTq3rFP6Nz1m8p9r2L03X/w
	 3Z2whHQ/Ek+cGbBY2T8rOlVPDkbQc4jS3EUTjEsDZLusRxCsh4Q9cmTBFhhg2PYwsX
	 Ukk9a9rjTJHNiWurLcXbMaLg4jupPxedc6/Wtuqca76vtstbfQjMh9TMs+GZ4aRiLB
	 t57KtBm+dxC3g==
Date: Sat, 8 Oct 2022 22:08:59 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Conor.Dooley@microchip.com, peterz@infradead.org, jpoimboe@kernel.org,
	jbaron@akamai.com, ajones@ventanamicro.com, ardb@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
	samuel@sholland.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: jump_label: mark arguments as const to satisfy
 asm constraints
Message-ID: <Y0GEe8K7V81r5yhe@xhacker>
References: <20221006064028.548-1-jszhang@kernel.org>
 <20221006124144.abaz74g7nxrb5hxj@kamzik>
 <4c8fa16a-8463-ee32-7307-0383fa94403c@microchip.com>
 <Y0GBO77e2Lu/khkI@xhacker>
 <20221008100748.1078fb3f@rorschach.local.home>
 <20221008100902.0bbbc1cc@rorschach.local.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221008100902.0bbbc1cc@rorschach.local.home>

On Sat, Oct 08, 2022 at 10:09:02AM -0400, Steven Rostedt wrote:
> On Sat, 8 Oct 2022 10:07:48 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > Link: https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
> > Link: https://lore.kernel.org/all/20210212094059.5f8d05e8@gandalf.local.home/
> > 
> 
> This way tools can be used to map commits to links relevant to them.
> They key off the "Link:" tag keyword.

Thank you so much!

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF95AD30;
	Tue, 28 Mar 2023 17:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F3AC4339B;
	Tue, 28 Mar 2023 17:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680025907;
	bh=Vf5t/GUtqbIuIiEDfr+hoWnUHrJOfa3/Nr17O3WkyQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XHMnjF/o3gqw2b+I6mowka9CnTMLHg8nrY4RbaQiGvPu6pViXFxytmbYW3SbSM6QN
	 PWaXtliZpmUx566Am9b4vCo7epA20qpIbvv//0V6lZyYFY5LPvuXsCTy4nnVJ/3JHm
	 Nja52hF9KPTsTdLUANCHIhr1TnVhvGBQdMAIBDVyW7aTs2fY3YTSi2bLpT5Fgew5/l
	 itxKBhMHBMzL5xSDHN8g5uMLiVvIF5IiC/Av5lu2q2qzu9hA5R1Y/Mb3KeD+RozfrA
	 Uvw5kIonfJkVW0jLM5rEFEwOIiqwLTDINiVevERTwD8Q6UTHc2st++p0KjQzQL185F
	 gdpwOjXOz9zyQ==
Date: Tue, 28 Mar 2023 18:51:42 +0100
From: Will Deacon <will@kernel.org>
To: Zaid Al-Bassam <zalbassam@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 6577/7309] drivers/perf/arm_pmuv3.c:44:2:
 error: use of undeclared identifier 'PERF_MAP_ALL_UNSUPPORTED'
Message-ID: <20230328175141.GA1974@willie-the-truck>
References: <202303281539.zzI4vpw1-lkp@intel.com>
 <20230328122138.GA1275@willie-the-truck>
 <d2de874e-d2e8-435e-a90e-a3aef763f2b3@app.fastmail.com>
 <86o7ocx51a.wl-maz@kernel.org>
 <CALBRaFmmTZSZ+pm-=QKh5x_Pp8iMX_zdF50-u9HPdweq24jmzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALBRaFmmTZSZ+pm-=QKh5x_Pp8iMX_zdF50-u9HPdweq24jmzQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Mar 28, 2023 at 12:37:42PM -0400, Zaid Al-Bassam wrote:
> Arnd, Do you want to change your patch to drop [1], or should I create
> a new patch? Btw, Thank you for the patch.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?id=3b16f6268e66

I think the suggestion is to revert this change, so I'll do that now.

Cheers,

Will

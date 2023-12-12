Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5218F745E5;
	Tue, 12 Dec 2023 15:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SERNwVN+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1582C433C8;
	Tue, 12 Dec 2023 15:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702393918;
	bh=qJZVkUQwvB5yqptiVyPjwSDan514T78OaHmGGXo4cLw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SERNwVN+4SLJQoEa3HqRgAZZbiXJlVBfLAVxOtfTX15GdDtuJspYAmXzv4MFV1a16
	 zCgyMfivpWOR3Zw61SMeVvblqy2mh+GtpS8gU9X+rdQEQlcsUqn1n6RIGYooQyzIYI
	 OI1Cxmw250+k373iZ8aXgAg7ySvuwc0PnT3lp5IeQpwCZCpXTPYb6uQyjIirjNwjvy
	 WWIsuhLa5pwkkc/46Fwtu/vNpjDntVvjkEkQMQGQURSvcqoEP5zxGofjTr6e/GDCIq
	 2FTExQ2GJkTD55QWJQe62JbDu1UAt29/5v+DkCF+0xHSN6ZeguoCHvXZkNT/6rZtS3
	 AyW6/zvpD0yvQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, lkp@intel.com,
 linux-mm@kvack.org, linux@weissschuh.net, llvm@lists.linux.dev,
 mcgrof@kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH -next] drivers: perf: Fix build error by adding const to
 ctl_table argument of handler
In-Reply-To: <20231207083512.51792-1-alexghiti@rivosinc.com>
References: <202312062242.RFPPozG9-lkp@intel.com>
 <20231207083512.51792-1-alexghiti@rivosinc.com>
Date: Tue, 12 Dec 2023 16:11:55 +0100
Message-ID: <877cljsbes.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alexandre Ghiti <alexghiti@rivosinc.com> writes:

> The ctl_table argument of the proc_handler field was constified treewide
> but somehow missed the occurrence in the riscv pmu sbi driver, so add the
> const to fix the build error.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312062242.RFPPozG9-lkp@i=
ntel.com/
> Fixes: c8be9e66ca1e ("sysctl: treewide: constify the ctl_table argument o=
f handlers")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 16acd4dcdb96..97e345f7d25d 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -986,7 +986,7 @@ static void riscv_pmu_update_counter_access(void *inf=
o)
>  		csr_write(CSR_SCOUNTEREN, 0x2);
>  }
>=20=20
> -static int riscv_pmu_proc_user_access_handler(struct ctl_table *table,
> +static int riscv_pmu_proc_user_access_handler(const struct ctl_table *ta=
ble,
>  					      int write, void *buffer,
>  					      size_t *lenp, loff_t *ppos)

Adding linux-riscv.

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>

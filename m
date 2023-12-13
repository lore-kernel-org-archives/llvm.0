Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E421F9F7;
	Wed, 13 Dec 2023 06:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="0JFtG3rY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5cpCdGFyNgIm+UuGHcpqgky39S6rpy1muJgHd40gq4E=; b=0JFtG3rYmb3+N31e73Nfzt5jOk
	hlMRraAChCza7PYOR3gdjxLx2S6uOdj4Tq5afLQFR4jJjD7E3QX0Q3r1Gu77jLDuGqXHIbUngZtiI
	2ns4cUR95M1M7xpBqVisLNiVZ0XEvQ9C+kHT+u4uozyRZJRxjSgmpSHpOSms2IXwW/Y5O+rrtqtSi
	2SjMOB/VomMZLYQcd5C7FoTRNR8SfARBi39rsS4Jqcog+mrLiZ4JR3Qw294Zf6gIV60Y8jDJu5ZNE
	BBndfGY5kBuA7ZB6ZPNVZZa5O+G/V66WGPjtagQfyEEOxHJOz/0COLivSg6wZ/vWYJrRmelNYOx5O
	zoBqt3bA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rDIjU-00DmLA-07;
	Wed, 13 Dec 2023 06:28:36 +0000
Date: Tue, 12 Dec 2023 22:28:35 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: alexghiti@rivosinc.com, lkp@intel.com, linux-mm@kvack.org,
	linux@weissschuh.net, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH -next] drivers: perf: Fix build error by adding const to
 ctl_table argument of handler
Message-ID: <ZXlPE0wYev3RUZsA@bombadil.infradead.org>
References: <20231207083512.51792-1-alexghiti@rivosinc.com>
 <mhng-eda68e75-0733-4b42-b2a8-3e4696bde0db@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-eda68e75-0733-4b42-b2a8-3e4696bde0db@palmer-ri-x1c9a>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Tue, Dec 12, 2023 at 01:04:41PM -0800, Palmer Dabbelt wrote:
> On Thu, 07 Dec 2023 00:35:12 PST (-0800), alexghiti@rivosinc.com wrote:
> > The ctl_table argument of the proc_handler field was constified treewide
> > but somehow missed the occurrence in the riscv pmu sbi driver, so add the
> > const to fix the build error.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202312062242.RFPPozG9-lkp@intel.com/
> > Fixes: c8be9e66ca1e ("sysctl: treewide: constify the ctl_table argument of handlers")
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  drivers/perf/riscv_pmu_sbi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > index 16acd4dcdb96..97e345f7d25d 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -986,7 +986,7 @@ static void riscv_pmu_update_counter_access(void *info)
> >  		csr_write(CSR_SCOUNTEREN, 0x2);
> >  }
> > 
> > -static int riscv_pmu_proc_user_access_handler(struct ctl_table *table,
> > +static int riscv_pmu_proc_user_access_handler(const struct ctl_table *table,
> >  					      int write, void *buffer,
> >  					      size_t *lenp, loff_t *ppos)
> >  {
> 
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Same here, Thomas please fold into your series as you are working on a
new series.

  Luis

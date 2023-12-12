Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25DB65A76
	for <llvm@lists.linux.dev>; Tue, 12 Dec 2023 21:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="AiCZzotk"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d2f1cecf89so22261305ad.1
        for <llvm@lists.linux.dev>; Tue, 12 Dec 2023 13:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1702415082; x=1703019882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQLI8ZxmgGnTnjndBk3z0pIE3uTOANUnGC/O+K8Uf68=;
        b=AiCZzotkTppcu2Sx1a+h9LsU52fvuYW+PkeYg/6QAbZssk6aZQ/bmwmR7MZzZarmEc
         wUspLX5GWpB+/pnsdIpJNFAmzKqqSvCuhXKHD/Bm6H6GiT3GjxF3PM/ZPMkPa62KQSMk
         aU8VLf8q+tLyriyMHr4574dTWfd3TMInR2A1haWPx+V5dxkzwVx1QXnu4e3QZwI6AmpP
         sMKkN6t99sogMG+8qUdCllm6NpTjAZQ1CjJcsTDCCfCcQK4dNeiFGj9mrBmtU+GL4PpP
         rDDGavssV1CNIdskVFkALX7DD0zvndDksBOytcg49/c6dUj9sbkY/sAxs+EcHFWv+DTq
         /h5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702415082; x=1703019882;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQLI8ZxmgGnTnjndBk3z0pIE3uTOANUnGC/O+K8Uf68=;
        b=ov0uLFjzSqS1Q3atnMOMps6CACYQXsNnlBzOrGc3hyxvOH4iRtJTW85opjRyuZ7mB+
         FXI1Q5IYBOjI5Ixm5uOFIPIGWITal7imZ98YRwJdEaPaZ3cLXCe7YacfyOyK64AGSWlj
         0o2cCJtgcQ39sly2I5rfxkkHQK4/lrnjtX04euzJ2tFbqxbNhy2pVx8gJlId/b3aoThh
         c17CgTYK9Qx5UINjhMPNOIiJX0u/U1omEKQfldxW9E+gfoQlnfGlCupxfoA7VJ0DU6mA
         jVBnldezG/mPyzx0TVsOwiviGtaAurk7ys76w7Sex83u14FpjOw/a+nKTEn99kV1tP84
         LpRA==
X-Gm-Message-State: AOJu0YyULgDHkFEEn5Up9NDeDzfvoPWoPHCkNQ7WOWby2ADig1SDiltY
	ZPyqjpqR9KB4Ayo7iNYSmHkPwQ==
X-Google-Smtp-Source: AGHT+IEffuvr5hwWjR1T7jT2dRz7mdzArWh18uGXB0xpGx+xGt4IV2Sq4auOxtaoNxBwuMmVj5TnWQ==
X-Received: by 2002:a17:903:2282:b0:1d3:39fd:9043 with SMTP id b2-20020a170903228200b001d339fd9043mr938093plh.13.1702415082012;
        Tue, 12 Dec 2023 13:04:42 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902ab8700b001cfc19c2d01sm1697091plr.296.2023.12.12.13.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 13:04:41 -0800 (PST)
Date: Tue, 12 Dec 2023 13:04:41 -0800 (PST)
X-Google-Original-Date: Tue, 12 Dec 2023 12:59:26 PST (-0800)
Subject:     Re: [PATCH -next] drivers: perf: Fix build error by adding const to ctl_table argument of handler
In-Reply-To: <20231207083512.51792-1-alexghiti@rivosinc.com>
CC: lkp@intel.com, linux-mm@kvack.org, linux@weissschuh.net, llvm@lists.linux.dev,
  mcgrof@kernel.org, oe-kbuild-all@lists.linux.dev, alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-eda68e75-0733-4b42-b2a8-3e4696bde0db@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 07 Dec 2023 00:35:12 PST (-0800), alexghiti@rivosinc.com wrote:
> The ctl_table argument of the proc_handler field was constified treewide
> but somehow missed the occurrence in the riscv pmu sbi driver, so add the
> const to fix the build error.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312062242.RFPPozG9-lkp@intel.com/
> Fixes: c8be9e66ca1e ("sysctl: treewide: constify the ctl_table argument of handlers")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 16acd4dcdb96..97e345f7d25d 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -986,7 +986,7 @@ static void riscv_pmu_update_counter_access(void *info)
>  		csr_write(CSR_SCOUNTEREN, 0x2);
>  }
>
> -static int riscv_pmu_proc_user_access_handler(struct ctl_table *table,
> +static int riscv_pmu_proc_user_access_handler(const struct ctl_table *table,
>  					      int write, void *buffer,
>  					      size_t *lenp, loff_t *ppos)
>  {

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90751173C
	for <llvm@lists.linux.dev>; Tue, 12 Dec 2023 23:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="zKkBj+P6"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6d84ddd642fso4765595a34.0
        for <llvm@lists.linux.dev>; Tue, 12 Dec 2023 15:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702424774; x=1703029574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbmEbrs6bQLhWhxEbYr5UnPHXhm5V4DDYq4rhsIr2mI=;
        b=zKkBj+P69Pu/SJu7emCInHVlcF0IGBAeTRRPOkdygpEloBIx4a6NvCAYofP9WVl156
         +a6ivVCA3Va495cl+oONmPGX6dXW5GBarL30olW8GBaFs21a0Sz7V9mA0G4f0LLNejBs
         3lLd9ogemyuh/Kwk2zSTdrv4UHlphC5p2wE5QHmb+A4JQ9CwZ5ueO43bTQ3rPvZnnLmj
         6zMGh+ISLWeH4mXYpgAXuMFysxT57UJqX1fVa1xL2ZVKaRYJnjKqMJT4MDeFoCL0gKCF
         jXhCAaxfMD+LDsl9dviBBH52TBK4IFD/zWK86OheFvRHzou3FVDEYmGZ8NW+LP5Ak+D6
         r1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702424774; x=1703029574;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbmEbrs6bQLhWhxEbYr5UnPHXhm5V4DDYq4rhsIr2mI=;
        b=I2fbz0+23diKwk+SPKIbevfki6gBDMRcfMjz+1X891ZqM9P+FVFvhTtdJR4UJFkSYm
         hO8htJZKseAGAbn+zP2krIXiAAOVYEqTdK8VChvgK2i1+ci2EdDDOz5xQesQ02iIxtz0
         obfFQzXkvBxyfMZmCBRTdhqoT7wOyIQAoNmp29QSCEfqr06YnXr99eJXaL4I+OrM0q5z
         ClJuIXdoyzsQ6i9pIonkHtJSkxPu2Rt1vlNBi1u8oyx3/Ie2sH+6Bq07IfS6iRHtMx0K
         2subaWpESGwB3S5AUUGEqGQj5cMMhf4AE676rjoJNy1xlfeLZpEXb2Y3BQ1Quiq+xRi1
         BdZA==
X-Gm-Message-State: AOJu0YxUDp75/IB7SnCGvhSSfSyxDiBDVo3mRmllQ0thUiNJZ/s4pYoi
	4enYkfUDVLWnru2KGrqpPvcNmw==
X-Google-Smtp-Source: AGHT+IFAep+ya4pWAptkw09ofY3iRlVEUs7Go9nfxaBqqHeI4O4DubUrPPHbqz818leh9wtSZ2ACWg==
X-Received: by 2002:a9d:6a4a:0:b0:6d9:d72e:68c6 with SMTP id h10-20020a9d6a4a000000b006d9d72e68c6mr8055424otn.36.1702424773743;
        Tue, 12 Dec 2023 15:46:13 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id z28-20020a62d11c000000b006ce66866226sm9073221pfg.84.2023.12.12.15.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 15:46:13 -0800 (PST)
Date: Tue, 12 Dec 2023 15:46:13 -0800 (PST)
X-Google-Original-Date: Tue, 12 Dec 2023 15:46:11 PST (-0800)
Subject:     Re: [riscv:for-next 1/2] drivers/perf/riscv_pmu_sbi.c:994:33: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers
In-Reply-To: <202312130700.1BNERVAH-lkp@intel.com>
CC: alexghiti@rivosinc.com, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
From: Palmer Dabbelt <palmer@rivosinc.com>
To: lkp@intel.com
Message-ID: <mhng-0e80813c-1556-4640-9d69-aa8ca6720379@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 12 Dec 2023 15:33:16 PST (-0800), lkp@intel.com wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git for-next
> head:   6c312912da5cefafd501f47afb59c1a3cf54e6cc
> commit: 0bd6bc435f7db3e22acb410b721e97a97463c51c [1/2] drivers: perf: Fix build error by adding const to ctl_table argument of handler
> config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231213/202312130700.1BNERVAH-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312130700.1BNERVAH-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312130700.1BNERVAH-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> drivers/perf/riscv_pmu_sbi.c:994:33: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>      994 |         int ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
>          |                                        ^~~~~
>    include/linux/sysctl.h:72:44: note: passing argument to parameter here
>       72 | int proc_dointvec_minmax(struct ctl_table *, int, void *, size_t *, loff_t *);
>          |                                            ^
>>> drivers/perf/riscv_pmu_sbi.c:1015:19: error: incompatible function pointer types initializing 'proc_handler *' (aka 'int (*)(struct ctl_table *, int, void *, unsigned int *, long long *)') with an expression of type 'int (const struct ctl_table *, int, void *, size_t *, loff_t *)' (aka 'int (const struct ctl_table *, int, void *, unsigned int *, long long *)') [-Wincompatible-function-pointer-types]
>     1015 |                 .proc_handler   = riscv_pmu_proc_user_access_handler,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    2 errors generated.
>
>
> vim +994 drivers/perf/riscv_pmu_sbi.c
>
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02   988
> 0bd6bc435f7db3 Alexandre Ghiti 2023-12-07   989  static int riscv_pmu_proc_user_access_handler(const struct ctl_table *table,
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02   990  					      int write, void *buffer,
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02   991  					      size_t *lenp, loff_t *ppos)
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02   992  {
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02   993  	int prev = sysctl_perf_user_access;
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  @994  	int ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02   995
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02   996  	/*
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02   997  	 * Test against the previous value since we clear SCOUNTEREN when
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02   998  	 * sysctl_perf_user_access is set to SYSCTL_USER_ACCESS, but we should
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02   999  	 * not do that if that was already the case.
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1000  	 */
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1001  	if (ret || !write || prev == sysctl_perf_user_access)
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1002  		return ret;
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1003
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1004  	on_each_cpu(riscv_pmu_update_counter_access, NULL, 1);
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1005
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1006  	return 0;
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1007  }
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1008
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1009  static struct ctl_table sbi_pmu_sysctl_table[] = {
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1010  	{
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1011  		.procname       = "perf_user_access",
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1012  		.data		= &sysctl_perf_user_access,
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1013  		.maxlen		= sizeof(unsigned int),
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1014  		.mode           = 0644,
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02 @1015  		.proc_handler	= riscv_pmu_proc_user_access_handler,
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1016  		.extra1		= SYSCTL_ZERO,
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1017  		.extra2		= SYSCTL_TWO,
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1018  	},
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1019  	{ }
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1020  };
> cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1021
>
> :::::: The code at line 994 was first introduced by commit
> :::::: cc4c07c89aada16229084eeb93895c95b7eabaa3 drivers: perf: Implement perf event mmap support in the SBI backend
>
> :::::: TO: Alexandre Ghiti <alexghiti@rivosinc.com>
> :::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

Sorry, I accidentally left this in the tree.  It shouldn't be there as 
it depends on a patch in linux-next that caused the breakage.  I've 
dropped the patch.

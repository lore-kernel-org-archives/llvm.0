Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888DB42A8B;
	Mon, 17 Feb 2025 15:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739807662; cv=none; b=WdgvhB6xAtMebwgnEkgUBcUrtdmcXwbOdL0mjhQLXybk6qb+2Qcf8tKtNwXpJBCUDHD5MEZogZhnvbQrGqBtpvHAqXZdn8SUUeFUnS7Zs24tBF0HIZeMmKTOOuQFZYUQhW9Hy4A+C0yV3CSQdHh6bjmi2mSTuAgDrk5ebqsqRVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739807662; c=relaxed/simple;
	bh=bSBxzJR5oQVEYh+Oi1Iol3dXL0QO1mYzcXgPt7al01U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDfhDdgHIYVytpHWeHJ7fLXHmYvcCbvuO/3Agf6sSfPaayzmmyx20DHAKc2TtbuUTWP3FR+fCqwVG20iuG4nxEs8reC3ZE3Xd2yQL6DL/EYdBw9flWEpYZlxbCiDbxva2eR002pF+hGZdPxnOSo7w7y2iZzMyEXbFS+9/hSWP3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+goY4Qb; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+goY4Qb"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c0a4b030f2so56707285a.0;
        Mon, 17 Feb 2025 07:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739807659; x=1740412459; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WDO5YZx4Fy+u/C4ZXeJopGsEViBSAueZJDksbUtV69k=;
        b=J+goY4Qb/1VDGL8hz8HrcjgR21CLcQWQip76k+hrX4N39JBTAUrnZ53+OY0uAFXZyX
         6UJFYQtKp0FSDIQEFXhVqmbDWr7prdoO0t8sD+LIG8Fp0Z7djsBTNcYTH6NWzdjo9DfF
         G+qMLeXk5uPYwAhyThCLvMwJ+HPsi+acKaFKP4HJtQ+E9eFGlITFwqKDw7R1cxJYhmJY
         gJYUo50z1VATr8kJdaOOYC6wd4qolukIbmCxubFVDelxro+3f8qO5HaE7wypAHoqJmnR
         sFohW+/48vLUSdYSxXvhK9Ug/Zbikf17/g7YevvM8mOlTE3CLqyf6DhuvE4Ts8D8Izly
         O33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739807659; x=1740412459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDO5YZx4Fy+u/C4ZXeJopGsEViBSAueZJDksbUtV69k=;
        b=w7ccBfUkvfan/sVW7rZ9QHtwmql7DpfsFOkV6vHCs82J9DhvYzAbRxz24EJ141Id6p
         H4Xzj6jjKjAbffMcV7la1mDWSVT8pyxp6OT+jzDwQ4z8dEQ4ylEIKK6YD52nl80NDkQt
         wH2TBRDEUs4VWjI8LeKhq26ds2ikcdLIokFK3tmwCAm342BBAepoOen8hgkYIVz1NsqO
         In/zuootS9xZP8yUm4+5ssToerTRrsnS9oFrPKJ1dznZ4q4JMyBIZ78aZ7FFZ/1DJZDh
         wS9hVHxRbis3vQSE3lfCK4zixrUCub6JIaiDiixNZriq6lej/yflTtuE/DD3ZRxJvcho
         674Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0/Lf29Eqfzfm8Ou0I41m7/3J0b4WeFoa3+py7J/c0QZlf3fStW+c5hPxbjaL/Bqntri85XVfMt8BDYy589g==@lists.linux.dev, AJvYcCXxBing2ag1BPB2MwqxaqbcIaSEJbpOcC0FC8sUGXVrhsbJRE5QYFQSIoXUdP3MS6kba4S+@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9y7aPvFJPQDPf40ihhWzif4tCkgYGWpnR2sS1xEUsFQrfnNVL
	+Jc5WHHjbfMbWHTDTTOuKiRQTCPAS4KGtQmBDYi6Xv7V9MlOMjEf
X-Gm-Gg: ASbGncv5G+5/3NCRGIouHFj3xHFB2APGNIp9nS2As48E5e9S2inu2YmTGFGmR5u8JWX
	YLTcFaBAimuQlJktD/Ngf9yfkoQp8lGNkI1oOsH6zNw1Bc7+bwQ5jaxBM4Id/BtC7MxReD6IWkd
	sjbnQggUCQRMdhPym78YvXnI1hRNBj7xb2d9DyNKBj/M0uzgbKvHcHCyweGzJT6/TbkmSxoMNur
	wPRa1blefcHpL62+9y43MYEhBYPDNO5NML92viZjCu77OabSq3GrEvcU19dMQNqGBlH9Wzpfryz
	z9lrnouWzus1R74UkC+7TARcbrxk17o4sY6QWa99rOIy+YQUqXc=
X-Google-Smtp-Source: AGHT+IHqd28XIIuG5Er3mwFxc82h+BgBiuGtf4OTGFuqH4TGKTz37i6U1sgk+++M+71Yq2YGnIW5aw==
X-Received: by 2002:a05:620a:a48e:b0:7c0:a3bd:a78a with SMTP id af79cd13be357-7c0a3bda8f8mr207927185a.41.1739807659263;
        Mon, 17 Feb 2025 07:54:19 -0800 (PST)
Received: from glsmbp.wifi.local.cmu.edu (cmu-device2.nat.cmu.net. [128.2.149.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65dcf946asm53454326d6.125.2025.02.17.07.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 07:54:18 -0800 (PST)
Date: Mon, 17 Feb 2025 10:54:17 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Daniel Craviee <dcraviee@internships.antmicro.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [litex-hub:litex-rebase 10/15]
 drivers/mtd/spi-nor/litex-spiflash.c:305:15: error: incompatible function
 pointer types initializing 'int (*)(struct spi_nor *, u8, const u8 *,
 size_t)' (aka 'int (*)(struct spi_nor *, unsigned char, const unsigned char
 *, unsigned long)') with an express...
Message-ID: <Z7NbqdrXvBr6EIyg@glsmbp.wifi.local.cmu.edu>
References: <202502170711.tNK4CFp1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502170711.tNK4CFp1-lkp@intel.com>
X-Clacks-Overhead: GNU Terry Pratchett

Thanks for the heads-up!

On Mon, Feb 17, 2025 at 07:11:56AM +0800, kernel test robot wrote:
> tree:   https://github.com/litex-hub/linux litex-rebase
> head:   bfdc7246bec114e599ddb68ba442ce88172537ed
> commit: 7cbcc8cd508400e5b564e23a122126a13096c2f7 [10/15] LiteX: driver for SPI Flash (mtd) device
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250217/202502170711.tNK4CFp1-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502170711.tNK4CFp1-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502170711.tNK4CFp1-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/mtd/spi-nor/litex-spiflash.c:23:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:181:
>    In file included from arch/s390/include/asm/mmu_context.h:11:
>    In file included from arch/s390/include/asm/pgalloc.h:18:
>    In file included from include/linux/mm.h:2224:
>    include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>      504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      505 |                            item];
>          |                            ~~~~
>    include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>      511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      512 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>      524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      525 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/mtd/spi-nor/litex-spiflash.c:305:15: error: incompatible function pointer types initializing 'int (*)(struct spi_nor *, u8, const u8 *, size_t)' (aka 'int (*)(struct spi_nor *, unsigned char, const unsigned char *, unsigned long)') with an expression of type 'ssize_t (struct spi_nor *, u8, const u8 *, size_t)' (aka 'long (struct spi_nor *, unsigned char, const unsigned char *, unsigned long)') [-Wincompatible-function-pointer-types]
>      305 |         .write_reg = spi_flash_nor_write_reg,
>          |                      ^~~~~~~~~~~~~~~~~~~~~~~
>    3 warnings and 1 error generated.
> 
> 
> vim +305 drivers/mtd/spi-nor/litex-spiflash.c
> 
>    300	
>    301	static const struct spi_nor_controller_ops litex_spi_controller_ops = {
>    302		.read = spi_flash_nor_read,
>    303		.write = spi_flash_nor_write,
>    304		.read_reg = spi_flash_nor_read_reg,
>  > 305		.write_reg = spi_flash_nor_write_reg,
>    306		.erase = spi_flash_nor_erase,
>    307	};
>    308	

Fixed by s/ssize_t/int/ in the definition of spi_flash_nor_write_reg():

-static ssize_t spi_flash_nor_write_reg(struct spi_nor *nor, u8 opcode,
+static int spi_flash_nor_write_reg(struct spi_nor *nor, u8 opcode,

I will squash that change on top of the existing driver in a few days.

Thanks,
--Gabriel

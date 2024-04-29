Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0681118D;
	Mon, 29 Apr 2024 08:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714380063; cv=none; b=QjHW+popE0vhdcxaLYQqO+sckJ07ipSoi8t9n8q8yWTdeAMwyHwRaLXnMxmzixKTW1BN8pTd6bbvT+tL8snPWk3T+o1WyLsrFqM2es4w7i11jXTbnmcBBS0ncybh9eqiD8xoWAzwvNc9OL7CxXeKpeA55mfWAv6agveRcFTZX/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714380063; c=relaxed/simple;
	bh=unre3UQSoi1oDbF0KZNvP7kXfWhCHzjcnzE7tEfbB4E=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SPbCA9QwWtZk4ANOZwfn2A8jGRoI7i1cfQYNIIk9p/4mElkKkCDrGonlSv9DWt12Hab5kpG9de6+qyLe0ctG35ySOs1etF6/1t9CgRjCMMTxlzELFa/FzR2B5aVdGbHiiFQGBxojj/JdWHYKnp5Dojv9WadZCgF3nWsqL2jQeUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VScD84J7Sz6K6jQ;
	Mon, 29 Apr 2024 16:38:16 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id E575A1406AE;
	Mon, 29 Apr 2024 16:40:53 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 29 Apr
 2024 09:40:53 +0100
Date: Mon, 29 Apr 2024 09:40:54 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: kernel test robot <lkp@intel.com>
CC: Hans de Goede <hdegoede@redhat.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, <jic23@kernel.org>
Subject: Re: [jic23-iio:testing 6/16] drivers/iio/industrialio-acpi.c:29:
 warning: Function parameter or struct member 'orientation' not described in
 'iio_read_acpi_mount_matrix'
Message-ID: <20240429094054.000021d3@Huawei.com>
In-Reply-To: <202404290216.Uf6waaF1-lkp@intel.com>
References: <202404290216.Uf6waaF1-lkp@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Mon, 29 Apr 2024 02:53:19 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
> head:   383e66c0de06c77c053a899a9cbc4a9f0c9a5f65
> commit: 600b6de8062fe195d936971170fd9a57b6fcb57e [6/16] iio: core: Add iio_read_acpi_mount_matrix() helper function
> config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240429/202404290216.Uf6waaF1-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404290216.Uf6waaF1-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404290216.Uf6waaF1-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/iio/industrialio-acpi.c:29: warning: Function parameter or struct member 'orientation' not described in 'iio_read_acpi_mount_matrix'
> >> drivers/iio/industrialio-acpi.c:29: warning: Function parameter or struct member 'acpi_method' not described in 'iio_read_acpi_mount_matrix'
> >> drivers/iio/industrialio-acpi.c:29: warning: Excess function parameter 'matrix' description in 'iio_read_acpi_mount_matrix'
> >> drivers/iio/industrialio-acpi.c:29: warning: Excess function parameter 'method_name' description in 'iio_read_acpi_mount_matrix'  
> 
> 
> vim +29 drivers/iio/industrialio-acpi.c

I'll fix these up when I'm next on the right computer.

Thanks,

Jonathan


> 
>      8	
>      9	/**
>     10	 * iio_read_acpi_mount_matrix() - Read accelerometer mount matrix info from ACPI
>     11	 * @dev:		Device structure
>     12	 * @matrix: 		iio_mount_matrix struct to fill
>     13	 * @method_name:	ACPI method name to read the matrix from, usually "ROTM"
>     14	 *
>     15	 * Try to read the mount-matrix by calling the specified method on the device's
>     16	 * ACPI firmware-node. If the device has no ACPI firmware-node; or the method
>     17	 * does not exist then this will fail silently. This expects the method to
>     18	 * return data in the ACPI "ROTM" format defined by Microsoft:
>     19	 * https://learn.microsoft.com/en-us/windows-hardware/drivers/sensors/sensors-acpi-entries
>     20	 * This is a Microsoft extension and not part of the official ACPI spec.
>     21	 * The method name is configurable because some dual-accel setups define 2 mount
>     22	 * matrices in a single ACPI device using separate "ROMK" and "ROMS" methods.
>     23	 *
>     24	 * Returns: true if the matrix was successfully, false otherwise.
>     25	 */
>     26	bool iio_read_acpi_mount_matrix(struct device *dev,
>     27					struct iio_mount_matrix *orientation,
>     28					char *acpi_method)
>   > 29	{  
> 


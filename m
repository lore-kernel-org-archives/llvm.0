Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930E66A8A0;
	Sun, 28 Apr 2024 18:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714330424; cv=none; b=KU3aYYdODze6kfRq0PRz25OTTjNVgP2MSkOT3mRTQnifBe+vvnPVumt03rf4rWTRt3ds+wmQ4GCJwrBW5Z4gGBCDS7J+2orITy+O51v/c/kx4Huh3b2v6vGfv2/ADIJbTlX7kbdup5d2UY0NDyS5pfSNlTrAZy0nLxBZYgALs7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714330424; c=relaxed/simple;
	bh=fD6u24wbGgdRpvZdXPdyX7+NW4esNaI/DrCwtTCDGy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kD31ZDhDxNptn22TprE4Lqvt8+6keBA5RhGtDCTKHRg86V6DZc2GWm8heszmEgm+q72VRpZoABN14trPGJUzyFtWzFFDzadGv6UOSNyuydNLoSQILRefLS5+NeyoykZ6FjCo28pGz169zeMqXr2EIv9cbO2kjy7oz8qjeL9i8Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ayz2OlPA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ayz2OlPA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714330423; x=1745866423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fD6u24wbGgdRpvZdXPdyX7+NW4esNaI/DrCwtTCDGy4=;
  b=Ayz2OlPAs7SjKIohTGFQkhlJZiLGz4p6jQvoGysY9CUwuEIflRM/f/we
   4QnKDCvUqg6gWMcpI3gbSmLmB6DWLdC+m1c6huK8ylRsouLHy6G6hxMgY
   ww7Xamsac7GnOW94w780w0gyXh7ssWH5otn2UkgZk2LBQkzNCMxx5m5KC
   4i27xmRoqwu1xsTVlp4o/Q3uvgb87E2RiTMh2VNg8KNcHg88TCke6IxvM
   wu72efux47CYMm8cF2/d6p9AG3RlyOghzjRqHWMUFOiTjQy4HIo5GvEMi
   e2ii/IHuNAHmvcm1E4ZU8C7B+cKdDLG8gieZ/kLWA/HvOoIdko6ttYxER
   w==;
X-CSE-ConnectionGUID: xjzmXnyWTR2fL5AOzJ1NJg==
X-CSE-MsgGUID: S1Pxj7oDTYCaQ2yYHKffqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13822170"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="13822170"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 11:53:43 -0700
X-CSE-ConnectionGUID: Et21aqYNRKepEItFRn48AQ==
X-CSE-MsgGUID: FB7Kpu1cS+qiA5r+TUtbRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="56812412"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Apr 2024 11:53:41 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s19ec-0006Z8-0Y;
	Sun, 28 Apr 2024 18:53:38 +0000
Date: Mon, 29 Apr 2024 02:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 6/16] drivers/iio/industrialio-acpi.c:29:
 warning: Function parameter or struct member 'orientation' not described in
 'iio_read_acpi_mount_matrix'
Message-ID: <202404290216.Uf6waaF1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   383e66c0de06c77c053a899a9cbc4a9f0c9a5f65
commit: 600b6de8062fe195d936971170fd9a57b6fcb57e [6/16] iio: core: Add iio_read_acpi_mount_matrix() helper function
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240429/202404290216.Uf6waaF1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404290216.Uf6waaF1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404290216.Uf6waaF1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/industrialio-acpi.c:29: warning: Function parameter or struct member 'orientation' not described in 'iio_read_acpi_mount_matrix'
>> drivers/iio/industrialio-acpi.c:29: warning: Function parameter or struct member 'acpi_method' not described in 'iio_read_acpi_mount_matrix'
>> drivers/iio/industrialio-acpi.c:29: warning: Excess function parameter 'matrix' description in 'iio_read_acpi_mount_matrix'
>> drivers/iio/industrialio-acpi.c:29: warning: Excess function parameter 'method_name' description in 'iio_read_acpi_mount_matrix'


vim +29 drivers/iio/industrialio-acpi.c

     8	
     9	/**
    10	 * iio_read_acpi_mount_matrix() - Read accelerometer mount matrix info from ACPI
    11	 * @dev:		Device structure
    12	 * @matrix: 		iio_mount_matrix struct to fill
    13	 * @method_name:	ACPI method name to read the matrix from, usually "ROTM"
    14	 *
    15	 * Try to read the mount-matrix by calling the specified method on the device's
    16	 * ACPI firmware-node. If the device has no ACPI firmware-node; or the method
    17	 * does not exist then this will fail silently. This expects the method to
    18	 * return data in the ACPI "ROTM" format defined by Microsoft:
    19	 * https://learn.microsoft.com/en-us/windows-hardware/drivers/sensors/sensors-acpi-entries
    20	 * This is a Microsoft extension and not part of the official ACPI spec.
    21	 * The method name is configurable because some dual-accel setups define 2 mount
    22	 * matrices in a single ACPI device using separate "ROMK" and "ROMS" methods.
    23	 *
    24	 * Returns: true if the matrix was successfully, false otherwise.
    25	 */
    26	bool iio_read_acpi_mount_matrix(struct device *dev,
    27					struct iio_mount_matrix *orientation,
    28					char *acpi_method)
  > 29	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

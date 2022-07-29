Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121AA3D81
	for <llvm@lists.linux.dev>; Fri, 29 Jul 2022 08:23:24 +0000 (UTC)
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LvKhZ6bCgzjXYf;
	Fri, 29 Jul 2022 16:01:02 +0800 (CST)
Received: from dggpeml500007.china.huawei.com (7.185.36.75) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Jul 2022 16:03:58 +0800
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 dggpeml500007.china.huawei.com (7.185.36.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Jul 2022 16:03:57 +0800
Received: from lhrpeml500005.china.huawei.com ([7.191.163.240]) by
 lhrpeml500005.china.huawei.com ([7.191.163.240]) with mapi id 15.01.2375.024;
 Fri, 29 Jul 2022 09:03:56 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: kernel test robot <lkp@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>, "kbuild-all@lists.01.org"
	<kbuild-all@lists.01.org>, Linux Memory Management List <linux-mm@kvack.org>,
	Joerg Roedel <jroedel@suse.de>, "Guohanjun (Hanjun Guo)"
	<guohanjun@huawei.com>, renzhijie <renzhijie2@huawei.com>
Subject: RE: [linux-next:master 6932/13542] drivers/acpi/arm64/iort.c:1406:2:
 error: call to undeclared function 'iort_iommu_rmr_get_resv_regions'; ISO C99
 and later do not support implicit function declarations
Thread-Topic: [linux-next:master 6932/13542] drivers/acpi/arm64/iort.c:1406:2:
 error: call to undeclared function 'iort_iommu_rmr_get_resv_regions'; ISO C99
 and later do not support implicit function declarations
Thread-Index: AQHYoww8bwRbRgf4uU+hXz2p747Xnq2U/Cog
Date: Fri, 29 Jul 2022 08:03:55 +0000
Message-ID: <ec268257e569453ea7eb7339960728b3@huawei.com>
References: <202207291335.1sImjcbY-lkp@intel.com>
In-Reply-To: <202207291335.1sImjcbY-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.202.227.178]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-CFilter-Loop: Reflected



> -----Original Message-----
> From: kernel test robot [mailto:lkp@intel.com]
> Sent: 29 July 2022 06:29
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: llvm@lists.linux.dev; kbuild-all@lists.01.org; Linux Memory Managemen=
t
> List <linux-mm@kvack.org>; Joerg Roedel <jroedel@suse.de>; Guohanjun
> (Hanjun Guo) <guohanjun@huawei.com>
> Subject: [linux-next:master 6932/13542] drivers/acpi/arm64/iort.c:1406:2:
> error: call to undeclared function 'iort_iommu_rmr_get_resv_regions'; ISO
> C99 and later do not support implicit function declarations
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
> master
> head:   7c5e07b73ff3011c9b82d4a3286a3362b951ad2b
> commit: e302eea8f49717253ac64fd45b7cc719e87fa010 [6932/13542]
> ACPI/IORT: Add a helper to retrieve RMR info directly
> config: arm64-buildonly-randconfig-r005-20220728
> (https://download.01.org/0day-ci/archive/20220729/202207291335.1sImjc
> bY-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project
> 8dfaecc4c24494337933aff9d9166486ca0949f1)
> reproduce (this is a W=3D1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         #
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/
> ?id=3De302eea8f49717253ac64fd45b7cc719e87fa010
>         git remote add linux-next
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout e302eea8f49717253ac64fd45b7cc719e87fa010
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang
> make.cross W=3D1 O=3Dbuild_dir ARCH=3Darm64 SHELL=3D/bin/bash drivers/acp=
i/
>=20
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
> >> drivers/acpi/arm64/iort.c:1406:2: error: call to undeclared function
> 'iort_iommu_rmr_get_resv_regions'; ISO C99 and later do not support
> implicit function declarations [-Wimplicit-function-declaration]
>            iort_iommu_rmr_get_resv_regions(iommu_fwnode, NULL,
> head);
>            ^
>    drivers/acpi/arm64/iort.c:1406:2: note: did you mean
> 'iort_iommu_get_resv_regions'?
>    drivers/acpi/arm64/iort.c:1329:6: note: 'iort_iommu_get_resv_regions'
> declared here
>    void iort_iommu_get_resv_regions(struct device *dev, struct list_head
> *head)
>         ^
>    1 error generated.

Right. This is already reported and a fix is provided by Zhijie here,

https://lore.kernel.org/linux-arm-kernel/20220726033520.47865-1-renzhijie2@=
huawei.com/

Thanks,
Shameer

=20
>=20
> vim +/iort_iommu_rmr_get_resv_regions +1406 drivers/acpi/arm64/iort.c
>=20
>   1396
>   1397	/**
>   1398	 * iort_get_rmr_sids - Retrieve IORT RMR node reserved regions
> with
>   1399	 *                     associated StreamIDs information.
>   1400	 * @iommu_fwnode: fwnode associated with IOMMU
>   1401	 * @head: Resereved region list
>   1402	 */
>   1403	void iort_get_rmr_sids(struct fwnode_handle *iommu_fwnode,
>   1404			       struct list_head *head)
>   1405	{
> > 1406		iort_iommu_rmr_get_resv_regions(iommu_fwnode, NULL,
> head);
>   1407	}
>   1408	EXPORT_SYMBOL_GPL(iort_get_rmr_sids);
>   1409
>=20
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp

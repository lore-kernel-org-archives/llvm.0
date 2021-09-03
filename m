Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB30C72
	for <llvm@lists.linux.dev>; Fri,  3 Sep 2021 08:54:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="206591124"
X-IronPort-AV: E=Sophos;i="5.85,264,1624345200"; 
   d="scan'208";a="206591124"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2021 01:54:39 -0700
X-IronPort-AV: E=Sophos;i="5.85,264,1624345200"; 
   d="scan'208";a="543421460"
Received: from silpixa00400314.ir.intel.com (HELO silpixa00400314) ([10.237.222.51])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2021 01:54:36 -0700
Date: Fri, 3 Sep 2021 09:54:30 +0100
From: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Fiona Trahe <fiona.trahe@intel.com>,
	Wojciech Ziemba <wojciech.ziemba@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: drivers/crypto/qat/qat_dh895xcc/adf_dh895xcc_hw_data.c:229:28:
 warning: taking address of packed member 'csr_ops' of class or structure
 'adf_hw_device_data' may result in an unaligned pointer value
Message-ID: <YTHixlBTl5/uVPtd@silpixa00400314>
References: <202109031540.4K5y259V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202109031540.4K5y259V-lkp@intel.com>
Organization: Intel Research and Development Ireland Ltd - Co. Reg. #308263 -
 Collinstown Industrial Park, Leixlip, County Kildare - Ireland

On Fri, Sep 03, 2021 at 03:26:45PM +0800, kernel test robot wrote:
> >> drivers/crypto/qat/qat_dh895xcc/adf_dh895xcc_hw_data.c:229:28: warning: taking address of packed member 'csr_ops' of class or structure 'adf_hw_device_data' may result in an unaligned pointer value [-Waddress-of-packed-member]
>            adf_gen2_init_hw_csr_ops(&hw_data->csr_ops);
>                                      ^~~~~~~~~~~~~~~~
>    3 warnings generated.
I already sent a fix to resolve such warnings:
https://patchwork.kernel.org/project/linux-crypto/patch/20210902083459.238983-1-giovanni.cabiddu@intel.com/

Regards,

-- 
Giovanni

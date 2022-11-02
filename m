Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEB47C
	for <llvm@lists.linux.dev>; Wed,  2 Nov 2022 07:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1667374516; x=1698910516;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gN0he4TZL938QunkKSJatD4ko7UmrpUeuZcG3bRDpUQ=;
  b=SDV3Z1vGZ/xK9sgr7SaQrrjZ9niIOhMzLx22dbV+1Ix67bDDSjjxw+lE
   jqJ8+gcP6JUh6Mjza/IkkO0d8wAsaV6eJqQrL3MBYNxqwI8zalJ2G9RAy
   epr2L/Ifz8w84RnNCfQ2CVPHRHaNAuqbwXn0FnDa4MLlOoE+GE+big3lG
   OT1fjsqKrlbWWXqAuJNZv0o+iNZsWel7sTVKYbxxuKaY/RoSoBFUpo8bu
   yqgt5yGI2tEY1Na2tLlucmDNgwJWHjHYdORM0gOtEyznFf1TO+l3Nyugw
   3DkqAUf/VvgADECDn/gmwacB4Ix9h2HeYrWvDoOOmIQnvevFjNTWBqJTS
   w==;
X-IronPort-AV: E=Sophos;i="5.95,232,1661788800"; 
   d="scan'208";a="215292706"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 02 Nov 2022 15:34:07 +0800
IronPort-SDR: Z+AVJ069C6PAiCL5V1CT5xtS7qwYwW4pqqUTN3aE+Fhf9Wnihlw99oephhG3t3xpPJUAw5U0w7
 GzbXC6iozHYfJp86kYTx9oD05vPhqofSdwusBYE0uaoJXP1GHxRTO2yFEWhEw3J+qFm1/0Lfmf
 iBZ8UctpK5BtHoogmtcwlnK+mb5qey/UoFFf4YkO8dIal4KYt/wzdzAoqMGn7cWxMoF/CSVxSi
 lp+j289sUhiitCOKmu7imZs0qqxZ2Z674i2MWbe72JyEigdKmjYiKalRVGeavCmE2A8s+oD7vO
 y/tjfbriVo4vDL17aFBF9VVF
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Nov 2022 23:47:36 -0700
IronPort-SDR: U5IdSczxd7p6Ph5s1hWUhW6bZvN5MibHcXQEWYhJ1jLgoD7gGnn1qUrzvyfS8vrc9fyY5Ps/lp
 PFG8XDsadhpOPXVA8fLZo5J9ReC+1hHh24cYXKgwd5iIEw/rjo6qaX9IGvcODllN8dMYryKKmQ
 jmuoGO/GHIzDPfYQgIPalXMOiAaMo/53lId4EwXqeVMTIzs+WasooAJX0fjDnmmTjm79OWnQ/S
 LBQ9OiQ4WpvWjE8X2BOC2wku4XmKDIKcS3hvkcfAS00OcdBT8jY7tKLtnf5NnnbgwEu/052/hx
 k0Q=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Nov 2022 00:34:07 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4N2JYC2SGxz1RwqL
	for <llvm@lists.linux.dev>; Wed,  2 Nov 2022 00:34:07 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1667374446; x=1669966447; bh=gN0he4TZL938QunkKSJatD4ko7UmrpUeuZc
	G3bRDpUQ=; b=VYeUnqnkUJ3f1IzDH3YyFtApmR8uZeVgq9y3kL/hVws6kcSxCq/
	GWTyYl0h7dinNEXS50D8r5aMRZb4I0gvjQsiL3Y7jv0bPk8j5Ya6cp+8aNfiHHCe
	82Yryvbm/I1BdKw2dvnUSf1FssQzBTQNcr0hSLWvz6Rh8dVxn/zyVkWcLVtG3Faz
	XaPu82fHYSO8Yww66pjeBQK/GEJSQL8eUOYZYvtMSwQGJWlsuoS3SQ5xnmZ+R/O2
	8Dsi9D3Jr7UHNyfGps4ROp8P914RM2fKdTXSZVhqGEdeXzvSISJHf14H+RXzEQpQ
	BBtd6M238tmmOkLRf58VtLG3uzRuzjebAiA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id AKnZidYpsoDX for <llvm@lists.linux.dev>;
	Wed,  2 Nov 2022 00:34:06 -0700 (PDT)
Received: from [10.225.163.24] (unknown [10.225.163.24])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4N2JY962hkz1RvLy;
	Wed,  2 Nov 2022 00:34:05 -0700 (PDT)
Message-ID: <c48606df-7956-2a28-8114-64ab46a04d05@opensource.wdc.com>
Date: Wed, 2 Nov 2022 16:34:04 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] ata: pata_legacy: fix pdc20230_set_piomode()
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev
References: <99d91d0e-d3fc-5492-ddca-6da6e65e1e89@omp.ru>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <99d91d0e-d3fc-5492-ddca-6da6e65e1e89@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/22 06:07, Sergey Shtylyov wrote:
> Clang gives a warning when compiling pata_legacy.c with 'make W=1' about
> the 'rt' local variable in pdc20230_set_piomode() being set but unused.
> Quite obviously, there is an outb() call missing to write back the updated
> variable. Moreover, checking the docs by Petr Soucek revealed that bitwise
> AND should have been done with a negated timing mask and the master/slave
> timing masks were swapped while updating...
> 
> Fixes: 669a5db411d8 ("[libata] Add a bunch of PATA drivers.")
> Reported-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Applied to for-6.1-fixes. Thanks !

> 
> ---
>  drivers/ata/pata_legacy.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> Index: libata/drivers/ata/pata_legacy.c
> ===================================================================
> --- libata.orig/drivers/ata/pata_legacy.c
> +++ libata/drivers/ata/pata_legacy.c
> @@ -315,9 +315,10 @@ static void pdc20230_set_piomode(struct
>  	outb(inb(0x1F4) & 0x07, 0x1F4);
>  
>  	rt = inb(0x1F3);
> -	rt &= 0x07 << (3 * adev->devno);
> +	rt &= ~(0x07 << (3 * !adev->devno));
>  	if (pio)
> -		rt |= (1 + 3 * pio) << (3 * adev->devno);
> +		rt |= (1 + 3 * pio) << (3 * !adev->devno);
> +	outb(rt, 0x1F3);
>  
>  	udelay(100);
>  	outb(inb(0x1F2) | 0x01, 0x1F2);

-- 
Damien Le Moal
Western Digital Research


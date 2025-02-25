Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AF121ABDF;
	Tue, 25 Feb 2025 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.37.142.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740521754; cv=none; b=D8D0XJm4QoRDaDmmQD0LFODFz6xRPlBL869yxaFw+fRp4cmg4dRxqco2uJnXX/zzUzQ+OLF/iune1QYoRjaYhJd4bUkrgNvd39IT8xYhBHj84BVkUCldnGYKFFr82ClUgHhVRpsmLkDkigpaXJOB44CLhQrMktO9wqJ/O0JbYZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740521754; c=relaxed/simple;
	bh=LWF1Qoi+l0atBT5XBQ0mprPmATw3oZmkAQNj3Gm/eiU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NU3QR6CnYc5UTQC2hLviFjsoNA08Rf76w7yGgPNi5Siqj4TUkmnHa8rTX1l0AZcoI31q76CtnzMeG/Qx76D+luNbfZ7lf2rzVLYiWHulm5A6U5lnTbE5RNGrWrXV00Me5pK60ElHYXbKwUNn62IPtrSz9qDGtR2aajfdxnQRkSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b=DI8AFe+i; arc=none smtp.client-ip=173.37.142.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b="DI8AFe+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1318; q=dns/txt;
  s=iport01; t=1740521752; x=1741731352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jf6mMosGEGxaXP0O+VMHwwdnYCC/RH9RmvxAgowUYOU=;
  b=DI8AFe+iXkETXtpL7fVT0f3yuZd9LWF6BCoKglkUNzkzKM+A9FEFTpIE
   gOg5r9xO2l3X+Wn0AsxBxZ6jndibfN3SqB8uDwO048OLRJbOTx9aux7qq
   1YjahF/N/s9BrsyrZBNb/cVJVxD7mW0Hxbk94kt09cdC84anr/oZ0LIc3
   fblQQeaNohOVPqlEKZW1z/XtivMnrTAH5B4zl9N7k1JecDNZ73m/NRG6P
   vJdQnmrNKxKFQJHAbC28QHomdV3Xp9sHuzqFYRUev6TjgmEHEcgfh+yCg
   fJTwNmprHEO02rGEC9luMEvnd622n9D+YB1A/GctAIICLtgSB1pOs+AX/
   g==;
X-CSE-ConnectionGUID: 3RunSuWrTmGmSXFfcivgSw==
X-CSE-MsgGUID: QXM8w5gIRKKM1AQWBGkIkg==
X-IPAS-Result: =?us-ascii?q?A0AFAABrQL5n/4v/Ja1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQGCAAMBAQEBAQsBgkp2WUNIBI1NiHQDmDiFXIElA1YPA?=
 =?us-ascii?q?QEBDzsJBAEBhQcCixECJjUIDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4ThXsNhlsBAQEDMgFGECMjCysrGYMCAYJkAxGvBIIsgQHeNIFoB?=
 =?us-ascii?q?oFIAYVrh19whHcnG4FJRIR9hRCFdwSCL0qBJIM+p3BIgSEDWSwBVRMNCgsHB?=
 =?us-ascii?q?YFxAzUMCy4VgUZDN4JFaUk6Ag0CNYIefIIrhFSEQ1wvAwMDA4MqhVKCEYILi?=
 =?us-ascii?q?TKEEEADCxgNSBEsNxQbBj5uB6AtATyEPHsTLIITAR2lV6EEhCWBY4o1lTAaM?=
 =?us-ascii?q?6pVLodlkGqOBZZFhGaBaQE5gVkzGggbFYMiEz8ZD45ZiFXGayUyAgE5AgcLA?=
 =?us-ascii?q?QEDCZFlAQE?=
IronPort-Data: A9a23:5LqiDqv+AUVl+tviezvc5reOS+fnVCxfMUV32f8akzHdYApBsoF/q
 tZmKT3QbPncZDP0e9Elaoiw9UpS68LVy9UyGwA9qS1mEC5HgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav656yEhjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuGYzdJ5xYuajhJs/jZ9Us11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwodxqB1pTy
 uYkLR8IVSCtiem33r2AVbw57igjBJGD0II3oHpsy3TdSP0hW52GG/+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwxGYH49tL/Aan3XcTpYrl6coacf6GnIxws327/oWDbQUoDRHp4FwBzE9
 goq+UzAMjRKK4GQ6ACm0Vf1r9bwtwz4eYEdQejQGvlCxQf7KnYoIBkVTXO6p+W0jgi1XNc3A
 08J8CMGrqUo8kGvCN7nUHWQpHqauzYYWsFMCKs+6QeQ2uzY7hjxLm8JCz1Ldd0iuIo/QTgC0
 l6Sg8ivAT1pra3TRX+Dnop4thuoMiQTaGtHbigeQE5duZ/ooZo4iVTESdML/LOJs+AZ0ArYm
 1iixBXSTZ1K5SLX/81XJWz6vg8=
IronPort-HdrOrdr: A9a23:jE0u0K1akGl6bwm73g6s6AqjBLUkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7N5ZwQt7eC3OF+eOxQpuW6zA==
X-Talos-CUID: 9a23:16CI6G/mlxt1ByKjSWSVvxUuB8Yeb0LH8HL/JnSIJ2hiSaOackDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A5mjIvQ2w93GAvWB+sdcxfNf34zUj2pSLWF9QnrQ?=
 =?us-ascii?q?8mOqhbAVJBB2yjxW0Tdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.13,314,1732579200"; 
   d="scan'208";a="433386248"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Feb 2025 22:14:42 +0000
Received: from cisco.com (savbu-usnic-a.cisco.com [10.193.184.48])
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTP id BA70E18000224;
	Tue, 25 Feb 2025 22:14:42 +0000 (GMT)
Received: by cisco.com (Postfix, from userid 392789)
	id 7D55720F2003; Tue, 25 Feb 2025 14:14:42 -0800 (PST)
From: John Daley <johndale@cisco.com>
To: lkp@intel.com
Cc: johndale@cisco.com,
	kuba@kernel.org,
	llvm@lists.linux.dev,
	neescoba@cisco.com,
	oe-kbuild-all@lists.linux.dev,
	satishkh@cisco.com
Subject: [linux-next:master 1515/5164] ERROR: modpost: "page_pool_create" [drivers/net/ethernet/cisco/enic/enic.ko] undefined!
Date: Tue, 25 Feb 2025 14:14:42 -0800
Message-Id: <20250225221442.32484-1-johndale@cisco.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <202502211253.3XRosM9I-lkp@intel.com>
References: <202502211253.3XRosM9I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.193.184.48, savbu-usnic-a.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com

On 2/24/25, 7:17 PM, "Joe Damato" jdamato@fastly.com wrote:

>On Mon, Feb 24, 2025 at 03:43:50PM -0800, John Daley wrote:
>> Driver was not configured to select page_pool, causing a compile error
>> if page pool module was not already selected.
>> 
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202502211253.3XRosM9I-lkp@intel.com/
>> Fixes: d24cb52b2d8a ("enic: Use the Page Pool API for RX")
>> Reviewed-by: Nelson Escobar <neescoba@cisco.com>
>> Signed-off-by: John Daley <johndale@cisco.com>
>> ---
>>  drivers/net/ethernet/cisco/enic/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>
>Hrm. This is a fixes, so normally the subject line should probably
>be "PATCH net" instead of "PATCH net-next" and stable would be CC'd
>- however - it looks like the commit it fixes is only in net-next.
>
>So, CC-ing stable is probably unnecessary ?

Yes, it was a simple fix to code recently submitted to net-next which
the test bot caught. Since net-next has not been merged to net yet,
no need to CC stable. Perhaps the 'fixes' line was overkill and
confusing.
>
>At any rate, I'd probably skip the cover letter for a simple patch
>like this in the future.
>
>Reviewed-by: Joe Damato <jdamato@fastly.com>

Thanks for the pro tip and review.

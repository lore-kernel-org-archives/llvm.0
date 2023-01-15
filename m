Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D7210E3;
	Sun, 15 Jan 2023 09:04:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1673773494; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AmzXI6b8qgVZOwLvmFpg1CGovdGoHPt38QDPf/2sfFaXKLxZLCtiFzgInftd0yP02nn1m1fDWFQWKPfxlR5wY6Mvf7xUBIiJhCGBUiENjfQTphkzlW8XvB97ts+lQF3nSzuPO+NqdWLCRMxEE1dDJBJisBRz5po3gZpIr+0cLFM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1673773494; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=EIjF519VUNxp2p+L4/Qs1xxg+pqGRAwgSE/EzT6jHeQ=; 
	b=Lyr6i94pJS0n46jxVscZQXdBWZYdZWwzsNFsiCmozYbofvRRsbBRFXvUv09cBNuMQRo7hZPjlfZ5ExGdo1JOJvuXbJirxp1nH+hG+S0RSmecJNhRR9oqEGPL622T6hI9NkCH6oYLp0C2n18P9ydoAS+kjTzR3vVwtnmM++tdsbE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1673773494;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=EIjF519VUNxp2p+L4/Qs1xxg+pqGRAwgSE/EzT6jHeQ=;
	b=ej9sbR/lSJ1YX/iI9qnx2XFmZ2agpJOcopiD1H/kBU4hd+9I5tSDWCzTV5Wn5Pv6
	1j7b2LTcBHaww55fsxHstL2Orakto8vdeg5AGh0Zw6TOrm9UFMPQqfvEhTQFa/KYqTt
	+lfzWSDsxlM5Ki/XC376wy8RFFf4eha71O0aZddU=
Received: from [10.10.10.218] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1673773493724771.5087939177589; Sun, 15 Jan 2023 01:04:53 -0800 (PST)
Message-ID: <aa73cfb8-99ed-20b4-071c-9858399aee0a@arinc9.com>
Date: Sun, 15 Jan 2023 12:04:50 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [stable:linux-5.15.y 1642/9999] ERROR: Input tree has errors,
 aborting (use -f to force output)
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Sasha Levin <sashal@kernel.org>
References: <202301150959.RAvfuBjG-lkp@intel.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <202301150959.RAvfuBjG-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Sergio, this issue hasn't seem to gone away. If you haven't sent the 
patch you mentioned here [1], I think Greg taking your upstream commit 
[2] to 5.15.y tree would be the easiest solution.

[1]: 
https://lore.kernel.org/all/CAMhs-H8BLheXBc+BcDH_PKmDg+_bWF9OmiS_grw1mO+RxW+J8Q@mail.gmail.com/
[2]: 
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/drivers/staging/mt7621-dts/mt7621.dtsi?id=ce835dbd04d7b24f9fd50d9a9c59be46304aaa8a

Arınç

Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9907B802
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 01:09:36 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220525010417epoutp04e04fc366efd3163092c0aaf7d06f2d92~yM4SFc-n30405804058epoutp04F
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 01:04:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220525010417epoutp04e04fc366efd3163092c0aaf7d06f2d92~yM4SFc-n30405804058epoutp04F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1653440657;
	bh=+7KRVcFFS2MUkrhVo1iofF4jLfxUy8ysN0IKLb9SSTI=;
	h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
	b=ESiUL7jN8KfGvpdl0jLtRtPhaxK4M4v0iEky4olHLATAPpx/YlFAhmLF9LZBjEC41
	 WS3020lBt7vKov4oDJA23w4HCHEH6wif0WL8B30IpnjTtOWNEAx0L9R6//vJBt4iy9
	 odogc1GcfcLl8wneZ2oY3rBgujof+/AzFwTJKJ5c=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTP id
	20220525010416epcas1p49ba5af7bdd43f67c98a40a1d94e81fc0~yM4RjE3mo2684126841epcas1p4z;
	Wed, 25 May 2022 01:04:16 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.38.234]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4L7CWg056Mz4x9Pw; Wed, 25 May
	2022 01:04:15 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
	epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
	EC.B3.09935.E808D826; Wed, 25 May 2022 10:04:14 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20220525010414epcas1p1c3d78bd5edd1573cb4b55f14e3d2a0a1~yM4PVzJt42209622096epcas1p1a;
	Wed, 25 May 2022 01:04:14 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20220525010414epsmtrp2db581aaf44715b5817d6d9e3d27775d7~yM4PUbaqh0270202702epsmtrp28;
	Wed, 25 May 2022 01:04:14 +0000 (GMT)
X-AuditID: b6c32a39-f4dff700000026cf-15-628d808ec6f0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	0B.78.11276.E808D826; Wed, 25 May 2022 10:04:14 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20220525010414epsmtip2509e88f073ceff25dae4946bea767b04~yM4PJlRi71323813238epsmtip2s;
	Wed, 25 May 2022 01:04:14 +0000 (GMT)
Subject: Re: [linux-next:master 9269/14079] ld.lld: error: undefined symbol:
 rockchip_pmu_block
To: kernel test robot <lkp@intel.com>, Brian Norris
	<briannorris@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, Linux Memory Management
	List <linux-mm@kvack.org>, Douglas Anderson <dianders@chromium.org>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <18b1bfe6-d844-d2c2-fc5e-40248aaf72be@samsung.com>
Date: Wed, 25 May 2022 10:04:14 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
	Thunderbird/59.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202205241931.GbIyyVs2-lkp@intel.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmrm5fQ2+Swam15habPr5ntTi77CCb
	xdnua4wW99b8Z7V41fyIzeLJlP1sDmwesxsusngs3vOSyWPTp0nsHt2z/7F4vNg8kzGANSrb
	JiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoBCWFssSc
	UqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgWmBXnFibnFpXrpeXmqJlaGBgZEpUGFCdsbj
	/lWMBR9EKyZf38TSwPheqIuRk0NCwESid+dspi5GLg4hgR2MEsvm3WEBSQgJfGKUaD1jCJH4
	xigx798ORpiO82/6oTr2Mkr0LrsG5bxnlHg+YRY7SJWwQKLElknH2EBsEYEAiac397OBFDEL
	TGCUaJ/UwASSYBPQktj/4gZYEb+AosTVH4/BVvAK2Ek87v7JCmKzCKhKbHr9CiwuKhAmcXJb
	C1SNoMTJmU/AbuUUMJJo37sGbDGzgLjErSfzmSBseYntb+cwgyyWEJjJIXH15FZ2iB9cJDp2
	HISyhSVeHd8CZUtJfH63lw2ioZlRouHFbUYIp4dR4uizPhaIKmOJ/UsnA63gAFqhKbF+lz5E
	WFFi5++5jBCb+STefe1hBSmREOCV6GiDhrayxOUHd5kgbEmJxe2dbBMYlWYh+WcWkh9mIflh
	FsKyBYwsqxjFUguKc9NTiw0LTOHxnZyfu4kRnEC1LHcwTn/7Qe8QIxMH4yFGCQ5mJRHelLCe
	JCHelMTKqtSi/Pii0pzU4kOMpsAQnsgsJZqcD0zheSXxhiaWBiZmRsYmFoZmhkrivKumnU4U
	EkhPLEnNTk0tSC2C6WPi4JRqYNqY1fluQrvnMac077tHvL2iylqztLuWr5y9suni9JSF/NW3
	rVw5atJPebE6pxw7OSPyffp029SwP9smfBdQ6ty+ZflXZ0fdjVMEn2/ZZTPXrEFk8yaPyMO8
	zCrl1yfK3l0gKMPb07T3q6fI483PHsSKfuVRF21b3t/Nxrld0ebzq/BVXnw+27WbYtP15GPl
	yyIuZl9irxZb937BdONJBX+Fl3QXXez4JLijWmXllH6Hia8qf6v/tded8/+B8NRpix6e3b7p
	3r4t9SF6774k8HA7Gcy/ddZW+Z/dWlPfitjkBw7VH+SniUQ1M720rWZ87nWcyVrMxizUUmrG
	HJm//lpuzDeepvPH3FV5K/W2SomlOCPRUIu5qDgRAOmnuz0pBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSvG5fQ2+SwfIJ0habPr5ntTi77CCb
	xdnua4wW99b8Z7V41fyIzeLJlP1sDmwesxsusngs3vOSyWPTp0nsHt2z/7F4vNg8kzGANYrL
	JiU1J7MstUjfLoEr43H/KsaCD6IVk69vYmlgfC/UxcjJISFgInH+TT9TFyMXh5DAbkaJvtvH
	mSESkhLTLh4FsjmAbGGJw4eLQcJCAm8ZJR5fYAOxhQUSJbZMOgZmiwj4SVw4eIkdZA6zwCRG
	iXW/z7BADG1llJgy8Q47SBWbgJbE/hc3wDr4BRQlrv54zAhi8wrYSTzu/skKYrMIqEpsev0K
	LC4qECaxc8ljJogaQYmTM5+wgNicAkYS7XvXgM1kFlCX+DPvEjOELS5x68l8JghbXmL72znM
	ExiFZyFpn4WkZRaSlllIWhYwsqxilEwtKM5Nzy02LDDMSy3XK07MLS7NS9dLzs/dxAiOIy3N
	HYzbV33QO8TIxMF4iFGCg1lJhDclrCdJiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLp
	iSWp2ampBalFMFkmDk6pBqaS6jsP3rCseBvel7l68aL3bpt0mTRfrn/SNosr8G6U36vayFme
	4QeU94n/d+KWjPry3n/L6i1Jgo9Lqx+ZPnvHfGSacondpJ3Rx1gEZ+RKCq34ofKyJTx61fVs
	91gJwXczOQrvrP5/f619buieWYoHNVgkTleaRpbffmOlqa5eGTqF+5ealMm3/S8qy166/zn9
	SM/xP2vE3c43Ol2SzVOPHLiVM0fXr8xTQfTZvrXvrjwzP5Sa1Lb7urTZIT0OHt6LKQfP54U7
	pawoYAryO+N8f2rlpPILV32OfbifuTHu2i7ekmXvly/h5NVu/8/0J+aI502rmZ8Pfvl/RsnD
	yNwn+zFTj4x4RE+r7aEOzzAlluKMREMt5qLiRADO4nwVEgMAAA==
X-CMS-MailID: 20220525010414epcas1p1c3d78bd5edd1573cb4b55f14e3d2a0a1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220524114954epcas1p416e486dce031a941263b13120e717d72
References: <CGME20220524114954epcas1p416e486dce031a941263b13120e717d72@epcas1p4.samsung.com>
	<202205241931.GbIyyVs2-lkp@intel.com>

Hi Brian,

How can fix this build issue? 
Should I add the ARCH_ROCKCHIP dependency to rk3399_dmc.c?


On 5/24/22 8:49 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   09ce5091ff971cdbfd67ad84dc561ea27f10d67a
> commit: 2e691421a2c9e0462175fe98171afa632861b199 [9269/14079] PM / devfreq: rk3399_dmc: Block PMU during transitions
> config: arm64-randconfig-r006-20220524 (https://protect2.fireeye.com/v1/url?k=d0aebf16-b1d51581-d0af3459-74fe4860001d-afa265d9beca802e&q=1&e=5a47bbdc-1a5f-45df-a343-9f76a9f3e3c8&u=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20220524%2F202205241931.GbIyyVs2-lkp%40intel.com%2Fconfig)
> compiler: clang version 15.0.0 (https://protect2.fireeye.com/v1/url?k=207af339-410159ae-207b7876-74fe4860001d-c3c991f126566568&q=1&e=5a47bbdc-1a5f-45df-a343-9f76a9f3e3c8&u=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project 10c9ecce9f6096e18222a331c5e7d085bd813f75)
> reproduce (this is a W=1 build):
>         wget https://protect2.fireeye.com/v1/url?k=e74a1a4c-8631b0db-e74b9103-74fe4860001d-3ba2876fc53e7fc8&q=1&e=5a47bbdc-1a5f-45df-a343-9f76a9f3e3c8&u=https%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2e691421a2c9e0462175fe98171afa632861b199
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 2e691421a2c9e0462175fe98171afa632861b199
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> Note: the linux-next/master HEAD 09ce5091ff971cdbfd67ad84dc561ea27f10d67a builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
>>> ld.lld: error: undefined symbol: rockchip_pmu_block
>    >>> referenced by rk3399_dmc.c:101 (drivers/devfreq/rk3399_dmc.c:101)
>    >>> devfreq/rk3399_dmc.o:(rk3399_dmcfreq_target) in archive drivers/built-in.a
> --
>>> ld.lld: error: undefined symbol: rockchip_pmu_unblock
>    >>> referenced by rk3399_dmc.c:212 (drivers/devfreq/rk3399_dmc.c:212)
>    >>> devfreq/rk3399_dmc.o:(rk3399_dmcfreq_target) in archive drivers/built-in.a
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

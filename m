Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA38EA38
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 03:09:27 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220525030925epoutp02899afd1868b2f428fba80edd5dd17f13~yOlii5Ynm2349623496epoutp026
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 03:09:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220525030925epoutp02899afd1868b2f428fba80edd5dd17f13~yOlii5Ynm2349623496epoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1653448165;
	bh=hEcwbw/PpXxyZeuMCrYxg+FysoMIlmaSQ5URE3S9znU=;
	h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
	b=AQvWlpD6Tl21OSojhem9akuly4WBB/+f76+hm2kGBkl7H/ftCay23/jAGvBcuvKVA
	 zcb5WGFebibjtk87WeMd4zCM61G0hi2GNQsDWPOR7eVcGQgK3qoQLfoLQX9+FI5WhF
	 Rf1pbDaS+6lvqTIgUY/UaWQwVkC7yo3jW+fS4Zx4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTP id
	20220525030925epcas1p4cc885da779d4c4b0ff077111250ec617~yOliFnbIs0494204942epcas1p4H;
	Wed, 25 May 2022 03:09:25 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.36.134]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4L7GJ33xLbz4x9Py; Wed, 25 May
	2022 03:09:23 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	39.E0.10063.3ED9D826; Wed, 25 May 2022 12:09:23 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20220525030922epcas1p3545015687396b41629424cdbcb91fa00~yOlftCjgo2728327283epcas1p3d;
	Wed, 25 May 2022 03:09:22 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20220525030922epsmtrp1507faa87366e4fbc5442c5ad44f82504~yOlfsIdl80263302633epsmtrp1f;
	Wed, 25 May 2022 03:09:22 +0000 (GMT)
X-AuditID: b6c32a35-1dbff7000000274f-af-628d9de356e8
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A8.4B.11276.2ED9D826; Wed, 25 May 2022 12:09:22 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20220525030922epsmtip12cf578d0acf8a76419acca87b302e782~yOlfdVpjt0820408204epsmtip1a;
	Wed, 25 May 2022 03:09:22 +0000 (GMT)
Subject: Re: [linux-next:master 9269/14079] ld.lld: error: undefined symbol:
 rockchip_pmu_block
To: Brian Norris <briannorris@chromium.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>,
	Douglas Anderson <dianders@chromium.org>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <39b07203-111f-0fb9-7c9a-120a067ca1a6@samsung.com>
Date: Wed, 25 May 2022 12:09:22 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
	Thunderbird/59.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CA+ASDXNQ=ycB9v=FpNup2SM2Qd+W32M5c7vsh=jXG0qB_d_35w@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmvu7jub1JBv9PyFps+vie1eLssoNs
	Fme7rzFa3Fvzn9XiVfMjNosnU/azObB5zG64yOKxeM9LJo9Nnyaxe3TP/sfi8WLzTMYA1qhs
	m4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygE5QUyhJz
	SoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BaYFesWJucWleel6eaklVoYGBkamQIUJ2Rlv
	puxnLDjJXvHp4Uv2BsYeti5GTg4JAROJo2u7gWwuDiGBHYwSt773s0I4nxgl+s5fZoFwvjFK
	vNh1gQWmZeGuXqiqvYwSe5ob2UESQgLvGSU2L8kCsYUFEiW2TDoGtkNEQFvi8PVOJhCbWWAr
	o8S1j9wgNpuAlsT+FzfAavgFFCWu/njM2MXIwcErYCdx5pUsiMkioCpxs9sBpEJUIEzi5LYW
	RhCbV0BQ4uTMJ2DncAoESvR/u8MIMV1c4taT+VCb5CW2v53DDHKmhMBUDonH76YzQdzvItH/
	eC07hC0s8er4FihbSuJlfxs7REMzo0TDi9uMEE4Po8TRZ31Q3xtL7F86mQnkOmYBTYn1u/Qh
	wooSO3/PhbqCT+Ld1x5WkBIJAV6JjjYhiBJlicsP7kLdICmxuL2TbQKj0iwk/8xC8sMsJD/M
	Qli2gJFlFaNYakFxbnpqsWGBITyyk/NzNzGCU6eW6Q7GiW8/6B1iZOJgPMQowcGsJMKbEtaT
	JMSbklhZlVqUH19UmpNafIjRFBjAE5mlRJPzgck7ryTe0MTSwMTMyNjEwtDMUEmcd9W004lC
	AumJJanZqakFqUUwfUwcnFINTE6CTyevOiBQJ3H4ZYuyk4DYu+Dzz+Qv6Wrf8D577y5/pXHb
	LRWdp2W7Xkpekjm06MWp3Mdfnx8XUz3x9FCe+oL9cXwuKUGzOp/cDQo4Jl049W/Q9PXft95R
	DVu7SMGfd37CbN8fb5/W/Kuq/G/48MKhY1X5eZ327Hr7T4e/Xnbkl8S/PjdObyWLTq+jSY2P
	N57JfG7cdnXuo4WSq+XlpC/5TJSxqV1j+Gv+vV+CB/dlV72WXVznLb6oM/FQ6rptHrNd4qbc
	nJmk1rbGL1nuxv5DG4+8nasxQdRIpXjRjrsXmTe9/xRyey5P5ykvS5GpW6uWJlpPWytpXM7h
	8ci82//otT0nPdXCXmgbn1c+0fFFiaU4I9FQi7moOBEAO5hIUiYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsWy7bCSnO6jub1JBv96pCw2fXzPanF22UE2
	i7Pd1xgt7q35z2rxqvkRm8WTKfvZHNg8ZjdcZPFYvOclk8emT5PYPbpn/2PxeLF5JmMAaxSX
	TUpqTmZZapG+XQJXxpsp+xkLTrJXfHr4kr2BsYeti5GTQ0LARGLhrl7WLkYuDiGB3YwSd+f9
	YYJISEpMu3iUuYuRA8gWljh8uBii5i2jxLUTM8CahQUSJbZMOgZmiwhoSxy+3skEUsQssJVR
	YmP3T6ipjUwSy7oesIBUsQloSex/cQOsg19AUeLqj8eMIBt4BewkzrySBTFZBFQlbnY7gFSI
	CoRJ7FzyGOweXgFBiZMzn4BN4RQIlOj/docRxGYWUJf4M+8SM4QtLnHryXwmCFteYvvbOcwT
	GIVnIWmfhaRlFpKWWUhaFjCyrGKUTC0ozk3PLTYsMMxLLdcrTswtLs1L10vOz93ECI4iLc0d
	jNtXfdA7xMjEwXiIUYKDWUmENyWsJ0mINyWxsiq1KD++qDQntfgQozQHi5I474Wuk/FCAumJ
	JanZqakFqUUwWSYOTqkGJqv+aZu2ev2u1Qufq9e6eM6ChLcS37bzdL+c1vLoy5pfSsUONY6H
	f6mvuhZ73HTjU3E+8efb1cu27lm6d7cxu0zh0f99itcmX1ab8JtvpVAg482tByfcEvh1XzH/
	nnjqPCfdtJk79C15bhne2mPR06P/WuDxnaKqfBeZu20ytt7f2AXz5VnF4uJMaubZhE0Ol+hv
	el65x3SdcF90W1Z8gOnRHSFuTCcq4jaKpGSv5S4LTr+ifodF4YxnrOKzT0FqSVzSglcOlf7K
	yHny6kJW1OmzJydfmVJb5Lct1U9omdW+sMnPvtoG7pjyIDZY9ee7SZZ3dOI1hHJeXJf95zjx
	SkbWudU7GlM4z6cLL9D8p8RSnJFoqMVcVJwIAMIk7UoRAwAA
X-CMS-MailID: 20220525030922epcas1p3545015687396b41629424cdbcb91fa00
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220524114954epcas1p416e486dce031a941263b13120e717d72
References: <CGME20220524114954epcas1p416e486dce031a941263b13120e717d72@epcas1p4.samsung.com>
	<202205241931.GbIyyVs2-lkp@intel.com>
	<18b1bfe6-d844-d2c2-fc5e-40248aaf72be@samsung.com>
	<CA+ASDXNQ=ycB9v=FpNup2SM2Qd+W32M5c7vsh=jXG0qB_d_35w@mail.gmail.com>

Hi Brian,

On 5/25/22 10:16 AM, Brian Norris wrote:
> Hi Chanwoo,
> 
> On Tue, May 24, 2022 at 6:04 PM Chanwoo Choi <cw00.choi@samsung.com> wrote:
>> How can fix this build issue?
>> Should I add the ARCH_ROCKCHIP dependency to rk3399_dmc.c?
> 
> No. As noted below by the robot, the issue is already fixed in -next.
> I noted as much already on the earlier reports:
> https://lore.kernel.org/all/CA+ASDXO1JDKf-vBB0gWdYKD9vMMoMXYRL2E42HJtnbOvMP7jPA@mail.gmail.com/
> 
> Unfortunately, the two changes were picked up to different trees at
> different times, so it's not bisectable. (It's not that severe IMO,
> since the build failure can only occur for COMPILE_TEST=y.)
> 
>> On 5/24/22 8:49 PM, kernel test robot wrote:
>>> Note: the linux-next/master HEAD 09ce5091ff971cdbfd67ad84dc561ea27f10d67a builds fine.
>>>       It may have been fixed somewhere.
> 

OK. Thanks for the reply. 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

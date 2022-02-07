Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE982F27
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 06:40:24 +0000 (UTC)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220207063503epoutp01b920853c55496d07430d5c076d74c51c~RbXhyc41i1599915999epoutp013
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 06:35:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220207063503epoutp01b920853c55496d07430d5c076d74c51c~RbXhyc41i1599915999epoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1644215703;
	bh=Jv7zjfC2Pm2fYIs/+yP8DHjdHnMkjSWcG8W5bKYNioQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Th8cIHmA+802Q3QGIzTKqqePyVjpm/42kJccbACBqvPT3GJRgtUmZsA+Nfj5CrfLz
	 8Fb7w4yEIg/oovZBw8KcPmsTkdubcrJPbbYmec3peT9XzowALyYULgjqH5K+SOdQXd
	 FrbXBrsTwRov5m7vsV8NJA4aTN6sW+Dm4EwPQEsA=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20220207063502epcas5p3797517a8f0d8e590ce27426c4d110250~RbXhV4NUg0097500975epcas5p36;
	Mon,  7 Feb 2022 06:35:02 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.179]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4JsbwY4x5Hz4x9Pw; Mon,  7 Feb
	2022 06:34:53 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	03.D4.05590.D4DB0026; Mon,  7 Feb 2022 15:33:49 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20220207063450epcas5p432ff9d8433d8649e0a5ebd7873de194a~RbXV6de_62028820288epcas5p4F;
	Mon,  7 Feb 2022 06:34:50 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20220207063450epsmtrp26998fe7c9ee2d2c68f04d0728ef19a24~RbXV5QIZ02740727407epsmtrp2V;
	Mon,  7 Feb 2022 06:34:50 +0000 (GMT)
X-AuditID: b6c32a4b-739ff700000015d6-e8-6200bd4d9c57
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	74.6D.29871.A8DB0026; Mon,  7 Feb 2022 15:34:50 +0900 (KST)
Received: from alimakhtar03 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20220207063448epsmtip1d1a137bd2defdc3e7f6997cedad82d66~RbXT1Mutf1917819178epsmtip1a;
	Mon,  7 Feb 2022 06:34:47 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'kernel test robot'" <lkp@intel.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>
Cc: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>, "'Linux Memory
 Management	List'" <linux-mm@kvack.org>, "'Aswani	Reddy'"
	<aswani.reddy@samsung.com>, "'Niyas Ahmed S T'" <niyas.ahmed@samsung.com>,
	"'Chandrasekar R'" <rcsekar@samsung.com>, "'Jayati Sahu'"
	<jayati.sahu@samsung.com>, "'Sriranjani P'" <sriranjani.p@samsung.com>,
	"'Ajay Kumar'" <ajaykumar.rs@samsung.com>, "'Pankaj Dubey'"
	<pankaj.dubey@samsung.com>
In-Reply-To: <202202070602.Ff39h8TP-lkp@intel.com>
Subject: RE: [linux-next:master 1773/4147] ld.lld: error: undefined symbol:
 exynos_arm64_register_cmu
Date: Mon, 7 Feb 2022 12:04:46 +0530
Message-ID: <0ac001d81bec$ce9f5550$6bddfff0$@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFqEpUFgVXmPlUIM5jZXOuf5vw4FQF04Ze2rVgMXxA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRmVeSWpSXmKPExsWy7bCmpq7vXoYkg82POCwOvD/IYnFo81Z2
	iyOnljBZnO2+xmhx/vwGdot7a/6zWrxqfsRm8WTKfhDxiNVi0dYv7BazLuxgtbj9Zh2rA4/H
	4j0vmTw2repk89j0aRK7R/fsfyweLzbPZPTo27KKMYAtKtsmIzUxJbVIITUvOT8lMy/dVsk7
	ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hKJYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+
	cYmtUmpBSk6BSYFecWJucWleul5eaomVoYGBkSlQYUJ2Rue3A0wFe6UrTtyUb2D8Jd7FyMEh
	IWAiMXV1QhcjF4eQwG5GiTkLJ7NDOJ8YJR5OmccC4XxjlHjxq4m1i5ETrGPevltQib2MEm0v
	njBCOC8ZJRbsOMwMUsUmoCuxY3EbG4gtIhAmcW7FerAOZoF1zBK393WAjeIUMJJYu/8pI4gt
	LJAuse7mWkaQo1gEVCQWrDMBCfMKWEpMnXGICcIWlDg58wkLiM0sIC+x/e0cZoiLFCR+Pl3G
	CrHLSuLk5b+MEDXiEi+PHgH7R0LgBIfEwu93oF5wkTj+7h4jhC0s8er4FnYIW0ri87u9bJCA
	yZbo2WUMEa6RWDrvGAuEbS9x4MocFpASZgFNifW79CFW8Un0/n7CBNHJK9HRJgRRrSrR/O4q
	VKe0xMTubqgDPCQOvz3GOIFRcRaSx2YheWwWkgdmISxbwMiyilEytaA4Nz212LTAOC+1HB7b
	yfm5mxjBKVjLewfjowcf9A4xMnEwHmKU4GBWEuGV6f6fKMSbklhZlVqUH19UmpNafIjRFBjY
	E5mlRJPzgVkgryTe0MTSwMTMzMzE0tjMUEmc91T6hkQhgfTEktTs1NSC1CKYPiYOTqkGJtng
	a3MWZjX//HONNedGYrVc/BvHQ3O3ec4tsn6x3zViK7uS7PcVd2R+PTinOF/4ssD2+5UNO6yX
	e+kazrkbIVTfudPu4JEam89iLAXvKtvkJThmugmq/DeZVzHf2/jsv/QX07seHpjlYvFNudci
	tTacb/VVTychu5Sg9E9fLhRXX6xv5d/Unjb3jWPZ9c/a5TZR7hLbNQNZ1fOyZ1iZVauxhJ/9
	eLTtsVj4pmZb+XyGA7v5y54VyLK03LepqF4r2jdv8rKkW1Mb7N2tOc7t0Oaxfp0UkaXR5yTY
	r+e14A8Xo0JNyd2vE3kX2Nsz79vxL04h5fSUno6f5TvnB9a4Hf7luoklfbvMrJ9333crsRRn
	JBpqMRcVJwIA/c8XlUoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsWy7bCSnG7XXoYkg42XOS0OvD/IYnFo81Z2
	iyOnljBZnO2+xmhx/vwGdot7a/6zWrxqfsRm8WTKfhDxiNVi0dYv7BazLuxgtbj9Zh2rA4/H
	4j0vmTw2repk89j0aRK7R/fsfyweLzbPZPTo27KKMYAtissmJTUnsyy1SN8ugSuj89sBpoK9
	0hUnbso3MP4S72Lk5JAQMJGYt+8WSxcjF4eQwG5GiWVXl7JAJKQlrm+cwA5hC0us/PecHaLo
	OaPEw2k/GUESbAK6EjsWt7GB2CICYRKr1kxgAyliFtjCLDH5zzsmiI5mRol1XyewglRxChhJ
	rN3/FKxbWCBVYuLEdcxdjBwcLAIqEgvWmYCEeQUsJabOOMQEYQtKnJz5hAWkhFlAT6JtI1gn
	s4C8xPa3c5ghjlOQ+Pl0GSvEDVYSJy//haoRl3h59Aj7BEbhWUgmzUKYNAvJpFlIOhYwsqxi
	lEwtKM5Nzy02LDDMSy3XK07MLS7NS9dLzs/dxAiORC3NHYzbV33QO8TIxMF4iFGCg1lJhFem
	+3+iEG9KYmVValF+fFFpTmrxIUZpDhYlcd4LXSfjhQTSE0tSs1NTC1KLYLJMHJxSDUwlt1qt
	JzQd+KIsuUP442GRJ9w71qwIWmqsmd1/8uT/irethy2qzio+FLU9tVHU0v/2tVnR5cltq10u
	swYoeulpZx7rPBj6W70u4X/DpuuheXpTQmatjFrDIt7ckePGcOqE3tpjxe0Tft78+tloRYFw
	/ronDzq0P6pzHDp1/1S9oYDb86t7dX4E9DvveOS7aC+fvFj/lxWsRvHaIrc2+O9a7RS7ye9p
	0RF7FffpeULql6Xu758Wb9CpI1Qq/1ht8aJl+RkF3vI7YmofczzSv2mo/Jfx1+lNgeZxp2+U
	X814raI+WVL2UN3mnWsFG1Zx7uSY3Tch9FOszVOfVTUXIqs3iws+afzn922b20MmswtKLMUZ
	iYZazEXFiQBZlXHpMwMAAA==
X-CMS-MailID: 20220207063450epcas5p432ff9d8433d8649e0a5ebd7873de194a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220206225154epcas5p327c8a75497136be9ad8113845355744c
References: <CGME20220206225154epcas5p327c8a75497136be9ad8113845355744c@epcas5p3.samsung.com>
	<202202070602.Ff39h8TP-lkp@intel.com>



>-----Original Message-----
>From: kernel test robot [mailto:lkp@intel.com]
>Sent: Monday, February 7, 2022 4:22 AM
>To: Alim Akhtar <alim.akhtar@samsung.com>
>Cc: llvm@lists.linux.dev; kbuild-all@lists.01.org; Linux Memory Management
>List <linux-mm@kvack.org>; Krzysztof Kozlowski <krzk@kernel.org>; Aswani
>Reddy <aswani.reddy@samsung.com>; Niyas Ahmed S T
><niyas.ahmed@samsung.com>; Chandrasekar R <rcsekar@samsung.com>;
>Jayati Sahu <jayati.sahu@samsung.com>; Sriranjani P
><sriranjani.p@samsung.com>; Ajay Kumar <ajaykumar.rs@samsung.com>;
>Pankaj Dubey <pankaj.dubey@samsung.com>
>Subject: [linux-next:master 1773/4147] ld.lld: error: undefined symbol:
>exynos_arm64_register_cmu
>
>tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>master
>head:   ef6b35306dd8f15a7e5e5a2532e665917a43c5d9
>commit: e3f3dc3810d3765128d28b241f4afb761d81678a [1773/4147] clk:
>samsung: fsd: Add cmu_peric block clock information
>config: hexagon-randconfig-r045-20220207
>(https://protect2.fireeye.com/v1/url?k=ba8587ed-e51ebeab-ba840ca2-
>0cc47a3003e8-50bb6f8708f24839&q=1&e=fdd716d2-2880-488c-9a99-
>90c11fa0b9ac&u=https%3A%2F%2Fdownload.01.org%2F0day-
>ci%2Farchive%2F20220207%2F202202070602.Ff39h8TP-
>lkp%40intel.com%2Fconfig)
>compiler: clang version 15.0.0
>(https://protect2.fireeye.com/v1/url?k=ec7bef1c-b3e0d65a-ec7a6453-
>0cc47a3003e8-e1698fe421d2996e&q=1&e=fdd716d2-2880-488c-9a99-
>90c11fa0b9ac&u=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project
>6daaf5a44925592c764c59219b0024ee06317028)
>reproduce (this is a W=1 build):
>        wget https://protect2.fireeye.com/v1/url?k=58557ef1-07ce47b7-
>5854f5be-0cc47a3003e8-3f3bf03ab8abefd6&q=1&e=fdd716d2-2880-488c-
>9a99-
>90c11fa0b9ac&u=https%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flk
>p-tests%2Fmaster%2Fsbin%2Fmake.cross -O ~/bin/make.cross
>        chmod +x ~/bin/make.cross
>        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-
>next.git/commit/?id=e3f3dc3810d3765128d28b241f4afb761d81678a
>        git remote add linux-next
>https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>        git fetch --no-tags linux-next master
>        git checkout e3f3dc3810d3765128d28b241f4afb761d81678a
>        # save the config file to linux build tree
>        mkdir build_dir
>        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross
>W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash
>
>If you fix the issue, kindly add following tag as appropriate
>Reported-by: kernel test robot <lkp@intel.com>
>

Thanks, this is already fixed by 

0b59bc00a693 clk: samsung: fix missing Tesla FSD dependency on Exynos (on
next-20220207)

https://lkml.org/lkml/2022/1/29/285

>Note: the linux-next/master HEAD
>ef6b35306dd8f15a7e5e5a2532e665917a43c5d9 builds fine.
>      It may have been fixed somewhere.
>
>All errors (new ones prefixed by >>):
>
>>> ld.lld: error: undefined symbol: exynos_arm64_register_cmu
>   >>> referenced by clk-fsd.c
>   >>>               clk/samsung/clk-fsd.o:(fsd_cmu_probe) in archive
drivers/built-
>in.a
>   >>> referenced by clk-fsd.c
>   >>>               clk/samsung/clk-fsd.o:(fsd_cmu_probe) in archive
drivers/built-
>in.a
>
>---
>0-DAY CI Kernel Test Service, Intel Corporation
>https://protect2.fireeye.com/v1/url?k=7a2ce20e-25b7db48-7a2d6941-
>0cc47a3003e8-0e3d96f7bb4a6c12&q=1&e=fdd716d2-2880-488c-9a99-
>90c11fa0b9ac&u=https%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild
>-all%40lists.01.org


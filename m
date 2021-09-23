Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B552F3FCD
	for <llvm@lists.linux.dev>; Thu, 23 Sep 2021 01:32:21 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210923012356epoutp044e2489fc106b564e5efff6c55f31837a~nTvx-O8Jj3203932039epoutp04M
	for <llvm@lists.linux.dev>; Thu, 23 Sep 2021 01:23:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210923012356epoutp044e2489fc106b564e5efff6c55f31837a~nTvx-O8Jj3203932039epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1632360236;
	bh=RcbXTtcEBdKAKC/6p2j+AT39Q5g2WEhrvOkHtcb3Tkk=;
	h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
	b=otPeg29+9QAFx8f19ELsuJLy38JxNMjUyj9Yb2ft7dO6XVxl3jG2uBg3eGHcl/eCx
	 9pW0nRIQ9iid+ULI8DvdxABDTWSDRB4WUi+1wbxo3uEqz9EDU+I/f2h0geOWi+bQlB
	 HjMzXdcbWSkm6y1HbbOpw/drE47E7XLNrrgmkvC0=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTP id
	20210923012356epcas1p4aba3b8d5f659cb07fa34bdc99c2e0111~nTvxxidvm0377403774epcas1p4B;
	Thu, 23 Sep 2021 01:23:56 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.38.237]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4HFHVs3PLfz4x9Pq; Thu, 23 Sep
	2021 01:23:49 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
	82.6F.13888.E17DB416; Thu, 23 Sep 2021 10:23:42 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20210923012340epcas1p22f0844646aa01dd72637648a13ed07cc~nTvjkwon52372623726epcas1p2Z;
	Thu, 23 Sep 2021 01:23:40 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20210923012340epsmtrp1d193103f1ae384d26cc6c70e997cbc3b~nTvjlM5AI3219832198epsmtrp1N;
	Thu, 23 Sep 2021 01:23:40 +0000 (GMT)
X-AuditID: b6c32a39-211ff70000003640-90-614bd71ec4fc
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	9D.71.08750.C17DB416; Thu, 23 Sep 2021 10:23:40 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20210923012340epsmtip287947fc68fc0d7901a65bb8ecf6a9321~nTvjX2rt03016230162epsmtip2a;
	Thu, 23 Sep 2021 01:23:40 +0000 (GMT)
Subject: Re: [linux-next:master 2223/2463]
 drivers/extcon/extcon-usbc-tusb320.c:250:15: warning: cast to smaller
 integer type 'enum tusb320_type' from 'const void *'
To: kernel test robot <lkp@intel.com>, Yassine Oudjana
	<y.oudjana@protonmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, Linux Memory Management
	List <linux-mm@kvack.org>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <e104932b-8b60-46bd-96ae-c94f8b510a39@samsung.com>
Date: Thu, 23 Sep 2021 10:44:48 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
	Thunderbird/59.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202109162332.tZTsTM76-lkp@intel.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnk+LIzCtJLcpLzFFi42LZdlhTX1fuuneiwdVHnBZnu68xWtxb85/V
	4lXzIzaLJ1P2s1lcXTeR3YHVY/Gel0wemz5NYvfonv2PxePF5pmMHj1tm5gCWKOybTJSE1NS
	ixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOAtisplCXmlAKFAhKL
	i5X07WyK8ktLUhUy8otLbJVSC1JyCkwL9IoTc4tL89L18lJLrAwNDIxMgQoTsjM+3J/KXnBU
	o+LZNesGxkvyXYwcHBICJhIzbnJ2MXJyCAnsYJQ48j+li5ELyP7EKHHlxBw2COczo8SuDxvY
	QKpAGi7d+weV2MUo8WPRJBaI9veMElcXp4IkhAVWMkpc7rrLCJIQEQiW6D1wnRnEZhZIk7i2
	6SGYzSagJbH/xQ2wqfwCihJXfzwGq+cVsJNonTsfbCiLgKrEuY9/mUBsUYEwiZPbWqBqBCVO
	znwCVsMpYCQx4+kNVoj5BhJHFs2BssUlbj2ZzwRhy0tsfzuHGeQ4CYFeDokXK1ezQLzjItHw
	7B3Ua8ISr45vYYewpSRe9rdB2dUSK08eYYNo7mCU2LL/AitEwlhi/9LJTBC2osTO33MZIbbx
	Sbz72sMKCWBeiY42IYgSZYnLD+5ClUtKLG7vZJvAqDQLyT+zkPwwC8kPs5D8sICRZRWjWGpB
	cW56arFhgSk8tpPzczcxglOmluUOxulvP+gdYmTiYDzEKMHBrCTC+/mGV6IQb0piZVVqUX58
	UWlOavEhRlNgEE9klhJNzgcm7bySeEMTSwMTMyNjEwtDM0Mlcd5jry0ThQTSE0tSs1NTC1KL
	YPqYODilGphmzOyvD9bYutFyvpFLiEdU/pWUWzzFUy2ev97pkyByeG79PJOqMLXox8/mrZ7f
	vv33hZMpHcvcL656/Oife1T93IRDrQEvL6s9rGbnsmnuU3GU6P9i29p9Le8H0wr1+rKOt8v2
	hO25+WXPXEOXfU15ta+uHpboefXw0fWjkockTOI5go+od/GqWIt8c//9qH3Lst697LLiW+/w
	+bNVVuX//Cfs3f4pqDttQuv1Ou/eCc8YE1QCtUvcFc9eFPOdYBfEPHOmujXj+1nRnzaKZbjm
	1n9vlW2J/FrSUh3w5kru/tzfW8rKOd5H7EwJ+HUkwuWRYXZd5DarvNNHXSrecIU2Wdpebtxa
	eCnhd9TJo0osxRmJhlrMRcWJAHkgW4ciBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7bCSvK7Mde9Eg+UNahZnu68xWtxb85/V
	4lXzIzaLJ1P2s1lcXTeR3YHVY/Gel0wemz5NYvfonv2PxePF5pmMHj1tm5gCWKO4bFJSczLL
	Uov07RK4Mj7cn8pecFSj4tk16wbGS/JdjJwcEgImEpfu/WPrYuTiEBLYwSix6c07ZoiEpMS0
	i0eBbA4gW1ji8OFiiJq3jBJHd84GaxAWWMkosWH+e1aQIhGBYIlJr6tATGaBNIlXh4Ih6lsZ
	JTp+dLOCzGQT0JLY/+IGG4jNL6AocfXHY0YQm1fATqJ17nwWEJtFQFXi3Me/TCC2qECYxM4l
	j5kgagQlTs58AlbDKWAkMePpDbCZzAJ6Ejuu/4KyxSVuPZnPBGHLS2x/O4d5AqPwLCTts5C0
	zELSMgtJywJGllWMkqkFxbnpucWGBUZ5qeV6xYm5xaV56XrJ+bmbGMGRo6W1g3HPqg96hxiZ
	OBgPMUpwMCuJ8H6+4ZUoxJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC18l4IYH0xJLU7NTUgtQi
	mCwTB6dUA1PfgcX7RXNn7VFP/GcUkR376IW0f/WzziCuKynOegc2vQ4W1ls+oUlM9JzouT+V
	mxS1j5+7P80lddmL4E8vNE9P3yh9Onzf5rPv1rIJvm4L3F3xVn77zV3nbmpPKumtnP/d3yBG
	xkti6vcVy8rNdj2qfuGy63+y1SK3w1rrqw6c//Mon79PvflvrMZvmRV/Nv249iezWcXVP+6W
	9+JdH6f4+0S75nv6vpL6UvBB5A+70M3JQp2HOGYftTVfcq5AczsLe6ywst+OA/M2feda8u5d
	uVTUs9RHRZWNzHGr9hvbPgzbphd8Z/YeOx3J8kW3+qY1a9+ePlNkUcASyz16erMy6iYfN/05
	+S+HoIH5kvfrlViKMxINtZiLihMBvtX3swsDAAA=
X-CMS-MailID: 20210923012340epcas1p22f0844646aa01dd72637648a13ed07cc
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210916155808epcas1p297ee826afd77e98bd9a28aabd151cee6
References: <CGME20210916155808epcas1p297ee826afd77e98bd9a28aabd151cee6@epcas1p2.samsung.com>
	<202109162332.tZTsTM76-lkp@intel.com>

Hi Yassine,

Please fix this issue. And then resend your patches.

On 9/17/21 12:57 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   368847b165bbfbdcf0bd4c96b167893dcdb13aba
> commit: 2bd5f4798ae081e30e61668ae016ca473812acce [2223/2463] extcon: usbc-tusb320: Add support for TUSB320L
> config: x86_64-randconfig-r034-20210916 (attached as .config)
> compiler: clang version 14.0.0 (https://protect2.fireeye.com/v1/url?k=323f6eaa-6da457ec-323ee5e5-0cc47a3003e8-696b222531acb98d&q=1&e=8a6a2762-9bac-4fe5-8382-60867b701b77&u=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project c8b3d7d6d6de37af68b2f379d0e37304f78e115f)
> reproduce (this is a W=1 build):
>         wget https://protect2.fireeye.com/v1/url?k=8c79ba47-d3e28301-8c783108-0cc47a3003e8-8233ac4fdd3d567e&q=1&e=8a6a2762-9bac-4fe5-8382-60867b701b77&u=https%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2bd5f4798ae081e30e61668ae016ca473812acce
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 2bd5f4798ae081e30e61668ae016ca473812acce
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/extcon/extcon-usbc-tusb320.c:250:15: warning: cast to smaller integer type 'enum tusb320_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
>            priv->type = (enum tusb320_type)match_data;
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 warning generated.
> 
> 
> vim +250 drivers/extcon/extcon-usbc-tusb320.c
> 
>    224	
>    225	static int tusb320_extcon_probe(struct i2c_client *client,
>    226					const struct i2c_device_id *id)
>    227	{
>    228		struct tusb320_priv *priv;
>    229		const void *match_data;
>    230		unsigned int revision;
>    231		int ret;
>    232	
>    233		priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
>    234		if (!priv)
>    235			return -ENOMEM;
>    236		priv->dev = &client->dev;
>    237	
>    238		priv->regmap = devm_regmap_init_i2c(client, &tusb320_regmap_config);
>    239		if (IS_ERR(priv->regmap))
>    240			return PTR_ERR(priv->regmap);
>    241	
>    242		ret = tusb320_check_signature(priv);
>    243		if (ret)
>    244			return ret;
>    245	
>    246		match_data = device_get_match_data(&client->dev);
>    247		if (!match_data)
>    248			return -EINVAL;
>    249	
>  > 250		priv->type = (enum tusb320_type)match_data;
>    251	
>    252		priv->edev = devm_extcon_dev_allocate(priv->dev, tusb320_extcon_cable);
>    253		if (IS_ERR(priv->edev)) {
>    254			dev_err(priv->dev, "failed to allocate extcon device\n");
>    255			return PTR_ERR(priv->edev);
>    256		}
>    257	
>    258		if (priv->type == TYPE_TUSB320L) {
>    259			ret = regmap_read(priv->regmap, TUSB320L_REGA0_REVISION, &revision);
>    260	
>    261			if (ret)
>    262				dev_warn(priv->dev,
>    263					"failed to read revision register: %d\n", ret);
>    264			else
>    265				dev_info(priv->dev, "chip revision %d\n", revision);
>    266		}
>    267	
>    268		ret = devm_extcon_dev_register(priv->dev, priv->edev);
>    269		if (ret < 0) {
>    270			dev_err(priv->dev, "failed to register extcon device\n");
>    271			return ret;
>    272		}
>    273	
>    274		extcon_set_property_capability(priv->edev, EXTCON_USB,
>    275					       EXTCON_PROP_USB_TYPEC_POLARITY);
>    276		extcon_set_property_capability(priv->edev, EXTCON_USB_HOST,
>    277					       EXTCON_PROP_USB_TYPEC_POLARITY);
>    278	
>    279		/* update initial state */
>    280		tusb320_irq_handler(client->irq, priv);
>    281	
>    282		/* Reset chip to its default state */
>    283		ret = tusb320_reset(priv);
>    284		if (ret)
>    285			dev_warn(priv->dev, "failed to reset chip: %d\n", ret);
>    286		else
>    287			/*
>    288			 * State and polarity might change after a reset, so update
>    289			 * them again and make sure the interrupt status bit is cleared.
>    290			 */
>    291			tusb320_irq_handler(client->irq, priv);
>    292	
>    293		ret = devm_request_threaded_irq(priv->dev, client->irq, NULL,
>    294						tusb320_irq_handler,
>    295						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>    296						client->name, priv);
>    297	
>    298		return ret;
>    299	}
>    300	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://protect2.fireeye.com/v1/url?k=9796b83a-c80d817c-97973375-0cc47a3003e8-e9c6ede5e7c8665a&q=1&e=8a6a2762-9bac-4fe5-8382-60867b701b77&u=https%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

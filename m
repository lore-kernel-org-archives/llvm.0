Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B5E17D7;
	Mon,  7 Jul 2025 03:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751859692; cv=none; b=lFRNK0cOwpaypOqar0zbuzkzBQ48JiSksRZawahZdm5w1iAZeSt18womXmLhd4hxzvpJMOf3YxM9s48xQ5bS0c1uWT0ZPK+vOpewhENNGqEGnaycYDOu3eUmwodmZKydqxixw4YRmpCw6Gkos2xZhyshGd+ET2i1Iv81+XdPlDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751859692; c=relaxed/simple;
	bh=Rj99BPdwtgJX9wg4djEMN905rkSkumD7JVQvddVo+Vo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pqHs533HhJWdYfNemqjoFAoQzj9ILfJtZI7F8grSyDU2XRlsq3/dfRFHdHsZAHUhVsezYHk6hNRClu4WmeS+Ipltf5DDrRfTvvvQqBTJTEep+siUEzXTaESkoJl7HLgEcpmLKc8gY1fSZTyrB3Uj3QYJM+YU+ZEUTMg61WNOjso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YjHW3zuN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjHW3zuN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F93C4CEEE;
	Mon,  7 Jul 2025 03:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751859692;
	bh=Rj99BPdwtgJX9wg4djEMN905rkSkumD7JVQvddVo+Vo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=YjHW3zuN4moJ8NZ1oEXQPUDODt/BKkZ95K1PxdVqXnMpf6FRaJhpXLWr4cF3Hq4Ti
	 PVTukvLyw7HMio0a4MpuFl16+qHsw6sJ5mOD538rccvn9neEv84hpktmhRKaYrFWEu
	 h6iGf2Yt0lQwBGqLuZnoCmSDZaZQ41rca6kqEggtUsiGvEvNt9ni+T/SL94mdqQdjM
	 UPQ1DRnrwZjB9a6uUvmkj/7jx/MPLjch4Vm5UAnTsqTltcgyu3BY6+2/uoYX4uj3M5
	 CuhRU8rnYnoMLgD7Fth9KJBeYnpnrCcHh/L5XtEKjGwQHmNdUF1S9BXgghPuyCMPak
	 K7HKs6aXe4oBg==
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id CFC02F40066;
	Sun,  6 Jul 2025 23:41:30 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Sun, 06 Jul 2025 23:41:30 -0400
X-ME-Sender: <xms:6kFraCBeH0cC8g7KYy5FD3VZo5M0f9OjFx38rFnRDE1SMSDgfbQmGA>
    <xme:6kFraMjvYUQIlccwHWNecFLx2gHybJrNsXH2YPHUEfZQ--ii6iz6VOa1mcQgsDGl6
    Uf3QJdBSMuSFFPaZkk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeftdejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfnvghonhcu
    tfhomhgrnhhovhhskhihfdcuoehlvghonheskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeduteeugeeftedukeefgfdvheeljeetieelfeejudeviefhvdefgfehvefh
    ffetfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpddtuddrohhrghdpghhithhhuh
    gsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mheplhgvohhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdeftdehfe
    elkeegqddvjeejleejjedvkedqlhgvohhnpeepkhgvrhhnvghlrdhorhhgsehlvghonhdr
    nhhupdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hhuhgrnhhgjhhunhigihgrnheisehhihhsihhlihgtohhnrdgtohhmpdhrtghpthhtohep
    lhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopehllhhvmheslhhishhtshdrlhhinh
    hugidruggvvhdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlsehlihhsthhsrdhl
    ihhnuhigrdguvghv
X-ME-Proxy: <xmx:6kFraITLyOQXNmi5wiYO3CFINn2ysKMqSukG8WoX5bccRW3BFBe3Ew>
    <xmx:6kFraLJS8m0hHZyFDZMG6ewPRrV9NaggAQ1yxsLVWrgRB0yBOSyIlQ>
    <xmx:6kFraGAIvjmAoedXinLT62Kf3le7u_3AcbNquUHJZNhOb_8M2L3Z4A>
    <xmx:6kFraMBjAu0k3-MpJ_zQ9DfsVF7beDPr_U0Lkug75I3QrFUp0vTCrQ>
    <xmx:6kFraAAjRAo5YsXHl--5noYkeV-5e2klzR2yEDc7LNspiwgjhRC0A9X3>
Feedback-ID: i927946fb:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A08642CE0072; Sun,  6 Jul 2025 23:41:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: T6f0924e1377ff2b9
Date: Mon, 07 Jul 2025 06:41:11 +0300
From: "Leon Romanovsky" <leon@kernel.org>
To: "Junxian Huang" <huangjunxian6@hisilicon.com>,
 "kernel test robot" <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Message-Id: <9cfc4e0e-4ebe-4ef9-91e2-64dfca94be78@app.fastmail.com>
In-Reply-To: <5f9d93c3-ea97-b951-fc68-e23bb1337120@hisilicon.com>
References: <202507070359.Ng3M8gut-lkp@intel.com>
 <5f9d93c3-ea97-b951-fc68-e23bb1337120@hisilicon.com>
Subject: Re: [mellanox:wip/leon-for-next 29/35]
 drivers/infiniband/hw/hns/hns_roce_hw_v2.c:2225:38: error: use of undeclared
 identifier 'cmd_numi'; did you mean 'cmd_num'?
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, Jul 7, 2025, at 04:49, Junxian Huang wrote:
> On 2025/7/7 6:13, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mellanox/linux.git wip/leon-for-next
>> head:   bdc5726cdd454f91d7bf49f47c8c31377cb3d7ce
>> commit: 6cbf3ee2e409ca573ef1ebb3f383ae3873850ee7 [29/35] RDMA/hns: Get message length of ack_req from FW
>> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250707/202507070359.Ng3M8gut-lkp@intel.com/config)
>> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507070359.Ng3M8gut-lkp@intel.com/reproduce)
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202507070359.Ng3M8gut-lkp@intel.com/
>> 
>> All errors (new ones prefixed by >>):
>> 
>>>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:2225:38: error: use of undeclared identifier 'cmd_numi'; did you mean 'cmd_num'?
>>     2225 |         hns_roce_cmq_setup_basic_desc(&desc[cmd_numi - 1], cmd, true);
>>          |                                             ^~~~~~~~
>>          |                                             cmd_num
>>    drivers/infiniband/hw/hns/hns_roce_hw_v2.c:2210:6: note: 'cmd_num' declared here
>>     2210 |         int cmd_num;
>>          |             ^
>>    1 error generated.
>> 
>
> Leon, just to confirm that this can be fixed in your wip branch
> and I don't need to resend a patch, right?

Yes, sure, I'll fix it.

>
> Junxian

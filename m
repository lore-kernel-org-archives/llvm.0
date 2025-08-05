Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A523234;
	Tue,  5 Aug 2025 07:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754379230; cv=none; b=gokqpGlICH58Q0YBx1C4TMiMj26SLkTPGyNRFOdEHleQTrJCPNADUIDzYAChuRV8BYWrwokA+etkYBH9LnNS7H0HwQIH/xNds8gslF33fY3yHzruxzZSun/zimp8Ffxp4p4Bc4sfLcsj4cMbqo5QINUcbskAmKJdnq/ZkVIq5Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754379230; c=relaxed/simple;
	bh=lWoj5cbhbxlDdax6YA5fzBxQiNCx2HEUN1Ato45Pkj4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BOyjo0Do+L7zvM8VimYdpBqM63BRm4sfyh163CghkLY5FAIov8cskNW4vo8hU+aEyvZKTLcCB5XAa/LhsiQW/IqwhQDVdKRw4J6Ww3mT/6sWnIFLR1//i6wmHxUjtZLQ1bviZU7VXi3PV4kXCd+34m0r7OZqmr6Yh8kbpjCBxQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nFoqaVk9; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nFoqaVk9"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B90464445D;
	Tue,  5 Aug 2025 07:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754379224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vVom/h0xvXI25cH39k3z4mQGPZ1j72omUdDXqNDT3Y=;
	b=nFoqaVk9/delHSmx++YBS+2THKs38DIFa5QtEt6daOZfNHNfczT9g0oE8hACQTPE87jl77
	OIY6SAHi13ofUHQPbH3uvzMq9+1BIaBrrDspaMZspKwctyEWXRRSQChTk5Kp8hkyt35ArY
	I7b4cT/B0N2qKHkxI+4TRpmGYrXh8K7O9TJ+WyPf8l1HdwI3NwLyqT+Dmso5dF0QQiNcJA
	NHz5y9YqEhePKxLdcmHmzEx2uk/qfobK/ule9q/yQ0hZFpheytr1UvKwfvI6gYJnHv/odO
	nlAWApVNNJhDhlpbok7JRLttaEWBwk5KHI9G9UqTs1hGDPz+nOFNg+iTX/5hnw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev,  oe-kbuild-all@lists.linux.dev,  Mark Brown
 <broonie@kernel.org>
Subject: Re: [broonie-ci:fileG7mYfA 10/10] Warning:
 drivers/spi/spi-mem.c:592 Excess function parameter 'mem' description in
 'spi_mem_calc_op_duration'
In-Reply-To: <202508051310.ZfO89Wwc-lkp@intel.com> (kernel test robot's
	message of "Tue, 5 Aug 2025 13:18:00 +0800")
References: <202508051310.ZfO89Wwc-lkp@intel.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 05 Aug 2025 09:33:44 +0200
Message-ID: <87bjoujk87.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudegheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvddvtddtgfekfeetgeehffejfeetfeduvdfffeevfedviedtieefudduteevtefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptddurdhorhhgpdhgihhthhhusgdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopehllhhvmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

On 05/08/2025 at 13:18:00 +08, kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fi=
leG7mYfA
> head:   a22cf645290878f354837c99b1ed0d6930b534cf
> commit: a22cf645290878f354837c99b1ed0d6930b534cf [10/10] spi: spi-mem: Ad=
d missing kdoc argument
> config: i386-buildonly-randconfig-001-20250805 (https://download.01.org/0=
day-ci/archive/20250805/202508051310.ZfO89Wwc-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250805/202508051310.ZfO89Wwc-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508051310.ZfO89Wwc-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> Warning: drivers/spi/spi-mem.c:592 Excess function parameter 'mem' desc=
ription in 'spi_mem_calc_op_duration'

The robot applied a patch for -next on top of Mark's tree, the warning
will be gone as soon as -rc1 is out and Mark pulls the tag in.

Thanks,
Miqu=C3=A8l

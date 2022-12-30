Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C267E;
	Fri, 30 Dec 2022 19:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0DAC433EF;
	Fri, 30 Dec 2022 19:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672429953;
	bh=8d81TX58YH1G9J+afWPRLe8LwaJbseEEbaaCSWCyhUw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FZ0aRG52Zqkc4eP+mgUb3RQa0QaxbxWEYHFibI5hIv5age03Zz3UpWas9exd+utXz
	 kNzq8BucpbMEaK/dg702NKqxaQzm1QTziVsCHQTG7PQxa/PLLHGTu75l6lBaCNLQUV
	 v9Diu3UOp4hMot/Z9fDReK6oAj4Rw0H7J1g4YWaPqh+l+Lg4TdarkySNmU9vSqYzUa
	 K9FJGRJJBGM9M0fXIzHPCOrUlLHXfuPUtRVBgYciTrPb004ekbalKO5gpbFZPT2wzK
	 q8FEHdlASbSJf4oZE0eeGo5ihklt75WwECj6dYMj7zhL/P7gomo5vWdzdAy7EP7w6r
	 0LoQnp4mMD3pw==
Date: Fri, 30 Dec 2022 13:52:31 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: daire.mcnamara@microchip.com, conor.dooley@microchip.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 8/9] PCI: microchip: Partition inbound address
 translation
Message-ID: <20221230195231.GA704036@bhelgaas>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212221347.puj3IN6d-lkp@intel.com>

On Thu, Dec 22, 2022 at 01:30:03PM +0800, kernel test robot wrote:
> ...
> All warnings (new ones prefixed by >>):
> 
>    drivers/pci/controller/pcie-microchip-host.c:896:32: warning: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
>            devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare,
>                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I know this particular warning wasn't added by *this* series, but of
600+ instances of devm_add_action_or_reset(), only 4 have similar cast
ugliness like this.  I think most others define a trivial stub that
takes a void * and passes it on to the underlying function that
expects a more specific type.  That's kind of ugly too, but arguably
a little less so.

Bjorn

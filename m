Received: from out28-170.mail.aliyun.com (out28-170.mail.aliyun.com [115.124.28.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9101E864;
	Sun, 30 Jun 2024 02:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719715960; cv=none; b=D9/MuzONasxPvWch4hJ/brwypnZbZoQiNoAqp20/3wqNGUbGyuQUxm4ZC+xavA7F8Pg/BJSDT0OaPGm3eKIHVMdOx8CiJ7Za+L2GGme7cU1btRkcB3JVYN9bvnnY/W9EZXjq9ro4310qch1RnxKtIXS8MIJXx3pETAnBLHgdt8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719715960; c=relaxed/simple;
	bh=aUfF89qSyocSOJjmqewrNT2y/V7573e9/frAQrgOFlE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QLHaSmC9SD+OZpNWkr0OWIZw1Ur28ZPhEWlbaosZ3PfvUKACfUFBRbSJtGUtB+QS9sFFC0YOBcNXeJslvrA8Ti4ZNse5aPHKSZpRIEEKPbi9sw5/LA77+QoBMW47NXfPaXUyfgF4T6t0Z6CxMRgtGu7/gRG9xcz8gCAtxOFJ9aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ttyinfo.com; spf=pass smtp.mailfrom=ttyinfo.com; arc=none smtp.client-ip=115.124.28.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ttyinfo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ttyinfo.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08012033|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.583777-0.00191743-0.414306;FP=0|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033068157007;MF=zhoushengqing@ttyinfo.com;NM=1;PH=DS;RN=7;RT=7;SR=0;TI=SMTPD_---.YDKtU-w_1719715945;
Received: from tzl..(mailfrom:zhoushengqing@ttyinfo.com fp:SMTPD_---.YDKtU-w_1719715945)
          by smtp.aliyun-inc.com;
          Sun, 30 Jun 2024 10:52:26 +0800
From: Zhou Shengqing <zhoushengqing@ttyinfo.com>
To: helgaas@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lkp@intel.com,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	zhoushengqing@ttyinfo.com
Subject: Re: Re: [PATCH] PCI: Enable io space 1k granularity for intel cpu root port
Date: Sun, 30 Jun 2024 02:52:25 +0000
Message-Id: <20240630025225.9910-1-zhoushengqing@ttyinfo.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240629213432.GA1485157@bhelgaas>
References: <20240629213432.GA1485157@bhelgaas>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Thu, Jun 27, 2024 at 12:58:56AM +0000, Zhou Shengqing wrote:
> > This patch add 1k granularity for intel root port bridge.Intel latest
> > server CPU support 1K granularity,And there is an BIOS setup item named
> > "EN1K",but linux doesn't support it. if an IIO has 5 IOU (SPR has 5 IOUs)
> > all are bifurcated 2x8.In a 2P server system,There are 20 P2P bridges
> > present.if keep 4K granularity allocation,it need 20*4=80k io space,
> > exceeding 64k.I test it in a 16*nvidia 4090s system under intel eaglestrem
> > platform.There are six 4090s that cannot be allocated I/O resources.
> > So I applied this patch.And I found a similar implementation in quirks.c,
> > but it only targets the Intel P64H2 platform.
> > 
> > Signed-off-by: Zhou Shengqing <zhoushengqing@ttyinfo.com>
> > ---
> >  drivers/pci/probe.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index 5fbabb4e3425..909962795311 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -461,6 +461,9 @@ static void pci_read_bridge_windows(struct pci_dev *bridge)
> >  	u32 buses;
> >  	u16 io;
> >  	u32 pmem, tmp;
> > +	u16 ven_id, dev_id;
> > +	u16 en1k = 0;
> > +	struct pci_dev *dev = NULL;
> >  	struct resource res;
> >  
> >  	pci_read_config_dword(bridge, PCI_PRIMARY_BUS, &buses);
> > @@ -478,6 +481,26 @@ static void pci_read_bridge_windows(struct pci_dev *bridge)
> >  	}
> >  	if (io) {
> >  		bridge->io_window = 1;
> > +		if (pci_is_root_bus(bridge->bus)) {
> > +			list_for_each_entry(dev, &bridge->bus->devices, bus_list) {
> > +				pci_read_config_word(dev, PCI_VENDOR_ID, &ven_id);
> > +				pci_read_config_word(dev, PCI_DEVICE_ID, &dev_id);
> > +				if (ven_id == PCI_VENDOR_ID_INTEL && dev_id == 0x09a2) {
> > +					/*IIO MISC Control offset 0x1c0*/
> > +					pci_read_config_word(dev, 0x1c0, &en1k);
> > +				}
> > +			}
> > +		/*
> > +		 *Intel ICX SPR EMR GNR
> > +		 *IIO MISC Control (IIOMISCCTRL_1_5_0_CFG) — Offset 1C0h
> > +		 *bit 2:Enable 1K (EN1K)
> > +		 *This bit when set, enables 1K granularity for I/O space decode
> > +		 *in each of the virtual P2P bridges
> > +		 *corresponding to root ports, and DMI ports.
> > +		 */
> > +		if (en1k & 0x4)
> > +			bridge->io_window_1k = 1;
> > +		}
> 
> I still think this is not going to work because I don't want this kind
> of device-specific clutter in this generic path. The pcibios_*
> interfaces are history that we'd like to get rid of also, but it would
> be better than putting it here.

Do you think it should be putted to the pci_bios* interface?

And if there is no suitable place to apply this patch, 
then let's just ignore this issue.

> 
> Please follow english conventions as much as you can, e.g., space
> after "*" in comments, space after period at end of sentence,
> capitalize first word of sentence, blank line between paragraphs.
> Most of this you can see by looking at other comments.
> 

Thank you sincerely for your help with my first patch commitment.

> >  		pci_read_bridge_io(bridge, &res, true);
> >  	}
> >  
> > -- 
> > 2.39.2
> > 

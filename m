Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381172C9E
	for <llvm@lists.linux.dev>; Fri,  7 Jan 2022 01:40:56 +0000 (UTC)
X-UUID: 8a7ed46a2971447993db1053b65d8e16-20220107
X-UUID: 8a7ed46a2971447993db1053b65d8e16-20220107
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1649835202; Fri, 07 Jan 2022 09:40:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Jan 2022 09:40:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 7 Jan 2022 09:40:46 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <matthias.bgg@gmail.com>
CC: <airlied@linux.ie>, <chunkuang.hu@kernel.org>, <daniel@ffwll.ch>,
	<dri-devel@lists.freedesktop.org>, <jie.qiu@mediatek.com>,
	<junzhi.zhao@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<llvm@lists.linux.dev>, <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3] drm/mediatek: Fix unused-but-set variable warning
Date: Fri, 7 Jan 2022 09:40:46 +0800
Message-ID: <20220107014046.30492-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220102234633.31709-1-miles.chen@mediatek.com>
References: <20220102234633.31709-1-miles.chen@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

Hi Matthias,

>> I'm still not happy with the commit subject, I think it is misleading. Clang 
>> only helped to find the bug, but the we are fixing something else, that's not 
>> just a clang warning. But I don't want to nit-pick too much so:
>> 
>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> thanks. I think you are right.
> I will change the subject to "drm/mediatek: Fix mtk_cec_mask()", remove the 
> clang part and submit patch v4.

I posted patch v4 https://lore.kernel.org/linux-mediatek/20220103054706.8072-1-miles.chen@mediatek.com/
without your reviewed-by tag.

Would you mind taking a look at the patch?

Miles

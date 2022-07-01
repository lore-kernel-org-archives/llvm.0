Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4434410E9
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 02:27:35 +0000 (UTC)
X-UUID: 35726f30895b4b20a7553415274ad838-20220701
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:0943adc9-aca0-4ee7-a222-28265af42680,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:cde83e86-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:0,File:ni
	l,QS:nil,BEC:nil,COL:0
X-UUID: 35726f30895b4b20a7553415274ad838-20220701
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 923492784; Fri, 01 Jul 2022 10:27:23 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 1 Jul 2022 10:27:21 +0800
Received: from mszsdtcf10.gcn.mediatek.inc (10.16.4.60) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 1 Jul 2022 10:27:21 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <samitolvanen@google.com>
CC: <andrealmeid@igalia.com>, <atomlin@redhat.com>,
	<christophe.leroy@csgroup.eu>, <dmitry.torokhov@gmail.com>,
	<haibo.li@mediatek.com>, <jgross@suse.com>, <keescook@chromium.org>,
	<lecopzer.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<llvm@lists.linux.dev>, <matthias.bgg@gmail.com>, <mcgrof@kernel.org>,
	<mhiramat@kernel.org>, <nathan@kernel.org>, <ndesaulniers@google.com>,
	<peterz@infradead.org>, <xiaoming.yu@mediatek.com>, <yangtiezhu@loongson.cn>
Subject: Re: [PATCH 2/2] ANDROID: cfi: free old cfi shadow asynchronously
Date: Fri, 1 Jul 2022 10:27:20 +0800
Message-ID: <20220701022720.49999-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CABCJKudz5O5_-1q1H0o2DFRcnpMQDBPv4STUVa2bOE9ePaeyDA@mail.gmail.com>
References: <CABCJKudz5O5_-1q1H0o2DFRcnpMQDBPv4STUVa2bOE9ePaeyDA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N


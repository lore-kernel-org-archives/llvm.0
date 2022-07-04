Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ADA15A3
	for <llvm@lists.linux.dev>; Mon,  4 Jul 2022 01:41:00 +0000 (UTC)
X-UUID: 862a8d493bda47d2918fdc25cc8b89f1-20220704
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:9fc070c2-e751-4244-9a55-dc043afeaf29,OB:0,LO
	B:20,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,A
	CTION:release,TS:100
X-CID-INFO: VERSION:1.1.7,REQID:9fc070c2-e751-4244-9a55-dc043afeaf29,OB:0,LOB:
	20,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,A
	CTION:quarantine,TS:100
X-CID-META: VersionHash:87442a2,CLOUDID:11fb7dd6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:2a2041576cbe,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 862a8d493bda47d2918fdc25cc8b89f1-20220704
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 749548446; Mon, 04 Jul 2022 09:40:50 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 4 Jul 2022 09:40:48 +0800
Received: from mszsdtcf10.gcn.mediatek.inc (10.16.4.60) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 4 Jul 2022 09:40:48 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: Sami Tolvanen <samitolvanen@google.com>
CC: <xiaoming.yu@mediatek.com>, Kees Cook <keescook@chromium.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Peter Zijlstra
	<peterz@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, =?UTF-8?q?Andr=C3=A9=20Almeida?=
	<andrealmeid@igalia.com>, Luis Chamberlain <mcgrof@kernel.org>, Juergen Gross
	<jgross@suse.com>, Haibo Li <haibo.li@mediatek.com>, Tiezhu Yang
	<yangtiezhu@loongson.cn>, Aaron Tomlin <atomlin@redhat.com>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 0/2] cfi: free old cfi shadow asynchronously
Date: Mon, 4 Jul 2022 09:40:44 +0800
Message-ID: <20220704014046.34596-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

This patchset changes synchronize_rcu to call_rcu in update_shadow.

Patch 1 enables the CFI sanitization for cfi.c and 
bypass __cfi_slowpath_diag.
It is the prerequisite for using call_rcu in cfi.c.

Patch 2 changes synchronize_rcu to call_rcu and
free old cfi shadow in rcu cb

Changes in v2:
 - Remove _run_cfi_check,add __nocfi to __cfi_slowpath_diag directly
 - Rename _cfi_shadow_free_rcu to free_shadow

Haibo Li (2):
  cfi: enable sanitize for cfi.c
  cfi: free old cfi shadow asynchronously

 kernel/Makefile |  3 ---
 kernel/cfi.c    | 14 +++++++++++---
 2 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.25.1


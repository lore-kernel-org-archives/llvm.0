Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E6D3ACEE8;
	Mon,  6 Jul 2026 03:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783307925; cv=none; b=Cyh+sgTAsZS/aE0FnhJQDnylKJgnCd6YuTEWm/qzg9nK+Ex60qCFTUWvVqZo58TlDKiMFeZGG/fJj+o6mYA8dn0BUAbmrRP2ElIob4qZLAA+Xj/HlWy/OBfNfXDhKkyoW+3bPVVXYLegndEqZXiplgAWsVzfe9LdDaP9c6J9n1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783307925; c=relaxed/simple;
	bh=40ixRCEZTFWYVs2Yo4hM7xFHleu514OT2+i8DMge1mY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BgS59/lTTQWCfXnfZKMLsDt5Q47i2pqmojo9Puo+QK9ggmhLsLrhJXxytq0Bsk2GL1X6gouy4nzo/f5RyUbT6Qjf4dzmj3fW5meIsc9L/e34XdRsX80zvr7md1xhozx939I4huwBzYp29cEv4K5ctbj997WTKjiZDhBJBfB+V5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Sd4/JLog; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Sd4/JLog"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6663IbyvE128843, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1783307917; bh=+ULaIwdZ2hsy2OF/beB1qypgqqSSKUvyEe1y3pvbSPc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Sd4/JLogSIYk1CPkQqJHvXz+TNYmeZGuWH3G7cqqq7vyEPiPU3N13K3M6PqfOHmGo
	 NExmeUjxZ7FYZHsMjts2mU3tcsiXdvTfzLxFTj2d4e2Zf0VYKslHN5DilHs04d6JnD
	 lJyE6XmZPaiJjx+GKechiGjfgsnvpsORjpBShdKmlHt51acFmEeB802mrwpxn8XQ7c
	 QurJCY3NwSeRyY2npGJz1hpvqBLwXNjnDR6QUP8BUkIS5KAWQZ+sKjuLoeArPaey2m
	 XudcpPPZEw8rTFScJ4LYAVMe6mVK6C74i71LWk/CwPuKfOEn3NXS13CKos10hjboCO
	 RKTqZxpQA346Q==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6663IbyvE128843
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jul 2026 11:18:37 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 6 Jul 2026 11:18:37 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Mon, 6 Jul 2026 11:18:37 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: kernel test robot <lkp@intel.com>, DeanKu <ku920601@realtek.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: RE: drivers/net/wireless/realtek/rtw89/coex.c:7957:51: warning:
 overlapping comparisons always evaluate to true
Thread-Topic: drivers/net/wireless/realtek/rtw89/coex.c:7957:51: warning:
 overlapping comparisons always evaluate to true
Thread-Index: AQHdCya8oqz6FyY9mk+eniyHuOl4S7Zf1cIA
Date: Mon, 6 Jul 2026 03:18:37 +0000
Message-ID: <7ae6279570514de596f7939c93d7bb2a@realtek.com>
References: <202607032153.rVIyuBbI-lkp@intel.com>
In-Reply-To: <202607032153.rVIyuBbI-lkp@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

kernel test robot <lkp@intel.com> wrote:
>=20
> >> drivers/net/wireless/realtek/rtw89/coex.c:7957:51: warning: overlappin=
g comparisons always
> evaluate to true [-Wtautological-overlap-compare]
>     7957 |                 if (wl->role_info.link_mode !=3D BTC_WLINK_2G_=
MCC ||
>          |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~^~
>     7958 |                     wl->role_info.link_mode !=3D BTC_WLINK_25G=
_MCC ||
>          |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~

Fixed by v2 [1]. Thanks.=20

[1] https://lore.kernel.org/linux-wireless/20260706025445.18428-1-pkshih@re=
altek.com/T/#t



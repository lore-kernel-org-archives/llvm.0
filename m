Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5734B2AF1D
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 09:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786442088; cv=none; b=SRMR1VQ7Z1aQE4u5U5BNxEIKwqLSAn1bPAtwHYkRpTgzA1MJtwibpGSngnXLMhJjQR8hSha1KMYJsquuOb9HPLyDlUF1EzmHiqVZUvyJX4l8ObmPjdVgLM3Shci9yJocQJrx3lOKHcXCwrx+wTTTJNn3OV08rBDHBJrvAX2EWhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786442088; c=relaxed/simple;
	bh=uo/vQhlb8y5bwO3IrdLIPZDS9KrmctXPbz02Yc08Cro=;
	h=Mime-Version:Subject:From:To:CC:Message-ID:Date:Content-Type:
	 References; b=j+wuuazKCi0AA698D5wJImpJZ2TjxaVvHfnbebGiJw1RMM0htO4sLdnd2ug2nsYh/NG7lVuSYIa6uvHNgcUBjj25LqXE3gi3umthHZPB7sI6U8Ysz1S0pscV5bXDrXUqKAKnWm8EXMwgJi/DN4BwuY2EoSuYJbl4ie+GSLBLYwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QTJLqr4x; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QTJLqr4x"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260811095443epoutp04ce802dc55b05873e0ed861f0af50cd80~Kt5w-aHTa0351403514epoutp04K
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 09:54:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260811095443epoutp04ce802dc55b05873e0ed861f0af50cd80~Kt5w-aHTa0351403514epoutp04K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1786442083;
	bh=f7g/g32kJcsQBACBhpVlNkw7qk91UwNmsYCyqe4PR0g=;
	h=Subject:Reply-To:From:To:CC:Date:References:From;
	b=QTJLqr4xz5s2r9iJlNWfKu4SR4AeMc5WPryCtG7jRMWKWFl93lt6blyEBLUavTXEN
	 GXXfawUx3ftBoWVdjLr+Sq+R7Uuh+Hq0realiXp1AbXJrmsXzSZCq+gcQoDiOOaM4w
	 KPFZ4rrhFk0rDdqODMfFQ2nNMo8bQOmRo/H/Z8fU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260811095443epcas5p20d81d46c89f9f8e507c54b6fcf281087~Kt5wUN2eH2361623616epcas5p2J;
	Tue, 11 Aug 2026 09:54:43 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hK6RR16Wbz3hhTF; Tue, 11 Aug
	2026 09:54:43 +0000 (GMT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Subject: RE: [PATCH v2] arm: backtrace-clang: fix wrong sp usage for
 unwinding
Reply-To: maninder1.s@samsung.com
Sender: Maninder Singh <maninder1.s@samsung.com>
From: Maninder Singh <maninder1.s@samsung.com>
To: Nick Desaulniers <ndesaulniers@google.com>
CC: "ardb@kernel.org" <ardb@kernel.org>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "nathan@kernel.org" <nathan@kernel.org>,
	"nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>,
	"morbo@google.com" <morbo@google.com>, "justinstitt@google.com"
	<justinstitt@google.com>, Onkarnath <onkarnath.1@samsung.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, Rohit Thapliyal <r.thapliyal@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260811095443epcms5p238a0ccbc4e42db5355fb6f181ccaeafd@epcms5p2>
Date: Tue, 11 Aug 2026 15:24:43 +0530
X-CMS-MailID: 20260811095443epcms5p238a0ccbc4e42db5355fb6f181ccaeafd
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260805045522epcas5p39659721ef26a447b71e860c2990a60c0
References: <CGME20260805045522epcas5p39659721ef26a447b71e860c2990a60c0@epcms5p2>

Hi,

> Thanks for reviewing the patch, Actually I was not aware that ARM patches
> has to go through this way.
> Maybe that is the reason my last 2 bugfixes are also ignored from ARM side :)
> https://lkml.org/lkml/2026/4/27/265
> 
> So I was checking the way and created account there to submit the patch.
> I will post the patch to suggested site today for further checking.
> https://www.arm.linux.org.uk/developer/patches/

uploaded:
9490/1 	backtrace-clang: fix wrong sp usage for unwinding

https://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=9490/1

Thanks,
Maninder Singh

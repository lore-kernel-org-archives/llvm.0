Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61619175A9E
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 12:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773836199; cv=none; b=Quxvh6HFA74uvmmKFRBpJ2eoThA06qJxoOnfbY7sDiHQjLjOPn9eYTMJpkh/DxvBCZWTT1aZtZU1zcxvWUXrCaYLJzpDgAZyLnGIkQAD/ccDc/96yiQaez+InftRL06zkWC+xP0Wtp58vlG5RVaz5eVIVi/+kliqAWN/F7sJtFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773836199; c=relaxed/simple;
	bh=TuP4/cPm0qZZyyQWMHpS3BG08uESJQQ8U9i9UhPkGiw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=azJ44JZ5B+7Ic8erNazejJmO92vzhMzbMJZFkEF61GBi2zmP8xrIGh1NCez08k+cC/wi9hG0WPYNZHyuGzmDNsqBvDfatu2kcGjQrUvsjtnxikw7U7V+v5Uxke1fckybqrG5bbdxOYpFD1Z3K+GvzdK6EiF0+KP2XFLBGkoMcic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Ufi4+BR9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VBu9+VSM; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Ufi4+BR9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VBu9+VSM"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8BB6A140018A;
	Wed, 18 Mar 2026 08:16:36 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 08:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773836196;
	 x=1773922596; bh=ftWj48LxStIGIyTYBzrKDf0B99ZDSmwvLH1iX54TQug=; b=
	Ufi4+BR9RQCnhTRgi23P8nk6lMJCCbaOetyTyNR4rVeCjEcEEoxh2ZmFne5Z6zls
	jrlM6QgTRveAF5aYkkN336SKXqDlwJ0Pd9wjNB9ekUINyyomgrW2EJx/vFy5qhNr
	HL42TdUwganSPuM+XZqhQpGFZdXZ8hteEzO+eJEiEXcj5CB6kJ3iKShrxXZqg3Ob
	5YOMkvLsW+ZTIzFZgnYBQhX5otpu027OH30q44tGlk0sQYMiojtemFI+G3udeHuq
	eWbbvbPZT4X24l/CGC7GVrMrdwLBm0cbiuDKdlhEMwrnSylpF2s+PBbHAhS0oov0
	DpViAjdE1LEJ8s7QU49MAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773836196; x=
	1773922596; bh=ftWj48LxStIGIyTYBzrKDf0B99ZDSmwvLH1iX54TQug=; b=V
	Bu9+VSMsFi/+e3mpKQ1brPmE8sRVoyE/OSpj0wEKuzPNUaGK7dTrY9kVIotkJXZz
	IZdc5RKyKWck1CfeoXKYLE4RdHYtMc+XYu9QD3QLkXw5J1qRryXh9eo/y2hMB178
	AqQJuv6BGxsgkHSjCqTaKDN/OThiw9vuRjMtlkNc43wN4GJl2lsDFvlwY1JuIwnt
	JM//NWQaiQeyNf2j34gTXkNZCJHP6nb7pQ8tuzkYiBH15fqnu8qpFovIJ9C3B+nj
	6DGXFLfZf8nLxA/NRXS1XQ1sjJDBG5E1O9D4/0EBwuMNuoa8Y05NX7HM3Kmm3Cwo
	/P1ROtU7Ad5O1FaLYpf/A==
X-ME-Sender: <xms:o5e6aa-pI_uLNGqg5EMJpMnazpxBe2YOabrmwbmWTLLDlMfwqDnz0A>
    <xme:o5e6aVhNhQNkFkd3zpFcse3SxGLwdnRQkLf79TARfFsERrJjzwve82ZiAO69OIJBJ
    a6sKS2HMf3UzbgTuRc0uojDUpCr1-eBgVlakSyITNebY15xHhVwhg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegudduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehnihgtkhdruggvshgruhhlnhhivghrshdolhhkmhhlsehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepjhhushhtihhnshhtihhtthesghhoohhglhgvrdgtohhm
    pdhrtghpthhtohepmhhorhgsohesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprghrnh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpth
    htohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifigrihesshhushgv
    rdgtohhmpdhrtghpthhtohepthhifigrihesshhushgvrdguvg
X-ME-Proxy: <xmx:o5e6abHZXFrKsbcnIoCcAcigxGNdEUmW2ioB_d5VEx7VAiDxoeB8UQ>
    <xmx:o5e6aUIhe8-mmvQ8DSz2qi-8-6HuPKxn871UVEnlwMQdG7aKvyQ69A>
    <xmx:o5e6aYiud6Q5S83rfsxI4ct7BzPAVdzVcYw6heUABZvyhFmwxKEz0Q>
    <xmx:o5e6aSm90ZWrMu0ADB9ffPDAD8qqQwdSeBJ2LAP9oXeiFgMP77NaOg>
    <xmx:pJe6aaKHWLy-sbWoojqkusXUmwC79GgopJzrIPlShbf39ToMroMr83on>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9B894700065; Wed, 18 Mar 2026 08:16:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AaL53sJK8WL3
Date: Wed, 18 Mar 2026 13:16:14 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Takashi Iwai" <tiwai@suse.de>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Message-Id: <74923a6e-fdce-4f15-b345-55fddcc4c7c2@app.fastmail.com>
In-Reply-To: <87eclhcpzo.wl-tiwai@suse.de>
References: <20260318105017.1934798-1-arnd@kernel.org>
 <87eclhcpzo.wl-tiwai@suse.de>
Subject: Re: [PATCH] ALSA: asihpi: avoid write overflow check warning
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Mar 18, 2026, at 12:54, Takashi Iwai wrote:
> On Wed, 18 Mar 2026 11:50:08 +0100,

>> +	memcpy(&rESP_HPI_ADAPTER_OPEN[adapter].h, &hr,
>> +		sizeof(rESP_HPI_ADAPTER_OPEN[adapter].h));
>> +	memcpy(&rESP_HPI_ADAPTER_OPEN[adapter].a, &hr.u.s,
>> +		sizeof(rESP_HPI_ADAPTER_OPEN[adapter].a));
>
> I think the last one is still a bit confusing as if doing an overflow
> copy again: hr.u.s is struct hpi_subsys_res which is smaller than
> rESP_HPI_ADAPTER_OPEN[adapter].a which is struct hpi_adapter_res.

Right, I got confused by the various similarly named types
again.

> If any, the last one should be
>
> 	memcpy(&rESP_HPI_ADAPTER_OPEN[adapter].a, &hr.u.ax.info,
> 		sizeof(rESP_HPI_ADAPTER_OPEN[adapter].a));
>
> Or it could be even
>
> 	rESP_HPI_ADAPTER_OPEN[adapter].a = hr.u.ax.info;
>
> (I'm not sure which one can be a better result, though.)

Code generation wise, I would expect them to be the same,
as gcc is good at transforming the memcpy() calls into
direct copies and vice versa.

I'll send a v2 with the first one after it passes build tests,
unless someone has another preference.

      Arnd

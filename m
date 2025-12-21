Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1889731CA54
	for <llvm@lists.linux.dev>; Sun, 21 Dec 2025 20:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766348382; cv=none; b=Y13rVdOIfhxks2DsRijmH+NP7FV7nnKMLMiMQ804it/nAlPTjAs7EVU1Qawi1wYJDAv9RsnAKj55XMHgwkTLU41p+MPZaSF601jbge2uPCjViM9QhCM0umqbkCVU2YXOyK0HEv9LmP63I1+Pgw0lKyLzlb6IIozOthWV5LNq4Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766348382; c=relaxed/simple;
	bh=SUD2o/5PO6a+91TnZRGi4RAtZk3j2WXrV/Qkc9m181A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=akopS83XbysRlMKUG1LuKcfHnYYtHhK4wqepB05yNPqpTr4ie5XF+MeXAG3PgUcZTmD31zuzDhdvyLjiYYCKrnSKlfEVA/bcF0NeN5C02rHoYkKbx3t6rcfqRwpdDVshA6XMCQ7GyeSZJIhS6wqF9ThOGf+q3htQtbnA6AdsUl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=am+9SWqD; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="am+9SWqD"
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 037DB5800E3
	for <llvm@lists.linux.dev>; Sun, 21 Dec 2025 20:19:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30D174442F;
	Sun, 21 Dec 2025 20:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1766348371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKkFrAU2/4GGlOZgXpNDP3sYOyiTxO9Nj1AiY9NSJWE=;
	b=am+9SWqD9FVW9PIR98tVwo/I4QJ+uz30e/XXVUXKHYHR3bFkToSS33pueMAzBkf+pbE2HF
	R2LxGjPlkTo0zttvPGkb6PonM6WEZWJ9BDYANdlz1LHygNXse0RYSIf5TmY6HVo2efC1+P
	Ttvgh2EvXTSeAnQWPk5TAIdKRsKQLmYgSeUmsEhEHItdGUyJLM644Cz9eJPl8tsMJFaXc4
	44L7reDCfIxhKx23zWs/lzs8IEX/1W9KI6QYJqx0uQ0TKBofOutAN3cWgf+AZyLXQU4eRG
	o4rosdWAWiWzEBhCu0SwFS8FKSuudK4Nug1VYiD6nNB3ZbJXXyVWjFtRW2Mc3g==
Message-ID: <3241bbcb-d9c1-49bd-b8a7-610543dfb454@gtucker.io>
Date: Sun, 21 Dec 2025 21:19:27 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] scripts: add tool to run containerized builds
To: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 David Gow <davidgow@google.com>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
 llvm@lists.linux.dev
References: <cover.1766061692.git.gtucker@gtucker.io>
 <35b951506304b141047812f516fa946a4f1549a1.1766061692.git.gtucker@gtucker.io>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <35b951506304b141047812f516fa946a4f1549a1.1766061692.git.gtucker@gtucker.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehhedttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepjeefkeevheekhfefleeuiefffedvgfdtkeejgeelgeelgeekuedtgfetkedugeegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepudejiedrudeghedrkedurddvuddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejiedrudeghedrkedurddvuddupdhhvghloheplgduledvrdduieekrdduleekrdeigegnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupeeftdffudejgeeggedvhfdpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiughgohifsehgohhoghhlvgdrtghomhdprhgtphhtthhopeifohhrkhesohhnuhhrohiikhgrnhdruggvvhdprhgtp
 hhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-State: clean
X-GND-Score: -100

Hi Nathan,

On 18/12/2025 1:49 pm, Guillaume Tucker wrote:
> +if __name__ == '__main__':
> +    parser = argparse.ArgumentParser(
> +        'container',
> +        description="Containerized builds.  See the dev-tools/container "
> +        "kernel documentation section for more details."
> +    )

Another piece of feedback from your v1 review was to add a link to
the documentation.  As it's not published yet I just mentioned the
section name here in the v2 - but I can anticipate what the final URL
will be i.e.:

     https://www.kernel.org/doc/html/latest/dev-tools/container

So I'll tweak this as well in the v3 unless anyone suggests
otherwise.

Cheers,
Guillaume




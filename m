Received: from smtprelay.hostedemail.com (smtprelay0206.hostedemail.com [216.40.44.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1749672
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 10:26:22 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave04.hostedemail.com (Postfix) with ESMTP id E07D61817A4C2
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 10:10:23 +0000 (UTC)
Received: from omf13.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay07.hostedemail.com (Postfix) with ESMTP id C3336184AAAA2;
	Mon, 29 Nov 2021 10:10:16 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf13.hostedemail.com (Postfix) with ESMTPA id 8B57F200052A;
	Mon, 29 Nov 2021 10:10:08 +0000 (UTC)
Message-ID: <a22c082a661df0b548511f282fcc519a11bb3340.camel@perches.com>
Subject: Re: [PATCH v2 09/20] media: si470x: fix printk warnings with clang
From: Joe Perches <joe@perches.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com, Hans Verkuil
 <hverkuil@xs4all.nl>, Kees Cook <keescook@chromium.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, llvm@lists.linux.dev
Date: Mon, 29 Nov 2021 02:10:14 -0800
In-Reply-To: <442df11dd08158df88e95a457175a65f20dc8369.1638179135.git.mchehab+huawei@kernel.org>
References: <cover.1638179135.git.mchehab+huawei@kernel.org>
	 <442df11dd08158df88e95a457175a65f20dc8369.1638179135.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.60
X-Stat-Signature: mirpimwbnqro13sr9bkhcgcm35ah8wdi
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 8B57F200052A
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX191CtHozPREJeEXS5EE+p9wMyt++DJjFiw=
X-HE-Tag: 1638180608-885365

On Mon, 2021-11-29 at 10:47 +0100, Mauro Carvalho Chehab wrote:
> Clang doesn't like "%hu" on macros:
> 
> 	drivers/media/radio/si470x/radio-si470x-i2c.c:414:4: error: format specifies type 'unsigned short' but the argument has type 'int' [-Werror,-Wformat]
> 	drivers/media/radio/si470x/radio-si470x-i2c.c:417:4: error: format specifies type 'unsigned short' but the argument has type 'int' [-Werror,-Wformat]
> 
> Besides that, changeset cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use of unnecessary %h[xudi] and %hh[xudi]")
> dropped recomendation of using %h.
> 
> So, just replace them with "%u".

And perhaps change these to single dev_warn calls instead of multiple calls.

> diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
[]
> @@ -410,10 +410,10 @@ static int si470x_i2c_probe(struct i2c_client *client)
>  			radio->registers[DEVICEID], radio->registers[SI_CHIPID]);
>  	if ((radio->registers[SI_CHIPID] & SI_CHIPID_FIRMWARE) < RADIO_FW_VERSION) {
>  		dev_warn(&client->dev,
> -			"This driver is known to work with firmware version %hu,\n",
> +			"This driver is known to work with firmware version %u,\n",
>  			RADIO_FW_VERSION);
>  		dev_warn(&client->dev,
> -			"but the device has firmware version %hu.\n",
> +			"but the device has firmware version %u.\n",
>  			radio->registers[SI_CHIPID] & SI_CHIPID_FIRMWARE);

		dev_warn(&client->dev,
			"This driver is known to work with firmware version %u, but the device has firmware version %u\n",
			RADIO_FW_VERSION, radio->registers[SI_CHIPID] & SI_CHIPID_FIRMWARE);

etc...



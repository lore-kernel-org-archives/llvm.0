Received: from bumble.maple.relay.mailchannels.net (bumble.maple.relay.mailchannels.net [23.83.214.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAF7A480;
	Tue,  8 Nov 2022 21:42:23 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 20145141E93;
	Tue,  8 Nov 2022 21:42:16 +0000 (UTC)
Received: from pdx1-sub0-mail-a278.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 991CD142230;
	Tue,  8 Nov 2022 21:42:15 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1667943735; a=rsa-sha256;
	cv=none;
	b=NDEf6Sm6uj+QUAc5TtcrKx2JM21AagyqulzSsfI8TDzfH1xepGiU0STspU17Up0oFtYVJl
	n5SEpY3iGwNAqU96pf3Mz0NP1XCzIHIYlUyXGcmmjmbg3qt4Lt/9l/NPqlVy7rwGcal1Kr
	0Quj8PwsQRDp3A+wbBAOgLfUFM+oE2ooU7vbRqM8zuye+i91OXonmcsrMCIzvYRGZ1w7i+
	wdtEw9nGSGfNp7NgBjet/qzKEBEIVvNgFylfiWY2gzD632qRXyCd6uyjUAHbmZ3lzHi/OK
	rNlf8lgDmjO5V95GugC8M5QS5+a4Vx+LoBQYs1zZxW4kvVGAk+OYK4kNVmVR2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1667943735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=96yKzRXOxdjWrt2ruqjpGusLF99OXMY8qDSEUlEnPus=;
	b=Y8YyHPK7cFDnoffxKCWdjSOAzf1chxLCMs2+IJGpzNByAPaiC3ajK1WzL4bUg37v9cST+2
	rkFwKlA8QbskYUQpyCqKAUITvnmkf/fEYAn4YZyqLy0C9n/doXhfGmC5Vk+q0fEZgFZMJf
	M2laPYJxeJ/GPMh6tnftMaQGWu1qSk//aFs9QCOpzBT8yAdr27T8U6H6YuEKcg/rPgrZT3
	J698F4t/9OGsT9S3OAmlflLiB6sOTqn31y+g9Fb7wk4u/gxZtMQHDeWA2hI9eLr7ziu4sc
	EWtHfndzTOCtsX01FoR7uzymHzykO0RawEKtbuug35VV93RSouwjiws8ACdm+g==
ARC-Authentication-Results: i=1;
	rspamd-5cb65d95c4-sqctg;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Lyrical-Industry: 1e22247a5662bde6_1667943735873_3109770352
X-MC-Loop-Signature: 1667943735873:3664440235
X-MC-Ingress-Time: 1667943735873
Received: from pdx1-sub0-mail-a278.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.138.17 (trex/6.7.1);
	Tue, 08 Nov 2022 21:42:15 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a278.dreamhost.com (Postfix) with ESMTPSA id 4N6M531Gyqz21;
	Tue,  8 Nov 2022 13:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1667943735;
	bh=96yKzRXOxdjWrt2ruqjpGusLF99OXMY8qDSEUlEnPus=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=KJuAT6cokX0Q7rnxXKHj3jUep1BmWwzd2m9AE+6GnkdlptrwMfnpDJnYvJHMVZixf
	 Zwz6sEQGKVanHOmje/1yV3d9W5tcl7TW/DykHCfswMXEVhGyRvwhheBGQZjS6w2zWl
	 tDtG0D0BtvoaWm8rTag4/Kl3/PX2jyfnbdO6bgGnTY9fkplL47ypfviIqXWsEmu9DS
	 DobZK76ocF98mvfZzYbIYIM060TvcGQZLOdppLo+7DZOGgw9S3gViLzsD5pHkGR/VS
	 3mZRhKP+RukoB6pOGbmvDBD64nbQzbUYRufwfzj7F4k53b02umVMZ+0H1XyZc/r8c5
	 qgXKLK7oY7D6Q==
Date: Tue, 8 Nov 2022 13:19:50 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: include/linux/memregion.h:56:2: error: call to undeclared
 function 'WARN_ON_ONCE'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <20221108211950.tw5ntii65vlccm7v@offworld>
References: <202211090531.qCxpHA7W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <202211090531.qCxpHA7W-lkp@intel.com>
User-Agent: NeoMutt/20220429

fyi I had addressed these 0days reports here:

https://lore.kernel.org/all/20221013001451.6c6fo6sqzmaonu45@offworld/

    - set_memory.c includes memregion.h (0day)
    - memregion includes linux/bug.h (for WARN_ON_ONCE) and make
      cpu_cache_invalidate_memregion() stub static inline . (0day)

Dan do you want me to send out a final(?) patch based on v5 you sent out?

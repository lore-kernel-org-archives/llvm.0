Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3940F33E0
	for <llvm@lists.linux.dev>; Thu,  5 May 2022 20:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=G+j0q72Mrx0x/OKxPueCOmNWOMddqEQljKb1F6TvYgA=;
	t=1651781675; x=1652991275; b=R6B/VQ7JoH5Zv/eII176ugp7bzhfM19Qhroy/HX/gcNjsrl
	QhOqzXwuBsBHtnKgHh3h3w6Oi8fOtBMcEqA3eFDs2Rhbc+RmtPahHeBAaWr+j70n1wJaqsyb0BT8c
	eeIUeyJfeKWCeBSHhsGtUwh5rpFbsAZXrXx7Q1W70W1ZvJ8xY0d0i2kxXHtprgWxnXm7lqBhQjgP0
	xJ0LrC7rbyCq93TSkVZn4ihB26CMf9xdAAPGrEAk+sGmHoOK9LU8Ruq5nopfnyAQn53+jMaCNiHwK
	3ttpfSID3LNNRJTRoS2W4Jc3P5WQkISFqyruyKY3OKqlAln9SM9WdBdNDsmjrn8w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	(envelope-from <johannes@sipsolutions.net>)
	id 1nmhqM-002xoD-SS;
	Thu, 05 May 2022 22:12:59 +0200
Message-ID: <e1ea4926f105b456f6a86ce30a0380ee5f48fe6d.camel@sipsolutions.net>
Subject: Re: [PATCH 02/32] Introduce flexible array struct memcpy() helpers
From: Johannes Berg <johannes@sipsolutions.net>
To: Keith Packard <keithp@keithp.com>, Kees Cook <keescook@chromium.org>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>, Francis Laniel
 <laniel_francis@privacyrequired.com>, Daniel Axtens <dja@axtens.net>, Dan
 Williams <dan.j.williams@intel.com>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Guenter Roeck <linux@roeck-us.net>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, Tadeusz Struk <tadeusz.struk@linaro.org>,
 Alexei Starovoitov <ast@kernel.org>,  alsa-devel@alsa-project.org, Al Viro
 <viro@zeniv.linux.org.uk>, Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Andrew Morton <akpm@linux-foundation.org>,  Andy Gross <agross@kernel.org>,
 Andy Lavr <andy.lavr@gmail.com>, Arend van Spriel <aspriel@gmail.com>, 
 Baowen Zheng <baowen.zheng@corigine.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Bradley Grove <linuxdrivers@attotech.com>, 
 brcm80211-dev-list.pdl@broadcom.com, Christian Brauner
 <brauner@kernel.org>,  Christian =?ISO-8859-1?Q?G=F6ttsche?=
 <cgzones@googlemail.com>, Christian Lamparter <chunkeey@googlemail.com>, 
 Chris Zankel <chris@zankel.net>, Cong Wang <cong.wang@bytedance.com>, David
 Gow <davidgow@google.com>,  David Howells <dhowells@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, Dennis Dalessandro
 <dennis.dalessandro@cornelisnetworks.com>, devicetree@vger.kernel.org, 
 Dexuan Cui <decui@microsoft.com>, Dmitry Kasatkin
 <dmitry.kasatkin@gmail.com>, Eli Cohen <elic@nvidia.com>,  Eric Dumazet
 <edumazet@google.com>, Eric Paris <eparis@parisplace.org>, Eugeniu Rosca
 <erosca@de.adit-jv.com>,  Felipe Balbi <balbi@kernel.org>, Frank Rowand
 <frowand.list@gmail.com>, Franky Lin <franky.lin@broadcom.com>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Gregory Greenman
 <gregory.greenman@intel.com>, Haiyang Zhang <haiyangz@microsoft.com>, Hante
 Meuleman <hante.meuleman@broadcom.com>,  Herbert Xu
 <herbert@gondor.apana.org.au>, Hulk Robot <hulkci@huawei.com>, Jakub
 Kicinski <kuba@kernel.org>,  "James E.J. Bottomley" <jejb@linux.ibm.com>,
 James Morris <jmorris@namei.org>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>, Jens
 Axboe <axboe@kernel.dk>, Johan Hedberg <johan.hedberg@gmail.com>, John
 Keeping <john@metanate.com>, Juergen Gross <jgross@suse.com>, Kalle Valo
 <kvalo@kernel.org>, keyrings@vger.kernel.org,  kunit-dev@googlegroups.com,
 Kuniyuki Iwashima <kuniyu@amazon.co.jp>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Lars-Peter Clausen <lars@metafoo.de>, Lee Jones
 <lee.jones@linaro.org>,  Leon Romanovsky <leon@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>,  linux1394-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,  linux-bluetooth@vger.kernel.org,
 linux-hardening@vger.kernel.org,  linux-hyperv@vger.kernel.org,
 linux-integrity@vger.kernel.org,  linux-rdma@vger.kernel.org,
 linux-scsi@vger.kernel.org,  linux-security-module@vger.kernel.org,
 linux-usb@vger.kernel.org,  linux-wireless@vger.kernel.org,
 linux-xtensa@linux-xtensa.org,  llvm@lists.linux.dev, Loic Poulain
 <loic.poulain@linaro.org>, Louis Peens <louis.peens@corigine.com>, Luca
 Coelho <luciano.coelho@intel.com>, Luiz Augusto von Dentz
 <luiz.dentz@gmail.com>, Marc Dionne <marc.dionne@auristor.com>, Marcel
 Holtmann <marcel@holtmann.org>,  Mark Brown <broonie@kernel.org>, "Martin
 K. Petersen" <martin.petersen@oracle.com>, Max Filippov
 <jcmvbkbc@gmail.com>, Mimi Zohar <zohar@linux.ibm.com>, Muchun Song
 <songmuchun@bytedance.com>, Nathan Chancellor <nathan@kernel.org>, 
 netdev@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Paolo Abeni
 <pabeni@redhat.com>, Paul Moore <paul@paul-moore.com>, Rich Felker
 <dalias@aerifal.cx>, Rob Herring <robh+dt@kernel.org>, Russell King
 <linux@armlinux.org.uk>,  selinux@vger.kernel.org, "Serge E. Hallyn"
 <serge@hallyn.com>,  SHA-cyfmac-dev-list@infineon.com, Simon Horman
 <simon.horman@corigine.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, Steffen Klassert
 <steffen.klassert@secunet.com>, Stephen Hemminger <sthemmin@microsoft.com>,
  Stephen Smalley <stephen.smalley.work@gmail.com>, Takashi Iwai
 <tiwai@suse.com>, Tom Rix <trix@redhat.com>,  Udipto Goswami
 <quic_ugoswami@quicinc.com>, wcn36xx@lists.infradead.org, Wei Liu
 <wei.liu@kernel.org>,  xen-devel@lists.xenproject.org, Xiu Jianfeng
 <xiujianfeng@huawei.com>, Yang Yingliang <yangyingliang@huawei.com>
Date: Thu, 05 May 2022 22:12:53 +0200
In-Reply-To: <87pmkrpwrs.fsf@keithp.com>
References: <20220504014440.3697851-1-keescook@chromium.org>
	 <20220504014440.3697851-3-keescook@chromium.org>
	 <d3b73d80f66325fdfaf2d1f00ea97ab3db03146a.camel@sipsolutions.net>
	 <202205040819.DEA70BD@keescook>
	 <970a674df04271b5fd1971b495c6b11a996c20c2.camel@sipsolutions.net>
	 <871qx8qabo.fsf@keithp.com> <202205051228.4D5B8CD624@keescook>
	 <87pmkrpwrs.fsf@keithp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned

On Thu, 2022-05-05 at 13:08 -0700, Keith Packard wrote:


> I bet you've already considered the simpler form:
> 
>         struct something *instance = mem_to_flex_dup(byte_array, count, GFP_KERNEL);
>         if (IS_ERR(instance))
>             return PTR_ERR(instance);
> 

Sadly, this doesn't work in any way because mem_to_flex_dup() needs to
know at least the type, hence passing 'instance', which is simpler than
passing 'struct something'.

johannes

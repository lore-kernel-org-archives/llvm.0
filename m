Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08212101
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 07:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=VhRMkWupHGEpu4hR7M12B8TWP/ZW0H0fx/g6wrBtOIU=;
	t=1651649412; x=1652859012; b=lUHofNdWbBHvEM/m6RdFL9NapdPjh94JwVCL/gCIAlMLCMK
	aS340lipbu4K8OqmzXiTugJioDNFFM9S19juqiqnJLkI1XBU7ftKhUkZdNwyxIZbMk56dp6CIHxaT
	OvO0sECVVH+5eiu5vVrXrI/Rm6mCCWLMBfpeL7EmLV9UAB02o0ZXT+TJwqktrYlQviyV7jL9LEElY
	P6WMld2rqVRA5TFQ+PkYXTqQ0W6zMimSffJ7LIN+5NaUz4Q/E7hLFvX3uDAlxJFBd4QfjwJL84FDy
	RB3/b9C/dgE3W6UZVrGRrHW1HsJvYc4MztjJLs+LBXOoeh8SuX0LaCsO/wQeBjKA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	(envelope-from <johannes@sipsolutions.net>)
	id 1nm9RJ-001wsH-EM;
	Wed, 04 May 2022 09:28:49 +0200
Message-ID: <c31c1752cf6393319f5c7abd178ef43e0fbec5c1.camel@sipsolutions.net>
Subject: Re: [PATCH 12/32] cfg80211: Use mem_to_flex_dup() with struct
 cfg80211_bss_ies
From: Johannes Berg <johannes@sipsolutions.net>
To: Kees Cook <keescook@chromium.org>, "Gustavo A . R . Silva"
	 <gustavoars@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>, Eric Dumazet
 <edumazet@google.com>, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
 alsa-devel@alsa-project.org, Al Viro <viro@zeniv.linux.org.uk>, Andrew
 Gabbasov <andrew_gabbasov@mentor.com>, Andrew Morton
 <akpm@linux-foundation.org>,  Andy Gross <agross@kernel.org>, Andy Lavr
 <andy.lavr@gmail.com>, Arend van Spriel <aspriel@gmail.com>,  Baowen Zheng
 <baowen.zheng@corigine.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Bradley Grove
 <linuxdrivers@attotech.com>,  brcm80211-dev-list.pdl@broadcom.com,
 Christian Brauner <brauner@kernel.org>,  Christian
 =?ISO-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>, Christian Lamparter
 <chunkeey@googlemail.com>,  Chris Zankel <chris@zankel.net>, Cong Wang
 <cong.wang@bytedance.com>, Daniel Axtens <dja@axtens.net>,  Daniel Vetter
 <daniel.vetter@ffwll.ch>, Dan Williams <dan.j.williams@intel.com>, David
 Gow <davidgow@google.com>,  David Howells <dhowells@redhat.com>, Dennis
 Dalessandro <dennis.dalessandro@cornelisnetworks.com>, 
 devicetree@vger.kernel.org, Dexuan Cui <decui@microsoft.com>, Dmitry
 Kasatkin <dmitry.kasatkin@gmail.com>, Eli Cohen <elic@nvidia.com>, Eric
 Paris <eparis@parisplace.org>, Eugeniu Rosca <erosca@de.adit-jv.com>,
 Felipe Balbi <balbi@kernel.org>, Francis Laniel
 <laniel_francis@privacyrequired.com>,  Frank Rowand
 <frowand.list@gmail.com>, Franky Lin <franky.lin@broadcom.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Gregory Greenman
 <gregory.greenman@intel.com>,  Guenter Roeck <linux@roeck-us.net>, Haiyang
 Zhang <haiyangz@microsoft.com>, Hante Meuleman
 <hante.meuleman@broadcom.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
 Hulk Robot <hulkci@huawei.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, James Morris <jmorris@namei.org>, Jarkko Sakkinen
 <jarkko@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe
 <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,  Johan Hedberg
 <johan.hedberg@gmail.com>, John Keeping <john@metanate.com>, Juergen Gross
 <jgross@suse.com>,  Kalle Valo <kvalo@kernel.org>, Keith Packard
 <keithp@keithp.com>, keyrings@vger.kernel.org,  kunit-dev@googlegroups.com,
 Kuniyuki Iwashima <kuniyu@amazon.co.jp>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Lars-Peter Clausen <lars@metafoo.de>, Lee Jones
 <lee.jones@linaro.org>,  Leon Romanovsky <leon@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>,  linux1394-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,  linux-bluetooth@vger.kernel.org,
 linux-hardening@vger.kernel.org,  linux-hyperv@vger.kernel.org,
 linux-integrity@vger.kernel.org,  linux-rdma@vger.kernel.org,
 linux-scsi@vger.kernel.org,  linux-security-module@vger.kernel.org,
 linux-usb@vger.kernel.org,  linux-xtensa@linux-xtensa.org,
 llvm@lists.linux.dev, Loic Poulain <loic.poulain@linaro.org>, Louis Peens
 <louis.peens@corigine.com>, Luca Coelho <luciano.coelho@intel.com>, Luiz
 Augusto von Dentz <luiz.dentz@gmail.com>,  Marc Dionne
 <marc.dionne@auristor.com>, Marcel Holtmann <marcel@holtmann.org>, Mark
 Brown <broonie@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Max Filippov <jcmvbkbc@gmail.com>, Mimi Zohar
 <zohar@linux.ibm.com>, Muchun Song <songmuchun@bytedance.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Paul Moore
 <paul@paul-moore.com>, Rich Felker <dalias@aerifal.cx>, Rob Herring
 <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 selinux@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>, 
 SHA-cyfmac-dev-list@infineon.com, Simon Horman <simon.horman@corigine.com>,
  Stefano Stabellini <sstabellini@kernel.org>, Stefan Richter
 <stefanr@s5r6.in-berlin.de>, Steffen Klassert
 <steffen.klassert@secunet.com>, Stephen Hemminger <sthemmin@microsoft.com>,
  Stephen Smalley <stephen.smalley.work@gmail.com>, Tadeusz Struk
 <tadeusz.struk@linaro.org>, Takashi Iwai <tiwai@suse.com>, Tom Rix
 <trix@redhat.com>, Udipto Goswami <quic_ugoswami@quicinc.com>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>,  wcn36xx@lists.infradead.org, Wei Liu
 <wei.liu@kernel.org>,  xen-devel@lists.xenproject.org, Xiu Jianfeng
 <xiujianfeng@huawei.com>, Yang Yingliang <yangyingliang@huawei.com>
Date: Wed, 04 May 2022 09:28:46 +0200
In-Reply-To: <20220504014440.3697851-13-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
	 <20220504014440.3697851-13-keescook@chromium.org>
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

On Tue, 2022-05-03 at 18:44 -0700, Kees Cook wrote:
> 
> @@ -2277,7 +2274,7 @@ cfg80211_update_notlisted_nontrans(struct wiphy *wiphy,
>  	size_t ielen = len - offsetof(struct ieee80211_mgmt,
>  				      u.probe_resp.variable);
>  	size_t new_ie_len;
> -	struct cfg80211_bss_ies *new_ies;
> +	struct cfg80211_bss_ies *new_ies = NULL;
>  	const struct cfg80211_bss_ies *old;
>  	u8 cpy_len;
>  
> @@ -2314,8 +2311,7 @@ cfg80211_update_notlisted_nontrans(struct wiphy *wiphy,
>  	if (!new_ie)
>  		return;
>  
> -	new_ies = kzalloc(sizeof(*new_ies) + new_ie_len, GFP_ATOMIC);
> -	if (!new_ies)
> +	if (mem_to_flex_dup(&new_ies, new_ie, new_ie_len, GFP_ATOMIC))
>  		goto out_free;
>  
>  	pos = new_ie;
> @@ -2333,10 +2329,8 @@ cfg80211_update_notlisted_nontrans(struct wiphy *wiphy,
>  	memcpy(pos, mbssid + cpy_len, ((ie + ielen) - (mbssid + cpy_len)));
>  
>  	/* update ie */
> -	new_ies->len = new_ie_len;
>  	new_ies->tsf = le64_to_cpu(mgmt->u.probe_resp.timestamp);
>  	new_ies->from_beacon = ieee80211_is_beacon(mgmt->frame_control);
> -	memcpy(new_ies->data, new_ie, new_ie_len);

This introduces a bug, "new_ie" is modified between the kzalloc() and
the memcpy(), but you've moved the memcpy() into the allocation. In
fact, new_ie is completely freshly kzalloc()'ed at this point. So you
need to change the ordering here, but since new_ie is freed pretty much
immediately, we can probably just build the stuff directly inside
new_ies->data, though then of course we cannot use your helper anymore?

johannes
